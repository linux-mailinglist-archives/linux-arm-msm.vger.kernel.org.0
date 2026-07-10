Return-Path: <linux-arm-msm+bounces-118267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gj9DGILhUGp07AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91873A948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VMMokzzb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hTgc+xtp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F9253132DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC5142E019;
	Fri, 10 Jul 2026 11:59:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A61405C59
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684743; cv=none; b=bVEQvfeT+6eC1xLhUmKptt6VCRxuAobozPKea/WG6NBSzES23IPEX7CbpjBc+AVa+Xi+TsweMGVnGNgMX2M5fr2kilAtcsdEg6cnK4WN0uE4ZUmjQWTsYrT/Bwx1qfp8CxWFB6wPyUapDqogOVNrUdijK5j6h16XLxeZviiEK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684743; c=relaxed/simple;
	bh=o9MiqHPzrfvvaVbBYodqlmER0VtUGWx3b6VUioTVW0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebxnVEiucRP106fpWqqbmnAAeOJUq3XUpeJBz5IIYqlM85+L/tDf0tU86GcgAeidekyiMYuFSdBRAN1HgkOXJTwM131iiyl2aiyQVSc71VY9oYWOYLgDfhOstkFqEyEeFvys+vlp2FMq0ZCA1FtnP8o/kqHuhy8Qc3bVqjELfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMMokzzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTgc+xtp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmUeu615075
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=; b=VMMokzzbWZIWJWm6
	taq4lnl+/Wv8Kj58W5IH9luLrR3QxyHKNqYVvGqxMuptiueBURogYIboWpleIYv8
	byKvjIS+vE9iP/LhJUFQeOt7QA/orzc/l3MeKS8JdAOT7MdkFzDinB+N4VFQAnFg
	ucJvNjvEOfTPxqHoOHiTvFwfPdp1NrrD5nvRoVF52DFBuLufvGE2uh9yqf31hz40
	r/T2/rqHOiAB6s5xJvbfMy1jVgQL1VDHGlT7u5cvzuWADEUjBSSA/j+yESMwOh7o
	mlJfXYpnybpHHQw84vKRb645xidAPIj0MCtmTT/8GWB4vYELRC+pUIXQrY7gtq85
	BQIyTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2x7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so6620151cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684736; x=1784289536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=;
        b=hTgc+xtpQD18M6JTr65uDFAmoam0rmm5og+RvY4YfOtJwY4uRjVQD4zxYt9CPXXZV2
         cuy/p602Zs6JoQtQwyM9yjQEtC6VMTOa06V5OGbEy2U2t2d0sLyLuU63EJexJsM8+k5i
         VNwbwXgnr0ud6+RMvfOBWPmwJrt6z4P221kjGEZIL/J0f5IW2UYulR17cM5wX6Jl/qq4
         ubbEvOJJlTHZfDvFs6WyHEkkW0B472RdRf7PGQzM2YPOdl7xjnbJ88YIhz8smVI+sERU
         JMQbOrtREiDc2jThz5tY3Ns80W9Qy0zuSZZtd4fxrOlRU1NIrG4Lck0hUlz2eEvbDTxD
         sDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684736; x=1784289536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOVzTAGLJd1q5QSig/Oj+JpLd6wyrrESgMmKd5o1iXI=;
        b=nM0JbacH0Ggxfm8oot8FmwL35RuXDq90WOcS14JXNi+RbxqgSSu5gZScdGDgUkWs66
         W3OEbG1m0bOfIHRCL30dffV5yNQYDVueSyRi2E0OzqjbsJV5UaOvVQZm3c4S3My6cMNr
         3LSCaV0xlXkDOt5KOC+3rpf09Y1Wc11PtIUy6o37kb6fditVeOcDdJ0JlTdZMgSR8vTs
         0BJpF49hMhy2ltV01BxPDNLIOk9eJgaaw7YrKWzTsyOpjCcl34QPqOuQAaKtcdv9C5uc
         Wz+Ow/FAEl9QFaUlfbjQH1ecnoNPbDi+kHctBQKFG3AqUHOs4b/nttapS2e2FQe7ol2C
         +a1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFqmgt6XAsysOcKbhr0Luv29C9JN9HdM0/Tnmxdop9Ez0X6B5etl1VMbMcuUxl87rknl1YxerpXeDIeoQB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jS0lxUR/5b7M3lNYfpn1W4bACSg4cwEwxhji3rUJB7UCB73l
	oHtw2qtMiT/a679KDjjvT5dBZsrIldy/mgXB2brGJGO5g5ZRQZWJg5gE2hNs+WXYoVBt3+5uZEr
	aHX9V7Ppu2cuhG3CeM5UeSLsFiPe7QYAZfJ1TsGgY96yjRj6W0VIlLY3H3189Gmd/C1mg
