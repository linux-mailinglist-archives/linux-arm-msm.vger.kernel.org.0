Return-Path: <linux-arm-msm+bounces-21595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF548FB205
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22221F237B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E371146008;
	Tue,  4 Jun 2024 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tOHuRADC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52215E8B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503577; cv=none; b=FyWZlr16atWngZefKLOumyXTM7BWvt6FxNG+EPzOQTuAIx7a1IMUxcH/HP/12Nh9gDtIWk/HV0Wp+MrM1S6dARusPkUwdIuZzfUSo+f0Q9fIZ48GQ2vuOhuBwpQOso/d/sl9g/YLnvXImzq3HFdFNPE+CTNMCwBKUjnEnU4BmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503577; c=relaxed/simple;
	bh=5I35mb01Pho5lY9vj7hsFa9nE7Hi8Z2cKCHf8+qyIXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDfXdaSVP/3sGsdqJYYmGNjnapY3MhL9YJeRxcxoznVKdZKkRveAC2yWWXIDQBp8qkvM1wA1TFG08TDZQgH5k70UOuzUjzy6afXnbmLjqQUe1te7sCHwAaQ7RPas9/OYRbZ4TiyzASxt1BydjXaqme4HGEleR7LAk+Y7+p/brz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tOHuRADC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so6721736a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717503574; x=1718108374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P7GHZtJwM0gmngdgU8CZRB7FdR1U4kDjDmKnnewdNs=;
        b=tOHuRADCkIu0ZwYV3wgDrTVfWhChKeLCD9kbFtoYcw+djYI1rnRstv0wXaqTZ84llq
         Mp5Ps4Bta6YiOodP8xWynT4Or2oOaEqS4+t0tywsYiMFuXGyhnHURw8PEL/hGRr6IhSw
         6DWnjO0l0slqiBGyS/MPD619MVjFIpLYVaJsj2Wu2Mm/Dq24+3X/pIl0MhYCBfN8d8Kz
         elSi5VwHSiXh3fievEthwuN4KOsNCUFtC+wvZk9rDLbiTOrw+OP8hFx0HyyGplUR8Huq
         /66UEfCgbE9DvhTR+jUqjxiZs+WkaSc0nOFhbbwqloqmZABAZEkBHGZ6KOniNey6tckm
         A/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717503574; x=1718108374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P7GHZtJwM0gmngdgU8CZRB7FdR1U4kDjDmKnnewdNs=;
        b=E7Ck6FMkyS3ibA1SSRbES8dwimMyQ2RYCfpEbQp4piQSx2r913DMjMMLQf+8YSVTbI
         qUs/4bzMiovaeD0LNQCugCMLjA8FUYM2YvgCvxZYbXz9D10X1r5q2Lyzq8jJmh1yOeKi
         wbcMpCfF/WvP4fxd6Z+QWvEFwB/+jCKUou4Aw6/4SY7A5EaoYx6ialJXR/NfXIqmZuU+
         mUSLMC5SXa2flr763hI8E5N82s+w6RUbyFqL1cIh1EHjrE0yI3ZqzghmGz9mffPyVTsB
         IWIehauP0qLRNnKGzVQ498Wv3DK19lmauFDpIkcqvIWYJXF0B07ZrD6Zb1/TfQzZRsXF
         j0MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHqOFC99pkLYhOkhxFYg/idXzdTaaV+kNNhl1FQfQEHxneGPGWHwAGYcnsUhT1cXYd6eFtslLPEyoJzJjGkJRN9dxKhPj6FUCvuz8cCw==
X-Gm-Message-State: AOJu0Yy+APJPA/P+jiDXQo/YGY2TSULw58eHPdIV/P0Tqr4IM/xhTPvR
	8Vaaxp3nFgTGax8UPXNUdM7+DdZVvkENZat8JuvZ3mOfVl5wxr8Dng2WVy/wCzvXXcdwYJbpIhC
	f
X-Google-Smtp-Source: AGHT+IEDnU8aYyTPGuIw7hpLBWkTwVE+/TQ9c+IYEZrWq4iqp25PhHL/PsSsT2nhyGS2E7hIlPZhBA==
X-Received: by 2002:a17:906:f144:b0:a68:c3fe:c8ff with SMTP id a640c23a62f3a-a68c3fecacamr614719966b.17.1717503573605;
        Tue, 04 Jun 2024 05:19:33 -0700 (PDT)
Received: from linaro.org ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ba90e185sm469759566b.157.2024.06.04.05.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:19:33 -0700 (PDT)
Date: Tue, 4 Jun 2024 15:19:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <Zl8GUw7WQKIprA+C@linaro.org>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>
 <Zl26Y0VklPmiirem@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl26Y0VklPmiirem@hovoldconsulting.com>

On 24-06-03 14:43:15, Johan Hovold wrote:
> On Fri, May 31, 2024 at 07:06:44PM +0300, Abel Vesa wrote:
> > The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> 
> nit: s/PCIe 6th/sixth PCIe/
> nit: s/from/on/
> nit: s/both/either/
> 

Thanks for reviewing. Will address them in the next version.

> > 2-lane mode. Document the 4-lane mode as a separate compatible.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Johan

