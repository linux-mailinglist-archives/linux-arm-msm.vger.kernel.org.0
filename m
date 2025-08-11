Return-Path: <linux-arm-msm+bounces-68590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714EB21930
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16DA97A1C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794AA279DAA;
	Mon, 11 Aug 2025 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltoDuCNK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB92797BE;
	Mon, 11 Aug 2025 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954842; cv=none; b=u95NUsf9qfGQbALaNxAaDKIn2B/O/WUUt9Z/7y0DOoopxStIuoYGtrpXnKgZqb9GXG9Kp4905pMGZ/99bcB0F1hTKwG0fPDpwKyAGJH02ZigNT6E54i0Wb3Z3Iqvm7/fHlbHlErcLGDC3ji8kmTy4IjnQzElhhJ0QtiOd6rwC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954842; c=relaxed/simple;
	bh=Lqr6IQSyM+y+qkAeEOaSOrLOkqbXrRsDKsFMRF9EcZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMVfjnxp/YO79a+Rb3dm5+KW3ysp9TCd+TsL/umi47JxO+SrtFr80LnWwqW955dFX0c0BkeGoJxjJM9L9NqBM0f4z1danic9LPVg+q7Nadyv+uWduRSME5mDryS9psStm7Efm5fWkwbjX7CyQCdihqkKU0TpgCT95536AfaynBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltoDuCNK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD9EC4CEF1;
	Mon, 11 Aug 2025 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954842;
	bh=Lqr6IQSyM+y+qkAeEOaSOrLOkqbXrRsDKsFMRF9EcZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ltoDuCNKstEEqXUtIsAtP38Aks3hhilzSgiu7aBuM/AX6I7ZM8NyPAqgtcbAAEsK3
	 0RZ7S7RwVxhESVg30SNrLy7uYZpOi4WtJVmosV6jcc+1NgxCDYrlqPo/tclgKE9lFj
	 N+esiA8TstXYK0BKMovEd127vIuUBnM5qfm7FN1/YwnbqC7pPLr5EOWiu1BDAaXs6P
	 +SntShHYVf6n1mLvHjmyl6+rdIbcLl8PrBqw22105X48aWXZgbvCWQKFdqhkmnzsvp
	 Mm0/XC7IuQk1oXvJ+6AkR3VVPZNO2jhsbUrvtzEuQd8by9PtYO+1Duq7KHp7YifEmB
	 CiXnk4NYhmQcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	neil.armstrong@linaro.org,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Flattening USB controller on SM8450
Date: Mon, 11 Aug 2025 18:26:58 -0500
Message-ID: <175495482458.157244.3348089786548203815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
References: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Jul 2025 10:57:37 +0530, Krishna Kurapati wrote:
> Flatten USB Controller node on SM8450 QRD to move away from legacy USB
> Qualcomm glue driver and make use of new one.
> 
> Tested the series on top of a QRD. As per Neil's comments, made changes
> for HDK as well. Gave a compile test for the sony-xperia-nagara changes.
> 
> Changes in v4:
> Moved pmic glink node above vph pwr node.
> Modified reg offset as per comments received from Konrad.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
      commit: f578e5f0b8b5f81e19e5f97a95e9cadf4e9c699d
[2/2] arm64: dts: qcom: sm8450: Flatten usb controller node
      commit: c5a87e3a6b3ed051466a20cb954be1c138199c56

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

