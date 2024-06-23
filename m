Return-Path: <linux-arm-msm+bounces-23799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FE913E54
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBD52810FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9565318628F;
	Sun, 23 Jun 2024 21:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgV7ps5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686B185E7F;
	Sun, 23 Jun 2024 21:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176546; cv=none; b=a2g5wgqp78iPq/JJrnQqA4uLTc45ipSEpRJbglgo0dLeSzlOOOBc0jY6rRE1Aq9+K4Y9sgVBmBaVDXm7e1ehqtW3mFB2zrbf6ihODXERT/4dIUrdRN6LaMDaDxfLDYWqNE+g/YFzhTIm60iQJ+mLyAVlc3Px2QTHE6ZmbJEZMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176546; c=relaxed/simple;
	bh=yvJT/cmcZAfndheoRjv8i9540icE9Y7nROXCDIiKrso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srcR47iW637W2NOiCx6t5dhx5dNQ5CQff1DOhlItdoiIZrsv/jxs9/mkJhLmrH6ShjKT89W/RhsKhyIkm+k22vcWhg3pUE64X5nEV/Z8vAXyp9Vb7sxzWG3SeK9ROv0Pyka1C+JE2pef1KWu5HjpDYeBQsg18jz7Oa054ReiOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgV7ps5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6CEC4AF0A;
	Sun, 23 Jun 2024 21:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176546;
	bh=yvJT/cmcZAfndheoRjv8i9540icE9Y7nROXCDIiKrso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rgV7ps5vIFmOUe3dZ/DXur1MNZrLe/D9CrDQ96oZLNUsm5bx9h6pmYyuPzDGS85jp
	 /D1EvqrYwkaF7m/K3gTGynLkatjOUxG02qUDpxhEJJTR4WIGhZTjREctSm8kdExwIi
	 dg2Y4D5j6v5g4vcXi+ba9a5tYTMdQ3FyHk8QrokFZSSLruQXdqTAwQuxF4Tmt51UXE
	 /BZFNE/BfSRsXPiXXaN2+MpHx2s/PRlGphGukAMhiqe1vMNriH+V6KlND2RIvkeJyf
	 YUINRyqsE21s9CibgK+gLdPq9DYc+z+Gs78R8SPQ5z46wZLXePWGMIDuSsOid3qzfT
	 cu56JrBHlIRGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Use mboxes in smsm node for all dtsi where possible
Date: Sun, 23 Jun 2024 16:02:17 -0500
Message-ID: <171917653478.4580.6060139020291195660.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Jun 2024 18:42:26 +0200, Luca Weiss wrote:
> With the binding and driver patches queued for 6.11[0][1], it's time to
> update the dtsi files to use the new binding.
> 
> [0] https://lore.kernel.org/linux-arm-msm/171840533352.102487.9576671528001022676.b4-ty@kernel.org/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=drivers-for-6.11
> 
> @Bjorn: I think this makes sense to only apply these patches for 6.12 so
> that also in the arm64 tree the driver will exist already, so git bisect
> is not impeded by that.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: msm8916: Use mboxes in smsm node
      commit: d605f9c75949997150dbb32bf082695326d3e110
[3/5] arm64: dts: qcom: msm8939: Use mboxes in smsm node
      commit: 9f8b7c4e3d8bbb6eb787752ad14a82e714d917ff
[4/5] arm64: dts: qcom: msm8953: Use mboxes in smsm node
      commit: e36402b55684c64af23575f39e0a6ce27272b5f7
[5/5] arm64: dts: qcom: msm8976: Use mboxes in smsm node
      commit: 585141c57a49315f6522d5f7265a3f1aa05424c1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

