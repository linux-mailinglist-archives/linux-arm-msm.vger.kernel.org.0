Return-Path: <linux-arm-msm+bounces-82427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2FC6D346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C51FD4F2D19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A12A3191C3;
	Wed, 19 Nov 2025 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmA+dQ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ7XQC1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB81321F42
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537785; cv=none; b=qpu/9WL+RQdK/oBjaGHYQ5EBkU3aER3NNzHRHsNaZGNZN/d3b8rartmNOh3/yJhZNfKZp5Xg0q0Bxr31XKG3FzcWpFCXr1eIOB75MvehJ7k32tA0DxrvS9mWd+l+szUg74aDOYyX76AIwcQOeiLrFnRCFPaJ95761xU5K+XHOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537785; c=relaxed/simple;
	bh=CeKza4z7f+gCmqjYhUrhMKPiHZJ6Ib1KoSXfggBRBl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxk3AQPx+ZPbl0i3YAUMlRk7VRopsJLkVTXnFtH+57+hr1ukmRLZOpTtz5UjJSGSspd21CxyVps9/rD8FRzrv4boLVxe/TuEXGEH4WChJ/K0bm8aart2pS2sxrQCQGSaSu4Wwc6KY3n+yUgTyIQLOVrfSun1k+IwTvQ1ec/Z0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmA+dQ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ7XQC1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7OVRB971176
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b2fJw1Fwo1X18bw+iFRPNcjg
	skw8RlhaPnqMy2U+zDk=; b=CmA+dQ8C28DdnSv9JWNVNc8+2UzqdTunaSWniQxQ
	h2Rdqug3UdbGHETbZQP9dkFAjzz3Xi5rej0aUU5/NadLklP3jccJgRGDKBuKTsQY
	Fl2HxA/zKo1x+Esxinr4hteVaYGM8uhwdkThJbl8xiybl6MOyW3H6WbPCNWeBuVr
	mTuVhFPAMO1JBGwZPB0jGih+mKR716g+kdoBaJHWgYQntJU47wlxE00cbaI9ZgJI
	WyOjK4aiEzVeMEJMbU+TjEB95j7vudDo22kEGVJz5ErP8j+bAOOksjjYpmCwhoWn
	otowhVUDkQUlnvcC4mbZVuf25zOFR0luo7BWigFSM3914A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu8165-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so1135679485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537782; x=1764142582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2fJw1Fwo1X18bw+iFRPNcjgskw8RlhaPnqMy2U+zDk=;
        b=JQ7XQC1Vwl11ttMFjmbgWXEvyvW4v0a6w8gMz1LBURdB+Ayh6PPnSjQ69GHkb9O+4P
         XuDsnkkRXD2YlgwMYIbKeb3CzOorXeGPPtdkJiOsa00HgGvXlYwZBkgDQQD3DgsBuyug
         +iSqgTTfST1QE0sITZSfr41Y2OGxOYj8eds7KxcHBj+0MZ3ol7GeVvKrndirS23rB6oE
         dfiSJ1Y6LHFINkekkgj/CKjlJXwzTZnMaORe5Jx4NxwB2n4n4E06jDOeK3XnR4AoczWp
         mhJvpKnIJw8lSZ9oSCvBtWwYhV6C3ZudbINq5cvQLzh9nkQQV2DAO0m91ni/Aj5nUXZh
         4uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537782; x=1764142582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2fJw1Fwo1X18bw+iFRPNcjgskw8RlhaPnqMy2U+zDk=;
        b=NtJ5aQJdPS6TCjbVb10WwaXKY+sKVhUEO4JBUQq9NB7JZ644TnS7KLPsxQw0Yl2Lfk
         AVcjAL2hUFa3aWY6ghcRZoFW4gdVcaHiJr559gzV3dK+AyzklxJ5ugKgi8I6NRIEI0V6
         HXSO9d0/YJ0m4oVtCzzDdkGLj+9yS5z8d2VtU0p7kObX8ZSl8atW+bIABAWku3Q5GM7r
         KTwFnJp3LxWnhVkO2NajMw/5lDt1vnvbswOQUZ4/CBOWzfplV9A1yvOqTQ2SQ+plvgSC
         fEu6QaUCKdVfS7AiZpwKNOIR4zKCTKCnNwqdUmlahAppPLweOT78wK0NQ8mBAjaW8auU
         vkmA==
X-Forwarded-Encrypted: i=1; AJvYcCXuSTAUXpKpo3Yu9hOykt44VBp1NIij2P390HQur/xEraEvjQZAXtFnyBtXseFPsjhmQu1aCyIBuRUEg/St@vger.kernel.org
X-Gm-Message-State: AOJu0YzvR3h57Bo/NKggwthuAXK76jBLEpfRx13N2Bjq7jwuM3N9fUkm
	4s8Dk/Kcwi+qKFQrsY6DI+7PsIILe/GC7IcsazAhav5jqol340p81LYQ4AVwyspfYX5uhgnn0hj
	yoVxXv83wFph+8/IQPQ9Y3Q8ktv0IRM46/RI1eiv0DAvo+9xLwCACKu0M4TbGD0436Hcq
