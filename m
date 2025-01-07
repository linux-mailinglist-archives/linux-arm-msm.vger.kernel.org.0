Return-Path: <linux-arm-msm+bounces-44153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E3A0438C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6901649D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4841F1927;
	Tue,  7 Jan 2025 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMR06eDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52B51F0E2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261984; cv=none; b=Ci6nFe/v776fcx+oB4CGT+zh73B92iikYELq3btVWNWCS8r3N9436ucYwXIWPjWubQ0JlxbMFUvmFYgrwsnMX0PwFCu2EL+flPG5y9sIIyLNVGucBpJXuXOl2kWpuf0sW6GTBjeBkVNiTNoDcQnLprOIW5HqGDgvUNyJq31PS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261984; c=relaxed/simple;
	bh=rwk2c38iwo7mVDzYO6kOS55wSuGj9l6YRCJLROAsy+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A34NVypr60Np6qcYR6jOvXz9yeUdeCqu4XdUGRxKlchwuVHzZ5zEZiLTSCBrsVO7FKPWB7KJKFyi29JKNRlTZmLbYlmRAXvludMLXeSmpwvuQs9y4HvgsJfeAnztwICKL7BVOrkQOI1h93lYP2tvyZEuBvYxrFtjCWY9L0otsQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SMR06eDI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a227b82so14216969e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736261977; x=1736866777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+tMXMMx3Gas7S3TmVN5d5qx2ZmZWgcEv2HRlb3nK6A=;
        b=SMR06eDIEKF+dDTG7hCemZp1Pv/K7eLM5xZbPRV6kloIKGmk0xRsXlx8+6Q5VLqo+h
         oqoEJXkHsL5ng8WWWPv1ul7k6KCaxP88wkuuQNPt7Fd0l2Ku8kFJE5W+Tsa1OwMedpil
         678XlzXuLexANdM/vTDL0iH09nVylhPfiiCk9E4Ht6VADP+qDmfrqO/B7WriyaDI+EbC
         /FSb0gRJu02+Lmomcx/3+uzFDrlUfxAjUb01JOnoq5QKXOxsfk/2XMQDbFaBolFr98dZ
         XhV6cjhvlaxsbldPuDM/E7SqO4inpmOoU5u0bkOtfuymd+/Z02wMcF+SHutSjCjYsQwA
         BcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261977; x=1736866777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+tMXMMx3Gas7S3TmVN5d5qx2ZmZWgcEv2HRlb3nK6A=;
        b=fIK3d+efifyf2P7KHIou4LbfWRO0PDMXivTF8BQT5HDpg49U2OQauQGdCmPV/c86YT
         a5Gij3eu3KMcPLYPepZaKmicA1p5aIfauhBI2nTlDd7GcuUOyVjHkbRC0Fl9dnwt5/78
         tCq51xL/n0IBl7qeETaPnTReNEpBnWjgFGp57AH93n1Xlv4cQTKsZ6PECAC7D6M4t+Ig
         /HYN4z8MhXD3xRQefc+J924b6uVORuLAbRcl6OhTDXTwmXAw9HVPdjF7mYKQ2lZs4qp/
         /MxOs7K+/Q0xaBoNH5fkLf/8VTUiHGYo43LXCdyoQK/7fFhED9kq9PtalZjqvB2UXReS
         H1sg==
X-Forwarded-Encrypted: i=1; AJvYcCWzQaOK09LWWJ89jJfyeLaM0EBrJzAMgv62PJdOr0F6VCCnkOYApQmj5eESe7tpTQBD+zn1yHR/AAXIpkkN@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjbJ0M2NkhVzQuVywLaUlWIz9hCG5pYtdYrjAxKwbf+bU0Wm6
	cYQrDbXl14ObGJVvJZODOvLNsz7dxcwQ8JBBtbWykkBJ2EG7WxVmd0LRF+Ls8nc=
X-Gm-Gg: ASbGncs5Zg4l6bMyG8m4j7TiV9QUNs8DRrY1KxEMrLWk6HcMFt9G4Jk3hDbpNvhBRc5
	CutIle8ZCdKpVI1v4c0hS4/c13WsiBYqwTq4FWnt6kPgoXjZ4SvSIVZQK40+3KVYJESg7GIyv36
	sHNWT2gwQr3MVMOwqSQXKe8llqjoTkIMRTxYKj6cd3/lu8f5aurKBt2kqBvuzIKJouxY4B0sWU7
	sjJj2qgs65BPytCD6JNA1fZ5Vil57aFdIidS/UJDAjGOil+XrQEqwDvjEmbcnypyKxY4c8GGsmd
	Udc3/nBTXM2TlQ/KeQCn2QF5j5lAqXwUfns1
X-Google-Smtp-Source: AGHT+IEfA6+3JA9QoZe5TfehNOUHvzxEVNx4Xj3j6hOCVSTxt55YSawGeAotiCRHoqcs1nEyys1w5A==
X-Received: by 2002:a05:6512:12c7:b0:541:1c49:270 with SMTP id 2adb3069b0e04-5422956b990mr21327115e87.49.1736261976763;
        Tue, 07 Jan 2025 06:59:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e3csm57916231fa.114.2025.01.07.06.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:59:35 -0800 (PST)
