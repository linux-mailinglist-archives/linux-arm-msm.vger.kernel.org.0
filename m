Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE9D68C5BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 19:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjBFS3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 13:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBFS3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 13:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4C724103
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675708117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aE0G6LDX8lXDW0wtXNhk8AO/NAPHw5W1SphgReObSVQ=;
        b=gv4xCoHXjmCVfzcBj88S0V0f9F+UFWC84ebkhcYy08s41nQjAcUoTzMeF+9jWhB71jV98H
        mcapMcDC+fmkeIX0ycvguMEcZtqUS4a6ByCLN7h2CubqXLrpUzlLxta+K6wKcfqUeV3ntr
        2RzJF+IljUuGLdDPbdd/31VcGugYAqs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-g5HM6QxVNc-slnADFRBjPw-1; Mon, 06 Feb 2023 13:28:26 -0500
X-MC-Unique: g5HM6QxVNc-slnADFRBjPw-1
Received: by mail-il1-f200.google.com with SMTP id s12-20020a92cb0c000000b00313ceced13aso1553147ilo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 10:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aE0G6LDX8lXDW0wtXNhk8AO/NAPHw5W1SphgReObSVQ=;
        b=YOztS8bR+PGUgivIE2qof6CeM5Oxtpc1z4MVLcBhJKAdB/5jV4iEPrD/jXJbjDQ6dG
         MC+iK0PXfgo7RUsEPqlmblsx5W/9t6qiJQX+So9KtlMGFKBToKKY7EDhgpSLaAmfgnJR
         s1hSNmtEJrT+2PbNvyhehuuEVmaVWMSZWR1HkaJm8Fi77Bkg6+zXKKMY8fL+fThcV/e6
         7v2HQ7ouZQeKScxr5hSmj3ugc4MKOiQ4TqrpxvRjwyimerZOLTPs06JM2phUONdR2LZq
         CWN5U5cGMcmOqeNKYl80O9hqrdrTuk+KhbSWYcwzoqp96KXG39XOxqMXhCizRRksxu25
         DL2w==
X-Gm-Message-State: AO0yUKU2yiipzD7Ku54YFeXBodp8EVoTXAf+1Bqm8KRBR84jjXn2kkw5
        q+ykyde+PUvkTmTUpqAFng74aayB98+z4BgtAIoH6Kf0qkQ71veMi1s6vsGIwD9pSSRtldKQNDz
        AOd6erTRO2wWy857uepKWDILyhw==
X-Received: by 2002:a05:6e02:674:b0:310:9798:a26 with SMTP id l20-20020a056e02067400b0031097980a26mr134564ilt.20.1675708105898;
        Mon, 06 Feb 2023 10:28:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/L3GshufTUSqipkhjjiZm+JjTxzP+SJFCkecxkJOuVFkOZ6xWbXOwXxcoTePIVAt8uHmx+4Q==
X-Received: by 2002:a05:6e02:674:b0:310:9798:a26 with SMTP id l20-20020a056e02067400b0031097980a26mr134550ilt.20.1675708105706;
        Mon, 06 Feb 2023 10:28:25 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id i17-20020a056e020d9100b00310ce3dd5b1sm3487877ilj.60.2023.02.06.10.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:28:25 -0800 (PST)
Date:   Mon, 6 Feb 2023 13:28:23 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v2 2/3] power: supply: Add Lenovo Yoga C630 EC driver
Message-ID: <Y+FGxylqBLRA+Um4@x1>
References: <20230205152809.2233436-1-dmitry.baryshkov@linaro.org>
 <20230205152809.2233436-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205152809.2233436-3-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 05, 2023 at 05:28:08PM +0200, Dmitry Baryshkov wrote:
> +static int yoga_c630_ec_adpt_get_property(struct power_supply *psy,
> +					  enum power_supply_property psp,
> +					  union power_supply_propval *val)
> +{
> +	struct yoga_c630_ec *ec = power_supply_get_drvdata(psy);
> +	int rc = 0;
> +
> +	yoga_c630_ec_update_adapter_status(ec);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		val->intval = ec->adapter_online;
> +		break;
> +	default:
> +		rc = -EINVAL;
> +		break;
> +	}
> +
> +	return rc;

You can simplify this function by getting rid of the switch statement
and rc variable:

	if (psp == POWER_SUPPLY_PROP_ONLINE) {
		val->intval = ec->adapter_online;
		return 0;
	}

	return -EINVAL;

Brian

