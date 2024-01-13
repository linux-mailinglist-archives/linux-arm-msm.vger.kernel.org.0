Return-Path: <linux-arm-msm+bounces-7195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D882CCF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 15:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8962836B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D1521353;
	Sat, 13 Jan 2024 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxhSLOpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77421119
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbe69afb431so6332247276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705155378; x=1705760178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1/tZMHFRvgZGdip0cvQrcsGGEtc7ulNA2Rsa3PQ+nsg=;
        b=IxhSLOpwxXb9HQZ/sYCT3C3PamaeYDROF9Nu+jHGo24D6rEpg5CLBnXamK7IpyKmAB
         IfB2zyT65JUGfX7j8aMH47WFDHhcw7rQjQMAcvsGmYNxYbes6p09mtqPKZZH0yDIFuM5
         qJurcFXba87ODA1P+ghM/PX4pfQx7vZIGvhGny98KjD7lO2zlCeo/4Ss4qzURsjV36L1
         wfX86R4jCMbuNOWnbKCAdXdG2nhQCoVR1nAo+WSJqU5PtiUvNMX4fLB7PzMwG5F/lY/e
         7YAkvrXdwV7gjpIg0TACPZsMlURvAvxrnEDjLnx2WpB2oc3yasF7g/lTBKy+aqYeoA+X
         ufww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705155378; x=1705760178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/tZMHFRvgZGdip0cvQrcsGGEtc7ulNA2Rsa3PQ+nsg=;
        b=k1w4GfenwMqzcpTj/b0Uqnrkqp+PhdhqO3lAog/lRKRkOI9z5zfLrUlmKtdWYO4HyA
         857GjvlTaO0z+IHSt2Sz4bhwomCDiKGpeWEMs2qW/C6HB7+mvH1qMLJr7eOrD+Y4RiJf
         bfmI9z5etBbZrGpLBEXQCU03R8ETFhDG0wfh0wocXI66owPyaMENOBGjmuHjg9oQ7d+H
         mX/Ynj321P14lMtwXDXDJXCcAthS2BM92kgBNiyHIJgqmulXKMRnV0TFTVi3xeO77g3S
         /kvdFmSpgIu+zlUG3oNWYpnhU4bwrZ1pVwv1z/Fx23huVp0N3+LhsW6cr1+o5NXeyx+2
         ri8w==
X-Gm-Message-State: AOJu0Ywf9ZdmNydxDDlz/P/rXT2HlEOElidU+VIzIyOOBAPrfz9WkML4
	WGKeooSll1j1MZ+OHD2qfqB3Py32GQ/2Wz1ih8ntrb3Zt4+FzA==
X-Google-Smtp-Source: AGHT+IEoRuUcGJONarvwP7Q+HEhsqjkronLEa43W+AK3zy7ViEBV3phu7rdsnjoiEtXRYACJlZFwuhd4Pv2Z8sFEFSg=
X-Received: by 2002:a25:690e:0:b0:dbe:f0a6:cf8a with SMTP id
 e14-20020a25690e000000b00dbef0a6cf8amr1762684ybc.44.1705155377864; Sat, 13
 Jan 2024 06:16:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-9-de7dfd459353@linaro.org> <35f9ee57-3a4c-41d3-870a-f78c873afbad@linaro.org>
In-Reply-To: <35f9ee57-3a4c-41d3-870a-f78c873afbad@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 16:16:07 +0200
Message-ID: <CAA8EJpqDGgbbRe7J4+Cy3EkN49U7=my-EgAZBFZVatEbOtre2Q@mail.gmail.com>
Subject: Re: [PATCH 09/13] phy: qcom: qmp-usbc: drop single lane handling
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jan 2024 at 12:46, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> > All USB-C PHYs use 2 lanes for the USB. Drop single lane handling in
> > this driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Why is this not part of the introduction of that driver then?

Sure, let's squash it and perform other mentioned cleanups.

>
> Konrad



-- 
With best wishes
Dmitry

