Return-Path: <linux-arm-msm+bounces-33403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F5992F5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64826B2528D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4517B1DC19C;
	Mon,  7 Oct 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gttwd9We"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26B1DC197;
	Mon,  7 Oct 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311195; cv=none; b=GQB3bgAX1tVOQNySSbP/kebSIp6Zl6oF0S8r5yL0gEfqEHQEyuWAV+kPWnQ867MEaFAiKxvsQFpTknhKnQ5PzPeZCn/WM2OZnipeih7Z17Sy1GA4f51ZMapzGA0AfkhMVlcJbpoV073Aeq7qO8iopRBLmSH5k6UdmhJ+V1N8Jag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311195; c=relaxed/simple;
	bh=zkoNmtso5xA+cTyAO8a+D45OBef/71DfYRkgFWzpqO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z565ujz4OzxcrOZZv+ItW9GSk4kdp2UcnlF2yT7GZoqfty7DPfM3z35CtjlDgHupPaV3oyVGX4s4/B22dPNV4vbkeRNozLyfNu8ZPZTVyoW5XFLqGJ65r+fc7BH//hFQra+DzvyDgXyqP9NBSNep9egxKNxcc5iR76ipbwMTEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gttwd9We; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407B5C4CED2;
	Mon,  7 Oct 2024 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311195;
	bh=zkoNmtso5xA+cTyAO8a+D45OBef/71DfYRkgFWzpqO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gttwd9WeLo4yzKsvMOmQyB/LnE0y94TkLQI3nmeE2LfkLUpko51Dqgh6pCtPkLUXI
	 GpaG5tKalZlLfZHN7rq8kOhWGHP4MUzz5SbmAR6HM2C52Athbc5IEDx1GqPc5slVFu
	 90ZGSEsNFeiThpaGRt8jJmRFJFrSlwKnB8Utv5/jzdbGQDa6z6L41AKr+QH2SRuZkK
	 ICvkcFzkcOLZ271bv7OUDjBsDweXtBajnkWYBKYhYP2wPM+w1GnAkfCV3J0wTqNGjW
	 qh/Ag2KAUgm22TRgnBNA005VLZDCclpajg90gP6MqUAjUsLVbriGe/ropd+Ohu3CVR
	 EnDkXdzm8CjpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6460-rb3gen2: enable venus node
Date: Mon,  7 Oct 2024 09:26:07 -0500
Message-ID: <172831116163.468342.13335798783575290321.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>
References: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Sep 2024 14:54:31 +0530, Vedang Nagar wrote:
> Enable the venus node on Qualcomm Rb3gen2 so that the
> video decoder will start working.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6460-rb3gen2: enable venus node
      commit: 17a809b35dd9542a46296e80e7dadd88849e73e9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

