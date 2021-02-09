Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AAB3157F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbhBIUrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:47:48 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34894 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbhBIUnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:43:42 -0500
Received: by mail-oi1-f181.google.com with SMTP id l3so10949996oii.2;
        Tue, 09 Feb 2021 12:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Di0YvPKm/59BJaf3ZJnWx4wP6aCe6n3LSpohUxDF3jU=;
        b=fp++cp4dv1Yjl1N68/nJCKKp2+S+Gs2S1TAdhrSXVFdjXCwijDYtTOZY9WEs0mlcMh
         i6xX1MytZvl6yWZyR+8P08efrGCXypgCREQh5aqjBRaFh9wb6NjJWX/l4FaxcQ+KTGUE
         F8jEjLgBu3gFXBlB27lgPbe71Lr19vUTOxeBWQQah81ZM5QKSMBtG33tMba0W5FG7p7/
         hTJyPi1sB/wkKoxLOHEDdp49C2Yld9a0jvdNTDVYNLK2qQR9vVK6dJIZFicm+qWOSCSB
         nPD0KCumBCpCckpv4IeuDxZ/MdEH3NL4t+BZ6/oFx4WIrECYa7H3ynlsUFQDSMLJNFW2
         kM/A==
X-Gm-Message-State: AOAM532ZaUWp90iq2zss4zey+UIaJHoxJzWnCUr9ntUPy3hma8rszVqf
        aZrrdR1IrUJzbeAuc4uidANqJnjn1g==
X-Google-Smtp-Source: ABdhPJwpkXK7E8OdkjL/79Yw6UN1he5ZXXuBaD4uI9rnhQjjLTvCFqbBLcSYEPn1Z5es3HvXPL4f/Q==
X-Received: by 2002:aca:3807:: with SMTP id f7mr3734125oia.140.1612901123615;
        Tue, 09 Feb 2021 12:05:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q7sm4484930oif.1.2021.02.09.12.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:05:22 -0800 (PST)
Received: (nullmailer pid 75330 invoked by uid 1000);
        Tue, 09 Feb 2021 20:05:20 -0000
Date:   Tue, 9 Feb 2021 14:05:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        sboyd@kernel.org, agross@kernel.org, jassisinghbrar@gmail.com,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        mark.rutland@arm.com, sricharan@codeaurora.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        linux-clk@vger.kernel.org, ohad@wizery.com
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding for IPQ6018
Message-ID: <20210209200520.GA75242@robh.at.kernel.org>
References: <1611940320-24830-1-git-send-email-gokulsri@codeaurora.org>
 <1611940320-24830-2-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611940320-24830-2-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Jan 2021 22:41:58 +0530, Gokul Sriram Palanisamy wrote:
> Add a new modem compatible string for IPQ6018 SoCs
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
