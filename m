Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA35E587809
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbiHBHmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiHBHmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:42:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677CEBCAA
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:42:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x39so11183101lfu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sysyo3Hcj22F2ZNqhVMjBOijG52otySUtY94FYZTrsE=;
        b=tln0P46UzHwhOXJDiSbb9fJ2gkC89F0BJrUFmi8BOPk6lFsfs2KF/NtKmApzE/ubzK
         Bs4lNbIghDHV7lZRrS+wsfo/RkV7VtccpmAbkdq2KrYC1X033mc9Psquly1rXOo6d59L
         Tp38O8Ig6CZHOKtJowuZqA+QjjSHCNSfwON790kkS26iHAcXu1GK8kLeEtYp9dhdVTNx
         rUriRr6nNjxJOF7s8Iousz/WfeoJ6JPIFtiw464QQfqlzm7HskZj6UPAoi69LNzr+SLK
         Tqx8E8Fbi/2CjFJMY9dSXhCJY/bmWCOVOHzcfu3mYb+nW8ARgsatmlap6lwFfPYB9X9F
         /KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sysyo3Hcj22F2ZNqhVMjBOijG52otySUtY94FYZTrsE=;
        b=LZwW0+qeNPdasIbv5i16tdDUqNhW0cQKm5Ap2EYbAVpy+d/bTD6+1QZyK4ShBTEhYD
         XbX/9gF/mEYnLnUvuSW3IsOg8XN1XNdsOVjRchtUgkP14oSljYrM9Rst3GHzvT4V7UjW
         vNO9SsYXbsl1EYvsmXVscklxIJhPgZqQQImQotqEe1QXYjP88fykX8lJDZAZg2lD44tZ
         0V+JMb3/rseausutxZmtlTyY/sLHBi2b7RdjRmRGFjhwLQVx8fEtrUFQDHfWAchIefJ5
         7QRjWRLKGqieKC/Nhbcv0JAM01WKpoSS7v7VCzNqAf4c4A5aGWqskfQRu20GSqweK3HL
         Jowg==
X-Gm-Message-State: AJIora+U3DG6vdS32OdLPEHtQQETmCbxZUkudKJ+sbBkthzLuhIiMk0/
        PP5RAjTELyB2/aBq0H2xyrtasw==
X-Google-Smtp-Source: AGRyM1vx+HsE2Tt+ENrRXaGDPuG0vy0jPqLUUb2AczZFIMg1MAjBv38zLnvzU5RE16RnuuAAvqiZrQ==
X-Received: by 2002:ac2:4e0b:0:b0:489:d4dd:20cb with SMTP id e11-20020ac24e0b000000b00489d4dd20cbmr6837487lfr.83.1659426120829;
        Tue, 02 Aug 2022 00:42:00 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id r10-20020a2e8e2a000000b0025e42f8e771sm1212528ljk.34.2022.08.02.00.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:42:00 -0700 (PDT)
Message-ID: <6acad958-54e6-b535-bb16-6364023547e8@linaro.org>
Date:   Tue, 2 Aug 2022 09:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 move common nodes to a common dtsi
Content-Language: en-US
To:     Joel Selvaraj <joel.selvaraj@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220801112512.209047-1-joel.selvaraj@outlook.com>
 <BY5PR02MB70091276EDE0CE4FCB6CFBD5EA9A9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB70091276EDE0CE4FCB6CFBD5EA9A9@BY5PR02MB7009.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/08/2022 13:25, Joel Selvaraj wrote:
> Since there are two variants of Xiaomi Poco F1, move the common nodes from
> Tianma variant into a new common dtsi. The EBBG variant will also inherit
> the new common dtsi.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
