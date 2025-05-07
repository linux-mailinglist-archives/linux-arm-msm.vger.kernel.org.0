Return-Path: <linux-arm-msm+bounces-57052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38BAAD523
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F3A1C201EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C43E20A5F3;
	Wed,  7 May 2025 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MloJxYdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4409200B8A;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595097; cv=none; b=BoiUT25prjB4z7newvjTI7meTMSizhRGZgn/5jsng3mdJ1v2GrpkI7W+XXV+gfAEH1eb+mKOAdTMyRzuU5NcR8dTjBlSPMiSXUY5U0YHsNZnAzTp6O90lujOpxDVtk03848Tqg2Dam3nHulqoCczPnr3xm16naJttE8piFPiYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595097; c=relaxed/simple;
	bh=ffOPiBau0+EyffFvKHb5tpbbgY+TtfVIq2PljSWlPmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDyjPFc9cWoKvsxWXGfVPZFKVQlmxTlVM+VqByNGZhhppz4+2zvKO+Bui4WmZRqy8jtyCff5qhOzojfPQCC+IvR1UpUpOaftlH2XLnjdly13doEYzNNWdBa4YW2WJTDUKPM37qTEbKxq2CguqqvXa/FUetPOFoIjDAeNE24oKCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MloJxYdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F157C4CEEF;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595096;
	bh=ffOPiBau0+EyffFvKHb5tpbbgY+TtfVIq2PljSWlPmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MloJxYdB11RDhEb/Lgqy5436c/hz2eLDnBRp6+t+poClJs0d9yPDhp/t4NmyEImCq
	 LrZ37ZttDRcw6Ztbx5mSIcATzmXU1v7t6lfOvbfDk+jqJ/ZQ23TCN/WcXBgT/ksfW/
	 ddyHgPzmOF4hepZIpEBY2xB8MVouXTr2yESPF8799cwzfbOfivGgLEcKWZChi302cG
	 YFPqxkbotnjUKUQJS530T/9Kr1XUDsSoBH3EDQp+MC3vlglrdP0yDvP+T1qN+1brAo
	 v1FowNB9qTeyG78udWhChfveuZ2DwdzJFAQqgy62KGFoM/Xs4Q3ylVKIq3dsEd3Zi9
	 Z2btv0xW0+Nmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs8300: Add cpufreq scaling node
Date: Tue,  6 May 2025 22:18:10 -0700
Message-ID: <174659505808.5380.2408209642183590288.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430-qcs8300-cpufreq-scaling-v2-1-ee41566b8c56@quicinc.com>
References: <20250430-qcs8300-cpufreq-scaling-v2-1-ee41566b8c56@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Apr 2025 10:29:12 +0530, Imran Shaik wrote:
> Add cpufreq-hw node to support cpufreq scaling on QCS8300.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add cpufreq scaling node
      commit: 2ed8ee662660577a701e92917dbc65ca3553507c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

