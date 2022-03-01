Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6FC4C870D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 09:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbiCAIuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 03:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiCAIuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 03:50:23 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E753889321
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 00:49:40 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B96B40814
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646124578;
        bh=i5oNvJtWT2nQMVMnHuzSOVOeJhkbSN882hqbqowwmW8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=AAIrOtkS6ajng30YfUdicuy261jm+GM+Jmd8mKxxNevDlyivxZKnlEWlqEwk4pJEu
         uBNVIkI1xbdd1sOs5hxBFFqOSCr7gAcn6x+hmEo/6GZzz3zu0yWGmQE4hREmkxc7CB
         AEIQbkkXOs34tLNGV5e4fyEChnKXy94nbM29xghldwvqd4SvglLds4UpCfotuV45Dt
         Jg/tBbw/FyNSSHaZVw1mcjXSqO3cSnoNKmX2d/vY65drcTmypn1MBVxHYOhDH+so1g
         UtMKYGmuzZM1w1HqAwsi32Q8fQgk0X1dt+UNbDXywxNy73/8mNE/NNJrhV/XVGAlX2
         XU1r+p0EJ4VJQ==
Received: by mail-ed1-f72.google.com with SMTP id m12-20020a056402510c00b00413298c3c42so7404099edd.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 00:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i5oNvJtWT2nQMVMnHuzSOVOeJhkbSN882hqbqowwmW8=;
        b=3NDXOaiHXN5AdLPO4gW/U8WPMpT5xpeXbtNvoLoMUVgUbMnGT0/I06KkiixyPnGq5b
         lHisVM2SnIONgBYVkYBADdwHasIzZgWe2pnAPSJAFLicdkDmHjzxWeC2ha2IO1xMlw3J
         WD5BS8lwQ+hFIV0BVqVIrzZipCoolYm4KSiMrrNCRO9d4p3sBJH79dYY/yzwveNqDNTy
         vlQG8aDpsJs6jyPB4xEun3TFPet2rhGZFyZCN9hi0Mb/8zPKVYvpUfr+pKjNipgfDy+v
         ZcBpy91oRPmuqJLNnsFqvmbR53KlWhljjdE9iBUwe2ufclDqgIpN+HeJoCqib/6h9MTu
         qFdw==
X-Gm-Message-State: AOAM532Gfws1E+T+itnOMzMZYSVOoZ2upwGOQ3H3iu07MuFsr+pNK/gu
        6CZeq+IIBxZsmH9DhBwwlidzqMm4Rz4aPI5JSLUnAPH0ZSL0tf4S20nPH77wW8wON9AYF8mxUTF
        Jw3eznas1GSIUUz54l2GTr1wRZTkQLUVWFgEgNcImxyo=
X-Received: by 2002:aa7:db47:0:b0:413:7649:c2bb with SMTP id n7-20020aa7db47000000b004137649c2bbmr18696646edt.123.1646124577530;
        Tue, 01 Mar 2022 00:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0Ji57X8BPtLBdo02/7Aw5hrJyfazNqZcwT3ns08IlVBGD/uW7vhmHoqEKLaS5kqGFV7Hlhw==
X-Received: by 2002:aa7:db47:0:b0:413:7649:c2bb with SMTP id n7-20020aa7db47000000b004137649c2bbmr18696608edt.123.1646124577357;
        Tue, 01 Mar 2022 00:49:37 -0800 (PST)
Received: from [192.168.0.136] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm6893213edr.38.2022.03.01.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 00:49:36 -0800 (PST)
Message-ID: <40d9b2ad-2f8a-42c8-54cf-b22e24d78538@canonical.com>
Date:   Tue, 1 Mar 2022 09:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/11] driver: platform: Add helper for safer setting
 of driver_override
Content-Language: en-US
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220228200326.GA516164@bhelgaas>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220228200326.GA516164@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/02/2022 21:03, Bjorn Helgaas wrote:
> On Sun, Feb 27, 2022 at 02:52:04PM +0100, Krzysztof Kozlowski wrote:
>> Several core drivers and buses expect that driver_override is a
>> dynamically allocated memory thus later they can kfree() it.
> 
>> +int driver_set_override(struct device *dev, const char **override,
>> +			const char *s, size_t len)
>> +{
>> +	const char *new, *old;
>> +	char *cp;
>> +
>> +	if (!dev || !override || !s)
>> +		return -EINVAL;
>> +
>> +	/* We need to keep extra room for a newline */
> 
> It would help a lot to extend this comment with a hint about where the
> room for a newline is needed.  It was confusing even before, but it's
> much more so now that the check is in a completely different file than
> the "show" functions that need the space.
> 

Indeed, this needs explanation.


Best regards,
Krzysztof
