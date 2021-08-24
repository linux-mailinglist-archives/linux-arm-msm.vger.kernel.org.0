Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192C93F62F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 18:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbhHXQn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 12:43:56 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33676 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbhHXQn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 12:43:56 -0400
Received: by mail-ot1-f42.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so47822841oti.0;
        Tue, 24 Aug 2021 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZQWgzxxdP8PkcG6LZW9j+Ow/i0rknGQwvNdSI0qT5xQ=;
        b=GTH5Pk+V7D56FkBnUJ+nOwXj+h58MfpsBvBwTv3qmYAIf+YR5DeiCiXr5p6FbeO1HU
         nFrcVxEG1aRsifB28jQU7Qal/LUk25NcRcJ8iMGMgrALSifqMbtQ0KL6f05okRCM9jVR
         QWlZqVEpDWhqL5ZvD3F8vQVWYLEcRjve1xbDHlSpnj3CgB61mXl4lWr9jyO7EFg0Lf/Z
         SE/YBDe6gJfk6q8XdtN1z+LQaplB9YbG5a4k+6Nq8f1HSGRQCmuRQraAYfXWFWfVOO9t
         ViEaNPhmMGuhix+PxCSEVnMbYVhkZ6vPdArd8fqb5fhrgzsERqW3YLzeU9tFxX+d/I55
         kaLA==
X-Gm-Message-State: AOAM531TMZv+a9MLujdDQM5WG6GKrdzn68Pt3Ke46oNFLBA0a5W3l1YR
        +w4O4jqZ+ry7ap+Yr+S6tQ==
X-Google-Smtp-Source: ABdhPJzgTefK7bT+qZFvvbUVpd+mVk23G7j9YftXmPvNQJazA+Rjhr0BOO03dQuh18J98Ky3DIOo1g==
X-Received: by 2002:a9d:6192:: with SMTP id g18mr33037702otk.314.1629823391396;
        Tue, 24 Aug 2021 09:43:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q7sm1404339otl.68.2021.08.24.09.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:43:10 -0700 (PDT)
Received: (nullmailer pid 600523 invoked by uid 1000);
        Tue, 24 Aug 2021 16:43:09 -0000
Date:   Tue, 24 Aug 2021 11:43:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     marijn.suijten@somainline.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        linux-kernel@vger.kernel.org, jamipkettunen@somainline.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/6] dt-bindings: power: rpmpd: Add SM6350 to rpmpd
 binding
Message-ID: <YSUhnRi6KzF2Yfsi@robh.at.kernel.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
 <20210820203105.229764-3-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203105.229764-3-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Aug 2021 22:31:01 +0200, Konrad Dybcio wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm SM6350 platform.
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
