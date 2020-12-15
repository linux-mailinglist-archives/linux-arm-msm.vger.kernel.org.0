Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E072DB535
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 21:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgLOUfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 15:35:48 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46937 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgLOUeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 15:34:14 -0500
Received: by mail-ot1-f65.google.com with SMTP id w3so20704839otp.13;
        Tue, 15 Dec 2020 12:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+yEREsPMLzh/wN7w55YrIRd8TCU7izkQLXyeznnrtN0=;
        b=namlxLWvw0U3k0LcAhSrHSNzL4pHh38sqI3p6QXanMSdOap1XpKVY5PkSBlMQaUHMT
         nvWMEa5P2ok8nQe0XjJnC7cLNrxkm7Di7HRtEUCPEpPMD6AIOJZUlbT1vHdoO4YBNeAm
         Jn/2ZjEe+1pcD0mx2M+nFu/asT7U1hHlTWuceSL2MWuOx58hFBUmmRIhI1sU1JsdSlAZ
         8gcueKKdqomAUz5vArS9473RgFYfWTBNqmp2VGOzTYhU7klrj35ecqmtpYiePETWiz+Z
         RSkQi8Y1Nrk/NTOIBzUbfjCMsNcjkpAaJfmo0k1szqfRFsFEMYlUbLJOdf0eFhXNOlrz
         j4nA==
X-Gm-Message-State: AOAM532BQw3wZGiEsJJY8WxchuCXnE6XzYqRhLS4R1Ww7YqaaGNEAIdo
        f8zhQuFfBobcQSOI8BpQaq/JnOooOA==
X-Google-Smtp-Source: ABdhPJwzM7jYzCNSaX0sPIZq0f82K16WK38zzyV1IOymvJieRlk/WdTuPZ4TprB+NDmjEVAI7SNYvQ==
X-Received: by 2002:a9d:7482:: with SMTP id t2mr24711600otk.339.1608064413271;
        Tue, 15 Dec 2020 12:33:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k63sm5316651oia.14.2020.12.15.12.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:33:32 -0800 (PST)
Received: (nullmailer pid 166890 invoked by uid 1000);
        Tue, 15 Dec 2020 20:33:31 -0000
Date:   Tue, 15 Dec 2020 14:33:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: soc: qcom: convert qcom,smem bindings to
 yaml
Message-ID: <20201215203331.GA166839@robh.at.kernel.org>
References: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 15 Dec 2020 13:45:37 +0300, Dmitry Baryshkov wrote:
> Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
>  .../bindings/soc/qcom/qcom,smem.yaml          | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
