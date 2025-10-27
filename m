Return-Path: <linux-arm-msm+bounces-79029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C7C11BFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE921A289E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0687C3314B5;
	Mon, 27 Oct 2025 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPaaY/jW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28A53314A4;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604496; cv=none; b=A6BEyMq+qXGm5EyVjfyGCNhHlCxmptMzMjZxMWMSR7mr8RZVuCjSTqnWCvGHzx6u8uZSAN+HQQ01wKyAPMo3G+HkLSdIoo5qbYhavezmB2xZSPho/IQrwjUItT8xec9Tu/Mj+i7ScDGO+ywJERpjKw4+1R8+QT11X3l4jSxkKwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604496; c=relaxed/simple;
	bh=jssYa7+IMwvZemycj+BIVEijBHykpF6ceVXygIXGnh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jc2gfsxIPX3TaL31bRrBuyrZ9qjCvD1DBykfN72es0uWZ6vHC+xTJIHo7yttw3B7+h9vwdisxfAfrBv7mcagAq+cZM3adaU0SkCh/KPIDvgng3r7MiKHbGxxdeVV0zEXTB5EcwgDDxpmkXjF5sisW8CwxOhHtXK/TyzYEl183U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPaaY/jW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D26C4CEF1;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604496;
	bh=jssYa7+IMwvZemycj+BIVEijBHykpF6ceVXygIXGnh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jPaaY/jWNrxe3TPeeblKLIuUIKibuw+IC2g8OKX8t0TrgCUTjjWBqctbQjRvVIz1j
	 jhkXPbepTjHqyEwafQdGAI81UJ8wZ+79y0XCRlBBIym8g376xbYXZneP1953HCYekq
	 AY9Y5uwqmXvJh6XVBquaECxTj0nD5oJQtBUXmT6MrS4rF8jSuLOYXKlg7Ztouo1FVy
	 N/ORPxaOl4/NRR8q0Rq90HVrSl+qAE/xDMkKiA3t80/Mulv+qpoJcnVQVl3+y1uI5J
	 VCZxZ+oyq8Ux3XCY9BJ4RjyKJCNm9sM454YBGyiTssPkfYfxL2wIBYC40cQ+vFK8bb
	 0h/2E5AIrtvqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for sm6150, x1e80100 and qcs8300
Date: Mon, 27 Oct 2025 17:36:50 -0500
Message-ID: <176160465180.73268.9117580201716444313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Sep 2025 14:01:53 +0300, Dmitry Baryshkov wrote:
> Bjorn said to me that he disliked the conseqeuences of renaming
> qcs615.dtsi to sm6150.dtsi. Let's increase entropy even more and rename
> even more base DTSI files.
> 
> Leaving jokes aside. It's not uncommon to see different names for the
> same SoC (or almost same SoC, with no visible differences from the Linux
> side). The platform now known as 'lemans' is a good example, because it
> had been using SA8775P, QCS9100 and QCS9075 in different contexts for
> slightly different modifications. QCS8300 / QCS8275 is another example.
> All such names cause a lot of confusion when somebody tries to follow
> the actual SoC used by the platform.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: rename qcs8300 to monaco
      commit: e50e601ef5b96def44c9ca9685cda6832eb7578e
[2/3] arm64: dts: qcom: rename x1e80100 to hamoa
      commit: 8c0b058ab5983a4be6690a76be9b0294853e8e55
[3/3] arm64: dts: qcom: rename sm6150 to talos
      commit: 9a5b294dcc21f0b20b586206e5bab9969b4add1c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

