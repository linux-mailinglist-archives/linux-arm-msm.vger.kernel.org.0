Return-Path: <linux-arm-msm+bounces-52353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F85A6DCAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 15:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23053AFD26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62B125F7BB;
	Mon, 24 Mar 2025 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GN+L7Yfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5382F5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742825758; cv=none; b=ImN/oH+e/FPvPm7k6gCmVmcW9iycBNZg6CXBOeTOmd2FSnVKxk0Nqe29HFYa//0zn/yX3piDKpQBaYPs+45tDulM8t2AA7hC0YYbIwZ1n80EQnqIbqiRv0MV7QMKkNhZUQh49nqaOEpYEC0HOV2iYcGIsQMVtZu2kTPl9GkQMu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742825758; c=relaxed/simple;
	bh=/YTUkjHZHGEAKDUjwWiEYmGKnaxSbNIbQRJt9OczQAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m33P6zuQ3cmzb3IDhhAdTW5srTavBqvSw2u8sHbbXVWSwEVhT2uynYRgPq+VOOVFt+lxuO8btyBoUFVdy/+C64DxSJjaGC5EzylJzyYQ9w6tCx6z7taRcpwtPBRXg0dgqg05SmPhVvqEMehI7LyOJQj/AY9dupGOpFIqV0CIi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GN+L7Yfj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6eb16dfa988so46572846d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742825756; x=1743430556; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/YTUkjHZHGEAKDUjwWiEYmGKnaxSbNIbQRJt9OczQAk=;
        b=GN+L7YfjxZe7gPnoaU/SnVIDd2ynb7r2hh94MPSlSNKXu8wOzbAc9hbHt7KSM7ccOT
         E60pAgTOcML0uvQ96KrXxI7a7pLHd9eHwZzs7h77Lg/m1rOQ3ag7cFMMSJa9CjT1ESOP
         Dbu7Y9uKV0WFaXur95wbrXE7s1LfVQIa/x2k0uepE4tBCwhQxHn0Ts/NfRQegKiFbs6l
         BT934IiYJ6WY8rcoYyexZCdpnMu/4hWls/gYWmlYTuTszmMzwOanogCpfTMdxoQyNyT0
         JDQvlpRhHOhXFYRd+wA4dHYOdLZzU5qUoIdYofuBHItAaYEMT6PULm9/gS3OzfgTNBCK
         Ilvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742825756; x=1743430556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YTUkjHZHGEAKDUjwWiEYmGKnaxSbNIbQRJt9OczQAk=;
        b=iqneHIwSa1pUA6YViV+2lPiurbWgOEWTmTfpVWENjPP/ArGPZj89Ge+dxv7/dig+I8
         zGmKzgPvWr4yDCajfpOFDZO/eL6ncnjcNN9hcVlmuHCw17R8ofdMy533LImZ3ldjQlGK
         izAOlBtslQbEmPGPrgr6AeIji5uLDhssIgxqEujT53nZbdw/5AlLQ+JXSMPFnALztekA
         +zaCxiEH4mcZqwkTyyX9JPLHt1CPpKbZcekdjuhTvaGfga4k3yu3Z47I9FHuREEcFfEo
         YwsmJrSkRZnkfc5RK4UG+TkKmUT7YF+Um9+Az82p4Ab+3ftebuCZFscqucuWxL43XpAW
         vZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCU4JLp/7IjwSGrzwTQ/Ha8iFf37XbX6xxqua/sv8hzsstNcUm/UCsiRCm6/rI+X8VD+L7OI/lJUnahg66Yb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Q5aQUji2Qu3z9Tt9AD8XAUuOal9VjGAqKkVZbL69P039sv7V
	S427dSBYsLTc6tYsW57+EHJRO+xErVr4zW0haHI0kJkZxymVL58gsSL4NjkJpgzauJzmFftmFK1
	kDfVex6Rv/wa20fF0+44rBt0sSQ52yg0KOD4Vvg==
X-Gm-Gg: ASbGncvPsqsglSUIWf4Yz+M2ma8/k6lMUV4ryxJdSl9lZoZMBKm62Boyd6Wyfalcsyi
	8IhyQIgbSuov8SCO86NJJ74ki6csHNPKmu5jCMW9DJOA9NLJ0ZSDPCIbQlkAvJIEP+5tSvrf4ln
	IL0+XY7n+dGbhPXVxKqGURDLzpJmswB6I6j0Ru
X-Google-Smtp-Source: AGHT+IET01HrGYkfdsNQwuLGnPKedTxLw+MZzq0YOj9OYp+aXXjQ99ek0X4dg6AMPBw2zvLeAvxl7AVAjVE/wKcQkdg=
X-Received: by 2002:a05:6214:21e8:b0:6e6:6ba9:9e84 with SMTP id
 6a1803df08f44-6eb3f2e89e9mr158682316d6.26.1742825755791; Mon, 24 Mar 2025
 07:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com> <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
In-Reply-To: <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Mon, 24 Mar 2025 15:15:45 +0100
X-Gm-Features: AQ5f1JpC0RoI-SQpmS4z7rQW8vsesIlMQfF1ceo6NxFQog8bjicko6I-EYu81x0
Message-ID: <CAEvtbuuyz_5xm1=juJFW5nOo+xL71TeuY-SV=YbTnAOsHW5yeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
To: bjorn.andersson@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Bjorn,

On Wed, 19 Mar 2025 at 04:23, Bjorn Andersson via B4 Relay
<devnull+bjorn.andersson.oss.qualcomm.com@kernel.org> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>
> The fingerprint sensor, hidden in the power button, is connected to one
> of the USB multiport ports; while the other port is unused.
>
> Describe the USB controller, the four phys and the repeater involved to
> make the fingerprint sensor operational.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Goodix Fingerprint USB Device fingerprint device shows up on my XPS 9345 now.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>

regards
Stefan Schmidt

