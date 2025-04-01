Return-Path: <linux-arm-msm+bounces-52956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F0A778A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C56A3AB2A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE401F03DE;
	Tue,  1 Apr 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wu+O/zuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C3131E2D;
	Tue,  1 Apr 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502630; cv=none; b=GQXkz2nwgxjTrUSTGzKESv9/3/hTIG5WRog+Acri8T+NcbM8Jo8Lh+WsZo/vBBzA1+q5WeBPOImZ+h4SXGcT9UgU/qKf3W3FM2HMV4396rZkEKyO1NdoJ/irq82yz19rpx3MB8aGyN4Chd5QEIVszy5thQkzW7sBt6ydZJ04/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502630; c=relaxed/simple;
	bh=Peb1o//GSWEmIuVpBNVjaGkIQrweoDtyw/f2xdyE+W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4D7+b1YuV+9WMJtDNk+TvIByIZIFHAX1CEH/3cW5C7norQoosqBss9UsMrqZgmCX2n7EWB6JonJTkBKnXLSKKttHjwXRRZhl216DefuoeWrk38k6Yl1OURq6V/c+lNYoFXd2akXnyRLxVT2pSJuCYcIKTaAjaLvnYN85gSQl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wu+O/zuL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3965c995151so2923960f8f.1;
        Tue, 01 Apr 2025 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743502627; x=1744107427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64rAQ2VCJf7txTVICWUW0ghWJrbf/f0/mZiOG+wN05g=;
        b=Wu+O/zuL7byXNfDV/P/fCGbL2aa/8Y8tJ63TmI0Dsb2AdpoQBIoHrwBE85ERxOi6Jc
         UiF6h9xZdZODGZ6Zj6ym7qnGCRD9iqoLkY35j9hnsgrM8G/WZmC0eBfFS6Xl8okgiFEe
         puyHlrOYMC/fcbZEoClDnfTw/podaUQzlHXHWZmMyPCnfZEKIde+0CL2sOAum6RSi7Q0
         AvgKu1fQLTTTQr4/0KYpw8fjVeXwBLo/lb/ZJv9tuwDbYtJiWccwwlir+ZjHImBPE7kR
         YHGRZKkCXIYRfEYrgzWV0rEQZJNhCPnsHVwiNJOlrGrcTXPsnUoQ9SH0NHw4w6ZODnCu
         2J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502627; x=1744107427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64rAQ2VCJf7txTVICWUW0ghWJrbf/f0/mZiOG+wN05g=;
        b=DTbuGZFH4eZH0jkOy3oywL6kh1IK/NSQ7BlEnrZRaRTqGnmQVxS3CT3B+uIQmR0PRh
         tNbgOUl4feyua+UUIhplycPD0h6nJ6hCNvP9ABVm/Ih73QkR78JtPjkrD/pKWBIcJYFF
         Hz3iBQ7MH9IkYxOy3lHRLvvjGBa1HV8ZXQhTGc/bUAnP3nVXscmi19aE7cBYAQFsu3RR
         5ds5/eJDif/mWuXyZg5kEwrs6nUuKSFAHi+bS5jtuCZpbyh0HpKHjIgOUCzp0mu/JV6E
         SRxh/dkp3FmH9gTxJz3h3DAzEi97SEYAgp7H/MzCZQCHPIPbPquqIuRUqibZUFrLDn/i
         6RNw==
X-Forwarded-Encrypted: i=1; AJvYcCU334xoZEGbscJYqrCEcXrlInA4EGGZPw5imSloTJ0m9WNijqwRJU8O7nK1gSiKB4qmov2dLw9IHmMLyBTv@vger.kernel.org, AJvYcCUgzAAC6UgcQ3HHzBReHxJuVd/KVps8Qa9orMvx1+vx9vLIpC7wDZ5hUrYtBFrkc+txc6VyIevdVVQ8@vger.kernel.org, AJvYcCWDboRW6S5uqo36HTN+tY3/lD0oy/VWx2YTqLd6Aba2nilosbthf7KRdiBTLwAggB5/UBUx04VrI2iz@vger.kernel.org, AJvYcCWpqpBAJdaO2g7jlocZ6HJddCXKTVZbz+eI6Ntcozfb9vEI5IeXkyKmzQWftYEA24u94DmMAsyWCPJo1KiHKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VtlwIFI0V8fW/jAL1CQ9dEGy7zxu60F0YHuV3trPfDTxopOq
	s/SEaKecqTl46agJGQvyXHmbSpg6moji6DmOUh8vSApQH4S3fecI+BBtzxWefekh67+F/SX7T9l
	v94wRNDkX7sDmoALPPAC3E2ErlQ==
X-Gm-Gg: ASbGncupmc9XVXNw6u69w0PBklc38c4zbVDPM1yLLxiRSXcQy9U+1NngNA0tj5lZeL2
	4Za8Z+uszgTOh+z7h72QA34Dq+FVeb5QyBIjby1Io0aHLq5ZJthrT27sgfcLo3T72GvmuJ/oVQ+
	PeZp8nGKJZEYiYOADhmial9eD0YQ==
X-Google-Smtp-Source: AGHT+IHFY3NKdTJ9L3ZcnHHkf8BNknq+DA4HNmpIkvt/+N60rm+ITtpzpjaK7YuegUYY84tr1PeBYtChhoZ/dQrZWeI=
X-Received: by 2002:a05:6000:2701:b0:39c:1258:7e1a with SMTP id
 ffacd0b85a97d-39c12587e45mr5888229f8f.59.1743502626613; Tue, 01 Apr 2025
 03:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-5-alex.vinarskis@gmail.com> <fb1fc0aa-4921-4ee3-9b8a-6167ef6558eb@linaro.org>
In-Reply-To: <fb1fc0aa-4921-4ee3-9b8a-6167ef6558eb@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 1 Apr 2025 12:16:55 +0200
X-Gm-Features: AQ5f1JpMVjeGXlb_NjTeg0k-K6EplgmtwfAq6ppihs2rHcJBRu-dh162qJB6gNQ
Message-ID: <CAMcHhXoxLx9SiUcntp1vmmK7BF0SO_uo3DCBx_3Ldd3tx+rBXg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] dt-bindings: arm: qcom: Add Asus Zenbook A14
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 07:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/03/2025 23:53, Aleksandrs Vinarskis wrote:
> > Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 08c329b1e919..1b7e2ed56baa 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1133,6 +1133,7 @@ properties:
> >        - items:
> >            - enum:
> >                - asus,vivobook-s15
> > +              - asus,x1e80100-zenbook-a14
>
> asus,zenbook-a14-x1e80100
>
> asus did not make a component of x1e80100 soc.

I see, I misunderstood the meaning of qcom,x1e80100-crd, clear now.
In that case, perhaps follow pattern of other devices, describe by
model differences (eg. -oled) instead of soc? eg:

`asus,zenbook-a14-ux3407ra` (for x1e variant)
`asus,zenbook-a14-ux3407qa` (for x1/x1p variants)

Thanks for the review,
Alex

>
> >                - dell,xps13-9345
> >                - hp,omnibook-x14
> >                - lenovo,yoga-slim7x
> > @@ -1144,6 +1145,7 @@ properties:
> >
> >        - items:
> >            - enum:
> > +              - asus,x1p42100-zenbook-a14
>
> Same here.
>
>
> Best regards,
> Krzysztof

