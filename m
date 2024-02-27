Return-Path: <linux-arm-msm+bounces-12633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A8868886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 06:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12A611F249D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 05:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F83951C55;
	Tue, 27 Feb 2024 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HaIdc1OD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290252F72
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709010860; cv=none; b=bkNNE1Kws5vZ8eUsZ+cVUQQ1YcWrTATXKydqaa724ggtlJ0IK3Ih2ykAE3D+l5w4hvMxWMzU0oyzzz09FE3d2IjWYYiJcEzLuUdbnekyebbwTP9LqdZyO0EnU9gqS8FhXkNi5fm066MRAHCv5z4FsvUqSuEMq9eydsDhDBDp6cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709010860; c=relaxed/simple;
	bh=Wgvaos4tMDHQHCPQqba3sjMn7hXYBzfhsdVtj292alY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V73yQxbK3k1xvT3uxWNBJlBMCkvWS2y6KlaShwbPnW+HGDGrCkLMEFXhq50lajAEpNfOhmb3w8yzgk0bIq1IcHKNbDzaGBZsrN8GQ0J2jXxvzsVWV6EqmeXVGS0U0FljRkSOdKquvQVJaZ3OPPvgXFeWKIPKDkOdWsDvFZ+NNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HaIdc1OD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512be9194b7so3919957e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 21:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709010857; x=1709615657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+BQPLCLZpqrKhiNrmiNzr4nlNlMBixVqIVv6pIcROQ=;
        b=HaIdc1ODNMxlOsrywwjh3RFkhQkvE3ZYafJeIPdrulpSwzeyUh9AsW00piKpLZwlAn
         URKPTxrOjN6tp3uNO/23dvbMa8rCNcPWCGKsLEUpR4u+hEhbOUACjMVMgfSSI2VdkKrp
         BeOJ58jSLmi9W5fgMeWm98PxiiN0y2MQmDwmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709010857; x=1709615657;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+BQPLCLZpqrKhiNrmiNzr4nlNlMBixVqIVv6pIcROQ=;
        b=NOMexVlj9Emsw8dC4gmtZh9TuV8yvDCsiFyCpGLwIhCAZ48wnMCdrZspLWZ4XUjVLg
         5fOKbRc8SuTu3Mxn1fGGNuPxh+k8lBPa11o05SGbVzfcIrnatNE1G1t1ZrY2xuLLiuOx
         0Nf7AjUk1NeGuOgBmQ0C3MBDurUfVvJ6KHpTTHrV5sYJUNsz+YjWnPtZVdkcVJaaq2/5
         3N/TrDvSTpxo6rsmWGbBy839o4R4xe4lfh0wcSN0d9k4EP05lu2bolmQTGNJ60XacK+R
         gYMmaMYZMo5MjZj8GjsvfiCoYUElNqSBcNNNSH3lGVnkTTIs3vdSuVQUjszIBQZUczcz
         CyTQ==
X-Gm-Message-State: AOJu0Yx0nIyRtSysakT9lXZXGLyOJC8h3ecREzi2ADEppPVpW6IxbrD9
	H8Qr6tvnm4Sl+zwIWDkOtrrrkdQRXMIVcd1HiJrAOe+CmIvTzynsTk+YDcd18Pj9TjjYg9dW7eL
	kg356bu8EGcWUuA+3/2PpiezE/GDLC/+YiHaW
X-Google-Smtp-Source: AGHT+IEyr7KXQAxsoRvnnHsDV6pqu0w4lJ40YXWqL0S1fUTZrVkMUjLcnZFHznlTZjulbsH6+afvAMnzVzmlCSDcWyk=
X-Received: by 2002:a05:6512:991:b0:512:ee1f:b5af with SMTP id
 w17-20020a056512099100b00512ee1fb5afmr4441994lft.41.1709010856400; Mon, 26
 Feb 2024 21:14:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Feb 2024 21:14:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
References: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 26 Feb 2024 21:14:15 -0800
Message-ID: <CAE-0n525gwp5kJGgw9Pnz+h2K6FbuqSG79KfMj_EnueZ-RYnuA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
To: Bjorn Andersson <andersson@kernel.org>, 
	Bjorn Andersson via B4 Relay <devnull+quic_bjorande.quicinc.com@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Bjorn Andersson via B4 Relay (2024-02-26 17:49:57)
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Commit 'e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable
> the domain")' aimed to make sure that a power-domain that is being
> enabled without any particular performance-state requested will at least
> turn the rail on, to avoid filling DeviceTree with otherwise unnecessary
> required-opps properties.
>
> But in the event that aggregation happens on a disabled power-domain, with
> an enabled peer without performance-state, both the local and peer
> corner are 0. The peer's enabled_corner is not considered, with the
> result that the underlying (shared) resource is disabled.
>
> One case where this can be observed is when the display stack keeps mmcx
> enabled (but without a particular performance-state vote) in order to
> access registers and sync_state happens in the rpmhpd driver. As mmcx_ao
> is flushed the state of the peer (mmcx) is not considered and mmcx_ao
> ends up turning off "mmcx.lvl" underneath mmcx. This has been observed
> several times, but has been painted over in DeviceTree by adding an
> explicit vote for the lowest non-disabled performance-state.
>
> Fixes: e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZdMwZa98L23mu3u6@hovoldconsulting.com/
> Cc:  <stable@vger.kernel.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

