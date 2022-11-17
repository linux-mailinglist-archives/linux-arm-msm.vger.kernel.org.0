Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE39F62D920
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 12:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbiKQLNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 06:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239378AbiKQLMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 06:12:54 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D6F6D48F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:12:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id be13so2261703lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3PS+VtSrFrxLksaUjnv7uLieMcy5jFloUEXJRVxtOw=;
        b=dWMhfGpYSMRZJAxIILk4u5bI3xKHNpB9c8PUTWjK131B/VgIL8hqAbEfGulPqqM5It
         1p9LZFgipPZkjqITTGFLt91nhdzY+NI6Y6AeU6jL2KIvSA2m/n5ofvO15gkfD2GA9Acx
         NOuyF2A5Yw/vaypN6gXmPzzH6jhw7KY+r4eOzoaHt55o4o8Q+Bns6mFoR4GW2j+0eXVf
         7wuVSgL/uBUbnndzuTIE4SXhg6RBndCsY8eH/lldeBJiJwV9Ei+zrXn6KywDaN9fjTyc
         kDsfGeHJGEzvPYdUhZgUaZ+a9zuJWKOwZ1AX60FX1dzFQq7/ufkBqwxYzyKQj3mdR8Ke
         m4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3PS+VtSrFrxLksaUjnv7uLieMcy5jFloUEXJRVxtOw=;
        b=O212DfPYIiTS3bbRN6tc8LgmPSDtAKSw+xe9tI/2lNm+grKXO7dLMrgScGCud+Ccv3
         xkb8mpJcsQrQ1rlmdLR7t+eaMiGoD4kI04HxvljP1GiVbyW8nCkeh9jPdEM3sEbGRFTw
         5thwxk1bo2LVu/Z5oilkkUmOpV8cFrK+8TzB+6SgNBg1BBPlLmVl27LVtkZH+OiLoIlv
         bgBAC9bfWpZ7lVIcA5VJDgBeqU6201ywQTfNety9DFla3pd7MxtRuO97EiydE966UYYn
         B0zsvn7l//MGTWqX2JFjLBlBRM88p45OThm+S6KZSI65wV9U4nU3M8iZj4QUhVqvpy6T
         YQtQ==
X-Gm-Message-State: ANoB5pldiLw/XhjEs/MhJR8hMcJssSLyIQWRQhT6EgDHu7ninbbxw3k4
        e2XWj/bF7KrH5Ywxc8TsWKMAyA==
X-Google-Smtp-Source: AA0mqf5N4xGvnBI+PoB5w8yEjy1UI3IH54OWh4czbWfAtjvgFBUfw9FYA92M5a7b3uV7o7xGW8+3hQ==
X-Received: by 2002:a05:6512:3c83:b0:4a2:3a78:106d with SMTP id h3-20020a0565123c8300b004a23a78106dmr677594lfv.419.1668683534199;
        Thu, 17 Nov 2022 03:12:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m22-20020a0565120a9600b004a608ec6d8csm102436lfu.27.2022.11.17.03.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 03:12:13 -0800 (PST)
Message-ID: <ebd7e9f1-da9b-253d-0053-2327fd86e7f1@linaro.org>
Date:   Thu, 17 Nov 2022 12:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] qcom: add basic interconnect support to UFS
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20221117104957.254648-1-bmasney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117104957.254648-1-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/11/2022 11:49, Brian Masney wrote:
> This patch set adds very basic support for the interconnect framework
> to the Qualcomm portion of the UFS framework since the firmware on
> these platforms expects the interconnect votes to be present. The
> maximum throughput is requested to match what's already done in a few
> other drivers.
> 
> Here's the relevant entries from the interconnect_summary file in
> debugfs that shows the two ICC paths are setup for the first UFS
> host controller on the SA8540p automotive board (sc8280xp).

I wonder whether this is solving the same or orthogonal problem as my
old patchset here:

https://lore.kernel.org/all/20220513061347.46480-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

