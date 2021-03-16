Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381AF33E122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 23:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCPWIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 18:08:09 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:35617 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhCPWHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 18:07:54 -0400
Received: by mail-io1-f50.google.com with SMTP id g27so38938751iox.2;
        Tue, 16 Mar 2021 15:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7SSXES/30pJ8iTK6/JGpc1rhxQdi1XWewLeBy+rmXaQ=;
        b=lmymnkvvc+pgwCC6VT5UHp1zmo4hg7SshprB44cY0BEVtNr4JFEwetRTu7vfprDXfH
         zWcMU4Zb2aGkfNjl2I+AcVAa4Zsv3H3j5p07qx2rL+EUXrAI6VMpwjVdAFvddtgBRm0A
         f3A2yrvW7KA0hgXtZ11NpIk5qbP27hmAedtVakhOr7Bh1P7Y80pdneqmUOonoHn7qrsp
         wW1EBFbfpxY7/mMrFIKOIDBnFdZo9TtHgKE6PgkrKYlOUyyRVS8EY9yQYMpwYqbta9FN
         bt4cAbbWkd1fO+DVDtxQgis6ECBmkMGrmOrTU2PRxg/PkEdgcMTUgOnH8PCtjrVRFrBS
         mW2g==
X-Gm-Message-State: AOAM533gKDlrkYvfXQCVU4Rq5WvNXrVJlZ/n5y75wu5OucXhTTWRpYmX
        zP6Uv/d8USYwUWPTfFYiSA==
X-Google-Smtp-Source: ABdhPJzJgxax2unrFNAw9QCzSO3QHOwL7CKwfj3iEGca3s2n32pCOQ8gVZufi4Lf/15mE3iYE63EnQ==
X-Received: by 2002:a5d:81da:: with SMTP id t26mr4798306iol.129.1615932473797;
        Tue, 16 Mar 2021 15:07:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t9sm10090537iln.61.2021.03.16.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:07:53 -0700 (PDT)
Received: (nullmailer pid 3765793 invoked by uid 1000);
        Tue, 16 Mar 2021 22:07:51 -0000
Date:   Tue, 16 Mar 2021 16:07:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     devicetree@vger.kernel.org, mani@kernel.org, sboyd@kernel.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: reset: aoss: Add AOSS reset controller
 binding
Message-ID: <20210316220751.GA3765758@robh.at.kernel.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
 <1615269111-25559-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615269111-25559-4-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 09 Mar 2021 11:21:48 +0530, Sibi Sankar wrote:
> Add AOSS reset controller bindings for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
