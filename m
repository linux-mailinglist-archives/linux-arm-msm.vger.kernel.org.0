Return-Path: <linux-arm-msm+bounces-74178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 812EAB8951E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 13:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278301BC888C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 11:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C12C30CD8F;
	Fri, 19 Sep 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BC1M7mFm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D513D521
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758282880; cv=none; b=SOtPF7/EFK6R47f+WvZNoBIyHz8WuA96FCCfokysOwFKrm1G3CzGUjn1TVN1JsoaBGVLAx6syYPvuoAMrtbeYOK678IO5vMqrclK5Jp3E4HnlN+VlxGQ05TDtucPba2qH7uFuMalwZHAPxlcE2DCELWsVMk5v9n4dVr9bGTqAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758282880; c=relaxed/simple;
	bh=Iq/+HNrRZiJdlx1daWo5Fe9G3p7h2sfcOcvxda2ZB/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQBcVlq84KzwGtOH+84F37ONBD3VjKNUqxxDlCw6Hjnf8FsZidzdAr2VAqUiV1GumnoJ7vdTti6q1flPsg+v2bgKHE4yXdmxVlWN5G4bkH/rmzd+LfIJL2Q5kbGvp2WydjBGX9KFUsiA+zOcefBBbTFHv+u1/47h3C4+ZL90sIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BC1M7mFm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so18024215e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758282876; x=1758887676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw5JhaXdnoe3jqyhiF/Ntgpl9bjPmMJVwWBx3p8kIAs=;
        b=BC1M7mFm8byL9uXGvMTtnQ+thiPosrh4/zpZYinnYft5Eu8Kd8LBHryRhIhV+orXFw
         PFDIkxStwVm5BxCHF98YAM4OGX+B2VHlrxbe3OafCLV6oC6SLSGsovesRnLN5lO/LA+l
         MgqZtb++9leTtSmgI7BgQmCvdvPfmOaFRdN+bz7N1VJ+rgIUwfuqdcFY0E/L9LXrQ2SD
         ZUGW6LXGesEEgAWj9khPAn/7S/Lgm/YVNU6W7ODvti+Vjb8pjBoKkUjqH1jFrIUUMRZA
         qfE0kRQDmqt6i4p2nQ/AAwu3SPN9QJZcSc+lX/PKZ+KgyhT0lpN8vazdJCd6uHb9mdpz
         ++MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758282876; x=1758887676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw5JhaXdnoe3jqyhiF/Ntgpl9bjPmMJVwWBx3p8kIAs=;
        b=ZH5C4oJg7QrP5oXFrtPqn/yMQS77Z3yQrtehU+kvPO/m4RtdY7a9DC8fXuinmqhRpy
         +NZED7kv6u3p005epcEmcxfF1KUHdNyRl/p7YoT5uJXXY8FYZhzl4T61ptGW0UhsVqJN
         KUJGz0ZzKNaghQihHs0/Gt4yxqT7MFrrXEOsSpjT+KAII3utn/R/OVi8Na5Bpdbux4aq
         t2Bp7to0DTAF5FhPekTA77ckO8tWN4S40sPRy3jLbnGpI18vYI6UJKEok8aWdUYgBhjc
         lBgCdcs/0bqgMkP0uTu65s+RXIfUJhgxV331dMFklmdRzForTYjeDcBjsB8vfa0jPg+b
         sdJg==
X-Forwarded-Encrypted: i=1; AJvYcCUW19sfvdbjW87DtVWHDnNOThBzust3/0ex2F0gjf/IflXWl4iYJrsrDPsklUj0xch1BFRxi04ZjE+5JEzi@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4wqdijjk32nmXNwPCBS2AxE9k4oYkxUfDxtEz+wvM9ZhG+C7
	lLcHx6tbXygwXNSo/wCOzoQZihorSa1TtBoCTrVqK/GbFshrnFo5l4AYJ4eiSToPGjo=
