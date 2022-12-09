Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63164866E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLIQRQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiLIQRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:17:14 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54E480A11
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:17:13 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id m14so5685849wrh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZRdjoLhiay7rKGhBjP21w5dXWZeOk3rMigjidZEkO4=;
        b=iB9SIKLbKTqAzlXxlbRhq3uNX4Bu/v5IItvffdm/E18MB436gwt9ULFqMKS2MfwaQJ
         IGEqtfZT4elCowFL2fneHxc8dd+yUCl+o4iejAD0DeAUaEfRM53Mv/s14co8Z3kycBwp
         m9UioyfWjuVQrWbocU8JJbdgaydfWbfpKcGxUCpliBLRHJIqMGEw45XbL7vMCY093Jzy
         tcDO3XCOpKej9CwsncQYoNoJSJe18iRs0bfKIvyEuTIIXsOyqjhDyNSSEeNYUgJKuGcN
         zBD7uNGV5rpYsQ9EYGf/bTfdK8YWPQQ1x26Y91ymSGSZ/raQPlvrlYp65nYNnYi9zoi0
         fCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZRdjoLhiay7rKGhBjP21w5dXWZeOk3rMigjidZEkO4=;
        b=le/ROX15zqVdvIx4c5CMsCERgmjmirypPdXoUGlM5/HLmblJOf65geUczw64Cq8QOi
         4T65udJB/rFTYbJkqi+9D65nGDnyMbCQ/vweRsBJKpmz2Lu4VuB09pcgqZViN9I9aSrA
         Gp2Pq2lJjDwbuKZgEnNdkj/XA3lRDinoiwhAoShkG5bjtoxqr2gulek8g3wM2kdR7Tk2
         OfwaKonUcJ+Wwk1/l3K67pIQ+Jj6vFECuEu9h7Cz2PeKn9Pz/bfq50Or7s4GbBhoNJoG
         G6qUKHsj2bY7ns5oH6ezXADe7EIqeIb9nSn0KZn3beCgRFlhSflnCrPHgLV3Kp8N7L/m
         edKw==
X-Gm-Message-State: ANoB5pmNvZFer4ekQZIcQaDnxce8G/GIh7oCN3/ZInigSoTlakMZLycI
        /qetFwBeq9a2rmpU07oYCal9Lg==
X-Google-Smtp-Source: AA0mqf4vzhsI46yEkAUe684II+Suu9mHaXzB3maKYETUS4UkoF8Czv/zTDQGVl9iUkNSUgIVPA8gJA==
X-Received: by 2002:adf:c7c3:0:b0:242:7a04:f49d with SMTP id y3-20020adfc7c3000000b002427a04f49dmr4592244wrg.10.1670602632264;
        Fri, 09 Dec 2022 08:17:12 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bn1-20020a056000060100b00242269c8b8esm1802841wrb.25.2022.12.09.08.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 08:17:11 -0800 (PST)
Message-ID: <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
Date:   Fri, 9 Dec 2022 16:17:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
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

On 09/12/2022 09:40, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> For v7:
> - Fix an issue with output state for different versions of the IFE
>    hardware (for platforms different from QRB5, e.g. QRB3).
> 

Yep.

Working for me on rb3 now and thank you for updating the git commit in 
patch #4.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

for the series.

---
bod
