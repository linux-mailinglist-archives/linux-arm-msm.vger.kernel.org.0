Return-Path: <linux-arm-msm+bounces-117243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3NElOiXRTGrOqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:12:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA171A285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VpA58R8J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YF1tcoYR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1479300D75D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9413DA7F5;
	Tue,  7 Jul 2026 10:12:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865083D88E3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:12:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419171; cv=none; b=kEmqtDpiJ6KG1pOKb7fwkVwKmlcs8+TVCvwsEeN0i+hDjL3FHf7PZOQEku+Dk/eGqgebYkPSohMhpb1keL33s60/07PoVpXFHpnZUU6WaV7ulm8O9IsSIKU9uFm5tvZSh4TS1y/xJZTT8LiJVvlqGm9JML79rfOa8Ryxaa08Drs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419171; c=relaxed/simple;
	bh=ESxyEB/tDsAO+oi+pSDFTqjZIxjuG8H3dDWNdmAQcac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNgJBDv9cWNTnjkzVJtTgoTjF2l0K0YgL7v8wxp9FUJG4cgSc9ZD9pVHdavIcuHx25truAWFteAeax1Z2LRyYFlc3XIAWRoS75hU7Ayjp/KdHWoAnfv+vMZK0BJZ66qUsbCilMRYKA//GNLASM4iaEGQLkvy7Ec8QXJQ7ugR2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpA58R8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YF1tcoYR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwTo3070328
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=; b=VpA58R8JiSlVbUdY
	S6MHesUXfkwIBo3HzMez6adaN2gWzDQNMFVx+ZUl6tnES3W6Tj7pt6rjlanvjnT2
	o/GnGIDyN1LLdP8ZAQjUn5H9g+jqKQbT/8WiEiA5LlB8OHGlELSDOY7sXwVeBuxM
	4EIFlwi4NOfosfmkcncRQYCNxqXSP+S3tGmodsagdfWod+a+tOVUPuh34/QB30AE
	Svx22pQiSPcvtll2QpJgf6rGYIdQGtYXyJ1ve+H4FGtlD5ZTHp/zXAGmt8JO4v3a
	sa++8xf7Ka1c5Cwq8TOl+nzZsUl2njze64TKgSiVxSwg5mWPewNTIrc0pgltRBFb
	Q3pCtw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hf3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:12:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so12899021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419169; x=1784023969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=YF1tcoYRDmSD7y5p5GR9Zjb5ama3KShagHmOjhAL2KX1slw3sOx5Ny6Swo78rrdRNQ
         DBhU9WrxYM30PvDIOPQ6fhXq2UnomA79ybIVelILpwkOvdFEw5OJL3ldKQ0jDUIIbdfW
         ACc0xtx4pDVVFDGb04fRrhxvpY/uYPgGvnD1R+MqtF8aYf19YdtfNaJTKZO9kdbE53S8
         tk3qCVgWTTFZAf2F8ch1lsm3Z97DH3LaPMRuvU1VnUjRF3ZaQTcNv1Cgkugqbw/9T6Io
         jUaRmCSMVqoXjxnPm89GqQpkYvIKajW2iUuKl6CcwVtssFYCir1m6RYXxngky5KlTXID
         uZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419169; x=1784023969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=nbuaoLINSimiPy0QgIFCHgzISXwS4SAMvD5eKBxfWZNnAApZc1I5NnbZ0taJkFmL2s
         acQIOLvjEw0+poJDjYRCH5PcW2lNunIlQN1RxMMPOeVswIuGrgHYL3eHxuVxtvl6t8/r
         soYSeG0RgftXQX+f9Yvq9RzlY+ssgACMMR1bxLoE7vjzTN4Ra/YHFIgaAG7vAiuqrYaI
         jhu4oP0B5Ph1ldEpFBIbK3UnGuVBH6v6I8C6U872EKhI+t5O1OTJcxCmrLwfO7b0BF63
         gJIvPOeBW6Q2e3Bv+HMOc2jfmleJw13CF3s87QfPPyS/p61LSt/PbORW9fe/g9XB1tJL
         GbAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaMIQ29drfWs2REKSvpvcAdJyMpz2Ck5qcnPwenJ3CrU+C2MJ3SHYEHb2V8JB+ocWjmdH1TwShAjCzf+pR@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQMDFb5ayq0wLJK9eCB/RLL9fdvgFFdwQcL+M3TkaRHTMRHLg
	6gA6dP/GrON13g2vnK2HoBRpbK3yby63Q+PxhhP2vg9gFAp/d9seAalSXvhQm3c0KcNjxcpMoMb
	is/b0/zkHWzajDs5kSHiIMz7Q9l6lEXjnS3DU1ZEcigS84fc0H2ND07RrM/e56mJljF3o
