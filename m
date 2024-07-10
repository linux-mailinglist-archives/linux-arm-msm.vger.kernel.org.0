Return-Path: <linux-arm-msm+bounces-25885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69592D8EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB24428162C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD6C195F0D;
	Wed, 10 Jul 2024 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fD9PD2Ja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5B194C64
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639042; cv=none; b=P1lHqts5yiSLDR2xFUlrlSKbn8yaKZ8Te1tT9J/7z0U0wNL7mI5vH6r+d8j9P1aGCMkiR2W0O9nTs5Reeei44Na3FoRhPPAkQWgcBUC0un5dsyFOMfXdll4bxvB1zWhjEjbLn1EZLG1rsgbIgVlwirs+e6nsFwTdERwEI2iBSZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639042; c=relaxed/simple;
	bh=eble5/KJqCeozSW1njrXYIJ6tIyz2Xy8oZVn7c8VBIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exk8j9vAL01fmQlVVkwKjs+kdvqYXwwnrRSUL9zY5vII4QW+DOEZm8KyhYw5SXJNEiRSW94i/9oZx0l9moOYeXPKIfckd3p/Xh0r2kGwF7xFXW3ev6AxVzPSOfaOvzAsTGQ3sa/kmK+2GbgAvBGBujrQqZedPAgDbs+b+Gx9dlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fD9PD2Ja; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25e0d750b73so82051fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720639037; x=1721243837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eble5/KJqCeozSW1njrXYIJ6tIyz2Xy8oZVn7c8VBIg=;
        b=fD9PD2JaIM6FYNLVhhjB//01dxL4UwsVm2tUonasYVU6YiWphXCpionRqjfB8lgmu5
         AOLzuCGEWeTSmzdQy7piX8IfWlTPUEeKAf/ROgi7ky/vZnUDreflHRPYPIKwdiKsr9ni
         PS2ezvoFzm3RFREzQWo2VnT5pdCn7kHqbjang=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720639037; x=1721243837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eble5/KJqCeozSW1njrXYIJ6tIyz2Xy8oZVn7c8VBIg=;
        b=ldM4PyBR/H6yNEhnIkPBRrfPQOamlouJdH1P2NM3/NUnB/TQ68LgctRccibuHPG9Qy
         ggohG/9iG/tJi7tyy+1FHg5XSoLlc/tcSLLtLVp1epXMS57dxmzEcOtJMkpipi4tGyDz
         nxLMO52gOmadkAgvhCvRyZ34cqXvIVusE0vbmxVAgYc6zYOH3sufIWx5w5m0lYWpdhim
         Wb9KjFZ/5j5Uy6rXg+cUGNDjBb1ndB8fni06d6nhbLOXAmtfQdgyBFq/VhyujCYi+92J
         blpRx3k8hHXSiJ5KCNlwSRmdIB92aWI4HS6CXshgJtIvlEHPkT8uuMTq2e1S/vVQu8vP
         gIbg==
X-Forwarded-Encrypted: i=1; AJvYcCX09VFZGzdszFvJ5xYNcdYwpUkByIAdHWW1LwvRP7j5rSb0GJxELDxl5K40Rlh2P/Q27G74AE7LsdPhaO9sX+sPTNLSK5n5i4HPtW/kMA==
X-Gm-Message-State: AOJu0YxckcBzJ70Y7Hz3W3Jhfj7ds4HB3KobnTJS90VeBd2uhza6hi6T
	kqasujK4IJgxyye8sWE5qZP2rNeaUqeZCR+L0qZyDWWunKAVArNvsrlKMX2FGNshhbW605TdVDO
	fbw==
X-Google-Smtp-Source: AGHT+IGdGd/WTrMcv5JpIHg6w0NsQNVOP6KMhsLUqjDK6Co7O12vRGJT02F/4TE/oofOIiDe8WqAuQ==
X-Received: by 2002:a05:6870:d88f:b0:25d:fb57:db43 with SMTP id 586e51a60fabf-25eae764543mr5254754fac.12.1720639037657;
        Wed, 10 Jul 2024 12:17:17 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f19028226sm220311285a.56.2024.07.10.12.17.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 12:17:14 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44664ad946eso43281cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 12:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRxKtLnBo0KnNwnUikymus3Z4XQb0bfvdi9c8eIplm7uLqq739DL7TKHPcR4ImAZSpTDO00qgKmHz3Ky0G/5yFEb3FI3tGHmZSSujGXA==
X-Received: by 2002:a05:622a:4cd:b0:447:e8bd:2fbe with SMTP id
 d75a77b69052e-44d0d631091mr605041cf.1.1720639034173; Wed, 10 Jul 2024
 12:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
 <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com> <Zo7a6qso7RZ2pkmb@linaro.org>
In-Reply-To: <Zo7a6qso7RZ2pkmb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:16:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
Message-ID: <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 12:03=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> > 2. In theory you could make your compatible look like this:
> >
> > compatible =3D "samsung,atna45af01", "samsung,atna33xc20"
> >
> > ...which would say "I have a 45af01 but if the OS doesn't have
> > anything special to do that it would be fine to use the 33xc20
> > driver". That would allow device trees to work without the kernel
> > changes and would allow you to land the DT changes in parallel with
> > the driver changes and things would keep working.
> >
> > ...and, in fact, that would mean you _didn't_ need to add the new
> > compatible string to the driver, which is nice.
> >
>
> Yeah, I considered this. I mentioned the reason why I decided against
> this in patch 2:
>
> > While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallbac=
k
> > compatible, the original submission of the compatible in commit
> > 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timin=
gs
> > and resolution hardcoded. These would not work for ATNA45AF01.
>
> Basically, it works with the current driver. But if you would run the
> kernel at the state of the original submission then it would behave
> incorrectly. This is why I considered the resolution and timings to be
> part of the "samsung,atna33xc20" "ABI". The new panel would not be
> compatible with that.

Ah, oops. My eyes totally glazed over the description since the patch
was so simple. :-P Sorry about that.

IMO I'd still prefer using the fallback compatible, but happy to hear
other opinions. In the original commit things were pretty broken still
(sorta like how it's broken for you using "edp-panel") and the
resolution hasn't been hardcoded for a long while...

