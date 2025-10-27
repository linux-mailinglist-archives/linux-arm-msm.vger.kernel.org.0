Return-Path: <linux-arm-msm+bounces-79031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6ABC11C11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BF96352FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AC5332EA6;
	Mon, 27 Oct 2025 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGzTlPCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335243081D9;
	Mon, 27 Oct 2025 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604499; cv=none; b=Lj3Zg7iJQNMH/68TyI7hQ2QS9h5fzd3zwUia/xngLHtO3qQOzg4EGoTsv4d9stW4Mcp+0DE8WAF/Fu37/qeHLI+CrheMYhLHhxe4ra67ksZrRz0HZtmXhwCV3OdQES2aSiUrhPDTqA1lgRg13Z7WyfX0kYS8al52SYt6rrkRjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604499; c=relaxed/simple;
	bh=HsfrcAUt0n8Jj0u/QP43HOhpqysYExflKx7pZd6EYeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mD/S5VWOeMt9ylwS8Tuo/Hu0vliQ3DZt/zrDSS67+vRNHO24a3IRmwM5BzmCtnTuvNtSwD2OftB17MinPtHOnDkEGQW9jkqADTnQL/b1QfFVjC84i+omIOIBAXg4q3RdumIfIONbfJDFBhye/2hR3NXm9CKfe5BfE8kLSSgc6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGzTlPCt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17697C113D0;
	Mon, 27 Oct 2025 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604498;
	bh=HsfrcAUt0n8Jj0u/QP43HOhpqysYExflKx7pZd6EYeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGzTlPCteexlfrnhnfGJ8F73LDVTlZLmdBDW+xPO0bq3PLXgkxP6yN2OHD2PtteBA
	 H6MqCTdyI9wLebmEJctOZJrAYueO1alT5Hk+U/DzWQ2pmtRnSXZ5/31D4dbEScm6S4
	 JgV3SCozQXC8OfEcKSR68UH4sOx1ehFO268ehmJyEyFEWQ3AHXSRzUIY91vCmtdr5B
	 fyq5Z4EbkOHzOeqN6p1HSiB4Pgaxp4m0f1GNYgYXW+MDurXXYRqq4kFf1s2u5wZvVH
	 bKREr1i94LGiE9ql+85fpTN9VFR6LP0YPJoaQJjhhLEBp+s8dzppnuSpDYa06Az3gZ
	 9pbnNVd0b+CYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties
Date: Mon, 27 Oct 2025 17:36:52 -0500
Message-ID: <176160465243.73268.7861590970194722567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-shift-axolotl-fix-touchscreen-dts-v2-1-e94727f0aa7e@joelselvaraj.com>
References: <20251021-shift-axolotl-fix-touchscreen-dts-v2-1-e94727f0aa7e@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 01:20:49 -0500, Joel Selvaraj wrote:
> The touchscreen properties previously upstreamed was based on downstream
> touchscreen driver. We ended up adapting upstream edt_ft5x06 driver to
> support the touchscreen controller used in this device. Update the
> touchscreen properties to match with the upstream edt_ft5x06
> driver.
> 
> Also, the touchscreen controller used in this device is ft5452 and not
> fts8719. Fix the compatible string accordingly.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties
      commit: e19dc81263853d7fb41944db9fe7a54400c0b1b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

