Return-Path: <linux-arm-msm+bounces-68564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC95B214BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFEC6283C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5982E7BD1;
	Mon, 11 Aug 2025 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmNnZNfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85BF2E763C;
	Mon, 11 Aug 2025 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937690; cv=none; b=UxDERvDt76o2lqZKdJSQBagzwsabQE8/9CbtRUNWfpcSHgzvsNni2AAUXEW3PYtmMeY8q6dTuNP8Gqd8MqxRlXV4ZWHPlBQU5jdBx8x98vrHXHx4NYkwx8bC9d9w6DYXu56hZzOXJFlPA0D/ilQQBxveFZokW5lTjlN05/Xn4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937690; c=relaxed/simple;
	bh=v/3AhALMDGedk/f309v70+iOf7U+008ncx6hg841DeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2gtXRsnkpX2xAkeS/sRa564o4PqsVw38/vurfUCqHrgPcFFX8DJzIBJxaAbNiEBAc95+jRVZWO5HnMSZnxEBtAFYT9MI8N2QrPRX/KH7f//JPooKoYMXb/B0k9wHt8AObOWONI5mRPAGzHdAxXmTbXmC/iPgH6peg+xG96AvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmNnZNfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26A8C4CEED;
	Mon, 11 Aug 2025 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937690;
	bh=v/3AhALMDGedk/f309v70+iOf7U+008ncx6hg841DeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmNnZNfJqp3nmsp/f5mDBsfzJ+ZzuokzZ6iIzEv301kJRkzJsrrg+WOTuv+2o+9BI
	 g1pd1Pyz5426kMRhYkgo9OgiA5brNZcsBpFq1o+MLx/Ddx57D+Bqw7DqBN35n0q5SM
	 5JwolNSILJ+8088eU729rBjyuKei+anUlJxtlCGIvukrWUCyP2s1zyFiPBkAAGxnkc
	 jlBbpaB41l1LMBzOZ6zZML5D3t7xpsFNZSbUeXFFVi2eXQ3dA4l3lZRSmYFa3dgruM
	 fj+6m5LOeL7CrTQ4kYYQTdya51EDU/rvo/SlEGSyVnnGoq0lPm14zFHds6JEhx7pH5
	 oMhlF1adSlJdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/2] Enable WiFi/BT node for qcs615 ride board
Date: Mon, 11 Aug 2025 13:41:09 -0500
Message-ID: <175493766102.138281.1834297937129386551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
References: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 27 Jul 2025 18:22:35 +0800, Yu Zhang(Yuriy) wrote:
> This patch series depends on:
> - PCIe
> https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v7:
> - Fix DT node order.
> - Link to v6: https://lore.kernel.org/r/20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      commit: e13555a3e17b572609901c0f1992f03243a45121
[2/2] arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes
      commit: b5634bf97913756c208bb29f6061ee39154458cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

