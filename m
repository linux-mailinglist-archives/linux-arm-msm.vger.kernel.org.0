Return-Path: <linux-arm-msm+bounces-81600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D037EC5765B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A8FA3B9FA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BCE34F49C;
	Thu, 13 Nov 2025 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjxO0CH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkkRxDXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB434F48F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036582; cv=none; b=qLMNxzQFoFBtrm1Q58WPuc3Ft/Np1txzOzc0lzkBSgFVrJNcUEcmbn7OGmnK+j97GK1Ay9bkMvGcG91NZlfu1Wzul9UYD3d2AyPo+io0m3Khbkn6KW95sm5etGZ8a8EFlp88TKvfQud6HJoQ7cDV2KKZhkQ7ItSOpAGcA2mUT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036582; c=relaxed/simple;
	bh=qN/E6+YlVkEM+xSihEjX8Nat6/Mt4w97aH7S4tAGH1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEmsm1KhRW/+7MNetR9v3v6GhxCTHpGX4Hyxb/Fe2559+/PDyISkDwmmCPWkYgg8Lj8STOPn4qeuQRp1xsOg3689SSh/5QJfyVyoZnZ5gIjQ00+fnKvqknatgpu+DDSEeobF2LE0u+mGCGmkGJ0PxbH6D9sDSecNmuw7d6xxP1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjxO0CH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkkRxDXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5qYDq3768341
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GplvHX5yxJ933q0AmGSwv5z
	wUzQHMR7HZka/BgtTp8=; b=EjxO0CH97Q5YXz86h/exEubfja23O0cpfbonUSFO
	/EcgGBaDegu0X6DGJ0COHg4/Cv9Whk1CLhs50au+g/U68OYvdjxcYC7LRDJ10C7Y
	f/4gtfgZN7C92XuqmFmkUcBwU9m2tAFrbdOOV1rXoz4mAE44i7oGgN6ulNcyb7Mt
	q66lH2BpsdMtxD7wn1BvJKKjaKHlpW9IlRPOV/mfcG9X6d6ayeZNAUG/ZyFFnqiP
	UdsICNQuFKz/CIksK0/8U4hHosXzUZxZKMw3QchC3x+3QITrrMf08zLIsSgcQCtU
	MNNLvmSf631noRe0hvxaCyRjP+8cXcDnfCQpru0hatbOCQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn14uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:23:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede679393aso21632421cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763036579; x=1763641379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
        b=HkkRxDXueWE/5OCpmA/3Y5DxpYXF+tCV62GsqTO41fqKvyYF2JvtCNjdBLwyNbwa5p
         3SVnoim3yj07AU+D2wXUHX76lPzaPLJz7LQgHI2faPy4NfCh1/iF86sI+g1C0DWiIOT2
         9peZ3Ik3j+oz6kXeum+G6ID0PEvIIX8Pt2SSaePDLF+YE5wdgvE/TnpcvvNstrpj0biw
         tXt0ofGhsabFhx0rx6HB3rrnMNtbybpr7e8CMtqthf1OexxFKim9k5UHipwGeGHBlHv6
         /xaIbJbieejKCm73jFb/j4AOUl3v7N30yOr7TrWUOcixQrTyj491wOz2HcCSVBjQTgRz
         xBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036579; x=1763641379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
        b=gzF1kjxkex5cmhHxAoYP+i59OF6XRg4nw4r+pMWWYKurH3amhZ+xe8b9lEnK6y4nW5
         F5pq4vlpn2ZIgoM/xGCozPNiN5pNKJixdavTGDufxQpeE5n3Q1ma9eAyG25ESPKTeXw/
         ujihHmVetJMCAiWlI8abvN1tyRBr+z83zNhtN306QKIccEkViEb1PkyI4QPypPgi+JGW
         qxxhZ2LD7YcnEjioVXHCq/3xaBGo0oIV/gfGuhFvQjpj2NouQcSzQig6k8+iseNbasrI
         Bi8tT6yY5Hga44vZL8qwzEIg1JR6stADrmcUoWsTz4EVWdcVDo+s9xL2S6g+cm2jef5P
         vKSA==
