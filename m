Return-Path: <linux-arm-msm+bounces-70496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C90B32D19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC401B66CC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7312321A43C;
	Sun, 24 Aug 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgMUQyFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D04219315;
	Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004167; cv=none; b=pFMXsbteb906lHqiT+5o37EIn6bptY6pSjApnroAdoquRjWZ+1VeYOgZfBsjCmhkHsKmq55fpPTCD1ViE3UgRSiVJQK9JQMvIIuo2wlWe43T/b8a1iofi/BV0lJv/VHnDKy66u7drQuKgXS1M0J4gipHenyeQvGWY7bMdJcj5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004167; c=relaxed/simple;
	bh=hg6MdezxFyiTA2XfYrbbTxxhde8E6qHMRL5Sq+vk1l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZIBgHBqn4hsI7emLZL1ymnEjyCXDP4Pb6MJHfwk8v1EyBmW1vXcl4WnQsgvAGqEUvFcuQHcU1kNhkCkff6rVhBDC7GztzwhV4bZ1BiLQnOdMq7TBNKNUTQl3K/h33tBJ5r05xHuEimhZAFBbtEvpRJrETQWpwbpk0F1ma3THrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgMUQyFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47331C2BCB9;
	Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004166;
	bh=hg6MdezxFyiTA2XfYrbbTxxhde8E6qHMRL5Sq+vk1l0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bgMUQyFtWfS08rugruHFayJztukGAM5pvAikeij057SWN7KIPw7A71oQXxpr8uqM8
	 qnmNmqRJQkKzH9kbyb47dyq4srXWHo1B1UP02AdZRnAzT9H1KsSQKVV2l/ypAZdrqn
	 ffOPw6OA4lXYoLUV6Rgp78MQXBUr2tle/LRI3uHEB9vBDGwvESCRnUOTSKdG7mU7eY
	 QLFL5T8wKySuTNRkeZOxctBbxEV4FyIywe0E3I20HegST9hP+bFkRwAt3jhls0ipsN
	 DiRuVKyCZVhsabufWZuw9Ltl5Pw9NOhp2366YYjpfCR7URxfwJ5ZsS3fb5n/YRv7sl
	 S7HNUlOlADHaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574-rdp433: remove unused 'sdc-default-state'
Date: Sat, 23 Aug 2025 21:55:39 -0500
Message-ID: <175600415280.952266.15562716392863532328.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
References: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Jul 2025 12:10:13 +0200, Gabor Juhos wrote:
> Since commit 8140d10568a8 ("arm64: dts: qcom: ipq9574: Remove eMMC node"),
> the 'sdc-default-state' pinctrl state is not used so remove that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574-rdp433: remove unused 'sdc-default-state'
      commit: a300bbd90c3b3c43b1668e1923cd170fc8d5fc89

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

