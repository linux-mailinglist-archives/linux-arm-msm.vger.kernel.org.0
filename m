Return-Path: <linux-arm-msm+bounces-79221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547DC159A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1420C54842C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E675346E69;
	Tue, 28 Oct 2025 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aI7T47Jt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7C342C80
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666276; cv=none; b=dyK62pgmvChdu9DD36XMq44EGzYG6KWkIijRZ3ME4x1XZhjrM6juBHtw7tJumllBmvn+X/OBwbvdjak43VEBzH7tC8pxT+RQZoPfiYP0B9Ytd8iA6XoRTReSOO1/0EmFeL5OYxueY5avPNAXHQzSaQar+1JCguZ5aVZC0ydgRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666276; c=relaxed/simple;
	bh=ZeWbW3cwFzTk+snUQ1YZru5uS3rdocJhJhmNIAkZTos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0hryywJRA8VMRO5J8QIHGYWgNhiWT9fyshwlsQDiWDcFnHuhOhq5SXs45TQ2pCNU5v5z2kvYE/LpLrzrk6p9TJOUNbAT7qDyRsIqTJmJaJUu/AWZWGKOVjORH+VE2Wsv+DOsBf+YuiYsNCea5jjV1RiRkJLVZWgw8DWnMrDl8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aI7T47Jt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47114a40161so69284325e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761666273; x=1762271073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxDtTm5Uk2GlvziLH671chbdmWE90Ft/hZE2+B8F9lE=;
        b=aI7T47JtgV8TEWD/on7n8AyrcVYxh7MD90BkXCGHPwbX8pP9tco9CL9WLzg1OHL7oP
         tv2EJLkXIeyd0dOt/OPaKBdXNVMsWvHEniGMRW48UCQNhTb/uzeAU38E9IaPrO3mG4I2
         g1O5OyohVFvNP58oNm/1HTkjNPQ+y3MINs5iDd6xP4yr0dCP4+Mwt3jSpmPoeqOQuRWR
         JivNwjGapCJeckXJfpXrBt95VUiQ+mj5/sDlroucvAFSjvqPg+DdjcqfKFy6N17S/f6r
         UwqJL5ZjXzjZaE+9hOFTv0vpBv117p8+WOTtEnsVdm9tLKBNmpTT77wa2Y8Go2NdWWqt
         0DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666273; x=1762271073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxDtTm5Uk2GlvziLH671chbdmWE90Ft/hZE2+B8F9lE=;
        b=b3nt42EKSQo+/XSGJ1OSqe5ZIcf3/kGnow7W///xP3hFwRfOsqpnDMqaQXxj0u28uX
         Cop8cleFdlRFxvqRNXZ7pQiQuBOBRoi5mqvaJrXxbmMneF85Rc9XK6i8rHBco95mCeRZ
         Etna5DVeNRz4xSVRTC6qptefSK5/Q5retGZaJMnAvXu4Dpv/r3hRnGe9q63uCcrcO3g2
         KaJ/CB3JHWN4GOHiom5SQvT5yf1rR/hBOnFBxYnwpoYrDHFcnLxStin5oma6LR9Xb6co
         l9H8h845WwnXGFz4nBEczZrfFg76Z7WtVyy2bhURgmUgeVh1iDwn/ayZyfwGU+OAfpW+
         pKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNRewFBoRu7GP5ihqfm4BBLzC+mejSU09KBQulY+AMsEWErwREk8Xdjg9BnkfJ1Hbw996cUsauj0/1xhUD@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVWBFhHjBObJYuyYwJSDYrOimPYV3e85Wp2/Z+u8ZagzpI+Tg
	kFeKpd4+UEYwcQr1Ca0n1AmDzwXEIysJvpIkif18/xUdSaF9krwEGrWgX+UhPhYOiC0=
X-Gm-Gg: ASbGncuy8+yOTTQDIw2rwnFTslCwi9ZKzfKW30h2oQ2OQOza0Hkeyi90Olc0eaGXXyl
	HfxYM9GpkZh8QvC4LyXhLeDfjFS7JfjL/RvOtK3oKa/X04kZtjuw47Kv1wC8W2sGg52rvaNr3UO
	nxBZsR0Ldxp4XOnQb735gnilc4o4RMpKd6C76Pd4oczWdqAr6NOAU+wtK2DbhdVd6zJ02WXT4dU
	EeXaRj3MfgXkcL/H4h6a61QakvE4c6YEo0ld4bELv4Xwz1T1GHtjV3OGeGNPe7cXXEBdgQRj6rk
	WRPdbx5oAzyW/vyWpilh/qgMohpANyooNnVsv8en5H3sob67Tp4Zean5ScUZMASWY46q7x+Cfjp
	SMMMN+n9DuFR0QF4+f3xdDmB4CtWM8cIG2qn8VLqdb7vbC+49WpqmtxoIO3cALY0phDxf9U+m
X-Google-Smtp-Source: AGHT+IFaU/N5jEahD1Hr0mgcuydBUovhHsTFqREepEo8khWPEdTWoHTHChqz2NMEQuQxs+evxhHULw==
X-Received: by 2002:a05:600c:46c4:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-47717df4dd5mr41181545e9.2.1761666273275;
        Tue, 28 Oct 2025 08:44:33 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e4esm195344815e9.11.2025.10.28.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:44:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:44:31 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <ikwmc2pigfq3pagcetssxkl3u27ozucrwku2f64qd5hvaonna7@3dj6s24dc7e3>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
 <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>
 <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>

On 25-10-28 17:37:45, Abel Vesa wrote:
> On 25-10-28 17:30:37, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 05:19:58PM +0200, Abel Vesa wrote:
> > > On 25-10-28 16:39:19, Abel Vesa wrote:
> > > > In case of UCSI version 2.0 and above, if the orientation is set from
> > > > glink as well, it will trigger the consumers along the graph (PHYs,
> > > > repeaters and so on) to reconfigure a second time. This might break
> > > > the consumer drivers which aren't currently implemented to drop the
> > > > second request of setting the same orientation.
> > > > 
> > > > So lets leave the orientation setting to the UCSI generic implementation
> > > > for all platform that implement UCSI spec 2.0 and above.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > 
> > > Ignore this one please, as it is incomplete.
> > > 
> > > We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
> > > if the ucsi version is at least 2.0.
> > 
> > Note, I think it should be set in the core rather than setting it in the
> > driver.
> 
> Yep. I agree.
> 
> That's what I'm doing next.

There you go:

https://lore.kernel.org/r/20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org

