Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98DE57464A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiGNICw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 04:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiGNICv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 04:02:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A87248DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 01:02:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t1so1502845lft.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lI36sTnCb0+DmOyAUw1CM5m4XVa/PVp2AcLeXMQCCI4=;
        b=gjyUm66YJEPpSn//X3ZOvHoEpi1FH/8Ti98snRzY3cYPydTF8ZnX63AAE9cUJZ1LeG
         flkxCz92JB64spplRtBQ4ag4la0wOeDJWqJvY8iZCLS8j5F4Urs8JIkvHSSvgY5VVnZA
         C0fkX9aA++DGvTdIijtqvWxW0ssCQRrFN8pAlInPaAnNn4c4ccQSN5WNqViYkquGC76C
         Oz8zAia9QL6sqPsazX/HnawIYi2NiM9cVBY1j5icb+LjlV5FGm99AWca+SnoCSzXXNA9
         q1MuCwME7qdKhO30h+p6wY1P2mslDMt1NYba0GRA8yR8UQitIPmx4/VLqi8xUikX98mO
         KFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lI36sTnCb0+DmOyAUw1CM5m4XVa/PVp2AcLeXMQCCI4=;
        b=nuFV7X0cUrB0gU4XLNWN+lBX0wojdsHGpncAJR+dy5LKd83vvTNNk4sm/psaCHtADC
         BQq/MLNK7slKJiRg19WvyvCog140UFWxxhgye4fUpl57VZeOilH+f6hswth7UdI3FzQK
         ebT7Oa3Mn9/cMqUvHaMRceVIgYNrZ25t4Ous/p4CMmtVuzMiCn0rlUv61l46I8Q64QsQ
         X9i31PEjC5WL3BRnUOqmwELJpTrL+ACTWJXGdv0RXupf76hgaibAm3cPBjCXrSvfvJM4
         HP/opTBymacMF9mWDT8jARdO2sWukedkNjiXMJi0uFj/n6ZC9TXZ1whERlXNo+WGMTL3
         hlxw==
X-Gm-Message-State: AJIora/udQvIskfbfuPC0dMGN6vMvPJefpaGJofcNjVUCoj9mfUxUgb+
        VGexrOUVulLVxDBefKv3DFEWzg==
X-Google-Smtp-Source: AGRyM1sv62lHORtgudSBwTulpCkYzf7vRdJw4P69KsktDIRzFN3BKy8OBP4FM0iNzTIQG2YNTwPxBw==
X-Received: by 2002:a05:6512:159e:b0:489:d127:5b38 with SMTP id bp30-20020a056512159e00b00489d1275b38mr4752696lfb.480.1657785768179;
        Thu, 14 Jul 2022 01:02:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id p17-20020a2eb991000000b0025a6da9cb86sm142898ljp.114.2022.07.14.01.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 01:02:47 -0700 (PDT)
Message-ID: <2abcefcb-92c3-713b-8087-f63cad781ba9@linaro.org>
Date:   Thu, 14 Jul 2022 10:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next RESEND] soc: qcom: icc-bwmon: Remove unnecessary
 print function dev_err()
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220714075532.104665-1-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714075532.104665-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 09:55, Yang Li wrote:
> Eliminate the follow coccicheck warning:
> ./drivers/soc/qcom/icc-bwmon.c:349:2-9: line 349 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
