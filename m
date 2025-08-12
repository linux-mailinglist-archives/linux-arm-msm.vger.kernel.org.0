Return-Path: <linux-arm-msm+bounces-68623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3AB21B4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 761BA189FC33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECB82E5417;
	Tue, 12 Aug 2025 03:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnDaSnPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A192E540A;
	Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967899; cv=none; b=Kc+eaAanAbEwNUvouv4WRP/axpmxztOMyD6M3TFUXQw2gpijQsXz1BB9hxCt1xz6XBT5la6tK3aUEKQG+27m74mDFg/H1Cbrn1WEsvQEdRFH7NESV3OHP8QzyeN14sfmjMn+xdo2ioaR2QUW3+94OSRd9iKFQSY5Hvis43bOkFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967899; c=relaxed/simple;
	bh=xo58y1MDcGiqstndJoFb6xcQeZgrGSPnsQNrDsmfHZs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDoeQ6+QW2oMxCt1OkYtVlli22sqM3abjzVPhFBJzAFv45f00s9xG5ZY9mkSjj7ttx4MxsmM5oyOSurroIxtPj7YFa03kVJbVT2+NIif/TmNy4IgdR8A2QiGtWB0p0aOOJwVZxvQ7f+O3eA4UOiTBR8jFlwhLoEqcMyshBB19zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnDaSnPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4838EC4CEFD;
	Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967898;
	bh=xo58y1MDcGiqstndJoFb6xcQeZgrGSPnsQNrDsmfHZs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RnDaSnPzc0o5oznt0L6gKnOfF4YXXNBiSHdmiXsjd57fpBaAE2Kkfen+se0+j4qo9
	 cLIyIFINSOZUxd/lRdLkC3lwM831kNIYZ+lzVSwX0R1eLvBvqjbtnNMJeROPQT9T7q
	 nziuWRIrhjHZQDkyR5oAul88CThIYxvD8oqnA2ENbXO5ewBRzpWLvyNI8/5DeaT3w/
	 Ypvs0Nvmu0CoG6sjodPM2WAff2nc78MQcKSayrbNSVRS7/je2naUtZYUe9BzMhLW/0
	 hyjGjxDUuSI3UQ/8wCpxVRMYDTuuChNJPJwvU8FQB5VyPEF67aUoQW7FdsgyKjEzs+
	 tVAoPEQTW6Zaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google-sargo: enable charger
Date: Mon, 11 Aug 2025 22:04:48 -0500
Message-ID: <175496788910.165980.13558830629669575275.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630224158.249726-2-mailingradian@gmail.com>
References: <20250630224158.249726-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 18:41:59 -0400, Richard Acayan wrote:
> The Pixel 3a has a rechargeable 3000 mAh battery. Describe it and enable
> its charging controller in PM660.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm670-google-sargo: enable charger
      commit: 8839b8e6e849e209b52bf0ae4d0770d89c036b0e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

