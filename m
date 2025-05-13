Return-Path: <linux-arm-msm+bounces-57767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FBAB5E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E1D94655B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F092BE110;
	Tue, 13 May 2025 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSTQvBhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C01E990E;
	Tue, 13 May 2025 20:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169233; cv=none; b=UUaSy7tgyl+mumwcNRRiTN8G7qOzEXcsmFcSrC6WaYCEhDB1LTSGVDm0oNPWgeb53HOAVC/VKKvhrS81ANrKPGsXQzm85QyBdZjdxRDiMV6JrfQUopfpdgUcj7aKfq4c2ZPBs55zHnE4SBiaKeeZibXzZyZM20mtxDXJNb54g5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169233; c=relaxed/simple;
	bh=yXvni7+CJdWN0JN/BesqjJ1COLppmWQW1B08UlJWARg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX97PejpLVrtlLCetqOGnNYfZj8NTHi/2Gq5lP07bFfR60mjP7OMgOiKoLfJ8YT4WFQLnlHb2J6Ch6v6hsAEIAOoVvKS36YS84X8hsVO6n0VCNYXjIsEppeykQSJra8wExAKgA/5pUewWSCyQFEwW0a+x0TQz4Ux5RLqlFXgS08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSTQvBhu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16111C4CEE4;
	Tue, 13 May 2025 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169232;
	bh=yXvni7+CJdWN0JN/BesqjJ1COLppmWQW1B08UlJWARg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSTQvBhu0kbLSUBUIxM+2qdFA7qBiiN6nxAzwmnCCZdiaR7pSTmzJebpRz78nM/pC
	 IzFB4tMH32cZUXE+QiyxSBbGrjprw+GiKL5QBe2UbMupmY6GjOpVUE3k0xrd9lfV4A
	 I22JmPk2AbJLRdMcH7PVSqXdqTh2P00w61NZ4SFNaBJuOgGFy2ia2QP5ola2CqXQMP
	 OlsNQjN9lcPvtFBsbEJrUAotwwj6ENh4hy/dEQWo0nf5t6H98+sGHIpRIVrlvrpr5e
	 kjgqOrrLRUCqjS9zhNByILY09+zAqqQ6mE2j4bch4sxvW+TPT05UmEYssCowah/wQs
	 941i7M6rG29Tw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8550: add iris DT node
Date: Tue, 13 May 2025 21:46:43 +0100
Message-ID: <174716895370.39748.9036624565948583062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509-topic-sm8x50-upstream-iris-8550-dt-v4-1-22ced9179da3@linaro.org>
References: <20250509-topic-sm8x50-upstream-iris-8550-dt-v4-1-22ced9179da3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 17:31:24 +0200, Neil Armstrong wrote:
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

