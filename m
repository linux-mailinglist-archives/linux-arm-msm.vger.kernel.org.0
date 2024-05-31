Return-Path: <linux-arm-msm+bounces-21302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CA8D6493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481FC1C24F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CA55381A;
	Fri, 31 May 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ew6gCZyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBBA2E64A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165916; cv=none; b=P8yZoHj0I609aXAUJfcPDLr90Hb5bmaefCu3nBqAT6Nkq/O8JbEezrAcci1R5yh3qn9LkdZW16UiOytEz5EuR724+EvrhQVq4AOdrt33Yj4Ltbt1/KPEQCQm/MDYeI8selCS+sPr7hoHpIvicXuosdChdXXEnlcq8plRES/14kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165916; c=relaxed/simple;
	bh=rD1cK89x0gwQ1Akf8e1MCQlJyJh8IFbiQBAk6Tz76lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLleNwrlcknD86JLlx/bxtb9bR+aXFjiOG941NqWnkDE7MzoPIRrY6W8JHzJoVAGyJ0Jo0ufErtJ3KdYy/h+j3l6VfzpWevT9JwBZk9DM0uYWVhGhziEtryrzdOuVN6fQuW/YjX+HFyzDxFYCUJggU7CM4hMAczgydQ3qIvgAvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ew6gCZyt; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ae279e6427so7663976d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717165913; x=1717770713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w93Mo8Seh4Ih0DonXdf2s7kp6WzdgYrxnnUHUop/6+s=;
        b=Ew6gCZyt6WSo6Sd4GVRrwp7hds9W5KMxMMbujVCgp/MTEXZQOLW5uq5XAvvWGJwtO8
         7Te/KpHlpuzZjuWlbjcea1YCb57VW24tLS9h1isHTOaO+Z2LDfZT3HTfc800v8yqm12p
         Q6ZIAnGMud5ntvvxeyu9hCjNFi+iOgiV0lZs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165913; x=1717770713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w93Mo8Seh4Ih0DonXdf2s7kp6WzdgYrxnnUHUop/6+s=;
        b=I2bzKcC5jmZR7sglXA4GV394B4jZa3F4YN1EcJg5A/N0leweMrfhXCOqPFFzEdrOTE
         H6ueNWtxUsacAaihLbvOhbEOqnQ5SCukZQ0EU9P1GSC2xYTAg0qHeZdSUO+r1q92f9h8
         n7RcCCdp/SOFojCIrOqmdh7VV2j84mfVORboscROZMm2Z19OwCKZ7qcarQBwmgFz3llY
         zIAP12EYkvj+BlP+zajXeM8UAt1yci3+E8NMEc0Jzmj0yb9IrN8+57SIchVaTsbnAZIh
         u+X7FBOBYVpr0fyyV6cVqiS+tAWMXUmhHC2Gh42N7tsecZDohqk75OqvDJRfVjZ7gq4y
         j9hg==
X-Forwarded-Encrypted: i=1; AJvYcCVStlPPMVZnlvwErUvFO/D8Pi1v7IErZEGIvN4TFJ4dKrdH2D5ovopcjvywSOPVQa8pugKn4aLUQpxB8x+KXBH+IhoDMIdgRKnAq+8Sug==
X-Gm-Message-State: AOJu0YwsrDSt4hN6nrrhj7vnnubN+zOhncwHOk1UacuTJEYqNj3eY4Kc
	YcInW/Wt91IziHFBl8pjTpyT1dCmDcErUIYo3uO5t7e7B2UZaSOLw8HOo8L0STyQN25iFYji2Dk
	Q3wVa
X-Google-Smtp-Source: AGHT+IHkbafxq9w8DaaqHMXuyTTVYVXyKyLk/0H9eCsWuRd7vInZjkHXKRumSbwHF53KLL7aihmkGA==
X-Received: by 2002:a05:6214:5344:b0:6ad:662f:c963 with SMTP id 6a1803df08f44-6aecd6fa5d5mr15481156d6.64.1717165912741;
        Fri, 31 May 2024 07:31:52 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a73e767sm6886946d6.1.2024.05.31.07.31.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:31:51 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43e14f0bd75so332641cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/eMysuFzjaa2qunmBa9BVJ5+yYu2C3VNw6jsdEYuq9Tl9cNdJd95NiSsm0A35iTKXrYoJfag51LKwsb6a4UfnL9zqImjRwUPl0gnc6A==
X-Received: by 2002:a05:622a:2596:b0:43b:6b6:8cad with SMTP id
 d75a77b69052e-43ff2c53bc9mr3353421cf.10.1717165910903; Fri, 31 May 2024
 07:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
 <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org> <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
 <d61ede0b-f689-46af-9bc8-e715784b86c0@quicinc.com>
In-Reply-To: <d61ede0b-f689-46af-9bc8-e715784b86c0@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 07:31:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xwf4eW+zwPecDg5855nVEY2NQMqpvHu59_e2xma6=wxQ@mail.gmail.com>
Message-ID: <CAD=FV=Xwf4eW+zwPecDg5855nVEY2NQMqpvHu59_e2xma6=wxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2024 at 7:27=E2=80=AFAM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
> > My only guess is that somehow SC8280XP is faster and that changes the
> > timing of how it handles interrupts. I guess you could try capping
> > your cpufreq in sysfs and see if that makes a difference in
> > reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
> > the IP where they've fixed this?
> >
> > It would be interesting if someone with a SDM845 dragonboard could try
> > replicating since that seems highly likely to reproduce, at least.
> >
>
> Hi Konrad, Doug,
>
>   Usually on downstream we set this quirk only for all Gen-1 targets
> (not particularly for this testcase) but to avoid these kind of
> controller going dead issues. I can filter out the gen-1 targets (other
> than sc7280/sc7180) and send a separate series to add this quirk in all
> of them.

Sounds like a plan to me!

-Doug

