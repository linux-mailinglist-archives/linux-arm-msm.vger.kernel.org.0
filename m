Return-Path: <linux-arm-msm+bounces-57766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FABAB5E13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A860465397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCF420C48E;
	Tue, 13 May 2025 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVH7WMgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B920C484;
	Tue, 13 May 2025 20:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169230; cv=none; b=NDNZbiJ07aKFI8Ql9kDubwv5hWBWMoH9O318XxDZ7BZBXdyVZZaJv8vQ3gMgZ2QRRhxpLV5dr1Pek4INCQe/ofUP1j5Ese1RnqclDPcvAQw3BJv5V9xgow7YE7IJddEWfqNDe0SwszHfbbU5rUKrpp9y6dLZ9a0QLDQdJgu+n8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169230; c=relaxed/simple;
	bh=xEFTJjM05Gti2SrgXjThZ8Fb4N5pqDHMA0Xso5K3R5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9//jwJaG6icBUDoeRv9o5enUyeQ+BUJQLmYprFHTN4553fX6WO919VVIlYlYe2borIXlGt8nH1vf+NgxR7we3D+Exl5vWEO0DP50V7++SsyrJxnbJQukT7oWAgoNCkvUBYz2cHw/pWB+TkRtDE4TXm77NL/QHjrFObrVIlICIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVH7WMgY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897EBC4CEEF;
	Tue, 13 May 2025 20:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169229;
	bh=xEFTJjM05Gti2SrgXjThZ8Fb4N5pqDHMA0Xso5K3R5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVH7WMgYnTDLJw69qUmm6zxCJiFQPEzr4Ar0EBEext4wYHmDMLFWL7Zxnq56gjp01
	 mTZVcks3JdQsNgVzQQQLmYghkrXw9BDzKJtd0phcgZOJPhGaMay7ewVwtJpkGmgjQ2
	 DLumeyCG+67XInsoRagx2kbUtNBTdu5ukksoY9LZ1853QI5/DOX/UeLagHvxES849+
	 Jg85BIEuKUebzpCdbPKVXs8h9v7+KBXGr4pbbOFjk13lKZQfDwVzPVZb9OxXaY6u+3
	 Dqs3cUbU60zOrId1RtmalNX4UyJENLqaM6dvpfsmwuNG5IxcS9/mzyIlacubylof/A
	 /SERrKNDk+eEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Tue, 13 May 2025 21:46:42 +0100
Message-ID: <174716895368.39748.7918502940727549188.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 May 2025 13:54:40 -0700, Melody Olvera wrote:
> Add documentation and functionality for LLCC v6 used on
> the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
> and supports slice IDs over 31, so new functionality is necessary
> to program and use LLCC v6.
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sm8750: Add LLCC node
      commit: cd81339e68cb11dbec90fd0d7de12a5c307c1fc7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

