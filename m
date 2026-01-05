Return-Path: <linux-arm-msm+bounces-87491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB9CF43C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0D23124A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BC833B95B;
	Mon,  5 Jan 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQfeYWft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F0339863;
	Mon,  5 Jan 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622119; cv=none; b=TyXLoKCEdYxqfmX/bbLSfKXZZDfDeD8Y4aYTzHJh/bt5GhBgZ5OJ6zj8hYaE1JHhaTOWKtFe1I8aHAMfMMFHHonOGOyegAFYHqnuqJ4986LQLrcjmJ2S8OrEQ/C7/v0JdcJuCYlQr86JiYmxap3RzHC8QyTzlvWYZS876gn2u6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622119; c=relaxed/simple;
	bh=CkxOzYPAmRYQoqEnAC5CPogB+3Yoo1J3wexKZQyjZaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcaLzMnXgaLPhwu6Ubo+URRBeGdABL6DDUbKC+JtH2aX7c2sRVE2rzHGSbWOJafKFt5RNASfsS5FTQwYC/kFzVlLxwF9YflCEaH+D+xzMumTHXWCy08nAgTLwHpe0AwvcaJV2S5H2g07jQqQKm6HrIGi01kCyXvONXvPzJBith8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQfeYWft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC0DC2BCFD;
	Mon,  5 Jan 2026 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622117;
	bh=CkxOzYPAmRYQoqEnAC5CPogB+3Yoo1J3wexKZQyjZaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GQfeYWftAuxMwM6aKg9Hhm6sEqpRy3z/FOQHbP8yV2pTnAHeTdkfpgPR79v4R4d/q
	 bjdTGGMpeT4EpvldqXU81jeMa6J8Jm03xsV8ISBVJ3rj0Lbk9m7TEFrApDq58W3aDC
	 oKZUY1vn+GZLxLYWMNRtBKa+i+fyF07Kn06ASQop/4IxHphb57z2NMhgOQ2jRxu4Ok
	 yrWv7chqaO5FXWmJ6Z/WTY2W3GkTJzcfVs/fxxIIhhgv83/yD/9/EOE3ZJKJl/IYYy
	 ZS288LGN+uJgN3al3ZATSz5w3oR26YxVpM+9ArRdHpS1SWQleoGdnFip8icD78IzVu
	 MJyk3CPKKAyLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH V6 0/3] Add SD Card support for sm8750 SoC and boards
Date: Mon,  5 Jan 2026 08:07:38 -0600
Message-ID: <176762206396.2923194.5132508000643913509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
References: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Dec 2025 13:40:14 +0530, Sarthak Garg wrote:
> Add SD Card support for sm8750 SoC, including MTP and QRD boards.
> 
> - Changed from v5
>     - As suggested by Konrad Dybcio align '&'s to the previous line.
> 
> - Changed from v4
>     - As suggested by Konrad Dybcio sort nodes with a unit address
>       (numbers after @) by that register address.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
      commit: 6e6cf8ff9917c7927a0e571a340b4effc45548d5
[2/3] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
      commit: add674d84596bfbcef956898327387d0d9489ab5
[3/3] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
      commit: 3d852462ecfeccddfe48b0eca2407118ba8efad4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

