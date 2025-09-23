Return-Path: <linux-arm-msm+bounces-74506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97190B94F93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F877163C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632EE31A7F0;
	Tue, 23 Sep 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UATZU/Ep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D431A54C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615792; cv=none; b=JrdqlWzm05v4OPqPyB4WVXfBgu4iZ4N2E4GTIPXfptiCCTDlkUCkFtzabiERUPC+j9FALdz6mztLKOv4N2ko+Vwrs5+39MXqDsSbVqZwnlSaLxKAikUH9oPRvE8b+poLYKQXsgXx2xRoihpY83Cokt3PAUCl9gPDru5RThoNfCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615792; c=relaxed/simple;
	bh=hZL8cMemp35OvsvtLi/PbzQZ983k0IxZK/KFVRezPOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRun5AgxzvI2InMRUrXZhOFDAYbB2ksK8zKEAgMlwz8sJxK6hgUXxLtot7VfdhQca9nq05BCqPd1aRFOmcqke9oKNg47xpI0E4j0eddgh4jMqAkAk6ZnTuINmPigtV8GVJ4m4E1f4d51D+v3C9o+a5TlmQ/NlUlrEuRTSprraMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UATZU/Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H72o023695
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lHIoF9YFlreh6iJ8DpMNf8z2
	sMgb4aI7tWDoMnOWm5U=; b=UATZU/EpeZ1vemuj47fpIcgU1Xz+7dQoj49/0Yff
	K+e1VhS8Vyiw0VcCzfOBFYxjlE31+AIkYEAuL15/vh99u9NhznHxefweDKMsC0lB
	mjqUg0l7t/3FNzk05EdCxHD2dA59sV2N3Q/MZ77LMMGtr6AItWHMPJqj/soTWtMS
	kckFZs9rjlcXMzFgUVIcM9wXJEJMisodD/1aqnvnjYduhEuSapKlEbJmN/KtM8uH
	ozbSeFfjFAA8xyaDPVL44BfuaDhtJVE82cARAhzilQfePQUiCLkyQ87bSaTIyW+x
	jguOPuo/QLtBaAB2R9DqN5meit2XqhCJBZhiJQYJ7Ngk1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nybj3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:23:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e4e07aa39so86601566d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615788; x=1759220588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHIoF9YFlreh6iJ8DpMNf8z2sMgb4aI7tWDoMnOWm5U=;
        b=bS4jQkRHQskXi0xs+nzztWt0/lDWmsKHYNmj5lvftqAqOsAH6O4Z1F5TT4SqHfGq9D
         Ll8LOlrgGB5WM3FepdMtsN2wWyadE0YMWVMC4+hPdgFSo5u8RRgGjDXwtK65FBjwfZDy
         OQlhsCkP5xqYN5sKwIrnycY+ft5M88KIzhhoffwZFZOAMUnEHRtVymo2cXXKtw4kiCnY
         5thIUTMGyZp76AXiSavaWxuBftxifYLdV1wauPFQjGPIgNL6iucZPopnNc657Jcecdkk
         VcwsdglyehCdlO/n51SToQm/fouN5VyG8L/5xBnELBn5Lyaea6MU3BrJUHQnSWAlSHi7
         +Heg==
X-Forwarded-Encrypted: i=1; AJvYcCWHfZeOvZ5S2cFhMj4ZS7vv1y0mel+Vz7ye0OJqtlE5PGkdrC3qtQyUKxkHMfz5LkR8yc7T4YumPqGRPM68@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwATE7/Uy+jTHuEUcmLdTBB6fJ6TL8G+OqwptTgBS9iw1u78Y
	M1drNvKtuk1xi1ObsC/ezcCcVEfxlGGkvhmNT/u4vBLorMRlRtSa42sc4j/J04zXkge8g7oe3iV
	5Aic6hkt1TZ16NWXqd/oDda6g3rS/AgKiFQR7u97vzqSXHyio2cw5/my3MaIvlq5oNwLM
