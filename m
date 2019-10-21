Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D722DE289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 05:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfJUDcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 23:32:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41651 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfJUDcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 23:32:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so7497942pfh.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 20:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5isXOORphLUvrMfHKnVOGpBGKkTOkoPX8pGWFrNDV6M=;
        b=B7CTcHeewVhJ8PJ4T2Xy3W1oc8teseNmlcEKmJwiOSX+AE9BBht8hxCbvmNba1BtW/
         HT5JSKMoaSwpjq1oi1p7ccQkdFNx4MpnzTCmSGY1iqYDQ17kmoUZn1PRp5z8onrgvalO
         O6ZCyAm/1leCWkg7LleltdNnpTqBtFu5AqwB1eRAyKUQL1l/hRTQg8X0tMjo/CrLpCbe
         I/7hLc1cON111+NEaqITzUiryaGr2dKwUWvQgLqeKaJj+10cGjJAT303SwSdIt5kqaiq
         PFhla/rFdW0+7cmsVBNdFvX98tkdYqpcVbjYTU4chE0PJ9yer5n9mCf+PKN4K5VSGdxh
         yeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5isXOORphLUvrMfHKnVOGpBGKkTOkoPX8pGWFrNDV6M=;
        b=j4tJn3G2cBQWA+4S2ObqAGmwYwEgmHfq7EVv89WdvtdqX0FUfrHtLN8sVQJVPb/eJK
         ykO33QtTa8/6fh5dVCbStk6Y9gRNGFkYnJeFPIQmvNHQKnCdw6Mauu8uG6NlTNzabKSZ
         fxmesMkX73W4FcGzuuoPVkhzGaVMdwCDTrQOPtVXMwGFeCRQ79nPboEDFtyJqKU924Qh
         +S9h/WchdC7RYTQa2xWRVowXXr8Pk1/XPyYd9YseEXP0vEoKZ7yQZFOHJPC7ujLfGX5g
         1tWbWx3CrjzcBul6isn1qNI4jVf3CriB/xJY/I5t/CUZAuY1LW85hSNKch2yFyQ41TV2
         +64Q==
X-Gm-Message-State: APjAAAWDT1uwfkVe7QNXZZjFEXuZlXpzubRmGeem0oOKDrkwavhea99C
        i9qTvObxTivlbnG1xW1WUB3YTQ==
X-Google-Smtp-Source: APXvYqwr234z/kcG49JDU513eFxregAt47Pn/yB3FCwYgKG5t1iFFWQ3JJdHNv7eru9GzZvT1Us3BQ==
X-Received: by 2002:aa7:8046:: with SMTP id y6mr19860568pfm.222.1571628744255;
        Sun, 20 Oct 2019 20:32:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i6sm13809128pfq.20.2019.10.20.20.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:32:22 -0700 (PDT)
Date:   Sun, 20 Oct 2019 20:32:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
Message-ID: <20191021033220.GG4500@tuxbook-pro>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 19 Oct 04:37 PDT 2019, Sai Prakash Ranjan wrote:

> LLCC behaviour is controlled by the configuration data set
> in the llcc-qcom driver, add the same for SC7180 SoC.
> Also convert the existing bindings to json-schema and add
> the compatible for SC7180 SoC.
> 

Thanks for the patches and thanks for the review Stephen. Series applied

Regards,
Bjorn

> v2:
>  * Convert bindings to YAML and add compatible for SC7180
>  * Address Stephen's comments on const
> 
> Sai Prakash Ranjan (2):
>   dt-bindings: msm: Convert LLCC bindings to YAML
>   dt-bindings: msm: Add LLCC for SC7180
> 
> Vivek Gautam (1):
>   soc: qcom: llcc: Add configuration data for SC7180
> 
>  .../devicetree/bindings/arm/msm/qcom,llcc.txt | 41 --------------
>  .../bindings/arm/msm/qcom,llcc.yaml           | 55 +++++++++++++++++++
>  drivers/soc/qcom/llcc-qcom.c                  | 15 ++++-
>  3 files changed, 69 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
