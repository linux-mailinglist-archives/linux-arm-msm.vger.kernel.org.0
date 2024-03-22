Return-Path: <linux-arm-msm+bounces-14853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B2886ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 15:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E14531C202EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8330F481A0;
	Fri, 22 Mar 2024 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/v/hAI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4347F6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711118523; cv=none; b=WNgGe/dU4BtO6yJ92lFTavosX8qpHt58XLoFwlxA/bD0YTCv/RqFhkVUyMgIkMNzs5oB0YQOp8ALP2/8ft+hhQ9trgZP+5b+CAKveQwrqRP9KnBjI6R/6DETgbujYUC8eEk+4BLCJQdRJzTKneCOxHqEjtA8jO1HGfeCx+2MqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711118523; c=relaxed/simple;
	bh=WOSj3F3OfM3HjItJG0aKTUFwCYD1ysI0kLGRlYk90go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD8beZBPGiRzhPS8VGsgPpq/F9xPhiW1tcxlI49pDHSjcP2c0qt64cJegnuWgsziRUMymInoJbGGn9Yk/8XanqoHf0c1wdOqninWEafpMVZYP6kKJacwTLJ+Oj7we3H3qGkPy0O5U9zmBPdo0sCHwQgH6OguPcy9k3ojmlWmrRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/v/hAI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB27C433C7;
	Fri, 22 Mar 2024 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711118523;
	bh=WOSj3F3OfM3HjItJG0aKTUFwCYD1ysI0kLGRlYk90go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/v/hAI7BLuZ59qdzSztB+Ba45vaFFSxOnPgZ9lnH/O/kU3V4zL9lt65LG03g+V+k
	 rOoP6LnZyFf8EPY9SoHfl72r1eL3kSSrWTizeU9zNHPhN/EfMHfzj8xP10uHwJtRp6
	 HWgduOIwM/hbGHf9Pig0xpAVA1AhULiT5vdn5MwU34O33Ahwe4Zz7r45xhhc3VDuU8
	 puAnDX+VzMkZCCbR9CTdYZ/wj/zTpeQ/giVnD/haFr0+I3d+4YWUUAtS+FyCo62PX7
	 1s7StiUDnb8O1qHewdguvEFYnt43BDGLfzZ0a82Fx9x1bs2bO1bGdmiv2b/FW2ZPgP
	 u7fBPiF3gVTNQ==
Date: Fri, 22 Mar 2024 09:42:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_bjorande@quicinc.com, quic_carlv@quicinc.com, 
	quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com, 
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ogabbay@kernel.org
Subject: Re: [PATCH] accel/qaic: Add Sahara implementation for firmware
 loading
Message-ID: <bv7pdgwx5rm6wblikmit6tw3znea5g4xrzntilt7idqdas4cmo@ejxbddbq6kwa>
References: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322034917.3522388-1-quic_jhugo@quicinc.com>

On Thu, Mar 21, 2024 at 09:49:17PM -0600, Jeffrey Hugo wrote:
> The AIC100 secondary bootloader uses the Sahara protocol for two
> purposes - loading the runtime firmware images from the host, and
> offloading crashdumps to the host. The crashdump functionality is only
> invoked when the AIC100 device encounters a crash and dumps are enabled.
> Also the collection of the dump is optional - the host can reject
> collecting the dump.
> 
> The Sahara protocol contains many features and modes including firmware
> upload, crashdump download, and client commands. For simplicity,
> implement the parts of the protocol needed for loading firmware to the
> device.
> 
> Fundamentally, the Sahara protocol is an embedded file transfer
> protocol. Both sides negotiate a connection through a simple exchange of
> hello messages. After handshaking through a hello message, the device
> either sends a message requesting images, or a message advertising the
> memory dump available for the host. For image transfer, the remote device
> issues a read data request that provides an image (by ID), an offset, and
> a length. The host has an internal mapping of image IDs to filenames. The
> host is expected to access the image and transfer the requested chunk to
> the device. The device can issue additional read requests, or signal that
> it has consumed enough data from this image with an end of image message.
> The host confirms the end of image, and the device can proceed with
> another image by starting over with the hello exchange again.
> 
> Some images may be optional, and only provided as part of a provisioning
> flow. The host is not aware of this information, and thus should report
> an error to the device when an image is not available. The device will
> evaluate if the image is required or not, and take the appropriate
> action.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

