Return-Path: <linux-arm-msm+bounces-112956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CgbtJaQ/LGpZOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7C67B45A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KdoQJ+0L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T5y2Ny3Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93FDE31B522F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671CA4028FA;
	Fri, 12 Jun 2026 17:19:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A011F151C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284742; cv=none; b=X6eVCxS/RijtZ8q1mMbhgrY6X9TbSCHjeNFCci90p4yHafrPXVGuwHb/5EPwhmGcPFDJOE9dfba1R9FahJIfRaGTYFIADt7ID1RM2DcSqNhnJ0Tr01pWtCF9CANxKMv7qgd/0F+39+Df5wlzsNuvkIR+xSNg12x2DbjH3JkWxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284742; c=relaxed/simple;
	bh=CfhSriWS4WwEYC+i+yk6Zxhywexzlao9E2hEBJT4Q/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPywy5s591mTuDatgmP9jtdSejF6AJrNARcXOSXsQKhHaRhucZP9kfHH4cNyQIxvGR7BKguhtUeV2dzWfyMtpXBOurBAr4/EPi4VvrIGoH+emj9SfRKI3HZo9z8gRISGT7Pmxr1K2Db5UYryDLERtF9XHtVKmqA43VJXSu6He20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdoQJ+0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5y2Ny3Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVlIB4113310
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=; b=KdoQJ+0LAD/hkmca
	YXRDdQiNUDl63NJ7PQBKot7sA7ZbEPRID+2tkW8YtsRh7nBZ5zM4lCx374w2OcgS
	zxEnJxw4Ac6tlIfCFBJwOfZnoga32RNiB6MNJe5FQmUaXvKLCb8Z3YcRX9mPn9so
	kb4kO1ByrCy6n/H+EmcNarUdZfGOO6gSOo9fitPKpK3/lTXe7rqYKOemkzyVBxBo
	AZ4HQR/vinUxPU4LF8+uet7X5FsEdLq6wG8OfXQ9VCiK9zp5VCcH2e9EKTep/ylv
	CYhp8/UeBeO0VFKiuoWLMgHUiWM66F53+PXwgd+wIKxtLYyy44sqWc2+V6u49V3P
	+V26ww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gbtwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:18:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8425a9979e1so868301b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781284738; x=1781889538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=;
        b=T5y2Ny3Q6p/ev5wCKFCX8bfo+Gtxz7TBmnG/aLqP8gjmhhVoWwpqyJjVFeqxLyF0zC
         5bKv0Q9evgaW/KUPMmHZ49y4fjMH7z9OJS2KLe4afJHN5+VmDf59XtPrdC7hKxAvZcCY
         qqCBnLMHg9JV1hn+YxJrK8/5VSH2SmzavfXT7wxeXIy2BiXDrAVbLmt7AKepAlPYbjJO
         FSpec367rSh+wtgLbTSOoMSubuaI0uddwkEtpt7UCwcseBldtQMd49IHNGYLcir3QJWE
         6PzgVs33bbM5VWGbjlHJmNPabWyX59SHJI/dDTh8GOl0sKSAiROHY2dAzhQ/IMMoGhYQ
         2luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284738; x=1781889538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=;
        b=r/8sp6eP9eOvPCpi6mnBwc0ZKZ5Ulz6DW3VETfHtA9vhkvLujvHdiGVMkPztgxw9f/
         jDyiJXmhXm0Nu0G7rGurTyxjd1Lw9Iyxwxb6VUoeqjNqK3lhLvl3BqIWzSgKoWakm4x2
         XSDOEOSw+KlhE6r0bJFLtOGQEQ2yW3aylbcEKjaSrr+cGTICGeBVu2MEBKuKy9FYnDcI
         UorjEiO9CIhZPz7EE6XxHH+c79heFpzs5D0SQ7/E5GDbjGILm/phGcro1emcwKWHSdhY
         F4gpMIQUwQlhnEXZZ1idjbmRo1Giutm2NYuxymL4WCkf/XCAu0PRNoDdiWMve+E+TruQ
         Wmsw==
