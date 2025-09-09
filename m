Return-Path: <linux-arm-msm+bounces-72854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B0B50367
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC384446BDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD135FC20;
	Tue,  9 Sep 2025 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIU2Bh1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0035FC16;
	Tue,  9 Sep 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437005; cv=none; b=PxPQOyvDOFHTN7+pwVhhTWlZMf/SyGJTTYKwjGwgmR8ML6MJMBknzr2K2kCBuTYnW+4Hc0uUVYRrSLVMTqv9W+anZe+EHfC188bnp9+g84ILnvDyvf2cv2pz69r8HeaPZRFEaCuru+FFPA2HA8/hGQiYe2O1ZahG3TlEtIIcgz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437005; c=relaxed/simple;
	bh=NDBYSCYbtRCm4phNag8K2MQGByUHik360jxAXcazG+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OW5l6VKo9Rh2T0mAHiCckunjld1mk5K0+AF4j3Xld2scncSpv0QeqqPvwp9XfsGeyYmeZFunfM6gF5gw+Hn8MNFQFLELrfn0JqkxhSGoo+G/O/6pKwr+qGSzpTI/dUmYQOLdySOo/+G2M5wTLdopWaUzyqoKryzCtuITxMs2n/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIU2Bh1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17380C4CEF8;
	Tue,  9 Sep 2025 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437004;
	bh=NDBYSCYbtRCm4phNag8K2MQGByUHik360jxAXcazG+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uIU2Bh1YgjFUCFsAX68lYI4IIVfIBbiepz/DNP1EorTkQ5f8rHiBpCZKR2pc8Zk2N
	 HuLrEvsjH4oM1J3B4Ycijnnx6zGc0Cji7xvmVHFI/8RT68K033pROaXKETB98Y65vT
	 VITJcSwDq2MTziqHHoWFzppALEeD8Qlro0Ao7jV5D+Sq51IiTEsxzsxmojAloQ+LAm
	 uHBehz1cAmmYpPBJ/GOlBXoljS7c3WDsMTjp+TQW1qbubqKxogKfRSFWbQYgD+i8Uv
	 rboo+SrL2OcnhHJpVldEULIdyqi6at0WIQAq7oNapXx/12sUncyM0pMACmPCxMnlhU
	 S2yIT20AojPLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'
Date: Tue,  9 Sep 2025 11:56:32 -0500
Message-ID: <175743699537.2735486.10308266027746150259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
References: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Sep 2025 15:17:59 +0530, Imran Shaik wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'
      commit: 9ff39b0468c3e04fee05d4e005d2fc03d28b1538

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

