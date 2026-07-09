Return-Path: <linux-arm-msm+bounces-118091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gub5MOTyT2r3qwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:13:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE6734D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:13:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YVmUgrwN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WDaeyeLN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F53C30215A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2DD38E8C6;
	Thu,  9 Jul 2026 19:13:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885A224AFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:13:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624412; cv=none; b=EY4qupPy80BHYQ2vfNkFsO2Q+Xqka+7/HJtK237YsoPPi1VqDD9QBWbVKjYIUvCzybp9iLIFq9s9ibXQJ86SVkSbLHtA9JHuGlpziRRq0ij6TT7SVSx8SixDeRYQSvCi1NoENWGOp6jgWxGaKVH8M9vDzYjWTYo/afVR/kM4HOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624412; c=relaxed/simple;
	bh=97jCrfJLul7kc105qG9+OBG9JEfnJOKqogY4DP44QCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFCOB4X41g/gXK4OSXuSWZkAWC5dxl2D55TzOF5/9WWOnZJnfbRbR7KVRkStVYFwdeG4QaxdFXKE5GFUK8YPkzJuA8K0dxjg1mBoF0APZeEwpqOEqn+T0Qxi74ty7gYqSnkFdJ6R5qv7XGgDxo7YbINduz045+p1NYCXSYPkpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVmUgrwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDaeyeLN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXSN62330204
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=; b=YVmUgrwNnfs5PiOP
	xVFJ+HLcHPcQzDiBLtL5JLLhOBBI3ef8L/ZUJhvcvpxV1hYIta22f8DSSRBncqzu
	JvAOXIp31N47AmnsygndA5oWLS+WI8EQv8osBcvo6NTlk7E5fqXkWAWyAdbadji0
	ONX/xMAk0wHhMinxZuhejIbE9J4BFODILamS/mwvJjeb+UjwlxIj+EnWOvBMXCjD
	RA/0w2NQ5ZU4At/d724ZsyQZ5RIPlRUpSwuJjMeCtymfqsTf9+IyTTwJwQQ6w6pB
	OmrOHktk4Qgo8jid+3Kifc9wozrVwNBoKdwG9aErCkbrNUcNTBMRfNkEyMm3Vwz2
	yeHwMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24ruav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:13:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so59461cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624408; x=1784229208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=WDaeyeLNeL67hGG3AHjTFbvs4yaLnO8HJ2SdG8FazFIbI2XYaZm9WOhB3qDzoDPq7G
         2s9UurA0pow3XYVx42jO5uFN5NEZjnUCmRVD+Dr4iY712AayiZjUipnr0rMA+TBjwKw2
         r8Vg0Pv2j5io9yFPi7GAQRi5Az6d/oNNFT70SHbj64fhbKHRXmE/IM3skmZLejMs1QFf
         Ir+oz2uMLxzUQMVjmgE7L3yaMV7+JZL8v0K3SR3f/0pf27PeZepr2tb8xJt9puDCnNX5
         CRpM+W1jI2vdEEF6/I/bMiBf9+AsopmZzh5aum0UpGXR/bpJQBh2jbt3rAokoqSFcP7I
         JQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624408; x=1784229208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=jZthQwgaanXx3YRIPhl2VtbshZGImmrhrnOpNfNtxGLy54U95rh1Nn5FKkPhtgD9uV
         vQ3L9KUIx01pE57ueVo/nHxXZWoTS7iPhnFjL+9kdvu9ZoRn3tAC9ypOMZ7Pt5bCAtOY
         OL7nxdJ1CCrKWtKVgkQoueiKZgde4WhZgssJmeei/Vkcs8g/yhVjDIxnXuUcsM+W49fL
         QQ4qFcOfHNdD+Rgv0WPPuLZ2TndvIl6feoIUeh++fVO/9obT2hpbhdPAcmk9XGIKKNZe
         ImR8aX91WgepP1DyuUSi2YJzlhQ4NzQkG/wWwZNKAO6OV44SijqBzszbH0NgNIIzHJq7
         A5VA==
