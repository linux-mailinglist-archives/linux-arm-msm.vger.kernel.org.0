Return-Path: <linux-arm-msm+bounces-33375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF8992D98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E8A1F25324
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FE21D4351;
	Mon,  7 Oct 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oh26Mz/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4927BB15
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308507; cv=none; b=aHKaIfmrr11HlY/S2MK9uU+0AX61FEyKeQM+7Gxr3cMZA8JOh7KUWOBEr1ZwOp6f3je4SraI9mczUb2/9ZcHwj9zO5RBmeIj7u+cOstA8q5uXAR5cScw5aeQ3Es+8KHcTNqqwGuLd9FQp/v8EmFUAUFrKZJoJP4i17LJ+WTbs4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308507; c=relaxed/simple;
	bh=uM5smsRB0oK9XJ2vSQdpt5pMXyvoBotS/6L3+4eM/8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEoo6lqZR1mrc6gv7aM/9cVVRCbzegUw8WvbKbegw1TmsCAG7buMRPWTXt6m6ImRKzDkjC9T1ZihLt4L8P2zeatDAOyML0DuSVjBfwWZQ99jXl0WRNVqL9ztAVlBUawsx197Yl/TxSRt+knCi0NsszdQFrWu/1rZIW2IE4lTqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oh26Mz/T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so45623115e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728308503; x=1728913303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzeEyz/cOnu9eFfRF8lZ6etQaWiihzfTD4S66Eb3rRM=;
        b=oh26Mz/TuORY48d5NBvm1iZvF5ZpOE70N9jgdf6tgvSJxq9+aLum1lS/WwjdOs5mCg
         clHB+Lq0sT2zEGtN1x0DSiLA8T2voBYa644ncIqMfkfCSAefUp/3R3IFP+esd8lwSn4R
         5ROQLT/7TP2jjkp83CaIeAbpUsf3kaH608mbB7qus3CeLIiIkEBTfNUfQSK+cENnBSwD
         q1eIfNPWYDSIpn0D9dv7bPKSELt3QBkpSyVa0y9cgN4xcfgq32YqIv74FdAoVYSs9dYP
         CZLuQ3Ngu9/EcDTDCWqn1vafQBTvBUsvkNJzT26v5M+hLl/f9b1mSNZlumhouFE8ElRx
         LrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728308503; x=1728913303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzeEyz/cOnu9eFfRF8lZ6etQaWiihzfTD4S66Eb3rRM=;
        b=iLGLD2kaMnf6MRBD3XFLUGibg64P5xsgWm9JbiPanGIGVI5QYo5HXokFP1nP66toWK
         P4L0L388PGHKr0k6Itfae+4IUuBU0XWF+BLjnDvxs4EGKkIXWaynB8wOPj1itvNaMQQP
         tfsS7zQ3kYS/x2USPOdx8N6qy+1ww5qvmUwOl9ytO8ftCHSDo9es3+mlBPJSbdkd5oLs
         cX+ILrTe7ucA5RWtr1L7Bll7uhcjdWJbaKk01oSUzvCoedgIXFCjjuOYZGRNX2TRQrgg
         kkA6l7p4lubnYyZzb5pAnvCj7D+H+APRp29sjVi2wMzLekzWkPz9AUZ8HC3vYeXoGdR3
         pCiw==
X-Forwarded-Encrypted: i=1; AJvYcCXuCcvUcwqZle0Ewj04MVuS5hqxLbinRTQn/QPdHrq6l4wFOMwiwFXywgkcU0k8qxF9rXTW8++B9c81dX+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sSXKfnlJnvjTh0G7gGVhESAVgeGEsH/b2fZLUjkdFXs4WlAy
	49xel+C2YBfByAzJIr8s/4Ca97+XGkrw4WY0OmTFysW99HWUxAHu6vFysRWJOPQ=
X-Google-Smtp-Source: AGHT+IEfSlzTFX+xhCmXnkxLlEFXJxX/mSroE+4R1cqiuqw0qhOr4h5RlzoMNy84m3giMXo2AyUjCQ==
X-Received: by 2002:a05:600c:3b96:b0:42f:6878:a696 with SMTP id 5b1f17b1804b1-42f85ab9c1amr92214405e9.21.1728308502725;
        Mon, 07 Oct 2024 06:41:42 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695f113sm5740783f8f.80.2024.10.07.06.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:41:42 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:41:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Message-ID: <ZwPlFBVXPKupE1Ux@linaro.org>
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
 <ZwPDxd9JJbgDeJTi@hovoldconsulting.com>
 <ZwPNsTL+5f/6Gtte@linaro.org>
 <ZwPS9AB27h7KbtqB@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPS9AB27h7KbtqB@hovoldconsulting.com>

On 24-10-07 14:24:20, Johan Hovold wrote:
> On Mon, Oct 07, 2024 at 03:01:53PM +0300, Abel Vesa wrote:
> > On 24-10-07 13:19:33, Johan Hovold wrote:
> 
> > > So you should perhaps rather say that you are fixing the description and
> > > compatible of pcie6a, which *is* a 4-lane controller, that can also be
> > > used in 2-lane mode. Or similar.
> > 
> > Agreed. Will reword to say fixing the description as suggested.
> > 
> > Just to be sure. We still don't want this backported (even with such
> > rewording), so no fixes tag, right?
> 
> We don't want this one backported (because of the missing deps) but you
> can still add a Fixes tag. Just tell Sasha to drop the patch if autosel
> picks it up anyway or use the new do-not-backport stable tag to achieve
> the same:

Makes sense. Will do that.

> 
> 	Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
> 
> See Documentation/process/stable-kernel-rules.rst.
> 
> Johan

Thanks.

Abel

