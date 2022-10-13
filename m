Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58A5FD944
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 14:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJMMiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 08:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJMMiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 08:38:21 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77B911D998
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:38:19 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id i133-20020a1c3b8b000000b003c6c154d528so28827wma.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n98JEg0aU1YMdIAxv7Liv37PwlgbINKHuzKrarqY9oc=;
        b=iDrElDPw41gvQqgZ7TCAlQXfNmXe96Amnb7+vhhTeovAYPx4oTjcfZ051zH+LVawP/
         pliD9rHIbDthh33BiZWTDDwp9amDjROYQ6aBl7n2A0phJk0CDjqgsFxGxad9Zzzz/tkm
         G7lLj0DHttDzf4VOMG2TkHnxEvR4CfitJnAdCbK3ubOSX3CqbQEjzFHKFIrVFIz4Ux9u
         zRBR5mxWpf8IxBXTtxSZDqATLtC60CqjexUvfQ6qO37SBtZlc/rKe9AZs+nLrnuJ6Mif
         EgI/v1hbWPK3Q+nBJ+iuevV+hjPgfzQtG3mhrxC0HRgLpdhInNCa/bkDfjl8i/4b2MhI
         nM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n98JEg0aU1YMdIAxv7Liv37PwlgbINKHuzKrarqY9oc=;
        b=t1+PxdpByxjC13qpVRDdBHgUaQ8xUJAlbKKVO7Mf3/XB/WRNEr4GP3wuydPwCGAWl8
         OHbhqJ5BuaDmMHkrv6BLkNN9RjZR5ZjyJgsPN7i5/yaa7iEDnFqC4jkvt5zUL5czPivV
         PRnlr8cS6doumM7ZQPY4pZsQWNB0ze1rNPHW464D1qArxCBCaSd3RdQlOnKlSzFIKbUF
         4X78/sAa4n0lXDQykSaxQ5PDnCv0/+94mTmt88z6sbcc3XJfn7M6PbXGaOpy8cE0a8yQ
         z2ikk8s+XyESYsfXFZZWxeGEVmVm4XsSBz64Fh+tWZ5Lk781Cc0jQ0iQzZjItV68G+j/
         nfBA==
X-Gm-Message-State: ACrzQf2GkRQ2zoazO191XXZThh95MOXlUphtmK7xHxhRIC2/0nhv72L8
        Nlql9bfKa8ibmIxOzzOZKDof9w==
X-Google-Smtp-Source: AMsMyM6xvD7KaKmCY3+ro/8lfB0TUt9lb1jEjbicKFawRN/dFfDJGtC6Pxnpi9cJz+RClZlE3Bj/xg==
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id u22-20020a7bc056000000b003b4e0072050mr6443748wmc.38.1665664698341;
        Thu, 13 Oct 2022 05:38:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5945000000b00231893bfdc7sm2030004wri.2.2022.10.13.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:38:17 -0700 (PDT)
Message-ID: <a6558ad9-bd04-ca1a-fa20-8d1d55612887@linaro.org>
Date:   Thu, 13 Oct 2022 13:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
> For v4:
> - fixes the warning reported by the kernel test robot
> - tiny code change to enable the vc functionality with the partially-applied
>    multistream patches on linux-next (tested on tag:next-20221010)

Ah.

I never groked I need to apply an alternative set on top to test this.
Doh !

Let me see if I can give you a tested-by

---
bod
