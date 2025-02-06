Return-Path: <linux-arm-msm+bounces-47056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7DA2B384
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 21:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20313A1660
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4712C1A4F12;
	Thu,  6 Feb 2025 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VpdvU9Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA51D8DFE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874626; cv=none; b=e6FMDVxH+s1N0nnkhle9qMWKE4EWcxathq8NvoZ8ztsJmzTebLQhtexTHCRSt6NfNzCFfiJamSyiVTEzpy5axttz1UYBf/ynf5rBtIoYqDlDRpb0LviKhNnTbh6qlyp5xwuJd7Wi3J5r2JEVfMKiepqQhPB0Xh7+L0rstwdE7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874626; c=relaxed/simple;
	bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmdC60EU/b7i8rvTEcPkcukYGIiuA8zQr10rH9bDpnrqqYq1B1CDUqdwR+nI40qkEKDnHx+BIvzsi5b9UcfSC5T6tkyqvneC49Tzl8Ybs+GXV8oraC6Mh2v+ZVZkXUL0Caw73JM77dOf6J23zTZrqDXgDpyqSVUyBLcDi7u0t30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VpdvU9Qi; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6e8814842so148709385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738874623; x=1739479423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=VpdvU9Qi4JF1wHvut91sAo2uH9unLgmKOBEfJRN8Kk4VvYj+U6zot43hjvvgfT1tJW
         9CQ87LtUodSUD25bSJOLppkguLXy85C6GEo84/grB4ZOdi3BOb9jN5Sxf9JAlOJsbhy1
         EPxam1tWwLJ2VvbT4EIQmcTXugM4yabxL6G+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874623; x=1739479423;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=IpUpWrRPDpPDg+q3G5kv04w6mPvofOrw1jjlGLmMc+vnsDCwujb9hTZ4mUAF9y6PUW
         nGkmQyqciUdRH0NCuTFsdHc2YGCh8wam+kDhcVaL+lCZ8yVD5ehRQF7OmMqvJb/nyEw6
         aQil5ewv3DbSdk70iTs9I3PySLEiUJjacUgbaozNeqotXvK6AEv98Tp0dvQsHOmOvPoX
         g0DTon3qESVeH9TKxvSrBAyFfeQYTNO/IiGUNaBJRESb8BX4Rr6mej7ae7GA2hUOC4CT
         f76PwQLFIuYgXXbj+lDeaQs7bSsIKC0QkAqr8fwnOF2J+NQ04ClbM7M1hSFh93ektiHF
         UU+g==
X-Forwarded-Encrypted: i=1; AJvYcCU0dX4YmquRkOvr9baQsEkqG01CcTGBNbnQ++VU5IWLVJInvlHpgPQncma/5Y8zjAyfHVASSP6f/3oSmi8E@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdfRyCjClI7ffzK0+hn8iOkm3STqmeMQQZbQslk5EegUuaBZQ
	rdKBV+7CpSsNua9wpGM4Bn9wkKG03C5pFi2rjBUkwdjLUk5Qe3kSTPPOKsinXhKl8T+qVppBrBs
	f6DRgsxV7YAyF5K6EiVf0Hhfel1BKxKUNNKWt
X-Gm-Gg: ASbGncs7rZCr/qxh2R4moNo0tmDHfheTvTl7oJq7j9ZJ8iX+lFk6lJorNlTCinIwac1
	PfFCmdZaYhNAnjZS4KRSniLA7OKP9KOxhmBfTC45m7ZG0cYPHvk6wWbVzkLuTMKRbemXFlrvam7
	G0VdYO5lMhNmdKkKU5qnKeVBqL
X-Google-Smtp-Source: AGHT+IGIi7KHGakyYrhAS6Nm6sSDzZzym1yivy6eswLvWosFcy/m0lzamEPvxM2Mp6Z9Nh8JG+b4sn+mv4BnqJ62Jhc=
X-Received: by 2002:a05:620a:f15:b0:7b6:dc74:829f with SMTP id
 af79cd13be357-7c047ba4996mr111088585a.7.1738874623312; Thu, 06 Feb 2025
 12:43:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 6 Feb 2025 12:43:42 -0800
X-Gm-Features: AWEUYZk9G69zlKfea1G0cVv2Pso0fG2dCEq5z01lgx0Eou9Uj4laycjO7Oq51wY
Message-ID: <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-06 03:30:50)
> On 6.02.2025 12:30 AM, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > new file mode 100644
> > index 000000000000..622e171b6b08
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Pogo Pin Connector
>
> This looks like a very generic piece of hw.. many boards (esp. convertibles)
> do the same thing, with 4 or 5 pins on the bottom of the device.

Yes, connectors are basically just pins :-)

>
> But of course hw manufacturers being hw manufacturers, many different kinds
> of signals go through such connectors - if it's not USB then it's perhaps
> I2C or some variation thereof

Right, and I doubt they call them "pogo".

>
> IMO, we could perhaps add this to usb-connector.yaml as "usb-custom-connector"
> or so

Do you have a device that could use such a generic binding? I can't
really design something in the abstract without two or more concrete use
cases. Coming up with something generic looks like a quagmire, because
as you say the signals going through the pins could be anything: i2c,
1-wire, etc.

At least this is a vendor prefixed binding, meaning a generic binding
could supersede this one later. The risk of accepting this binding is
low because it can be replaced by a more generic one at a later date.

I will move the file to usb/ so that it is more likely to be seen, but
I'm hesitant to sign up to work on any sort of generic binding for USB2
plus an extra pin used for who knows what.

