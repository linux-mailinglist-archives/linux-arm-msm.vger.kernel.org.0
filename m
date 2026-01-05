Return-Path: <linux-arm-msm+bounces-87478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8ECF4242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6F1730268C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8710336EEE;
	Mon,  5 Jan 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgAa9DbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB43336ED8;
	Mon,  5 Jan 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622096; cv=none; b=sIqcOy8ei1NmPRifWGLZkTVRQYm8A3KosSq6yRvgLPxa5gmIrR0ANJBIl2iIIeAJA7BE8R8/BBzE0+ffRhBXxbsBngyQcNLhOjmJW43nJepYtYjh7zrKO3KwxBhEcGTasZ6rI88/nIuDuYNEGHUv2zjtk+avWpXjaPHz/5qeMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622096; c=relaxed/simple;
	bh=1iEpIgfmiv8+8wcsozdpc7FpCTnyQlRSWfi93/1ZTSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ox1M+/qGzgxig5L6x47y8cDvnXjaaaUWBJzkYerifGR6e/mCmiF22WWCMAVXN/hkji5FTeSalANK7hUrxFra+gWhD8uFCA3cH9UgHRNi2XMcPtqvcwm/zRUivOcXb7QmV0acvk5wzsLhKVl4//WzE0/O4UMUJnAjulJwwki7o7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgAa9DbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9126DC116D0;
	Mon,  5 Jan 2026 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622096;
	bh=1iEpIgfmiv8+8wcsozdpc7FpCTnyQlRSWfi93/1ZTSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgAa9DbCtk5T8cX1liD5jZ9lLokI0iwq66Ep0sanigoQ+32CQ0tyhx7gLdqf75fyx
	 fehrjkly/SxP5EE68JbNu9GMWb7wtmHG0px96FyUZTW/zjvUhc1Sate8NlFOXQzQ9P
	 oZEtArhX8+tJWUUW1q4JzdUgpmDQMgo0Lk4S02KaQmDWmYRnIE/x8btRlLXtzH/Gua
	 WdhVPisXNUEWjtvQz3zhzUCRR8wrxB7yRITTBFm/lXUDt5SZWZ0C50t0npy5+U4eA4
	 QZSelONdYgs72E8t9yR4HfJzSs884kyrjPq3lAcLx30aXqrBm3FXgsQX2C9JOvIczh
	 ASPOl3/h1GCDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
Date: Mon,  5 Jan 2026 08:07:25 -0600
Message-ID: <176762206386.2923194.409123689159947082.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
References: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Nov 2025 15:47:37 +0530, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI10 on the Monaco IoT EVK by adding the
> required SPI and TPM nodes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
      commit: dce54bba172e351777d3ddcec9f7d03bea99ddf7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

