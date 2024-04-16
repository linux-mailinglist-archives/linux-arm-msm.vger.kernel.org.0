Return-Path: <linux-arm-msm+bounces-17586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D5F8A6B47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11AF6281644
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729E212BF1F;
	Tue, 16 Apr 2024 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEEv3x+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6912A17F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271159; cv=none; b=kl04c3PrBHLWMjUrKSdiHk3Xa07n4q5TJ2ROz8VIYEvdm0Q2i43Y6IA2qN/Jr8Dy2B5TzlTX9pzCFLfUfZZ1SuTCwdCPjLs+39uQAxg5iVwLoySpE80OA3nDg+yn/wp0gzE6CAP35F+z68P1Tb1mWeVa+tFe3+ztsW3jLBZi9Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271159; c=relaxed/simple;
	bh=INkgGkw3lfof6ttOSzX5lzwufaDoB7uPeJ1nhpgVeBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAI9hqmOEW2Ugl1S1Yr9HgwrFSrnagsT7bcx+c2mB3UDR+IXlkTckXxeDaZ4W4PJYFUgWJx7Ky9mY06p69Ux3eWejjwHZuRLBvFs/C+IxhjJ+CuMedZ6AXVBtg4zvFXl64F1u+LVynMYvoXE+TF9Si9SqWIa+My9QDRxSubXl6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEEv3x+l; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc71031680so4306596276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271156; x=1713875956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L5+AVlKX0UKLNpDnTXG4nLDmpjGwbimLrrB82xXakLA=;
        b=OEEv3x+lS4XGYlyWSp1K2umbJiSxK1HR5BAJqWRb7JWbFXnppyecl/uUENSFWXMFbq
         qLXMKHxWIhle0EEqFiC+cQCOR/X9NRJq8ly1QR11M34bmL2MyXLLDpkIHlQv+qdPQVAn
         F+tt/AVs/OsgJTdbkBGI865zapaZjRQkignR+Xql8iIhYqY5+d+yrpV2HKQIYE39r1ra
         kvTgR+QdZOZAAf+D2Ez8dvPKGXSV3NrqiPPOT8PXchYEWEF+deYJJNl6iov52XIVjTee
         GEghGjHAztoO8k1qhjzk5BJhxH1knZry+GUDSAqPGRS7f1bY3vVt7Wsyj1hFgp7O61CS
         xAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271156; x=1713875956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5+AVlKX0UKLNpDnTXG4nLDmpjGwbimLrrB82xXakLA=;
        b=mG13qv5jc7AYD3kzw1y5XLlSmzqK14MX1c9/EILC26LE/DPzMkeZZqt90rQlFc7OYO
         UKKaTb8fq6eaovjIhqt6n0a7OtzvGDpim/F1End1iT8gKy03txwocqDlLC+tgF5NPpA4
         zLqvpTkpJnmWD337YPgq0WrNouIfTS/URkJayaKivB5EwwsKyZ/OlKYTO4t5dr8v2j7G
         0jEny1i0N6yOo+YckdgTuicUrA5wblRkvaWImgflfw2zKQ/a0gAI/yN6qdceXSgozWrz
         HozwPbVW5ehNCkG3jmTBwF6iWK0xtR3PeoAqwTqkdiA3PA1yFuUPcwbS3kPO+bciExsc
         uUqA==
X-Forwarded-Encrypted: i=1; AJvYcCWPjYm2+/a4L//zUj7V3FGC2FTVaDSKWajTNSOWZ+N1SAcjlbGCGXnYc8YgIqOn7E9+SOCCZk8Vr9GTi0ychIZudO2v9GY1otR/PGmIJg==
X-Gm-Message-State: AOJu0YxB4tmdnYFvWGfNYn1FceKls2Hq0jPF3f4zv9A3sxBKKS3tLPO7
	IL+tw1lhslRnkQMhGiC/a6RRQW6G762XV9S5spZAypeMM1I+OYBW+bRZH7xUL9GzGks7Q0/OXfS
	lxshT6V1yvsavYRqvMDje5esL6AlC9V/39gFkTw==
X-Google-Smtp-Source: AGHT+IEwQ0Ngh3qKjVVX87FYrtRCF4iosRKAkJdiG4FLgPF1wzvvHbh6c2T/y9yAEHN+DSCC8BOhOKXji/M+uyanmTc=
X-Received: by 2002:a25:dc92:0:b0:dc2:2041:fc49 with SMTP id
 y140-20020a25dc92000000b00dc22041fc49mr12430917ybe.5.1713271156421; Tue, 16
 Apr 2024 05:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
 <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
In-Reply-To: <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:39:05 +0300
Message-ID: <CAA8EJpp9Td4ttqQN-hU72bEcRxMk0Wug92cTjvOKxfCaJb0Smw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] input: pm8xxx-vibrator: add new SPMI vibrator support
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 05:44, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 52 +++++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

