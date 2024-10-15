Return-Path: <linux-arm-msm+bounces-34440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309C99EB30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528D628491C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCAC1D5AC9;
	Tue, 15 Oct 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFQMCrj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F9B1C07E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728997439; cv=none; b=Wwf4k+vtWr9UuDNLwqWwzfZkPFkp0pAzKX5xAudzDcV7o/ZZqP5/fR8UgCW9XkhqPiX/3UM+SK3nYSN4B211RzmFh7CG/PCvfzaNmYmUXMGbLSSy8KzCt6GXDBBQbLswP1jLpn8+fyWc5EP0qe3DIvma29IR46tDakSrWqIR9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728997439; c=relaxed/simple;
	bh=Lm5YIENHSH8hxbG0wrGckxliJKkAAMXevVGs6pPXiPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvybAr2DxrpYC1i/c5VxyltYXuZXsi/RsFjVUmHQuuXLIsZrJEpKvez4fvpzrvp6ILdBhFHmRej639jAvw0FiSY1QwSc0b+nNnqy64ghAmjL08FjwNP7VMlUoQO+C9T+HoizoknTqg6ZbH6Ww5bN7trT5v7RTvrSrD556f1ALyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFQMCrj9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43140a2f7f7so5420975e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728997436; x=1729602236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EfIzmMIc+jdVgSYVjow3yI+R+7mv8rjwXVSvx3G/YCI=;
        b=GFQMCrj9COIog/XbFbp4xW5FY823b5ZkIPcHIIn9h0T85dJLfx4QzUtE/vpyhJDqyV
         LtSpydD8rAC6+AcEynhiaV/tzdxsid67cSGFg1ZTv57FQQEdep59+AfMLqG8RcmqNRW6
         jQy54wd17RLGUnC/RCX228zvb1eb7Mehg5cOerVeyeX0xtJt41yf7W4JXff7rFelgm/f
         0wGcT5+yNfEP688deutdnfIUBMRKeQOPMaCVsMtk8P7fVVFALdJG+Bta/fpV4NSvlCWO
         TpbzXCwCV5po3jHhh4wv1y6OLKjDv4U/PaDQuVKcrpQXfPP8ijX1ajQUDLmBZiIrdBWQ
         Idfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997436; x=1729602236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfIzmMIc+jdVgSYVjow3yI+R+7mv8rjwXVSvx3G/YCI=;
        b=ACrGsqmYM6DC6+PSPz5q5SjuQNu3gK5GMwWivC4IjJEwkgtAuPOpR1gxTOCLP3zRvT
         zs5YTYPqMsN1opYzf90TvvV1srCadOPw2PaZ8joZ3Qqj87ha9l6rlCNtLo7qwX9766Sn
         zM1YHFmwrYy7CsjXGUwkFIbRR7To70zZKtvUm/eUZ3uQfnNUMnvpFAi7CxDGKIVhmd5g
         WHbyn2tMj6ow2cAQxkva+DTcLt10j2A8HI4+Dh7yU2vdUG2wQR7xCghrLiyxMAt6Dio+
         gpZ7hpGdl7obLjw/UAIf3XQTb/avmH+xOjfbyoXi/TS5+yfgeSI/jiWeNq/v2+50Xxin
         mvAA==
X-Forwarded-Encrypted: i=1; AJvYcCVXwzY26JX/obD0E0/R8MqFGxrwV1RQ0ntP5JoRk8riu1jhmld+V3E2/ykK4S6hbGlK4pNEjDSgiD5zr6TW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8q2QenGwG2fUbYqTJMnTW2weS4CsDOTxRXqNRQf2aS3u+Ph7U
	AU1k2zfcxoJKJHinJLC/pO1I5fWzDROJl/ieDGfqIVTPAJJvMqfANzbYlVLP5/E=
X-Google-Smtp-Source: AGHT+IHKKw5qg6qbRVjnDX1hYY/Pzy5t1f9uZ94XN/UZxWzYk2Hnf7NTq3WQyOH5g/aqVcr2jdVcjw==
X-Received: by 2002:a05:6000:1869:b0:37d:4f1b:35d with SMTP id ffacd0b85a97d-37d86d69878mr159053f8f.48.1728997435755;
        Tue, 15 Oct 2024 06:03:55 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f55dfa8sm17806825e9.6.2024.10.15.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:03:55 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:03:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
Message-ID: <Zw5oOUeN/v+tz+SY@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>

On 24-10-15 14:41:25, Johan Hovold wrote:
> On Fri, Oct 04, 2024 at 04:57:36PM +0300, Abel Vesa wrote:
> > The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
> > via I2C. It provides altmode and orientation handling and usually sits
> > between the Type-C port and the PHY.
> > 
> > It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
> > a few laptops already.
> > 
> > This new driver adds support for the following 3 modes:
> >  - DP 4lanes (pin assignments C and E)
> >  - DP 2lanes + USB3 (pin assignment D)
> >  - USB3
> > 
> > This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
> > it can support link training from source to itself. This means that the
> > DP driver needs to be aware of the repeater presence and to handle
> > the link training accordingly. This is currently missing from msm dp
> > driver, but there is already effort going on to add it. Once done,
> > full external DP will be working on all X1E laptops that make use of
> > this retimer.
> 
> I was gonna ask you to include the devicetree changes that enables the
> retimers as part of this series (to facilitate review and testing), but
> perhaps you should indeed not post them again until LTTPR support is in
> place.

I was thinking maybe we should not wait for LTTPR support as this series
brings orientation support as is. I still need to figure out how to
strip out the DP parts of it in such a way that orientation should still
be working but DP should not (until LTTPR is in).

> 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Addressed all comments from Johan and Konrad.
> > - Reworked the handling of the vregs so it would be more cleaner.
> >   Dropped the usage of bulk regulators API and handled them separately.
> >   Also discribed all regulators according to data sheet.
> > - Added all delays according to data sheet.
> > - Fixed coldplug (on boot) orientation detection.
> 
> Coldplug orientation detection still does not work here with this series
> applied.
> 
> I'm not entirely sure this whether worked better with v1, but with v2
> my SuperSpeed ethernet device shows up as a HighSpeed device in one
> orientation. It is also not disconnected an re-enumerated as SS as is
> the case on the X13s (and possibly with v1):
> 
> 	usb 1-1: new high-speed USB device number 2 using xhci-hcd

For coldplug, this series does the right thing as it leaves the retimer
initialized if it was left enabled at boot. There is a second part
needed for the coldplug to work. That is the regulator-boot-on property
in retimer's vregs nodes. That will ensure that the regulator is not
disabled until retimer driver probes and will keep the retimer initialized
until USB device is enumerated.

> 
> > - Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
> >   supplies.
> > - Link to v1: https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org
> > 
> > ---
> > Abel Vesa (2):
> >       dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
> >       usb: typec: Add support for Parade PS8830 Type-C Retimer
> 
> Johan

