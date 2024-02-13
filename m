Return-Path: <linux-arm-msm+bounces-10917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BD8535CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 17:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4C7280C2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 16:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A6B5F851;
	Tue, 13 Feb 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FpqH/Sjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7E5F54B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707841093; cv=none; b=gR0xEqnqGuGbSF+FbQBV70qmsZb76Yip0cEDptvpyGujZrmyiSFKDiKNPsU3KD4c+njzEaHqaht4D1asaFo7fGhOqttBMKj2TuSAhpYqmnX5Kq6BDuKCzpHgP5eCJM9Lu158C1LcVV97Iri4pSm6GygMbxxEID8w2Ospy7kDxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707841093; c=relaxed/simple;
	bh=2KcI4FrqWW+CE3taGQPv55SZsbQRxd4d/ksvlG124dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8D8FBgnLpV1hnEBs+n38Z/fVPmx7rWolGMGi+QGbpFdjOK2WieDo9LZd+eWk+iazwnfHRC+z5/IgmhdvlptaF15se1EiPb/X1Gp7OTo0DfjmAepOKvewfPzcOG1aXhiR4XvUzIz4BBHBj6RifqZssMmkmYqZs6GMxrYEPbHfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FpqH/Sjf; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7c45636407bso110041639f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707841091; x=1708445891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlgJF35WGDHbKHgYXjs8y1mAvdUenBmv+lFnZes+sKc=;
        b=FpqH/SjfLTQOhNbppyXemHAfStWs67TFI3G/6FeshxbC/17jQ2/Ohiw5sxNfiRELFK
         6C4LaFHNis+aU18MFY4BlMy2D7hSZruDT+w4RZC/QPRWD4idpk4Yj1Yh4rMw+gMRJGy/
         gTWho6ehAyFnB9O1QAXGCEbaDV/ppAmuJNfRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707841091; x=1708445891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlgJF35WGDHbKHgYXjs8y1mAvdUenBmv+lFnZes+sKc=;
        b=KF6gITlIaWni7aP74ZSKkIoGsv4449y8C7TinP14MDDf0ytVqMaoI9KE3qBHnZWDqM
         jliGKKiYk/oG5f04h4PetkgcKrMoBYPDQww2qbltaoi2xdHaPreac5egP8zp6EnginJc
         PGiQxmTrVWdMm8XAoNE9KEYa2f3agUAaWyp6Lda+chWC592dF0GpZe+3INX9hkR83nDm
         J4Dh/auOYwseoz7chV7svFX4bxW7ceVummmeoTdXwnBpBDnLuZ7LgXqjDyZPZane0Evw
         HiUl6XH2pKSuF7RTBlpSN8MLFJ9HXm1bi2cRa8snpa4bRSI8Wud/l5el5l/NLeldYQnr
         eVUA==
X-Gm-Message-State: AOJu0YwU/VGS2ReurPpjEqIe1TKjvsjNK+PRyq4A4UcuwYpwT4kRnZ3D
	Mbv73c+zmgVWLNEn4yyg8aEnWRRxXF1hU+1gI0bGN627DJE33DJYHYqr5eNEWQ==
