Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40B15F41B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 13:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiJDLNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 07:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiJDLNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 07:13:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95DCBF60
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 04:13:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bp15so7146754lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=U48nHCuwfJVKxy+M03otnlg23lh/DEkiCgmArzYp2fc=;
        b=Iou5/+KSq3wDyHeUO7rKVZr/BUGu0gtPiDNO7PYMOaOxx/GyXFhUsDWCVVcluwL7FE
         47gc9L1mpEAsexFIC56rrWGEPHb/9OB7hqjz/9gu4dWaSR+CgTUBB6qTrjhPMTbuh+qN
         iMPGD7a3yW0wkD6Iulj+jb5u0wID/0ZJj3Aegn1o0QmiHmKTfmP2NMi9HOOOxDRd2FlH
         Fb7/U62xsCvsZqbnaWONbsPd/NDm96VLwsHrJtDVu8X+dyjtdG5pM/Dnjs6UuDSzabfj
         xAxczrNrrTcBPBm30BMduDkzfeU0XU1yeIoPRIDm5trLTIBdN6vhPmViu6lhTA7QHZkX
         IBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U48nHCuwfJVKxy+M03otnlg23lh/DEkiCgmArzYp2fc=;
        b=kYa95jOYB0SihVSc8mRywkdo2gZeay4XSRhjUuYg++G71AyKpuQCUMPBoG4+Mu2guM
         W0TTwk0FPu9VPhIGw7F1HTybsJiiyvj5EnSVRQ+jrpQUSLObLYqi4VMQutF+r1Fy6Gc1
         cFXhAoc4wmtDf2WNQwjSQHyri/KfqUvn2ra7+HL06pEi8CRbpNT0M5CdbSulu1lR5GsJ
         brx+W41/Sf+h4SQD8qobE6sd56OZuUpUipiyWRJJo08WKGTAB6gGPqqi096bIya8Exav
         YKKiA7+GbZrKI5qtHyfsQsB1bZrVFgdUojpDXg6B2lbc41CRMwki19OvvtwnUkt1Khm+
         Mk7w==
X-Gm-Message-State: ACrzQf0Zk9moVh5R5FtUS9sqyw7CWon9V5gRDq86sBtNX4mrmSRYOsV3
        NQXITDBJxUJ5dBohmfqV46eqqw==
X-Google-Smtp-Source: AMsMyM6gHLkVh3BFnvREOQi+Gw9qlmbmEUsbKuY/7jb/V0P9+aSplnsb5abw1FojWDXV1drMbuH3hw==
X-Received: by 2002:a05:6512:3986:b0:49f:480f:c9d5 with SMTP id j6-20020a056512398600b0049f480fc9d5mr8303333lfu.445.1664881995156;
        Tue, 04 Oct 2022 04:13:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s7-20020a2eb8c7000000b0026ddf39da47sm619146ljp.81.2022.10.04.04.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 04:13:14 -0700 (PDT)
Message-ID: <942cb83c-a483-df4b-9b08-9bdbc7fc3601@linaro.org>
Date:   Tue, 4 Oct 2022 13:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221003194315.943903-1-dsankouski@gmail.com>
 <20221003194315.943903-3-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003194315.943903-3-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2022 21:43, Dzmitry Sankouski wrote:
> 
> add xiaomi,sagit board (Xiaomi Mi 6) binding

NAK, still wrong. Apply comments from v3 and do not send more than one
version per day.

Best regards,
Krzysztof

