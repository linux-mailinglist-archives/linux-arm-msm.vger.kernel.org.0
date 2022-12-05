Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710CE642D63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbiLEQpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbiLEQpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:45:08 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3B21F2FB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:43:44 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m19so9195364wms.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tm80V8MxZTxpH8Negzaw9yC6TePaEGAsS6LZXq3Sak8=;
        b=vZoNeNgFajvPZnk/7PG2S1mOTR2KCGgiBqXs+6/gm5VKOI5/soGghHtC6bwX1jowiI
         x48gFgtHKB0jT4IO3Yqnd4i1TQCAS2D+2XIPymvA0cg+3qEBhnEjBC9z0XDrYlgd/+as
         gVCS7BC+H4gZRjctyWMzpOINEsjhp2PcHhyNqHFqHn36A6W2yEIgMR2pE28m6owJcYPS
         Z6X5e6eIlVeXtXwejAtQ3U8hF4PQlnaBYlJLCECfnNDk/kWYDjJ0FqYXcYXefN8gqpoD
         6SiGionsU9y565cMM1tIFW+gaaW2hwIbY1eXrgNlkKhBBSLHtnjkeKSpATeGT4xOZ1J0
         yTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm80V8MxZTxpH8Negzaw9yC6TePaEGAsS6LZXq3Sak8=;
        b=L4awYcZznd4BvRCfKHyB9jl+tandgudG9sh0THm8eEthfPYsnJWJRrfCyZhDlFI/Gu
         zHynYsPXeaBY+muFupM/A+M2St8gKT8vqmHwMUaF/xkyalu6R3FxHANFuPVlDFxPLeSp
         BVMFA79KKzWw4JpRGfajZcixh0yhQB0J4MOcsILwBh6n6kuGUiaWH52wek6CCT8Rph3P
         XD1MFMHU9EjL7rBFpvJNZU4K22J+9i9RAPcB7apQLNTOl/xVOigF74bsMY7PJAq2briw
         Yp5AllFx64f+/OIdAkJhFfp6N0XO54gfinGrW9N40nO+TkxH54muavojvZ30JUtayBZx
         yBzQ==
X-Gm-Message-State: ANoB5pnq8kwTCiPP/bwD5l/0jTZKuBp18/lpaNyduc5ckBpkOgjcfK3W
        wt0b78umnwCFCmLa9RxzycJDPQ==
X-Google-Smtp-Source: AA0mqf4VH/8dwNgqHSHIl59AH6n9wu1E2CA23P1jGP7ba2vPGh0J512RFMeyb3Ui7UelM3npGP4lzA==
X-Received: by 2002:a05:600c:3d10:b0:3cf:8a44:e1eb with SMTP id bh16-20020a05600c3d1000b003cf8a44e1ebmr52440612wmb.189.1670258623035;
        Mon, 05 Dec 2022 08:43:43 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d5441000000b002422b462975sm14052567wrv.34.2022.12.05.08.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 08:43:42 -0800 (PST)
Message-ID: <846f56b0-2591-318d-cb37-99cbf6d7bb32@linaro.org>
Date:   Mon, 5 Dec 2022 16:43:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
 <20221205152450.1099-5-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221205152450.1099-5-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 15:24, quic_mmitkov@quicinc.com wrote:
> media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/3840x2160 field:none]'

I really like the improved commit log, thank you for that.

SRGGB10/3840x2160 drivers/media/i2c/imx412.c that's not a supported 
resolution.

media-ctl -v -d /dev/media0 -V '"imx577 
'22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'

?

---
bod
