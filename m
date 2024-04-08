Return-Path: <linux-arm-msm+bounces-16761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE589B81D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44191F2242D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 07:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFA522EEB;
	Mon,  8 Apr 2024 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="J50GxfF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED422089
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559888; cv=none; b=tdv/BNmINeRx9QTCQ3IeuadJz0Kyfm7DqrTpSRCqmODlLWEQ8MnXIh2c88SE+siAaQFYQA9NH/ckdalNWUL6vdXtlkmBlu2T4U6+m5ArlbL80f36xU23EzISFQBQzL/1HLXVucD99u8wiV9/c6onRoL8kOaLYG1Ud4aF2REjxXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559888; c=relaxed/simple;
	bh=qkfqvOO08va6PQWOGkwX14NtaLVp+I/evtOE0bnNHfY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tVPRupS8klxxKSad9ri2liolwF0q/gARjnT2UDc9OBeNxGMvZfh2eGdjKO+kUfoZbQwgZp5OXBx6K/BuqiOvI0ryt9+7FjY3YUx7rEkSGaoTTRjcviLRHS50mppeeJ8UYIk3B5J/vsOLIkOXJetCYPb9bfjj/S6XqCchHiYlBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=J50GxfF2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a51beae2f13so149641266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 00:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712559885; x=1713164685; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6kbbzEE9ifb0PFC77Z0iVjHxfy8PB2EdNCSvKF/KVE=;
        b=J50GxfF2vO1zMx/oraN7fJFSXjTYq4qnQtZ95iDS3SF04atcWJxg2FfMOcKMbJlh35
         qF2YcnCI69avwAkFT8H9Fv9bimdRK4uEMQ/pYGQylb1LSmiroOhDPFL0MvNKEx9IbVOZ
         GjO0GbnBZD+kmO1HssqoaZK+p+Qq8SHH8Kl9Hbo0piFX/6Nt/8vRoDF+mT/aNOXjrv8M
         K7DT7MGg14F5TYyiP4WTw8AReZL0F4x4nJ0IxLmJKPPxtCOJGVyan4s0j0acAcgpZlck
         T8a5Mcxl9R+fg7fyhi6U/LkqZS2hdZ7dFGExXNN2lu1flCkc7M69pakkgtEN3WMtdu0s
         MRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559885; x=1713164685;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6kbbzEE9ifb0PFC77Z0iVjHxfy8PB2EdNCSvKF/KVE=;
        b=uNthB2lVpSaUwVEFjxl9n+tImZ3BfPsW/q3ty6Qi7qiE3FKCDn/LHTXnBabngv7XQw
         pLCoqezxoSVBALkBI8b0MJN8MsTAap8G6vTlXvabmFCds1mfnkbopJSmmfOkPBJ80y0Q
         eORPeVEAG7abnzU0hYWdWjk9snUw4apF2FWdfNAnQcruQxBXlKkBlFaLC84s177bLWmE
         oKoJfucTRLePuI3qg2XolPrBAEJAIGKJ3jyRUB7BzSfGNpMYvEI0+jV2l6W5+tWMJ/gb
         va6KcC0G1m6G3WtdAkXgEbD75CyYuiXiBZYwPPKCYqOb/KCyr+Xh+lnu5V8bQLzXce9o
         Qc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVhCrYIh0sa3K1TClI9c1ZXaC/DLQzyboxmnCp1Pqx/p9fmoTNFUN+TIaOknxwqvhPftEUGLgFOZr/XIYAo30gAG7QedQd6/Dd9Eq6rqA==
X-Gm-Message-State: AOJu0YyS+mszyNy1gSSWCn4s9lf2kdPatLkEEhDFf4QDmlDSUzrrWy7P
	Xan34IEKRt2xhj3Jpu0rQ9ZUcFE3eYot5gUCk7ZIZs3+aOs1Q0EEWXHvkJjguoY=
X-Google-Smtp-Source: AGHT+IGlewEWjb1k1AU36Ae1mKc24vGUfV8XHZwvIXSu0xUtybj0bUjGObumQNvcME8j9gZl0aq8JA==
X-Received: by 2002:a17:907:86aa:b0:a51:cf7e:fbf6 with SMTP id qa42-20020a17090786aa00b00a51cf7efbf6mr2256615ejc.34.1712559885494;
        Mon, 08 Apr 2024 00:04:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id d23-20020a170906041700b00a51a20e8bfasm4118691eja.18.2024.04.08.00.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Apr 2024 09:04:44 +0200
Message-Id: <D0EJTA1YFZRW.3LWBWJC0QYQ62@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: add USB-C orientation GPIOs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
 <D0EJR77G6HF0.2LUJ3XY1YFG65@fairphone.com>
 <CAA8EJpqUz8anQ9V_Ht67DMrMXw49u9R01mHKDMxnGf-UpXrrUw@mail.gmail.com>
In-Reply-To: <CAA8EJpqUz8anQ9V_Ht67DMrMXw49u9R01mHKDMxnGf-UpXrrUw@mail.gmail.com>

On Mon Apr 8, 2024 at 9:03 AM CEST, Dmitry Baryshkov wrote:
> On Mon, 8 Apr 2024 at 10:02, Luca Weiss <luca.weiss@fairphone.com> wrote:
> >
> > On Mon Apr 8, 2024 at 4:33 AM CEST, Dmitry Baryshkov wrote:
> > > Populate orientation GPIOs for some of the PMIC-GLINK-based devices.
> > > This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP CRD
> > > without the orientation GPIOs declared.
> >
> > Hi Dmitry,
> >
> > How would I find this GPIO on the schematics, or downstream devicetree?
> > I scanned over some relevant areas but nothing jumped out at me except
> > for the USB_PHY_PS signal coming from PM7250B CC_OUT and going into
> > GPIO_140 of the QCM6490 - but I'm guessing this is something else?
>
> It is exactly that GPIO.

Great, thanks! The PM7250B datasheet and my limited USB-C knowledge
didn't help me there much ;)

I'll send a patch to add it.

Regards
Luca

>
> >
> > Regards
> > Luca
> >
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Dmitry Baryshkov (4):
> > >       arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
> > >       arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
> > >       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orie=
ntation GPIOs
> > >       arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation=
 GPIOs
> > >
> > >  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 2 ++
> > >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
> > >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 1 +
> > >  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    | 1 +
> > >  4 files changed, 6 insertions(+)
> > > ---
> > > base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> > > change-id: 20240408-hdk-orientation-gpios-141bc7fd247d
> > >
> > > Best regards,
> >


