Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9063113C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 22:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhBEVpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 16:45:47 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:39846 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbhBEVpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 16:45:23 -0500
Received: by mail-oo1-f41.google.com with SMTP id z36so1997548ooi.6;
        Fri, 05 Feb 2021 13:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hsz7Ey1JFDQmMfxpBF1H2V+O94ZWTJgl9lxbzZpoLIw=;
        b=RCjyNEFOPzpAmK+FG/YXeenCFejtC/GDR+P1i11X+DKUBDHIG6GUiwCIinZXKgO/e7
         MctniKMkRNAGviPEW8ShCMx/aZFIfzLwTvjnMnfMdLRkp3pn6CS4ICcKlkl6ddPJZZhJ
         DIPwbjVtG+1C6N+XGMtx++/aiISkR4jt9tEfwHFtuac09diTsnqLi7CdaWIK10PMpB0y
         6twMTrun4VQuAkrqKcdo4b53SiiAz3mvA5DW7AHnJS5f+Q5vqb1WPRpJ5jD0jJKBTFci
         sRJEbnkXNVsJdKOyQL5Cuq1V0bIKqSN+qNdI9KVcJ8ddTSIRBe/dPYPoZ+Ah6aIZSeQV
         NRCA==
X-Gm-Message-State: AOAM533MZrSf2LSkDe9mrvAl3qm4/5TKmjS7i/Z4Rs6KLwEdHFbZI5MS
        +IfyNofORVKLTzxlJVVvwkllXvBncQ==
X-Google-Smtp-Source: ABdhPJyR6XUMXhZLIxuzed25McuHk1y+nK2dADGetjPLYRdw0nMb79Pm91yEkOZZQwM8C4i5A8PAUw==
X-Received: by 2002:a4a:de94:: with SMTP id v20mr4951546oou.90.1612561482449;
        Fri, 05 Feb 2021 13:44:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p67sm1274685oih.21.2021.02.05.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 13:44:40 -0800 (PST)
Received: (nullmailer pid 3802839 invoked by uid 1000);
        Fri, 05 Feb 2021 21:44:39 -0000
Date:   Fri, 5 Feb 2021 15:44:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        marijn.suijten@somainline.org, agross@kernel.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v5 3/3] dt-bindings: soc: qcom: cpr3: Add bindings for
 CPR3 driver
Message-ID: <20210205214439.GA3802777@robh.at.kernel.org>
References: <20210121194051.484209-1-angelogioacchino.delregno@somainline.org>
 <20210121194051.484209-4-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121194051.484209-4-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Jan 2021 20:40:51 +0100, AngeloGioacchino Del Regno wrote:
> Add the bindings for the CPR3 driver to the documentation.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/soc/qcom/qcom,cpr3.yaml          | 241 ++++++++++++++++++
>  1 file changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
