Return-Path: <linux-arm-msm+bounces-14122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945487BB5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F156B20DAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 10:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A51A5A0F8;
	Thu, 14 Mar 2024 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="dy0FAtPv";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="6wF/ZzEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45641C63;
	Thu, 14 Mar 2024 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710412526; cv=pass; b=USvZF+LYFraIIvn3U7TjGbMfm68SEONp5i6Czvo3K6VqTjnjHNKmQPsgOYhnbocEIEIkLTQo/2PEYYlVfAY4rjxCbRcNCwPqNZqdDWlL6nEjKm9n+QUd/Tg26lgQkdSKYeGz3+dOAPfPEsIS618CrLmAObHHy9Kd3NzUuEd5hQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710412526; c=relaxed/simple;
	bh=cyEeG6oHajbU9HRN3AVDJrilxbg7x+M53eUX+Bz8Vrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqR9R4KQ1exZkh8hJZdPdVwxKMmtljDNrUvQbBPs/gEaVoFqdZT9u2A2sTQ7jBhRSZ49uIrew8Tt9DUZoa2yTyFn1yb8Q91aFBf7YHU7+4w0/P0SCxAiW9kKxE0Z3gU9PNbwadlejqtqDEyjybekpN2m0/pQ5zbS1LFGs5iuZzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=dy0FAtPv; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=6wF/ZzEQ; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1710411438; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KZGg4H5ZwbmwjQXq2xvKnJVk/7T1MdL3DzAjZ4P3izUnEVcp8OTNRZ7IIcby1Cv4lv
    J/eFzyc52OfHpG+AzDyGZ4Dtf+hLcIPipjFpRkDgr5DTm25OFMRz9jeYJ1GEANlwm87i
    38RoGScEkA5FvwdANcNVtIxANYbC7sOiKx1vdwko4mL3ClM8r+Nei0N5cwiDrDbB35ys
    kNo0lAsa6hYH5E7UiHfX4CBPZ0SUFO5uavkxrxCH1qCF1HUPv5CjXMrxb1B+vW9OE5v3
    fyNDiY2P5rvfQNdgdLGtGA0ZJOFsk0A6Hw5TV0axbGM8u7aU2jmpj+iVk9nuA91OV0hb
    6upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1710411438;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cyEeG6oHajbU9HRN3AVDJrilxbg7x+M53eUX+Bz8Vrw=;
    b=du5xzq+ot0ptQiK+xHua+LK1D4fTJxJvM4drxJWZII8WTnggJZP2y+vlBCVIDn0r1W
    i6CtWBPF+9GpzbmDQdeVpPFZw5uHxp+VMlUN2gpNNh51YwxZdjhE2Owk2Du5fD0k8L/X
    lOL0fP21Wl8fR3V82pPEsm+enOfcApufAUu2l4NiTuDGB+InMGbS4AscbrmgYJgOaZuk
    QpHwFrFOLVpueSXEx5ISR+V7OgF+nGlDJ5mss2P+9phQpYMkKWQTGZqHNi8rtjz3/rqe
    KqBF1eoxZkdnscCXXnto9H0uRDKZuu+/7llLOVIRCWPkZ8UPx4e5I2cXMTlb59PZxePy
    hiVQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1710411438;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cyEeG6oHajbU9HRN3AVDJrilxbg7x+M53eUX+Bz8Vrw=;
    b=dy0FAtPvhIOuvlDtHV3XTtSeG06fedAhgxREGaFOe298ltKBPj4LGxPFWqfqXE0rKj
    xuPcOwUV1Cf/NsUPozixyOSVH2RscRGmbgp/31bA0EcPm8Cld2JDmzZTQ30DVBjGFXkp
    WvKJoegAE5VLyzoLrB4h/UtUjoB1GvAJlG1xlPEkgiVcHi15Mj8Q1ROVRA5h6eesD41K
    MTvWtnfG2IPPDfNXaPm+hYFTX/rRQm6pE8AO+oPWmWZXfslmKfbQO0chKLQ7tgGyusiV
    7X+pLiwrKvavuJGWb7Kj+0rtNkSXnkofyCG0xsd7TP289tMHO+rGkuVC/WwaIFRSM55f
    TYUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1710411438;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cyEeG6oHajbU9HRN3AVDJrilxbg7x+M53eUX+Bz8Vrw=;
    b=6wF/ZzEQ05owbrTftYzw48cliWZqhFXCT2MF41+26PXRf9473GInAbfdxvIox9dIf4
    LVfsPfXQU6pI6ZZSX4Ag==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8p+L1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 50.2.2 DYNA|AUTH)
    with ESMTPSA id Rf2ecd02EAHH3LN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 14 Mar 2024 11:17:17 +0100 (CET)
Date: Thu, 14 Mar 2024 11:17:11 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: msm8916: drop dtbTool
 compatibles
Message-ID: <ZfLOp3aGgvGTRsT2@gerhold.net>
References: <20240314-msm8916-drop-compats-v2-0-5a4b40f832d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-msm8916-drop-compats-v2-0-5a4b40f832d3@linaro.org>
Content-Transfer-Encoding: 7bit

rOn Thu, Mar 14, 2024 at 03:42:47AM +0200, Dmitry Baryshkov wrote:
> Only two boards ever has adopted the dtbTool-specific compatibles.
> However the dtbTool should not be used anymore. It was required only for
> the old, broken lk1st bootloader. All users of those boards should have
> updated to use lk2nd instead. Otherwise several important features
> (secondary CPU cores, WiFi, BT) will not work with the upstream kernel.

Nitpick: The term "the old, broken lk1st bootloader" is a bit misleading
here. I believe you are referring to Qualcomm's original LK bootloader.
"lk1st" is actually the name of an alternative configuration in the
lk2nd project that can be used to replace the first-stage bootloader on
devices without secure boot, e.g. DB410c and a few smartphones. lk1st
has exactly the same functionality as lk2nd and is therefore definitely
not old and broken. Both support DTB selection, secondary CPU cores etc. :-)

I don't think we put the cover letter into a merge commit message in the
qcom tree, so there is no need to resend. I just wanted to clarify this.

Thanks for cleaning this up!
Stephan

