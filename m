Return-Path: <linux-arm-msm+bounces-66202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0693B0ED3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B9A3AAE3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333F725A631;
	Wed, 23 Jul 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYn6ZMBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044151E2834;
	Wed, 23 Jul 2025 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259482; cv=none; b=rb5OebLeDFhL42nveRS3RpvbfcJhoFEDAD1o+bsgvFLTUMQUtjKbNJcm6K6WsDWeG5iLR+LNK+81IZ+dkhGp8X7YfIN7srMWR0Aohrtr5j/Aapd7jQ8QQiWxcOWJiMXV32LDZDUdIGWjIQqnzu4jN5/+UHfB4P5APgdLcuty+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259482; c=relaxed/simple;
	bh=Yv2j22Qo5jPgR1rVLrYGgJrexiV+ALN2HPlv6/TwoRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RW0vq+o9Zfros6Do7UObg/d/sCQaqvHBbmadJgPBMomMVYhhS6Ob33Eu4EefSI+AWMpvH6jqg82ik97LMx5RgUmSQIL7i1NzA6R+wRHN3/MPVI2/wrqN3xgP+vP6ERcGi4alg8QXhF+B6sL0O+32Yqml22WYGlrt9RmGBRTCRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYn6ZMBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EAAC4CEE7;
	Wed, 23 Jul 2025 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753259481;
	bh=Yv2j22Qo5jPgR1rVLrYGgJrexiV+ALN2HPlv6/TwoRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYn6ZMBYnETAyWdsGNd5VHMeDCzHx5hb/UT8nY0S5DdTR0NWuETC4odeUF0ZY+yP0
	 SKFEbtsfxhbKndsI7zZqmISv3uqbmDPbqDNcu/d9Fwf+9kMQZCyCVXaZykixwRncuY
	 mb/TQ6aM2AUPX4hNcIR2dlm4Z1pMCblZzxTBQuMED5aLdjLiTqX11Ahn4MG8oaaskz
	 obkmecWufQEasLaB84FGIMaP+pc2ssl5BNGg93zOJGmBDJpGAQXoCrp3YBU0JMKiHp
	 77jFeyklpiWQ/142OvytoE8AS//hRp15RAoRGNFbuEvI2fM77FbnyHK4A5zWV5jIu4
	 raNBgBfYDxiJQ==
Date: Wed, 23 Jul 2025 10:31:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 5/7] arm64: dts: qcom: lemans: Rename boards and clean up
 unsupported platforms
Message-ID: <20250723-foamy-stallion-of-competence-e8d900@kuoka>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 08:19:24PM +0530, Wasim Nazir wrote:
> Rename qcs9100 based ride-r3 board to lemans ride-r3 and use it for all
> the IoT ride-r3 boards.
> Rename sa8775p based ride/ride-r3 boards to lemans-auto ride/ride-r3,
> to allow users to run with old automotive memory-map.
> 
> Remove support for qcs9100-ride, as no platform currently uses it.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                    |  7 +++----
>  .../{sa8775p-ride-r3.dts => lemans-auto-ride-r3.dts} |  6 +++---
>  .../qcom/{sa8775p-ride.dts => lemans-auto-ride.dts}  |  6 +++---
>  .../qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi}   |  0
>  .../qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} | 12 +++++++++---

I cannot stress more how HUGE MESS you made over the time.

All the discussions one and two years ago about SA8775p mess.... and now
you just call everything lemans.

Srsly, this is just irresponsibler. It's like random moves from
Qualcomm. Whatever you decided, stay with it. Take ownership and
responsibility, not change minds just because manager asked you to do
something. Say no to the manager.

NAK.

Best regards,
Krzysztof


