Return-Path: <linux-arm-msm+bounces-113819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3GIRLXzlNGo4jgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:45:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD496A428A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kYQmekwn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I9IBjaa6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113819-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113819-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 988B0300B8DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 06:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3773423BD05;
	Fri, 19 Jun 2026 06:45:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43E332610
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781851511; cv=none; b=eQJwM5m3DubTTP8gPYmWSBbZpDEcN99gceNzgD9Pth7UGSQ0zKRjhUJoJAGJEpVYNCus0sgSUEPIdMriodNjEOoK0alPDuIykv2mjfVm6y1kwakzFeIB+PHedyb7cO6t/H7RtYAADnY4pXZQiL40DqCNN0DKkvDt581eWjDXAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781851511; c=relaxed/simple;
	bh=Hckp7srdJ2LRcrqr9h2hUZOxxARFEJYif+BcJ1ig0xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSHEZdQ/oId9xlmoq1Zt8nCPqKGvOO68wsviervblkidJ0prJa8JzZa+pqhhw+YTyspQocwQbfzLoujWouF6A0s1L+nEpyvYDeV/UhF2WZk9yGLFVN5ZJtZ5gElV9QBG9Knw3sTDSJIzhS8AFqg99eJcJZmWt4Pnn4nqHsTb3hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYQmekwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9IBjaa6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J4vsfv3338377
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=; b=kYQmekwnm3YBbPvH
	CHfD+dTq6/r0MDn4wLWtczltNYwWQ0Idv7CYwuwzksZ5uvOW7HR+xx4pBRV+Xz5e
	ynAaBH78oH80nacHIdynm+vCDE0rxuM8r1ZmNJ03rfKKxzXDcraV+SCL+3HeGsxe
	ng45KSy+CHR0MbWan2VErbHnS1NaHgq6CgnFsRXvNpxPsJCgPp4+aMFHShTSF1BX
	TLy4hKFwpOInGQ4ImX/LkPGTgViJ8goBMcmub0GUJDIaj/C7EiIp+/ARo4GaRnt9
	Cw0TjVa9L9S5/8Chlc1yxd2l7Z9vyH2Ps3zfaCjS6FCBbc4vD+1MoByp4JVDXQNv
	Kpfcvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72g89j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:45:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6c431a04fso18513635ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781851508; x=1782456308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=;
        b=I9IBjaa6QW3SqEGNxALxONNauHdg4Itz/RxVdSzQlDd0lJtgjNLBbL9ahq6P+9FURQ
         8cCh/0nUc6dFAyhE010oN7ykrSwJP6z9aGqpFGjQZi+vZ3QMnb1idweDd6fkPhfCwGuU
         Xf81azcRv5MfC3kzwjWpT+ped/lt11SlnCUXp1N0crCM3DbrvbBRPcUyzlDfWdNdxl4S
         CCfF6A73wewoCqdO9d2ee++PbNBnU81Ej6jCXmEashM7ZCnEsPqLdvltFLXuVDmLgAL/
         DYlSvEbbSAaC4tGflXd64xaoNIYvnxXL07VI4lmZcE5I4uWlvbszDmlWSyWSRLtNtBIr
         EFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781851508; x=1782456308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=;
        b=JgyJSTcyJ6IY1+zSDnqOp/Sck0gWCED6ig6U7JeK+NivVkCV82faCPY4hToeF4rAAW
         L5UFRSOYmigbMDJNsH7gCNgFKTCBc7s17AYUyewbZ4z7EjlGvrL84gCK1CVgRtZivUjP
         xvzhLk67q4gcCrLWtc/lBjGQOpSPBYzo9H1ki7PUo+Kur9NEEQCDCv5PUhmSGhhW4JHC
         sZmcIIfGW581xNyhyAcQRoRwfLisIOlq7Zlo8LeNMeOrtGzGSTNXHS3t2INBlFFWlCeh
         w1xM/eaJXg3LsswyV8RUkowN70cbQ7kDw+05DX/HQ2+DUjQRd6iJ5SuamK8hxu6tmIvM
         ZaOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LK+Gy9FF1CA+FlPCMSdu/wcsG2y7M4240xIsD6J1RhvAOog4IWpCEeCVBhaaw/DflEUSgZR1pNLcg/vaT@vger.kernel.org
X-Gm-Message-State: AOJu0YzlmX+II+BhEa2gQ9c1/8ZhQ45lVSi0pnqsFgFrBB+x/0EEXvk/
	D6qP/derhOhUAYuq9mE/ZG7+E8tqYsDzIQsU4fuU1MJWH6sKWIOwVz7/GyK0qOqwckdYXaeTh8u
	TkeaCOInMiEjvBgGSGEyrXmFOe4uB75laNLcz07lNyB3yg7Zjcfik+V7TUTJXKIvDkYkV
