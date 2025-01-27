Return-Path: <linux-arm-msm+bounces-46285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49111A1DBAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 18:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851F57A113E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 17:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D40418BC26;
	Mon, 27 Jan 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z2t69b/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFC18A6C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000672; cv=none; b=OMxiyhhI4lhulVu3/zq5KL5Spg4xyTgXKihkTSnkr00iYd/swM24t7TETyoWB11I+IpLYdWwfpgPkSBnQVYQqoIXy/y9uKgEL7DDDXAKTU5asRdREuasMWvsKXK2dSQFMTiyo15NkWSuo+M2/gAAmLb31RVCRVMb/ynL/2+zKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000672; c=relaxed/simple;
	bh=LKzqPSmhEkUHLUqV7oQeSbbuEI+VGAc5+n4An93Ywks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkUbRgUrt5cYqdOjYzReU92k6oRcilDU5ooYMNwDwBNutNxiRr/WnB0NPNgjQzME1uFeGoXZnPO7PARRgw6mk4vuuL4NCsKTOuxa0y/jKpUUKFV5YpqwQ8j2AKzYD0n6/vV0VWFoGJdYITlf0V2v9qPiZ+H9s/97E49PvZohrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z2t69b/1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32047695e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 09:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738000668; x=1738605468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M77PcxvNpcs48QUZQw5/KaTcNduAiPl13GqlIh2dsls=;
        b=Z2t69b/1S20BpayF6m/mSCiK5ZXqMAOOt7YObD6B/kMcm1zo8yRPYyCjxft/BUfl9F
         LyeDOiEjRmF18Yl+lWApaEBvy9HdOAAEY38JMMqqadV67ncv6kk4Phs/IjacJIS/yVnW
         Ereh2CTFEDCT2bdEKL3rvuo/lWdb91uZnmBE8XptP9Ri9Ebl8LPmqLmG7nCZViknRwJy
         u8+BwuoUWm06KZMKC/s692tCbz6z5HX01mb42PMTnOAoljGzgYVWWDIXjtJryfVkTy9P
         JtNeWEf1RlDKj0FCgO27Np3w0J7pNR7LZ6GihcoRiTHxL2Km5KTsudyaAeyQHYMhDD/f
         8ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738000668; x=1738605468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M77PcxvNpcs48QUZQw5/KaTcNduAiPl13GqlIh2dsls=;
        b=gy9Phk6TQDPXxhjF1zPMKM1risCx8PIAPVMLTsNDVi65pX6hlsaCd09S+uN9EAfBVd
         sj6SJ60JiwnSy3YOCissJ+EVQjefq4OyYoNRBZAfX0t4JN+ygepdgZgqSRzDW9mk53bK
         x/inc0cxoPu3k4i3lw4ZCtVfNMPrs2JwjHkyymSXi7Niw502uX9UvZXm1hcbjBrFJBQk
         V0Qg3/mGuBs9IpiEKb4oscn75G/828ZltSGnV2BN+yes4THMF4ZgqKNWtn2EajwIba+V
         nzBz4bzIX/RcbBRA79xVdm34njKyEHXrV0MYMqV5MLt6xt5QnlO6yf5QOsk551hY1Oix
         yB2w==
X-Forwarded-Encrypted: i=1; AJvYcCWA6ImZErEjWKFMxTj0X1tTTLE8Kf43eiZiC8OHE6HDtU6nBvW3Hys38Ox1EEa4I9G9ikanYUvDQWPjP0o6@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQIFaNopR1VKYWRjeIBXAUe186sAByU7fL3T7GMFqs/ihrQA1
	ZYzwkFye57FE3lzJiIWYwvfAAgOTXZrbKpolEFqhkkcSzs/PElk/YWiWiwrBFXU=
X-Gm-Gg: ASbGncvqgQMoAiayHlIiqwlklYszQh2m8eo9tjqn2S3eMUBTe8UcQQ4S1aQ76+idqmr
	yPrZwnAwT4lgWKITsotGHEQeDkz3Qkjzu5oFZhtLpQuW6dHqGuhwkpEm3VBS2VVwDI18cvM0HnS
	ve8rYtQwON9P0zEdwGC9c/roiJC4nUADtg9EggCUQ7V0dQicY+QskWrw2Pxph4BK/2VkQrnWYcG
	k4FagsU8+sK5VOSUtjSDfZQtC9hBaX0VCYuUAF/0Rdza5zCT8YM6acgu5/AG7kEapnZVmapUUmc
	EaZACPVipDvzsjq/
