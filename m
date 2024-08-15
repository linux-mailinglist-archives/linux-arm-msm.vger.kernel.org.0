Return-Path: <linux-arm-msm+bounces-28702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C1953C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 801A0B26AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1B16F0F3;
	Thu, 15 Aug 2024 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCdd2JYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E814EC7D;
	Thu, 15 Aug 2024 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754498; cv=none; b=YhkhVlVomkMFf1IAnTgDRWEWCGUg/Id6rzyO9cSPUURgWOPaQq5Alt4tcreEx4GDuTRh81vAIl//c6U+OZ3/4lxgc3L/+v5JHtN58t5RMXOXC/DnwYdk24qWavHYBFFpiNYMBQ0CjP8knvi7Qrz98YqskkVR4aHH2Ff/Ph1O0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754498; c=relaxed/simple;
	bh=vnKt66PEaEr0PQ7XQMJeldmOCNe7J+jouRfwjHYebz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9rhTfyiC5JsSBa768LW8+m7Ezmps4dE5pRlLTVAyobuxZXsLZirPRXg2rHJNTltUO8gqNWQsafX6ub33US85PfdDHkELrxKgQ6MiNXfHmZ4UeRKJr6TIQOnZ5znUvWx+k40XaRGNU36CRC3chdQeD+19At6+T6bUhn6zpyCZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCdd2JYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC984C4AF0B;
	Thu, 15 Aug 2024 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754497;
	bh=vnKt66PEaEr0PQ7XQMJeldmOCNe7J+jouRfwjHYebz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCdd2JYVEl+aw33aas1aeatcKDLgMswS8xaa23GXyfS3m8FdW1XfNMKCeduwGBXOS
	 xWsO0QiC99Myi+9x2jECFVOkeuLe2wKMHt1hL2L20TrfSSy05bHFvJTlpr8SqU5a/f
	 1HWCuNMkV1IEjjjeTuq/yG1fjSqXFsKjkQhcuQP9xSHr2GdNk0mZHXkgn5558H/ylA
	 o8PKAZN/5FFys3xB9x0WTElOYyCp7tT0wZtR1OyGosPC8TFA3woAI9WovZYZHnz2qU
	 WT57Q1i5oE6Tnux2modTHzD2JBGXvAzlp1WN/pub2rTbIrtCCO5dSsh56ykljf1F1h
	 zc7XGbAahD3aw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Date: Thu, 15 Aug 2024 15:40:48 -0500
Message-ID: <172375444830.1011236.6876082243371720520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806202218.9060-1-robdclark@gmail.com>
References: <20240806202218.9060-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 13:22:17 -0700, Rob Clark wrote:
> Use the correct panel compatible, and wire up enable-gpio.  It is wired
> up in the same way as the x1e80100-crd.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
      commit: c46eef29907bc1644e0ded4b99bbd0be5ccde9a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

