Return-Path: <linux-arm-msm+bounces-830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748327EE86C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 21:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D03B2810EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 20:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A4D4644D;
	Thu, 16 Nov 2023 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTZBx4Ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702A1D4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 12:39:31 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db057de2b77so1208205276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 12:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700167170; x=1700771970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ie4bIp+/8X3baaFx5LodBCI7zgnvFrvMzLlKJ9qcML4=;
        b=mTZBx4IkQ79AMp8rx/4siUqlA3amnJIxLXVvYGCGBhm4C+dzYByVlDRUJnPVfQuTyu
         Q39eqSd6au/Shk+YfRyFtwf4a4MRz0DzpHVncTHSpA3pSSqC5OzUNiSennMgYET9/biq
         gu4Nr0oHsyWUXu7adNoyRrYu3/0w8vO0p+Qquq6ao4/2M74SS0kZ2pIyeE2N7qTW8KLF
         Zka1PQpGGTl7B1XaP8vD1qrY0DoqMOFoHxLYzXk80aVQ4UHkiW7Nv6FAcLZD9RCmXJW/
         Zej9UZsiS0new5umN3cu46MERDXOrcGuhUJOU+rFn7LWCZowI2ihl89nzbCRhKLFpTur
         1QXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700167170; x=1700771970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie4bIp+/8X3baaFx5LodBCI7zgnvFrvMzLlKJ9qcML4=;
        b=sCvijW6rthbivAeZVMgtRGHsEWh3prvbkboNxp00UlV1YAsSGPrO7JPYldQ4uiV1fX
         9losANvHjKb+NKTi16OrcR0+s54rAJiar5TgHkMXrU//wQgJ+JxbAojXkL9Ak8uogF5W
         BwRv/qjOKKVKiv/CVRkG5qJUANsmyoDHM3w0uMiMms2O8BmJlXnVdODCPisoVa2dy5cR
         9WjO6whLBUFGtValK30n0eV96oKgROtY3Fi89+PC+tnOnLXa3xpVCPIJHBZHj1L5EwNv
         8cgnnevZba/5ilgHYTX7cRkmzqlCsATu0cVcuvBFYmsvyhfIg7RaSXyu6mAp+8mlsgB5
         5h5g==
X-Gm-Message-State: AOJu0YznLr5rPAfAshdsqTIUwMwhazHO6uHJBhTIvcEOvYN02YW1NtAT
	9YWeQ4TRrzwFpYg8FReG/RSQq84iAhB9MyNFKYHX4g==
X-Google-Smtp-Source: AGHT+IEl05nrGsWTPLgWubxHE+fCn4FbX2jQkSHiv84o+RQr7HDu/P2diCHWO/l3K96sMozK9YE7r3a4UuHHpB6baak=
X-Received: by 2002:a25:400f:0:b0:da0:c49a:5fed with SMTP id
 n15-20020a25400f000000b00da0c49a5fedmr13754181yba.50.1700167170644; Thu, 16
 Nov 2023 12:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org> <20231116183609.GA2742530-robh@kernel.org>
In-Reply-To: <20231116183609.GA2742530-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 22:39:19 +0200
Message-ID: <CAA8EJppW3v7Ozr+KnoYYF6GXE5DqqMjEiETpaqfC_sE3ufNhfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: connector: usb: provide bindings for altmodes
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Gross <markgross@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 20:36, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 14, 2023 at 12:13:26AM +0200, Dmitry Baryshkov wrote:
> > In some cases we need a way to specify USB-C AltModes that can be
> > supportd on the particular USB-C connector. For example, x86 INT33FE
> > driver does this by populating fwnode properties internally. For the
> > Qualcomm Robotics RB5 platform (and several similar devices which use
> > Qualcomm PMIC TCPM) we have to put this information to the DT.
> >
> > Provide the DT bindings for this kind of information and while we are at
> > it, change svid property to be 16-bit unsigned integer instead of a
> > simple u32.
> >
> > NOTE: usage of u16 is not compatible with the recenty extended
> > qcom/qrb5165-rb5.dts DT file. I'm looking for the guidance from DT and
> > USB maintainers whether to retain u32 usage or it's better to switch to
> > u16.
>
> Depends if you are fine with the ABI break on this platform...

As much as I hate it, yes, we are.

-- 
With best wishes
Dmitry

