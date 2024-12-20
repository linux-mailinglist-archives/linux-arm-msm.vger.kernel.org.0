Return-Path: <linux-arm-msm+bounces-42996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7581F9F9640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD09D16AFC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01B4219A69;
	Fri, 20 Dec 2024 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw3H38w5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA64218E9F;
	Fri, 20 Dec 2024 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711655; cv=none; b=PyyHgMBHb/hPU98vCovMAU7RuGihPK7ROMZYPZVC9vhw2PQTawzYAaCaUGIqLs3zG4J+620J4fIOp/tlYd0kzCZVgHhLCL5Xf3qcptIfHgosg5H6GBOSzp7BMJCLFA9oXu5COafQ04NS/mErpIMNFMnyKvv6rYyqXK8a2lohrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711655; c=relaxed/simple;
	bh=eCFEbAneAPjG3yXjTNzuDpgXVXagHgl8kMTMawpHvRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFFIetKoeYrxJtmMw/Z+eY0zNOrGqYJQjXN9zdOMaVCG19N/j/Ue1KoL72L1AyeQk9gS4y9w4zvg9PNJ5VLr+jgvrQ6v9beNQ0Ud1DyFGkITne+hdGoBSz8lrv4fJusHVKy5Hh3ilgqWlc3skeRw3DaFaMvynVRO6YHmjOxH/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw3H38w5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF68C4CECD;
	Fri, 20 Dec 2024 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734711655;
	bh=eCFEbAneAPjG3yXjTNzuDpgXVXagHgl8kMTMawpHvRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iw3H38w5ZnoTf5YzpivsEk5oWAdmEFBWvWuiP8RVnXQk8RPCzk+JbzO+rLYUZuDMh
	 TEAvKy3/5YS0ThnWPot4YCH++OfPAHMyeq9nqCdFN+V7LLvLQKxsPgvzeLmP/JLpVy
	 mw8txFFj4mt3sKIZDbjYBNBEmfY5wphHL1ZpEGGUvekshnXZkdPFFLAGhFmk2kj1oD
	 1Gt2MGW2UcWT0j0YyFjTgC+yphKEFP4srayb3j2YrrgaryqQ/m0QoFHXQ7DUGrOe9i
	 5yIubLL0Dkqtti0NJwSx4fXJ8PqF7P2bp1r6A44j6/rPbHZivM2Kae+/Ss7JAAzaCA
	 NQS7NQowbwQig==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tOfkL-000000003Pq-06QA;
	Fri, 20 Dec 2024 17:21:01 +0100
Date: Fri, 20 Dec 2024 17:21:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, gty0622@gmail.com,
	johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
Message-ID: <Z2WZbX2NajDFAgBk@hovoldconsulting.com>
References: <20241213085100.564547-1-mitltlatltl@gmail.com>
 <20241214122303.653935-1-mitltlatltl@gmail.com>
 <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>

On Sat, Dec 14, 2024 at 03:39:27PM +0200, Dmitry Baryshkov wrote:
> On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:

> > >> +
> > >> +		/* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> > >> +		 * there is no calibrate data for huawei,
> > >> +		 * but they have the same subsystem-device id
> > >> +		 */
> > >> +		qcom,ath11k-calibration-variant = "LE_X13S";

> > Finally, I found something, after I enabled ath11k boot dbg, I got my
> > id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
> > 
> > With qca-swiss-army-knife (see [1])
> > 
> > $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
> > bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
> > 
> > It have already been here. So that means I don't need to extract from
> > Windows. I just extract it from linux-firmware then give it a variant
> > name and send patches to ath11k, right?
> 
> No. Usually 255 is an ID that is used by a variety of boards. So,
> basically, you have to extract board data from Windows, add a proper
> calibration variant that is specific to your board and then send the
> resulting data to the ath11k mailing list.

The board files used by Windows are not compatible with the Linux
firmware, so the calibration data needs to come from Qualcomm.

Try filing a request in the bugzilla:

	https://bugzilla.kernel.org/buglist.cgi?quicksearch=ath11k&list_id=1147229

Johan

