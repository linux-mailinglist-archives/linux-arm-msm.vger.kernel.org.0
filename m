Return-Path: <linux-arm-msm+bounces-22216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C341D902896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 20:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A755A1C20DB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 18:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AA315A8;
	Mon, 10 Jun 2024 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLSeMQEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D2147C86
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 18:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043898; cv=none; b=M/tsNcXRqE1wyTP8UboEocJMhCNbAHy00RWQ0T9JkZtgi2V2NAUA5SvDl2by76V5Eu8iICkrSHvkajoquPqOz9uvAC9sbHJKfvLyVYtVcNLjkBA6NzUo7EVky/Um6E3m9IYgPEc2ZDLacEeTPV4mF0xDVqXz8m0ITYI432xxn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043898; c=relaxed/simple;
	bh=QXuGc6rD/i+3ogb5lW0kNGaFEh8y4OM7z/QYgEAr5MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnnKnOHFiI62/1I7zEGVIs2A8xmBhdSSeubRamV/zSLC+hmSUeVR3H5BEeNUeEnkJ76i/XBgEjSlQ/VxqGvl0kEVCJ8+pY+6SHtOzerXhoSAsy4Gpj+SFaKvUSJ7ASuRfhFT4kw6+BJCEYD7d86v/WYGIzoSYnDhhL6Zi8KwNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLSeMQEb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc274f438so360243e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043895; x=1718648695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85fV94iKDPP5ejIcWWbM9CJA1/LLXYa+BC+XEnAE7UA=;
        b=eLSeMQEblQEHvINMM8wPoPeyYMEbvLNMsN28WcBhjSepzbia2IrAjVXvCG9YQl2c9S
         U5ani+ASsjlq9Edxez+ZtyxKmAyOdYOUugB19gxT16orQEXZ0BmVxm2ObiwTXHz9Mscx
         4WDv7UrFboxomyaFBhFEA6VAWOK117RxDlRwGTDMunY1o/iBNQTMODFumrAT6FAA/1Q0
         v0DDayOXH+hvvxFC29cGf1KkCs+caAfZVuvyhg5XYpbYmbvW+EoWii64Sc0pd8w16BQF
         2tzVSuAjVjP9JYJznrG7D9WSUE9IqxR4fXwnet9kJoC4KMUr/4I9A49PIPFt5nI0vSGm
         8wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043895; x=1718648695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85fV94iKDPP5ejIcWWbM9CJA1/LLXYa+BC+XEnAE7UA=;
        b=ehq0jH59xxGssttsegQON7W7+cTkvmXyM7LUxPc+bs64l5BOA4q+TVaIdfVGnd1hZC
         VnWoqwEoJAZn817t9C78qhYSOTPR89KMatiAapk/6tYYNeMBA87n+eL1axD8Rkyx9Usg
         dwJzK9wnDm6u2XIpW6ydP3FCk03Wwf6mnNZLwnGb6+sxSnqt7HHGsoVh+pnWYbLONoHt
         WIUiTrXfPVxmGMqCLQe7/09KrPiWDewMIpXHYlUkVHwE7iAqdR5wjcxJ64xYSvsvIf0O
         owjgiH6VVPOt4q3IFRJymOvnRv7AyKAXrfBPmffVrR5P2Dwds88AKZj0zwkwa6ScT9Hq
         k1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU0eHAM0+tOs+gRmexKE/QPXbJjoYLbuX0+73OE+Go/k4NFSP3Z+2ISLAPk4Mtu2tIZEOcIX1yrHoKgjabCVqL/4fB1fPFN6moulZDwWA==
X-Gm-Message-State: AOJu0YzVaJ0FSNXFpaL+7rjlAb+wz4I6/tEX4HtxObpL0haIuB6+4bHj
	jTJ+hHd6rOv8Ob2YLMKJSZEPROtLh2aPSPQy/XYC4nM5FS4jGdROCE4JRFPWMegBFyeLhYQu2aF
	T
X-Google-Smtp-Source: AGHT+IETLq0+3npA+1ldTNeNlD3hH0XVRYz/fMMGTaoJ0jb3KRoa8rWuG2H/dtzMV4OR8i1EIR3YDQ==
X-Received: by 2002:a19:2d07:0:b0:52b:c1d5:949d with SMTP id 2adb3069b0e04-52bc1d59815mr4865449e87.54.1718043895209;
        Mon, 10 Jun 2024 11:24:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8f54f091sm436234e87.133.2024.06.10.11.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:24:54 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:24:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v4 05/11] misc: fastrpc: Add static PD restart support
Message-ID: <cy3bb2vch7pg24ldjhcq3pg456n5vrdwqsdcwzpghytrxzo6ta@hhhr3nelfipy>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-6-quic_ekangupt@quicinc.com>
 <wsdk6i6wp5ahxs3oykwabtxfkqc3fytvaguchkl4imd43r2lv6@mq2ejnbwmpmo>
 <5e4a8de4-73b1-4518-a99b-78a85dba028f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e4a8de4-73b1-4518-a99b-78a85dba028f@quicinc.com>

On Mon, Jun 10, 2024 at 02:35:48PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/7/2024 4:55 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 06, 2024 at 10:29:25PM +0530, Ekansh Gupta wrote:
> >> Static PDs are created on DSPs to support specific use cases like Audio
> >> and Sensors. The static PDs uses any CPU requirements like file
> >> operations or memory need with the help of a daemon running on the CPU.
> > What do you mean by 'CPU requirements' here?
> Something like file system request or any memory requirement. For these types of requirements
> PD will rely on CPU process.

So, this is not 'CPU requirements'. It should be something like
'requests to the HLOS'. CPU requirements would usually mean something
requiring CPU cycles or min/max freq, etc.

> 
> Planning to drop this patch from the series and move the pd notification specific implementations
> to a different .c file as per Caleb's suggestion.
> 
> I'll address all other comments in the new patch series.

Ack

-- 
With best wishes
Dmitry