X-Forwarded-Encrypted: i=1; AFNElJ/hanWlFBGwW0ylwzyR9/LCujZCUKYwZ3otq7VZG20ehGBUdOCc0oi/4Py23r5RizJRZUnrCURd2O2a6tKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwqDvVmta460kV1TcdmMC3HwE0byfqjVCC8TrlpiZdWCagWFHJw
	Q9agLdDArm5Qzi4QfHvLgAZVg61lUyR+xN+mpx4vrcJj1e7ud0BNVn2jaNQ4sdzE4RxWu5B+1Vy
	MOjG33SbTPnbuR3zU0iWQS6QUbd91S/Els/ZzYnaLdK2qlkGrF+vvYsh8tEH4ccWXPOvC
X-Gm-Gg: Acq92OHKoRwTwH9MSdJtujsBymdxBTklid1SYxKupA11nTDzGTI0/jCo52mUl49LpAa
	Pxnei7fHKF5+X6G+eeRBvMRVaCGeu5lWjFxu3n6+Iz5GqLoWZjX3ocfTfkfxmA5vJaugtVFn08Q
	VDE1Xjeafq2FZvZc7oxfZJe/h2USQcq4bP4kCJb+QSSOeGWNkuJFzvVzzq4Kif+3kjyr188Y+CH
	YEh2yAabHMBDxl/aCcyJWYkEcAWBMqOv2rEjQAebixrSIB34hl/Vlpxdidyo50ouKlfr2hEJhpi
	kh2uDnrhL2SRqL1PekdiZPpkym0yAc4DN1v6G+36BRtiiRY5fgt/39CBC7p5tcxPVFdZT/faZT0
	gNZA3ubEohdxy04/A7zJAIgIBgznzJm7jpeQVfoWAlYsMyIeiejs=
X-Received: by 2002:a05:6a00:1947:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8434d0ada54mr3972680b3a.31.1781284738499;
        Fri, 12 Jun 2026 10:18:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1947:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8434d0ada54mr3972653b3a.31.1781284738042;
        Fri, 12 Jun 2026 10:18:58 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm2538142b3a.45.2026.06.12.10.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:18:57 -0700 (PDT)
Message-ID: <6cd2c9e0-9e3b-466d-b9ef-586bf6c779a7@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:48:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
 <20260611181841.GA3163205-robh@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260611181841.GA3163205-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX2O/2hdwtPsYw
 mnxxMoGsWuG5T9Lbhq739WCAaQJUbKYYbVX7ALYkNTrrJGBps9hzyKJ5Uw8eE+iNJs9wTGDiYrY
 nMXo/i2zKfocHBPAckMn0wy5EmNFPjM=
X-Proofpoint-GUID: DpnCw4Z9L2ZIYQvMKs_aK-UatQ03GrwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX8EeA2GwWPMZf
 ZQBfFwEmgYa5+5u7qImgL8CEaa10MH9XCjWqMcQom4frxQI2bZYOZCwMOnasFXx2UYjmDGFrZRH
 UTIxEmSA/bARFzPeikYMGuxDiCQ7l+E/mni2+IoXmLQ4lyJA+TybcM9Rnvmsb6NvlRfsO2zpDfe
 ZBEf+qDqhtIeMTNglslGiaHw7pLccjhUJ+nPlaWdkkmw1k00809YRnZk8s2SxyPVAhMqVjBVsZw
 +PdBWWWPbwbGwInHZKjdJVrGu1R/dXoSd3lIkjYSqS6dHN7eM/QbBDIA8JFo5CkJ7smxyGwdAA6
 JCP+am0rnxHz6FsGUIpv85Y8q3DGILZ0a5poLdBNEYpNJ4Geett3MJsGHJzUUR87Hj3bn2Bkfbg
 NFOaIaLtkZ7Myfn3OzUXZHOomc00Ec/jp56p6anlCuPU30/r3dEld4EHgPnT52XiAEZyxK33U3s
 jFusVRVsRplX5t208ig==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2c3f83 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=g0pf6In4uVe9puqoFIUS9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wogpLHfNZo3oYugl4g0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DpnCw4Z9L2ZIYQvMKs_aK-UatQ03GrwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAF7C67B45A

On 6/11/2026 11:48 PM, Rob Herring wrote:
> On Thu, Jun 11, 2026 at 03:40:08PM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> Three eSoM variant are introduced:
>>    - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
>>    - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
>>    - IQS: industrial-grade variant without modem (PM8150 PMIC)
>>
>> Each SoM variant pairs with a common EVK carrier board provides debug
>> UART, USB, and other peripheral interfaces.
>>
>> Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
>> its corresponding EVK boards.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Missing Krzysztof's reviewed-by.

Missed that. Will add his reviewed-by in next revision.

Thanks
Komal



