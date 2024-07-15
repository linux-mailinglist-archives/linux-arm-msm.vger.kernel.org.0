Return-Path: <linux-arm-msm+bounces-26213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F34489318AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5FE281857
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4A2225A2;
	Mon, 15 Jul 2024 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUr1hN5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5944208D7;
	Mon, 15 Jul 2024 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061869; cv=none; b=VVbUfRK4UTykBSJDEalR758iYxs6Z53KFc0ZMcb3Bsz/LzJxrDXl71208DmS9W2kMAej/k+hn3tRFOJpPUo4tNCI+FxoesN8lgcwqTB8xhwvTRESC6yzdrxT+LaBt8BsFCeycA6hKV/CE7iCMBQPsplGmGi8RuP6KCjjC0hpXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061869; c=relaxed/simple;
	bh=IpvlFdomJsaXSre6oJicYkhtuhAwLyCHWnQRhg2/4N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVaM5FDd6Qqjosjevg/Pw6HIUFvK4yCvWsBqmAZbHHnFtYS8DsPke0EouW/1yvkeSeMIMyJduNxrcJp1RxKREOOsohtPaLDdz+xjR/Xx2M2T0Tc+SlZiewiAOixGooQ4N0YDIM+vwJVCsgL/NoIpuIR6JX7mDYJrRG8Cu3ViqOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUr1hN5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AA9C4AF17;
	Mon, 15 Jul 2024 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721061868;
	bh=IpvlFdomJsaXSre6oJicYkhtuhAwLyCHWnQRhg2/4N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUr1hN5G2Lpg6mq0/0IwYu702iRBM78c7LbbLwIIkPNz1G+uW59RzPC8CNnU1zc3S
	 2xfBObAyh+WaMqnBr1Ck8u2NxVwLFcOJMcRzmqGHcGzwWDUp08huGhloNZdDaT9RMl
	 tcpShxGL4libK4FC1G7kBoqNoo8cBRXe220oGBRtwFPaB42MFMS4g+8O+GMA3ebuJK
	 paQiUvnQd08sHA4GqX2nSZFvVsl+kcIZ3ypy4E8YpXIy4LVg6HHuwM/RSKXK284Nuc
	 uDcm2M6UAdpkYBIitDk5V0W4knIg74l2Ofp71q6uGxe4SPUFY3jxXX7OP/uLHtuf1a
	 juZ5Xoh/eWraA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTOoM-000000002xk-2Pcq;
	Mon, 15 Jul 2024 18:44:26 +0200
Date: Mon, 15 Jul 2024 18:44:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: disable GPU on x1e80100 by default
Message-ID: <ZpVR6vR85BiaFtqx@hovoldconsulting.com>
References: <20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org>
 <ZpU1vxsYUdVg9VGv@hovoldconsulting.com>
 <CAA8EJprKTm-FzDjUFwi9jKaHJ121W2m655-GN3DjzB9rSOpJ=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprKTm-FzDjUFwi9jKaHJ121W2m655-GN3DjzB9rSOpJ=Q@mail.gmail.com>

On Mon, Jul 15, 2024 at 07:40:22PM +0300, Dmitry Baryshkov wrote:
> On Mon, 15 Jul 2024 at 17:44, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Jul 15, 2024 at 05:23:58PM +0300, Dmitry Baryshkov wrote:
> > > The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> > > file is signed by the OEM keys and might be not available by default,
> > > disable the GPU node and drop the firmware name from the x1e80100.dtsi
> > > file. Devices not being fused to use OEM keys can specify generic
> > > location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> >
> > Please enable the GPU for the CRD as part of this patch (e.g. move the
> > fw name property there).
> 
> I can not just move the property, as it is going to have a different
> value. I think GPU enablement for CRD should come as a separate patch.

The GPU is already enabled, this patch is effectively disabling it
unless you move (and update) the corresponding properties to the CRD
dts.

Johan