X-Gm-Gg: ASbGncsekQRaS5qeFc8jPjEDtcqOn3ocnSBZC3rU5Y8gxh0mBFtbwxtXKlFhsezxYxL
	4N8c6LnFnN9g4H2OrhcjAw4n3RYzq6xcYR1IvS9F+26fz37ziopErq2dr4x5DxiXjuOE+4IX0UR
	DlgbsbU5E0G7jRJF5PNrcsCtrU+Fx+hYZDu4SRe8ZF/xt/TI/Q1dwv7dzGROaydBSlbCF2TIAAS
	bV83+nY4aAAfYoX7xHqbg6lxX1URMOG0R8P+sObZe/Wa4g1uKf78IjZ5oVSwOpI7KNv3cKL5MCg
	3b9a679f3b13zbCyyDEXBUTHkZOu5rZAjWH15BJvJ55oTYwZ6GzaaSjQoHZBZnkK0X4TS5vEF4A
	E4ItjKwME6wgPiPkQBWwNfQ==
X-Google-Smtp-Source: AGHT+IFty0LGXanrKQc8uiaU34t2aKCwoDXillmmR4k+u5DKXRZr2oxF+R0FQjEB+ClxtwJ90j4SFQ==
X-Received: by 2002:a05:600c:3e08:b0:45d:f680:3140 with SMTP id 5b1f17b1804b1-464f7027e14mr67841705e9.2.1758282876587;
        Fri, 19 Sep 2025 04:54:36 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32085823sm81620805e9.0.2025.09.19.04.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:54:35 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:54:34 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] phy: qcom: edp: Add missing ref clock to x1e80100
Message-ID: <qohctzmztibeoy4jv6unsvevdawfh2h3drrneo5wmbfkirokog@pfaz3vht5kjz>
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
 <6A43111ED3D39760+a88e4a65-5da8-4d3b-b27e-fa19037462c8@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6A43111ED3D39760+a88e4a65-5da8-4d3b-b27e-fa19037462c8@radxa.com>

On 25-09-19 19:06:36, Xilin Wu wrote:
> On 9/9/2025 3:33 PM, Abel Vesa wrote:
> > According to documentation, the DP PHY on x1e80100 has another clock
> > called ref.
> > 
> > The current X Elite devices supported upstream work fine without this
> > clock, because the boot firmware leaves this clock enabled. But we should
> > not rely on that. Also, when it comes to power management, this clock
> > needs to be also disabled on suspend. So even though this change breaks
> > the ABI, it is needed in order to make we disable this clock on runtime
> > PM, when that is going to be enabled in the driver.
> > 
> > So rework the driver to allow different number of clocks, fix the
> > dt-bindings schema and add the clock to the DT node as well.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v3:
> > - Use dev_err_probe() on clocks parsing failure.
> > - Explain why the ABI break is necessary.
> > - Drop the extra 'clk' suffix from the clock name. So ref instead of
> >    refclk.
> > - Link to v2: https://lore.kernel.org/r/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org
> > 
> > Changes in v2:
> > - Fix schema by adding the minItems, as suggested by Krzysztof.
> > - Use devm_clk_bulk_get_all, as suggested by Konrad.
> > - Rephrase the commit messages to reflect the flexible number of clocks.
> > - Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org
> > 
> > ---
> > Abel Vesa (3):
> >        dt-bindings: phy: qcom-edp: Add missing clock for X Elite
> >        phy: qcom: edp: Make the number of clocks flexible
> >        arm64: dts: qcom: Add missing TCSR ref clock to the DP PHYs
> > 
> >   .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 12 ++++++----
> >   drivers/phy/qualcomm/phy-qcom-edp.c                | 16 ++++++-------
> >   3 files changed, 43 insertions(+), 13 deletions(-)
> > ---
> > base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
> > change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
> > 
> > Best regards,
> 
> Hi,
> 
> I'm observing what looks like a related clock failure on sc8280xp when
> booting without a monitor connected to a DP-to-HDMI bridge on mdss0_dp2.

Am I to understand that this is triggered by this patchset ?

I don't see how though.

> 
> Do you think sc8280xp might require a similar fix, or could this be a
> different issue?

There is no TCSR clock controller on sc8280xp, so it must be something
else. My feeling is that this is probably triggered by the link clock
source not being parented to the clock generated by the PHY, or PHY PLL
isn't locked yet at that point, but I'm not sure.

I'm not able to reproduce this issue on my x13s.

