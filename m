Return-Path: <linux-arm-msm+bounces-39915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D9F9E078D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE9E281AC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46E541A8E;
	Mon,  2 Dec 2024 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVYIoHGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D6BA53;
	Mon,  2 Dec 2024 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154671; cv=none; b=SCGZ8WkhVbExU2IKaROxTSGdGhSMoY5ZNobawkVxjxPonTmFLT2Zc4uoYsja8H/5rsNGD15ymbk2fApHgftXjBhqd26+yvV3pnGp04V/GxuSgaRLJYC36Zb+2h2ZSUQRC2wqws8sq7x8SCLPkUEkDBj2xGzuhJYV/38xeJ8H4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154671; c=relaxed/simple;
	bh=S3EzAyXQbFEbco1stL6qrSLyH5JnhnUAQuBubyVmlZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWEPBI2/5zCw7WZmh4VkdfNF2uo6hddsyu0VImKkL34PbXKaxAxiMKTC6raK496eJAOXX6G8oMP2k6TNC5685yP5sVOR/oAj+UD9+BWaG1b+HI+9BfH6/N1vGeLtoS4L5wmOq4SxwbXHaMC1+UcrCRADtnAIxTzypOvDLoy7l+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVYIoHGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49668C4CED1;
	Mon,  2 Dec 2024 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154671;
	bh=S3EzAyXQbFEbco1stL6qrSLyH5JnhnUAQuBubyVmlZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lVYIoHGzmB/fc3ul2A6CF80cfdpi1C+H340egzf/l48rpq8kkykXg8gTeqw+dxZUB
	 ydOPLDaHxlyu1a4CLJ2kUUoQKz5X7kcsTDhDE2OdI1m0eSZPipea3OUjI0mDpnaG2k
	 fNfhE/Uao/KIayDw8EUnXBPHars/sb22OCkz2r173KuI//yJHAgF16UH94SUwIaDQJ
	 x4m1Ju0wdijEdE81lzpLwUBDiYSD8grWMgMlWNniwUns0u4WauEOb3NgV06bYI5Zx6
	 ZnT9IcLNruJyY9OSpea+lCHXV3FbTEYmF69R52QTk4wN0HbtKzxw6UqI2dyyQUXtCR
	 DLEcsboz3D4Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/3] More Surface Laptop 7 features
Date: Mon,  2 Dec 2024 09:50:58 -0600
Message-ID: <173315466522.263019.10723340277793106483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
References: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 29 Nov 2024 18:20:24 +0100, Konrad Dybcio wrote:
> This series does the necessary plumbing for audio (alsa ucm & topology
> coming very soon), dual PS8830s and the PCIe3-mounted SD card reader.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-romulus: Configure audio
      commit: c1cd827bfbd766bf6ada5d0184486aaa6afd315c
[2/3] arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader
      commit: 42034d232cac5402a28d04122a398c311ae532d6
[3/3] arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
      commit: b16ee3d0cda492ded61f7224334e33eed986bd33

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

