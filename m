Return-Path: <linux-arm-msm+bounces-79229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26AC15D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F255E1C26210
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C270C2C3757;
	Tue, 28 Oct 2025 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFgGzI8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D3228DB56
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668814; cv=none; b=SmydQXvUx1SXFz4H27naDZ5pJEMmSeDUbwaAl0HfZQT4MKwlwa5i/ywUjxf2Q/D5LXpTOEubkRxxujhrLw0XwcdMutLFTb6F8AxZRVM4TtbYTaKbzDm5uLanOFV514GBOkjI+/0wvFVj111yjaHW1vjhIDkODnl77T8fiM0Krc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668814; c=relaxed/simple;
	bh=TTeQEQh/zyoqxmgIjaCqSLAZ1hRahpSzJWYP5Njbevg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTBoXRRUOTTigOe4oXuKJboTU65ic1DKEuSRgsUX9HbX5Ux0Tm05Ece1ZVTkgwh3hQX7QDCQ31oQB62u4jYRjBMmZW5RJIjXvhQ+hdGoG3ACQugieW1KgwQKnDgTZA++7ZaXvw2GVdgetJEwsxCFjfoQQy3WrZMpMWCsf0tu8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFgGzI8d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711b95226dso78136315e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761668811; x=1762273611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTQDtoLg5tD2EhtUFx8lnwkECbPu6ioaI2sy2RREcrY=;
        b=AFgGzI8d3HLS+LkMyxlAnZ0dSFSqnNtBbSzk4zR6ri6amKQMfZCmmiwdOaNqKD+EAx
         oSsIdCXlneN+97gjGQr0qfBzbTCxPINx+8h6MnhIIjmzZPipsVCPK+30Zf2tAMWAlfTH
         60pYFfJFqmZz3Zx/ZLZXay8jlKLVLNXys04FWAqTAVTGPEsNg2F5EfeHqEme+QmwMcO4
         Qh8Ag8Eci6ylDxr33GgutzYysWEZWM1XTc/wjywTXQxYUM2tBVvxuH66fPnNbJ73jcxp
         dWqjyu5DvkkWNFDxwu8BauHSIGbdyXi6l6zXYB9Hm52lKvEbt71b1lV0iKJUdG5oZPoe
         2g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668811; x=1762273611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTQDtoLg5tD2EhtUFx8lnwkECbPu6ioaI2sy2RREcrY=;
        b=pEPv7hjWTWeXqP9wqdt+TyUaw0sZ4xrCkJWpR/IXHXT3JePfwiwyh1LhSjIOa/p26X
         JcXZTUvlFhHukNvZrCvMiZD147/RzFp4E9CO1dmF9Rq+Mfy4QpeV/mt1EDKS85xpaCIp
         cCyLtpLDFv1Py4j79ZOaHIUOG8eqDlqoHgFdOxMgNpZJWLvGLnB29OVyRP/9YBY1uRlM
         8mxtl6l0F9J0UQoKTGPD3U3Wn7lEHZAqb5ITq88imRG1xTDU3c6KM4N5c8qhskMnD3Y3
         P6/R1VwkFIbHyyp9M8+OdBEazc6UKrVEuU3biEqZ0/GEs68xsvhS399E/VhMR8VVbiZL
         L+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUOxMS95DFVSaqEaff8/yVx28itkijgFFxVOObxhB6CynqQl7CjC2AkgXisLMRFbY7wxorZ95UZNtclI9Dr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4U+f9VWBefwXKWYrdbDgzC3yJtTjIrKgaXrzl8RIK9K2RboYF
	kpBWlm05l4C7GjMHOkusSH4NFMshBgKkCJPdJaBdeKyd/IW+UYwP0jSMv7zUiG1IYaU=
X-Gm-Gg: ASbGncvf8eTeYvsv2jiE8/JK1Yn3XoTTF0srqKNRz3vUx0hdW8Kywu3RscqXLoLSnq/
	MwaJYX0mwOIWygrreud5bumFFzZD5o70/GDuasNuNZ5Rtcg1GyABtCty2uIY86ThzwMiuXhSiit
	ABvhSBRaxvSnrqIOz+W7OG2Zipo11XEfCrjULvE55EnV+VqZ9Ja7uQBB7ASldWTqgeBhoICGrBC
	3qNqZcTxyWHWqyBGv8Ne10iz7M8XmQvF33+rgf2fPoRo0B4v4Jk/9qnGGvrZhNwPWoaqFZIFJso
	k7PBHExyUmqjOivGj3m/eZudoDHjfIB8QpiTiTf+E4LuF795VDzI4mYnsFmwOoa+9FAEog53S/q
	3KopNVYwIEPkyEzbTh2RboDqLOTE9ETrandHJTfCLlyXBoNYC2SrMJLw6QMd2GXLLa/pcybad
X-Google-Smtp-Source: AGHT+IGuRgJO13xk2Jpb25G3vg2qNdxnqTK43mT6WFXMrJoTuSIWNrgPsq5EVG0SCzEdej0faMV8Bg==
X-Received: by 2002:a05:600c:64cc:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-4771e171a36mr991005e9.2.1761668810763;
        Tue, 28 Oct 2025 09:26:50 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e202093sm530835e9.11.2025.10.28.09.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:26:49 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:26:48 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <fetxo2ij7rstq52kxzad4yj76l25kzanzaccjrfso4bklcb5ra@mym55zc26icw>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>

On 25-10-28 17:30:08, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 04:39:19PM +0200, Abel Vesa wrote:
> > In case of UCSI version 2.0 and above, if the orientation is set from
> > glink as well, it will trigger the consumers along the graph (PHYs,
> > repeaters and so on) to reconfigure a second time. This might break
> > the consumer drivers which aren't currently implemented to drop the
> > second request of setting the same orientation.
> 
> Might or breaks? What happens if the driver doesn't ignore the request?

So I do not have a very specific usecase in mind, but my point is more
about complex LTTPRs or repeaters which might misbehave if you trigger
multiple orientation setting.

Anyway, we currently do so on platforms where orientation is determined
by a gpio level. So I think requesting multiple same orientation settings
is definitely not a problem currently.

I still think we should stick to the UCSI payload value if available,
and ignore everything else.

