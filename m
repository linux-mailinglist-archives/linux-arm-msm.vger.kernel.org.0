Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281E377E708
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 18:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344987AbjHPQzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 12:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345058AbjHPQzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 12:55:05 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C1D2102
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:55:01 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6889078ee66so646670b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692204901; x=1692809701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msBfPd8BuzD/GUlkblv4mwPk8fVn9ZKYLL0U+2C7Ff4=;
        b=tJD5cEIiV7GNuFYaHRCvIaE0+8W2uzFOZ8eWkWn4XWh+DbkU+3hX+zMxdD3eD2c/yO
         K2WDDvj1V6Ml0D7OkL9b4ncDhpVvJihwwKb1sQXWnHr2nnYmSSUHV5GwetWBIvoHZN0E
         xT8TXGz3YmmwFnlUiREveMC52xdOKaZJvwc72j0fTqIiYySf2aylBzfm6KOZgZLQPEQb
         jhAXupb0J2f6godJtF0D7xJBf3WRYs2aP6hTqFomDqVm8LGk9MmnTztZ0yjE6BXcSVsT
         5ZkhS0Zt8aATqimnjdbGD7sBNVuV/ycB5ctOcGCKSax2M/bkfoYeOJdG/g7nQGHWmlBf
         LYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204901; x=1692809701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msBfPd8BuzD/GUlkblv4mwPk8fVn9ZKYLL0U+2C7Ff4=;
        b=ejlB45RbRpHAjNN2L98rTMFjAt5jra+fkFoNss/CLzR7Ebw7RL+iL3hiD/CN7+AJSq
         XFSDXze+cWKYf/NkK24YLPJacXh9IE+H/MHOPvxU2tH4VxdQXKRHpIQwsgHnGLItnN+Q
         Y4lC5jxwIJmugvuO193RGXhGNv/vMM9NMS4nybfVOjSMI+QYTJ6oAI/oFPo0rOgI8yYP
         DJwy4yEf+WQzcG8zt3KRr9yDF6pRSEjUh+sEYfonfOe9ws85eP94Y96iwluok9z4yuLt
         bVxxw/FvTIAzMWQ9B7BeuhJJrjhw9ru50GFa/GcsdqlTKYBZmDLafDN/z2a73v9X4QFN
         y2zg==
X-Gm-Message-State: AOJu0YzCsw8XkKjF4F7zST7dVZs6FmNSL3zYcWMBFmr7Y3u2emi9xNRa
        bB9f9chJNg1t/epv53yQMBXU
X-Google-Smtp-Source: AGHT+IE0VMMoFi/0xXy9WRxnp9BBxLzIGWSRRF/ZixvOl8lChvXu3J8yB9UY/E0Bkb2BJXL4r0oiPA==
X-Received: by 2002:a05:6a21:778b:b0:13f:7c0e:dc74 with SMTP id bd11-20020a056a21778b00b0013f7c0edc74mr2426622pzc.55.1692204901191;
        Wed, 16 Aug 2023 09:55:01 -0700 (PDT)
Received: from thinkpad ([117.248.5.25])
        by smtp.gmail.com with ESMTPSA id h27-20020a63385b000000b005641fadb844sm12265647pgn.49.2023.08.16.09.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:55:00 -0700 (PDT)
Date:   Wed, 16 Aug 2023 22:24:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
Message-ID: <20230816165455.GA23057@thinkpad>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 11, 2023 at 05:21:03PM +0530, Krishna Kurapati PSSNV wrote:
> Hi Thinh, Johan, Bjorn, Konrad,
> 
>   On QC targets today, the disconnect event in device mode is generated by
> controller when software writes to QSCRATCH registers in qcom glue layer
> rather than the vbus line being routed to dwc3 core IP for it to recognize
> and generate conndone/disconnect events.
> 
> We need to write '1' to  UTMI_OTG_VBUS_VALID bit of QSCRATCH_HS_PHY_CTRL
> register to generate a connection done event and "0" if we need to generate
> a disconnect event during cable removal or mode switch. Exactly what is done
> by "dwc3_qcom_vbus_override_enable" call in dwc3-qcom. In case the user
> wants to enable runtime suspend for dwc3 and we don't generate a disconnect
> event, the dwc->connected flag will be "true" and it would block suspend
> entry.
> 
> Today, in dwc3-qcom, this qscratch modification is being done only for
> vbus/host notifiers where I assume dwc3-qcom would be receiving these
> notifications from charger driver regarding cable connect and removal and
> since we are receiving a copy of the information in dwc3-qcom as well, we
> would be knowing when to set/clear the VBUS_VALID bit.
> 
> But, when we have role switch in play, the role_set callback goes to DRD and
> Qcom driver is agnostic of what is actually happening. While this doesn't
> hinder mode switch, the role change notification never really reaches
> dwc3-qcom and we would never set this bit to "0" and disconnect event is not
> generated upon cable plug-out. Is there a way we can properly provide this
> notification to qcom glue driver ?
> 
> I had some idea on how to get the role notification reach qcom glue driver
> but wanted your opinion on whether they can be used or not:
> 
> 1. Register a vendor_hook from glue driver and invoke that during
> __dwc3_set_mode.
> 
> 2. Let the role notification reach dwc3-qcom first and then let qcom driver
> invoke role_set of drd. Something similar to what was implemented by Wesley
> on [1].
> 
> But both the options require dwc3_probe to be done in sync with
> of_platform_populate or we need to defer qcom probe if dwc3_probe is
> deferred. Since we are leaning towards async probe, not sure if the above
> two options would be proper.
> 
> Couple of more reasons to ask for the above two options:
> 
> 1. We would know when we are in device/host mode and we can avoid having any
> layering violations in dwc3-qcom.
> 
> 2. When it comes to runtime pm implementation for dwc3-qcom, an effort was
> done by Manivannan Sadhasivam previously [2], we can avoid modifying
> xhci-plat.c to set autosuspend delay to any specific value. We would be able
> to enable runtime/autosuspend for dwc->xhci->dev from dwc3-qcom itself upon
> entering host mode.
> 

Since you have quoted my series, I'd like to get clarification on one issue I'm
seeing. When resuming from runtime suspend in host mode, dwc3-qcom driver gets
the wakeup event and it resumes the xhci driver. But the XHCI IRQs are received
after some delay. Due to this, xhci driver doesn't resume the device, instead,
all the drivers (dwc3-qcom, dwc3-core, xhci) went to runtime suspend again.

But once the XHCI IRQs are received, dwc3-qcom gets the wakeup event and this
time, xhci driver resumes the device.

This is the reason why I added the autosuspend delay of 200ms to allow the xhci
driver to wait for IRQs before going to runtime suspend.

Can you clarify why there is a delay in receiving XHCI IRQs?

- Mani

> Can you help let know your thoughts on the above two options or if there is
> any way we can implement the role change / cable plug in(out) callback.
> 
> [1]: https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
> [2]: https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/
> 
> Regards,
> Krishna,

-- 
மணிவண்ணன் சதாசிவம்
