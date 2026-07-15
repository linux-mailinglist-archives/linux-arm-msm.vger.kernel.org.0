Return-Path: <linux-arm-msm+bounces-119251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8l6vBqSJV2oRWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:22:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15075E9F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:22:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="X/9QKtCO";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HnuZeQ2i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119251-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119251-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B720B31349A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3E140EBAD;
	Wed, 15 Jul 2026 13:16:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E8423E86
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121412; cv=none; b=L7OJhxq0Bp2Ypi5chVHrVWuY5beGIMmdKp8fFbuwySRhLjnZkfD5HVXuEb+Cao+DuhzQAAFJPtKEGLw8+7YKC6sITew51/jOYmtz2cPAwx0UA+ANjHM3yRJkZ0WVBW16sW/myL/gEfrxreyaDT3giH7NKXUOxRWu9L8lKoyeys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121412; c=relaxed/simple;
	bh=X3xNao4caxeAM9O+jt5vjM85vF4EW32IxnjHAcoEYws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0pjyK40bIwVTzuOuXMoY72zWtzkF3bPWbmYlPEgVGrzpfHRafzBrrulJY6DGm1uIps1dMwUl0Ohc9NjJS38z2DgRBoRxb/Cw4VJwMiHIdG2rG7YWYZqGFsY+KOeolx+Eildv+yQBKV8Kx+emGzNG7/Y3uq1tdHpNO9cOWs3n/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/9QKtCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnuZeQ2i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcf453479130
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=; b=X/9QKtCO4nwO+hOV
	P/SR9f45cuzUsOFZ92G0+Nji5nWjbh3pFACmSa/TFw85Xq5gsU4tBzUCyD1lxMV+
	E1JQIV/aWaBQKNFAif5FPR7cCYILFyviKlK3U3v5ManyFEm6P5gw9hGgzbzyLwA/
	hRKFlboB0H2S15Ozuxrl3zfw8F6VeTuYiu5gL5KAlGBc1O5Ewwl6db8/hpeBrulB
	oCgq7AyJv579eOdUmyMnVWjl28XDbY+fBIJeqYSaW3rSzqLU8totnPUOvmHvsKqG
	vPVGNXwxeqU86BJrfbkIOUril8j8X5M0TEWmFumw+a1USbwXDfLnifr4casxFLU0
	jMRZZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3s76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:16:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55f0613cso666064885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121408; x=1784726208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=;
        b=HnuZeQ2i5cSfr+4x3qNAZeipnea+M+dN5EJdDvEIcq947ja4BLURRhfTJpEJsA0pMl
         2GfVxTU9/huB/EmBDp5IwNBdwFjm0oI3M7LNpho4PckzIO1qEDL4Iomd+9PlCOD9KzZx
         gQVg+K4w4d5jAZgRk/t4VC+C/QSYJ0QDOYQWY783p+5eLlopM4fK0dyf17LPSDPLgGz/
         QYYvT+TfAQ2yxvwk4QKw0AaIMs2xZZVBN2wqKGQ32u3c9kmH/f4oR845HFnQGp3Tge0G
         t9oBOBNmYs6eliFiMbTkmV3zSNq7YUtKCs8QpCRZL2R29v+MGAiZj+yn26AecHOd29JH
         zQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121408; x=1784726208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=;
        b=r6bhc9I8i4dx7Aih5QHXlSYjBiHIown1AlqiZZjDGtjSkoGuJPK+oMEXzyNhGRam36
         gZGaBn7w/pJO73k3yrIC3TaYnzAjn6hIswvS3MlVaeoAGhLPzWXyVskyj/KlG0yN2OlZ
         VBEurMl2qnk/FwDTLnx6qy043V48J5B7suq7E8ubDdSWaUqze+0hOWaIX+W0A/ku8Ism
         gMrq2TSHRPDdxyVWYAEe8A6vHbIJbWaGIMZWrqpcz2TM3UzcQphpLVLKvoVgZTBipLwB
         6JWhRMWY++B11oHXO0/wEzeqi8nr45ER4OjZjXt7es4Pu23iuzaXZW5/RqyZLiFwFWu0
         Qn0A==
