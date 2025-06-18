Return-Path: <linux-arm-msm+bounces-61665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE6ADE21F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2512D7A53F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D5F218ADC;
	Wed, 18 Jun 2025 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDkLvr2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A09217705;
	Wed, 18 Jun 2025 04:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219782; cv=none; b=TwH1mJNQ47QS05njkb1RlMiZUoaqP3+0+Vssc4iEWFozrwoYJdI2ESqhErmAPW6qcQo73V31cFsGRk5LzTg370c0IdFhfMt4F+lwHmQ7n7ShF2DbI4C6GHgWVxqDON9PQMUM0Hep2lVXDfmAQK37H3HQAzgf1E7Polg5Kno6x2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219782; c=relaxed/simple;
	bh=jbXuGjveBWcNQ5KRWJaQ7dY3pRGqFzyOvHhfzAX5awk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Le15+zOOQKUKffb5VuIiNA4cP8BKF/7J7Q8PLQBECJYIadu3ciJdf3S7plt9RsMPAk+12kKSxgkI1qD70jO3xt1hU/QYjj4I2Kp+88u+2fc89ZbJYlmm9E4fgWAmTabEXrUklT0NNTSJ7sq0dH3z/OAMK5L6HkmpTo9H0bDXeWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDkLvr2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5BEC4CEEE;
	Wed, 18 Jun 2025 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219781;
	bh=jbXuGjveBWcNQ5KRWJaQ7dY3pRGqFzyOvHhfzAX5awk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uDkLvr2H7rmgR2+45h0JVBI7K/1damAvQJAeCrOQuRhN+zJZKn83DDh28V5GajxvZ
	 zVqjJ9vJtla/GgN1yQLa6Xmj+1czIHKVCgCSOboEq2cQn/fEgCrd71Zoc2wk13koR3
	 pxvnAv9UkQhYpIiLymDJRJMLlriPtpPZsnts/VZ7m//jkXn3gk5qxhPEuGmjVA0Jxv
	 e6r2jtOricps6LUuCy/Gzf4dNWSTs0XyxNnApxhM+bETEvCydXrQ/bgQzg8hn7w3IT
	 vP5tzGuoQRrit87pMzRPp9IBj486NPcPXNxz8VlLv6cJRHsvwE+ZVWQ5fMk8lpFdny
	 dM3Au7za6zn6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manish Pandey <quic_mapa@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add UFS support for SM8750
Date: Tue, 17 Jun 2025 23:09:24 -0500
Message-ID: <175021976635.732077.8780491343614094066.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Mar 2025 13:54:27 -0700, Melody Olvera wrote:
> Add UFS support for SM8750 SoCs.
> 

Applied, thanks!

[2/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
      commit: d288abc3a70efd23a3882de9d2a5effb890f8e40
[3/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 MTP
      commit: a95d8e3f40756d87c35b1c5b4318297005ddc7ce
[4/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD board
      commit: 66bf410e72348691cfbc222afae4414ed1cc657c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

