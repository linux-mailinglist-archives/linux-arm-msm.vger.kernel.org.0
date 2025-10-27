Return-Path: <linux-arm-msm+bounces-78943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B068C0E591
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2494461B5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3E030F929;
	Mon, 27 Oct 2025 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPkphYtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123430F804;
	Mon, 27 Oct 2025 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574003; cv=none; b=aaPjV8gYx+yRNDLRRNEG4ZC+c8cC9SQQRAvnlPlHnG9ljwf03tT9fNGjsZ7ySFp/wv68SKLGkyIEjVqsHiZ4MFUhcX0A+X6ZCafyJn8EqYjFBFilYALCrbEQfZuwu3aqSKu+TuVoxlqlh2xw9z/Lv4Aok9pxX5iTilJpaLiAZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574003; c=relaxed/simple;
	bh=bU7F16V6leO5Nl+gH+Y4bZunGQ9wiVde4z6wqPcFhh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7tHPizbhNuCoo821DVQjwGyCzPnszDyysWKTmFJINQ+lV5+aWR0NwlbGMoM40RvK0Q9aknCdXyd88r+JX+Y3pxrE8ceNWZWf6Tqnyn+DTqYnDxjzMLT2q18TPWeh75dV0Al7XqiHoZUr772XZvWpRFYZO7PEY+Ycj2Li+aangs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPkphYtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FADC113D0;
	Mon, 27 Oct 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574003;
	bh=bU7F16V6leO5Nl+gH+Y4bZunGQ9wiVde4z6wqPcFhh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kPkphYtwAd+IkcDx1sUw9x6p7QKWN461B1Gqc5UKiLe3a3ZnH34zMR8C0XeuWQ+e/
	 Gm0SxJHsqSqhlGwmSCvqm0oizhQta+pSu41iP2JExlS1gCMs6CxpL8raxFNJVSFP11
	 bGSbE5Fhcv4Fsl6QW6VP1xGAMurSWJcuzkw4ZOZEGH49blawTJVSWwkCrVduRNdbiO
	 RS3OpnstPCKn4exvjv9DzerFLQEAAwRbyxFg4IYl189dECIulTlql+ljusKkPGckCq
	 w5OvuznxfExntYbfJ2HGcVya6UVR9x9qvhwhjVea5HqU9ZPxtK34WtC9QCS1VZzlAr
	 pCUV++Nc9sYZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for pipe clocks
Date: Mon, 27 Oct 2025 09:09:16 -0500
Message-ID: <176157405451.8818.9660246400192455172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Sep 2025 15:49:00 +0530, Taniya Das wrote:
> The pipe clocks for PCIE and USB are externally sourced and they should
> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> to disable polling for these clocks.
> 
> This helps avoid the clock status stuck at 'off' warnings, which are
> benign, since all consumers of the PHYs must initialize a given instance
> before performing any operations.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-glymur: Update the halt check flags for pipe clocks
      commit: 18da820eb632fbd99167f3fc6650a30db714ddfd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