X-Google-Smtp-Source: AGHT+IGgP4YJEUx4LiIwxbcZKfX6Ee6cR7v/AkcHs4xcEqM8VhOcD6Skozg7JRJ5N29tglyKyitryg==
X-Received: by 2002:a6b:7515:0:b0:7c4:5e08:f265 with SMTP id l21-20020a6b7515000000b007c45e08f265mr125289ioh.13.1707841091396;
        Tue, 13 Feb 2024 08:18:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiwgCA4mecHx4KE5dEq/TSP0Bxd3qlRWtDMUGg+EfGw7CyyT1YC8SSI7YvVxApPQemo6zI49wIsV+VeDX6naVJNvBnD5+enqNqtnwtVMrQf7mq8x+lsEA+yskH6ne9hi+zZiRKPT5Sycs3wHf+UPoLzwOTqqG0tSeFAsHJzmartE8XIs5l71yirgpSmyk0t8OBOGk33na345zbpCHvL8rt6KppuqiwrozHn31CDAs8DSwSIYi5VGZc9x/wYaMdVCVfbmxWFn3BNHnDVxZsi5ZG+ZGCPL5ouFmvS1eevS2WZQUF37OHlhVICnhNMv4hBbLflCxd8JWxhCbbyfHoJrdln8YyWEs34+GUlKWrMas8J0ssUcZ6i6bRzZx56ucCKTLhhDnogFnjpxbLQHdTDsoObiqXh+dYuCpuqqyXmxvVD76ZDDeF9b9va1Pksx1Ov+0EStnZiSsjnixI9wFG4g==
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id f26-20020a02cada000000b00471346c4225sm1922415jap.7.2024.02.13.08.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 08:18:10 -0800 (PST)
Date: Tue, 13 Feb 2024 16:18:10 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Johan Hovold <johan@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] Bluetooth: qca: fix device-address endianness
Message-ID: <ZcuWQkmYK4Ax9kam@google.com>
References: <20231227180306.6319-1-johan+linaro@kernel.org>
 <Zct_tB-y7HbZU1dp@hovoldconsulting.com>
 <ZcuQ2qRX0zsLSVRL@google.com>
 <ZcuSwy0quwKoZkkm@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZcuSwy0quwKoZkkm@hovoldconsulting.com>

On Tue, Feb 13, 2024 at 05:03:15PM +0100, Johan Hovold wrote:
> On Tue, Feb 13, 2024 at 03:55:06PM +0000, Matthias Kaehlcke wrote:
> > On Tue, Feb 13, 2024 at 03:41:56PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 27, 2023 at 07:03:06PM +0100, Johan Hovold wrote:
> > > > The WCN6855 firmware on the Lenovo ThinkPad X13s expects the Bluetooth
> > > > device address in MSB order when setting it using the
> > > > EDL_WRITE_BD_ADDR_OPCODE command.
> 
> > > > Reverse the little-endian address before setting it to make sure that
> > > > the address can be configured using tools like btmgmt or using the
> > > > 'local-bd-address' devicetree property.
> > > > 
> > > > Note that this can potentially break systems with boot firmware which
> > > > has started relying on the broken behaviour and is incorrectly passing
> > > > the address via devicetree in MSB order.
> > > > 
> > > > Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device address")
> > > > Cc: stable@vger.kernel.org      # 5.1
> > > > Cc: Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> > > > Cc: Matthias Kaehlcke <mka@chromium.org>
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > 
> > > Can we go ahead and merge this one to get this fixed in 6.8?
> > > 
> > > I've spoken to Bjorn Andersson at Qualcomm about this and he is in
> > > favour of doing so. The only people actually using the devicetree
> > > property should be the Chromium team and they control their own boot
> > > firmware and should be able to update it in lockstep (and Android uses
> > > some custom hacks to set the address that are not in mainline).
> > 
> > Unfortunately it's not as trivial as it sounds for Chrome OS. The boot
> > firmware is controlled by Chrome OS, however for any baseboard (e.g.
> > 'trogdor') there is a larger number binary firmware packages, one
> > for every model derived from that baseboard. There can be dozens of
> > models. Chrome OS Firmware releases are qualified and rolled out per
> > model. FW qual may involve the ODM, usually there are multiple ODMs
> > per board. In an absolute emergency it would be possible to coordinate
> > a qual and synced rollout for all models, but it's definitely
> > non-trivial in terms of operations.
> 
> Ok, fair enough.
> 
> Could you please provide a list of the compatible strings that you guys
> currently use and I can add new compatible strings for those, while
> keeping the current ones for backwards compatibility with older boot
> firmware?

'qcom,wcn3991-bt' should be the only impacted compatible string for
released devices.

Thanks for maintaining backwards compatibility, and sorry for the
inconvenience.

