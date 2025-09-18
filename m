Return-Path: <linux-arm-msm+bounces-74011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8CB82A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258B416A98D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778381E51E0;
	Thu, 18 Sep 2025 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrN12kny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B3F17E0;
	Thu, 18 Sep 2025 02:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162202; cv=none; b=UbETZ5CynrVFb7ibq3I6NaspIl6cHUeZOk2OTw4ka4YeCO814c3XrrpkXD5wx3CfMKbl5kWOe1Rs7OOpmc9Bw2RmKxS88QKsrLLq8zb15XUzwwI2W8IBaQzwQ4JNqJMidwkm2tSPV362n/XGWMw6/RvkLhA1TskpaNZ/hBqyeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162202; c=relaxed/simple;
	bh=SlDfDu5jtd/c21kpHNyWgd8FDlhNp2czwjgwL050tng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/8WXTlhQNW3vcbV1CWW7svzvV+zUzjd4BztgU8urs2lSytB4iQeuGVR6IhMU8xWDEOL27qB6x9S5H8ITUsI5QZWEfmhh7dirxFfHsdrNej/JkvUK9DYYUkeRW37Nkc9pFf1oRF7UZB5ABfyRX5oe4A5aqdttuEjOpozpYQ9eJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrN12kny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24608C4CEE7;
	Thu, 18 Sep 2025 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758162201;
	bh=SlDfDu5jtd/c21kpHNyWgd8FDlhNp2czwjgwL050tng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jrN12knyhSUT9skrc7tZCrmig36R+TgxibjOzFXqh3lrK/hc0PVnkSRgBG9lnt8hS
	 5d1MBM0h/nCIxt4PzBMLPef0UM3cptZ+9j34IedpegkS8Sofkwx8CHN3LpSfG9r5kE
	 28EziwtnEMa8HvnAi0no1tnxH/ndbVsdeMyML/CPe1Ft1PWh+RXIvzeQZFY4Rv0XOQ
	 KK+kLkrZ8lKWt4oHF1idAWKwbkEw+VXlOQGffbszXDb0nERGZFzXuEMsAQ+rbcF6gN
	 SZmgrhT6R8iD6vmzkynAjiDwwk1Oe3gMd+ia84vhWtPxUja9IJ/m1iv50P4mLlPFMB
	 Iv2gUmv0GhM5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: sort sm8450 boards
Date: Wed, 17 Sep 2025 21:23:18 -0500
Message-ID: <175816214780.142267.7746662397527053486.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916180409.157115-1-ghatto404@gmail.com>
References: <20250916180409.157115-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Sep 2025 18:04:08 +0000, Eric Gonçalves wrote:
> The bindings had samsung,r0q before sony,pdx*, which is out of
> alphabetical order, solve this issue by moving samsung,r0q before
> the pdx boards.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: sort sm8450 boards
      commit: 1081eafa1bca16d3610bf44f515550d060526dd4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

