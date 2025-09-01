Return-Path: <linux-arm-msm+bounces-71449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2BB3EEC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F322A1A88706
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCE5350839;
	Mon,  1 Sep 2025 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgkZWN+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CB261B64;
	Mon,  1 Sep 2025 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755986; cv=none; b=MMCl5hYrnyMDzhY9EYq4WifB0IjBya9DDvkuThCyMjC1Dl54KT/f9ejH6bKXRBISKg3L82Q3aFrGtRZGYa8oBLF9OVxHHmurO1+DWsNjR5R/QlPyM/QQNBU8EmLbqxYKs4Z9cX+JeOyvrqTxH1kfUHqFHd3A3T0GD07VcUAbzWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755986; c=relaxed/simple;
	bh=Li59/wUW70jcWPW1p9qN4ZU56Bwt2w1u8OT0KmPmjdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQgeAUTAFKxLPo+LuVHeQ3v6/KzJrVNKTNJ4W7XC7vEc0qDWgyr2UxgxrWD256utnSo9DbbVvQth+mRb6mKOGFnVdCckya8Uft6g+GABEyeSi22CgJuUQOHd8YLYDiZB6yrA6CkFMovEUXI+ftRrLgc0++8h9nN4fqIaxDcofc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgkZWN+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191AAC4CEF1;
	Mon,  1 Sep 2025 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755986;
	bh=Li59/wUW70jcWPW1p9qN4ZU56Bwt2w1u8OT0KmPmjdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgkZWN+SXCIbwOOlU4gHGKGn87XJi8/bg0qligrtddOerEaR7Fi1sJtLh64Q5lhNv
	 EzAq1Ajd7YIi9/UquzMX1s53sZPOBeocRu9KUzsTp0uRV7DIM9A4cXRRCk7QkRUoyF
	 hGvJTixIGXPlbxqU1y1FRIVo8o2g8snneXElyqwoJFq9JJdmD98asA8T6BYH5eFgnN
	 vcETS6eTlUGnFuRbjLCFMFSQEli6F3yk1lZXQ76ASKgQ7TnQj/0VnTcdayXCdDIhTP
	 Yp0WhR+Q+bzZjzhxy9Kr7VXRQaDa5Vr4HI4pCo+fza8v3YRpvYqESwvbndH3S1p8D5
	 BurPzuEvQOtXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add video clock controller DT support for sc8180x
Date: Mon,  1 Sep 2025 14:46:06 -0500
Message-ID: <175675595933.1796591.14268648917937104042.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Jul 2025 18:30:38 +0530, Satya Priya Kakitapalli wrote:
> 


Applied, thanks!

[2/2] arm64: dts: qcom: sc8180x: Add video clock controller node
      commit: 03253befa1d1f36b297889c7ce2805c9319814ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

