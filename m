Return-Path: <linux-arm-msm+bounces-102226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M8iFSta1Wmu4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:25:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B33B37C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AFAC305F774
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E6022083;
	Tue,  7 Apr 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xz6iU7x7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlW+wuLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF7344020
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589766; cv=none; b=OS0cMBCteqoATMZ+fEPaVIQGiGt0jPR5vgR06A1HleHcH9JVkYMxszorhiEzI8Brg3/AKUkHxUP5s7o/1K+HR3WiGavj+jBCpo8QCK+P3jjXCrT46seiB6E7KRb657Lvt6Ix8aSBoakqjy+Qg0SQ2lg3RhtecLaNUvxvZ8a2030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589766; c=relaxed/simple;
	bh=CpOMVXB6kI6z3aScP5AmN5971I2kjgL149En9f4FyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHfI2/Dkmlqj8q9wBRDvXNZAzKGYBhIvn8Alcbs8xKGb9oJg1EoLEGbkBzXePCtMdcsfp85ecdSkAjEig3bD0ST5p/VmuCw49gLtSL7mkb6qThLZ229kxHOn6R4Y/ZS+YU706k+YnLfh+r1Ajh0sw5m6vbWUd4zbzk1j/wZmpIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xz6iU7x7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlW+wuLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CuOTj2009226
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=; b=Xz6iU7x7Mm+f+JZR
	vzAvYj8qZSGTgM0Fp/XB/3GSWPWNIa3HJVQP4PKrWxYEEIxHcssuDItIsZxIKFe4
	IHltDXSRqCutXgXCAfB/O025ZiUWik0P9peLu5I3eU777y8U2W6xfCnAOusGq2Vg
	zCbvqltzNCSTF0ts8QkvmyHOBBn2VsZ9P0Q1Zu63rVETQuKIzpsP/7MtHwjgG9Bv
	AFhnWpXt0xT38UcrOiuLPoUFR2bLNQkJ+r27DmqO1/PmmaDnnDkvf9W5VqdOhy72
	3vNbd/mwzSzxNo0ICX1T3dWt4p8Kb0Mhw25BAImiccPGAgN3XePargDUFZ8xCx0t
	GIpv1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrv9vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:22:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso80363845ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589762; x=1776194562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=;
        b=JlW+wuLmED3d0avbkBt6uh/NeYfVp9m4prOrfIf7qT+YUzKhxyKRUOYZpteCdmEKam
         uTkDmsX0NpCKgw8coLPpYkaSuEzigeiRxPkrDrUN8Zwba879dg+2k+65ZdHKiRtsh4pE
         OFH3KPIei/Yk71gas+hXC2v1e14DSpKeSSoAdOIEorHuvTRZtEGlSVs+DoKckk82UmBJ
         EQ9QZ/vacvdZUrrY1s8Vq3vEWDC14fdG5YG/g36Adc8DLT+d3rxvBteacpouyk9JXvNN
         r9WFfdJKJqm1LSoCVZ7MNm1PTT+RlnPvJM8OusrhlKCOZGYcMLRZWFhubAQu0d8ULdvf
         1qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589762; x=1776194562;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=;
        b=Ck9rA2f1uETbOxdxcIxos10uNakOlnYzGanOQIvDZQAe0IexbiwFqtTbh93QBdMKCy
         VfHSll69IWa+We55pJtjY0EDkfzHbYEm1RnZ+Q7PMSqFdORwOp8PPKJN9NkXeVCW1gCb
         qfrBBVaQWYqrQwpRLwBPJvWg2LOducImX2HFRvHEN55veOjvNtw6vMgJ+QskBtqFHyZ5
         vRJy6KExfRiXFnAomc/QvoZW8IGNrmzRDzNfzwGUWtNQphLrz/6wOtMRcgtVyUBN4LUf
         b8gSOnWSxCjm0sWGwTndioK69bWFEBq7F8Pwfw7E9Z7CVevpn6x2xxDQ7+3OqR+U9sdk
         vdrQ==
X-Gm-Message-State: AOJu0Yzq0qg0VrxgVl35NKuotNHQkEkGEFBektJOIe7l1uE9k7d7hrFz
	ox0zG3DpzHB6UHMLBvwnw9COidTr/ozvEnWLgSeMlU+br7aCzary+9TRyM+r00n/W8XxTZ2UlGj
	wXf8x0JQo3ynVJfc1pvloin65UAPKdlTRK/vgnwm1lAXomCiReS1Men3JbFmHLMi6uZfi
