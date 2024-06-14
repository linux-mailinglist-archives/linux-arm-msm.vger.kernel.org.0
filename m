Return-Path: <linux-arm-msm+bounces-22756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF190944A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5BB2843CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F03188CD9;
	Fri, 14 Jun 2024 22:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzidUlpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894D188CC8;
	Fri, 14 Jun 2024 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405344; cv=none; b=lBNIuHiDP/dbcyM/lVv4H5bbIE4F5tNjUeQWEMvC7ptE7I3T4mliiJvO2mfcYK3us5rrKSJiFH21ysRrzOPHefThmg9+jmJzuTJQ2FSaGF/hBIR6qaIph4bVHU9Op4rlZkdDUCufzCmDClUpbI696y36KEyebWuU8GHuLVSO2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405344; c=relaxed/simple;
	bh=VI2yIsy0exGOSIBpnyPVzX8QjmA6TwFkAVSh5Ww4+/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXB+IRIMmOSYpeEoiCWZOAKqNPEkHBNg+WZQIZ33jsOR/jQDNNvre8+WESDok3snMzQ1WDJwl8Dt4uscdYgfw7MH7Oq9te3Zo2jvDObNJ3YXuYJRbVe+tw/JsMBQTwMQA/jOIC9BQiUisar3ghRhZNcgx6KOqzA2aqKQyWzTazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzidUlpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A726DC4AF1C;
	Fri, 14 Jun 2024 22:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405343;
	bh=VI2yIsy0exGOSIBpnyPVzX8QjmA6TwFkAVSh5Ww4+/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SzidUlpcGiJ+85GhVsbPIkgUzYUTY3udpYsNB4a5z4tVc/iVZ5sW5YT/hrXD2qzBt
	 VG/yBFBN3fsg9ECNadgXCGdJQuI9TqZ7KTdXOQ0ABU3YHvJJxCQw5AP/zqu3KV/IbO
	 1LPLyaMnfeWdE3GTbgjW5hW4Ns8OXg47tiR7E0UtLIruxarqV0I8U6jOsYIh5Wpyk2
	 siQ4Zq5J2IHG8c6ZJAg3NS7xbF47ioh9SgoYUQGzuapOrFleFidN9cWuwJl9qSyufc
	 2xtRB623fz9YB46Cm4Gk/JtMUSIqB4a2I59v5xvasLIMIDRIHdLdgIsogi9XE7I6XR
	 qNiMlGW2EmyvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Use .mbn firmware for IPA
Date: Fri, 14 Jun 2024 17:48:52 -0500
Message-ID: <171840533351.102487.17147670405034568001.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-fp5-ipa-mbn-v1-1-183668affe58@fairphone.com>
References: <20240606-fp5-ipa-mbn-v1-1-183668affe58@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 11:09:06 +0200, Luca Weiss wrote:
> Specify the file name for the squashed/non-split firmware with the .mbn
> extension instead of the split .mdt. The kernel can load both but the
> squashed version is preferred in dts nowadays.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Use .mbn firmware for IPA
      commit: ee5dcd7393af9af3494f533a6308faa539bd6718

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

