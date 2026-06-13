Return-Path: <linux-arm-msm+bounces-112983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mdjBAinYLGr/WwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 06:10:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1F67DA5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 06:10:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EjX4XkRZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXBEytuf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C502E3043593
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 04:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A09386571;
	Sat, 13 Jun 2026 04:10:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320B3803D8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:10:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781323813; cv=none; b=MPasGls8W3pTsWxQgYE/cfqY2k0v0Ud63DYnOo7IoYQ/S2iSvGMx7OYRMiC/ykgJ51TTpMdqoDljii/W6rJSlT9Lfo6mtRapTM0bJ51updQwf/SC2aB1KtGamOxocgQJvIkx+GWL+drNEji6UN4casZV3eXiW4yLT1jaeV43YB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781323813; c=relaxed/simple;
	bh=d+CuOuf3ybPVo31Duy+EpOGsQqxm8eNmSXH5RxEr1bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2Lv5+A+4ode9A5DrnW9HQcIeeKr77Ur5cDZYWrugrqcBRqQjccDLc0KLxTnuweyIsjRGD9w0pAbm91ryVBFQRw2vLzpYD5Doc56u8oljTH4d07kkgSXNVeoK8Kpfx6UPqlN8kfe7uDrLv5UtXY5ulGgv6rcCGIEnfScIsgcr1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjX4XkRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXBEytuf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3jcA71350080
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=EjX4XkRZpygOmsXy
	GVaiA5BwdOv/Yb3hrVzwo6/qftVVOstDIcAxtEZgO+E6ImFeQ+bzCsFcfTccR6AV
	kHimL7q90XgU6hSIS5504E9F96Z8mGjWkvrsDI+3BgZdXNC38eNugMbNzH+BSRSw
	e/Xt5yLFD16MFYPFBWIBifvMhxWx6VuMBVe1jvY8SIV3WI33lCE8RwF2ER0/lFhX
	2s4krj6Sno4qlFdEvF+nUNz0wpzBdaY0KrhVSCAT7m5J3YoyYU5sgQkU30lACJWS
	tjLeDzFbaV3WB9e/tV8PvwndhzNmm1ARSDRGQfsBFBPa1kONhe2RwHWAK+UZoqi+
	e90dQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk681f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:10:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso1067172b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781323810; x=1781928610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=QXBEytufWuzTfB4cD/RXyRcDF+MBHUjsNNMLzEBnLHKsB80nwDFufN/J4V0YXrEOpB
         KSTQ1hYnz1vAtAfzCQWnni8e9Uj5bbfeLZDcBONCVos2Q1+Td++AvoOC8UUW/mjAmf2L
         CWSFbTBQ0pUTDAWNSow+NLbw7s2dvi56WzGZgZpQ9WG7hfMdtV99DSOR2HP569kk4MoE
         1DVOPFUZD3LLOXJPZGCrS7DZxJF8ra3QF196B/Fi3F8okY3gp6fW/dG1TW//U9Q27ngz
         shkTR1RHYs2Dw2il6o5W3OSc3Gv6MnvjeE8F29N62I+i0V6T+jy+l47rW77Q+X8akJpI
         9d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781323810; x=1781928610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=W/C8DE39j7JeIVb0bPR5Xph6GGuOq0w9hBqkyzBUJv0DG5wD5K5SFfGt0alZKurvMM
         fXavk3rkDUtpERJ8CTSOJZ56SMtER9jwlhdqevVvcLx1C1maXLfJ8vr3hBsHtVda6HU1
         Y+uPuVESfuVzM0sqQ9AIH0Va7O0cMiLTN6bA6+Uhtcz92VnleoHR2uHp7yCJIjJizd6q
         Le+3Hz3E2TKOKFlt+3c8mX4FhjPdmZJ1Doy8PflMcIRTZzbAzqAywQ6OeiyB5G5bGBPJ
         m80te2mjQhLA2WiUFlpv7FWQe/vECO6Mwh3uvmVrGx1F8Wekhe3/CgFx/4imfGH+PCHL
         IGcw==
