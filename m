Return-Path: <linux-arm-msm+bounces-21110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 087078D4CDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394BD1C2180D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CF217D888;
	Thu, 30 May 2024 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBKbPCxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66A17C9F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076086; cv=none; b=qMTm0TcBjKfhw3lxjkmfaS/b+3XEgpzDlpim0ilGslpaezdrwdLrbATsqRSqxrpBuF889Je4kSt4hpa4ssz3dbbbodSyn4hCZ2fC8dV0EqwEif7EAWxRNpq3nMEflVJDfYwOEJLItb55yNnh8dcLdtf12W5rALTSKOFoLxzVbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076086; c=relaxed/simple;
	bh=iEY3TKMBR3VjMOO18gro7lwUoFToxzJsoKmK2rYmRAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ypky1rc8ELvMwK1h39L1A0KtqVi4QX6JmxlEX4mr9MWt/3fIApwmp+xfRLi4rTjv+mpafI11e/UcEf7hJR0k2Ys43tyyEJCoyFPIeXmlyUbvRC+EjeDkaeAwiafbIZb29mIkXe3Y7T1r4f96x3fUWP13Lx8+k9GdtOhJHx0KAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBKbPCxq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7948b7e4e5dso65838985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717076081; x=1717680881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ekpEHUCDsezH1RNk3+5n/lewOHNyOHOYkS0J9gidF8=;
        b=aBKbPCxqHwC2dYJcMPzqWL1Xa+xBizSMYD/GHdED2k8s9cnnuUZr4J+NmrwYiey/gY
         ZE+1TXM0SjfRckd3YiHio0inL2s5vr8BaOm0euzdHcJkfFeIyd71eEnW8h0UrVhrpbSO
         gOS6x11fHogddAcXuJr9AdjmlNtpE4oR8prVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076081; x=1717680881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ekpEHUCDsezH1RNk3+5n/lewOHNyOHOYkS0J9gidF8=;
        b=HCfmDaEnQMweA7bfQseTAKD/pZ24gFbMW0Mauzo9x2pZFA8Zf6IjLVy5VZoLlsprGm
         Qmju/eRy/AEsHZNfS5C/f/vIKg4I1Ox26be0Oeg7zmqViuVfrFi4w6ovRZy5wRDPvwl7
         CZS3L+Urk/ZTjscIK45yGjAasDuQppch47KiFgUAz5VA7nxN8p5eE66h87X0/yby7ZYO
         LVJThW5muIGcKVmX1KBaMB0VE1dQA2q0SVNrzSURc7ST9FLGYEBC//hyglT/o9gepgbm
         bVWqsgvjqse1dmGPP3+9j3nIf+YG2cvi3rD8BTwhhIfwFzHRQSnSNL1Sc1OtmxYUD013
         J/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLwCUZi2PoVECGVsgyqmCL8DWYACpAnypq6jW1nBAQ6wu1FWF6TTgHcje1h6FwiVxNVJ7YrvChN5u9OtqagGPSLQHvzmD9lM4L9X76Yg==
X-Gm-Message-State: AOJu0YzaZtOfgRSLnBaBuU8MbdEPaszI5mzKpEvlPZ1CHgi/1m+lWuim
	7YfqTqS8MxDlFsWjLRBgXlbv2eG/v2cIsJDgLoCIZxKZ2upK8NaZr3aStav7sLmOZ+QmgG7MH4E
	=
X-Google-Smtp-Source: AGHT+IELR3Hc7aYBIdbNHVz34WjGmbbaMu0PN3gRzdGTVEfMFxfPN1F+GY02rG/GLTNIi4EI+bSo6A==
X-Received: by 2002:a05:6214:3104:b0:6ad:638c:a89c with SMTP id 6a1803df08f44-6ae0ccd7801mr30714196d6.53.1717076081295;
        Thu, 30 May 2024 06:34:41 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad933dba20sm25378336d6.37.2024.05.30.06.34.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:34:40 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43e14f0bd75so263241cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 06:34:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrziETSPF11NcWeHZOrqsFrj5ZX8HxNEfINxHbC38iAXnMo4rHJl/1DhVBWYXUSkYYH46owM8jDdwURwlap3YgYbBEYvXRsdVOOrh1qQ==
X-Received: by 2002:a05:622a:410c:b0:437:b4d9:ddc6 with SMTP id
 d75a77b69052e-43feb50e3a2mr2651001cf.27.1717076079721; Thu, 30 May 2024
 06:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
In-Reply-To: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 06:34:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
Message-ID: <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 1:26=E2=80=AFAM Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> When working in host mode, in certain conditions, when the USB
> host controller is stressed, there is a HC died warning that comes up.
> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
>
> Krishna Kurapati (2):
>   arm64: dts: qcom: sc7180: Disable SS instances in park mode
>   arm64: dts: qcom: sc7280: Disable SS instances in park mode
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>  2 files changed, 2 insertions(+)

FWIW, the test case I used to reproduce this:

1. Plug in a USB dock w/ Ethernet
2. Plug a USB 3 SD card reader into the dock.
3. Use lsusb -t to confirm both Ethernet and card reader are on USB3.
4. From a shell, run for i in $(seq 5); do dd if=3D/dev/sdb of=3D/dev/null
bs=3D4M; done to read from the card reader.
5. At the same time, stress the Internet. If you've got a very fast
Internet connection then running Google's "Internet speed test" did
it, but I could also reproduce by just running this from a PC
connected to the same network as my DUT: ssh ${DUT} "dd of=3D/dev/null"
< /dev/zero

I would also note that, though I personally reproduced this on sc7180
and sc7280 boards and thus Krishna posted the patch for those boards,
there's no reason to believe that this problem doesn't affect all of
Qualcomm's SoCs. It would be nice if someone at Qualcomm could post a
followup patch fixing this everywhere.

-Doug

