Return-Path: <linux-arm-msm+bounces-79219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F94EC158FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3131A501C44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ED5342CB0;
	Tue, 28 Oct 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBb9rYMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12B25A633
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665871; cv=none; b=SF2UFxcH5tGcwXSAt56yIwLXxdkNUcqWF6ONEt/ZZ5dsWIwOiL4CvmMLWBPMkhgJNjyeNcjqM4D09HaJ3gX8Jvpo/gJZcoUQDIGkMo/VS5c5sB4+moA6W80Y/bMMeSOM0JRPy3lHoMpk99sHV5krHjV2kiLnONWf71vpHewiemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665871; c=relaxed/simple;
	bh=hkxftgZogT+NrML8v/Ks/KEOR/YUZS/UiQYNzdbP+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiyQVJfxbaSagh173gocxsNOm7yAkzs8lMQC7PwxbloT4nSLbce5Y8SFgLGQHb3UzbLFSwMs/7cvS3F6Dm6k3/rTd8uRqcL4Ipqb77rFISpiiJkVhn5y04NqnUoB6bWehjGFjU+qO/detlW85P9cJsNYhH9jEQrs0SR27yVdz38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBb9rYMJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-474975af41dso41878735e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665867; x=1762270667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ary74Q16PuhBPSjsrWRBA9VPLl5HYwYWAzTzc3x3IqM=;
        b=DBb9rYMJOXxlJyM+m6BXNSpELSoEt/nChqopUq4uC9Qadq1AyVYSyD4fQzarAxmENl
         0BTDuCvadpxWY/wlwJswFHecSRbrAjnyy6b1WcxPi1QZxWNaTmfIOfc36mG3l/FvMIfC
         aKcue7BmGO5Lhq/IBOeqU4miqQ7kQPUCYU63jMzH5wHYb9AGhSTIr+EPqwHLaWZQTz+D
         9oqXgtmnbbI7OhS/TDebd4m5oExs+4i6ZLzxLEZOXy7b5LI396sx/XWOi55epWEL71ff
         d7N0qzLayvzWatOPMQPfI0Sow4PN4aMRKZ3SJp9G732hpBb/PR1TsJE0+yAFu6JOUf9c
         1BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665867; x=1762270667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ary74Q16PuhBPSjsrWRBA9VPLl5HYwYWAzTzc3x3IqM=;
        b=DUmZdb8ucWEz+1AY6FJ9qSMO+9t6Zs8rvMT0Jiuz1/99/VV3K6p0pwgD/GmroOw01L
         LU8JclTfG6Dld7Nc/F4I7XwfaSb/+riDlJkxcTSg9wQCfefd/4Yw3xEtNjlvjKDLsIdm
         ZtjsJhKEjF+DB/rvomg/cH2+9WKfvAQ2ZFlNxvj5l4AcLlGe1swoareTlr3kL2ahDGXJ
         yJ3V83UOwe9S9C9Ym82pag14Z3/W2GReACWkJHLuZswoQmo1ns9rgnZ40FQtEvQDBvL/
         Zn+hIP1a4q6cxUmxumgqBVeoIwp3kgxIDtrvN7sFzqt0gRlZiyUpvyavR3RV3qWN58Zf
         ynAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGLjTnF6vT8A0+AiOF7EP5TijGJF5dAMDV7FiOvT85rnucf2X8F++wqZ2P9V3QkIawpkQo7el5G5K44zkv@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmnjB753l0cYuTRSf/juL0OzklUgJ48PQbwXU3kEe8ekrAVXr
	+hZfr+P9G0gL4QlmLCjPXM2TAYbURjdy3fkboZus7ANw961klGMRpZB49srCdnt3cvM=
X-Gm-Gg: ASbGncvY1UJpiwb7ylaOYDcSXYyLWjuHUprR+aG56xFChvjMju5OmUt31KVv2ScDSue
	t/J6VRwUCY8Os8VrT5kSotzNx+ShQTBCBtSmTIhuuFksR2FK1D6g/WuPFlbzgss4QZUIF7b9Pnc
	v6cliTPubHVRSJ82bb9BZ1n+aQ9w8TFd3z5IkYaB+5IVqmmVpCFhZwHiSoM+AkrscQCeTTE9Qe9
	jTioAqvBHCN9/GaUqD7VnkgKlHZrGoeVQrY9VEGAvI0rdnk/8F8bW1FF0oxTapFQTWMTUQsfxcK
	j6nTh0Kv7NfbGPbRNckIvnQne5TvXdXaa6u7+N+dPNtguGs3eDR89TNUHJVWnkEdoDhtOnR3ak+
	5UGz4CXU9quROYBh0hbAXA5I3yXwjq76URilHF8cOTmvKt6GVWl1WSYN2ZYi1zqcGOavYzfAWnz
	gYzfu7brA=
X-Google-Smtp-Source: AGHT+IGa5T0vOPwrqxsDiAUoacPyZz4CzqIzpe6EkXzz80SQCdnOeksixDrdaFnDHHVah/KpxoMYOw==
X-Received: by 2002:a05:600c:6304:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47717dff4cfmr30922465e9.12.1761665867365;
        Tue, 28 Oct 2025 08:37:47 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm20595813f8f.40.2025.10.28.08.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:37:46 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:37:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
 <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>

On 25-10-28 17:30:37, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 05:19:58PM +0200, Abel Vesa wrote:
> > On 25-10-28 16:39:19, Abel Vesa wrote:
> > > In case of UCSI version 2.0 and above, if the orientation is set from
> > > glink as well, it will trigger the consumers along the graph (PHYs,
> > > repeaters and so on) to reconfigure a second time. This might break
> > > the consumer drivers which aren't currently implemented to drop the
> > > second request of setting the same orientation.
> > > 
> > > So lets leave the orientation setting to the UCSI generic implementation
> > > for all platform that implement UCSI spec 2.0 and above.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > 
> > Ignore this one please, as it is incomplete.
> > 
> > We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
> > if the ucsi version is at least 2.0.
> 
> Note, I think it should be set in the core rather than setting it in the
> driver.

Yep. I agree.

That's what I'm doing next.

So ignore my earlier comment. :-)

