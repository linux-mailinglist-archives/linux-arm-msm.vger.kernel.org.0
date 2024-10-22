Return-Path: <linux-arm-msm+bounces-35440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBBF9AB245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D021C222F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBF719D087;
	Tue, 22 Oct 2024 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yg5GZziJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A1198A0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729611560; cv=none; b=GMStJ8H3/PAN3oqwSvDrPsyEfVpxnLLaOHoNacMnv6HLJHuQZvVj330Cp2byo2qt8XiwxkV8SMIkV7yk5Yrlw6Uu2hLrd45oZp1i3KtZEfHRrL5tGLB13aX8UeyIn+oc8x/ixhAwn48LscUQdyQFUmr01uKs2Vh9KTCR/BN/lCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729611560; c=relaxed/simple;
	bh=KyehdRFnOqClt4ckcijRDX2btN2UgjYXojkVtGk19rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMnV/XbBAt6u8gY3EgqQXX8WY8M6w9B25WJfO06tKOyQgmFtO22Lw2qditZpQTcTDyARy82GHdHn/totExYwly/fLKnWWd9qXvAxLynaTLESIwV0RmcB+8ZL5jTWtZdfYpyhfA6hCEvHsHttbH+Gt3kWzkIILogvRpGfzLOxMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yg5GZziJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e625b00bcso4252504b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729611558; x=1730216358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4UhBP+lxA4PuI1pN/Opr4ffBjn9LJSMHIGdfxJak84M=;
        b=yg5GZziJfv9IcGwyz9GmsygvMkwdTDM0Aq0gC0AKOdl2ULRcJ9GDmP8Nuqe1cTrPIw
         HMxDuMZ8vAaydUl0x3S1a6vUZqsSf7p2I4mZ9Yx8tjUZD05LwqIFMJdz0pWRryXpcIcQ
         P7boRmE4/VKE+vzBBq9mhpEWNPpqXzQXmHRwReZV5iWpgCJOkUGG5K8r0tJTQS9bTVoc
         1WgbsrSUQTkwd1Ep7L9ogrKB/8ezpckhSnRVWCVh7THK/xDwp8kY3mX9KN4aKNiJv9PM
         UCqooa0kkBwE3/5TqoMArdcEMk8tPlYI8wCckpifSZearmcaQI2nEL0sWC696yp+2yi5
         4I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729611558; x=1730216358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UhBP+lxA4PuI1pN/Opr4ffBjn9LJSMHIGdfxJak84M=;
        b=G0HNTXh4dkllSgJwxL0fnS+zYQChgGRZHUueCgJuskfoG8sRoJqKpqOnuq9L4SxKXj
         ewXmcZaWjc33uY6NTVrzRLr3iu0pD9FyuPM6QdeYpH5PiB0iWjs8GmudHHuL5o7uGaHs
         yQBw1b9W8VoEMIV4UnbbBd1PhVF8Ak7iMGz2RBu8xrfDOxCbPjxS7ACmTUebD7B+Me7s
         YBqIDOxI+ukwiN3H6HUzofoWD4r6xXz5Qn/qmKmtIlbtFIQfjbG09IQ6EmZkRgmw4ftk
         gIqKdd7vbgggE9yKsPMvqN/Xf03TPwH58qzAaeSpSvy285gH6K6P0O4OycvaJAP/rBAS
         eiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5+R1ywhhGBR+uEygCDPZzJxq7OA7zFwZBCXtaf9UCCkns5wPiCamvGWprbh7EcvQ/KsUD8F4pZ+Y5qnTV@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNoDO01KdBwlMZ9z29l0p1hDu/nIDw4pBS1l33kEdTYafbG3Q
	duiNQSMaBNH7CUE7rvn5megdaJg3vwKcSpiYw5IgtXHnL1/4kvYQT3wrvdoVTg==
