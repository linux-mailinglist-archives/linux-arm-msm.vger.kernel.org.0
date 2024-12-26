Return-Path: <linux-arm-msm+bounces-43390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0A9FCCBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EA618836C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD881DA605;
	Thu, 26 Dec 2024 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plPEUwWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB161DA305;
	Thu, 26 Dec 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237646; cv=none; b=Xq/e6BW4vVNFCbEDkp8/UmNwDV2AsBtG5zRD3N7OvhBc4mVPvZm7Q/fhvXVNB4dvS1YUZZmaE2X1nNCA6NPI/w+16KFBmPik6FNigIjosXHBeHB9EISpSlW6AHl8FRxNlK3JF86TWQGJww6jU3LQ5KJ3ZwEEQ6Cbmm6VdoHGPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237646; c=relaxed/simple;
	bh=0I8rZQEcnKSn8EnhUl83K7yBRsn4QtRupo5a+dn+Ay4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCnAx7kYQqF0QxJ6mUfDcnhjIn5YYOpt2NIkkNZsAk9vpjaCXzq7b8klLNTp/6r7Chpd9c5bpttdBQuGx2whlko+T+f3OyGaFl29tny2jLy4YoNrRnl0Wwbd89/bWQwoVfE+3ivn7Kgz+73f+27PdEhBMl2XoqnAIJeR24h0wOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plPEUwWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBF2C4CEDC;
	Thu, 26 Dec 2024 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237645;
	bh=0I8rZQEcnKSn8EnhUl83K7yBRsn4QtRupo5a+dn+Ay4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plPEUwWwWloncQRoh+h1s27GSqdr/8yzc7Jrc6U0kKcJmqoxAkz/rCrO3A74Xqb3u
	 VDS8iF5O847XtG5yjbE9VwaHs1rRmDxV80GGazxisD8lNQWuSK2xrTQBBoNpRqAhLC
	 t3oBYecePOh0UFJLmoeAPZ6MjLDK6FEezTOzHc8fko97PuBGWc3nLtU9bAAlRtVm1k
	 gxo8Jj3gsebjZSxfSLiB5sWyiFaeDBR+RQwI+6/kdyjb6n8u5EiFx0qqY20+KX0DOB
	 1Xt88U8c0Rrj0l5lCajuHhB9kcajg0eswenr2KEA9B2arBEyqgdJ7r5FFr9ZKFo2i0
	 uA/pLfayNKMDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Date: Thu, 26 Dec 2024 12:26:43 -0600
Message-ID: <173523761377.1412574.1412273165675516150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219-topic-llcc_x1e_wrcache-v3-1-b9848d9c3d63@oss.qualcomm.com>
References: <20241219-topic-llcc_x1e_wrcache-v3-1-b9848d9c3d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 19:53:29 +0100, Konrad Dybcio wrote:
> The Last Level Cache is split into many slices, each one of which can
> be toggled on or off.
> 
> Only certain slices are recommended to be turned on unconditionally,
> in order to reach optimal performance/latency/power levels.
> 
> Enable WRCACHE on X1 at boot, in accordance with internal
> recommendations.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
      commit: 35d8bc131de0f0f280f0db42499512d79f05f456

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

