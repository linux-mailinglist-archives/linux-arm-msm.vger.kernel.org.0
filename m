Return-Path: <linux-arm-msm+bounces-34932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB929A3BF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B0A1C2254D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91F02022EF;
	Fri, 18 Oct 2024 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za/PuNel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A832022CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248534; cv=none; b=mmMGoiuL+/XphFxc2G+6NyiZxy/buODbmbPsYH723faJOu5yN8rEgn0RSPDmd7Adbx5poS1EO4gk4ZyRF/n3h5aTsVTtrC8WAVUlj/F47xSiz2JCDyBV/NcMR7ERodruwNl7jL4e8UZLdW3rSkQgFsYIX/BUPVIUUvYYSSqE7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248534; c=relaxed/simple;
	bh=UOflmbQ1LxMt8jWk7AGI/4KA17EvSwoQbdN0huIXq6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCZLXyg+cRwHUajGzdVQp6+nYh6Dq0+q50jtbTof/73OcFQQut7ICkYH5y6pppSERJkA7XRPxk474ZXFfsXPlRP+BS/iP9a/UpUnE8ABXKAoY3DEAWC/2fUpKxx9aXp+KgOpXr/yecAekJnR84vazjQB3ZDNxO+5l4ackYQZj+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za/PuNel; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so17254511fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729248531; x=1729853331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlBIkgXoHUpGGxgUzabtKImK+2Y3lnlNINbK3gk3Nz4=;
        b=za/PuNeltkuy3G4RY5QF3XrOPK8c3g9ZUbyHns/X+eBdi1LqDqXAlyOKTskd9biO+K
         U9dDrTyNXFHsmj8PzIa+LrT/BWmuY7haaLMbemM4/mTLcga/o9sDYwUcoRuXbK+g7QZU
         nWVzbVKEIdzQbyvoYTvG7z0e/6fhEa+IvW1IjAmfyrtuMGlm7WHhffcOWsypCzHv+xiC
         VQQ97hnf1oeaENY/kDvAOn0jSkqln+eF1HLi4Sb30oCh+WC87dqr2RuLgPx1vkpLDDZw
         OnomRlBY3MnXtm1g9RkFQUfwC5WhVIG4KEMm8ML+fc23M73sLFNvZVgF9W5EZZ9Te3yw
         sHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248531; x=1729853331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlBIkgXoHUpGGxgUzabtKImK+2Y3lnlNINbK3gk3Nz4=;
        b=PZejduDLYNHUumRqev7diiDJRNMR3ceUXXZN0QWMT7PQPOxXue/5k4nCsA3qVVdonr
         h/lJanU91Z/4XRDksO3vAXhJvDhl0ibfV+N3ujG/btrpClFZRiv65zMNSfX4F/5oqIe7
         5w36I1QDV0RSQWqtbOY+F1v4o3yDgCOWPxaM4Cv038cTBHWVOZbDsRTFE9jb87hhOsPh
         d7hLy4OHsN7JGeObIJajrQ8f9RzYUKzGdqxBKTaTk8XFpLDYoxy/ZPwjFPwT/V3qWgm1
         KaLS2166PeWMLFOE0i4t02T0BQDUoiRNNVYrjTFZt5WZdNPfwSJHE9inPka0SXXZ6IKK
         ixPw==
X-Forwarded-Encrypted: i=1; AJvYcCVeuOBbRIz4yTkwSan6sEkueMKpUXvD0zP3wrgZuz+B4RYFTwD/Owo4NxKhVwMdG7webmS2tHuSFtrpFzkg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdbs507i3xbpqDm0eioXhxZsZ2G/qsj9UGXO7rSU7Ow7czRfxR
	3trVb15dtCzYgRBT6RdBsCxPKyEZdITNxtPZgjLMGRkTbJzqMABw4u+3RD8NMNQ=
X-Google-Smtp-Source: AGHT+IF2/mMJKN4qJLCEm6+7VHHGgg8ckR5wYi1E0HptcP5qqGwJ+gSkEFi6bLWEeVPwTURdIQKZVQ==
X-Received: by 2002:a05:651c:b0e:b0:2fb:6198:d22b with SMTP id 38308e7fff4ca-2fb82eaf011mr10625731fa.17.1729248531088;
        Fri, 18 Oct 2024 03:48:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809a6a7dsm1864591fa.10.2024.10.18.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:48:49 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:48:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v2 4/5] phy: qcom-qusb2: Add support for QCS615
Message-ID: <47w4t45mtools7wwd2q5ak6te63e57wk22eqvixeljh3cjg3wh@hxcm3xwgyna6>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-5-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017130701.3301785-5-quic_kriskura@quicinc.com>

On Thu, Oct 17, 2024 at 06:37:00PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for QCS615.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

