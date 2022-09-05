Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0935AD546
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238592AbiIEOmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 10:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238594AbiIEOlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 10:41:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660E65FB6
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 07:39:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p7so13431743lfu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tID80rmfXboEY0nkAsXNz4rnLGrX/qCh1tfz6rehgxY=;
        b=WwXef97mUawTtzmR9iyVDjDGMi+nFQ/SEEnRJyNHMSbghCjDQaWyJhNd/UdJN7AKi/
         LezE8iduLJ+7I5B8IUmaZ66naDox3nvdGS38RCXTPMxnjuya5lpp0Vw4L3PY+JJfWqpk
         pICyE58d/ccJEQ9lATZjeihXP0UNL5QYkZ4FnhkocU45YEoIrZpOcITH5Mkh45MmHsq5
         Sr1/bZedk8xLU/8eRDufgQJ22KRGUFxmWichkBTmM28Oc3I/Ac7SFi9K1vv10p0hgKmh
         sukMV/1RnsPYZAnmsbquZRxtDlVd53Tjpe1ICBZ18VLK4Qh0Xn9zU5dDatLEZn6JaKvG
         klDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tID80rmfXboEY0nkAsXNz4rnLGrX/qCh1tfz6rehgxY=;
        b=kOHo397Kzg7afGH0L8tWjZXX6feQqX3YdtK4QdsAHHBB4mZE5lcE3//IHveMR8+pSK
         VAFQs0bQDt4Q+BLqN2Uiz+b6aZI9maXbCsKYPG6H7OK/wW8H0XtVI0883kgXBP4PgU/S
         CSOJUdnSD6afCOyP/yD1DhNaHxpUag+CI4TBuZ7omQoxnDCUGjFv47DoMErqoup3byK9
         fsh2jDdRJZcUjA0wYm3mfnJ3yxg8tAuXxf+mXZkl948s9FXKff+qIHu0zfvrnwuOrKOg
         FqSGl9jHhZo+iMtDWl7j1nAmtYJTUQzHstEti+nyrgHQ+2dwXQVABV52FADx2s+XAWWf
         3/fA==
X-Gm-Message-State: ACgBeo2umTBVYMILKYX51oxi28B11rxfvc5vslYPsiKF0jJRwoOdNqZo
        pEL1a8+hX+d98rkfmmiIyDJsBEktCR5xDQ==
X-Google-Smtp-Source: AA6agR7QPtm8qJXa3e1Bgk8soaNrbQf1IIU0Hc5uhjFfqbQzzffyQAzHKJNouMN0oW/bSamk5XkwwA==
X-Received: by 2002:a05:6512:10c6:b0:496:d3c7:68c3 with SMTP id k6-20020a05651210c600b00496d3c768c3mr25458lfg.628.1662388762876;
        Mon, 05 Sep 2022 07:39:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512361100b00494adf8ac1fsm1064144lfs.165.2022.09.05.07.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 07:39:22 -0700 (PDT)
Message-ID: <80cd242a-2ea6-e30b-d437-54c977910d7a@linaro.org>
Date:   Mon, 5 Sep 2022 16:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 2/2] MAINTAINERS: Update fastrpc documentation file
 from txt to yaml
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220905103715.955786-1-abel.vesa@linaro.org>
 <20220905103715.955786-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220905103715.955786-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2022 12:37, Abel Vesa wrote:
> The documentation for fastrpc bingings is now YAML. So update the
> MAINTAINERS file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

This should be squashed because otherwise your patchset is not 100%
bisectable (after applying patch #1, old path is still present).

Best regards,
Krzysztof