X-Gm-Gg: AfdE7cn8z91HNpeyYqtTcnd9t5sE74uM6yPNjbJUpd96lNbehX8JV3wsFKmedGuwKS1
	OjBWCXLN+I9ZCjRp/WpNyw3O7bnKEv64Z4kJupf0LrcOnKPatnpuTczhAZYRF1CfAS1HDfRmGwf
	I36HT5AtRxAFmn1+dDuCFRd8re1evD1rYx9qrSahFitRCadsjg39+IK9QgpyTRbzZpvw+GsHphy
	wDdHEJSPxYYV9V5W3irXKDYVCkwuTJOMKO8DSinVsGaO7TXg89h670hU7PCZzd+KZbx83OI77LQ
	ehrfker8LlkJSTTQpQElyXBHRP3Rjl+ADA7W1AY6wmMH1gqGTGpU00vSX8Jv+yZQioR8328sIzy
	/IlDrBHlVROp2Ad6vYfIJHIL9dajOZsjavxGr0u2TECA=
X-Received: by 2002:a05:622a:1104:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51c8b456c27mr108997451cf.38.1783684736598;
        Fri, 10 Jul 2026 04:58:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51c8b456c27mr108997211cf.38.1783684736115;
        Fri, 10 Jul 2026 04:58:56 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm3801427a12.23.2026.07.10.04.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:58:55 -0700 (PDT)
Message-ID: <4c5b596b-1fc2-47de-a856-55621b038ca9@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:58:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2-Py6rWHIVuN-zToUH8iZDEAo9VAu8Zg
X-Proofpoint-ORIG-GUID: 2-Py6rWHIVuN-zToUH8iZDEAo9VAu8Zg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXxkUdZSf7SEC+
 v4A2T9nP/Us1NMWOmV//+2wtZLBr5Vgx8+TZW/b4Uf/aMiVvk7ELzjtPTYEUxAeSkg3hFw6cIJT
 BS7WJIy8vmYzgiHxf+KxO4bVO4p8TQ5oIng+FVilStTmwQ3tRTxVd7MaqGs5ye4F+/CoPl/qMAW
 7UIfvmtyTqetYjiI7NNY95B6U69y9wFJAkhmLR3iafxQPXLV1uap7s+EKpm+zuB/9194eWl0Jbo
 6HfGW8DtRhZBx4rl4Sq7Aa3opWLxQv2JOezAFSW129bk0Ojv22GktuYvu4tdSDO4TkaRZbZrTov
 3KFGxOwmU+awb8tin9uC0k4Q17fFxOdJhl35GYswJsqfut6y5BtCga0ZpTvA8YCLhIqwPtUofhD
 cRYnhoW6nOlDUEMJV2IdGn4CqDHqsXexwHIFB1OzhwPN9tq5uVR8kdNLjjP+Lok3VnIu+HwRFFe
 8J0ESGCwpAupou8yuBg==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50de81 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IryoidPqrvUGrfnqEI8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfX7rs500mh6LVh
 lbbuJKakLeylVttzfnDZgQ10REscM7M6us/LRcHLlfU0ttitVDB0+Rs+vTJdV/Nh29bgLF5i3Ua
 Ig0kSs4AQKvIEsY5I5HhANo5jfVKJ34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118267-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA91873A948

On 7/9/2026 1:30 AM, Bryan O'Donoghue wrote:
> On 06/07/2026 08:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Looking at my commit logs I see this isn't my commit message ..
> 
> Anyway.
> 
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..95e655a8b6aa 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/slab.h>
>> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device 
>> *pdev)
>>       if (!camss)
>>           return -ENOMEM;
>> +    devm_of_platform_populate(dev);
>> +
>>       camss->res = of_device_get_match_data(dev);
>>       atomic_set(&camss->ref_count, 0);
> 
> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do 
> the same with the CSIPHY and Loic the OPE.
> 
> Modelling for subnodes is nice if you have the idea the camera block 
> should be a bus.
> 
> But for what reason ? As you pointed out it should be possible to both 
> compile and run JPEG without the compat=camss node on sm8250.
> 
> Making the camera block a bus is a nice idea for "reasons" as this 
> thread has shown, its a problem to implement with an upside we struggle 
> to define.
> 
> When the facts change, I change my mind.
> 
> You were right to argue to have this as a peer node. Lets do that.
> 
> ---
> bod
Thank you for the feedback. I'll make the necessary changes in v5.
~Atanas

