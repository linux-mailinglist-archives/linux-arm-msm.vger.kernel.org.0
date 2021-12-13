Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42604735C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 21:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242822AbhLMUXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 15:23:15 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:33566 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbhLMUXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 15:23:14 -0500
Received: by mail-oi1-f170.google.com with SMTP id q25so24833111oiw.0;
        Mon, 13 Dec 2021 12:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KOzRGDuzgHP+LKpjr5HbH419deyjCZOrF7CtcnAeppM=;
        b=r+DWFlSDnU0/Gk+g87n3UBOeqpWBBMlfzmb6P2UK6s+Bd7wWC/oamgFjoqS2t+zmwZ
         /f3ZgwzUO2vReVQuA8UdMAoLJQ79dFKHt/vORUlcFwBgNtwrW5VMXUPKW4kBsPWTHnJ6
         z4IJqkzjk9X662GvE3HgfProEmvqfOWM60wuknc+SEkkd4tuLE3uF7MNF7dS31SYqfQD
         Z3UYbxKEeXMu2b48GAhxpm+gQI+jNsxIlOUxXfVnJuPsJRiuJCxSrgDAtnWRlUF7SCe4
         RsuuD4gYW7gP7xGrMljtF3ZZT0VqX8dxV3/CRrJDoxYJdOcaiQDNnhDSf+s9Ky6lLFW1
         IjQA==
X-Gm-Message-State: AOAM532Z9Ym8MLOBfbOJLJuf9zZrryRx/ybyZ7xHxIyKjs1QyQ2SePEp
        8/qXQHj9pxooJFOTtdDkPQ==
X-Google-Smtp-Source: ABdhPJzUCaYQtXFGkfNZQS0VLaUxGOxkTq0hqkKHtdFQi05ubJ4+LZvxzTMd7+QA9zDhE98yynU/rA==
X-Received: by 2002:a05:6808:5c1:: with SMTP id d1mr29655537oij.141.1639426994075;
        Mon, 13 Dec 2021 12:23:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e4sm1421252oiy.12.2021.12.13.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:23:13 -0800 (PST)
Received: (nullmailer pid 1508142 invoked by uid 1000);
        Mon, 13 Dec 2021 20:23:11 -0000
Date:   Mon, 13 Dec 2021 14:23:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/5] ASoC: dt-bindings: qcom: apq8016-sbc: Move to
 qcom,sm8250 DT schema
Message-ID: <YberrygvFWcGtV7L@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-4-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-4-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 02 Dec 2021 15:55:03 +0100, Stephan Gerhold wrote:
> All the Qualcomm sound card drivers use the same common device tree
> parsing code, so the allowed device tree nodes are almost the same
> for all of them. Convert the qcom,apq8016-sbc-sndcard documentation
> to a DT schema by adding it to the existing qcom,sm8250 schema.
> 
> The only speciality of qcom,apq8016-sbc-sndcard is that it has memory
> resources for setting up an I/O mux. This can be handled using
> a conditional if statement that only requires it for the apq8016-sbc
> compatible.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Note: There will be a dtbs_check warning caused by this, because the
> recommended naming for nodes is different in this DT schema (-dai-link
> suffix). I will address this in a separate patch if this series is
> accepted, simply by changing apq8016-sbc.dts to the example added
> in this patch. The driver itself accepts any naming for those nodes.
> ---
>  .../bindings/sound/qcom,apq8016-sbc.txt       | 96 -------------------
>  .../bindings/sound/qcom,sm8250.yaml           | 83 +++++++++++++++-
>  2 files changed, 81 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
