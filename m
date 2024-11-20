Return-Path: <linux-arm-msm+bounces-38489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F89D3A95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE38282AAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD2416E863;
	Wed, 20 Nov 2024 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzXurJmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EE1A0BC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732105350; cv=none; b=XRmJazdh6TdIbsuOwdUV99XZajL3u3T9fV83jSr9J+FyN4LkCGSvLng+YUkEiQCknXTmSBkFujHBpzSuKCQ2WppN3l0qD0TCAF1SUggZbt9dG7IxKXNIngCxTUjfAzD5vHNB3MJ/dijLXWfDLSu7kSzqx5rfibiRmsoTFUM8YBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732105350; c=relaxed/simple;
	bh=uSHuqQVeOGNEdagTn3llR1Roms5Hmm7Gu8ejtYUEyw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQL8SYUoPJWNHj/1WkL+zVlXsP7ncqETuG0m3p3EY0OQt12tqBHShqwfDZKYfKjihHKa/JViEp4do3Sinv2Fkr8oyYOSK25vOYcqS26afqfixYtxxrAlTimmiH2YNEAMExLfmn8xH/mmMdpulh/GFvC+RyNLEGWEFMMf0YuOLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzXurJmo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb49510250so52589321fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732105347; x=1732710147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SruCioZfgrn86jAMwwtPTp5mHwQ8KSQNR1JzfmIlXwA=;
        b=tzXurJmo/sMcOceOXMxv2FY3t6KgcOdFYF5o2dkOw0C1PEPpLvLpt0cBy0El8zVZeu
         N0zDooY1kLnTAI2sFDL9Z64Jsr6AzwGfvtbq4um+wTbUZXJHj1nvL+eQKxAm768NvASv
         hKpp1olUHQpZ1DAWJ5svi0PZHzriMIdXITA5me3BXxcgNT3eHTpjAWp2pqWyiU7TUxqV
         cPl/UfUR/SBD4JVNQbdRJOZ3x+fwZPZ7YWv51lqfL7pK47swTifFFEaTX6rT+JMV/qHY
         TZHZoRk3schflbMc4xdrA3Q88ktVh+I+1AO+Cox0XB+/HzfncSZnNdXaQZmSzwokrYxO
         hbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732105347; x=1732710147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SruCioZfgrn86jAMwwtPTp5mHwQ8KSQNR1JzfmIlXwA=;
        b=pK8x/ViMiEUqQLMzWMUdD/Cwr5asPjAOTqb7DLoLqmgFXWZkcu/lo6M7cjSpmhREoc
         gOFSurgVqISZz2iGcj2zNg32a0ZchMUXXYGLKsI2KdRMxTlEJna1E6/UclYBmsnVwALo
         myupzuY8AkfYcaAHCAiEO7OJ1RbBOYFaqtRUBpI6/og+f6VorXe9fTh6YvlsRSIRffUU
         2AErMtwCJHLLqMjKwmiQGIfGQNECrVfPq82Su7qZ3oQiJUs27BYMcRMKeGhpXVjsfBfl
         bnu3aLkU22ehtA/NRic04ndln92expNCIYrpMRb5/HCVPxTa0LJBiq9mKTppEZDuKHBO
         vuTw==
X-Forwarded-Encrypted: i=1; AJvYcCUd8h0l5iFHDg9N26AyX9h92HcwKMh/5AiykgBSTboUoNaQNtLGOg9uOQguQO1GuIznCyMuz62nwOgYdt0A@vger.kernel.org
X-Gm-Message-State: AOJu0YzB3GXiB4QkWkimuS7Ee3WgIKUydwasDmkwC4Sp/yUEAI1a46y9
	jL3PHvdM8H6/ZPbiZ+8x1/dYW+8+KWLPkrLdUwILOSaB9b+rWLkkp6fTx6dWgyClu29Z1x2+28e
	/
X-Google-Smtp-Source: AGHT+IEiiSKHX4fIrglemmZ24n5kuwXRep6VaqLRLC7YsS+ml8gGLPpofbPYqhQ9SU1K9uvsEoZgDw==
X-Received: by 2002:a05:651c:88d:b0:2ff:5a42:9205 with SMTP id 38308e7fff4ca-2ff8dcb2af6mr14710341fa.31.1732105346969;
        Wed, 20 Nov 2024 04:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69b158fdsm14765831fa.102.2024.11.20.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 04:22:25 -0800 (PST)
Date: Wed, 20 Nov 2024 14:22:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fange zhang <quic_fangez@quicinc.com>
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: display/msm: Add QCS615 DSI phy
Message-ID: <p2glf4gv4jw45yxycptosbs4emcazmeysu4loefvwrfik6rn62@bayln37drvps>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-4-4efa191dbdd4@quicinc.com>
 <34jwvxxycm2mi3tqndhuoapth4u5nbn4omsiaxxrh2iapwuky6@f7xttrmt7w2c>
 <b313ce58-74b4-4f5c-af7d-3ce1c53a804e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b313ce58-74b4-4f5c-af7d-3ce1c53a804e@quicinc.com>

On Tue, Nov 19, 2024 at 12:45:00PM +0800, fange zhang wrote:
> 
> 
> On 2024/10/14 18:30, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 05:47:30PM +0800, fangez via B4 Relay wrote:
> > > From: lliu6 <quic_lliu6@quicinc.com>
> > > 
> > > QCS615 platform uses the 14nm DSI PHY driver.
> > 
> > - bindings describe the hardware, not the drivers.
> > - other platforms also have 14nm DSI PHY. Why do you need a separate
> >    compatible?
> We need to introduce a new regulator configuration for the PHY:
> dsi_phy_14nm_36mA_regulators. This configuration has not been used before.
> 
> > 
> > > 
> > > Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> > > index 52bbe132e6dae57246200757767edcd1c8ec2d77..029606d9e87e3b184bd10bd4a5076d6923d60e9e 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >         - qcom,dsi-phy-14nm-660
> > >         - qcom,dsi-phy-14nm-8953
> > >         - qcom,sm6125-dsi-phy-14nm
> > > +      - qcom,qcs615-dsi-phy-14nm

qcom,sm6150-dsi-phy-14nm

> sorry, still have some question about this yaml file.
> it's necessary for b4 check
> 
> checkpatch.pl: drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:564: WARNING: DT
> compatible string "qcom,dsi-phy-14nm-6150" appears un-doc
> umented -- check ./Documentation/devicetree/bindings/
> 
> need to add this new 6150 node for dsi-phy-14nm.
> shall i add it?
> 
> > >     reg:
> > >       items:
> > > 
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 
> 
> and could you please help to review the new version?
> Author: Li Liu <quic_lliu6@quicinc.com>
> Date:   Tue Nov 19 12:35:12 2024 +0800
> 
>     dt-bindings: display/msm: Add SM6150 DSI phy
> 
>     Add new compatible for SM6150 with dsi_phy_14nm_36mA_regulators
> 
>     Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>     Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 52bbe132e6da..fd6eb3434450 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
> +      - qcom,dsi-phy-14nm-6150

qcom,sm6150-dsi-phy-14nm

>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
>        - qcom,sm6125-dsi-phy-14nm
> 

-- 
With best wishes
Dmitry