X-Google-Smtp-Source: AGHT+IHTLfLxPFhRlrarKiYn46g4SklVOs57wHpWONQ2VMauVhk6JqEzb66pf6djTsJvgzguysbpeQ==
X-Received: by 2002:a05:6a00:318f:b0:71e:60fc:ad11 with SMTP id d2e1a72fcca58-71ee4b07d49mr2955925b3a.16.1729611558265;
        Tue, 22 Oct 2024 08:39:18 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eb0c8sm4889990b3a.182.2024.10.22.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:39:17 -0700 (PDT)
Date: Tue, 22 Oct 2024 21:09:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Denis Kenzior <denkenz@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 00/10] QRTR Multi-endpoint support
Message-ID: <20241022153912.hoa2wbqtkvwjzuyo@thinkpad>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>

On Fri, Oct 18, 2024 at 01:18:18PM -0500, Denis Kenzior wrote:
> The current implementation of QRTR assumes that each entity on the QRTR
> IPC bus is uniquely identifiable by its node/port combination, with
> node/port combinations being used to route messages between entities.
> 
> However, this assumption of uniqueness is problematic in scenarios
> where multiple devices with the same node/port combinations are
> connected to the system.  A practical example is a typical consumer PC
> with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
> each device could potentially have the same node identifier set.  In
> such cases, the current QRTR protocol implementation does not provide a
> mechanism to differentiate between these devices, making it impossible
> to support communication with multiple identical devices.
> 
> This patch series addresses this limitation by introducing support for
> a concept of an 'endpoint.' Multiple devices with conflicting node/port
> combinations can be supported by assigning a unique endpoint identifier
> to each one.  Such endpoint identifiers can then be used to distinguish
> between devices while sending and receiving messages over QRTR sockets.
> 

Thanks for your work on this! I'm yet to look into the details but wondering how
all the patches have Reviewed-by tags provided that this series is 'RFC v1'.
Also, it is quite surprising to see the review tag from Andy Gross who quit Qcom
quite a while ago and I haven't seen him reviewing any Qcom patches for so long.

- Mani

> The patch series maintains backward compatibility with existing clients:
> the endpoint concept is added using auxiliary data that can be added to
> recvmsg and sendmsg system calls.  The QRTR socket interface is extended
> as follows:
> 
> - Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
>   generated a particular message.  This auxiliary data is only reported
>   if the socket was explicitly opted in using setsockopt, enabling the
>   QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
>   to facilitate this.  This requires QRTR clients to be updated to use
>   recvmsg instead of the more typical recvfrom() or recv() use.
> 
> - Similarly, QRTR_ENDPOINT auxiliary data element can be included in
>   sendmsg() requests.  This will allow clients to route QRTR messages
>   to the desired endpoint, even in cases of node/port conflict between
>   multiple endpoints.
> 
> - Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
>   clients to bind to a particular endpoint (such as a 5G PCIe modem) if
>   they're only interested in receiving or sending messages to this
>   device.
> 
> NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
> This follows the existing usage inside net/qrtr/af_qrtr.c in
> qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
> done deliberately in order to keep the changes as minimal as possible
> until it is known whether the approach outlined is generally acceptable.
> 
> Denis Kenzior (10):
>   net: qrtr: ns: validate msglen before ctrl_pkt use
>   net: qrtr: allocate and track endpoint ids
>   net: qrtr: support identical node ids
>   net: qrtr: Report sender endpoint in aux data
>   net: qrtr: Report endpoint for locally generated messages
>   net: qrtr: Allow sendmsg to target an endpoint
>   net: qrtr: allow socket endpoint binding
>   net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
>   net: qrtr: ns: support multiple endpoints
>   net: qrtr: mhi: Report endpoint id in sysfs
> 
>  include/linux/socket.h    |   1 +
>  include/uapi/linux/qrtr.h |   7 +
>  net/qrtr/af_qrtr.c        | 297 +++++++++++++++++++++++++++++++------
>  net/qrtr/mhi.c            |  14 ++
>  net/qrtr/ns.c             | 299 +++++++++++++++++++++++---------------
>  net/qrtr/qrtr.h           |   4 +
>  6 files changed, 459 insertions(+), 163 deletions(-)
> 
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்

