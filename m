Return-Path: <linux-arm-msm+bounces-87499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E43CF434A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 016F23178F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D25833D6D2;
	Mon,  5 Jan 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9NNUutz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8B281503;
	Mon,  5 Jan 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622130; cv=none; b=OXHaOVLqHqIYY5ngqXgOyJpOsiGLjrZFsAXcd8i+KGI3DLwXumj8mJq30h80WF0mz65IkcGrr0pPPpOgD3GJk15a66757d/p/6R9XUsIBfqwEjUMtbMnLA4nNHGA5zKzs5hatG14KpJn3f1EXs+M50BLUnN0RRXa5MvSLWMZvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622130; c=relaxed/simple;
	bh=AKrk6rMSdr6iFWSLk9qG9ncr8TOIE8ZHOgoyywWr3JU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BaSIMFR/DBRocSJK1Aaz58LF3FRf3VpsRGdHVkKW5sDGI2tR1Yl3g+pH4uEjCMnkO2609UNTexCMSZUDoMT7JEdfAL3NTHJxs0TPDj77pf0BMJmgy5vPcPzQIgeveSyRyUhbFs/FgU7ogP0XfF9Q1cF1u/3lxCBjg4IuoDejkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9NNUutz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E8CC2BCB5;
	Mon,  5 Jan 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622129;
	bh=AKrk6rMSdr6iFWSLk9qG9ncr8TOIE8ZHOgoyywWr3JU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P9NNUutzAiWVL9PnIIkkZ7qlowcP8+T2H5VacPP0l3NhqnAzdBx1j7az/V7SaLm+x
	 mZ7oTCqAy8ovzqxVPNdKjEsRHzHSfI8P631J3DzceaDuTKVJnOqixztRynM8Zn9CHM
	 0+UW3kZLisCtxNkQSL05R/nSfZ7XoYoJx8Z5tbkBp4ZmnL+0h8VwdMJzAnB7vSSvNJ
	 CL6NXe0qoAXLj23kReVo5FGjebdZoLSsQOyLaTDux134BnL8qMyfyOvG2R7vh7SGJY
	 ToGiorDyB1OylM0j/HieryenTzrXxTFzm/0FtcznPHfVMuQEHUh8fP0TB8NTFnVhrP
	 1EFkWKF8Q/p0g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingweiz@qti.qualcomm.com,
	yijiyang@qti.qualcomm.com,
	yintang@qti.qualcomm.com,
	Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for Hamoa IoT EVK board
Date: Mon,  5 Jan 2026 08:07:46 -0600
Message-ID: <176762206388.2923194.1326520031257393467.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210032817.1264850-1-yingying.tang@oss.qualcomm.com>
References: <20251210032817.1264850-1-yingying.tang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Dec 2025 11:28:17 +0800, Yingying Tang wrote:
> WLAN card is connected to PCIe4 on Hamoa IoT EVK board. Add WLAN node
> to support power sequence for this WLAN card.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for Hamoa IoT EVK board
      commit: 1a5d6d70c3b0b9b2007cd57001266dc018b6098e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

