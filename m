Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7B628D313
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 19:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgJMRXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 13:23:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45302 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJMRXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 13:23:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id f37so714662otf.12;
        Tue, 13 Oct 2020 10:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iK2FTKsI0wzDdbNjBagNnP/xaFtyfckNyRqgclbVTWg=;
        b=jU6GFTh0KEqdRXDMfD+Jkw0bLY5lI5zfM7cYgp11p56/T5PX4FtQVn5sWYrHr1pWsd
         D7bD/Sb81o9SK6Gjh0yqygXy5qBSUyW8H0T26ZQNNfDmAbDdzB4D8hdon6usDXtQwX1N
         MZ/yoSkxMLzNcRQHngbW+eCNnFkWNwUuEqYUEYWCF/j3MsvGEraeczJwlcQLppu8IX9S
         S0WBx2OEW1hZxkEEfH3KyHsexG3vV7c4SYzwhdIWMT6jgyWnP1Z/cDv8nEEmEadmKwJC
         7v/hit1o3GN4yp9kcRihvY2NxNfvB7eghbqOOdOmbE7XKreOMefgfnFp2vYR98KoZhF1
         XaxA==
X-Gm-Message-State: AOAM530n1Zg7Hfg3vk02CIbFUCh/y9uvSZIqwKOu9t/RFbFjlqJJg7sm
        l5k38ofj5qreI+OLOnk1xg==
X-Google-Smtp-Source: ABdhPJxkI0Rvsj9nl8pA5tBEGfyLhSNzxuNulv+p19yYc67ogGvyLorOdLtkQDe+h9pS1sQekXnZrA==
X-Received: by 2002:a9d:5547:: with SMTP id h7mr540779oti.248.1602609788809;
        Tue, 13 Oct 2020 10:23:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m23sm184639ooq.30.2020.10.13.10.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:23:08 -0700 (PDT)
Received: (nullmailer pid 3727812 invoked by uid 1000);
        Tue, 13 Oct 2020 17:23:07 -0000
Date:   Tue, 13 Oct 2020 12:23:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com,
        peter.ujfalusi@ti.com, linux-arm-msm@vger.kernel.org,
        miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
        richard@nod.at, sivaprak@codeaurora.org,
        boris.brezillon@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: qcom_nandc: IPQ6018 QPIC NAND
 documentation
Message-ID: <20201013172307.GA3727764@bogus>
References: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
 <1602566124-13456-2-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602566124-13456-2-git-send-email-kathirav@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Oct 2020 10:45:22 +0530, Kathiravan T wrote:
> Add the binding for the QPIC NAND used on IPQ6018 SoC.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
