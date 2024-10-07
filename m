Return-Path: <linux-arm-msm+bounces-33343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D92DA9927D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 11:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80C581F21544
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BD818CC0A;
	Mon,  7 Oct 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mRWm4xkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA218CBF4;
	Mon,  7 Oct 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728292038; cv=none; b=fGPhZyCE0+a/MdwoIodpgV0sjVUqeLHyLmqAjfunPO+WhYo9OElL/IvZQF7OO992lNIzftw+YAFrtwrNsMENXJKf4hjlfwkuLZ0LQjVee/Bv8Gx4cTegvBtZGQwPk4AHto2C69uROj+9s0AP6AtIZg+Un/u+EIoXPWa6BZhlmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728292038; c=relaxed/simple;
	bh=VXt5sLIDbpBVweOL/oYwBGRs5o9/j78sVlhz+RGVTVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9NvPs5AA8NGRx5gzoBtWN6sDaBOZJpvShG3x+oKo5VEfWJWrGez3dqVC+FLo5jSNp8EKfYbIIJNZMkQAZxqQEgZHbi2agKcnv3yJ+hpxqdRvaJClvofb0EUk3V4a9WB3oAaOH6jAXS0FNf7E91bk8R62xFaaBvBcL3yW2+91fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mRWm4xkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B2BC4CEC6;
	Mon,  7 Oct 2024 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728292037;
	bh=VXt5sLIDbpBVweOL/oYwBGRs5o9/j78sVlhz+RGVTVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRWm4xkZgfNz/Z+dM+Ju1O7LvJycsyBIKdz8+Ps6ZG53ygL64uyCiDujcM5/yuwMg
	 hbHRfmnfpvruEpbhN6WbQHO0lYoZcUAAdmWuCIFyfwQqTGMkQBXKMCiuE5ElNQvkhD
	 299KWmWD94OlISP2mV8zcvo1ZKrbqerdWTiKdikU=
Date: Mon, 7 Oct 2024 11:07:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Capture kernel and DSP performance
 counters
Message-ID: <2024100702-pony-repent-d1b8@gregkh>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-3-quic_ekangupt@quicinc.com>

On Mon, Oct 07, 2024 at 02:15:16PM +0530, Ekansh Gupta wrote:
> Add support to capture kernel performance counters for different
> kernel level operations. These counters collects the information
> for remote call and copies the information to a buffer shared
> by user.
> 
> Collection of DSP performance counters is also added as part of
> this change. DSP updates the performance information in the
> metadata which is then copied to a buffer passed by the users.

"also" usually means "should be broken up into a new patch", right?

Also, where is any of these new "performance counters" documented?  Why
not use the normal kernel apis for performance counters?

thanks,

greg k-h