X-Forwarded-Encrypted: i=1; AHgh+RoBlrc9FbLftjvgrdq9YinyA1s1k535bLzAICMn/X6Z6RweRFQbI1Sh2X4wgXRPO+wi7he8wOkhy6AHQYod@vger.kernel.org
X-Gm-Message-State: AOJu0YyefzZnBmOGVNWnBnp2czhbSHW5ZJkifXa0ZVzU1dOns3PZEtpY
	7SsQDCPkDm6rF/UE3P0P0bWyUQ+zttWHKtA8aru6JCRZ4mR5Ru/QYkMR52j6D++jF6d1OpQtoPD
	6Ci5NdBHL6KcQBT7I4dQS2fxMe9m2RtHU8Jo1bacmnm8EniJWRd1Wv//caU4dMXdUU6hA
X-Gm-Gg: AfdE7cks/LpXwzt17mmB8e/aoJebXj2qA2XO8jHu/Z0+ZX//XUvNBkBK3QJdGIOeUtd
	POG97OMbVYabPQZWbJmdQPZIdhuRa9GGrF5CIlNxcl1FTa4m/bIPSg60iCeGTV5sN5Fh4kH+7EF
	alYcEzAZhD9Bu/xcC5eN7nXW3H6B/PWVKrOh8W/5cjjkSlOvL4vO0I4Xjqzk+Wj0WUNB1RunK6t
	ipGLyg+04rrLjFL8e6ybghfDUyjOzWkb46kmIz4nT2del0ZdCMuzPXG5rpyJNEdVyHiR6VMBp0p
	YpSxakmXF1xqV+bLyF4oBOk9e6uFsn2fPhAIOFZ8hHgvYoYNTu+8STQlmO0EVpXd1/F5tcUS0uA
	AAmkQkHLgnQKqpuesaSebiDKemcQM/bXKvm0=
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47417391cf.0.1783624408395;
        Thu, 09 Jul 2026 12:13:28 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47416731cf.0.1783624407847;
        Thu, 09 Jul 2026 12:13:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm277444666b.39.2026.07.09.12.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:26 -0700 (PDT)
Message-ID: <b9c41d2c-b036-4d58-8cd2-da94ab6b9ca0@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ru_7zo09WekM0TwksO2wdM4E7c48ZQuj
X-Proofpoint-ORIG-GUID: Ru_7zo09WekM0TwksO2wdM4E7c48ZQuj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX8Cn5kEPI0lsV
 WmTco2S/cjffjnJsw+gmL5pY4w2/OQMbnW9EKrAHdDM7ImrVzCUSHPuczWILpielUNMJCN++Co3
 Y4X2PE3MrtTynoy6vr90ssrYqi8RUMg=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4ff2d9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX/NGmEJc4rZA4
 TZq3gLPCxU8eJ6sw+xbXgXqr4iWJtOuegLGmXQrAyiWOLQ1p60boEwqG97u7VKBe8PBMQTu1gnS
 RGQW3gknrWVZZi5Y3XF5yjP5Q4087Yl6jtNOGLTh4Utr5/Gzy0nlf5dFj03BvzlxG2pL3hsNaEl
 nb3v984LF37KL1vSbWVchBBYfkfxLo2N/6DzeBRj0gMMRjwqALnHUOZVIsrtlczuOY9l4H9+TAh
 XP6r8A6DYZY2KX5VsmiK9d1mp1t4NrCGFQP8BJGYe5kIPbJs/6GLKPfYKcYBVJdx/Te7DfgV3Mf
 biXh0EVp4RxytPSH/KmUAecZeMiVWkjOlwxYYLd1C6cahT4W08ETu5U/rjP8uPiOcvFH7skWKnD
 YR2DeHUuoh4AI616Z/4mGf8wOz5Hl0wwvulcx3D5pF34ukf+FAkq9EK0vT47/GxmUwHsXXf9/M2
 Y48F8bCfgs2EZwTuSEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 7DFE6734D0D

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra EVK boards.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


