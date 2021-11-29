Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732EB462793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 00:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbhK2XH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 18:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236167AbhK2XHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 18:07:09 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6E7C03AD4B
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 10:08:54 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id s37so7246796pga.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 10:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rP+kmQ5wlVc+pR2GAaszPahOc1SeLyhDcPjEPnD8vp8=;
        b=Sx+Cd5E8JI8zEmKLPz+YRIFV82PQSl8DV4hUwC+cQ6uo3Vv6YiMyl7IU/7fFxvhdle
         rKahqkKvRC+hEKXAPC0QgJilRZsblIxkNdKQU5+dIUYaVWWHLQ0ngKa2u0efwtrHtlD1
         VtwZjctDXvZQ9/XYhrKHeSxb62V/LHMwNlzE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rP+kmQ5wlVc+pR2GAaszPahOc1SeLyhDcPjEPnD8vp8=;
        b=4Vzpd98N/1WvpHvGF/g37lNrOv4HFe7+JjjhT8zKOSa2lV3BJActi/O+YzjMszTpEw
         RgTU0x/lBeb8AnyfO8pk/gbEk7ZqN6wEvEbv4kWah7YKksyrPT5fOeB6HsYurGU81k9l
         4/yEjcas3mVhXLx+W9taat4rwcl3KDc8CwJnpLy77kjWk1Pxj2DlKrSJdUkTKNSKXopE
         KVwL4Uy/GS2XC82JFh46Ln6o3TqJSEEdAFh8l8L8sOtht1jebHPoxmCRP0zktgc65fvW
         LKwSha2ivv5IqkMHRFSVw4FOLNWay6098xK4KsncQ4Zo9De6L8hj1MrQSMnAv27fFxsG
         lF4w==
X-Gm-Message-State: AOAM530k7Q6YWx2z5PPIzC/g1ZtBMXOWZpdPMaFFmZSAM55u/r+ADDf6
        ASgyy31rBnHv04MJRWRj7MGplg==
X-Google-Smtp-Source: ABdhPJyBgug4oG2KvEUDqd0Zf+drGvUYuM0nyMa78y6ktglY2/5CuXmSrvYNfK42nb98+565lrPVAw==
X-Received: by 2002:a63:5308:: with SMTP id h8mr36326936pgb.287.1638209334244;
        Mon, 29 Nov 2021 10:08:54 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d16f:3a09:ab7a:238e])
        by smtp.gmail.com with UTF8SMTPSA id g7sm18644943pfv.159.2021.11.29.10.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 10:08:53 -0800 (PST)
Date:   Mon, 29 Nov 2021 10:08:52 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        kgodara@codeaurora.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Document qcom,sc7280-crd
 board
Message-ID: <YaUXNG0EEKsyfbPC@google.com>
References: <1638185497-26477-1-git-send-email-quic_rjendra@quicinc.com>
 <1638185497-26477-2-git-send-email-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1638185497-26477-2-git-send-email-quic_rjendra@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 29, 2021 at 05:01:34PM +0530, Rajendra Nayak wrote:
> Document the qcom,sc7280-crd board based off sc7280 SoC,
> The board is also known as hoglin in the Chrome OS builds,
> so document the google,hoglin compatible as well.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index c8808e0..91937ab 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -203,6 +203,8 @@ properties:
>            - enum:
>                - qcom,sc7280-idp
>                - qcom,sc7280-idp2
> +              - qcom,sc7280-crd

nit: add in alphabetical order, i.e. before qcom,sc7280-idp

> +              - google,hoglin
>                - google,piglin
>                - google,senor
>            - const: qcom,sc7280

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
