Return-Path: <linux-arm-msm+bounces-79047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF8C11DD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58D0E4FD596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800F9341AD7;
	Mon, 27 Oct 2025 22:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9u1+D9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2033F8A7;
	Mon, 27 Oct 2025 22:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604515; cv=none; b=JVKagHuB21rs/MyEATXH8KJanYAgtxh0MIEeyTz3hQlmNRd5KFgTpeAVFMX1d7hgLNPYeKnrCxtTqZ4OAbOV9TOsmVN8IAxVLIz5DEXJIn6Pc3zpQ59YBqFE9DXD6RGcv/hSRt2dbjfv4Bls8/WFFBNCZGYAqCbslLGe4lpXBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604515; c=relaxed/simple;
	bh=/YfdVe7TkfOX3wAsEwmYfgmzARsBRLUVfYAqGcJZYIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6qnvIOEqvCIVZJbgN+M2xhUYxtkFxv+WCMUaLPCPZhF6f4QTTxe5QG2fw1DC0rs29XPCGXNbPuOCgP6WZfKMz/jFvRf4998hobbqN9jl/ptbDcG4k56lOQ/KG9Q2anpktf2IOSQE+yx4ghFhN4C/iD20sTd+FV2c/dWJra+SZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9u1+D9W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8314AC116B1;
	Mon, 27 Oct 2025 22:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604515;
	bh=/YfdVe7TkfOX3wAsEwmYfgmzARsBRLUVfYAqGcJZYIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9u1+D9WsjsnND6qwsr7ukTVQNjTA8H0m2/ANjHhChGmkbaHImAELK5oJ6k+n9lGF
	 BEldSMQUHu1KHqbeyh9aqAbK/vZJ+n9mmxwx283HrQSEsze0LdBBAkO4HcN+d6X/sU
	 POIdsdKvSfNoieeQv4vpXJFt6zcDUQveOBOvRgv+NEtHzOC47jrvhF295XdfMVAR+o
	 BZf57KWx6HCukrdVE8XritCT17/JkfKbMkcxBLAR/oCauvrAHOTivORRbkKT+5fucW
	 oJgTwuq4+VU0OJ0Ngwajf/C2pUMhvxlRDWlkzI6aH+LCpFFlsZk/yvY473Ld5N3I0a
	 ESi/yu6LzAwZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support
Date: Mon, 27 Oct 2025 17:37:08 -0500
Message-ID: <176160465214.73268.18072374873989105626.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010033728.1808133-1-le.qi@oss.qualcomm.com>
References: <20251010033728.1808133-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Oct 2025 11:37:28 +0800, Le Qi wrote:
> On the HAMOA-IOT-EVK board only 2 out of 4 speakers were functional.
> Unlike the CRD, which shares a single GPIO reset line for WSA1/2,
> this board provides a dedicated GPIO reset for each WSA, resulting
> in 4 separate reset lines.
> 
> Update the device tree accordingly so that all 4 speakers can
> playback audio as expected.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support
      commit: 210d525d9c4c321a74828e0e626df2598cc7ed97

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

