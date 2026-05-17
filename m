Return-Path: <linux-arm-msm+bounces-108047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLdpFtDbCWqZswQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:16:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9D561F35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CD43008A7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEAA333730;
	Sun, 17 May 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBlN1HJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABESqRCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E03101BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030988; cv=none; b=bCLJ9IsaXhtCXMloqFoPTdG5lYDN+abMHKq898B+g7E5qxZwtaEf9nx3glsRsJ6TAViYasMMifAklQvYheBqE18cPQ7tME0NnVwpgj7rwSWfT/Cz10UwBfbC+4Smp8jlrJaNBcRTUGWvlWGzYGiYN3cL7qmxng9C6DL66+lhDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030988; c=relaxed/simple;
	bh=VrQBuwIdXxT7Z1+JHyM0ITVDt++tMbrSjyb3f7XLzKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoVF9ptdI1siUq+366j7CZmIyaOb1eAnnUk/Vfg+V79/DsvcqPH0VTZejOXEA0ISdEhVlSuqPDzdyonm3j4VZ6c19wKipWTbM/4m96E405lqxpQa80NFSocoWOrMfPJJhnhOaYNGFJnd7Xob/JYz9urMwA4LMRwYAuRro7hKbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBlN1HJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABESqRCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GGkLFa658263
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIrpq3/8QkUhcz1s8YKvnA98tKnGMnTBrRkSl9CK85g=; b=TBlN1HJaY96Sz/4j
	fE7xMR4pcwIIKYTd9EEmy53O6RLoAtm9rXeO0XRDi1jrOYXxjESmLnv6H274+zne
	XYICsfl1yRKj2PeIY/P47yJA7STcv1PW8whkvuroIYEakY63XB+OOFNDiU4IIfoA
	Jd/ytocDyri2HQSO8aBlZbayCO6p3P6VignH8J0m5UmGWVQqoz+9F4gbHf+H54Dg
	lYUeWWevJ22KrGzSe/fks799QyLmc/pJW3xaXsPnaQQK+kp7N5ySLk0qXHmZV2xX
	dK4Zm+VxpugySeUtue7L8QLPDuNeqivaGEj0buzirJazJgv74dtJvaOVxxJ0fKwC
	UsOsXA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g31rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:16:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-576008a385bso474265e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030986; x=1779635786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIrpq3/8QkUhcz1s8YKvnA98tKnGMnTBrRkSl9CK85g=;
        b=ABESqRCiWJ10su1KShO9YthmM0zr0obX2s/lvnQSbm0CXUwo47f+Q6Za2rtjx1iHHC
         sohSd5X7CdADN8lkb0OTu24+Wsl6H0rCcMwJ+PsRozdo/wJaewxBPxhK8t47LTOZv/59
         zxH9sm5a7XaLVdptyzfnyFDE74IfY93sxbmvomQ1EEOyRnscK0xd/btdXsurIoUg01hK
         DEFMMMaS3K2LphGDJ8kuaubPFQuv807MfxaGpr6a2m+J9LuGuCWsfPkjBwmyfqqnXles
         v7zvQvAohzaDgKrnlI2+gadrHqcrjRUkpqCl6mb+vX7UtjbBoo9nZQn8pjihhogdkVCQ
         TPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030986; x=1779635786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIrpq3/8QkUhcz1s8YKvnA98tKnGMnTBrRkSl9CK85g=;
        b=MNckcPm6mNesKxHBrdGsOuqSlOGVormCbr0Nx0QtORlM9a7/jkUyaNu2CNfsxTZ+qv
         lUja3ZtER5XpwtOR/FKKNoPzXY1UBUUdYDftDQ5oZmP8BlE69CBTXxpVtXF9JopNJqGM
         wFmeQG2RZqiJGkyF5h+193iSydwIAaFq2zU7lO+GZ1VsWU4lSQml087Fxg1P8ZqScway
         K1uRGKlegvWsDzjiiBtN91xS954J+XFm/QIdmzB9M85AKPS2pjRY/EfPOeBiHn53JjT+
         G5+UnudnTQ4ErH5eWQE0BpLHqX76LMBoFxq300dxGkfj7SVkc1Vv5vYKlWngRA1yJWXK
         01PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+T50bUKphDQWeuPJKU1SqXsopOVoRk7PSLo7d5aK7lG9LKU5ofZrTx2/2viUR0UrkbJWtHvOwFXO5AeIbs@vger.kernel.org
