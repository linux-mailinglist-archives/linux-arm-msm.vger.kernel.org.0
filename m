Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1664A37566E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 17:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhEFPVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 11:21:39 -0400
Received: from mail-oo1-f45.google.com ([209.85.161.45]:36726 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbhEFPVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 11:21:39 -0400
Received: by mail-oo1-f45.google.com with SMTP id c6-20020a4aacc60000b02901e6260b12e2so1317576oon.3;
        Thu, 06 May 2021 08:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=whsr6U50KYm9D8L6FmJ2OAyclexbSVjplvjpW1E11vw=;
        b=dMwEn+zu7UPL9dqLN1GDg6VlPhQEEX6QsL7sojI/bxcBJTQSdn30weaxFG1DOBM1Bc
         uMmZy9y6jUGlPCvbgKIY1gq98DryNZXqsT4WS4YGnwX1bii0xoomnJev8hLv1higwxnC
         Agv5NlXBw3XMtO7a3a+uEKA+wwHN2FklJP3Bh42TOV38QHA2qiI/hWVty9NhXvCoT6GF
         mYiQ9TwkbBVK07MNcWmxUCnyKFW685QsgQkyvsivaKepDtEioGrQKQYeiZQxnzdr73J7
         nZ9ZNMTJcx+oyk1ejKkWG8BSsbcHs0Fez7sc+QSoLWUfnc5NFKPA9sqFCn8e4HPCc5pG
         SM4w==
X-Gm-Message-State: AOAM531ekSp+pTJX8kvwUfOO/TYkaD+r4UqLlF7V7pAV9d/01AjGUZpH
        q5WQ1lYeetk6ATGaJnDn0GTwFbobJA==
X-Google-Smtp-Source: ABdhPJw16sVpGPNgz7HqYvCPwzzgvWhVKxjCZmI5H5DOosESfBXIBGTFr34MVbIbmTi40r5y5+KmHw==
X-Received: by 2002:a4a:1d85:: with SMTP id 127mr3947759oog.18.1620314440638;
        Thu, 06 May 2021 08:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f13sm638536ote.46.2021.05.06.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:20:39 -0700 (PDT)
Received: (nullmailer pid 347795 invoked by uid 1000);
        Thu, 06 May 2021 15:20:38 -0000
Date:   Thu, 6 May 2021 10:20:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom: Document PM8226 smd
 regulator
Message-ID: <20210506152038.GA347737@robh.at.kernel.org>
References: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 02 May 2021 13:53:03 +0200, Bartosz Dudziak wrote:
> Document the PM8226 SMD-RPM regulator entry.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  .../bindings/regulator/qcom,smd-rpm-regulator.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
