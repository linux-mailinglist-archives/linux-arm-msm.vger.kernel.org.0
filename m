Return-Path: <linux-arm-msm+bounces-51477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F63A61B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC2542146A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18971207E19;
	Fri, 14 Mar 2025 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKfmmJ09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E270A2066F3;
	Fri, 14 Mar 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982496; cv=none; b=gxNylG0yZHqRTdyJa/kP0X3VK2/L0hIadUs4YcvXXLhsbwgZM70Y5mxzPKC0shRXkukBOpuKtKoJPwKNOb5zbRNMyy7OV3qtv76Gkg2u4/J3hn7hRr/92LG+fifWzVqUjxVaKSOLXEWDWXASZLPYeVekFQI+A3daFvBeTnhKock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982496; c=relaxed/simple;
	bh=nOoZ8I8NSq6UvSBmnO2H9l8pJMgKzawOe5CE1k7AIic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXs3u51GGJL07HW0KNcBYkLUDtbVXMYOAM2kgiJOyLe6N/EUKsZ3/m7T7mHn9+lpngQI8xvLBEfETE4XFGUJsS6S/pziJKolOcnzG5L92gTr5Pw9wR6Fxno0XXHWz8uRfGgy4r5mWsXAkg9gVFjTeYwaoDBOLbZ88lZLoxoZX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKfmmJ09; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A1EC4CEEE;
	Fri, 14 Mar 2025 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982495;
	bh=nOoZ8I8NSq6UvSBmnO2H9l8pJMgKzawOe5CE1k7AIic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKfmmJ09iuF9XauIIjDGcj8uveQXC9AH/wiVBFwWL5iBCRstyE/T/lhL5HlT9XPt6
	 75VzmBN/E+dfqUP8uMH/KFSLQB+TxQ8BqMeXtIrcnkuLMECLcxcI5ODiWvFD0yLOQt
	 tLWkwCaS8pVWCZYSUUpNiqBGt7ANhHWQXYegd92fWgFfNsJccPME7tEEpfT0SsQC46
	 SvDw+B5jHOHumIujYQJK+E6thk4Rs22A28mrBnsPbJYdtjRAux8hh2b9JJytq0vjpm
	 jWcfSP5sdRVyMDebDFHhbKA6YDn7uLOzD8YR3H9vxYvYtMyd10GnAxs5pGh3xy+dv2
	 sm9X9s03qNxGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-crd: add support for volume-up key
Date: Fri, 14 Mar 2025 15:00:51 -0500
Message-ID: <174198247895.1604753.1673192014495988057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307171222.7470-1-johan+linaro@kernel.org>
References: <20250307171222.7470-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Mar 2025 18:12:20 +0100, Johan Hovold wrote:
> Add support for the volume-up key on the debug extension board, which
> can also be used as a wakeup source from deep idle states (CX shutdown).
> 
> Johan
> 
> 
> Johan Hovold (2):
>   arm64: dts: qcom: x1e80100-crd: add support for volume-up key
>   arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-crd: add support for volume-up key
      commit: 9eca3fd5c336afc3b90804ec008f54ce59320aee
[2/2] arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
      commit: ee95bcc58890e63f52fdb9ab096c3d7b9cb889cc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

