Return-Path: <linux-arm-msm+bounces-89462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6789AD38879
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 257473014633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD42EDD57;
	Fri, 16 Jan 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/g0emRK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B426B2DA;
	Fri, 16 Jan 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599556; cv=none; b=Owt4A0WBztNYQr3Qi0uiVrpZ1gKTE6YuSrnUCLB8za6uNfOzNdVkyvUCd8TXJDSAP2mi/gs3zqOLcA833ehVTDAvKYujzOmhIVQvIhx8/aeMZdHYz7Y03sLmcut23V902moQcgWV3bCMOxtZb4sIhr9bwpZBXr2ovf92Hzv/HM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599556; c=relaxed/simple;
	bh=dU1ZJpmB8wFSdQ8Q+uGZ7ThVEFJGL1T+vvKX6aQy2sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ul4gVm5EPJ9tTw1Nd0iGgP5ErjS0OmpoXEYMS+XkcAElMXg+bxiUp23TiND4urVQDeWwLREtRPj4IGzif1fWYhHBJ6iIyK8F+zDJoxuKwhlyZMJcY5hbuLVKiHsNBEfmX3/GUuCoUsXfWQ9jGjbujsFQ74nlcr/CXgOkt272OSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/g0emRK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C20C116C6;
	Fri, 16 Jan 2026 21:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599556;
	bh=dU1ZJpmB8wFSdQ8Q+uGZ7ThVEFJGL1T+vvKX6aQy2sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L/g0emRKxNb+OudWJfS9YKLkqCggShp9q2oIN7xXI9cY9ZSQLki6o7Sp8XHq/1G+o
	 WoJIyQWUBhMkyEcdd/nhU8GD5vc36fiUZ8AT9M01My/W1F6JDXmSyNlMf4e5QrZa+b
	 NOg3b6qg1AcU0w6YZ7BnvZ3VwnWptNYF/NdgKwgVlv5Y6Yf+4KMsTDf8Ti2QNE4Czj
	 aKVqWLpE/fEfooYZUDIbQwzQglg0Cyb0pNNIWhOqWI7qLE8XziB9H7oDBvezVW6pwm
	 f6uOLaitnxSw0712bmMA0sIU09uyfYu8Z6IV0n84geE2T3ZG0m2wMtKzV1rwXizROd
	 85Mj7MMfw/dUQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Date: Fri, 16 Jan 2026 15:39:07 -0600
Message-ID: <176859948753.425550.5670225773064210342.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Nov 2025 11:40:04 +0100, Alexander Wilhelm wrote:
> Currently, the QMI interface only works on little endian systems due to how
> it encodes and decodes data. Most QMI related data structures are defined
> in CPU native order and do not use endian specific types.
> 
> Add support for endian conversion of basic element types in the QMI
> encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> ensure correct interpretation on big endian systems. These changes are
> required to allow QMI to operate correctly across architectures with
> different endianness.
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: check QMI basic element error codes
      commit: 5a6d033c4905d78c9c05b1cab36c7e03951fab9e
[2/3] soc: qcom: fix QMI encoding/decoding for basic elements
      commit: d9c83903be080a6bc25ccabaafe5487836a7e1a7
[3/3] soc: qcom: preserve CPU endianness for QMI_DATA_LEN
      commit: fe099c387e06b566840449ac21008db1b25ad1f4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

