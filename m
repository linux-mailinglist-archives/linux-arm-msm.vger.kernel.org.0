Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2462427A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgHLJcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 05:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgHLJcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 05:32:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAB8C06174A;
        Wed, 12 Aug 2020 02:32:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v9so1467136ljk.6;
        Wed, 12 Aug 2020 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ikRO5317g1JTomZhkPieEwMdPdc6yb7MWeGDygUVu/Y=;
        b=vUyHDSQQkg+zffYc5aA+4vVtl6rhVC0g/fpJmdxy0gIbFlEQXiGCpnItPScFwzGAop
         rosPSHex6qTHBb5Si00mD9g20pFu5uYcAOsOi/N7vBXOBEL4wL9XFkZkxFHmoIz2/kQ8
         n4+OvlfzbX8kD77eWHuXrZX3CixsJd0xAdvmsgXOY4tjyG4ZhQO0gJlTWZLlcWK+twha
         XfKf0T5D0i6RoDacqbwaA7ELtkt14WUF00/qbr+9UneI65GjixwJj3nFF4HPKkWGJm/k
         U1isUxGpWlERfWu2wBSRlAm8D8EWBL/6ZpvZHTMSuNu5rW4oyq48FTa+FAWy1ijZbHZI
         q/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ikRO5317g1JTomZhkPieEwMdPdc6yb7MWeGDygUVu/Y=;
        b=R4nbTdgZXLzPdpCPXpM3g4enwddY+6aG7/kH35gUZbjGG43ZK1ntswQxorYZPxGN9J
         KD/28NMFRTxn05WdN1jjaWCa8vaQbLz/KmXEnlp56zpvYLaza/USvQ4KpGZNpCrXotnR
         /cBdF4wK3hAXrU8Isk31NtKeAoA16+019FksUr50HOrlaDJovGLtfGLUOfeuPZ5EFelK
         jyENR19KlulWHt3x7k6BwYM2oBnVbk1yRHtQcRahTqoUR7w5i2B2bomryUecKnFuMWj5
         5WGf+qUGzw0zMIKKf7d1yUNpgkIFRMKITKyuh3qUBxdi7BTdYujPJEcEc8Bk+CqhiWVv
         lGQA==
X-Gm-Message-State: AOAM532Q7qnsy7PpopOqw6Dsr2RzZCKWgSVNkpokDr7KvOlNKyCnEwFt
        eOGWP+h4rgkiVuXOPNaozJ0=
X-Google-Smtp-Source: ABdhPJzr8SlpLA4gz+moz1FILxb2p8bIze9B0/QqnNBGx/GDRP+DopWHZPwBQofemKUkLLZkJBZwDA==
X-Received: by 2002:a2e:2c18:: with SMTP id s24mr4675952ljs.260.1597224764335;
        Wed, 12 Aug 2020 02:32:44 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id p9sm320265ljg.76.2020.08.12.02.32.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 02:32:43 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     "Sandeep Maheswaram \(Temp\)" <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <322d193c-d4d2-789b-ffec-ebdee2730c1e@codeaurora.org>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org> <1595869597-26049-2-git-send-email-sanm@codeaurora.org> <20200727192050.GD3191083@google.com> <cd5c6c99-d8ee-da59-1abf-e64e5f7f6f8f@codeaurora.org> <87v9honyff.fsf@kernel.org> <322d193c-d4d2-789b-ffec-ebdee2730c1e@codeaurora.org>
Date:   Wed, 12 Aug 2020 12:32:38 +0300
Message-ID: <87sgcsnr9l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"Sandeep Maheswaram (Temp)" <sanm@codeaurora.org> writes:

> Hi
>
> On 8/12/2020 12:27 PM, Felipe Balbi wrote:
>> "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org> writes:
>>
>>> Hi Felipe,
>>>
>>> On 7/28/2020 12:50 AM, Matthias Kaehlcke wrote:
>>>> On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
>>>>> Add interconnect support in dwc3-qcom driver to vote for bus
>>>>> bandwidth.
>>>>>
>>>>> This requires for two different paths - from USB to
>>>>> DDR. The other is from APPS to USB.
>>>>>
>>>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>>>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>>> Please ack if you are ok with this patch.
>> What's the plan to get this upstream? Should I take dwc3-qcom patch and
>> ignore the rest? Is there a hard-dependency on something else?
> Yes take dwc3-qcom patch only,the dt change is already in linux-next.

Thanks for confirming :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8ztzYACgkQzL64meEa
mQZqww/+Nh/OyjjF70wAKlgxreYyvAeXNRcYmLwKx8SenVcwYn3xsDNr5zck42Of
4ImN2g/80ArjbgxHdXKpsvkly6wy1I8FX+WZj4jzp1pRo3XCR0Nccts+t1ETt+4j
FEmzRMlzu4KDBVixhUUC+8YNpmPcG1pdJky5usr+5OQpx8PwuhSCKp3tjWAYkgiH
w9SaCl8V78iUYJ0XdkEfmsf77r2gw4lpbcohpWkWaTZAWsQ2JITEEsDAYxP4YVm2
Jrl3JmTRC/gTEMyYNlf0oNv6Sb8XKQROYT7EfVDHVkMuDUbP9QphQAsVFvgGJ0ZW
O+zjG2yraLzMmwcZ+5wpWUh/i89+aBEOJBYsXB6GYO5ut27brckPQUR992IeE7ZS
jzdQi3bLe2t5K1Be2y9VPNkaKhu3sdVB/WvhxLf4mjrdlW76nLKwyy+tx9LeLX6Q
G30fBJwRdk1BmKfF6slk36GEhnpb+yU6x6+CqE9Z2Yod6hLSVAVfuJVimiBp/5dy
JWQqx6ubA6ZTskM7lgI1e3W8u1HEQPcGLdwuUJKKKjITa5OECe1h+F5hxaltF6Y5
BJ9+0DUehwBVWCVXeByC7cOCAXpDJ8u2qBofHnLSATMMp1wo7f3yEUpETboPwbTu
xP09hkyCTMYR1d61hhvsG897UkAalAu8sZQCRukbM0yOos2lFFM=
=UTp+
-----END PGP SIGNATURE-----
--=-=-=--
