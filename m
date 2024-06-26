Return-Path: <linux-arm-msm+bounces-24203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEE917757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3315528312C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F68149C4E;
	Wed, 26 Jun 2024 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSfjXapy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5594139CFA;
	Wed, 26 Jun 2024 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376269; cv=none; b=OhpfaIs2gzeYexromUhKQ6+h5fJ8bWxX9EUWqwHYbq8C9f70GrdulqaQLOcwSCFtAYs2lYDK1i9kOC/+5jZ32MsGhcDVUlsa9Qw4RfMNLD7L91TgNhRPQmRaXw2nXxRrhnFD6yjmE7VTUS9Z38x1okMlI1Pxn/3bAROSFKxhmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376269; c=relaxed/simple;
	bh=xheFtNFg2IkR6SYEZ40DkWGQeQFXLKaIuvfLhxB0wpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRNHyAPSd/hvJs89GaNUCCYtfclm4/mx6dn+YxWj1EnCwjoGye968Og/88qd6IjrsT/WKjYDYunfICVQHe7R3SyRxUSYwYdlfDsqH3NYe12pIe60wubfAkxlVRLHTI/A8Uwr9u+A7d75oWBuht1Vs+ZdomdzDgkulBsGt3TtVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSfjXapy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944DBC4AF0E;
	Wed, 26 Jun 2024 04:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376269;
	bh=xheFtNFg2IkR6SYEZ40DkWGQeQFXLKaIuvfLhxB0wpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSfjXapyvA2NWCibThOtDtRoicPakLWeU2h669LjBiYeMEVC6ebJlN5phusKEafDL
	 k6lfWLPtU8jRmrvKfBi2RUjGpCXcI9LKlRQcsMdGlTX78SiFzqNVvb6xEnT6bbZ8yH
	 vJngm/DW/SCN/5ok9NAy7Fjj0G2WhtDZ9pjU1g4bbjmBvGHDCVQfBkuROQGVsobMBS
	 II1q8IvkaL5bXx3Hx2KB1YOGCWgSOuyi9tZGKUWeN2IdrXXxKKgtuXiGZ6n3Z0PR60
	 osVN4lJTUPMCPoCLbNYiwLpzQcAkvGTmmIbDANXA7TgqF0ArR3XTylFnjzxFWqh4jk
	 LFNrlLwmq2HQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: (subset) [PATCH V4 0/8] Add support for videocc and camcc on SM8650
Date: Tue, 25 Jun 2024 23:30:56 -0500
Message-ID: <171937625567.44413.15298354540853135885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240602114439.1611-1-quic_jkona@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Jun 2024 17:14:31 +0530, Jagadeesh Kona wrote:
> Add support for video and camera clock controllers on Qualcomm SM8650
> platform.
> 
> Changes in V4:
> [PATCH 1/8]: Updated commit text. Replaced :: with : in SM8450 videocc
>              YAML file as Krzysztof's comment in V3
> [PATCH 5/8]: Replaced :: with : in SM8450 camcc YAML file. Updated commit
>              text and dropped Fixes tag as per Johan's comments in V3
> Added R-By tags received till V3
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: sm8650: Add video and camera clock controllers
      commit: 0bdb730e63f6628b0f8deb3f11991b1d10f9bca5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