X-Gm-Gg: ASbGncsIW/wN/9HBU6Js/PfifNx183vnCuAdGZXPcHuVtOELVp+mCTbkbu6qrBzicb3
	Lgrqkd6I5ILJGqV9f5/DRW+s+TmKGYdXt8VQvFwcnz7qN1lExYxsI02qP/5u1SOL7gDv72pEEY6
	B7O8ZN4tYaGtJgMaZmwJXPuUzqCow3Fwr6kIYEqhxTNMVMINLd7Uc5YWOsSNKM4dZYsV7KySHpZ
	HeMXA4fXHwAkNomIgTdJDa8HIplNzWfmZxR4wL20bx9QRwGhCiwYstLAAgmZhniDADlZqFOgccc
	C7PdGJGehS+uUmvzLv4tRVwk8ESnaO0SGaL4d4yvU5tOydil3xqdfm0+fiiNm44gs45nYgS9uhd
	Olel1AW/fp8UAPByPFpS/dkrZk9kSFn1J1ZyVFXIXpu6yZ6YizWkC
X-Received: by 2002:a05:6214:2a88:b0:786:8f81:42f with SMTP id 6a1803df08f44-7e71133eaabmr18299816d6.39.1758615788329;
        Tue, 23 Sep 2025 01:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTqf6gCEvg93UnurQ8vVB2x/PoLj6l4bFsWeAr6cog3AY0TdhZBUmDyx4Na73stVCrlcsG3A==
X-Received: by 2002:a05:6214:2a88:b0:786:8f81:42f with SMTP id 6a1803df08f44-7e71133eaabmr18299596d6.39.1758615787733;
        Tue, 23 Sep 2025 01:23:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b3528c49dsm2473961e87.134.2025.09.23.01.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:23:07 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:23:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <a5o4iivd7ph4h7hb5mhfwgijob3celkn5l5dci635a7owzga6t@pjmf37gcmai6>
References: <20250923065212.26660-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923065212.26660-1-make24@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d258ed cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TWLRxeszWchEVqlQ-2MA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tDbQ9NrCckpg-W3u1lbfOscWuQRu8Twz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX5Fs8njSf0bLJ
 MwtHLT6bTKCXkK9jHR3ArFQMl6XmUJbGEgYbi7N//GbXoLoyQt5FKoocSWE4/bMmXVBEnnw2xkF
 LTWF1tfJWkMxT67s+7hGnw3G+uCgawZtoGnG/yVvkTNP3jb7mhvzNUWV1uvtIrxGkFG0f6sSuo/
 nvTPnxYkP8LvakcWH30IWUxw5fefE/9sr/P5XnXTJCmeU3SC22tlCgxDtFzhtdvw0X1WLffy6ca
 u/wx9plhuVyw9DlUfFxuj9vczNjdzevNTjly6JRagubPti4unZoPAUJuiyUzmz5S2UkBRa/tgDh
 ObnlUpnzQKswBaVkE6fD5uRJEYx/5Niq8Efn8dIBVLmvdop2yGqAfWVwSlKH450mrYZTudP/GyB
 tZw6jFVR
X-Proofpoint-ORIG-GUID: tDbQ9NrCckpg-W3u1lbfOscWuQRu8Twz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

On Tue, Sep 23, 2025 at 02:52:12PM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data() and
> add devm_add_action_or_reset() in the probe function, which ensures
> that the reference count of the device is correctly managed.
> 
> Memory leak in regmap_init_slimbus() as the allocated regmap is not
> released when the device is removed. Using devm_regmap_init_slimbus()
> instead of regmap_init_slimbus() to ensure automatic regmap cleanup on
> device removal.
> 
> Calling path: of_slim_get_device() -> of_find_slim_device() ->
> device_find_child(). As comment of device_find_child() says, 'NOTE:
> you will need to drop the reference with put_device() after use.'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v4:
> - removed the redundant NULL check as put_device() can handle the NULL dev;
> Changes in v3:
> - added a wrapper function due to the warning report from kernel test robot;
> Changes in v2:
> - modified the handling in the success path and fixed the memory leak for regmap as suggestions.
> ---
>  sound/soc/codecs/wcd934x.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

