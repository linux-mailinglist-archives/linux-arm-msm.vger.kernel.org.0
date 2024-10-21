Return-Path: <linux-arm-msm+bounces-35185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BAE9A5FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C4A4B263EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0F0198E85;
	Mon, 21 Oct 2024 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlY6XEmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCF4437
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502245; cv=none; b=Fqrr8TUOkxiZq3HoNZxXouvNJDSxZ65zcybK5xWTe2zx/wUAeQE2mp1wWkKdJvJc383Ew4KCvR7xw/sk2wOrykaori+GuzsbZ9i6WB740rfvHxvz6A9qpKx6vB9vN3OSExFCTEnArlBqJS6HN8/rAykXk+X9crJXhl0SAnshfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502245; c=relaxed/simple;
	bh=SlcExCE5m83JpX5USHKxvDFSoWMIIDgYCllc37lcEyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fjbhp6paJiZNiXeFVEbcn5+JLLJcV97Hs/B7prChF/Lf2qHHGQaTOTYACnRVIyO5tr49IyBjxXWDALLBD7zJnRgTpKTBagwkiDCBq09v+wRYSBJaKOL0Sj/Y06tecZwQgLCh8eJ7w9H3PYKnb2JneNfXTBrld93MxeHGPPdPPig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlY6XEmv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so39796745e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729502242; x=1730107042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1h1ZxH2zfKDXMJFGr7FqjuquR8vJBZMiFARTAc1c60=;
        b=rlY6XEmvU7Pacao1XXLmW1nOE1ounZsqDgM5Nyf3uN/CtLswhWWbVNRY7QvGSlx8N7
         K4nn6bHGWQsVijSSmh7tLprx7bL7sMm/1+EaujGCTNMYPzsat9ht+UCSNs+oJoVHgo1l
         wujVS3jiZ8h0msIcU1EKic1BwGld2IiLsRXNisa5O8RIh3QcHVz8zI4Ql/kTiIECZ/8g
         UqH+7QlDMWIVAfDa4qzl2+WAUOMrccYntSZl8APMl/X7dkpdjDPYkeFxulfti248sPD4
         pxZ2tHD47e+CaFx4Xv55UfMs8fdoVWXPM+9tpyvRP7vyAlMp6ZskC3q8Aq3+t9sFRmGQ
         eigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502242; x=1730107042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1h1ZxH2zfKDXMJFGr7FqjuquR8vJBZMiFARTAc1c60=;
        b=SlnCsDs/D0K5ZTZqk1JZDoEjeUtyk4qOAAnAPob+HYqTGTFK6KmEq+u9stNjVKqvVr
         geikrJaFNV/55ONWiOMIgVurbAd/6YltFiW8uUhVMGtuhByQZEhv/WqKTA0OkGzEwly3
         i9ZGFgi9xTOGTInB3GC9E9hVzI1mrKxKVqaCltPpNgA3t40ZAzlXa8+xbAwCgQtGiQoO
         h6Plk4yz1pHpnc98MZL5cTA0YKJGul1fA+v4Vbr7IFYP6q8M92DwTBlDDHAKuZ6qECnM
         iBqV9by3FM3zs4aLzyoGV4T6jHnNWg/5rPsqmPbODJNto/T6dIXU/da3b7tQfbJvzd4C
         xlyg==
X-Forwarded-Encrypted: i=1; AJvYcCWEVzs6oEhtq5QvclKvu+IIsuTi4L7XfhKiq+JZSo9bomQptwUMniFU5w17FyxU3wel1iSEnT9kWFTDNvhS@vger.kernel.org
X-Gm-Message-State: AOJu0YzLl03bPtjYvBZYDUoDCD74rn+FkZFqxxwT9mIkS1xnyTGFpgOV
	OBg/hC0LRNha09PnSOqSYT/zAdd9ZFGeGJ1w4GVX91BgFdPnImmiHGihuJh++Eg=
X-Google-Smtp-Source: AGHT+IHhfmCxQTlXb6v9PcWrzQ+IR9TV4+36ukTmYh4+fz+XjFLWPJsl658OnTwNgOhjDqryazYOwQ==
X-Received: by 2002:a05:600c:3d9b:b0:431:40ca:ce6e with SMTP id 5b1f17b1804b1-431616a0986mr76272375e9.31.1729502242054;
        Mon, 21 Oct 2024 02:17:22 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc57esm49951845e9.48.2024.10.21.02.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 02:17:21 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:17:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-ID: <ZxYcHyyRP4w7f/dM@linaro.org>
References: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>
 <ZxYDwAUNV5Jhar4I@hovoldconsulting.com>
 <ZxYWiwMzmU6wneu/@linaro.org>
 <ZxYYCvwTn5V2cw3m@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxYYCvwTn5V2cw3m@hovoldconsulting.com>

On 24-10-21 10:59:54, Johan Hovold wrote:
> On Mon, Oct 21, 2024 at 11:53:31AM +0300, Abel Vesa wrote:
> > On 24-10-21 09:33:20, Johan Hovold wrote:
> > > On Fri, Oct 18, 2024 at 04:37:36PM +0300, Abel Vesa wrote:
> > > > The PCIe 6a PHY on X1E80100 uses both resets in 4-lanes mode as well.
> > > 
> > > Again, this is a bit misleading as PCIe6a is using the
> > > 'qcom,x1e80100-qmp-gen4x4-pcie-phy' compatible in both 4-lane and 2-lane
> > > mode even if the original dtsi got this wrong.
> > 
> > But the lane config within the phy driver differs based on the
> > compatible.
> 
> No, it differs based on the value of the TCSR register.

Yep, realized that now. Thanks for confirming.

> 
> > > PCIe6b will be using 'qcom,x1e80100-qmp-gen4x2-pcie-phy' as that one is
> > > a 2-lane PHY.
> > 
> > Wouldn't the PCIe6a also have to switch to gen4x2 compatible on a board
> > where PCIe6b is used?
> 
> Nope, it stays the same (e.g. as the hardware block is the same).
> 
> > > Perhaps you can rephrase this so that it doesn't sound like you are
> > > using compatibles to configure PCIe6a?
> > 
> > But currently we do configure PCIe6a based on compatibles.
> > 
> > What am I missing ?
> 
> No, as we've discussed in multiple threads already:
> 
> 	https://lore.kernel.org/all/ZwPDxd9JJbgDeJTi@hovoldconsulting.com/	
> 	https://lore.kernel.org/lkml/ZtG2dUVkdwBpBbix@hovoldconsulting.com/
> 
> Johan

