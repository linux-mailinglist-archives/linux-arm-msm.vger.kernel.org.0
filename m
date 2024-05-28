Return-Path: <linux-arm-msm+bounces-20693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468318D12D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4809B23122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AB113D8B9;
	Tue, 28 May 2024 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rshabBSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4513D8B1;
	Tue, 28 May 2024 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867186; cv=none; b=NF9+mCRdeZfem3cjOTtAcfQjUPdv7Vo40KLwGs+jOaZpEoc+8rsWxFSb6fm9vxxREwztOlv6FjAKCHvXhFVNUpxfowXWPEiP/MXNU0va0STTJNYve9AfCmnkinXqqePeIT+b2TSHShzparkX1iGShHjaklkKTG/AROHpF1YRMe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867186; c=relaxed/simple;
	bh=uwvq5Wedl1N9KReTFf0091UdUiKNqGpr5XM3LynNTQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiIYbFzrQnyzwssbI5GMU7s55rWaY6hKy8PvHXKdf86tC7frEvYbpEQX19b9z699WcmfB2iplDoiXkUxaHTV9kzOtmQ33W5GvVs9fXcDHM90+XBSNexrGj4MurDWHhZXRJmpbDCP0fk+nzkD345m5G1pSIkrRbUtRNHGEsBMwPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rshabBSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC7CC32782;
	Tue, 28 May 2024 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867186;
	bh=uwvq5Wedl1N9KReTFf0091UdUiKNqGpr5XM3LynNTQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rshabBSjQ/nqlyxO3eB7wuQk8ErKBGkw3F+xkyHQohi5w8UuWpyAqkLjaJxxbzA4c
	 1FtQVfYEtNhkiMwLoydR+Hf3k3HGFY5uA3y15tV19DSYh0Vc9ZhM5cq7PmfEHdq3pz
	 gsb0eHF9mfXyEasue8r3M5vBKCVSEo3CE6i3BUq9uuQIJFSy6TbORam0L3EmLJbiE2
	 BMY4WKaSwzmtYft9cF+jPKkd3GPk1Ek/uJZsaXm1EryI/nnHKUgJxArlJu6r9iPGAv
	 WokFNojBWc62OljeOPvLzGuHjAqhcnWh0km9cvFQgD6aVgiQkAdUHm5hKMy1Rf3TZT
	 w3125J8Tnk3ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Song Chai <quic_songchai@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	quic_yijiyang@quicinc.com,
	quic_yuanjiey@quicinc.com,
	quic_liuxin@quicinc.com,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: (subset) [PATCH v1 0/1] arm64: dts: qcom: Add coresight nodes for SA8775p
Date: Mon, 27 May 2024 22:32:26 -0500
Message-ID: <171686715150.523693.9600444026133556372.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521011946.3148712-1-quic_jiegan@quicinc.com>
References: <20240521011946.3148712-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 May 2024 09:19:45 +0800, Jie Gan wrote:
> Add coresight components for SA8775p.
> The device tree change is checked by dtbs_check command and these components
> all tested with SA8775p device.
> 
> Jie Gan (1):
>   arm64: dts: qcom: Add coresight nodes for SA8775p
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add coresight nodes for SA8775p
      commit: 6596118ccdcdb3ec5e417293e43bf6b122363a37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

