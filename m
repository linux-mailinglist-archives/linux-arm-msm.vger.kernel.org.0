Return-Path: <linux-arm-msm+bounces-117588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XmeGJUM1TmpOIAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:32:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C597725965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DfONenWc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZZDd3Rsf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F2A63102989
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC1944DB7F;
	Wed,  8 Jul 2026 11:19:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BAE44CF4A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509570; cv=none; b=F3dEm5Djod35Yv4pLBfy0pzk7Gp4XD/G8QuHETtApxgkl7bf4uNMXX2DAvCWBzj43iS2U5rRKwfpBt1aisnlYFvfmhkyUjfO73LAAD+XROzdWyBsRyfpwQtKIfkiNMXuIPZW6l5pHtxJvIRwi3x3hKCjGAARe9jVZ/VOFuv6OJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509570; c=relaxed/simple;
	bh=Lmryp5xahhJqIfp06uw6Ni/Xws3g3QD2M6M4xTh1qsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rorMMe2rX9cBtNHjzRad3x/t9hF3jMsuaAwB370eqzAjPypaqIZjpIoUchCbwcHkxLl0wGmjf//BybnxDRHHjkeRWI6DW+6pvhD6W7XkCKM0MBO1I5ZaQYcHZEcGfjaPHiOlPaS1DYlLOekSJtPEAgkFUHdXdXOGlUUnd3Dkcy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfONenWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZDd3Rsf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Dh82231103
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=; b=DfONenWcqw14McpL
	J/DkqrmjBC9uVHzbFj2BzO9FRR8XDvuESRAWusGGxNq/tUsiG0SJWQRw/7RdOrwO
	RQ6M4luFVQ5NFi+VvaJv6O/5yPqHdAHc/LK9cru63xzU1wnXYn06YArhqbowOWv1
	GgN7VDQgEzua/mVo1G/X7xeszOpRbAf0FfZfYAigTekZXNK8KDVoG6JVh15Urab1
	vrUSyi9C63KyOd4noaCgKI0FBBmqlWRPnTvKYGdpchdzWipbENQrv7ejS+YRRQ/G
	fhw0XSDXEMWFmXFcdv76wJcJm1Ml6XNJAHKUWuriUIOcLVVTAzYKbwIysC0rNv9z
	xDI0/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v55k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:19:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso582908a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509567; x=1784114367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=ZZDd3Rsf89T8ZVSmdNb4lZ8mKR8fmzs4NCIYfTFE6t3DbPGP5aaGYTKCzjoR8ZaoRf
         Pc7q/n1znXNblA4/yhmn04PNPckZTdkIVrvMudgETqyVNMF062ksUgLx3o2wNRbXkJG9
         EI0aNjNQL5v53vcLQ4GMC6X/tfOJFP+ZgBs/iCN+tn1x5l9IBWMsyRiTxTmSu7TYkyhD
         PNgtPRphuEAU6tK7vLLl1W0OohNGqX10MSJVxjdsBMvj7HQ9vQJGMrwaiQ1fBp9zMnre
         V1lW853UvOV4Wt2sxHueMIj7zmrzUzbBQP7nWsgRN1EA9uWOiEFwsj0pO7GCjfbaDhLD
         44yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509567; x=1784114367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=Wnivj2h64/YSBTy77Ne1mJkxhFGyI+pKHmOvbsCeAkqPjdN3Y9pm2JsGYzWpEUZ7Py
         6z0tKh5Cr1W2lpaa/vhOeJHZaloFK689QaNk+iF3iAK8DTmJFf5hDHWvRTa3kZ5FBWfu
         Ci501BdsSzA/oIK3yndSHf3rDc1Hbsdu9e9S00bQSgSDGLdCWAqPjYRTDW5HsMr4Pp9k
         +NVi02bm/JPGUt/Jjna+mmMOlJlQJuWLBdU+AFjjp5EiYvPRCFC7vH0gThPw68AwRLbz
         qeFMHtM6VLlC2M6UunTVpp2yQix0RyNmaTUxJhODk9uEPIWLBi9nUzfoMyVU8eDnGyY5
         va9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7i1z6AzDlWg2MYTcsNDH808hZqxzeK7gAJfivijEt8IMRjwGjq1P3eugK91A3DTB1wpjmFJoYQ2soaP7f@vger.kernel.org
