Return-Path: <linux-arm-msm+bounces-21387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3C8D7396
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BED81C21150
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153A112B89;
	Sun,  2 Jun 2024 03:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfjSiHnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAF29401;
	Sun,  2 Jun 2024 03:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300437; cv=none; b=ZfumPSXkwqeHaKZSKSLttr5Kk6kZ5ZdRU3YnxdLIuP/EU7SSRnaNHx0JQ3ehJcNHAm1Z7WttCn3ltxfGrN2FPJn1vF3PCokpTvHvtDnqmVaBjUnsIoCDXyPrXUh0S1Kc2E/HNX2B2TXxn1oI8K1NrogC5N/Lvnk2itwrTu+P5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300437; c=relaxed/simple;
	bh=YcJtsSU5Js7guXA27Ve+JixHaddf146J06Mi/T3n9sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fimIgiWut5+SGZljp0J4NsDjee7iI3Ok/bpPEO0e83hFouMn+eztG8dwODMEhX6I76+e9FaVyHj15NOoDxzcV2RFgGtvQBoEkzkDCWlXIXxFWrSlR4DHGCJvi1FGwoq4GTXIM+fbFtP+rr4RzpoacNDshWpvB/m/bjH/Qh0OAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfjSiHnI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5BDC4AF09;
	Sun,  2 Jun 2024 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300436;
	bh=YcJtsSU5Js7guXA27Ve+JixHaddf146J06Mi/T3n9sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfjSiHnIIWMHxkhj9Zdx0Udn84PjAwNH3X2KHTT8QCfAW6/llXtYRHAP+yIpkk6nB
	 wMAvWgNmOVZLDKkn0VYzt2+znRkGwumwLVde2AuZNwdFFuUZYlpiK8IxGk7wxkTFVh
	 woFwSpGtW94PZTrtF3r4n54m67wco/sFvZDsOhFevGjXhrncesP/djH+0hW9DOiw43
	 HHsA8F4VnpUpS9XO/dJ8am5lFCnRFkpNHWju/pKu1C9jmH7X3YZ8Bv0tJSzqsZmJLn
	 pC83O8umZv4wfl0ZYefQAJp78THhw0iEfoPJkIbdPcG3okb9XoPGT17pXvUzYR+9NY
	 K1NmcWMlRW7Fw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Robert Marko <robimarko@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 00/14] dt-bindings: clock: qcom,gcc: handle the controllers without power domains
Date: Sat,  1 Jun 2024 22:53:42 -0500
Message-ID: <171730042588.665897.15541828738842172518.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 May 2024 17:46:58 +0300, Dmitry Baryshkov wrote:
> On some of the Qualcomm platforms the Global Clock Controller doesn't
> provide power domains to the platform. However the existing
> qcom,gcc.yaml common schema requires the '#power-domain-cells' property.
> This results either in a platforms having incorrect property or in DT
> validation errors. Fix this by splitting the qcom,gcc-nopd.yaml schema,
> which doesn't define the offensive property and use it for such
> platforms.
> 
> [...]

Applied, thanks!

[10/14] arm64: dts: qcom: ipq5018: drop #power-domain-cells property of GCC
        commit: d1caecddf9f4bb17db10c8a46083a70688d0f46d
[11/14] arm64: dts: qcom: ipq5332: drop #power-domain-cells property of GCC
        commit: 2ad7dd5479c04026f8421f12baf7a2b482cf0bff
[12/14] arm64: dts: qcom: ipq9574: drop #power-domain-cells property of GCC
        commit: ef3308cf52553522d619a858a72a68f82432865b
[13/14] arm64: dts: qcom: ipq6018: fix GCC node name
        commit: 6c2e3ca212dd57678fbd38d66d63a0dcab45e81a
[14/14] arm64: dts: qcom: ipq8074: fix GCC node name
        commit: a884986eb2f79b71a4d50fa1b8e205f1f00d9514

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

