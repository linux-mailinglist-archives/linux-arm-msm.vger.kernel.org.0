Return-Path: <linux-arm-msm+bounces-107859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMBNNd0LB2phrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:04:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878454F072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5926E3089B4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C344C47A0AE;
	Fri, 15 May 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoOKpKHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnVxm2zp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FA944BCB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844909; cv=none; b=HADIymZ5yfjkqdD0ocCV6dj2PI0DqDUHVtmM3z1xz1GGRlShvuaU4shVkqehRLgbpTb7QHApgQC5gHw+sVaTgTIkNd/CKVym2ofOYk/qHJgDAZm0njmHjn4zmK+21JCDUDV8MvpjCiqYaPCuoEapXglSwl1pkxeZUaS+nm0bWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844909; c=relaxed/simple;
	bh=T4RPsJkMOjmqToX2fSIVToaY5p+Zr9IfoSeYrjrwy0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl3Kv/60k2X/mxyAqzjqufBTUj3Vp5hq/d2YVhllMtbNCgqCmXnBTwlWda+1DVsZ4Hv80lCGrYEVFBTtIHOy8cKxXu/x1JZd/TavBNHL1ZqGBrB4x3wAROxQyDE7hHIdGBExIEzeosOUDnRm2xUQK1fhG2Fy3TA64zGefw1+/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoOKpKHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnVxm2zp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAoWGq3670819
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=; b=EoOKpKHyinnHxXmI
	GDj0IAmi4UNwW0CoUT0zzHchW4Ldux2rw0gSKs/4m6FM7DwvCGdNrlb7eaaITMv9
	EsrQHyJCxoc9omWKdNAgxgYAq2iIc1OKFRvlOfSUn+iXcyulmagfMkz4WdzFvceS
	xrpsvTOl+c8kpe4WyTquBCPVRL4txhMCVsujkSKrN5G5rkL4MJoZOHvOkrz+rxhD
	mco19r8IDVuKCsk7tA8iIH9VIXfHXZvNiI71UduHxMhH/TQYwUNX1KrITaennsUF
	lPnmO/BTc8ckeBxnpK292D/xSqZpz5Up7KJiXguc9M7IGKO0OZLWiE8jgSfugB0H
	n++pdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s346p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:35:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so661725eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844907; x=1779449707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=;
        b=MnVxm2zpkttGF9UH72jpb5auhyKdgNCZIJ+z6TuvcQbmUG/3wuUUGHXx9T18cYg02o
         UGN+TpJFr0M7pS8DabqCYs+gzdOO9nCNTx+ryJCvSOpIKinzo3yGU5s3b9AEoJnFaNcM
         bYikYF8xFsvjMcEvQz/RekS0qx5xODFMtCvTD+aZJ/ny0sGRKD8RC6Yx7dkG3Kb5HLzV
         dhdOOLhXCcCdtPLtoATiFEtgZ6unZXztneFgzrvXmf963D70I1Bss2n8zJfk0K/pLE8f
         uUKOR6ezCGg9rsQtxsYAahqAp+mWstPawFiR59rVBgvKYwWtPy/3TEdCVqawZ04tPLEw
         R8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844907; x=1779449707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=;
        b=n32P+svQMcUCDZ70qO5Bmhcbvh99C3TgeBEU2QoQlIaxe6ckSiE1cEfVFKw0aodOUT
         TX4PczzQetd+4hNt0LnpRSn2dM4V110zZSuI4rpNkVyEsjYNOMiEtWCOH6cMGexZv+3M
         rpGvW8n1OiZYJmM+FB1PpkuNcBGsVlLlkLnfjwe6avvSifquWCStIoMsbOFem6joViX3
         ab1rCY6NSmN1E933zOh7FSpL003n7bmX6DI0FRoq4tpd1hzEIQbdSXuRSGJHfx2CAff7
         bmQiGbKcSv3O7ZOEiaj31jvCqZ89ixj8oJPZrfxFwEePBn84rdqc3GJhZeQgRMSRUhDQ
         PhKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yfFiCtlQV4Dt7qMUQoOdvm5BCDC5n7lr5+oNNO2/d4ZCVspy6N+apl02mzViwEr0jy+0NlLz0Su7WKx/S@vger.kernel.org
X-Gm-Message-State: AOJu0YzTeODe7eUaoyXV2gI1Q2YFhLhn/jVVRMrGaUiUfuH1pL8bnCLm
	imedxb6cAZ7cclNW1x4v5xFCsDo5mEIbYwZBQrryrp511zf6f1hKFiGe58SPRsuPLZzoPpIHpRG
	m/y1foto1hG8l7mDdKuhovEa+0Agixm1OXqEkvtWJDUdqUvnsMVpKqRM8/4lXUm4meGig
