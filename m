Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A613E331825
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 21:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhCHUKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 15:10:00 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:45480 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbhCHUJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 15:09:44 -0500
Received: by mail-io1-f53.google.com with SMTP id a7so11315904iok.12;
        Mon, 08 Mar 2021 12:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3PzoB90zMKFjMxAY15SPBjtYOUacJgHD6kiSNaQgjIs=;
        b=kZh5j1xPLsljUc3E4jwQOJrHagA9wbDjw1RoRDtzMM94mc3x6XYehTFHxmRHtxX+S6
         MfHZaYAeUuAVmcM0DjXEvUmQneBJtbbTuu5zOlKAbhOoJDytnMA2NCetX1MyJbta5O0u
         aLnJb/HR6Ak3Ze6TdJ9x0bpVqluzoCg+d4OFO0s90ikWEJw+EDRa0eHNjzd6yLynz1Mh
         8NMoXsiAnCCNLiFqgPOPBrq1u+kJFDxttws4ogNEGa3yWDHPQa5al47jAhsrT2EM/X+X
         f+1qR0k6St5RH4odr+4Ap0kmHvea6AIQKqZlqkTeuXHBhetxUptKkBXlHfUlruVmRYPj
         pCKA==
X-Gm-Message-State: AOAM533xiVdKnDqaupJPKY8ysMaKImr5WM00tDWRCqECQWYxD/+T77IC
        8/OFmMxnVDWd8gHwm9tH3A==
X-Google-Smtp-Source: ABdhPJy+x8L34fsUcIuKD5IQr+ZHRtJBh/qYpyqKUUP/yfbWtr3NCFdoSVDWQ7DK8E7hYrTVxtGpgA==
X-Received: by 2002:a02:230d:: with SMTP id u13mr25028604jau.53.1615234183775;
        Mon, 08 Mar 2021 12:09:43 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d12sm6572186ila.71.2021.03.08.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:09:43 -0800 (PST)
Received: (nullmailer pid 2880926 invoked by uid 1000);
        Mon, 08 Mar 2021 20:09:41 -0000
Date:   Mon, 8 Mar 2021 13:09:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     swboyd@chromium.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/14] dt-bindings: qcom,pdc: Add compatible for sc7280
Message-ID: <20210308200941.GA2880880@robh.at.kernel.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614773878-8058-5-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Mar 2021 17:47:48 +0530, Rajendra Nayak wrote:
> Add the compatible string for sc7180 SoC from Qualcomm
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
