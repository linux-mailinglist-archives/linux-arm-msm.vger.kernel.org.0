Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8748C232672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 22:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgG2Ut6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 16:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgG2Ut6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 16:49:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D34C0619D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 13:49:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k27so15091583pgm.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZCFo51SeNUkOi0joTAI0GNw0Kvqf2JKQKS+2k/u6bwE=;
        b=btWkfvp0JkQdCpC7uMqhXszwJqeXh1l5pSFL8aj+MwGVvWN4n0+PxZBiq5CjPaKB1b
         3ruNPSm8qEV8W5hLyYr0it8cgH1lIt3QvxvFMRPPSCcS1ITuBJyfTzrlGr/sNz+CgrdW
         uqZS2dCFzNCuRJmNpqgUBe8PKtVkAWi2/QYj0XNDb9uKf0SW24RtEmORwfhlqLdhtrtu
         YFh1YD9vKn9Ky3B+kwhtXYlekEYn+iWaOznXeQw0qq6Gb7u1JedGsOlUX8G7EdeK/YmK
         48E4/CPcMv64caVasW3t78Lq3ZnGm2IMu84DgPgWiw2MFDQZcjxpNM0f/F3xhBBl8RsX
         cTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZCFo51SeNUkOi0joTAI0GNw0Kvqf2JKQKS+2k/u6bwE=;
        b=JbEdXDSmS2TqZu6i+ZiZXlqF1beSLauSDnd88TutY84NJWT2RSsG9LAJ8iLvMjfsGh
         NQCW5i5OwYdg20rHzWIypjNWmR0BGN/qH2r6dGQnkukZvgsk2doVVssmAioOQlivmuNG
         RyDzonQ85f+jNHZjx8oXFQBrJQOIOgm1pSrSUsOjvWd3oSnx9fJ+gE2S1khSBMRamGY+
         h6Hfvd986EHQHT15wbfN3sRJsSTRfQ6EuIegQ6mvzLRdHkY+nYOhbjU+PrPV4LlU8Rb2
         A10YdqE9J7oUaigJEthy/0zDy1mTZ56Fg2DVbgwpsnxAs13nFZoiJ8UKyjtF3EgTQKVl
         P2/w==
X-Gm-Message-State: AOAM532cR5z/evfRz2W6exV0B9eBkZLgmJXEb7PdYpfiQoNQJRx5MCC4
        RIwknnXzK9cfs81qAsOuPPoYpw==
X-Google-Smtp-Source: ABdhPJx7ckWZ845NwYLBsMDvRn/h2HR2lmuehBnFT2QcLP6PH+H6EGe1o5XMMXAGcMF9VcygBTZ9DA==
X-Received: by 2002:a65:43c1:: with SMTP id n1mr30164858pgp.67.1596055797739;
        Wed, 29 Jul 2020 13:49:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a26sm3025188pgm.20.2020.07.29.13.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 13:49:57 -0700 (PDT)
Date:   Wed, 29 Jul 2020 13:46:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: smd-rpm: Fix kerneldoc
Message-ID: <20200729204628.GL229995@builder.lan>
References: <20200729074415.28393-1-krzk@kernel.org>
 <20200729074415.28393-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729074415.28393-2-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 29 Jul 00:44 PDT 2020, Krzysztof Kozlowski wrote:

> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     drivers/soc/qcom/smd-rpm.c:35: warning: Function parameter or member 'dev' not described in 'qcom_smd_rpm'
>     drivers/soc/qcom/smd-rpm.c:99: warning: Function parameter or member 'state' not described in 'qcom_rpm_smd_write'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for spotting these, applied.

PS. This doesn't have any relationship with the Mediatek patch, the two
goes through different maintainer trees and my manual mailbox filter
almost discarded the series. So please send patches like this
individually in the future.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 877b13850730..1d4eb46b417a 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -20,6 +20,7 @@
>   * struct qcom_smd_rpm - state of the rpm device driver
>   * @rpm_channel:	reference to the smd channel
>   * @icc:		interconnect proxy device
> + * @dev:		rpm device
>   * @ack:		completion for acks
>   * @lock:		mutual exclusion around the send/complete pair
>   * @ack_status:		result of the rpm request
> @@ -86,6 +87,7 @@ struct qcom_rpm_message {
>  /**
>   * qcom_rpm_smd_write - write @buf to @type:@id
>   * @rpm:	rpm handle
> + * @state:	active/sleep state flags
>   * @type:	resource type
>   * @id:		resource identifier
>   * @buf:	the data to be written
> -- 
> 2.17.1
> 
