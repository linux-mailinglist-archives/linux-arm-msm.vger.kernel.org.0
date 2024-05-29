Return-Path: <linux-arm-msm+bounces-20878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBEE8D2A8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D1C1C234D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34AF15B544;
	Wed, 29 May 2024 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYnuaK4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECD37169;
	Wed, 29 May 2024 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948262; cv=none; b=XDkp63KNb0Bg2kgdp4Eexw4AkztHBVekjUIlmSs47fbJ5P6vMoT0+FrC07LJnXfq1fKQJEeuvo2a2QcMYae8OemHbDwYc8HMDVzxkUyqBLGxEbRWABuNpMUgGAzwV+t3I1eH5IYXPVE8K62N3l3KDYlwSmRtS5nwj/ptpXeeKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948262; c=relaxed/simple;
	bh=zdDgB/q9i/jSfgu/HKejcvyfTnTHBfhQGTRnIUardNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqxAEera2zDBFyTWYNqf48Smmq+EzYKDsQy0r3knH/aRhYNwwJdrL2DtDjjXRpl92vmluwodbRgPw+pdlHGJrpeU4pAczt9k0l6jcTf9LxWhSmTLnlayaWfYEFXWa2dZCtAOGMhXlkoWBIwYHbrG04bdKTe12ygT9xTsxkDlKng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYnuaK4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8836C32789;
	Wed, 29 May 2024 02:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948262;
	bh=zdDgB/q9i/jSfgu/HKejcvyfTnTHBfhQGTRnIUardNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYnuaK4xWxmNTR1yCYCeJ9ZgfXseYGfmivBnQdaTtIGVHUgbrnFd663+q/Zu2X+vq
	 xCmlalwww8PSY+YsIBrnWPuXHKfdNC/4p1r7Kgi/1tFMtxHg9s4aMRYhRYP/AmfRLo
	 NxyltYR/oiiDbDTGnuGsuzqnzeNsMQ4EIZnJjkEo1MJo7bIDyQuwbbXUp6jhSBnlx0
	 mCpGmseVNIZxqiZ1NDHYwR/MlBGaO/YRdYuODaR3yAnYpPzffZcIlAf49BB0qQS2uQ
	 2SmQZH7j5+d1MDziiWsWeYNVHjy/JTj9a29g9mc+1WU9284JJikwQ2OiujyCv9RHMV
	 B8BnSfoNAHY8w==
Date: Tue, 28 May 2024 19:09:04 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Richard Maina <quic_rmaina@quicinc.com>
Subject: Re: [PATCH v2 1/4] hwspinlock: Introduce hwspin_lock_bust()
Message-ID: <psazwqcjvivzzelb3dvpj3rkzpcp6sjckzr7mnkfvkc7bingyy@axp6rxasofbn>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-1-fb88fd17ca0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-hwspinlock-bust-v2-1-fb88fd17ca0b@quicinc.com>

On Fri, May 24, 2024 at 06:26:40PM -0700, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When a remoteproc crashes or goes down unexpectedly this can result in
> a state where locks held by the remoteproc will remain locked possibly
> resulting in deadlock. This new API hwspin_lock_bust() allows
> hwspinlock implementers to define a bust operation for freeing previously
> acquired hwspinlocks after verifying ownership of the acquired lock.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

