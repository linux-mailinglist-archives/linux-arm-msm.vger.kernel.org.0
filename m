Return-Path: <linux-arm-msm+bounces-101266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGHzLRrczGmEXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:49:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0C377139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C08300C921
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386263B2FD6;
	Wed,  1 Apr 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfWyphj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtV6NOxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4823391E60
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032857; cv=none; b=Y0/t8fgTQQqBN/MiOUvxYvlez3VhtLbgD/3l8em93GxNuWg588jICgomwQ8x1SVaP70feWEv3on9dN7GxQxsnoPVqV0YdkQyMc2BFuE8UYtgDLOdACESiChLxkL+aqIj8Un9zAeB+YJcITSxafiJ93xi1qrgw0FglXEg0xYaIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032857; c=relaxed/simple;
	bh=8+2pinsmZIZHrgZafWj0M08Rc+oW8YYdi2c9xhS1fXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWA/mYji55aIWqa18mJaKdUgotDIB7HcrWRnv+JV8aFv0itQYQwU0FowNQkP0I+SQM0u92JYXtYhX4T05JgR+gwTZinJOO7QT2mdjVZCSjtVJObQvKc0VBQA7gBqRuHuhVAN5HYCzNNjkFjgu0lmlc63uVbDnq0NeH434uxpv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfWyphj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtV6NOxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317BCgH719536
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=; b=AfWyphj5jGRKJdU2
	mIUbel0nlnEeEn9iIhQxbQ8Ti4Ondjh2ic3+AY4Uxt83fAeYuoGriKN+LYiiWSrK
	mXtnfyddpHqjsWBv/sMpRMfXIG6zjc9qYSt2pi7nU2If+qF1Qy4YuPzswFSSuJTf
	7Onu2mNftjqFrzpPss9pQehWhyPTncW6EQx/pkFm1B6AbTZxtHyrxhUlwidb6YJF
	tbPLAwl2Uau+ajY9fDfJdv2BEWFiFnq7ns/AhgWjCOE9st983BdZZL1ozdzLqRQe
	CRLLnzRodzZWPyxrOqPwo+VlTdSVouWy0yHjrywM7StnXfdBj6x8400O+6CxkMK1
	ygp1hg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsu3mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:40:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f48d009c8so13620616d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775032847; x=1775637647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=;
        b=JtV6NOxTT99pcoucBwGZH5USOYnEzHYlqp66l9AVLbAXLKvmepzb0bF2DS2WAo0ME5
         gus1ZEJEJ61bBuLqLuWw9AtpD0GVEVYvvwjXtVb3zU2cmBbZAhELefxxMOgfUdXbtQ6y
         hhllyDB1IRRcGn91JKHhQYepIgrWE3kSdT2Mr7pJll3GIdRACLIpE8Mh5adv7K44Frv2
         eiI+Tgv5e4UTZ2gLmCBaN+BDVZF1V5HNCQC/wlxc8gp4k7kX/3Xu61Lwi5nZS/LmT18v
         SHM0TpbBDSL7JvkWP0+4J8wFHznClY99MN8jB5Mtau7bE3FfZofugSf8zX305TGGnnnR
         VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032847; x=1775637647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=;
        b=dHzW1SkqOtR0MiQ/joxk0aRTKKvjsNg2Btl8q+cfa4blOOXvXHMwC/xDq0knH05NiB
         L+ACX3Q07INSiUbhCB4YUXx090xyE5wNDsCWrjWrjnSxabApely1S98+/307iPr6pjJc
         C5uTrm9hzWtQzSr25O9YwioubIDn2upILr/mfAL/vCnfrZ21XVL4Dt9N4OyBxA2LBwcJ
         eTJEiD3y4KcHEHATGxpHz8NzsVbYuPH7PuLXlgpXOnqR0d4omFutqO/odUL4oXuT8SWe
         QpJAUMDNwvgkAo1l8xJfBF1D8BeuM58cGQPj4A7Yfw/6IGdWoWNQrW6q1cFntTJ2Pjw3
         +j5w==
