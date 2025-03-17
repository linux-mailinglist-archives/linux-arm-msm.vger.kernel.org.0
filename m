Return-Path: <linux-arm-msm+bounces-51563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9AA63C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17015188F6F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03791A5B8E;
	Mon, 17 Mar 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQN4Uej1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34501624E9;
	Mon, 17 Mar 2025 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180177; cv=none; b=nynRh0XVIuORzgAl9dBguBrSdqOg6EUQdG+xH76DnyEhlum0HmjoTLuyUm3Ac8qFIRfuTSIreHoAntuXxK38wCqC40z4Rzf/hLk5lj4e9WemUyBoVcf2BZWeaP1A6HLIqMsp0kqbtsz6ZAFZ7dJPsLY4ub7O70ivJBLxxDiFEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180177; c=relaxed/simple;
	bh=WlxqLpk0gEWMM2XIgjKNndxINs1sSkKrOJwfBlmiKKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzJoXVgAmtg15mG92b1vRWI2xNPsshppt1SgP7496IaV8YcsPsF/AKznXkLGoQZNWJaZA/FlBFztAq9509oTRm/RaUzb2Fab6LJ7sGzJv6sMUm4yKJctfuc2ob9dtsq1V5+r2DUE+a85wDpTnUnXMgHKPdV5CYv9QrPYj59GXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQN4Uej1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50A8C4CEF3;
	Mon, 17 Mar 2025 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180176;
	bh=WlxqLpk0gEWMM2XIgjKNndxINs1sSkKrOJwfBlmiKKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQN4Uej1Az478wzVQ0vp7TQYTEW1Gbbqn8UahpmglGBKbHJNFfIVH+R5sghkRvEC+
	 6f+PjWni/lVpIbyXp3mbEfPxm+8e36HeBbKfj5W5xAxIrjMMRUWvfSsJciKwMV20VT
	 wy1V9Yf+2bKL8DS2+JW3VNpw/udQ6TKA93+W6g0frhMLq780fWXL/ue10EGB/HQ6n0
	 6Od7c3qg8VkVRw975FQpnk/CM6dkzMF5bt+sEZfPZp+Z3v1qy75I/3z0B8WyCY6BOi
	 SSzkWhZy431PPvCmfGCLqPDbQgS8okif2G3tke7b37hDocB7jkoeUifx6tJbHDch7G
	 jKwE2nBM3FNZA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons
Date: Sun, 16 Mar 2025 21:55:56 -0500
Message-ID: <174218015896.1913428.16214961717780608959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120064508.2722341-1-quic_mmanikan@quicinc.com>
References: <20250120064508.2722341-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jan 2025 12:15:08 +0530, Manikanta Mylavarapu wrote:
> Add support for wlan-2g LED on GPIO 42 and wps buttons on GPIO 19.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons
      commit: 4bf9fac3a85b90002de373b2f067864d837bac31

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

