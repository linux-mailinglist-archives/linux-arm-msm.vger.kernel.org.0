Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F76F589EEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 17:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiHDPxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 11:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbiHDPxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 11:53:55 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B485D5A3F1
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 08:53:53 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id u133so13047427pfc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/lWKffvqFTZzWNvWNNSDXm/V8mIImGxuIj1VjPME2ZY=;
        b=NfOvEKCUxs6P9aNhsj9GYYrhce29fZRIbZ+dmaJyONYfurBJVch0FTP3Sg6hlViV3H
         97Q8fSj6HcYhOxx82VSlSrhfWHFsJ3xI1T07JRID3TFjaj4V5HCaCRs8SpYqHx65oBSB
         aqLNJNB6yxUbp0TO06McTKk92+sgvkz6guu3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/lWKffvqFTZzWNvWNNSDXm/V8mIImGxuIj1VjPME2ZY=;
        b=RZUHsa2VCsFmI1WptSl6IYiIWNg6M90+6u/nHhC6UBSo/2spAUqfnZdi5kxMpeq9B7
         Wykm7EY5Hf8U4+QBYvzcxR+Zlo/HLyjdHb3N/+gE8NcOvD6SQn44vbHbc+7zyWsuo9CV
         HingUkBs2VGOe8jKd1Qdwvbl3SrEa9uK5GV0TA2IvnDRjZhgblny3ZJ5djzFsWX0jV+o
         3ekLTJFt8i5rDJR4X4vk2UOCxMV83f99lZWzjL5oFXF58Y3eq+yFLuvBr6+8MvXzpiO2
         m15eaRjMX9njzSZ9Db6gJurPnN0uLA3MsKu/TbVQdl0NxhakSe7VRhKuasY9NF08QSu3
         moWw==
X-Gm-Message-State: ACgBeo2j8bFck7DRK870lYdY1XKC9xhsXrG03Ltg4mTfhV+GUlTysPGf
        E3HtvEAJLSQ9KmfaJe+mLfW8zw==
X-Google-Smtp-Source: AA6agR5qcXxKWPEX8FfLxwsYpaewLTQb6e4vF2dRLmx+JgmWw5oN6PgotTdcXx0I57HR3SVVGmO7jA==
X-Received: by 2002:a62:7bd6:0:b0:52d:4773:a3de with SMTP id w205-20020a627bd6000000b0052d4773a3demr2297138pfc.70.1659628433198;
        Thu, 04 Aug 2022 08:53:53 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87c4:32ca:84b6:e942])
        by smtp.gmail.com with UTF8SMTPSA id x14-20020aa7956e000000b0052ad49292f0sm1154698pfq.48.2022.08.04.08.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:53:52 -0700 (PDT)
Date:   Thu, 4 Aug 2022 08:53:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 4/9] usb: dwc3: qcom: fix use-after-free on runtime-PM
 wakeup
Message-ID: <YuvrjqSz8XGlm04l@google.com>
References: <20220804151001.23612-1-johan+linaro@kernel.org>
 <20220804151001.23612-5-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220804151001.23612-5-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 04, 2022 at 05:09:56PM +0200, Johan Hovold wrote:
> The Qualcomm dwc3 runtime-PM implementation checks the xhci
> platform-device pointer in the wakeup-interrupt handler to determine
> whether the controller is in host mode and if so triggers a resume.
> 
> After a role switch in OTG mode the xhci platform-device would have been
> freed and the next wakeup from runtime suspend would access the freed
> memory.
> 
> Note that role switching is executed from a freezable workqueue, which
> guarantees that the pointer is stable during suspend.
> 
> Also note that runtime PM has been broken since commit 2664deb09306
> ("usb: dwc3: qcom: Honor wakeup enabled/disabled state"), which
> incidentally also prevents this issue from being triggered.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Cc: stable@vger.kernel.org      # 4.18
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