X-Gm-Message-State: AOJu0YytsxwyJl3pTINVNVcyfLx35of8iu0sdlYIJVLYiqta2X8iunmx
	aMrzQbPtqk1kVmnzL1sE1yILSy6nIHfDo7LvFLH0h2HKLF1KGxjTT13aKxt9RnMxeIrwY5oSYBJ
	yFW9/p/t7RLmTly983vgwq6mhpxTXtdN0DFvQX6/zKGu3tzE+v0o+3OlTq7CP927c/joe
X-Gm-Gg: AfdE7cnauoH1qphLk87LtJozmZnPJIMli0f2pc0uCro+1NwQo8TXwikLB2KIsvaLw70
	PM4K6ejTxHIIsukPCvUXFYx5mzFV9fPXzCEy8s/xUxklBBHZgGn4t0YyRHc2BNSHGIlHZf6DlZT
	AKjBtPouUfjGzB1F2H489gidO3Y5H9sQVWyHAuFUBLXcYg4GNO+aLenebgQauIkbRoqvpsi7KyT
	X/3Li8Mq1KEg/WyQhlXphU4zqS+wVZLHx+vDs4R5T43EKRgg0L7VHS3ZgJXDnZEh3bPnHvKLzat
	0m7Mwpl1S5gBgikm5CrQmbyrS4Cm5cuNcGz/HNBr5xou4ybq4kT2DLWmtvadSdO07EIDmICKEeg
	q+/HZK5cy74/zvl+1j2v11cMnqbyIsnIz6GQ1iHo=
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290737a91.5.1783509567022;
        Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290700a91.5.1783509566602;
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ec015sm2578846a91.9.2026.07.08.04.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Message-ID: <ca92af9b-2cf0-48a0-82a8-3c48b4ff5357@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
 <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jreRn22kLE7jlU6rgTKk15S1-tOAuEnt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX5GeLPA7w8TtU
 ct4mM+Te8CVcrPIsDOQJDJtHiH2bL6xEScuJ1uxdY8MxL4QxDLA2FtrkhHwgdNmvmv/TneVtChU
 u6CP+fa6KAyJDBiicWr9OF8N2Dt6T0o=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e3240 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aR6tUbKHR8Lh8TkzPOEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jreRn22kLE7jlU6rgTKk15S1-tOAuEnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwxeA0LBUlZHo
 rNXrBZ26WNNrujQ0FENgSsqzkBzmJiny6QrhSsAg9fH1fjjTAOkatNDQhq/TfDSUHxpph13uqST
 BQZpDWLjgojYr7vVQV6amh0IP5Q8CqwXq867xfuZ8pj42UBuFgfyZgPylw0m+lqWNhgNVgXdKZ7
 auWHrxGGk2FIDYAAeryR5JGw7T46p6tWtwNYlfqaRxOWMXySyl4k4G9iodr5CyzUlXfhx/YMN0e
 Wn2qPKuLwos3m/Yrh5NI9nJYF+0/m6O4Lx5vZXkAqIewR1hiYUTFUXkpypSrFf5LoQe9/54qitM
 JqJwzjgDdY46NyitO7KlSraA9hkj9iqTJoQyeNusEU03x4VMRkTUjNZX8O8230v8kKE+cSVgRRL
 QG1MdsXNF/XYEPkVDfIDm8LzKpaFUe4lSWiQigUeB0QneQQfp6nEXDk+UC0GQYC7S9f+fBcFdT7
 rCDJfONO43NnSCiZLFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C597725965



On 03-07-2026 12:54 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
>> switch the GDSC HW and SW modes at runtime.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER,
> 
> No other dispcc driver sets this (other than kaanapali). Downstream uses
> this for when DISP RSC (which agatti doesn't have [1]) is supposed to
> idle
> 
> Konrad
> 
> [1] (well maybe it does but there's no RPMH so essentially it's not there)

Sure, will drop this change in the next series.

Thanks,
Imran


