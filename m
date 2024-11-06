Return-Path: <linux-arm-msm+bounces-37140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E7B9BEC74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 14:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7607D1C23B67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 13:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F09D1FC7CB;
	Wed,  6 Nov 2024 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQQkL6aj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6191FC7C6;
	Wed,  6 Nov 2024 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730897734; cv=none; b=Bcgmk+he5Fuw9wfYPys63jIsslTvbhONeLfDqWgfQQaI3DGlheZfTiVc5ZhaxAlT/A5StdclrIFhWKLyCw47ofVMbmaMdz37MDEGhbGXSyzTz5d0XyMZT66hupvmbWWJ/dsvCkNV/3c1uCwEGIYvF3dVUINDngT9FS2ROR2kDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730897734; c=relaxed/simple;
	bh=THiRwHU/ItganQsalp7zDHwVZ+vTaXjEv86N7QtU7B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH8urew+0Grk04gTKXMXlLzlH7HifiMwrRZ1oTWs9Zn0+5Nkj97a4vELaxa+40A9h7ZFKxiRrVPhOIBapcQgeQ+C3OWKBBMQ7YbqR1idsSDV0yeapSKVkv3TDw2Lt5t5jbTxcuBDlKrUriJis9h02EbgxhOotV3HlO+SBWXs7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQQkL6aj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6ADC4CECD;
	Wed,  6 Nov 2024 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730897733;
	bh=THiRwHU/ItganQsalp7zDHwVZ+vTaXjEv86N7QtU7B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQQkL6ajzVfBy7VuWlIeA14Z9c6xGyE0EjjHhJSHhqQ2Tq+PpAz5Ih5Qw5GfsvRwy
	 nIna14Oawmgfg0q1Iv7bLgSvL1uS+kNZkVwv9no652K+qH4C1khxWhrG+NVpZmclyv
	 WYCL5WhEGMheZcIsnr6U1DCj4GClNjsq4R+cc5ptLxT6bvkLa7AwgpFg5RjxS6zK1Y
	 SdWrgrBJY3MxZNtGkCQmZXQzY2kWtRmAO3jR3qcm040qw7KGtUDyXz7acpYl4PoBbF
	 2byFOOlU33Xsl85JKyyvrj8UNo/yuTj+fImQ9OSE3qnvD51FyidCU39jesLyD4EP7R
	 pJx6Q9wJbK6oA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t8fZN-000000003aV-31o8;
	Wed, 06 Nov 2024 13:55:34 +0100
Date: Wed, 6 Nov 2024 13:55:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <ZytnRc94iKUfMYH0@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling)
> through a mixture of pre-determined algorithm strings and param_id
> pairs hosted on the SCMI controller. Introduce a client driver that
> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> to detect memory latency workloads and control frequency/level of
> the various memory buses (DDR/LLCC/DDR_QOS).
> 
> QCOM SCMI Generic Vendor protocol background:
> It was found that a lot of the vendor protocol used internally was
> for debug/internal development purposes that would either be super
> SoC specific or had to be disabled because of some features being
> fused out during production. This lead to a large number of vendor
> protocol numbers being quickly consumed and were never released
> either. Using a generic vendor protocol with functionality abstracted
> behind algorithm strings gave us the flexibility of allowing such
> functionality exist during initial development/debugging while
> still being able to expose functionality like memlat once they have
> matured enough. The param-ids are certainly expected to act as ABI
> for algorithms strings like MEMLAT.

I wanted to give this series a quick spin on the x1e80100 CRD, but ran
into some issues.

First, I expected the drivers to be loaded automatically when built as
modules, but that did not happen so something appears to be missing.

Second, after loading the protocol and client drivers manually (in that
order, shouldn't the client driver pull in the protocol?), I got:

	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95

which seems to suggest that the firmware on my CRD does not support this
feature. Is that the way this should be interpreted? And does that mean
that non of the commercial laptops supports this either?

Johan

