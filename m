Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC2B47BA80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 08:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbhLUHM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 02:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbhLUHMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 02:12:25 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9638EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 23:12:25 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id o63-20020a17090a0a4500b001b1c2db8145so1645511pjo.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 23:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pd57JPrq9wLZuPMxLEz3oLDEgN+l/LTIJFa/r5cmmFU=;
        b=cAsgRiosMdXwEBHecB9MTUOyJ7JlmAzz4yCKMtYZw0aSo0OvF42q12VSuYiGkvc5xz
         erIQviIa5baFD9QVUATp9X7E3FHM1MZAFDhkZ/BYcpDewq48MJXFYfe3x1grgPIwy5GR
         cK+h5Far/XTLBoNKbGUUbsd0CvXhxB+et1q5eXqMSfvzLrOgfChgqFZmYpATDZjD/T2e
         +HJdixKurMFUuU3NpDo6wvU6jmklZL0wqMjCfB2sJfe43CFeW9P+qKjtr/o4xAdv+ULW
         jQL/zY3WAU6bYWYbEMGcFdXgtGSqB7kYWs2tifJhP+ExS8h3TuTqk4zhZiReMU4PQn2+
         m4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pd57JPrq9wLZuPMxLEz3oLDEgN+l/LTIJFa/r5cmmFU=;
        b=jokzSuDYu1ujoWQBKn6T38EWgPX+brc+bMBRbmEn3QDmaW8kYWRHuVjMKbZeTF1cl2
         hlEXiu+PvswqN4ZdtmItx4NBFsQoJetTK7XRL9U+TKnlsWlmQeW3C6ygvVHu76Lgz4f5
         /KCmJWHK35T27XjgSJ1usq7eN82Hs8/p9rDimYlhKvGU37t7QmhtI+ZSKyX3rcLzip6V
         g+uHaHy3vUC3GyC4zE6S0akMoaE070h9QJ/FEwZNP4ZTCWphAuoUqNI5RkEzpMBbgtR1
         IBFA3E86c1wmK6JI+dUIJEI89GORZZmgVr8iUBUw8DcKfNkf9R1+5R+gpT+lZWnxYsGC
         JKtw==
X-Gm-Message-State: AOAM532dkn9JLm5s1AW5rX3e8NgxufOqK0BDHfTj51ryS27yNyf1jjMG
        C8XFt1NdJsc3cYt8sVGEtUYr
X-Google-Smtp-Source: ABdhPJybKrTGTOw0sgXIk5MIpSXv/WBkmVaI8tHNqNxfUyfz+MejcF4YzSJI7jlVYqN8df1pRwCz6w==
X-Received: by 2002:a17:902:8693:b0:148:a2e7:fb5a with SMTP id g19-20020a170902869300b00148a2e7fb5amr2038733plo.155.1640070745085;
        Mon, 20 Dec 2021 23:12:25 -0800 (PST)
Received: from thinkpad ([117.193.215.70])
        by smtp.gmail.com with ESMTPSA id ls7sm1568772pjb.11.2021.12.20.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 23:12:24 -0800 (PST)
Date:   Tue, 21 Dec 2021 12:42:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     20210106125322.61840-14-manivannan.sadhasivam@linaro.org
Cc:     Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Subject: Re: Question about node naming in [PATCH v3 13/18] ARM: dts: qcom:
 sdx55: Add spmi node
Message-ID: <20211221071219.GD26872@thinkpad>
References: <HTKF4R.5S1PY4MCM4QS@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HTKF4R.5S1PY4MCM4QS@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 20, 2021 at 09:27:17PM +0100, David Heidelberg wrote:
> Hello Manivannan,
> 
> I'd like to ask, if you had any particular reason to name node `qcom,spmi@`
> instead of basic `spmi@`.
> 

"spmi" node label was not documented by devicetree spec at that time. So I was
using "qcom,spmi" but it was not correct either.

I've submitted a PR now to devicetree-spec repo [1] for listing it as the
generic node name. So once it got accepted, we can use "spmi@" for the node
name.

Thanks,
Mani

[1] https://github.com/devicetree-org/devicetree-specification/pull/50

> I'm currently converting binding for
> Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb and I'm
> considering adding qcom,spmi into qcom,spmi-pmic-arb or just rename this and
> arch/arm64/boot/dts/qcom/msm8996.dtsi `qcom,spmi@` occurences to `spmi@`.
> 
> Ideas, inputs?
> 
> Thank you
> David
> 
> 
