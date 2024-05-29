Return-Path: <linux-arm-msm+bounces-21012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9E8D4038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594BA28882E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFC01C68AC;
	Wed, 29 May 2024 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI8MjgAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC9E542;
	Wed, 29 May 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017821; cv=none; b=Ti2CFXlYbO0dLXmYDjvmD09VzLcfUMRt0uMDCddPIQDgb6sXakJXVqoUb+SGQCgWsaacAq+wK7POg3wma39h3SurD3Z4zsGUwSO7oaMSJ3atQqieWDzyZNWN039rt2KeUM28+DXR2AIknvP/yF42mcSZ06nlOP8IkE4Wwe77atY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017821; c=relaxed/simple;
	bh=lANkfl1YfOGBzA5Ntz5DCeGdXtGm5hDxT45t2u/Inlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENuMmA0DE7WGuwOf5eo0u68oJTUbwdGfo3Uvv+g849/gfJLUngaM1NrV9VN9ziUW3BRAOs5AUoZU5dTtJSgx56x4lOuhMDpVCbJ2LcEP6VBZisvOXlYa9hHmQYche80Wgc5ceIA3yo1T8hXnoWrt9z4lAI7Gp+edG8sXum9AyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI8MjgAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0283AC113CC;
	Wed, 29 May 2024 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717017820;
	bh=lANkfl1YfOGBzA5Ntz5DCeGdXtGm5hDxT45t2u/Inlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JI8MjgANl2Kx30alQatMECEBMgoL/Gt5In+2LXfQGzokiswD8kr0pP+ZfBeLBo+01
	 gzQtBvMvlZgJ1t6G+jbPcusi7Dle5VTFAyuz95ZLXOP5CftyWGrnKoZ1gCDPRYIhfr
	 VGV8bkV6fxBfpkJD/lPe5n5ahUYoVSzqB7avpEKY6ELGu50V3trxL8+92kAQyyPZnn
	 W1l1g8MQW6iGTzE6ARQQKUiLbIHyyuL2lahkXnz5urFCrjlxCKJc3c0APXuNMlYvVx
	 SLlPRRhTr7a4wpFM2wYlD/WQsj7n4DoSYn35Eiv7Jd6Wl1mGLExzKZfIdeQk9CbS2E
	 6t7aga4w9GPDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Maina <quic_rmaina@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/4] Add support for hwspinlock bust
Date: Wed, 29 May 2024 14:28:48 -0700
Message-ID: <171701811794.1918821.5154506293707584272.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
References: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 May 2024 11:09:54 -0700, Chris Lew wrote:
> hwspinlocks can be acquired by many devices on the SoC. If any of these
> devices go into a bad state before the device releases the hwspinlock,
> then that hwspinlock may end up in an unusable state.
> 
> In the case of smem, each remoteproc takes a hwspinlock before trying to
> allocate an smem item. If the remoteproc were to suddenly crash without
> releasing this, it would be impossible for other remoteprocs to allocate
> any smem items.
> 
> [...]

Applied, thanks!

[3/4] soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()
      commit: 2e3f0d693875db698891ffe89a18121bda5b95b8
[4/4] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop
      commit: 568b13b65078e2b557ccf47674a354cecd1db641

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

