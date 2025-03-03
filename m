Return-Path: <linux-arm-msm+bounces-50004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449AA4C13A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 14:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C2018931E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 13:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE304210192;
	Mon,  3 Mar 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jczENyf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7F20E701
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007087; cv=none; b=Ph9FoZeQmSAC/ZNPw8iHtz3tlrgCEE3A6gd90Iz0YqkAavuneEU0N0I/ypoJcC0w5J7l3wOCqEGkWNq5+VlBDm68/bH3R20v3IAkqDqtOiRUCuh+ljC9L+HAtPUJVQUrkV56Lr0p32A9aukFiU2SyFm9q9SlPGmNrE8PpqUBXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007087; c=relaxed/simple;
	bh=VTGS9z3V6Q/xCHN1camC46iCwwa/aosOC3MAy/OdECw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnJ3jSkIJlEjlcwjC48w8lICHSXTknzm1Syf8u2st4BE2nzqgwprip6CWnM5FqUWETAiMQTnehdynVEP2wg1+zvN3REFiAwqO28rFdDQj8WPACi4IE1hwlqqX3Z4dQ6pDnII4pEvsftBS2bfslClzq9IjlmYEZrcH3wfOTBn2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jczENyf6; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30795988ebeso47713141fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 05:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741007084; x=1741611884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hs6021W+ZEF1jgVJIvkS1BoBhBl+Zadb4lQ906tSWc8=;
        b=jczENyf61LzcAxDTc2zSS0GQnfs5gRzkh75eQHdMWLkx8WGL9mfqNb9wMFVMYeblG/
         Jfwg5rulSHH9/Pwc4VyEzCyQYBWhjNjWD1P6pj8+K/3HzIkZMByLXRBQFFgA/CUxVEcO
         5awAlcPUOq7xo6hz2ELSIcM+oycV3+cd3xzFHfAD8Mg7e5kf6A3gF0bIn/erUD+sBldh
         XndMFL47OyBpGEldNVqePFqMhX+2v3Znq/2ivn/XJNDBtTyRa+J8YZz2BzHkeTjes22A
         0sYaOi6ACTkWCsOErxYPh+roMBWexFJkyDipQPRbJOzLmkWnbhPHMaugdgUezvRkRYIM
         5jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007084; x=1741611884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs6021W+ZEF1jgVJIvkS1BoBhBl+Zadb4lQ906tSWc8=;
        b=OTO6VlS0XixZVZ0hgSFB6zxFS8uR6pqIdQzYTUtTI0Fs/2jh0o7XwSFvd4+4xvrzL4
         IvylBqFI7daxlyZpikKEBlcMWIBWULx1wW8ZfLseDnQw2Ad9QtmMt0koyoMtx3dtHyqs
         gJbqTYtfhPwxLlVYByCV1lb7NncvFa8je0aNstqgOGashJ+cJkHMA2+CZL2af/AeOyU7
         WtxnCbOKmLdpPGk9X4FKwfotzPbAxUuXBs2tVgPKh3LL8gnLFvLx54Xe0i9mO9CzRdlo
         OMAwD1YYeMRzsphBjw/x9r4Xy+u62OAHb4upTer807UsvaZI2xBbVArQ0hx4UBSORAP4
         NITg==
X-Forwarded-Encrypted: i=1; AJvYcCUhPbcm5zeppwJghu5JnNJL9HDrsT4CDEut7RSGGtzLJWoM0iphMldLeAKrCLsmkuGeOqMr/iMpd7QdEZrn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28Jmbdocn/QGvoiTqZuDWOr9VxJUuYd9qUd93wpZbl+YzzehO
	D4mnb1DqElwG98zBFSjxj5SQmT86SrM44Jbi7Ke2Fb/vzEc5Gm9sp+dOaKpnX+c=
X-Gm-Gg: ASbGncv/R+YvBmasaAFdKs+MP5bFh9PRcH0tv+WBPbE9YN2XVMCtX8Z7XbINBUPAmNi
	vvBk1pO7tfasrLc/LAyOUlamAMGc6PDn5wBrKKUnESJ+Gr6MDdQE7OqxCgw227n9NAZ4MpbZ67N
	idEMrmdKgsb6zWgOKKqCDZstI9DEFpZI+vwVAWEB2sh6wfuEaocTsqiB4OpiE7cmEy1CJCyJpKI
	YskaZv1J6W0sn5pl9g+W9dzvVJCB/kI5vO8HuMPE55uW+Rnx/K4JAPOaio/1RNzwVTrzl/krJga
	ercfZJGcxIeueki+By+/Bgq5LCsWsJ87TVuIjlyCQkBQ8/ArZSvOls4vjZn07ZftOLhjM4CkLBT
	ku0anGOJZmxGwnQlP4PVwIymk
X-Google-Smtp-Source: AGHT+IFbAQM4Vg7NnCwXJQnOl/QXFO0jLcxGWTd7UWWRYV7p4mjc/3nqCPtXbPNZGlRw3vJtvB3rdQ==
X-Received: by 2002:a2e:a9a9:0:b0:309:2ed:7331 with SMTP id 38308e7fff4ca-30b9325a905mr62065031fa.18.1741007084138;
        Mon, 03 Mar 2025 05:04:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bb14d00b0sm4996411fa.56.2025.03.03.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:04:42 -0800 (PST)
Date: Mon, 3 Mar 2025 15:04:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>

On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
> 
> 
> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:

> > > +		dev_err(dev, "Failed with status: %d\n", msg.resp.status);
> > > +		ret = msg.resp.status;
> > 
> > return msg.resp.status (is it really errno?)
> > 
> ok, yes error.

The question was if it is an errno, not if it is an error.

> 

-- 
With best wishes
Dmitry

