Return-Path: <linux-arm-msm+bounces-58840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064EABECCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEBD53AA35E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FBD233134;
	Wed, 21 May 2025 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwK4Za7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41358184;
	Wed, 21 May 2025 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811495; cv=none; b=VMas4kmi4XlJ9FP69jGBeMKr1LqyBzRwRIwj4yDg0EpcTUnmfCdLRUCWEzg0QLYvA9NiIuq0x2jvy+1OBUTK6Vj0z3FbcDvsEg1xWxyWowZXhKBhzK4KO0Otz498y7izjjiaYT9HnB9YAawBmGH7+4X9EcLGDPxiAJxMv5mkas0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811495; c=relaxed/simple;
	bh=7cT61LSp8gFmFpUVN4hgOjc4iIVzYqT03FQ81EkMNB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVvT/zioQV2n4eul7MEpTXlapLobPVdBcq7lvmGYtF3S+kjli4IjBvfHPV+6/qIofkdxr+k9d2Dk3lj/DOi5HbLmXnjJcZaHY4taK7w1Yzq+HInSO43lTs9W7Rn/evsZaQvlgqvTrJg+CoFEFmJXTqPWVGYZn+w0XvF4EdnPjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwK4Za7K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A457FC4CEE4;
	Wed, 21 May 2025 07:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811494;
	bh=7cT61LSp8gFmFpUVN4hgOjc4iIVzYqT03FQ81EkMNB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwK4Za7Kq0mkTSn7KgiBaKZuFHzU+gBr+gL6PEuDMNDgCcNBUwH+3CwTiAm1lfEe0
	 nbl1jdC7ciFixrujAwGFh8n/pv4ofb9+DXFvbY9GaqPR/wnY6hFFzeaRtKGyXHhpjM
	 0r0APCk9e17Sal9Qzo1UANEJWjUzFcheBNXC1qywEeVIxKJ0849/v0CYWFFadmvbsi
	 FRb+6RfmRS0H6vUBtloMryJxI+0A0goImBgjwh5OZE6pZDCjepZqssi05V6B9Ahxu7
	 NpnLuWs3lMTWKvZHcSknJediLQ+DPteT8SaLPtFE98s1/lFjmjG3iH/YI4EQ861cQC
	 2AxNPi73RI04Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHdbv-000000007IQ-1KrK;
	Wed, 21 May 2025 09:11:31 +0200
Date: Wed, 21 May 2025 09:11:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
Message-ID: <aC18owkQSMfNwKUC@hovoldconsulting.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
 <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>

On Tue, May 20, 2025 at 04:29:18PM +0200, Konrad Dybcio wrote:
> On 5/19/25 11:35 AM, Johan Hovold wrote:
> > On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:

> >> Dmitry Baryshkov (1):
> >>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
> > 
> > At first I was worried that missing firmware could cause issues here
> > (e.g. drivers not reaching sync state as with venus), but Lenovo has
> > indeed released the SLPI firmware already.

> >> Konrad Dybcio (4):
> >>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
> >>       arm64: dts: qcom: sc8280xp: Fix node order
> >>       arm64: dts: qcom: sc8280xp: Add SLPI
> > 
> >>       arm64: dts: qcom: sc8280xp-crd: Enable SLPI
> > 
> > Without firmware this results in errors like:
> > 
> > 	remoteproc remoteproc0: slpi is available
> > 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> > 	remoteproc remoteproc0: powering up slpi
> > 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> > 	remoteproc remoteproc0: request_firmware failed: -2
> > 
> > but enabling for the CRD reference design and requiring users (read:
> > developers) to copy it from Windows should be OK.
> 
> We shouldn't expect non-developers to have the CRD on hand, right? ;)

That was my point: requiring user of the CRD to install firmware
manually is fine (e.g. as they would all be developers and currently all
firmware for the CRD needs to be copied from Windows anyway).

But we should not enable things like venus (that can prevent the
interconnect driver from reaching the sync state) on the X13s which has
lots of regular users until the corresponding firmware has been
released and is in linux-firmware.

Johan

