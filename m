Return-Path: <linux-arm-msm+bounces-43034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2B9F9E85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 06:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439E21882397
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 05:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479F81DF246;
	Sat, 21 Dec 2024 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhaqwRoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE710163;
	Sat, 21 Dec 2024 05:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734758867; cv=none; b=PCbBbB7zoOs+9UkyzL6LARUz/w3AkdnLIKsHPYSjWL6nCGtoQuNpaXswnVKOuG7WWo/8KRYaMrIRdQACL4WX2KMNPWRhX9cWSqRFk8p5WzOGqjW2vi9a4A9yeA7K6quvbA1hEi5stSoi408l862tZ8boWh/D/Egz/ZQNb7wsRjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734758867; c=relaxed/simple;
	bh=U4gLcbEPg+CsyVBxB+R3ZX39WFaQqjYIDvIlNaIVkO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BolprmcT1jsxxkSysH7JYcdox0bKH7wATJHwu2BkZjEnaH+u8P/+R43T8YeP0kuB786ULC35syYoWZfEcQeopmYM/hNfK+CrSk6QdywwL0VsEXVAJ7cOLjgiOv07FbK71+mAFh3NZOFnToEYdk9kNQpYLbdhfD3c4bgZo0Q/sac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhaqwRoM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21670dce0a7so31286035ad.1;
        Fri, 20 Dec 2024 21:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734758865; x=1735363665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GYQGP1j9I3brZhGo+KMbkCCuGXTUOAxoafewXwsJuk=;
        b=LhaqwRoMoBocWGCPVwzYSU4bYI+CEJlEz1/s9bVretujv1lqHOZSi0SPrHzXsOi2zf
         Cy5x9CoxDOxY3WHg191MZgesgckdkWxLVPSoKOLMWm8QGM5eGOnzBrxjXkZ4GTX+FxE7
         N7ynqrwfZg1/XrPNy5afY8hNUMxWocvuhq15SuZsT5JyOmT6CBQuq/oBV9F1rTAoaUln
         Dnxya9BAcCScjaWUgtElWgYNH7g4uXP8J8d7NJqTR9NGHqEGPRdshYKZEcPCDt77O6JV
         OH7eLrDGjGLg3GFyLCda5wQYrBeJEQRZ+Zg/ZFexrbcmxgYdYu3cRGaiSmVEnsu+a0BU
         ls7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734758865; x=1735363665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GYQGP1j9I3brZhGo+KMbkCCuGXTUOAxoafewXwsJuk=;
        b=YkbBmVgAitou35yWdwhYGS/uak0F8A4cQzMJVN6RwZDrO+QDgsYVoTvnu8vhpzQD9E
         0WxeqzxaoPXzpo2c1QecMRg2XROVnhNQmkyPqgfRguxO06T5DDusv5m+v93wo6Y49yHU
         pSRjX5AKBriIra7AMfyDLJWcFjEcUsgOp5qQWXfcJAEUORiOS3YgNFNa5zdTThv8jaLX
         sIYbNjcXGC8I8+qywzkZglfjqwwizphh585GM+17tA3+XUC09XlWH8YG4aWSY1cSKcwG
         93ncGhdFiaEu+c2aLP2k/afr/MAM0ozdkfamKaN0z/q9OmDCNKnYY+UMJSM/oZL8X/sI
         B3pg==
X-Forwarded-Encrypted: i=1; AJvYcCUD9ViGLILxgoo1Uni2OrQ3GZKPg1uRhjNVqno3cJeJO/q+Q1HWuN809azftQZFLM/z6ktrycq+kYjLkhiFQA==@vger.kernel.org, AJvYcCVbG7MeE/D4IseSJnEQ6r6jhcKZ9zoXG3gR/7dFWMSAIA4lKZ9YyEqeBUQ2lWrLEk2AcwBvlPknLTX1@vger.kernel.org, AJvYcCX5TM5hReXHl4m2vTj6n0ko0nSs4Q2mnkOxS4bXthdRL2uA0u6AqKLlLz/y0j1guXQQJrmhlCwL0nDxFo1g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YEuGCaSCZE/jv8xKYmeYSWfsJRGIk92RCImIX9gNYv7KAfJA
	HeGrMsQJfQCtM/0J6fz/zsTFmNS3mG8iT9NYJ5H8p10ptcRCso2n
X-Gm-Gg: ASbGnctbQP21gAj7hoQXZGJI3XQ32r5m0xbxa+SSu47h1I86MrPW74mKW6Mn5cufvXD
	GDJ/88ztkblbC1x0S1qAaqeQRujc7n2gnbu4Fa3zNHFzecKVfXHQmm2AN1lNlcZgva1bWNjW9rq
	mQ6o4Cm+4RWlp7f8+uPKWHTaLI3CkFywb8k8KzI4hSM9xr0Km+Bi7QbiTSFl9Nuyuj/wg56wkhP
	/+I3Pt3hqYw3/Abbhz2i3eR0+xRJLKa1iOmSg/NzI4z2XXAVKmBFs4=
X-Google-Smtp-Source: AGHT+IE0mDToVQEh6rb+yQjn3LLT6AXsC5V9WsWrcjIhsUdDquXA4+lnSsOX+8qg2iLEQHoi4fHfFQ==
X-Received: by 2002:a17:902:ef12:b0:216:52a5:dd41 with SMTP id d9443c01a7336-219e6ec13bcmr88159075ad.31.1734758865024;
        Fri, 20 Dec 2024 21:27:45 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51c2sm37390825ad.190.2024.12.20.21.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:27:44 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: johan@kernel.org
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Sat, 21 Dec 2024 13:26:25 +0800
Message-ID: <20241221052626.451989-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <Z2WZbX2NajDFAgBk@hovoldconsulting.com>
References: <Z2WZbX2NajDFAgBk@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Dec 21, 2024 at 12:20 AM Johan Hovold <johan@kernel.org> wrote:

> On Sat, Dec 14, 2024 at 03:39:27PM +0200, Dmitry Baryshkov wrote:
> > On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:
> 
> > > >> +
> > > >> +                /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> > > >> +                 * there is no calibrate data for huawei,
> > > >> +                 * but they have the same subsystem-device id
> > > >> +                 */
> > > >> +                qcom,ath11k-calibration-variant = "LE_X13S";
> 
> > > Finally, I found something, after I enabled ath11k boot dbg, I got my
> > > id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
> > >
> > > With qca-swiss-army-knife (see [1])
> > >
> > > $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
> > > bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
> > >
> > > It have already been here. So that means I don't need to extract from
> > > Windows. I just extract it from linux-firmware then give it a variant
> > > name and send patches to ath11k, right?
> >
> > No. Usually 255 is an ID that is used by a variety of boards. So,
> > basically, you have to extract board data from Windows, add a proper
> > calibration variant that is specific to your board and then send the
> > resulting data to the ath11k mailing list.
> 
> The board files used by Windows are not compatible with the Linux
> firmware, so the calibration data needs to come from Qualcomm.
> 

Then I don't understand why those bdwlan.* files would be in the
firmware tree.

> Try filing a request in the bugzilla:
> 
> 	https://bugzilla.kernel.org/buglist.cgi?quicksearch=ath11k&list_id=1147229
> 

Thanks, I will try it.

> Johan

Best wishes,
Pengyu

