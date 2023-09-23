Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744EE7AC427
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 19:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjIWRqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 13:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbjIWRqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 13:46:11 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A936A194
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 10:46:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-532bf1943ebso4752761a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695491163; x=1696095963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpKk21cNUHADpHved85Mc4llwz1lMTxoOCJMbiwCyKA=;
        b=jUveVYLaTDRThjLRrEMWOdk4MUEuUdHNVyFxMLDdVcSan3R4wxY99zm6zUXXYPfuiU
         Q1W9kKabVn/u3RArr+6yf7MEJGQp9WQREuL0iUyLo9Q1rbk3B2Uc+6xihquUiP8EziIa
         sgdgnHYVReK9uqiTWRNlyCwaaTWZitmxTka2T1F3NF3BPA0qjiouExjNckDijPLigfCq
         i7CIJKm1m9fuQapqlh9fHK8tUv+FPt8X6RYSx3N4Iqy8vnDErO6CGtk110Oz5WyX7mat
         g8cO2d3dRygZeP9whkCKVTJF/TBkwOvGoM/L15+ZQdPu/0S8BeNq0lLH39SutSYzmQy5
         0H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695491163; x=1696095963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpKk21cNUHADpHved85Mc4llwz1lMTxoOCJMbiwCyKA=;
        b=DAEv5UoZK4FUZ9NSvNUEFKK+KODsL3AacTqaUeIj3n/YhIzSLnzQ3qiIXilbDv4FQ9
         V9CaoiGbkhfHGRg3IZ6h4hu39MGOGnmUB5FTvKwz/cSz/w46DzHD/7ikMHBj33xOoGVi
         GCKLoYEX9O1pxxvaqFGSk8acsJ0dB5LTFwkHz2lbauAy/DTOwLodVyQ3dKUNdeSAfw0V
         R7CR7e4xM5opMwXYoRaRrFdDqj3HyUPbbjC6BgWM6sB9PX1vauCVVyluLgWciHEK6bqE
         UGujZeT9qR4PVTAmKCoEveX899MJCHoyKWcjBc9HOWNgftwnfh7uEkrdX9C0BGsp6NWP
         Xu5A==
X-Gm-Message-State: AOJu0Yya1fsKbNUwuI/dOFRBLka+TXEJSJQNzA6NKbOlShTHSNSQbebH
        /rYiPR/qSBLvd85+lVFEDBdLHg==
X-Google-Smtp-Source: AGHT+IH8Pla4hYyuJwWIentvI+uehMgSIzlegcxu0whiArY0JoahjPG0a7PfV5DHuPn+yhBHqV6FRA==
X-Received: by 2002:aa7:c318:0:b0:525:442b:6068 with SMTP id l24-20020aa7c318000000b00525442b6068mr2340355edq.13.1695491163142;
        Sat, 23 Sep 2023 10:46:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id fi9-20020a056402550900b00533bab9d9f1sm962586edb.1.2023.09.23.10.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:46:02 -0700 (PDT)
Message-ID: <8d7672a6-67e9-f983-b22f-37f1ee47f125@linaro.org>
Date:   Sat, 23 Sep 2023 19:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/3] dt-bindings: reserved-memory: rmtfs: Allow guard
 pages
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230920-rmtfs-mem-guard-pages-v3-0-305b37219b78@quicinc.com>
 <20230920-rmtfs-mem-guard-pages-v3-1-305b37219b78@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920-rmtfs-mem-guard-pages-v3-1-305b37219b78@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2023 04:37, Bjorn Andersson wrote:
> On some Qualcomm platforms the firwmare, or hardware, does not
> gracefully handle memory protection of the rmtfs memory region when
> placed adjacent to other protected region. Some DeviceTree authors have
> worked around this issue by explicitly reserving the space around the
> region, but this prevents such author to use rely on the OS to place the
> region, through the use of "size" (instead of a fixed location).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +
> +      When this is set, the first and last 4kB should be left unused, and the
> +      effective size of the region will thereby shrink with 8kB.

Maybe we should not reference the actual size (4 and 8 kB), but rather
page - "the first and last pages in mapping should be left unused ..." etc?



Best regards,
Krzysztof

