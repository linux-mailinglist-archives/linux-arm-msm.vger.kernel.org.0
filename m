Return-Path: <linux-arm-msm+bounces-34578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4069A0750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A55C1C25F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EBC2076C7;
	Wed, 16 Oct 2024 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uG+eRd7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C95C208D7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074294; cv=none; b=FiGZP0yuHwaGKjIqawP76s7OyoSCKwptQNGc6xDK3Jw4cZ34u5uOqLE3IkOuHbE9YvFWSWT6Yi4PHM2/CYxOgOh7pnZW88mhlrfi6waaGFJhYA1JQrb6pvHyhXMCCTg0CbV2yuHYaU6quZId7l+6V85EQZdmZjFwefas6GPaLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074294; c=relaxed/simple;
	bh=FaLjqtCZJOohqyEbSxz8TefACGemR3EzFd99ab6BNDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3AakMySFzGIg4b/6odTwTZ8wLEU3DACxEseEyZef2jsCtXe/POMtbj+Tm1Kg44XR8tadsR/a6vV7sVCKYumAdVwc7eqQPVcx17KERg4e08tpSgoLylKDl2ushcCZdM5CgVDaV1Aomzm6UK76QmKhfAl33NCHcMs1rYoKa9DaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uG+eRd7r; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3721432e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074291; x=1729679091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOErvY0XEl/tfIkNnoyyFwxd/COTHVSJLHwn2YjQu58=;
        b=uG+eRd7r3HIhXvYpSjc/wBlWtzLnsTY7eU3O8FCH4vAtcbNmtu43vjcoNPLfbGxBmy
         MHsbUADRr3n8E7c2ImYMst9Gz56hoyIfXQS845DDbkRqMJIANEJ+k8KTIBV9hSk7Pig0
         ZgBTYtXI0tp2VBvWKlepEvrLJnPUlmkh+SAGi0q90RJ4qN38erse3hygZ8VGAyPB7HKV
         hSdNnbApDtCi3qVRHn1IkTs1OVYbgq4yWavi/MYT2sg4oYnAzP4k3Xw+oTPunLbMpVai
         U+DSfVnE/mb9u9zvrkcO0i41v0Oyiodd81MONDB+susVKsm/ods56HccTyzRyirCD/AG
         Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074291; x=1729679091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOErvY0XEl/tfIkNnoyyFwxd/COTHVSJLHwn2YjQu58=;
        b=RQ08oYE2rVvye9O0YYmBU9hPWgSgp8cm8mtukkE13yy7M1Gnv5Cq6YchWsLXyWQgBH
         WvDr5ycFyqD1VSw28NpXIlm11B64NcRkPml+BbrWMjNhNfkioa5aon42BjZedgcl421b
         o6h/8yXKbenvCG2LnrXZESPTJ8TxcbTwG7EK0wHx3oxLymBXToFdrKztRlF+BW2GFUbB
         lBrsXotueTlYmreju+yBGBZUTo8Pu+7u9v9Yp3fkEo7Z8gy58wwWWzW9DP4rH3PZOSQv
         it2TfyzRX+llNIOPV4bV+e7yIzjLDHpHpjoRj0GcJwUcLmT4k928MHReS0z7EB675UPQ
         Hq0w==
X-Forwarded-Encrypted: i=1; AJvYcCWwf2v/7etBm931+MMwjioL8muT32uZrj5jbaOcPjK3ngddtLRYGxmNMO3ZcQnqhiREJ9jBvOzt6uSkCfzq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6enQCv9XfXL1lO6Kq/OQv5ReLUZ8CsmwSa8iA2hcxxyRbjot4
	10poZaSx8pb7BkF5OiPu7zSH2gwNDdiaodjSr+p01zwilgnxipfezexHeJtHAHk=
X-Google-Smtp-Source: AGHT+IE7EGXTF2XFh+wfkCP05g5kYyOkDLkoTu8El4kj5A+EicBu40bFWwJftS6S+G+lSct7l+Q/BQ==
X-Received: by 2002:a05:6512:2385:b0:530:ad7d:8957 with SMTP id 2adb3069b0e04-53a03f929a6mr2371364e87.49.1729074290576;
        Wed, 16 Oct 2024 03:24:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb1e21sm410499e87.84.2024.10.16.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:24:50 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:24:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kamalw@quicinc.com, 
	quic_jprakash@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting
Message-ID: <2tunyupop2w7brm6adkdsrytvxbr4g3ixpbmuuqljedeaehze5@se3qsbf6tb6t>
References: <20241016100511.2890983-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016100511.2890983-1-quic_kotarake@quicinc.com>

On Wed, Oct 16, 2024 at 03:35:11PM +0530, Rakesh Kota wrote:
> The UFS driver expects to be able to set load (and by extension, mode)
> on its supply regulators. Add the necessary properties to make that
> possible.
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes V3:
>  - Somehow after fixing the compilation in last patch, i have missed to
>    do git  --amend the change. apology for that, in this change i have
>    fixed that compilation issue.

What actually was changed? The --amend doesn't describe changes. Nor
does "fixed that compilation issue".

>  - Link V2 : https://lore.kernel.org/all/20241015132049.2037500-1-quic_kotarake@quicinc.com/

Where are changes between v1 and v2?

Where is the tag that was given to you for the v2?

> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 5f3d4807ac43..bfb1cdc238cc 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -258,6 +258,8 @@ vreg_l6b_1p2: ldo6 {
>  			regulator-name = "vreg_l6b_1p2";
>  			regulator-min-microvolt = <1140000>;
>  			regulator-max-microvolt = <1260000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> @@ -265,6 +267,8 @@ vreg_l7b_2p952: ldo7 {
>  			regulator-name = "vreg_l7b_2p952";
>  			regulator-min-microvolt = <2400000>;
>  			regulator-max-microvolt = <3544000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> @@ -279,6 +283,8 @@ vreg_l9b_1p2: ldo9 {
>  			regulator-name = "vreg_l9b_1p2";
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1304000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> @@ -467,6 +473,8 @@ vreg_l10c_0p88: ldo10 {
>  			regulator-name = "vreg_l10c_0p88";
>  			regulator-min-microvolt = <720000>;
>  			regulator-max-microvolt = <1050000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