X-Gm-Message-State: AOJu0YyE7F9Pb0BSMWORvhKcLTyR/6DCsFWyxXSLy/PYUr2gjAnifiFS
	KXLJY5QVQ5tWLO7Beqow2z2O9mWrrVok5mowH//2fIXt+sflHb5RaV8IRVI+mcjCKtgfGvjqXPQ
	K55T+yDlqLU0kqrO/XaSZbHyd/yuS84Yzo5gtKQs2KNRyPBsuRSnaeSofFYd1+OUUsq1H
X-Gm-Gg: AfdE7cm/HULx/k2raWSgzyx/7iRSW3BBUydkMTxElvhKH0q84st15kTViW7Cil7bW7c
	6HRdow2yX+mOUnaULvILslnZTRm43vMNBY94/7JAG11HctQUXJyV9ufUgRnv9mE8x7qSFNbpCD6
	USaGfmDxaDY+Fw5qDrtGCqiDlVZFXUttTz9H4dsjwLJLiUxc7ASGCieYlxMU6OMJPAhHNS0Pxza
	s3AWNZvOTY05nXdoPhtlEsVJ9I5HPI1A7Rsug1AFfugF/RxkIKbnp65+Px+FOboyHj14PnPHYSy
	Hq8l9fGwttVoFlSwoR1Gm7/+iybMiQAE7RpVD0JoYSWncej2IKpohhcrfAQPB10YcF0XAa7b1uX
	jherbiSxHwQZYYdPkFXI/DTOf5iA7uR+GvYeE5ntY
X-Received: by 2002:a05:620a:3711:b0:92e:bd6f:b166 with SMTP id af79cd13be357-93086c1d9cbmr623781085a.63.1784121408446;
        Wed, 15 Jul 2026 06:16:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:92e:bd6f:b166 with SMTP id af79cd13be357-93086c1d9cbmr623770085a.63.1784121407284;
        Wed, 15 Jul 2026 06:16:47 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm1734570885a.42.2026.07.15.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:16:46 -0700 (PDT)
Message-ID: <c6163d49-4922-4926-af75-7bd8861ede6a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:46:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com> <87mrwtcekz.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87mrwtcekz.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX8laIDSGnb1jy
 wbsgyrT7+4XrRlRcbG8Yxn1dPnZHNKdw+WUw18qLkO60qNMubgXWhu4YvgROmg8C9mLntxqZVBN
 PxpAXUgZzi4oX5YFFSx33S1g1D/RVvE=
X-Proofpoint-ORIG-GUID: MDIh3ijNzfCogzbaACl2FDma5skTgNhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX+FjhMrzLkxkC
 96tFcYJpmrIsv0wTPFYvMP39cCxJhb5BGn0Twdk6lRAAicV8OPnJxNdk21d94j8YFECfmAe6Dhn
 l0oEVnzU3JGi+vnNE/vL8hnMCmTYlVAYt9Q1pZiM2Lz+b0XfKsaiBb0m0r1B1KS47oaXr6YdM0D
 eNSLRjpI1pI6x6x9B1u3r3IOWcXbob7TUH+9io5E5Xv5ugE7mGxfqKhLMqznEuQYjKaf+jGMXKg
 EoYFxf9pf3xyqo06Wu86zqi5KBePljHa9SVMf8vppC0SFj7Gsi7GUVwKJnyp7K8a2gKazV+XDD7
 pyZuAo1/UGwH9IMwvVRhl00Jue94gXgQrXGRIinFBGUKTP3Qmk9uTEpCBLZ1RUldHfONluYL4E4
 flW4L+YI2CSanAOziRObd1czuPWKCsIq6Q2OA+rcFpVvYfPclzrImGQS4eQUxUETQHRGdk1uu0z
 nQ88cyKYv/icxDqT7Hg==
X-Proofpoint-GUID: MDIh3ijNzfCogzbaACl2FDma5skTgNhp
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578841 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KdhUs1RlD303uQQr2RgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119251-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B15075E9F4
X-Rspamd-Action: no action



On 6/17/2026 10:02 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 15:57, Maulik Shah wrote:
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>>  		}
>>  
>>  		pdc->x1e_quirk = true;
>> +	}
>>  
>> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
>> +	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
>>  		if (!qcom_scm_is_available())
>>  			return -EPROBE_DEFER;
> 
> Bah. Can you please prominently tell in the cover letter that the series
> has dependencies on some other series instead of hiding that information
> in a lump of sha1 references which do not exist for me?
> 

Sure, next time will be careful to add dependencies in cover letter as well
as b4 prerequisites. I have sent v3 after rebase as dependencies are already
pulled in.

Thanks,
Maulik

