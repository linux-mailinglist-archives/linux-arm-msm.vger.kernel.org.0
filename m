Return-Path: <linux-arm-msm+bounces-68601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7DB2195A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B3A46279A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B4B2857E0;
	Mon, 11 Aug 2025 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrBqi/WR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA0D23D28C;
	Mon, 11 Aug 2025 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954858; cv=none; b=Avq7IGQX16lIZaFRVcWR0Zhk6eCZapiJujEvy9EaQWzRsNSEMIx3Es6g2OCtx7Fl8Pa6nN4pBXfJDsmT4Sw7Dou36yMeekcfebuPTFxXnSI7UHRSiKpukT+Pml0vNXrZ5jZlkh3ay/kMxe6jDm73T43UZFpLNqOAciH5UPztOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954858; c=relaxed/simple;
	bh=+KHc0ZTSTZUn2+bcxloNRdbEfC4DpAZcNiZaz2p0UI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=smhcoGlmtyOq/wRnk51CRoZAeiMe9+Ti6g2KwaO1+sYBhzgzJXJYt2ZfsbbDrA8++lg2jkk5HoebpK1DzJNitFao6JvluNZ5Z8Ms+gWPD25+xcOBm7DL0inEJMT61deNT7e3brU6sNnHTTOiWGSp/u0CweCFdnjaxJ5MwPZylmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrBqi/WR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE12C4CEF1;
	Mon, 11 Aug 2025 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954858;
	bh=+KHc0ZTSTZUn2+bcxloNRdbEfC4DpAZcNiZaz2p0UI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UrBqi/WRvH4PezV8xmS8uTXOm9jFPE9oKuKR0EZkf2lVkIX/JRqP8gqr9hPvHEOah
	 8pjoMdNM9OwJxDRCPRSeYJj+6u2nm082GRe7n57PHnWMAPG1wGp2D6BD3/aahK6UW4
	 QszYl2YtLtP6fer/FAcNdWKIyyRoAMVYzevbyw3AvmWiTRcwro4qM2MqmFihTMPjgJ
	 bVMm+aGjFzv4SrhK87GfdaKch9BCOWnnVatX0cLbfK//neVo+RRXd7yBorJ7X0m9yb
	 cQnD3ONbbD4pvOOCuulZoFg9bHSWKcd7pO5AtpbAUAaiT6koByono0DGyjva1NSWoq
	 IrmrlOD8vQO/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Mike Titpon <mike.tipton@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V3 0/1] Add EPSS L3 provider support on QCS8300 SoC
Date: Mon, 11 Aug 2025 18:27:09 -0500
Message-ID: <175495482433.157244.13963673441225583796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722055039.135140-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250722055039.135140-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Jul 2025 05:50:38 +0000, Raviteja Laggyshetty wrote:
>  Add Epoch subsystem (EPSS) L3 scaling support on QCS8300 SoC.
> 
> Changes since V2:
>  - Dropped the dt-binding patch from series, as it has been picked into
>    linux-next
>    https://lore.kernel.org/all/20250711102540.143-2-raviteja.laggyshetty@oss.qualcomm.com/
>  - Squashed EPSS L3 provider node changes and CPU OPP table changes into
>    single patch [Konrad].
>  - Link to v2: https://lore.kernel.org/all/20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node and CPUCP OPP tables to scale DDR/L3
      commit: bebacd802b51fae87e04a0f2b6eeb66ac259c14e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