X-Gm-Gg: AfdE7cnudkIm8dP/In5lONUtBwY1l7qvFpwxNGGv4iKO92s06AksoAY0lwH8i/5acUC
	rTZl1yLM9PmLZ+zwTMz6/4f6SsRMLcuCJPVpOEAHXfiTbFAeP+cI2OS/nMmvGyLPqIFZXMvgH30
	+eypTOCmYovrMLppPBARZnmE/RqfKq/hB67AIyDUpt2HhbsuFMAMVpg6AAmLvYtl4UFJvEq9I2f
	PsQGc0XW0J1qP7GCLZUM87pqn74MrHL5FtTEnE3oLjpXKqEHL6sgI5qGmFMYertUrIiDZi4z1cU
	4U4PIkDSY2Df9XXW09W5FK3lbbTeYU/L2g0InxOQ4QGBgEgg+ePc0PUVchlHHBKILAliRhr0TGj
	8opJGu8FlA+HjanaN4AKK90t3btFOQJPBe4Q=
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269691cf.6.1783419168926;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269231cf.6.1783419168432;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057bfsm98437966b.43.2026.07.07.03.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:12:47 -0700 (PDT)
Message-ID: <36f4507c-2524-4a9a-b38a-7d061d13cd4d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:12:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: Add GPU support for Kaanapali
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
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
 <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX7G5KO4FiLzKX
 5HyP+tSJbIgsFlpQs/DArZBLagIzWQa9WzBgBtYxpWfKjfyulqV41ej4BXe0MzRzf2TFjVGgPgI
 hefiJtPNxdaQ58OhA7q9oLe8fk99IcHFvBYajLb7RDCavdTARg5XH5PKqANXOuQjTCbtBsihmcf
 Lc6Xdnw4YELCGzlScpWSbqi+ircvZoNnRV7xPJ35NKcPRSORK+qDg/7DLMQ/BZsnFxLGx/moz3p
 9czmNmRdQau5VQ7pxES6urzPfukk6QMpR4DqjjwWl7a1P2yWvUVPS/f1m1bWa2qy/tF1oS28WzY
 FB0kvkvrEul8aMKxmwYrA4II8KPElBwLgeZgdSmFWf6QvtHKYG01cCqsnhZiBS/6hp0yY10wlIg
 jFGls+pkdG4ns4aZjhLaPmSv+Y3DJ6bffFNj4+nCZdIzvcaBoJquVbXXEH4+WYJeSVanVxuQATp
 7cxcuw7HZ+rRNTPjXrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX4SCjQy6Ffmv9
 RjVlUOUh6cFxK/E0hupFu5GVE1WrQ5ELy9r/PFEAAX32JXwo7UcuyqTVWTIMV+iXmkLF7Vlmm6E
 hZO/18JMCSo9zMnwb0OtofWMvmArO8g=
X-Proofpoint-GUID: -Io7t-Rf23pjGnpx-TUjUBeuPjtiNc7c
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cd121 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -Io7t-Rf23pjGnpx-TUjUBeuPjtiNc7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79BA171A285

On 7/6/26 11:40 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