X-Google-Smtp-Source: AGHT+IGgQC/VZ4z0/ddu2PPeryPS8PgsDhSQ5DPW3/GEQZHDA32wG/2eJS1c8ZIEWKfIjZwD5N4E7Q==
X-Received: by 2002:a05:600c:4f06:b0:436:e3ea:4447 with SMTP id 5b1f17b1804b1-4389144f00amr434896275e9.30.1738000667959;
        Mon, 27 Jan 2025 09:57:47 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:4750:4bda:32ab:b090])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d2952sm141323345e9.34.2025.01.27.09.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:57:46 -0800 (PST)
Date: Mon, 27 Jan 2025 18:57:41 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <Z5fJFRMHIvKoN4cE@linaro.org>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>

On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> 
> Missing from the upstream Qualcomm USB support is proper handling of
> role switching, in which the glue needs to be notified upon DRD mode
> changes. Several attempts has been made through the years to register
> callbacks etc, but they always fall short when it comes to handling of
> the core's probe deferral on resources etc.
> 
> Furhtermore, the DeviceTree binding is a direct representation of the
> Linux driver model, and doesn't necessarily describe "the USB IP-block".
> 
> This series therefor attempts to flatten the driver split, and operate
> the glue and core out of the same platform_device instance. And in order
> to do this, the DeviceTree representation of the IP block is flattened.
> 
> To avoid littering the dwc3-qcom driver with the migration code - which
> we should be able to drop again in a LTS or two - this is now placed in
> drivers/of/overlays.
> 
> A patch to convert a single platform - sc8280xp - is included in the
> series. The broader conversion will be submitted in a follow up series.
> 
> [...]
> ---
> Bjorn Andersson (12):
>       dt-bindings: usb: snps,dwc3: Split core description
>       dt-bindings: usb: Introduce qcom,snps-dwc3
>       of: dynamic: Add of_changeset_add_prop_copy()
>       of: overlays: Introduce dwc3 flattening overlay
>       of: overlays: dwc3-flattening: Add Qualcomm Arm32 overlays
>       of: overlays: dwc3-flattening: Add Qualcomm Arm64 board overlays
>       of: overlays: dwc3-flattening: Provide overlay symbols
>       usb: dwc3: core: Expose core driver as library
>       usb: dwc3: core: Don't touch resets and clocks
>       usb: dwc3: qcom: Don't rely on drvdata during probe
>       usb: dwc3: qcom: Transition to flattened model
>       arm64: dts: qcom: sc8280x: Flatten the USB nodes
> 
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |   13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  618 ++++++++
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml  |  415 ++++++
>  .../devicetree/bindings/usb/snps,dwc3.yaml         |  391 +----
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   12 +-
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    5 +-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   12 +-
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   10 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   11 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   10 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   18 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  157 +-
>  drivers/of/Kconfig                                 |    2 +
>  drivers/of/Makefile                                |    2 +
>  drivers/of/dynamic.c                               |   20 +
>  drivers/of/overlays/Kconfig                        |   15 +
>  drivers/of/overlays/Makefile                       |    3 +
>  drivers/of/overlays/dwc3-flattening/Makefile       |   94 ++
>  .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 1552 ++++++++++++++++++++
>  .../of/overlays/dwc3-flattening/dwc3-flattening.h  |  188 +++
>  .../overlays/dwc3-flattening/dwc3-qcom_apq8094.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_apq8096.dts |   60 +
>  .../dwc3-qcom_apq8096_inforce_ifc6640.dts          |   58 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts |   36 +
>  .../dwc3-qcom_ipq4018_8dev_jalapeno.dts            |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts |   28 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts |   58 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts |   54 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts |   40 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts |   58 +
>  .../overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts |   29 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8953.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8992.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8994.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8996.dts |   58 +
>  .../dwc3-qcom_msm8996_oneplus_oneplus3.dts         |   56 +
>  .../dwc3-qcom_msm8996_oneplus_oneplus3t.dts        |   56 +
>  .../dwc3-qcom_msm8996_sony_dora_row.dts            |   57 +
>  .../dwc3-qcom_msm8996_sony_kagura_row.dts          |   57 +
>  .../dwc3-qcom_msm8996_sony_keyaki_row.dts          |   57 +
>  .../dwc3-qcom_msm8996_xiaomi_gemini.dts            |   56 +
>  .../dwc3-qcom_msm8996_xiaomi_natrium.dts           |   56 +
>  .../dwc3-qcom_msm8996_xiaomi_scorpio.dts           |   56 +
>  .../overlays/dwc3-flattening/dwc3-qcom_msm8998.dts |   34 +
>  .../dwc3-qcom_msm8998_fxtec_pro1.dts               |   35 +
>  .../dwc3-qcom_msm8998_oneplus_cheeseburger.dts     |   32 +
>  .../dwc3-qcom_msm8998_oneplus_dumpling.dts         |   32 +
>  .../dwc3-qcom_msm8998_sony_xperia_lilac.dts        |   35 +
>  .../dwc3-qcom_msm8998_sony_xperia_maple.dts        |   35 +
>  .../dwc3-qcom_msm8998_sony_xperia_poplar.dts       |   35 +
>  .../dwc3-qcom_msm8998_xiaomi_sagit.dts             |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts |   63 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs404.dts  |   56 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs615.dts  |   62 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts |   62 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_qru1000.dts |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts |   71 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts |  129 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts |   90 ++
>  .../dwc3-flattening/dwc3-qcom_sar2130p.dts         |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sc7180.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sc7280.dts  |   63 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts |  109 ++
>  .../dwc3-flattening/dwc3-qcom_sc8280xp.dts         |  129 ++
>  .../dwc3-qcom_sc8280xp_microsoft_blackrock.dts     |  121 ++
>  .../overlays/dwc3-flattening/dwc3-qcom_sda660.dts  |   59 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm450.dts  |   33 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm630.dts  |   57 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm632.dts  |   32 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm636.dts  |   59 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm660.dts  |   57 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm670.dts  |   36 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdm845.dts  |   64 +
>  .../dwc3-qcom_sdm845_lenovo_yoga_c630.dts          |   67 +
>  .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts |   67 +
>  .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts  |   67 +
>  .../dwc3-qcom_sdm845_qcom_sdm845_mtp.dts           |   67 +
>  .../dwc3-qcom_sdm845_samsung_starqltechn.dts       |   67 +
>  .../dwc3-qcom_sdm845_samsung_w737.dts              |   67 +
>  .../dwc3-qcom_sdm845_shift_axolotl.dts             |   67 +
>  .../dwc3-qcom_sdm845_thundercomm_db845c.dts        |   67 +
>  .../dwc3-qcom_sdm845_xiaomi_beryllium.dts          |   67 +
>  .../dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts     |   67 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdx55.dts   |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdx65.dts   |   38 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sdx75.dts   |   36 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm4250.dts  |   37 +
>  .../dwc3-qcom_sm4250_oneplus_billie2.dts           |   35 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6115.dts  |   37 +
>  .../dwc3-qcom_sm6115_lenovo_j606f.dts              |   35 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6125.dts  |   36 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6350.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm6375.dts  |   36 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7125.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7225.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm7325.dts  |   60 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8150.dts  |   67 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8250.dts  |   67 +
>  .../dwc3-qcom_sm8250_xiaomi_elish.dts              |   64 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8350.dts  |   67 +
>  .../dwc3-qcom_sm8350_microsoft_surface_duo2.dts    |   67 +
>  .../dwc3-qcom_sm8350_qcom_sm8350_hdk.dts           |   69 +
>  .../dwc3-qcom_sm8350_qcom_sm8350_mtp.dts           |   67 +
>  .../dwc3-qcom_sm8350_sony_pdx214_generic.dts       |   67 +
>  .../dwc3-qcom_sm8350_sony_pdx215_generic.dts       |   67 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8450.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8550.dts  |   39 +
>  .../overlays/dwc3-flattening/dwc3-qcom_sm8650.dts  |   39 +
>  .../dwc3-flattening/dwc3-qcom_x1e80100.dts         |  153 ++
>  .../dwc3-qcom_x1e80100_hp_omnibook_x14.dts         |  149 ++
>  drivers/usb/dwc3/core.c                            |  167 ++-
>  drivers/usb/dwc3/dwc3-qcom.c                       |  149 +-
>  drivers/usb/dwc3/glue.h                            |   22 +
>  include/linux/of.h                                 |    3 +
>  118 files changed, 8389 insertions(+), 670 deletions(-)
> ---

This is quite a lot of code and new files for a temporary migration.
It's also difficult to test these changes fully, since there are
separate overlays for each SoC and sometimes even each board.

Would it be easier to just duplicate the dwc3-qcom driver for now?
Making a copy of the current dwc3-qcom.c would be just 1000 lines of
extra code, compared to more than 7000 for the overlay approach.

The copy (e.g. dwc3-qcom-legacy.c) would keep handling the old bindings
with the existing code (that is known to work to some extent). We can
then improve upon the main version without risk of breaking any old
DTBs. If we decide to drop support for the old DTBs at some point, we
can just drop dwc3-qcom-legacy.

This approach is also not pretty, but I think the risk and effort would
be lower than making sure the overlay approach works on all the affected
targets.

Thanks,
Stephan

