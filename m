Return-Path: <linux-arm-msm+bounces-68626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9AAB21B52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C10167831
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF732E5B1C;
	Tue, 12 Aug 2025 03:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQvIWMQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650B2E5B12;
	Tue, 12 Aug 2025 03:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967902; cv=none; b=OEe2tEHnSNCWg9+YApUDJC11Bl8ga27uHsONYpKQS3IWB2Bebb8Xn/8SwGkJ/HNakG9t9I9ynkkfFra5dLLyi2d9fDwDftYaiWOkcNv3DFOpAu2l38J88YEpBq5aDN8AmMkVqoy9b9oBtGK/1revZzLRPJ5l6CMVElSx8139twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967902; c=relaxed/simple;
	bh=JWKebbiMG5ibFDajIQCk6uT9iUuCYPCsFaK9FvIddh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFaIw1hB0tOM6e9C7zR3AS2HuvKCaK9CBTRnxYW/6o7zSVaiZHdLKy5uHRnaDaUopYD9gUx3cLTICgCKk9H2Br8Mgm0YP4mH/gVCCoguw93X/Y5UxdwQRbELnOCfj5eMspK2JSF7Ujd2qGowES6REbo96NdAGP7Esz5bGhyB0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQvIWMQD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B842C4CEF8;
	Tue, 12 Aug 2025 03:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967902;
	bh=JWKebbiMG5ibFDajIQCk6uT9iUuCYPCsFaK9FvIddh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQvIWMQD0E3UX6woCMGL4ddTaGL1MzLTJzCD3Cwg1Ufqkas+72nGUzs0TgU2fa0uJ
	 VubM6uC59TJJSUfvw3+zUREhvAaKapp/qDLkcSseKc2ZWlWrywsOVpUU6JX6pVANTV
	 apS6/VtTu0TMOUZJ8vsaP7bIMTCiuCd13PWovmfx2cpOA6amUdIzLAx09s9IyWnr0t
	 WxzaHgyj147uXSTGiuWCV3cs02kxh8GOWc4vqzdfmQiUpmTAc8tzc20B2c3PddY0Ad
	 4ytIkeWazKEvRNwQyMtZbnE0hTF8V6qwkgym8P7m2P/04HrLtsL2wiXqaGSktcWyr5
	 SGkFfxshAIBJg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Sumit Garg <sumit.garg@kernel.org>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add TCSR download mode address
Date: Mon, 11 Aug 2025 22:04:51 -0500
Message-ID: <175496788912.165980.17274100378129843095.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730132230.247727-1-sumit.garg@kernel.org>
References: <20250730132230.247727-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Jul 2025 18:52:30 +0530, Sumit Garg wrote:
> Allow configuration of download mode via qcom_scm driver via specifying
> download mode register address in the TCSR space. It is especially useful
> for a clean watchdog reset without entry into download mode.
> 
> The problem remained un-noticed until now since error reporting for
> missing download mode configuration feature was explicitly suppressed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Add TCSR download mode address
      commit: dc231840dca64793da7a80ff156fa1d99584f3ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

