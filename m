Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A57A6A5C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 16:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjB1Psq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 10:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjB1Pso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:48:44 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C277283
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:48:40 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e37so7772937wri.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677599319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPPcSM7cJFme3QuQE7JkKVDyEl6XTV+0C/RSCHiSBvw=;
        b=U234OuP7IlWP3zDebTbiHVpOQ0hrcBSk+f0jmcgQgz5KhWiQQ2u8dD8/Zhh7T/pbBt
         idCMrSEy/7DCGN7xRNBDV/8XCzajg/rXwcjDhrUwzCoqywkcMviphHCd2TsLIyGUe0m+
         a1BKTr5aDkywJ+VAOb9sbcMtwwp8kQKiclcdlViQt80BQRmGf7y08lSulVz3GtZsSQpo
         HPpgAdAlhImBg40l8hAUKGlCEGebwf8SjI+aT5cSeGiZOgJEAAz6EsFNzR6WJfw30QfU
         fMPH+YbO8O1NSQ+dAr4MWCDSQ/TITw/ydypV6rnCXXpp3zQ/uirBwaNRXz/xDmRCUlkS
         cbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPPcSM7cJFme3QuQE7JkKVDyEl6XTV+0C/RSCHiSBvw=;
        b=L/59O6OUG6Ydf4Z0ZduzJACOIm+u0JRtOuJNbPyCNzNGSdAZJGOo2vnHhOopWzO3pv
         6En1VjB1TKtxoTUVvPGhAVcS2vcu9gztLKKTpGaHZ+8Es3XX7du5bwpAjQj30NZ7lDbo
         2xirJCtA60HlCOpYZADlhOoVM7c9dUkfMmovpqpnVfVU7SM0nQarltDUdY6axhxtpC5i
         gjkqhRGl9ZhrL8DLPFDDNqHWCsVGRp05Wz+oYXKvfoLf94QX+Y6Kb+X9IBDeSSC8B8dg
         yFJeBEGIhPX+V13d65/snY/+An1EB8Pqlo9226fmY2zN+km9D0mqUX5xPNmfytXSwLEF
         wnkw==
X-Gm-Message-State: AO0yUKXSo/qYHqE6+lNI2fCUX/1GjFIL/F47aOWPhyKjQopDtOK9blgU
        PPbdbVUCK//jrnmWAez4LW+bLA==
X-Google-Smtp-Source: AK7set/jx8KDkgxFKTKVjW32HMOrBS98c4oO5060qCBoCKEBqQG87Tu98Ji9ZbroAFdOUduKXrS7iA==
X-Received: by 2002:a05:6000:1e07:b0:2c7:d7c:7d7 with SMTP id bj7-20020a0560001e0700b002c70d7c07d7mr2642471wrb.22.1677599318823;
        Tue, 28 Feb 2023 07:48:38 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d4c47000000b002c5534db60bsm10041694wrt.71.2023.02.28.07.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:48:38 -0800 (PST)
Message-ID: <cb71bea2-088b-d4e9-b143-be9421b92c78@linaro.org>
Date:   Tue, 28 Feb 2023 15:48:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 12/18] media: venus: firmware: Correct IS_V6() checks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
 <20230228-topic-venus-v1-12-58c2c88384e9@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-12-58c2c88384e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/02/2023 15:24, Konrad Dybcio wrote:
> -	if (IS_V6(core))
> +	/*
> +	 * This may sound counter-intuitive, but when there's no TZ, we gotta
> +	 * do things that it would otherwise do for us, such as initializing
> +	 * the hardware at a very basic level.
> +	 * */

Suggest "When there is no TZ we have got to initialize hardware in-lieu 
of TZ" as an example.

Either way please drop that "gotta" - I ain't gonna ACK such a 
butchering of the language.

Then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