X-Gm-Message-State: AOJu0YyOI8C23BS4QkItWlZH2I7Gcu5/m+MsulPMfK1vq7nMx/Wj96ao
	927HoftVd96n+c8d+GYxeHaoshR7ElJV5QtrMZPIfvE5o9X4IBByG6aFkdKMf2kioPRt4nMF5QL
	pqisKryZH2b3MujB0W3n1T3ALsLCNbXYrl4qhxASY/W0IllTPGYIcYrgASB4ez+6ShKOd8fo06N
	J4Wtw=
X-Gm-Gg: Acq92OFgQ7x+nA8jWUypwjihGzutwS1hsCICQCtXaPU+2PIAzlnFXN8+NmccxiImZF3
	FMxjtPQiGmKslRcq+kteNBxAg035DcqfSn5/Vil1ahNfF0gAzvwaNdomPB5FqswH7E62RZ2RTWA
	GjFUcuT5gjnP3r9Vd8wwPdST77y13dAWhqUD0Co5c6HAPN1UkoppdbyGGRFjAENOVEwWJPDPoqw
	0TWv+CgakHwDSASPG++BEui07QoMuCfeVdfpZiYswjH+u2QPtLk9IEDEa4Dw1ANfVYHbH+5r77F
	BCxXWkEC5VKOE+fqJTjqkmIGlfKIJyXGSmvVe37bcjjUq6sC3/zC2jHg03yHmDnPt3VXYTfzSIP
	6LIbDbA3zxia/XIDtAh8zfQkJIlIjTh2ecklB5SG4UwYq8sanMRoytnCujrzGP7nrVJWrH0zqek
	F1pVMnStQY
X-Received: by 2002:a05:6122:a21:b0:575:38d3:7c8a with SMTP id 71dfb90a1353d-5760be37410mr5778837e0c.2.1779030985860;
        Sun, 17 May 2026 08:16:25 -0700 (PDT)
X-Received: by 2002:a05:6122:a21:b0:575:38d3:7c8a with SMTP id 71dfb90a1353d-5760be37410mr5778829e0c.2.1779030985391;
        Sun, 17 May 2026 08:16:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5821fsm60048815e9.14.2026.05.17.08.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:16:24 -0700 (PDT)
Message-ID: <14f6dcce-70d5-4276-a228-f26f3770d805@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260514113643.1954111-1-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260514113643.1954111-1-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2NSBTYWx0ZWRfXwwOERCW2e1jx
 n3O9UxUhu7k0gJAZA84nlE1GrHzkyzKmoHK0bVzBWh4dT4rl2wcMZecdYv/AspgUdAoB/4a60BG
 oqaUGj86QWJ3iyOcWnFRA6ymv2zQTyB4Fwa2s2cAapXFwadu7U26QhgC18nuU/fQKIBCImAyzi2
 UO78wXbmAMephzLUQ27Cj5F8t3mkgPGb4tr/mTu7voKesHU92WUPeVbxz/DpSz0EL7FbjrxiyOq
 26goeGCdcmkXtnP47FbIF4JO6TkwmNB6SdzLinQI+Tlr6+lK2siEXCLKlbfwH/SBYwIi0+FH+t8
 UsCYqL6d55KRCSjskcyfWRyE3alFX8T0cBRUQTiz+9DmkBKpkN1+0NWEEScEW3I06qMTIlBO8mn
 CA3jFA9BfBTCz4mKrcnNgXE47mIOduVClZqspqRmO0n6OtbXoLpxnEV4LBUM2qnG+GKNlVp1APv
 hKRWTOzolaQPYZQrUig==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a09dbca cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6AAB0q3k6GC94sigMGcA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: QtLj7P4yyKPD9J9nL88Eg_t0qvBbnmSg
X-Proofpoint-ORIG-GUID: QtLj7P4yyKPD9J9nL88Eg_t0qvBbnmSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170165
X-Rspamd-Queue-Id: AAE9D561F35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108047-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 13:36, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts yields a valid sample, a stable fallback
> value must be returned: if the first and second samples match, the second
> value is returned;otherwise, if the second and third samples match, the
> third value is returned;if neither pair matches, -EAGAIN is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ---

Applied, thanks