X-Gm-Gg: Acq92OHe1xMavBOQJ/H/tSiRFfc9qJvRFhJ6gv54FgJR+Bta7Qmir06n5W/NM1/OX/a
	ChZMd7qsXbHiTB/Lb/MaHfnPhrGozRHidZ9mZYCKh0fXuNqLX8/HH4dQqLM2Lr+/pj4mgTyQvpL
	iC8v7ySKiCsVMSSD8yrIMPkS+GOI4DUwG+l0Ixi5v4jLg4z5M2cCxr6U+Y0YckBgs4GWIoD6hcJ
	0BOkastI4uAVYIVvxmt9lv2gb0dzEbrmA+1ykrBA/mVaTnMsgiB+Q83Qs82o1H5Gd7QLu94hfI9
	He+ZiJivZMImBETlcDotK95vV//fA21/p5f4WB83Lb4Kma8KpR/G51od6RdKO0SVQp1C7vPp5pI
	7rqjpxQq+t7VTUVIO0aOobrGit06yzmZmI7tXJOhEBXRQQxnbqPoEV47q+waBj4gX30GBSMIyXK
	f6lfa8
X-Received: by 2002:a05:7301:400a:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-303979815cbmr1450774eec.10.1778844906937;
        Fri, 15 May 2026 04:35:06 -0700 (PDT)
X-Received: by 2002:a05:7301:400a:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-303979815cbmr1450757eec.10.1778844906404;
        Fri, 15 May 2026 04:35:06 -0700 (PDT)
Received: from [10.110.108.188] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm6948503eec.14.2026.05.15.04.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:35:05 -0700 (PDT)
Message-ID: <05799dd6-e2db-4756-b532-2220874c6d64@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:35:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260514-provocative-golden-woodpecker-b3e494@quoll>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260514-provocative-golden-woodpecker-b3e494@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfXxsbEbV2HTdJs
 W/myW+1KlK3g+y4aJkqMSQpncXOHBZzu2Rylf65n1bjOY0UuO2ZlEt0DM7Sfh3iMj8G4FNeMW0C
 dqzocITghUz6nd1feqJFsjWFCvXbsB2xTVSz15MCAyVWgekbVIJPct6UmhIbjVnB0ZOCpHdx3nV
 Ylks6R3nhUcqjn0v86eAZVzM6Is8gdz7UOo0lIMEttndOMFJl8RFGLnZCvq5RH1D0IIgGJqjaoQ
 AIKLJHgbq/F6lK7eIdT+TVdHXsw3BUHEsyvRHOdmz7We2epdRFE5nwlYR57udsY2CawIjFQ5244
 dAOWGly8tfupdR2BhHOg/O8evevdp2zo/Wjr8sEDWaBcx04D1BSHwcNcjc1rgtAzH42brw/bXwl
 r5J7ngFOL07f4r7HFZ4OMN5oZWfXTmM9Z7CDLvTtOrKoWZHLRxuXyvf4PTuhB6cSoqRM2tO7ys8
 KL7Cz/lCflyE/FlkJkw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a0704eb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LxNlghVGCEmHBxfPrBcA:9 a=QEXdDO2ut3YA:10
 a=s5zKW874KtQA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jzaxjHbNkZW3L8srTCQEsDG9k6X-ec_U
X-Proofpoint-ORIG-GUID: jzaxjHbNkZW3L8srTCQEsDG9k6X-ec_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150116
X-Rspamd-Queue-Id: 3878454F072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107859-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 8:52 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 08:37:47PM -0700, Linlin Zhang wrote:
>> From: linlzhan <linlzhan@qti.qualcomm.com>
>>
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM (GPIOs).
>> These resources are controlled by the driver via SCMI power and
>> performance protocols.
>>
>> The SCMI power protocol is used to enable and disable platform
>> resources, including clocks, interconnect paths, and TLMM, by mapping
>> resource state transitions to the runtime PM framework?s
>> resume/suspend callbacks.
>>
>> In this design, the ICE driver acts as an SCMI client, with clocks and
>> power domains abstracted and controlled by the SCMI server in firmware.
>> This implementation depends on pm_runtime_resume_and_get() and
>> pm_runtime_put_sync(), which are available in the OPP tree?s
>> linux-next branch.
>>
>> v2:
>> -- rebase the patchset
>> -- update to/cc lists
>> -- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/
>>
>> -- To Linux Community
>>
>> v6:
>> - Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
>> - Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t
> 
> Please do not include non-working links in public postings.

Thanks for your comment!

I'll remove them in next patch

> 
> Best regards,
> Krzysztof
> 


