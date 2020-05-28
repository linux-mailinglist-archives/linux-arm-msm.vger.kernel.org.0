Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDAA1E7084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 01:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437655AbgE1XlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 19:41:23 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36206 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437593AbgE1XlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 19:41:20 -0400
Received: by mail-il1-f195.google.com with SMTP id 17so751485ilj.3;
        Thu, 28 May 2020 16:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ypfIIDza/08sqd4tW33oT01BD9y9sXiyifz9nYv051M=;
        b=fsRuQVoRgfq6M69OxL6KjuNBv0G0vJgqaens804f66zQRq+iXjk2ntqRwAXFiYpbGg
         M/8PVPA6ZzE94MEfHAXK6RmFP6HDRee6e1D3JjIcPKW/X2ZOhJhjvNI0s2kFuPULpYjr
         42f9KaE6sTSmSzZ60O1lZww5aM4MZTBqJs0NQv5l0+wD8Ze4d4R/YwkJbQtG/UKPUmNH
         1M0ddCckPNTc3m1NiXfQnMXGYEXm9X2KwIShSZrespEkq4P2zLCgh5S+bx5TV1vMiKnc
         tlLK8g2GwMCqTRg5wz8edqjHgACgG0A6DlGaWxg6G8KKZfOM+qYTRRTKs097HGxJTbD4
         AOxg==
X-Gm-Message-State: AOAM531fnX11SQZ0cYSuumnwkA8G5dSTHOomKwvrJNebg63aehWfcTA/
        JeT8FAWDnhIg9tO2MWIaB3wcAodsmg==
X-Google-Smtp-Source: ABdhPJwkYkB51TMDa1sXJoxCcE7geVsDSvUfsrHGWXxX0xBbn7n5sLreOJIOOVEACZSIfr9KjUy4FA==
X-Received: by 2002:a92:894e:: with SMTP id n75mr5117600ild.271.1590709279650;
        Thu, 28 May 2020 16:41:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l26sm12905ild.59.2020.05.28.16.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 16:41:19 -0700 (PDT)
Received: (nullmailer pid 895152 invoked by uid 1000);
        Thu, 28 May 2020 23:41:18 -0000
Date:   Thu, 28 May 2020 17:41:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: clock: Introduce SM8150 QCOM Graphics
 clock bindings
Message-ID: <20200528234118.GA892766@bogus>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-6-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524210615.17035-6-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 24, 2020 at 05:06:06PM -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8150 SoCs.

Where's the schema?

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  include/dt-bindings/clock/qcom,gpucc-sm8150.h | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
