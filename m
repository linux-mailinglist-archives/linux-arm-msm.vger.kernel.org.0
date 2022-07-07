Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B700B56A54A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbiGGOXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 10:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbiGGOXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 10:23:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A8B252A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 07:23:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a5so11872037wrx.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hqIb8mtv+X9AlZLYzwKf5IbpeIhtVN6XLKeYlaY2Lzs=;
        b=xH/A5d4lUg6eL6p96dr1imT4trq4i1kgNP6XieapeEocZcQFM08OvqYpwyoYVYPMR8
         zfwdBYNxCN7X9JTSK1/72FS5k4rWsxIujN8+AyNLCRmrJQg3lzK3cIx93MAafhS/RkDv
         4RU0D5vfLcpUgJievRiqhAZLf/UULqTmZAXMUqvdIF7mYpmP8U9V+vbs5tsE8ejcwAR+
         yhnwlOCZxjjKLnk8lssuooX2BubsdXWOQvYi7n5UPCGWvOFzBn5Cq8agDKuGgZtt3X9O
         r4+9PPV+vhv2bSyjIU+zF2YB8Qk1DhkmUs9sLyKIg2k4jqOQ0N2uR0kV8XQ/TJr6BGjn
         6Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hqIb8mtv+X9AlZLYzwKf5IbpeIhtVN6XLKeYlaY2Lzs=;
        b=WkMye3WD6aTSy1ohGkGExFYK21X+TPMLNxcucz87KDIghvzglzpzzCGmPf5fc/zloe
         SVX9MI7dLd4cSoBBr4K2Z0MYCUwtcl9CArUR05WOAW8NXJi7X8XmN+/z2hy9UAYSx0MO
         RL2K38oDzDT701B3QrwcHVncE94DkMNxTkSyAhyxQZcFptD2y4kI6DCcqR4K97//S7St
         8YZTLCjs+ItbSsG+8w5EwDEakNASF4udMxe3MfJOJNQKjy3ri0LjZag2U9HFYinr9JRu
         Dg1AlGRAAvX217zsJ1s9LhtxViUTdE9UDFp6tkvmcjeUFVF7VYLEEX4vWcus3docCv7i
         GlEA==
X-Gm-Message-State: AJIora/kP91cq2RpI62E3mE9STGOJlX27BhgHb7L26UdxgVPOf4QSXY7
        yu30R9YCvPvSBMjo6Du9vFESRw==
X-Google-Smtp-Source: AGRyM1vzQGL/eYONd84G6ZtG24Md/G26q4CsBTftQK1Za/NAS0T8OU5HMk8TRNXfsi2sN4poCfh7+w==
X-Received: by 2002:a05:6000:1c13:b0:21d:6964:fcca with SMTP id ba19-20020a0560001c1300b0021d6964fccamr21046378wrb.663.1657203783309;
        Thu, 07 Jul 2022 07:23:03 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id a8-20020a05600c348800b00397623ff335sm30272858wmq.10.2022.07.07.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:23:02 -0700 (PDT)
Date:   Thu, 7 Jul 2022 15:22:59 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        andrey.konovalov@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix incorrect USB PHYs
 assignment
Message-ID: <20220707142259.7rqbiuk2yztdt2ox@maple.lan>
References: <20220707115444.1431367-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707115444.1431367-1-sumit.garg@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 07, 2022 at 05:24:44PM +0530, Sumit Garg wrote:
> This was a difficult inconsistency to be caught as both the USB PHYs were
> being enabled in the kernel and USB worked fine. But when I was trying to
> enable USB support in u-boot with all the required drivers ported, I
> couldn't get the same USB storage device enumerated in u-boot which was
> being enumerated fine by the kernel.

This is not really a description of the change. It is more like a
narrative about how you discovered and tested the problem (making it
hard work to read). If I understand correctly the current DT has the
PHYs setup backwards. This works but only by luck: as each USB HCI
comes up it configures the *other* controllers PHY which is enough
to make them happy. If, for any reason, we were disable one of the
controllers then both would stop working.

Perhaps kick off this description using something like the following
pattern[1].

  Current code does (A), this has a problem when (B).
  We can improve this doing (C), because (D).

I think everything in the paragraph above belongs in (D) (e.g. how you
know your patch is correct).


Daniel.


[1] For the record, I didn't write this formulation... I stole it:
    https://lore.kernel.org/all/20131111113218.GF15810@gmail.com/
