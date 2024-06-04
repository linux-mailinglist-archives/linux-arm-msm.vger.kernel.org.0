Return-Path: <linux-arm-msm+bounces-21610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FC8FB564
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6765F1F24467
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D26F13A3F7;
	Tue,  4 Jun 2024 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p/Eygaex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83865145348
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511515; cv=none; b=Wwb8q5ymFLSEztYL1OxhMth/b2shBb0wzSyo0NwGRBFolFbzPIGVhfv3fOl+SYiv9v1ISOtWqIAOoER4DUymUirhqdR4Uf+VdGGSbkt39XMSdOLVvEaJM8U1PR9hDmE/SP/wq0sSzxXYNqjTeVdsM48Sf/gkCGMtWHwDaF1eb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511515; c=relaxed/simple;
	bh=gGDKWu3B5VRRZlu7zBNJnku5j12cvC/da0ucF6mg0aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5IBigmFa19FvzEF1zyZqnYhRfg1JoO0fn9M1C6lnAB2IDQwPd6SxFMvrR83gLWiOa3e5B5dFcn8KdLytPTsjHzxSs8DaeZQfZIiuTNCr5NLYwW52DXwiA2tW7hNUjG2ie5QqqvQao2o+jQITqyiH0cQBd+pzYR+gBfpw9iQJ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p/Eygaex; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44024f5271dso154731cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717511512; x=1718116312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8l00WT5M+hkw2d4NnjSJbqOkW1RZzStGuA1CvK2sUM=;
        b=p/EygaexJi7LiNUYm14Ga7G/St6vgZsjA1Cb63va3SQhJc/tb41xAgPHSjkhe0nATs
         ZQ4NvaSkYer9B/COM8Buefb9bTtzQLdPKZD/NGgra8FFvvcmSafjPJqZS5jCtcQV8A8f
         mwBHemakOoFwylGIUl4JcFjUjRQDhfdgn3g7ueSOVHndqGfm6Xg+iRV5z6JGapYkqckn
         F8Y+D1YFv1jtFGafYI2NxQb9BRpc6CAVBq9TWhU2mPrUVVHhw805+/ZNd+zFgRQb+Hv5
         7u85aQ//pfdjbuNdC+5yDiiqK9wPwyK+WbOXgsT41UQtgWfnmsODkZ4gEjUL2Yz2LdxD
         f7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511512; x=1718116312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8l00WT5M+hkw2d4NnjSJbqOkW1RZzStGuA1CvK2sUM=;
        b=wmyofKkaFJ1U3QjMKO9t9x62xrQUSkCksZ/AII6pd5B0/ABCtnUrjLHr5QbqvxjyPg
         alnpQ6nKDU6X2rDgAeyLYJvq1nH1V9874pk5bKPT+d6LGSj61f14tEi1MNLRmOVrP8ri
         RqTsr0xzSKbRwBwa3qFsZKTXflnCnasTQXHXkBrKWOplvPuzfuMwTZUoCFFrBHj4FDGY
         ojNvOrMtvtqJI00DTOroR0I0Ii+79T1ZsNBBv9qwGyaZcb5YsNGUFMADi3vAe180wZ6s
         poVPmAjqzfAcPAydtZ2qowvYZZZ0bpXlkbcBT1jFz5NYPT+mdGG9h2+lTqzNk9XdL60y
         r16Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIH9nNY4NJfyo+i+CZV2nLW8H6yYYnw9FAqbeD/u3CkKJ9Lh7IC9pmN2MHvMmSdLuyUuadabE3/nfm47C+6VEs4OAn8lZiWyp+37M5Ug==
X-Gm-Message-State: AOJu0YxUnaZ/qhf1NasyfsTipKQ9V3J4zUYjDRRoca9mm/odC1wX8UTw
	tMRd/AXdE4GOdfU15GuM01jBS9N/tk1qVN9xqXfVGwjf0Oi3pAy9QfDncmAVnROvVM8UZiTIB2v
	VPNMkEddxAyEfNSik5fGbDJnDoAkepC0UAci7GdOh9XtbM6eFHC15
X-Google-Smtp-Source: AGHT+IH/O61+QNBbKWIt4c3u1Z1AJi93HK8DE8/RW5ricyD3nsufx056k6EOeUUTHgwQelBTxwPZMgXy8F51jYSIh54=
X-Received: by 2002:a05:622a:6116:b0:43a:db0c:ed9c with SMTP id
 d75a77b69052e-4401e63ced6mr2558031cf.15.1717511512081; Tue, 04 Jun 2024
 07:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com> <20240604060659.1449278-2-quic_kriskura@quicinc.com>
In-Reply-To: <20240604060659.1449278-2-quic_kriskura@quicinc.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 4 Jun 2024 07:31:35 -0700
Message-ID: <CAD=FV=XKKtd3vArUzo+5_o17Prm-G5_tLBCzv+5q3gp_UfR8gQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed
 instances in park mode
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 3, 2024 at 11:07=E2=80=AFPM Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> On SC7180, in host mode, it is observed that stressing out controller
> results in HC died error:
>
>  xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
>  xhci-hcd.12.auto: xHCI host controller not responding, assume dead
>  xhci-hcd.12.auto: HC died; cleaning up
>
> And at this instant only restarting the host mode fixes it. Disable
> SuperSpeed instances in park mode for SC7180 to mitigate this issue.
>
> Reported-by: Doug Anderson <dianders@google.com>
> Cc: <stable@vger.kernel.org>
> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Removed RB/TB tag from Doug as commit text was updated.

It was a minor change so you could have kept my tags (especially the
Tested-by, which isn't affected by the commit text), but in any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

