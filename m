Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262B5268DE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgINOgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgINOgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 10:36:04 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237F3C06178C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 07:36:04 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m12so151320otr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GZakKr1Rl2vFnmP4zslf73bcIAuRFq5109wt4H/RawU=;
        b=eM2xldlHlD0dq6OMi+hkipFuD2hYnK7WVRT7XFYfqVWdK9w7K5iqqI/jHrMrJuBBFi
         U4bwmU4N8Y75S/ADDAoSWH17b4T0Q7Tt9ghAij4ofmLX+vAWCv68Sd+nHq3FpWsIj5Bf
         7RVmxqMBvM7NmhVVncTtqWlJjrTRauQkJaJXGt18Op9v2s1TiQz/q9L8KjKQdwNt7tPz
         Gdj+ohSnVooyod05Hggq0Y1UdBxvJ5/ObsoHKpy4mejRXcOavNoNXTdyJelMTPDCwgRL
         nssZlpDLfNmzYdZpdu2AZ+/F/vOkltj0NCj5of6qO5H2rBUDdp0awljKgccg0Urc4gku
         IlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GZakKr1Rl2vFnmP4zslf73bcIAuRFq5109wt4H/RawU=;
        b=Cma0cxMlJ4SIIlNTNrdz/aVaWbpju6Cu6KB7jJ+TDDOBjikr+CQk8+v9/5eT/X/hnB
         oAcPV+6gF/4QCVjoi0qgSX8UX45OqSMAbcZc8DAZSgZ5vRJQ82ntbaPuVl3wsdDxekXv
         +BIdoI24cvK7CZih9ZoXjjBqMkMKuEMvSpX5eiddQhMyt/axGAqISi3L1Oq/3MuuZoL9
         b4bqU/+LHZLTiNJha1sqwhslbYhrckOUEgOFbi7JZfQeqc2GcvyHUz5WIxsoZkPpFFvt
         5ijccqbtOKX7eJyx+ee4ei/aiF5RcE3x/piyWwjjkS08ax8235wqd8L6SEHZBn0ACJcb
         f85g==
X-Gm-Message-State: AOAM530X5TsUETRx4PQsuPaMSbX/gGSFFxHkzOzfyrBl+R94AO3N9Z6Z
        vD7lx9uQrEAgGVBQtHHbU8/kvg==
X-Google-Smtp-Source: ABdhPJzGf1W2dUVogxHjpOwZahgSMDw0aveW6JgV1ZREzek9U1672WaoWfnK7cPNqt1fh5O4xW2/ag==
X-Received: by 2002:a9d:3d43:: with SMTP id a61mr8943625otc.240.1600094163383;
        Mon, 14 Sep 2020 07:36:03 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id m12sm3369056otq.8.2020.09.14.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:36:02 -0700 (PDT)
Date:   Mon, 14 Sep 2020 09:35:59 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
Message-ID: <20200914143559.GA3715@yoga>
References: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Sep 04:18 CDT 2020, Dmitry Baryshkov wrote:

> Correct sdc2_clk pin definition (register offset is wrong, verified by
> the msm-4.19 driver).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> index a660f1274b66..826df0d637ea 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
>  	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
>  	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
>  	[180] = UFS_RESET(ufs_reset, 0xb8000),
> -	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> +	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
>  	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
>  	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
>  };
> -- 
> 2.28.0
> 
