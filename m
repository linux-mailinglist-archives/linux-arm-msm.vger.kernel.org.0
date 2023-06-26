Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAC373D8B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 09:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjFZHlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 03:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjFZHlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 03:41:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC493E43
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 00:41:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9741caaf9d4so226935866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687765272; x=1690357272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zA7Cm37wj3yQ3D5wBwKXWhe4kq3EmRcED9N0uqF2kvQ=;
        b=I/wb10rpkLePRZPQqPL0pgR4L5G+sfRmXWEKD7G+t2jo/R5hpYeMtBmaLkXSjbNfwh
         m4nDPTipwLaUyzkP2QLaQFplIX4cFdrFGhv9E5VfyNyEUIiG50TM8QByb3Dtg7AYDaSZ
         tfm5yt41F0dQ9GPbXtIEZEwWB0xMONHkDdAEas0dcaIh7wsVZsNxKmmkgWR8FmtDcMby
         usUy4CFd4Y1tDPJcFK8aMYPJhCkz347nzYXDyshAKxj4w2YHV9/N0aoU8nwF7/7mAs6s
         zU468STNhnXGkgDHmRdbpjfQxbkdfOohKmNpcx3VzUX3bWj0DDLHbM5vNgc3C1+9Xdtf
         F8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687765272; x=1690357272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zA7Cm37wj3yQ3D5wBwKXWhe4kq3EmRcED9N0uqF2kvQ=;
        b=UsvICNDU6g9SmD47mFjIaDhfNEqr454rcKVupW+1Kyi/+03XGkf6ju/yz9yE1N3l9h
         WPtvNUBDBFJ/dCPZeoKBpkgt3bVoeEpnBSz/I7WvnkfdG6iAKP61AvSbmYhTazqLIElI
         nFgyRg1NXf93MBtcv/06EbcUmAkpv2xjJRFdglffcm96txO2HW2LO8tu8Zed5/rfsu5c
         00Faqot7A8UUAo4DhW4n91OdukQ6mvZQ0xww/ditt8GBcoGsM0z/ySzXeyDJDoANW3y4
         k2Sr9XE/+CXdWqO2PGilgMYwoHT2HnI3zW2++c3eoJOOJDHcUUn6gHwBK5443mcRbJ/G
         MxfQ==
X-Gm-Message-State: AC+VfDwi6/Xm7oKlYwTztDpG4ykbJ3xEfMKPw7OOt6Bw+RsCc6OiskVm
        MAgk7yPjlrHtoD+3Rync8dU45Q==
X-Google-Smtp-Source: ACHHUZ6Tv5NqF4SmF0qc5/rrLjA1ARSlgDmMBu++P0KZeJI4PYADGMrZs/OxnOVDb9cA3kIGJK1k7Q==
X-Received: by 2002:a17:907:86aa:b0:989:5d1a:a558 with SMTP id qa42-20020a17090786aa00b009895d1aa558mr14941181ejc.61.1687765272276;
        Mon, 26 Jun 2023 00:41:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gu3-20020a170906f28300b0096f71ace804sm2969110ejb.99.2023.06.26.00.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 00:41:11 -0700 (PDT)
Message-ID: <d3970163-b8e8-9665-3761-8942c28adaa8@linaro.org>
Date:   Mon, 26 Jun 2023 09:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/5] scsi: dt-bindings: ufs: qcom: Fix warning for sdm845
 by adding reg-names
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Rob Herring <robh@kernel.org>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
 <20230623113009.2512206-6-abel.vesa@linaro.org>
 <cd84b8c6-fac7-ecef-26be-792a1b04a102@linaro.org>
 <CTK1AI4TVYRZ.F77OZB62YYC0@otso> <20230623211746.GA1128583-robh@kernel.org>
 <CTMDIQGOYMKD.1BP88GSB03U54@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CTMDIQGOYMKD.1BP88GSB03U54@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 08:38, Luca Weiss wrote:
>>>> but I guess no resends and it can be superseded.
>>>
>>> Right, the patches got reviews but was never applied... I really need to
>>> find a strategy to keep track of sent patches until they're applied with
>>> my work mailbox, it's not the first time that a patch has gotten
>>> forgotten.
>>
>> There was an error reported on the above series. Why would it be 
>> applied?
> 
> The error report at [0] complains about reg-names but I'm quite sure
> that patch 2/3 resolves this error. Does your bot only apply one patch
> at a time and run the check or apply all of them and then run it? It's
> been a while but I'm fairly sure I ran all of the checks before sending
> since I also documented some other patches in the cover letter there.

You did it in cover letter, not in the patch, so there is no dependency
for bots recorded.

> 
> [0] https://lore.kernel.org/all/167241769341.1925758.17856681634949446114.robh@kernel.org/

Your patch 2/3 could not be applied to any tree. 3/3 applied but without
previous one caused warnings.




Best regards,
Krzysztof

