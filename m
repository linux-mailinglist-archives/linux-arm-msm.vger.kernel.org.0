Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F6D54F753
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380888AbiFQMP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382003AbiFQMPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:15:24 -0400
X-Greylist: delayed 547 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Jun 2022 05:15:19 PDT
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 822003AA5F;
        Fri, 17 Jun 2022 05:15:19 -0700 (PDT)
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by proxmox1.postmarketos.org (Postfix) with ESMTPSA id B39C814004F;
        Fri, 17 Jun 2022 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1655467571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4tR7ZXn8cG3IDRdknCoHfY/3ZdWX+gDjrqxaJzHxxNc=;
        b=cJHFypmYRHP4rbudy2cLD0t+r9xHm0h7fXLJ30jN644XMtW6rWnWO3qc5qfmpWSaCCcQTL
        FQAYJw/HneKGQqleo23tKYZTryaIr6+dn/TkwOjqtpzZNsRoFsS/226OmL+1dXIIx741r2
        KBOtTed+gr8OcGD96Untx2RsJvTtNaQ=
Message-ID: <08cd3a56-451c-0ff7-0d69-add781f72e77@postmarketos.org>
Date:   Fri, 17 Jun 2022 15:06:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] arm64: dts: qcom: starqltechn: add initial device tree
 for starqltechn
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220617110130.2300438-1-dsankouski@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20220617110130.2300438-1-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> New device support - Samsung S9 (SM-G9600) phone

...

> +	model = "Samsung S9 SM-G9600";

Isn't it called "Samsung Galaxy S9" [1] and not just "Samsung S9"?

[1] https://www.gsmarena.com/samsung_galaxy_s9-8966.php

-- 
Regards
Alexey Minnekhanov
