Return-Path: <linux-arm-msm+bounces-50237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FAA4E8CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0EC17D1C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DFE27C84C;
	Tue,  4 Mar 2025 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/9qrtS7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7BC297531;
	Tue,  4 Mar 2025 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107626; cv=none; b=oL8LfHFBId8YRPP11n53MGrOIcGhU7SzeyRegzQUwdTKRRChAXwzR+pqg7bzhRfI0rRcPXVGGPV0UP4djoOjKQ33tF6n1KIB+2nl9zPsABBJzh1miAU/WE+mI1zZKYXo6z+VoRL7+HjZ8tKQibzx3069XpwxgMMH3NPRYimlnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107626; c=relaxed/simple;
	bh=pUu2d22qYVrLa+Mu9wVY0IHyvP4C0hcCN9akYiGoTn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L2p5OpbmMiP0mcjKAEtQS7d3EGWB4z12Qox9uDqKnc05pgVupx3kPxm1zKLcInme2+n2WyL593NpxNPyI6Gv9Nt5yP1k66iHIdapD9G9l8iNbG1PhJUaVsvjktRW8s4upiQ/nt9f+PVHh1kaO3rXnxoapdQXh4XR7K1SOgVoMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/9qrtS7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933DAC4CEF2;
	Tue,  4 Mar 2025 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107625;
	bh=pUu2d22qYVrLa+Mu9wVY0IHyvP4C0hcCN9akYiGoTn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/9qrtS7xuFF8l0vTIW182Td/XKsBhLhPnGyBG/DIq2z8M0wCtuAzs0zu+/9Q1EBL
	 MR/MlzTOGKnWLKtN6ge4IBLz3Mzg3kXVAzJicCViKBK9geBjd2AhXeL2MAvZWu47jq
	 WvTRyTnBfGradtpR7pPdm5nExmQpTHWTfqZP3lPt6f9AZUryQAq/5Zmz9XmOrDsXHa
	 XId0VwZvBTsyo5CJHnGvUnwAzFZmqQDTnEwfh+Sasf7KeRE/xZM3qFcrz/JCsW56zX
	 ZGv6fioGLP370Axaso1wrH2d7LLxm0xHMD1PxgZq7Y8+/1G5ZsEN6kCNaUeNi7RaXz
	 aylFrcxc0McOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_lsrao@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add RPMh sleep stats
Date: Tue,  4 Mar 2025 11:00:12 -0600
Message-ID: <174110761302.741733.10360231448965582681.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218-sm8750_stats-v1-1-8902e213f82d@oss.qualcomm.com>
References: <20250218-sm8750_stats-v1-1-8902e213f82d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Feb 2025 11:21:48 +0530, Maulik Shah wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add RPMh sleep stats
      commit: 97bf440d95f1bafd8345739663ad3c04627f1505

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

