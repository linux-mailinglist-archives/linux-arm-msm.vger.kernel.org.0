Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A90B6BA81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjCOGoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjCOGnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:43:55 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2894122C8E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:37 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id fd5so37536006edb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bOa0WQsy6rjgPrmZmoGvG+kj2BjHn9uHAJOnHryaHDE=;
        b=W53RfkmTAM+krIrvhhjC7t3aQVcpgwsBWYDxifRoEGjAQG30P46JqbEphXpWsFkX1I
         gNULgXIuqyQu+TRVwtzRSypJ6kLBZYgoP/D/uqlSrmODKjPGbDNsvXuCd2PsDMY+XLRy
         z7UDry8hpQqOCqfr+2bKY5QuaFcsP26t3LCD82uCYJmbyb/mGVDCvhTwE11E+mDKCFUt
         ATZPwiC7gp8vUa3nSR3efYYi3vAv8YGf433WGubqQqFm5t/Ten2X0j5lpj33ymhVE21r
         M3K9VQDsbjk2YJm9M4772Ygc1vBCiHXJGQOo0dgPMfbzZFBkFzAqvkuvjnNxdwa7/cOs
         cDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOa0WQsy6rjgPrmZmoGvG+kj2BjHn9uHAJOnHryaHDE=;
        b=eDbMsSgq+NHBsLE9fJdfGK0T/6TYWdT1PLcN+Um4a9j7QCEFIeUyyzXUkpqE+M1fUJ
         /Zp2RrQOOAL07Aok6dJfI9ZiUO1z38ZdVABH15ZP5jfEGnRioz3gfQMs77ymOw/Kksg+
         LFiZHphZ/aqlP4CL/dDISDXhj3nYz/BsQDxGcF8WhBe8c+HzNQstRE663ytgudgRCk6/
         JrQ83H7U2qjVoijSDcHp42CqdPTQrR/CJNvK8why2RRCSQeq2/Tiom02F3rJhrW5BPlH
         7aJln7eukmedEv8i/SM8tSJr/mgDphoUAFWaywVn572Euv87jv6JjWFnNNS/nK5xRhFi
         yZQg==
X-Gm-Message-State: AO0yUKUnXHV7b/Oass88KYcbwD6OV3PBHQV6aqidKPwVj1KDedvoWdxi
        EMxGDN7RmH9fVe4vfChYjoNzPg==
X-Google-Smtp-Source: AK7set9QKOIRDNTWFKYHPmSPe7kxYDMGZw6L5D3m/QvOiZHAwDn7nygVP4kLxb8dCZyAr0ddrJI/ag==
X-Received: by 2002:a17:906:702:b0:913:ff28:59bd with SMTP id y2-20020a170906070200b00913ff2859bdmr5220664ejb.52.1678862616630;
        Tue, 14 Mar 2023 23:43:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id n6-20020a170906724600b008ec793ac3f4sm2031952ejk.192.2023.03.14.23.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:43:36 -0700 (PDT)
Message-ID: <edaa631b-9bf7-5cc7-bd92-fe5420553fa8@linaro.org>
Date:   Wed, 15 Mar 2023 07:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add IDs for
 QCM2290/QRB2210
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230314-topic-scuba_socinfo-v1-0-acd7a7ab9d46@linaro.org>
 <20230314-topic-scuba_socinfo-v1-1-acd7a7ab9d46@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314-topic-scuba_socinfo-v1-1-acd7a7ab9d46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 22:41, Konrad Dybcio wrote:
> Add the missing IDs for scuba and its QRB variant.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