X-Forwarded-Encrypted: i=1; AJvYcCXBvK1P/Ph9DEgpZT1P0HvXO24HNlFKznMI96ivTcB4wYjqqX0b5WjWsnVAiCYpPHiL61x1hyEzrxpYXbtN@vger.kernel.org
X-Gm-Message-State: AOJu0YytQGJrwIj6IK+HB+ZxFBDsAvZkjQ/+oYUJduQGPZnlL4NJF9Y/
	b3dUQBqncbzhBlH+yzX8x/filpfokp3/L1Ubmfzh3b1aYyW9Qf0YJQUYm/HIY5pZvZgMHcen7sH
	3Fq53M1KQ/6wY5xshv9GIWsB4eBbvOKmMJCs7v90Sq0VYTffJuiI+LTO767+2O6SEP2uH
X-Gm-Gg: ASbGncvp0sQmj+8oJvda1/DAFHJ84If7cVD031ITE3OtAaCN8Tr1SbBJfOa2lxNgryl
	SgcuvTN8X2yavzLPRrlGBicCIsZwDowKt1hayav/9UWtlRm0yDpcHLAKOQNhoKx00yj9IzhC01l
	rpXd65i1Im6pn9XhSi454T62fCTLG41hZplBfyJiByTg93VLy0CKPAHc70kubFbFoT0Na8yXIw3
	nyHXkfv6Ky7xtCLNMuVIVE+XQCDkoqggBnOhjVQiXjnXlg05fiVaT0yB8Kzo9XaNlHDM4sHL0BE
	wLajiPKVA4c32M3+qL0XaMnP82T+eakWshhBiNi7TOSFy519uRstpOfRVyxmEzFuZ3Qi5idsLDO
	1WPHbOTPhY+u0ohG4jGi6e+N6PIQ4yP/sTWHt5wNwrhbX5g4gC00ov2VudEfX/uEOBpWO6ywdwB
	2OfEnRtER1XKYr
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4eddba97f18mr79916891cf.0.1763036579319;
        Thu, 13 Nov 2025 04:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYSlJ7Mqnq9Dyf5Mj+nWkiUVIb7DVf2qG0ZIWMq78bytd3X9FzuruWsSqOGP5mq4NeoWsUsw==
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4eddba97f18mr79916231cf.0.1763036578763;
        Thu, 13 Nov 2025 04:22:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b4d70sm363916e87.39.2025.11.13.04.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:22:57 -0800 (PST)
Date: Thu, 13 Nov 2025 14:22:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
Message-ID: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915cda4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LPoitUEaq9Ymm4AzyX8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _gi2CmjwBEvNK1_-3DXq78SUJ3DEGdSt
X-Proofpoint-GUID: _gi2CmjwBEvNK1_-3DXq78SUJ3DEGdSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5MyBTYWx0ZWRfX/UoXBmAaNyEk
 9aUXq3bAqCVwWsfoh5V4Ri7gVM2HzmmgBH6j0bntixbpSySverLsL8O4tgOtu3O5onFzGuHdzfR
 hqeY7z7wOInewXJ3dQRn/9H03cyUZ2RctzhgK1odTEqbSFkp+bJl5/qZqYJdBvb2179GejE0W3c
 7Jic2djxFbPvrwh/vLIlMTxJwru3u3Ja1f6B9lJRukPm0J0NaD1m+WBNrj1dwQ5cuw9cE421r5f
 Fnvbz3HsK45jaw2SpIoLimauyMtC/VF/a+hgm78xD7Xi6phyt1iZmN6fULYaoMeUp/MVPwvuCRh
 QYfCHfFAPf8T7G4f88FuJ2/WvsWCun8580r9kqSs0Ll0/Km6SOMcaAWo8E2lcqeM7XKyNqWgFmd
 6JL/XWuQoOy6G2ZwYA2wGxXkouIS4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130093

On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> >> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> >>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >>>> In A6x family (which is a pretty big one), there are separate
> >>>> adreno_func definitions for each sub-generations. To streamline the
> >>>> identification of the correct struct for a gpu, move it to the
> >>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> index 44df6410bce1..9007a0e82a59 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> >>>
> >>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> >>
> >> Could you point me to the holi's devicetree? Currently I see only a610
> >> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> > 
> > I don't think upstream was ported to SM4350. SM6375 should need the same
> > hook, but I don't know why Konrad didn't enable GPU on that platform.
> 
> I'll try to fire up -next and confirm it hasn't bitrotten.

Maybe then a patch to enable it too?

-- 
With best wishes
Dmitry