X-Gm-Gg: ASbGncvFkYHMloI+Zjc/P6omIdCM20ePrbQbPS81G8dGm4j/mCBoc5Xg8OexW8q7a8u
	SE0FeB5D62XGZncZallV1Ly7RTHOdCUjabaf7cu4GfqC/oWuKNOW0iXqIkTbgOnPUVz62MbbT5V
	Bo83ufxZ8SHahMGjAcA0cWYH2icOBbcx0Xsi6L8dNcdskBRXFmy8oQxTL6g1fMQegdeWyV+PVGJ
	YKjwMUfcILiYP7Xrz4pT7cQkFvQzq+gQyF/8GAzLB7bW4oU0bxPtsOSGin1FGsMEkRcaweetcPT
	1Qo2cuo1lhzy7Dz08j32Mokcc19D55ZCOtIZOtTVmB8fEhNDod0JHUp/7NEOL9/qdJXboE0DW7U
	7X14c/iDYcHTLFqa6AWLttAc6ovfozpOYruLjzFVNsPS34DNt6QqJfJg9cSo0M9Io39XHxynExn
	FC5R244IjjDTxqt6PISUXx6qI=
X-Received: by 2002:a05:620a:1990:b0:8b2:730f:134b with SMTP id af79cd13be357-8b2c31af190mr2305953385a.50.1763537781536;
        Tue, 18 Nov 2025 23:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUkKb4mpp8eMpxhGiHmlERrpybKBET9nRQckVHp59VNmMM7vOmHFeS0Znq6PQENMcfVRvoNw==
X-Received: by 2002:a05:620a:1990:b0:8b2:730f:134b with SMTP id af79cd13be357-8b2c31af190mr2305949585a.50.1763537781003;
        Tue, 18 Nov 2025 23:36:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8bc7sm4426694e87.46.2025.11.18.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:36:20 -0800 (PST)
Date: Wed, 19 Nov 2025 09:36:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Message-ID: <mhybllmkinoaa5z4de5wxrcu5oudg3xyxsnktfn57u7ryas74d@cph7cfasciyi>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1OCBTYWx0ZWRfX/hmt9K51h9GA
 v0q/bSnsNdmHCL0iUg8NciNoFaLADGrvxeH3vmkfMAUs4Gls8ADuRXgC0dcrcU8IEpg4Cuepu5T
 VRwKAmxP0JLaHYY9ZUPoiLQhzJKcUcxnOi411Womgzh/4TCvcPgEoeGGG7gwMhkUHinZAkcUawt
 Ms4q+QAwJf8tTJobxPWn++nFuuO3e7QIxWMiFkPgysUZsaeAdFtP6sDulXrSSXbodHjggyFXyXK
 g26PyiXEKqDdnnmBkCXZFYvLguMzmnhltv/pfqLQRere9DVEPaSXU5KBPU5Gt5Np6+V/ca26Yi6
 rLsz6Hiid4nn3IA/rgoP7+pMP1NUTYjzlEPIk3EBKv7dC/HLvHfoCy/eERq7MalZDmhhUy2jW5o
 jemnY1pjgSYsi3b3vbeVIZp4mF+J8w==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691d7376 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-kFX126oTHwKP8aA0KsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gM6z--1TW3BdI7p-kAevaAS2KVEeK9w5
X-Proofpoint-GUID: gM6z--1TW3BdI7p-kAevaAS2KVEeK9w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190058

On Tue, Nov 18, 2025 at 12:30:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The supported panel is LH546WF1-ED01, add compatible and adjust the
> struct name to reflect that.
> 
> The standalone compatible lg,sw43408 will continue to work, even thou
> there are no users yet.

.. no users _left_ ?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 46a56ea92ad9f..bd55f6d8f2771 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
>  	return ret;
>  }
>  
> -static const struct drm_display_mode sw43408_mode = {
> +static const struct drm_display_mode lh546wf1_ed01_mode = {
>  	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
>  
>  	.hdisplay = 1080,
> @@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
>  static int sw43408_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> -	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
> +	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
>  }
>  
>  static int sw43408_backlight_update_status(struct backlight_device *bl)
> @@ -214,7 +214,9 @@ static const struct drm_panel_funcs sw43408_funcs = {
>  };
>  
>  static const struct of_device_id sw43408_of_match[] = {
> +	/* legacy */

Nit: I'd read this comment in a way that both entries are legacy. Would
it be possible to adjust this somehow (e.g. put legacy on the same line
or extend it, explaining that only lg,sw43408 is legacy).

>  	{ .compatible = "lg,sw43408", },
> +	{ .compatible = "lg,sw43408-lh546wf1-ed01", },

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sw43408_of_match);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