X-Gm-Gg: AeBDieu7GtRbu08cEZtaZQbfMnb6X5t9AmIsLFocZXiGhAe6v41jC8wpiZdmDYJWmes
	JwJJ/fHPU5RNEC36AGGSdRh0JKcUrYhc/EoabzsjwqUFTL9YkyYEnmhsqb7JeIdAlzAV9Drpj8s
	K1zWslf7C1k4xM+Yu3F4E5UJOE42OgVNr016fhqn/AaxRQNtCzwRFwzG3Ps3bum+e33m29TwjOf
	8EVTq/wVoQ8YzRYF9+mWJW8k2Bvom7J0P39x+sEAZCwjkuOB3VJN8Eu/Nml68EGyjKV2TOYXnKU
	uVzHf520mXxeNOe9vURkpuOrcfBTMR4fLPtIi/KYTgYHV9+HSeOpAnU0bVCsnSo/5hW0mgXLzcX
	m+GesqjVEx/+jH3wVwf6AdIj1O6ksq0TVSMkAlgcl9ZKtpg==
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr187169895ad.32.1775589761430;
        Tue, 07 Apr 2026 12:22:41 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr187169615ad.32.1775589760938;
        Tue, 07 Apr 2026 12:22:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3a0fsm238836465ad.59.2026.04.07.12.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:22:40 -0700 (PDT)
Message-ID: <948dbae1-0d12-423f-9b4d-c28e844d8fd2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:52:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Devicetree support for Glymur GPU
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfX/VyUsPNZdY9p
 FiOqzTeqoFvtmRDCk6zc+k/27Afn/Gvf4m4wZ6HiFfkNXEIHtT8uC2js0abLzA6QgDOAZ9p0swF
 c2BQi1h3bPajm1iGXhUww2EbBD4BuOGOmDQ41O0SKWNAnQxzF5TlanfRcrM6hvdlRaP/vIFOLWN
 0LB3dHSrW1LzE84nLKY4h4K1flwkBJDLo/GZdgHdVSn4lfHXFnUL1mstlE09oPLCt8XQXMMBmnD
 E70nUkUPkLCcda+Zs75xzKjqquvQSDhWwusJZ6EkFItZJeWq0FhIzVKzkm82wDcUIOEJ4z21Bug
 f71oK1xk8/5eo9nQhohThw0qqM6P/VM5OW1phL2Mf+jWLXQClLSfxopAGlosQaCejvKCOchqOIx
 WXm9gc+GrEYjq8esdVLKg2O8HpsW8rLvb8ai8qN94imCby84zChERVw++pdneFGZiCgSDMpzX8L
 OrNSmiOUxFHOiYJFU5Q==
X-Proofpoint-GUID: oyaExC8NpBZdFgIBovWKRvEDRyGuclh0
X-Proofpoint-ORIG-GUID: oyaExC8NpBZdFgIBovWKRvEDRyGuclh0
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d55983 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4ZsNYdiHAHguiUsAXTsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070176
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102226-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B0B33B37C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/5/2026 2:33 AM, Akhil P Oommen wrote:
> This series adds the necessary Device Tree bits to enable GPU support
> on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
> chipsets is based on the new Adreno A8x family of GPUs. It features a new
> slice architecture with 4 slices, significantly higher bandwidth
> throughput compared to mobile counterparts, raytracing support, and the
> highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
> improvements.
> 
> This series includes patches that add GPU SMMU, GPU/GMU support, and a
> patch to enable the GPU/GMU nodes on the CRD. Keen-eyed readers may
> notice that the secure firmware property is missing. This is
> intentional: The Glymur-based laptop platforms generally allow booting
> Linux at EL2 (yay!), which means the zap firmware not required here.
> 
> The series is marked as RFC because an update is required in the
> gxclkctl/drm drivers to properly support the IFPC feature across all A8x
> GPUs. We plan to post a separate series shortly to address this. I prefer
> to merge the DT series after that series is acked, so that we retain the
> flexibility adjust the DT bindings if needed.

Taniya has posted it here:
https://lore.kernel.org/lkml/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com/

-Akhil

> 
> This series is only compile tested on linux-next. But I have cherry-picked
> and verified the functionality on a downstream tree which is pretty close
> to upstream. Also, there is a dtb-check error for the adreno smmu node. I
> will fix that in the next revision.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (3):
>       dt-bindings: display/msm: gpu: Document Adreno X2-185
>       arm64: dts: qcom: Add GPU support for Glymur
>       arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
> 
> Rajendra Nayak (1):
>       arm64: dts: qcom: glymur: Add GPU smmu node
> 
>  .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts            |   8 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi               | 234 +++++++++++++++++++++
>  3 files changed, 243 insertions(+)
> ---
> base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
> change-id: 20260226-glymur-gpu-dt-339e5092606b
> prerequisite-message-id: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
> prerequisite-patch-id: a1fb5b7ee94995a24f6e96d1d2524e710d3a7e60
> prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079
> 
> Best regards,


