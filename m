Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDB21B5C07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 14:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgDWM7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 08:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726685AbgDWM7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 08:59:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9869FC08E934;
        Thu, 23 Apr 2020 05:59:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w20so6125854ljj.0;
        Thu, 23 Apr 2020 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TN99Pfmiq67M57+79MTqUBODg0E96SLf0DqAJRctnww=;
        b=Y7szCwfP00+3Qlg7PqYuLdN9pvRAG5rPi36oGFARP6hAxfks6vJ0kpRHrizJgIrHF6
         +UOlyB/xifKw9H7Mjcps0orGTWKYpMe+b2jXNBXalqRLyO+qFvL0kNCGGKNEIlLQfsM1
         oxn6EQdGdDVBxeI9tubCehhS8YIpVcsdHyMNNsl7VNii6OWYy2gs4q8qujKja7ACMQH3
         +j9/D7IpTgAJjwqSf/ppkZdnLthHFH1bdNwPS0d+FQJ9yeceJiubSx+RXkt4dD48AIE5
         e+HAEFNT5/Ij1cmwM3z4eePkajZhzY43MbZNCpqFobUCWnSIoaYlfJtP+82uIDyVhNVY
         EljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TN99Pfmiq67M57+79MTqUBODg0E96SLf0DqAJRctnww=;
        b=t25YQdXVk2EHIHVj7IOKMUirqmtSBBfBE8bnKVUIyabg8B+Tqb42RahQAxLJHHlUFU
         nL9f4dra+bKME7YeqKquJy/sIhOKDqWxDw8r4I1udgw/833ZDG0UwzBuizroY+YX6s2c
         hkrUS7vwlVD9buMcgCeu2xzFlhyz+EOkBeN8rKmhhbdn8Bwwi8YK1vVVjP+Dsprh/dbE
         4df4nxKvnCiZi7KwSifk01QkfP4QGeSu8ix2X0dWySMlMmYSXBX0EqpPkpAmZZBKjPXB
         RtFggnj0bTmeo1kJM9peeNmmidgnCxRdCALupkRIfxmc3hBdOeKaK0ZHaBsWyqTviRn4
         eDwA==
X-Gm-Message-State: AGi0PubYuxxy7FcthNNqgvVz4A8Wu7A6SIcd0fP60Cg7gmuD+yV2i/3D
        ufP67GfFByF8UPGUeOFvHok=
X-Google-Smtp-Source: APiQypJvxNBM10jzGJWdYX4cOhGpXVsnIxYhehXKPyLCRAfn/4qjISIb1q3Uqffmq65KRop51bILWQ==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr2348976ljp.164.1587646778073;
        Thu, 23 Apr 2020 05:59:38 -0700 (PDT)
Received: from [192.168.86.24] ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id q19sm1709346ljj.84.2020.04.23.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 05:59:36 -0700 (PDT)
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add document bindings for
 max77826
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200413164440.1138178-3-iskren.chernev@gmail.com>
 <20200420205501.GA6828@bogus>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <f9b5d68d-536b-5806-573b-9dafb848f46f@gmail.com>
Date:   Thu, 23 Apr 2020 15:59:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420205501.GA6828@bogus>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/20/20 11:55 PM, Rob Herring wrote:
> On Mon, Apr 13, 2020 at 07:44:39PM +0300, Iskren Chernev wrote:
>> +    patternProperties:
>> +      "^LDO([1-9]|1[0-5])$":
>> +        type: object
>> +        allOf:
>> +          - $ref: regulator.yaml#
>> +
>> +      "^BUCK|BUCKBOOST$":
>> +        type: object
>> +        allOf:
>> +          - $ref: regulator.yaml#
>> +
>> +      additionalProperties: false
>
> You are defining a property called 'additionalProperties'. This one
> should be dropped because additionalProperties doesn't work with a $ref.
>

I got the idea from mps,mpq7920.yaml. It has additionalProperties in the
exact same places that I do. Also bd718(28|37|47).yaml seem to use
additionalProperties inside patternProperties. Shall I modify it as well?

I couldn't find the core schema for this yaml:
http://devicetree.org/meta-schemas/core.yaml (gives 404).  Is there a way
to verify the validity of the yaml?

Also, this patch is already merged in linux-next. I guess I shall submit
a new patch with the fixes standalone?

