Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55B92CE47C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 01:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388304AbgLDAde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 19:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388282AbgLDAdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 19:33:33 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54296C061A52
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 16:32:53 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id b18so3662212ots.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 16:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7MdXndgzjeVMMTv3QiHrAis+Wy+JgdC97pj6GXzTuEs=;
        b=rrhPz0aCBHNoFZGNmmMN3G68Ufo3m06XULdXNz0dtmB8Jcu8E5Dc8VYiNS84HgzrWx
         nnx7pFHXNx4BaalHJ4+yfLf6g7KIXwb3D+9vQiK+4j13LDYKThsMmRXOixoOv5o47XGt
         r/Esykp8I56KiF6twfSNhmjCida5oA5rx5yU/nUJHFm0rvX6MNebmH/MmmxBssy/wXn5
         eLwSnqZH7LDxGi7QPqaVpepi2cjlvW5l6EihIqrdMsL9gjVC2j9WWRDS1P0DOK1BzZ0o
         fvv+ZMVlKMdN8u3Zi6LnVBH8DiEeZpf0SQj0WE8+u/hdIKvoQLLEyoZkrV/IYICnelZE
         3Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7MdXndgzjeVMMTv3QiHrAis+Wy+JgdC97pj6GXzTuEs=;
        b=hVMrR5nUq967MZMYfFzapD0exNd+fYrjenLHyD/ZjymKIwS9waxSCDJ/IkOEO3d5/U
         g1ISYWmvkYOW5uN82JdTBKix/pQZs2NlGnhBR1Ohh3Qi5ulfO+kswWYSNclvOV/tqO6b
         nHDeukZX5Is3wOAVEEaPhF9n4dAHn0E9vvddf6ApZ10Q77zX11obWm6kRjZzul2TvrWH
         g5OO4HJkDsaoW2vN0/chCr7h5Q2tdM31B69lT7+Sk9Js+NQ32XsgQ1vmvqRZaFBFmEJD
         KIvomT8DyKcgjubAaEIe7843NfwaPblT7M9YbiLJMPLGM1UJQbw6iXIbBpXLHxEA+mJo
         PVAQ==
X-Gm-Message-State: AOAM530m9Vy2tk4bfzqSR6gzArRA4WY4X8xN/rn4fYrEtzgcK51K6p2M
        WBL1RsBafLh5ok/iIRqSJR581ahgLyvabA==
X-Google-Smtp-Source: ABdhPJyUhH50Y0gRXUDj8pE+7NFyx2hkbRV6Bio/hg9jUyiQX8C6fqc1MmeIZtnWE9ZZg5d7jPxfIQ==
X-Received: by 2002:a9d:d4a:: with SMTP id 68mr1603458oti.101.1607041972646;
        Thu, 03 Dec 2020 16:32:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e3sm293633oot.14.2020.12.03.16.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 16:32:51 -0800 (PST)
Date:   Thu, 3 Dec 2020 18:32:50 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: convert qcom,smem bindings
 to yaml
Message-ID: <X8mDsrkG7cY2nPC8@builder.lan>
References: <20201203191335.927001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203191335.927001-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Dec 13:13 CST 2020, Dmitry Baryshkov wrote:
[..]
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> new file mode 100644
> index 000000000000..1ddeb25cbdc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Shared Memory Manager binding
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Qualcomm Shared Memory Manager, used to share data
> +  between various subsystems and OSes in Qualcomm platforms.
> +
> +properties:
> +  compatible:

y/-/,/ in that compatible, and we only have one. So I think you should
instead do:

    const: "qcom,smem"

Apart from that I think the binding looks good.

Regards,
Bjorn

> +    enum:
> +      - "qcom-smem"
> +
