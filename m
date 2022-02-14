Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFFE14B42D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 08:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241317AbiBNH2q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 02:28:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241257AbiBNH2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 02:28:45 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92583204F
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Feb 2022 23:28:37 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 043E540339
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644823716;
        bh=stPjNYKT8jIgNyF2oAsLzVlTYEd+kLoCabs8ksrQu4Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jMUvOorPXRbTgIjo4QR8OnJfJhD41D7iRu6JLBzukJQF1jiU2Y2nWVL+Q+iZnJjEn
         oWNg9FbFxvORs0j4MDeFe82rEJ0KZFXtSwXovnFPpjPw5sSOoFAKfKT9MZMdRBvabI
         Phf2HfAlqj8F6rO6e1oq6ujY983lW5M4U5tlrh1+fo52PPRqF80f2+WBiDDt2wGunr
         oBbctpjNdwymicPGTAD6qWgYxRvOf6xhvgw0Z4jjZvDgqaWftgi1KWWxdCn7ZTUYT3
         9EgTXrMlR/Sqepi8jx//r76tb7fysw2Fv1ngo6TqA2+TmAYYy2JBpCnL3T/stMMUYa
         xfDRnXpv8A9lg==
Received: by mail-ed1-f70.google.com with SMTP id m11-20020a056402430b00b00410678d119eso5264114edc.21
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Feb 2022 23:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=stPjNYKT8jIgNyF2oAsLzVlTYEd+kLoCabs8ksrQu4Y=;
        b=4uaq1I2xI7QbUMuk8IxYRCKf45sAdL6H85T8yhR0/MvA/RjBH8WbNSA26zIOLkIroS
         kh7lDDgS90u+scW98idS5xjINdw1BwU6GhPO+OBy7s1POW9yQg2WU9DXzAEHjI6Kmb+J
         lHsREis9zM6JYi/GFRlbDEBQ/AGUvpzzj55oBIVL90diVDaLxL3PCvUz8i94LHHrZU6z
         CkkkJka57upXwYxmE52OlCkoFpzlGwSZe5titTfOCbbabKbktQMaqhPSXOzs7crKfOou
         brrxSHXIEIzhXhdAFY9js7ALK+JfQcEnt2U6h4bDsojXzwk4GaAzD9QHDyaS3Q/hVo7H
         poyQ==
X-Gm-Message-State: AOAM5313xF3W6mP8jOc6D0fMiGZTuRgdrLggMDa0KnxUVQSu4/+n+FDb
        GjMY/YjwWgrQ5zgtJluU5E40Cn5CyYxSFEXoRNjq56CpDuFejgcGALwxluW5Xetm9PBxu+88Q0z
        41/gmL0ds6Xq3Z/DMdGgbyJL7ZpXglG1sHPKafJ58XQw=
X-Received: by 2002:a05:6402:51d2:: with SMTP id r18mr14335299edd.88.1644823715489;
        Sun, 13 Feb 2022 23:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzkInTRfFMDmTIqQtdD3PzZngKjB6pp383xOK8wNzWd9H/435n+6VZuhhh/TUUVZehlXzKrw==
X-Received: by 2002:a05:6402:51d2:: with SMTP id r18mr14335283edd.88.1644823715381;
        Sun, 13 Feb 2022 23:28:35 -0800 (PST)
Received: from [192.168.0.103] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n2sm10098365ejl.86.2022.02.13.23.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 23:28:34 -0800 (PST)
Message-ID: <b7dad94f-4e59-cb4b-251d-05f747bb0862@canonical.com>
Date:   Mon, 14 Feb 2022 08:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom: Add interconnects
 property
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org, swboyd@chromium.org,
        mka@chromium.org
References: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
 <1644813252-12897-2-git-send-email-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1644813252-12897-2-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2022 05:34, Sibi Sankar wrote:
> Add interconnects property to support the bandwidth requirements
> during modem bootup on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

There were several properties added within last months, so in total you
changed these bindings quite a lot. Please convert them to YAML.


Best regards,
Krzysztof