X-Gm-Message-State: AOJu0YyWlvzrLCyogTlspLD1zfZQEvCrZT0VZI5uTzMUS5tEsZ15Y3zu
	vjX4cTePQ5rBPI0WNZ7vaQhThh2gJPx3NAFTdQjdehfD4tcX8G5xq/MuNq0jPVnWMdmEwyyN5u9
	Q47K/I3m0X8UVBuPGxn/vAjBzb5aRCD9iu1ojYgcz4V672nW+10gkhomAY9V0ryf0MB46
X-Gm-Gg: Acq92OHuz18Sf+DGD/D2GxgqxCf54irs8WijzZmnhuyyi/v6IpQPsSToTqxyX8qCmTh
	PvsQlI0vji1uqkLjE7D3NLeGu+bFkMiGX3zeaL7rqkij5VYUGB3fDE2uBvShu4qnrBtwSCHnRgt
	7WS2l3Zyim3Nq8Vm5YvST3UBs3UD8eZNhCNbfNNzpAWqFl5woVQ/59cTq4m2xZgiN5nhTS/CkmG
	ZzuPzNOAolw5sThDTa6m4+rQs4jqcyaSwL+tM/ACrQp7GXgj+PdOXccPw2Vom6/aA6cdUDlePI7
	if6Ax9MivT3Ew8m80DpWkwB4vssLnm7E5Ba5TEY5N97B3JCU1MXbELnvqAtupxrWhXGNQjWD/mA
	q9ESEndzHFajL73oozKSBL77gvwTbmV2TJuonA4ViuRWWi/X3qak=
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902255b3a.10.1781323809820;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902220b3a.10.1781323809366;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm4480992b3a.34.2026.06.12.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Message-ID: <fbb00150-e3bd-45b8-a87a-100ecd235a46@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 09:40:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
 <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX0dqTYAfKW8MT
 EKrsxZWf/ApamXeXhbJUAwstFrxyGPNwQgrCGSU5+QbP7GFmCiepM7tUYX6Y/HQ/icdZf3rcHAp
 kCGRnKIGEbSJ404AIX1oStF9BWAbTKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX/UGWhKROY8O0
 cEN9ZarV7wV54GjRADqbPBbUBq1/1NS6O87Jc4VoJkrr9rFybPVBFg5McB7czHNAJZDLTK3Z+s1
 /5aL3ID7RRYdaqzn8dkPi/hBCE5UakelFbMfGWohekMoE8PcmSZHgJIPJ4a88y/VpRFfTejbTNj
 IExDe/X3igGLYExs6PxdpjV3Hd5oZamZvu7v2lF6RH3GlsL7Gm4atLUKZsSbYfdKOv765TgVK5E
 JmloA0MoCOg8qwD9ZIN+q7EeGs36RteIap0YiYKURbuSgyWIVPGRkTxTcBecTiRAEj82gipy3Y2
 f4WzDSy1x4kPWdCfGXiF6JbU4ad7eVoNY3T9fiOSb9l7sY1qEgfUMBaqTRF5WRqEy2dQGEise8S
 rttpAYzppsjJVkhRWWGBAfIK7rnRLn3+CnbPN21w0a7kEXKWEQjxs6wHHc1fXYkOdmpYHx0XFSs
 K2cc1Av1ap9TCNvdkPw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2cd822 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=HRvYZQSnNB20PN4mEw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LreAdz0mqr8NZzFqbFaiW1mUokRassFq
X-Proofpoint-ORIG-GUID: LreAdz0mqr8NZzFqbFaiW1mUokRassFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112983-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FE1F67DA5F



On 12-06-2026 13:26, Vladimir Zapolskiy wrote:
>> +            iommus = <&apps_smmu 0x400 0x0>;
>> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> 
> Please add an empty line between the properties above.
> 
>> + 
ACK

--
Regards,
Nihal Kumar Gupta

