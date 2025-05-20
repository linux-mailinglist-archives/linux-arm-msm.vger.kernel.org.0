Return-Path: <linux-arm-msm+bounces-58576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC7ABCD0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0DB24A4A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E909725D1E0;
	Tue, 20 May 2025 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdMVBfC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3371DC9B0;
	Tue, 20 May 2025 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707321; cv=none; b=NqU2cdD3EqB7clRbuRfxrdbwqJFwN+VSYISakvsfXCD9hIzw90EG/qXTYS/i4asRB6PseKGOF1Ka5RS8c9dcs/7LcFS0pDgeYQc9/sPhZn4waie+WAsp9VMjflGXBw6O/Qwm6DXWrMSNGPPT2iHVOFGF1n/XMwpl+lg7/g3OZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707321; c=relaxed/simple;
	bh=lFgOsNl1/3WMV2+C4PGop31YmB2c4PYhfiFT6NPiMuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg6RD5NVKBY+If4gv422M0dUXviTCau5sooUPkP89zNn2Yy5RTXqnZuVZg5R2u3rdO+r7dBpGIFthwLZwiAV6rvRZyrkTM4hbbknYgXPKuDprdBdaSddb+wFM6mXqbP4Lex1D4H8YnIFEdcDaqCaqKVi68uJdF8kkucuh5D7Yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdMVBfC3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B18C4CEEF;
	Tue, 20 May 2025 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707320;
	bh=lFgOsNl1/3WMV2+C4PGop31YmB2c4PYhfiFT6NPiMuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdMVBfC3sUtRiFi33Jc0MR646O4Hq82ARxN48paGb6FY4IAu+pw8egoIrCV1yqVlL
	 UvXYe3baTa6u0byrcfl2b6Ersfc6pzJiBRE5rNlSpJuOjD/n0rvpLwhXxQn5160nkN
	 I0X/EdvMils9j+wFLLZCowTOno88zpp/z6X+1N62J24ZTGIiRfsW5Le9fgRQdzRwRj
	 mwtGU/cCILC9Tlf4qzrnm0HZu+GVmo2Rn/5ocmljFG7mfOv1inKOqi6iMsYvRFZ1zV
	 +crlOARI16iGJgtktJxCoynhQnQDmnkWxS8ku5Rhs7Ha541jv+AXwlVPNJ65NTrQRO
	 wmS3sn9J9wbYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add iris DT node
Date: Mon, 19 May 2025 21:14:48 -0500
Message-ID: <174770727734.36693.1444766382414731621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org>
References: <20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Apr 2025 14:45:22 +0200, neil.armstrong@linaro.org wrote:
> Add DT entries for the sm8550 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> publicly distributed.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: add iris DT node
      commit: 41661853ae8ed3bb89817bd7a9376f7cf12a596f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

