Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC1A5EE612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 21:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbiI1TyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 15:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbiI1TyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 15:54:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD8C7FE6F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:54:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c7so15459678ljm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2ZLG2KC41uqqU7owxniwJkXOna9QouCniVvRwX+2hQE=;
        b=V9fbXz50h5ugIyicyu3iwlMmbCD/QKwWgp/1OHAGgHE6aJ6vtjAj8BQoJysQQtkZ6K
         bmprbpyk4ZnLN3Ab3DOSI966806GRir1vVsjOgJ2ybDziB/QeVuy6MGi/Pe2GbygGrKR
         Htzrjpa2UDVbujOQPbtOUjtHFPox34vdswgGe4bhSWEiwZWU+siEsyoh4/MEAmPMwoZO
         HFMD7g9rNylyJXNdwTwcUmpQtf/ohz5uo/fFnbOMCns0sC961+PzIoqa0uQzStKRVUWW
         EizXfdwMNH1+5A4mBSlMi8tscQVO1U695FdaHQLewSlJh7OeEVu/jaZi+ZNgNAQpcte9
         etsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2ZLG2KC41uqqU7owxniwJkXOna9QouCniVvRwX+2hQE=;
        b=l4aDfpkWvaY4z5bKb4T5mdRBP/FeuaH5dI5L9W6p9+25z2TKiVlQ7my8JaK2u+bPXw
         HebuJu8EBHNqjQE7a6uYXZ36tm/D9GbRPvaPeJ9E3JHZqmbD2NcYlumRTh62YfC5sImx
         j5pJW5oEGYnPXZpuPVt6d6IHfTN4xc7wUZjZSLztTPTEI/87I/86joASAUp3dyrW8pxw
         dxQoUmsiapd0hQSigltFUFVFn7o8IpJlwZqfcICnOZRcrj02jTr6X0uK/9XH/frTtUpY
         01F2165M33woCIAxO7QCbA5VAfm+zVZUSZYyHS9SzkIIFbuxj0zz33GEwM+II/lqlGWC
         W4Zg==
X-Gm-Message-State: ACrzQf0PevalBd4XfQJW7rTMHGLZS1fTwnPI7/MITxnegT49b+AxlOjS
        5BktzGFcENQgCXS5eThl0oifig==
X-Google-Smtp-Source: AMsMyM7IB+1z/6d4whb6N1kyhq69FGzIPwPKCyyD/rDeDY7HIua6rhFqmjg8lGgXr6a25l7MJUXDgg==
X-Received: by 2002:a2e:958a:0:b0:26a:a393:4480 with SMTP id w10-20020a2e958a000000b0026aa3934480mr12072300ljh.490.1664394855969;
        Wed, 28 Sep 2022 12:54:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p11-20020ac246cb000000b00497ad9ae486sm563059lfo.62.2022.09.28.12.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 12:54:15 -0700 (PDT)
Message-ID: <70baf417-1c2c-932d-0b2b-048f3809d4ab@linaro.org>
Date:   Wed, 28 Sep 2022 22:54:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 13/13] phy: qcom-qmp-pcie: clean up clock lists
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220928152822.30687-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 18:28, Johan Hovold wrote:
> Keep the clock lists together and sorted by symbol name.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