X-Forwarded-Encrypted: i=1; AJvYcCXBDiDono8Zlc9ZTZbDvkb5ObbW6pXA1fcjk5axY/+OpMhSZBCAVk1cMaXgkh85IQIb6DO6jXUGif7vzIAC@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMcVaS3rlm1yF1nVvwwBogc/XIBpFw2tafQud3G4ZuWzqz9aS
	xgCgHNRxrFTl4v421zcGWGgDczT0fbLvCppOEdtYPrhCSFpANDbBmrS70KO7WRWbGRWM/gqB6JC
	3Oz0zsH4pDW2y508nvxhXv+iosuXmuBL7/R3CGrYeTJeXscFyG3KgOqAG650WmUggGI40
X-Gm-Gg: ATEYQzxlcSq1LGQMiJcWzA89+HYUWl0wZLFMBQFSh7f41lRng/s9oTz3ZFirdqNpGbZ
	h72eBViIIaDCQ/oUknh+dTAIvm4BX1WRai4OAdJWO0Hm9tt+FztsTTsOmIOAUIEVklqMz8XxJ5e
	Cp+oZsmc68JxYDiSKPSpMK3IS5WV/EoKJ4MpAu/jReUIUaoSiPt6IOL53v7QrREQxyWo+8VuPlA
	AE77hcrPioq8DaAlKEf3R8Vb3/HOeejtkygkFTxTwdrpI4zw/HYOJBCfrc/GhRa5eq2EfOlBzIX
	deVvPFZ2gaAPIBB17E+utIsxakbW3+dqmu+bC0OcpfsR8zdZkzoD6erwr85VbJZuPee0IBVZoBc
	sCNw/dJpbccY6798bXQMl6o/iltV2eMF2EkEVQfaNoBdmueNqy5lDQQJrvXTOWyGGxWNhmGqMgj
	n3iy8=
X-Received: by 2002:a05:6214:4012:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-8a438dd0481mr28226036d6.3.1775032847039;
        Wed, 01 Apr 2026 01:40:47 -0700 (PDT)
X-Received: by 2002:a05:6214:4012:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-8a438dd0481mr28225896d6.3.1775032846552;
        Wed, 01 Apr 2026 01:40:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5dddsm506284866b.35.2026.04.01.01.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:40:45 -0700 (PDT)
Message-ID: <e1d05708-a812-4fa6-8985-ff6995350da9@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:40:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/msm/adreno: rename llc_mmio to cx_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-2-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-2-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NyBTYWx0ZWRfX2QKRwfa0pIQk
 lT15LfF3j9QWur/8bSxF4Xosmlm5SYxiQst/xnYhfo8f7EwOLfHP8dzGpPcvuJa80KRwkUCn3Z7
 TAgZDPctSEB1q5YJYl1cDJJLL1C84y59a1u2bz6wpb2BIoNN2bixrWw6zD4kMIhfpun9rzhP+5M
 UA0jkG0BvleR9KMiufAjIneNp0SG/1SghzxVAxH16KlhYrJ13HkR8Agu64lQomlGP6TFqZvDKx+
 oQhJYqFKBPhYZgLdcuyGVBI9dpRfguvpWwwqAqIDIxhlR5HBrmdxU6p2sGIwphfP+OqHzxV09zm
 1G1C1SklAijTybaDzhJgOMo6e40oDtllpM8cEXrsCVYUgZkzgClX7sknwek5+jzqwN190MolXXC
 wjRQ08aDQVLSiU3tEFGotn+ykggC8t+SScEaAFMykvchHV8a4/ozWYSxjmSZjHpksvAgUYxNWff
 orrJaNvmywYudM1DDxQ==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69ccda0f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: srm73jo_MklZl0sYSVib3XDZNLBazV_n
X-Proofpoint-GUID: srm73jo_MklZl0sYSVib3XDZNLBazV_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101266-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,pm.me:email];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AC0C377139
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx for use in a follow up change
> that decouples this from LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

I think this would be better named 'cx_misc', but maybe Akhil or Rob have
a preference.

(VDD_)CX is name of the power rail that powers most non-multimedia parts
of the SoC and in the Adreno team's lingo that roughly refers to
GPU-adjacent HW that does not need the VDD_GX ("Graphics") rail to be on

CX_MISC is a specific region within the GPUSS

Konrad

