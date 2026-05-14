Return-Path: <linux-arm-msm+bounces-107587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMOTJvfBBWrXawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42992541BA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E75E30098B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968CA3A783E;
	Thu, 14 May 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6BClnKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hywr2G3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB838736B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762227; cv=none; b=nnUEz8lUMTmrj8hugrCne6BmneNHEIrth0GSeGw8kNCkiYPuu77kLh2HKF58eEQd31J9AyDKJ+mjgGvEsH53whi2kJuVKD12Li8OjKzMzJ8jHNmyAt688IEhOeUcJuvsxRzqQqNvxhYP3+Lmj89hcv8dsnRWXL2a5rcDGK8wIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762227; c=relaxed/simple;
	bh=u1axG9TUbf6ZyYlZk8WsNItpw5u5vFUCI5cvB4d7S7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWp9FVF1IGz2suI6SY3wu5ogDoBs2DnHoy3Mgh+h3cO4jb2pWlUNKKIaLUOeHAeeFJ+71TThSK2QRjtbA/lKaHRVSEZOKILhBemz25yPkyG8rNbrMnO4wBfzQyR4IsFgr/J2GV69g1EgtWBGghegAtKvnQ4t5a3pCpyHICmc7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6BClnKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hywr2G3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSFQ2713203
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=; b=o6BClnKN8yNiDEuw
	15R/KC3bxZmX/hC1mXf1z8Dh5s6PM4cmyZrMI4iFZdld2n/t/5ip0XnoJe7IK0GX
	/Ped4LO/MlD30gfNsw3sartjimlpcsF4riH0Ci+x5i609eZ2gLU/7gzp6XqdrY12
	OhZcHgp99BhB8V3uf5PZJUXiUzlKJrJocWX6yVIIXBOatCb49LMnlNL76iv/n+WR
	V8URCkO75sWKLzekMwaXkX/zuA62A5SJm+AWg+JvagfgMIfH7xFoyVQ1X2UOw0NT
	gVZ+lm8GbvFZ9q/n31hEYFfyMkV371Op1xqqTgnwDHV7Kt5VMeMAk2fo4zTYT4NH
	zJf+Qw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v898tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753c3390b3so686091e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762224; x=1779367024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=hywr2G3VkG2ELzuTSa47q7jklWjPPkV3IZL9JYJRVzeqyKQJwUHLelk9Or0NKAWxpQ
         KUOHAkDnbUNBFj503HEj44LAcJKo+5t/991fSY5aEWI7ETyF71UzcBTqSRRXYFUBPiZO
         5uNxsDAXxJhTY+Q7bByoaKbeFy+I5Wfrwl9p7c0oPlIOemwTZxLXoH6jUQv5kvN+cne5
         uUJAtmJEVb4e9EZaFxkrhaL2/bXPlGAHMbEfeLVBTlTOfwlzN7XNfkcwC+Q1Ur5tvizQ
         wV+rc0U5YLLrs9Vgs4Y3+fGYeAspKkmm5lUroy6HpNfrDt1rUK3yF275tXLLCg3OHiPA
         domA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762224; x=1779367024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=q4Hq/g9Q4RjI7Yc7OdGVSKA4pCqwsNXn5fCxmfL1bdbq8GWRZISG4qLE/tnAij99Qx
         1ht8XbUOsh7Pmbx/cDNp/FKSWykzmZjTLHETsbDimK33J0RQoOyhlb1bVJ4mYzdckjNr
         6yA5g1Spx2sE2ybAcNLQuMdb9Rv7rHNpcCn3lWyF6TFcXgSEp7fAuH9tdsRRPm63vyL/
         4GI1xqaX82pnHbxGgHVmGU8osi/wjvJocr/1VZYBLd+rbW89oMnVaQlGlX2JNBGIT/sj
         27UFdOyKPKvf/cbaKrrZx5PkQtagvqHINMI9o1QlObE2ECOGT0cFFHZGRlDaVgAbaTy/
         yldg==
X-Forwarded-Encrypted: i=1; AFNElJ++vrXGkzWPRfZd5NHHoLmqZDyBTxgVYGrFx1hOS7cdP5ZxACG42aOyMR+XHMD1HDsYVmfIlA2qn/0GMmGx@vger.kernel.org
X-Gm-Message-State: AOJu0YzrE79x8VgzCtE4Y7ZPOaWncU5TfOPwZmK0qUgfuF0iyUK4BE6d
	rJbr088De3m+igCGvgUHYUCMD6VojxA/8igrqEqLiSnkIpgJI0JrHHDHazNvBzZ5Sac1Y9CyKFq
	k2Oqom1xwmD1nHSN4z2BupOGNzD2NK3P7PMxT8Bdb+CcVGCeG1rWF07tp3EljtKn62PKa
X-Gm-Gg: Acq92OE31N6RDpUMe3gGaeEVj4GvPfgHcPYAO2Oth86inRf+BNpQtLfXunRRHUSE2ZI
	bI043M8xz4aHsWQ5mQLHdXUYgFWMT6tUYtQo1jWZIUfWUt3alWZIGXQkxbB+PsgMKhltQON74ic
	59nsqj8nEb4R8UFBZiXmMJbKdLCWXiLWJ5EyYtwtbUlxfK179JmlCysSjRrE8cylxrRLpJR125Z
	USVzi+x/DEFFyw2p6itIwqxU8neEwLvHFu2o07E7ulQQV/Zs2AsVfhl53cYZvSjMRjPmkMO02Cy
	vDj+UB7Y+awO5QO44c1hVavfXUUKDcR94qmjciq0wjH/BHYhAWZ8H2RV2yu+KOCMG08SDWk/laI
	KsiUwn6pGSNrAqDg4Xw8CPzj69ByZveRzGJjiSTdZkPQMtiz+idnt4UfU84sF/WFVKCiBu5Tz5m
	LsUF0=
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125970137.8.1778762224461;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125947137.8.1778762224031;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:03 -0700 (PDT)
Message-ID: <6efb980a-1d88-4d22-9ed3-1cb420317b71@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX6O5ZLANq3J7a
 izTji3uWm8Q4NmfZYMSdlI/OmQrtWmEKsxCxPymhwzGPVtTeOrZHDtSJo/DdTxMeBxuJq9QQ9e+
 WsePhxr2kcly/IELiKPKVvsotQqEE8HL9QunUjxH5ONFEEBG0hFbqRE/V0hsHcTM4tOxudgoi6u
 HGOxRu9bTfCT5iQ8YZka8YqWqcxFUWDjbUUWJmNwd1SpYzXUHQjHP3cQyu3jsWxFRDLMP/uV3ez
 m8Hu+uWCmXU/Fzm61Q3HVrfQMTtQiMOSAOeG6/U0hrpph6Q2jEUPtNRWUOtHxZdxoVQQoTYRSQ4
 Mt3ufs5kg7bj81ELi3f0NWOsLHUQyBQFoqWN8smFdyUKU20Q9J0fhRJZ29uSxDr26Zkrnc4Psi1
 bDi0ycLboO2tJTrdDUcLI/mePHDVDtT5ouvAGC83GIsMKg0qycaCkCnvu6Ayh3iwX1/ILh1IWN7
 HQrLoZmaZPCGFRZBpWg==
X-Proofpoint-GUID: X05Z2kJXWVevrrSdAzkLMrYGhgYKtXQ3
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05c1f1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: X05Z2kJXWVevrrSdAzkLMrYGhgYKtXQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140126
X-Rspamd-Queue-Id: 42992541BA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107587-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

