Return-Path: <linux-arm-msm+bounces-51640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B2A65A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FFA43B8A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027571B0F23;
	Mon, 17 Mar 2025 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUOj+Fz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2B01B043E;
	Mon, 17 Mar 2025 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231357; cv=none; b=V7t1prv+yrsJVb3bgoaAlHpyoC2XlgAZ3Ca8fBFgBY99LQmGet4zJ4nUwhlQTXiZV9ADjs4ZS2E3w/t6kwMqoQzbBQdAx/t72hZlMykVYz95ACSW1WyIsKl9pGzJfj0SSiecF6md3hSVzOzRat7jnUf946cu2G1r6Lz/dEUjfNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231357; c=relaxed/simple;
	bh=3LVlLlnoG9tLdeo7FvVmGhItTlSlYVxrMKAUSPQdUuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgd1rk7OTBxtDIOl79Gub0tecDaZNIQvzDba56WOiYSFvYobmOP3yJxOBIMb52Za45Mfvn1bhiANwn3IYd1mZjUCTpEnYUf3QVOgXqUgkPtFMQq2wLSAyARJ7X0LBEcsPY+zbxWeAP5L7HuJ/NXCnUTbp5WrvtdHtuuk0yIUufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUOj+Fz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3342C4CEE3;
	Mon, 17 Mar 2025 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231357;
	bh=3LVlLlnoG9tLdeo7FvVmGhItTlSlYVxrMKAUSPQdUuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUOj+Fz4bsGGbR3y776/086oSpbr2Uc84EZHAc84lpSHtDsxeb0azobOFMBoAFrOZ
	 Enlk3bRngeIj6ZXjx9p/+JOoAVy94HfWqvCBA2apKmLxPW8V8zmDiynwuXn8F7xCuZ
	 WkRZVKIHABi8RjpV5qyDrqXj6FZYHiE3cwpYNF4/+h5zN4nbopNenXu4Ik1dNp7Og4
	 y3ZbU03TVJMpDbXZvHziXuJoXwYymaR0INiKeh8N0wPvihbJ8aC7+yPCW1lofpI31z
	 E38dwzXLzP4jDg47swZSKsAHayItTGhQ1PRlx36DpkYsaM5za2teSu1JQwdfntU4KM
	 8sRonZVZoz8ag==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add RPMh sleep stats
Date: Mon, 17 Mar 2025 12:09:14 -0500
Message-ID: <174223135177.2001681.13269933501288643135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317-add_qcom_stats-v1-1-016ae05ac4b0@oss.qualcomm.com>
References: <20250317-add_qcom_stats-v1-1-016ae05ac4b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Mar 2025 18:08:41 +0530, Maulik Shah wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add RPMh sleep stats
      commit: bba4e13c0f337df4cab3d65ccdb5524eb81a00bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

