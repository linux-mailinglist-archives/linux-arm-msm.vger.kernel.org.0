Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADA91A7C0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502652AbgDNNOJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502653AbgDNNOG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:14:06 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F844C061A0C;
        Tue, 14 Apr 2020 06:14:06 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u10so8180074lfo.8;
        Tue, 14 Apr 2020 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TwanPYDMNjwsdCZf99BwEwFxyfAbUGx0ihTeXWNRhe8=;
        b=lNzKcqtQbCw7svBeyfiCxylKZs/JH3ObkWG10wkqPNqlJxNoGQwHf7fcXBO0snOALd
         X77ccfHRCEiHrXncn/sIsPliBESv8IFf2V0++EFPVLEK2JOqnNyRcGDtRqKzMjSf8y4w
         3vMjsaryxNLGzs7zskjkiKetPDJ4tT4Fh5rPfF7eoZvgIPy/2LJrbY3kVlZz2/vLtPPD
         zPMl5jM14tvVfN9GDu0IPy2QKfrUmH6diCa99yIhTTFTCh1xyTjurfXB8kgesJJgauoM
         D4i6LwFVvpnyGzSZQ2NNUCMdi4YRhHhnNw/pCnEoUHUO5e2Z5dENIZtXPbct0O+FjJmm
         yjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TwanPYDMNjwsdCZf99BwEwFxyfAbUGx0ihTeXWNRhe8=;
        b=sL1qKFrfhvsqlXdWBxPwAduCcjU5kkqz9ANdS0GKgo9ofCHvJa4EDdOSH0pO6VTgeE
         6sykLxP46brIO6NIEaXXrKoJHRYTKPv/NcY/RlJQsoZfRZrXK0WZyWflOX7C9c+i4+k9
         3estFRTsng2qvBdjuq61SFh2x78srdgdxhz0pTTP1LYI6yZXajMy9HPsiif+Eoo/cYl3
         HcrNwTDY8U9gnoT+0pAXqhkbgKc1qgJ4OFRcKy8Trc7mTw4y9ZXU5CgjQrcQ3n0T1MJ5
         Y1LtCBA2fgvgqGq8PUG+8BnE9Q6Txrk/3NHz8tHYwRiuk1C413Nwc0PRzTT7ffnKXjoK
         LIEQ==
X-Gm-Message-State: AGi0PuZS+LfQ4CC92ljfqTFtXfnoXG107sCwNWtNyat81BpkOmyvnxva
        vY71IdgKZQv25+DXVCqMneQ=
X-Google-Smtp-Source: APiQypLa/KxVEJAuwOK/hWdTm1YU8JrHLqXCaAxUYLJM1nn3mtGtpnTVOFU77TpHqHnoVQGPtH1qFA==
X-Received: by 2002:ac2:4853:: with SMTP id 19mr13296940lfy.171.1586870044950;
        Tue, 14 Apr 2020 06:14:04 -0700 (PDT)
Received: from [192.168.86.24] ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id h14sm10658884lfm.60.2020.04.14.06.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 06:14:03 -0700 (PDT)
Subject: Re: [PATCH 0/3] regulator: max77826: Add MAX77826 support
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200414105725.GB5412@sirena.org.uk>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <f167d50f-c0d7-f359-a167-2782040ae7c3@gmail.com>
Date:   Tue, 14 Apr 2020 16:14:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414105725.GB5412@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/14/20 1:57 PM, Mark Brown wrote:
> On Mon, Apr 13, 2020 at 07:44:37PM +0300, Iskren Chernev wrote:
>> The MAX77826 is a PMIC found on the Samsung Galaxy S5 (klte) and possibly other
>> devices. It is produced by Maxim Integrated and contains 15 LDOs a buck and
>> a buck boost regulator.
>>
>> Iskren Chernev (3):
>>   regulator: max77826: Add max77826 regulator driver
>>   dt-bindings: regulator: Add document bindings for max77826
>
> Aside from the compatible string and the subject prefix on the DT
> binding patch this looks good to me.

About the subject -- I guess you mean the suffix is wrong, it should be:

  dt-bindings: regulator: Document bindings for max77826

I'll also change the compatible string.

