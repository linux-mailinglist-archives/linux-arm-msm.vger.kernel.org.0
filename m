Return-Path: <linux-arm-msm+bounces-6840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4F828F21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 22:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E828D1F217DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 21:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2773DB87;
	Tue,  9 Jan 2024 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODQLPpPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09933DB88
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704836681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVCKH0xeq+ELqZvwYFXq0LMLmw3XYJuhAtH05uJOe80=;
	b=ODQLPpPQBtdmxwFX7cf18vhc4ZqrijdgQl9jfGeqFb1OK48n58+1BkvXJaseYR2vrDNW2m
	DCkyDlBOanQYGjhOqbbrdQpHVP6qaukvfGtfmZvs5dAEKJlMYFZHFbiMO5+UtBEEvzFUdA
	uNQGVoKKSdK46TMgJieZxiA3QTDpSK0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-zSDvhQciMhi51-UvkUY_5g-1; Tue, 09 Jan 2024 16:44:39 -0500
X-MC-Unique: zSDvhQciMhi51-UvkUY_5g-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5e6fe91c706so57805667b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 13:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704836679; x=1705441479;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVCKH0xeq+ELqZvwYFXq0LMLmw3XYJuhAtH05uJOe80=;
        b=O246YJwi6nJOFQmAizqFqM+oLAUXmWk7sk1ORKH5oRUJcP1cHAaiKt1WSE6gs8IDgB
         1kPpxryu2njV8mnQMrQ8qIs/a4DtEytCraF6kNZzgeTOW8UbyWvOhlF68G7gu502gxvK
         IWukcqJjQP8uZEOPZCabZzCmuRovRAFPuzjmrTfG34r4dT87zUY5Fx4dYOMdpERWTlWP
         iotMxjno9Ju8f+Y40fOIvg0DoNkqDyUk8PN03MePicqdbZA5ngVFlWEZhYTntkbnwqf4
         cP0780/ZeyNuKLI8tNn9ceu8ybNbJPwr7jB2mDJepr7OmIR/O+g2W4matdLI/RAaDavQ
         c+mg==
X-Gm-Message-State: AOJu0Yw5aE9a2IEdVVFEaskfBFXneqrW7rPZvO55RmWy6U+FmqSfnD1N
	cyAWUYAeARV0hm81x63sm6x2y2RL/hVtRjfvtL3PGyc5Iy3gbTA4kgRp+8TXMBSH4Bc4soKP/UE
	QKmMNy+XnuLSc6FLcHyLd2HuBoVpT1KYPvd+3vrhNQA==
X-Received: by 2002:a81:4ac6:0:b0:5f7:7a2e:ff37 with SMTP id x189-20020a814ac6000000b005f77a2eff37mr116769ywa.52.1704836677352;
        Tue, 09 Jan 2024 13:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRnISl0IXWafNgZSbXe1C19EI1Hv9rCrd/zqC/V2kDqKM+pQOv9gnlyvJH2S2CWL9OQ9ufMw==
X-Received: by 2002:a81:4ac6:0:b0:5f7:7a2e:ff37 with SMTP id x189-20020a814ac6000000b005f77a2eff37mr116745ywa.52.1704836675615;
        Tue, 09 Jan 2024 13:44:35 -0800 (PST)
Received: from x1 ([2600:382:1a12:8b4c:622f:aa5d:eefa:f54e])
        by smtp.gmail.com with ESMTPSA id q188-20020a0dcec5000000b005f501b637b4sm1060892ywd.36.2024.01.09.13.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 13:44:34 -0800 (PST)
Date: Tue, 9 Jan 2024 16:44:31 -0500
From: Brian Masney <bmasney@redhat.com>
To: Elliot Berman <quic_eberman@quicinc.com>,
	Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Eric Chanudet <echanude@redhat.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
Message-ID: <ZZ2-P1xzsDwk91Yq@x1>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
 <ZZxgCKQmQdUL81pX@x1>
 <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Mon, Jan 08, 2024 at 03:35:55PM -0800, Elliot Berman wrote:
> On 1/8/2024 12:50 PM, Brian Masney wrote:
> > On Mon, Jan 08, 2024 at 11:44:35PM +0530, Shazad Hussain wrote:
> >> I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
> >> enabled before this particular clk is enabled. But that required
> >> power-domain I do not see in the ice DT node. That can cause this
> >> problem.
> > 
> > Thank you! I'll work on and post a patch set as I find free time over
> > the next week or two.
> I think I observe the same issue on sm8650. Symptoms seem to be same as
> you've described. I'll test out the following diff and see if things
> seem more reliable:
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index fd4f9dac48a3..c9ea50834dc9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2526,6 +2526,7 @@ ice: crypto@1d88000 {
>                                      "qcom,inline-crypto-engine";
>                         reg = <0 0x01d88000 0 0x8000>;
>  
> +                       power-domains = <&gcc UFS_PHY_GDSC>;
>                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>                 };
>  
> 
> If yes, I can post a patch for sm8650 if no else has yet.

The intermittent boot issue is still present against
linux-next-20240109 with the following patch:

--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1556,6 +1556,7 @@ ice: crypto@1d88000 {
                        compatible = "qcom,sa8775p-inline-crypto-engine",
                                     "qcom,inline-crypto-engine";
                        reg = <0x0 0x01d88000 0x0 0x8000>;
+                       power-domains = <&gcc UFS_PHY_GDSC>;
                        clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
                };

Based on digging through the power domain code, I also added
"required-opps = <&rpmhpd_opp_nom>;" to match what the UFS host
controller has, and those tests fail as well.

Shazad: Any other suggestions for other resources that should also be
referenced on the ice node?

Brian


