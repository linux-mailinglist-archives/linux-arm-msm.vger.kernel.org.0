Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AF13C323D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 05:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhGJD3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 23:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbhGJD3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 23:29:19 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3886EC0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 20:26:34 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so11570072oti.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 20:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tSuIfx7otNSTWWg0Lv7QolwwIL/JONva33F7uh+h36k=;
        b=NHnMaBnOqVwTBr0XOrkL1oxHKcJPG6fp/YlCUIcxkLOavX628pGMgRe/V2J6v/3zG0
         W1t0NoTYJ4w2WgM7TRYOScJjmKNeTywURZWgrY+Cvc1hGHbnkNstkH2QA85u//D0k4Uq
         4hm+IIFrd3pB46UPn7wdpX1lM7Q76GRDiiQWa5GCVKJD+Glp/ZykFqMAPxLz2PkuM8mw
         5ydrzIUJm+xOKT6Fd31Z+B8++aQZZSbdzhZxXUR4HfZZ1m4cVYQN/dnB+Dn4asN3EMwI
         cU4AF7o3vVFPak/H43kN5jUSeQYtAFjlp7Iml2ZQfRD3pnXbfwoqm0ttHomX+4K3U+pt
         h49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tSuIfx7otNSTWWg0Lv7QolwwIL/JONva33F7uh+h36k=;
        b=AUeSafJfvHrp1aqKZC1HBxZGFaheQwzs+AJzNr+1gKjqW5g/sn684S0ZJVa07EPNNw
         mafvmDY4VUe6iIoJRUpOD/6VeXU+HKPftVHTubcJ5JUC0QGMzvjYsKnezzj12W7IOFUz
         247gJjl9mSi5GDOuTvL8BMDtqS6Kbb/K6bUvR79j1ape+1y4E/F4Su+HYJwnHvuWTqup
         mec9XxicVVJVwQkA6HebCThXNty02f/31o/PNLSCABWzhSAiVWySM7LbhYn/aTXm73s+
         hcio4RyoToQ8eScRyfBaW6hJ0Te3dBUdRrd7znwXOb3+D+aWZ66YBhfogrKib4nUxI3K
         H8xw==
X-Gm-Message-State: AOAM532l95C+/Je3Yu3rHnNFOZN6oI+RI07dDHdYl6h4JpMN9K0pKxAW
        hvxzK9ch9m41UKywKGK9ukK2rA==
X-Google-Smtp-Source: ABdhPJxDbg03U0pOa6i4nzGyfe2Eer0vQVnplEDv1pEeJX60GmgdF19cAkP2w6HrNoUjt5S/GpDuJw==
X-Received: by 2002:a05:6830:1684:: with SMTP id k4mr31752681otr.359.1625887593427;
        Fri, 09 Jul 2021 20:26:33 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j22sm1570305otl.46.2021.07.09.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:26:33 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:26:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX65
Message-ID: <YOkTZ0IVoErtjGLP@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-4-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200339.17638-4-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 RPMHCC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 9ea0b3f5a4f2..0c901e748b2d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -22,6 +22,7 @@ properties:
>        - qcom,sc8180x-rpmh-clk
>        - qcom,sdm845-rpmh-clk
>        - qcom,sdx55-rpmh-clk
> +      - qcom,sdx65-rpmh-clk
>        - qcom,sm8150-rpmh-clk
>        - qcom,sm8250-rpmh-clk
>        - qcom,sm8350-rpmh-clk
> -- 
> 2.32.0
> 
