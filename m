Return-Path: <linux-arm-msm+bounces-16149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56910895C5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 21:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D862861A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 19:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8115B575;
	Tue,  2 Apr 2024 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBcq5SXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229615B573
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712085732; cv=none; b=AwJQbz5iA0LzwOaGHqsFG29BTr2g9dfSt7srNCtTP1R4Y7TaFBUP0gKUCZteELDa2h5CwYqWcRjUq9IAda8YPOjwZam7bCrtIjC0O0jXaY/IqDjiqwP9nL2IlQeb5MkBhwtFVXYPsf8wO0gHbkoEQib1/5ZSlYc2hJncFsSXOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712085732; c=relaxed/simple;
	bh=6VDPc8dC1JcqYo92ZRzDEKLFmlwwzK5oDT6XJCq6Wmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpqBuM+wBKIDpT4yzZoxNaKflQXt+0txTBzj5Q6kefzkSmwh4ddd+FhS4eLDGOMoJDBbPxFTMkPZsZ5bnIlxaRv5dpTy8w8L0HOp7CzliSzLAR3QGWU9LqJvJAb/lbzWEr8cS2c665LnRESeJLkHFIX7MvLpdEb+Re8+mpJsXn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBcq5SXJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso5051886276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712085730; x=1712690530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Da5e3no1vFHzxLLTd7RoCIPu3XSpzvc3CS46CEGoz3A=;
        b=HBcq5SXJLrViHgjstgpubax9Dlp2IzKa8hCEpBI8pthNcyHTYnoz37yxw7mkYlmN08
         EaEzpXIhWTw/z5r9z4xMlg+axmY2l2PDoLeUscCAjbwZedS4fo6DNjuhy0kk5c6NAY0Y
         fxSSkftECQTpxamrvr5AIqXm+LncfWFDK58lw7BlftAdPzZVQb+1TC671iardq0sv/k3
         4uulcRkTyO2ZDLpaymZ/6RXtECjXkB1EP+nL2oMMI9XmOAnN7xM+NF++q4tI1+RUay3r
         FeT/0koZgvFfnjcN4BEbU0oGusrt8OjWwmTZuCQDp9cTM/gpDb5ZTDl5R7XU0CiDaysu
         GRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712085730; x=1712690530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da5e3no1vFHzxLLTd7RoCIPu3XSpzvc3CS46CEGoz3A=;
        b=um2PZtmwUEQfG5u2YAazgeGxZ9FEVVhYRvbbMl1MVBgYGD0WVzVV+H2us21xGeoXDZ
         GWNgU6Zlz3C9mo0Zyvik5LfyUnPhguHDHYJyVd0xMQR0aKFq1vckuQUanYxUrgcq9zl1
         bs7KpmljVKu6YT04aArxjC3hZzLgZzB7jx7C/kMQoy86gxvdI0Sv6hiu7EUP4lwLAePK
         +QAQ8tMdIEyyrwaVMVzN70mpx3CWg/vPKq8/zY08ukw1VnykR2EgNawLuyLC7CUqolrE
         ByWM6nx8gd2VtI4k1dXLdSYkk9Zpa5Z3ZTsCGRzVsxKDWmE4RXIBdc8uPzJhPt0cBkmt
         PQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcXhgSkRI/8mY5q/KuxGjd3+WOO5sS5O6zKveqO7/f8BVJwH4O+98gMzWRO/fWvFU9dQdzKH8LHZZO39FeDTTGRPpdy0hgAsquhRkw7Q==
X-Gm-Message-State: AOJu0YwJR05muhD7kHEJr2e73z23/CWAh8MEqy+brNvKAvf4WkETVKN4
	2m9f03z4vbMp0xJ1Tm1hZ+qYmv2h24pNP/1KiaQz6n7+IzyGGRn//o6AouTjarks2+WSKYwb01J
	HqjjZ16uggqAX1Hh24zXlpxVHPM3SmLEH3IOUfheIOtMeKPbmEqI=
X-Google-Smtp-Source: AGHT+IETpb/msZOjlDLCi3odXTnuMId4zqwOakzl+yNSURunQT2Cet2X6wMJNMEfQKszq4oZvWNg6VfgMvBffwUGHoU=
X-Received: by 2002:a25:a028:0:b0:dbf:ec4:311f with SMTP id
 x37-20020a25a028000000b00dbf0ec4311fmr11410085ybh.58.1712085729697; Tue, 02
 Apr 2024 12:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com> <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
In-Reply-To: <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 22:21:58 +0300
Message-ID: <CAA8EJpqarGD-8PpUOdOXzNXW2+HnEUF-1k7VC=TLTPJc3qqsGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 21:25, Alexey Minnekhanov
<alexeymin@postmarketos.org> wrote:
>
>
>
> On 02.04.2024 18:55, Dmitry Baryshkov wrote:
> > I'd say, we should take a step back and actually verify how this was
> > handled in the vendor kernel.
>
>
> AFAIK there is no such thing in vendor kernel driver for this, as
> this startup procedure is likely handled entirely in userspace in
> cnss_daemon.
>
> By the way this workaround is needed also for Wi-Fi in sdm630/660,
> so no not only msm8998 suffers from this.

Interesting. I have an sdm660 platform. I think I should be able to
check these workarounds then.

>
>  > This sounds more like a firmware feature, not a hardware feature
>
>  > having this property in DT does not look right
>
> I agree with these 2 points above. This can be handled more nicely
> as firmware feature encoded in firmware-5.bin using ath10k-fwencoder
> and not involve any new DT compatibles or properties.

I think Marc has already tried this. The firmware-N.bin, so-called
"boot firmware" (because for normal devices it also contains the
actual firmware), is loaded much later. See
https://lore.kernel.org/ath10k/243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr/

Probably we have an option of loading the firmware earlier, so that at
this stage we already know the quirks set in the firmware-5.bin. But
note, I haven't checked if at this point the driver has all the
information to select correct firmware blob.

-- 
With best wishes
Dmitry