Date: Tue, 7 Jan 2025 16:59:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
Message-ID: <hrykjklurrj3gqsauwtdiptyqf7uuiu5zuk6dtevchukrsrmty@tqgwqhtgqkbe>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
 <20250106-sm8750-dispcc-v2-2-6f42beda6317@linaro.org>
 <nasilduqcbrdtfnx7ef5rzp4blyvbwhyypjpkzlmv4o6oohj4e@gz2a6kffkf7p>
 <940a744c-ca5d-4edd-8a90-be2f8c7da7c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <940a744c-ca5d-4edd-8a90-be2f8c7da7c0@linaro.org>

On Tue, Jan 07, 2025 at 02:36:52PM +0100, Krzysztof Kozlowski wrote:
> On 07/01/2025 13:36, Dmitry Baryshkov wrote:
> > On Mon, Jan 06, 2025 at 02:44:30PM +0100, Krzysztof Kozlowski wrote:
> >> Add support for Pongo type of PLL clocks, used in Qualcomm SM8750 SoC.
> >> Notable difference comparing to other PLLs is the need for calibration
> >> for internally generated clock followed by wait_for_pll().  This is done
> >> in configure call and at this time clocks are not yet registered, thus
> >> wait_for_pll() cannot use clk_hw_get_name.
> > 
> > Is this still correct?
> 
> No, it is not, I forgot to drop it after reworking code.
> 
> Patches were merged, though.
> 
> 
> > 
> >> Locking during this
> >> calibration requires much more time, thus increase the timeout in
> >> wait_for_pll().
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> v2:
> >>  - EXPORT_SYMBOL_GPL
> >>  - Move the PLL calibration and wait_for_pll_enable_lock() call to
> >>    prepare callback.
> >> ---
> >>  drivers/clk/qcom/clk-alpha-pll.c | 165 ++++++++++++++++++++++++++++++++++++++-
> >>  drivers/clk/qcom/clk-alpha-pll.h |   6 ++
> >>  2 files changed, 170 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> >> index 00d3659ea2124e26dd50c1b4e88ba71c1411442e..df609f7e394de2dc73e60df01b1ad71714c0719d 100644
> >> --- a/drivers/clk/qcom/clk-alpha-pll.c
> >> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> >> @@ -58,6 +58,7 @@
> >>  #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
> >>  #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
> >>  #define PLL_TEST_CTL_U2(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U2])
> >> +#define PLL_TEST_CTL_U3(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U3])
> >>  #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
> >>  #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
> >>  #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
> >> @@ -197,6 +198,23 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
> >>  		[PLL_OFF_TEST_CTL_U1] = 0x34,
> >>  		[PLL_OFF_TEST_CTL_U2] = 0x38,
> >>  	},
> >> +	[CLK_ALPHA_PLL_TYPE_PONGO_ELU] = {
> >> +		[PLL_OFF_OPMODE] = 0x04,
> >> +		[PLL_OFF_STATE] = 0x08,
> >> +		[PLL_OFF_STATUS] = 0x0c,
> >> +		[PLL_OFF_L_VAL] = 0x10,
> >> +		[PLL_OFF_USER_CTL] = 0x14,
> >> +		[PLL_OFF_USER_CTL_U] = 0x18,
> >> +		[PLL_OFF_CONFIG_CTL] = 0x1c,
> >> +		[PLL_OFF_CONFIG_CTL_U] = 0x20,
> >> +		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
> >> +		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
> >> +		[PLL_OFF_TEST_CTL] = 0x2c,
> >> +		[PLL_OFF_TEST_CTL_U] = 0x30,
> >> +		[PLL_OFF_TEST_CTL_U1] = 0x34,
> >> +		[PLL_OFF_TEST_CTL_U2] = 0x38,
> >> +		[PLL_OFF_TEST_CTL_U3] = 0x3c,
> >> +	},
> >>  	[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU] = {
> >>  		[PLL_OFF_OPMODE] = 0x04,
> >>  		[PLL_OFF_STATE] = 0x08,
> >> @@ -337,6 +355,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
> >>  #define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
> >>  #define LUCID_OLE_PLL_RINGOSC_CAL_L_VAL_SHIFT	24
> >>  
> >> +/* PONGO ELU PLL specific setting and offsets */
> >> +#define PONGO_PLL_OUT_MASK		GENMASK(1, 0)
> >> +#define PONGO_PLL_L_VAL_MASK		GENMASK(11, 0)
> > 
> > Does it really support such a high L value, or are there any additional
> > flags / data entries? PLL2 uses 0x493, which should end up with 22 GHz
> > clock, if my calculations are correct.
> 
> That's the bitfield also in datasheet (except downstream driver). Not
> exactly answer to "does it really support", but not sure what else we
> can do here.

What is the PLL2 frequency if you program config->l as it is now
(0x493)?

-- 
With best wishes
Dmitry

