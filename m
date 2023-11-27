Return-Path: <linux-arm-msm+bounces-2154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7904C7FAAEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 21:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AADF11C209C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 20:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E3245C03;
	Mon, 27 Nov 2023 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A591B4;
	Mon, 27 Nov 2023 12:05:44 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d564b98c9so1453475eaf.2;
        Mon, 27 Nov 2023 12:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701115544; x=1701720344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMyoTTuiVRpV0VWXyFvNZKLDihVgmMriBAWsa2DwHI0=;
        b=lvthBOVF4pXAvfKioKy6FHS7Oi15t1d8wmIkri6nUA+B9Aivf02CbDbdWIheQ4n5RV
         KqkzyYsfby4aX/leX58qKAWfNrIVYCW2XYsjoA4wfeRrerpqXU7dg3ksh/tE9S2EfQcz
         bh9cAJrdZisN3lvn1KSJ8Q9ABns/v1CqRFJpm8Bw/vQgm6r/TdiZMbj8/G9kHJC50RKN
         MzAHVfqhewXobuscirUipoYPKHkUMTaFgWIbTdrboA1i3b7FIaMny/1R0PJQ/klHfKG+
         klBLVps4XcCiwGg+sZVcS20jyBDU+DyDaU+ymo9iRfDL6ToTTFXcQMpYekVwlG1u/0nm
         DrfQ==
X-Gm-Message-State: AOJu0Yznwvfo6vOv8VUZJigCJv851aYt6yZIwonwibiRwmQSqW5YxYpn
	B65ksPR4GCnywzb/qfGMbIBAOl/sRA==
X-Google-Smtp-Source: AGHT+IEm2dvkEYWOa5k7Lp49fIFe8GAkRT/1/cuPFrC1po7M0Zy3Z5WDXjsy6YMeqTpNiVPUT9YIkA==
X-Received: by 2002:a05:6820:1ca0:b0:58a:67b1:47ca with SMTP id ct32-20020a0568201ca000b0058a67b147camr15227339oob.6.1701115544080;
        Mon, 27 Nov 2023 12:05:44 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f193-20020a4a58ca000000b0054f85f67f31sm506600oob.46.2023.11.27.12.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 12:05:43 -0800 (PST)
Received: (nullmailer pid 2955904 invoked by uid 1000);
	Mon, 27 Nov 2023 20:05:42 -0000
Date: Mon, 27 Nov 2023 14:05:42 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Mark Gross <markgross@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: usb: add accessory mode
 description
Message-ID: <170111554173.2955721.9059512533870935138.robh@kernel.org>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
 <20231121202925.2481471-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121202925.2481471-2-dmitry.baryshkov@linaro.org>


On Tue, 21 Nov 2023 22:26:59 +0200, Dmitry Baryshkov wrote:
> Add description of the USB-C Accessory Modes supported on the particular
> USB-C connector. This is required for devices like Qualcomm SM8150-HDK,
> which have no other way to express accessory modes supported by the
> hardware platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