X-Gm-Gg: AfdE7ck0w1XLkulxq0oGBTCfGoQWyHdC0njQaprsAjj+6lmxXlKa4Y2TRf46KbKcYTX
	bDKvVTFOCIm3AXvPTySH/s05mjGjYXBXF7wIwkpLGAsiUp0sdCJxu5OIHjixMCHigQ9lZLqxITZ
	FMQrKgVUK/9Lv/Qhpn2IQVC6ugz0R1Z2CrcK1jBML0bgGRy0EYeCsQE2s23XoId7IedbajyOX90
	djeWCIEE1e9F/EP3kYwlPeUupv44IrutYr7kck6lCS1S6I1WUXxU6+aclvu9lyokT/cCAKd28bU
	Lsb2TNjqNOP/u7USAaf2c27sN7hbRLeU9vYrF7bhusVnkj+n+Vv0ya9kNLL23aMxgnNK4ex1Gqd
	sgSW2qG4ebYuYdJB6OJVk9bEAnPy8KvFg5yVxomsN
X-Received: by 2002:a05:6a21:513:b0:398:b433:87ed with SMTP id adf61e73a8af0-3bb34a7d301mr2958751637.44.1781851508016;
        Thu, 18 Jun 2026 23:45:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:513:b0:398:b433:87ed with SMTP id adf61e73a8af0-3bb34a7d301mr2958688637.44.1781851507509;
        Thu, 18 Jun 2026 23:45:07 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a890ad726sm1286070a12.28.2026.06.18.23.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:45:07 -0700 (PDT)
Message-ID: <4d643a18-a044-4350-b7f9-2c61f50cb792@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 12:14:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260608-sweet-powerful-ibis-8b2adb@quoll>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <20260608-sweet-powerful-ibis-8b2adb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX3CioQMvBueGH
 jXX4WsBglT/prb5dx8ln2CvC3OSY2aVVrwmJpsD13mouPlQ8Zj1NOwesxMM57Sh4DfBafOzP7Qv
 AsVIEpo0XqrHvYmoZbFsRGcu15eCvQLrN74EXwmcPd0eaAoiyak54IWTvknIzob9YAjtqi6tjd6
 41f1Ttu4+9hP54yCdywUnWgFNMk0T850poEEd5pV4cun2A3J7k+Y02DIsXw3Ye76LVZiebu2EW+
 VpcoXllErbE3WHZgkmYms1RX6O6XBSXucJuB8pd4ormEKiFD8L6yPTM7RSiehhIJrncKMX5Fo4l
 bteo0Xy4znRGaBfryO+hJndgzeMo3IRIrELRND+sepz01wOiMLMTLCnl42zmdE5RgVYuzFA5Rsv
 9kT6zgiiX5Opwpl4EShXKYlO7K45kA7mgkD3zWtOyOp+nJ/n8YvhQm3HS4w2/TKB0TGoR5wvnz3
 V179kYRCJ8kQ7eI+Ivg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX9MHXj466z7ye
 LF+aeXwrZLLUmqxw8UWZpplWCdIMi5aT7ViWUslb6LhuULMNj1zlJFHqc59zYBP0b7u73gOKuVa
 ZpPP6ZUtL0CUcY4jO5s6Z/oPuVWf+xY=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a34e574 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=0qyGmKY7lCQY0vYQb8sA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: b-rrll3og-Bq3DH98FF4FsMZq_LVnUyh
X-Proofpoint-GUID: b-rrll3og-Bq3DH98FF4FsMZq_LVnUyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113819-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com,vger.kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DD496A428A



On 6/8/2026 3:37 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 01, 2026 at 04:31:18PM +0530, Sachin Gupta wrote:
>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>
>> Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm peripheral
> 
> Feels unwrapped.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

I will re-wrap the commit message in the next revision.

> 
>> found on the PM8775 PMIC. Unlike the existing SPMI temp alarm peripheral,
>> the MBG peripheral supports both hot and cold threshold monitoring across
>> two programmable levels (LVL1 and LVL2), with interrupt status reported via
>> a fault status register over SPMI.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
>>   .../bindings/thermal/qcom-spmi-mbg-tm.yaml         | 72 ++++++++++++++++++++++
>>   2 files changed, 76 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index 644c42b5e2e5..5f409fe700b2 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -193,6 +193,10 @@ patternProperties:
>>       type: object
>>       $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
>>   
>> +  "^temperature-sensor@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
>> +
>>     "^typec@[0-9a-f]+$":
>>       type: object
>>       $ref: /schemas/usb/qcom,pmic-typec.yaml#
>> diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
>> new file mode 100644
>> index 000000000000..a0ecc9f35cf6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
> 
> Filename must match compatible.
> 

Thanks for the review. I can rename this to match the compatible naming, 
but wanted your preference on scope:

Should I use a generic naming scheme (qcom,spmi-mbg-tm.yaml with 
matching compatible), or make it PMIC-specific (qcom,pm8775-mbg-tm.yaml).

Thanks,
Sachin

>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/thermal/qcom-spmi-mbg-tm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
> 
> Best regards,
> Krzysztof
> 


