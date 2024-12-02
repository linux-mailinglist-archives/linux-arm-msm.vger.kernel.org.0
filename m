Return-Path: <linux-arm-msm+bounces-39918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5979E0B63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5220B435A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5696A146A69;
	Mon,  2 Dec 2024 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsYghMuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85814375A;
	Mon,  2 Dec 2024 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154675; cv=none; b=kKHhH2tSZUCjYj3DjJ3y4VPUr9Sa5pV/2BARwcw99MMPx2d+iG9OhAV8zC7XUfqHVeQEH3v1RAo8BZp4hdmbpZqXaIplRUAmoPt9SGS/vSguulTE7IHTgiOi9txwQZ1AQWl7BJKbBZCYenFo/Ygvni2MsM9+4g8QRszagYMUeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154675; c=relaxed/simple;
	bh=chSBd4V7M6R7ccMjFEIBv1djGqXeyU/hBrRINQab+uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aW9EQJBbn8nCfrq0YfQ7fPRfDbXfjlFOs6r/UzTBgH8h/t5MWCvDtAbjyRI6FEjjoz+hB4/eOb8AnESOe9UkIyZA1dyxX1ypZObLEMbXLM7BPylMvVazDN3ReEUPYG8X4fRc6VaB4+On5s97oz0OFjZbPOYkmuBpLAMEsygVbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsYghMuC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C103FC4CED2;
	Mon,  2 Dec 2024 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154674;
	bh=chSBd4V7M6R7ccMjFEIBv1djGqXeyU/hBrRINQab+uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NsYghMuCAkEm7F4RW0jShEj3i42wPbcqxZyMq56GJBJo+F5uFd1jwD1xvKF7UKk1A
	 m5/qHAw8zSLnpFeqPk1NdjLn6HUn9WisN3bLy/ZlAMir2Tj/JqhKa7n5lZpPtO1Q8Z
	 n7HalIY5inz+Xxjba7SSIWkw082wGQc8d+ORjg0Iw5s1iZV9++9k1VwfVeZXhxXJ/F
	 8Zuv1aAh4RgcXai4VhM4XEYJHSJj1ADLwLmZla1CFI+9ILiRRxMSAGtL3VVNwxuxCT
	 LFsqtvm9RGnSoXtTqdWlR30PqjPMhY+viqxCgLYaZAqnJKEb0vniJTQhAFTCIFfVxS
	 9RNbPW/6BKg/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add coresight nodes for QCS615
Date: Mon,  2 Dec 2024 09:51:01 -0600
Message-ID: <173315466531.263019.7584568403904604417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106094510.2654998-1-quic_jiegan@quicinc.com>
References: <20241106094510.2654998-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 Nov 2024 17:45:09 +0800, Jie Gan wrote:
> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
> Funnel, TPDA, Replicator and ETM.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add coresight nodes for QCS615
      commit: bf469630552a3950d0370dd5fd1f9bf0145d09d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

