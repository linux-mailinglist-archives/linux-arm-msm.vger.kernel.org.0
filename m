Return-Path: <linux-arm-msm+bounces-52868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED01A76349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809281671E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912F31DDA1B;
	Mon, 31 Mar 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV5/wwld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004C41760;
	Mon, 31 Mar 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413921; cv=none; b=F7rdlYni7rVfkUhauwiy++iy0QO+HeirUqNTmLZqZijkICmj6t+1MUpKFNxDyonaas3ao4UNq9RdPQW8jjwXnDj3pEE9ANVXYKlTF5IhFLaQlGOSPczs1iE/vkRTngRcmXoiJZv053GDy/mAdR+WIedS647Fad9+2Z3nC+/yboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413921; c=relaxed/simple;
	bh=9YPjz+RyoRn4SCXr9t22WJBTFRjnSBTnL648syX2VMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/z6PFv+7Jm18487GalkIkG+J0IqQVJvQrzZ1LW1syWiEZjt99RXomcuv2XutQ6E2OZDzuDppTuam3EWoGPB2vNsn3haveehX9poSRdqBUc/7+TsFTj1UlnoVLMHwHltsk04373E24BCj7i4pK4xO3+8hWd0mf5UEpkx/PebTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV5/wwld; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso26834405e9.3;
        Mon, 31 Mar 2025 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743413918; x=1744018718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vM2Bji0R6GGuRmN2IdJF15qTp2dswLKSOfwXsGQQXU0=;
        b=OV5/wwldsUu5CJ6ibr4/wS1I+qczuwL2dutQOePg9IJDQt7kTlQRK01kNC40JeO+Uh
         yrNRW8N2w4zhtsBbJ0vIFl2pIaPILqSOiIQh4aRm8fdUNGz6HU8OZLQOQGQwPSiGYyf2
         5PIDo0qJN1mUlCiPSOvJBK7JFpIIo+Fkdw+hqd6enyeQcaEjsYJTAFaRSu1T5CCPsCMx
         apjDielMcAKrn7RNeAQmZwJor9mUtOHpwYr2O+5KZBQAL8CQyehVQcp9f4TgHG96gsF2
         icX/aHhRHeLindPIp9PskH00KLS8U4f/8NxMgtoJmVp3TlmZRenS0sWh4Xo/hnH/WBqR
         Ghyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743413918; x=1744018718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM2Bji0R6GGuRmN2IdJF15qTp2dswLKSOfwXsGQQXU0=;
        b=XvMtokIm0sa3Whxxo0wqp9T/5jL2NBcLboO4lsbZEBZYUAP/WWYSWK5kh8kGdQbgsE
         sqAjYdNbr3AjtwJFh1HbBJN4XsCgJ6QCm8Rrhn8x00/FxPpeqVUg+W2fj+BFojfK/GMA
         BMG8CXeLE2oMP8U/b0owvAx3oi1mPNS+344j+upaT0uQvPkWOq0ApgMCZ3r2CLnxKL0+
         oucXRnmHICiZ9ULMKy0+83GJUpdMlluyDgdbrDDNqCpo14jfvDrI/D2k0uVLIivJzbWL
         E/RtpnZarCOjZckT7udox35z63ds8jbiVMdDyqHhSl3B2Z/SSoQuYBc3NCfdrsRyCwjQ
         7CUA==
X-Forwarded-Encrypted: i=1; AJvYcCV97YIXl6kDEEqVifFEha+tKhYgGrImLlcnZLn0ogmDAABH74rW87ZDLiQ/xl0JI8cTpMR1tS0QOGqMjMIL@vger.kernel.org, AJvYcCWsqY0G/SNOAUfCq1I+dkzTRk9SaDLWpm5rG+mY545CqBeE0MeK/HL7ExyyCUJaa1y2zH+tUmZ8LjwB@vger.kernel.org, AJvYcCXEbBCO9Po8MBwypqRLowv/YoHli1HsoEAeKx9mwBv0pmFPseT4EeTt5FTzSGoI0IZZho2ApIj+6EtdEn0bGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4orN9SCDi/sHLkRoN0cNntPb5Z/WmdCjjRnHx5i2iTIZZI8Bh
	CUyWHzpfawiTOnPVHmzXddJbPfUkbcbLS3kv6Tk2bhQzHROh/Bnu8dVsaSDoUEz+VMYVvi6uDHW
	Axlf3WZW6HwOUBfdh9X7f6MX+SQ==
X-Gm-Gg: ASbGncu13IK1EkRZE5s5s517RugdsWAAMm90tJl2UoqCJ8I+bl1n2sGu7hKaP1URopV
	edoAUW1D698SLgSGHCzfztE6lkvPSM3blHFC977d5F32sakdU8mIITnh7+CEdVJw2cNMjMOHcBY
	7b7nFMQ4ZWIOH0m9E5ovg7oN9GfoI=
X-Google-Smtp-Source: AGHT+IHDxLwJLs5M+ervsVqXlAF/ZqEKs+3clpKlQi/t/SoyKWcahheha0ZbkTZT1eaBgifJRMbqFBBUWwfdSR3VMi4=
X-Received: by 2002:a05:600c:83cc:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-43db62bc26fmr62005255e9.20.1743413917702; Mon, 31 Mar 2025
 02:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com> <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
In-Reply-To: <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Mar 2025 11:38:25 +0200
X-Gm-Features: AQ5f1JqsOf-wdERM54oCL2d4gBWWd4xshSkcvSWrMpNLnl4usGWtzA_0SkbQh0s
Message-ID: <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: Johan Hovold <johan@kernel.org>, "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dmitry.baryshkov@oss.qualcomm.com, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: Stephan ]
>
> On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > combo chip using the new power sequencing bindings. All voltages are
> > derived from chained fixed regulators controlled using a single GPIO.
> >
> > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > WiFi/BT pwrseq").
>
> Are you sure this is correct and that you don't need to worry about the
> "how do we model the supplies to an M.2 card" issue?
>
> See
>
>         https://lore.kernel.org/lkml/Z-KuG0aOwEnxuhp9@linaro.org/

Dell XPS 9345 does not have an M.2 card, WLAN package is soldered
directly onboard, hence I am quite sure this is similar to QCP.
To be certain, perhaps @Tudor, Laurentiu or @Bryan O'Donoghue (if  you
have it?) could confirm from schematics?

>
> > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > X1-based Dell XPS 13 9345")
>
> Not sure what happened here.

Bluetooth and WLAN definitions were missing, as at the time I only
knew the UART port being used for bluetooth, and was missing
everything else to describe it.

Alex

>
> Johan

