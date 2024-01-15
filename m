Return-Path: <linux-arm-msm+bounces-7252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E578482D64B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 10:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2CF91C215F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08E0DF41;
	Mon, 15 Jan 2024 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKHyU+6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC04E54E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e811c5c1adso72732027b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705312047; x=1705916847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFasKVeIFS8eA29J5OC5S7BAGeeHVHQITZOFxwu8rvQ=;
        b=IKHyU+6u+lgjRbyCoCSwwGSrug6+245U2HLPFxjhv8yEBt6FyeKVAYrLG3CNHFzZzf
         Dk2FCGpsEHJ9T04siwv7YL2h1aIpSxBMVCSwxe3FPWvHPhSuSryMMe+1bXZO25NNMRiG
         vSBV0i8c/+hl2sfi+a3Q7AOrvZl/aXuFkZYt5lSiVyfCeZDx6Ebq3mCNIBq/Fofzhr1V
         irsU2QPRNqtsUf1968TcqB9towdQH6O13+vCSV8zmtiZrUaKul4ZFRLGYeG7z4wlAv73
         XMxN5AWHIcWlf07NY6l2DN4RogFuoJi0YH947NDr+LaVdwbp78RB883umf8rV3ONJIAW
         x8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705312047; x=1705916847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFasKVeIFS8eA29J5OC5S7BAGeeHVHQITZOFxwu8rvQ=;
        b=EIiwOE9TocF/q3kF/d09Qg5EjMD6pcnnZNyFtOPQBKKsS4/vkzf/Qr3rcwybJfrapP
         2j9ukyDIh/p9KqCZYZBDHQNP9/koObAyVkukWvfbBzQt95bZh+Svvi1Oz4eZ8ec8hxXf
         cZ2KSuN+2NwCEP/l/yqSq2CGN4CewHeyqaeyli6ioldrbJXQGRdqDpgdfc5hrotBp/7R
         TSMioW3zWnIGWZmNc9LHBJF0o/xORhACZ1rbuv86j+x4RJF7COiU6dg42SL4Bh4wialY
         bHbNgqXNAXzBD3hn7U21RR/vrkFDNq9cx76RE3xbF/Z4ShbKv+3PXd90hU4n+di2gBah
         EG6w==
X-Gm-Message-State: AOJu0Yyg31+E5OU0SKwt8JnmEJeWCIBAwNeKmojwD4wiFmwWZNKVQJxY
	OLSruWnOPmKm5aDSj85QG+KUMwJ3WoiOeXbwg437j6+0lTgJ1A==
X-Google-Smtp-Source: AGHT+IGDxeO4T8bagcuUSUZ0vMjmvo/iXyCvviU6IkM5zpYZ/eSn970UnrLfZAjyWjqwQ+WhSzN85TavpbmAnoNw87w=
X-Received: by 2002:a81:d003:0:b0:5ee:1ca0:b7ef with SMTP id
 v3-20020a81d003000000b005ee1ca0b7efmr3089640ywi.42.1705312047014; Mon, 15 Jan
 2024 01:47:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-4-182d9aa0a5b3@linaro.org> <2c291056-e4c6-4c8d-a8c1-37cfd5341652@linaro.org>
In-Reply-To: <2c291056-e4c6-4c8d-a8c1-37cfd5341652@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jan 2024 11:47:16 +0200
Message-ID: <CAA8EJpquRv20NhQ2CUZaAju-=E4cFUsXS3i9fKAPHnwkd8Yf_g@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support USB-C data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 11:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/01/2024 21:55, Dmitry Baryshkov wrote:
> > Extend the Qualcomm USB-C QMP PHY schema with the USB-C related entry
> > points: orientation-switch property and USB-C connection graph.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hm, this feels unusual - is really the phy handling it? Not "Qualcomm
> PMIC based USB Type-C block"?

Yes. The PHY handles orientation by switching the SS lanes accordingly
to the way the cable has been plugged in.

-- 
With best wishes
Dmitry

