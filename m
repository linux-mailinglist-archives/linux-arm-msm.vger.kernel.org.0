Return-Path: <linux-arm-msm+bounces-36874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182D9BAC26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 06:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC8B81F225FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E8217C992;
	Mon,  4 Nov 2024 05:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N80uiclq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3B800;
	Mon,  4 Nov 2024 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699200; cv=none; b=oqvJDumDd1dmfjH8r/W6Ols7MgS9d3CqrOcT0FFay5c2jp47mIYhb8z/vdWgI1NEnRdhWV7BVrK0kqNDy6UMKWoO96b5aUxRgvJF4l7t8bgG2b3bSpyn7ynJfWcR6jn1MxgJPQ/Kvn2uScD1lpbymPnWHFFe5FikBadmZu3XuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699200; c=relaxed/simple;
	bh=VsaZ4KjQRsbAjLC6vSYbUfp8wn3g20hzPrGdvQVvyJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv6kZ5itA3fLVp61/HDZmXdFOm7FQoFEORSgbWIzvDIpfKXD8zQCtEzJlT9nPL98Jz3bcuypb000DTfoLynW+f8Op6v30p26H66KZDqh0el1FL7Iir3FbtkOTFW0B2c8xitRuyvQETfULWVGLps2dpuLuHH+g/5yz6xVQRpLQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N80uiclq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414DEC4CECE;
	Mon,  4 Nov 2024 05:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730699199;
	bh=VsaZ4KjQRsbAjLC6vSYbUfp8wn3g20hzPrGdvQVvyJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N80uiclqr9jZgv7xNsJL3qQCXO+zMytUriGgBQ9Kxvv7Zsir7uaFBvWe0czAu7xsv
	 PTVxzyG+7Gf6nlLaxJNFMbmWSot9tSUa5Mk27ZFAuceWqtuZTQYWsYBZzYuslEgQmi
	 JgCw/PTlUgxKR/a/rTaRCGo9i9AWQ0+08jWRl5lk=
Date: Mon, 4 Nov 2024 00:08:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: Add SAR2130P compatible
Message-ID: <2024110458-seclusion-impatient-a4ee@gregkh>
References: <20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org>
 <gohuncowxxud4rilmr23q3zc6rnkoqpbkl6v4puiexegvzr3fm@2zt4olzo64bu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gohuncowxxud4rilmr23q3zc6rnkoqpbkl6v4puiexegvzr3fm@2zt4olzo64bu>

On Thu, Oct 31, 2024 at 07:37:43PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 17, 2024 at 09:16:38PM +0300, Dmitry Baryshkov wrote:
> > Document compatible for the Synopsys DWC3 USB Controller on SAR2130P
> > platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> Gracious ping, the patch has been acked by DT maintainers, but is still
> not present in linux-next and got no other reviews.

I don't see the ack here, where am I missing it?

thanks,

greg k-h

