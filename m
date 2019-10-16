Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83AEFD8A63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 10:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404022AbfJPIAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 04:00:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54366 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404021AbfJPIAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 04:00:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id p7so1741356wmp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gGIHYdmRjg5m41qmmxsUTXNEd4XhPx2gZ2QzRYnj4Ig=;
        b=UbgG/q5JESdWdQZPyXWMMCtWRpIvmcLTYil3JaLVrUNp2JPYB7X83n1HIPOdpDSmVG
         OQ/1zfcWlodfPLHP2H1RVdFjFAfgaDwWdXLZlli8sgBA/8fq37XfjQRt4l33SAGuKFqG
         wzRdByPS78l0QHgpEgkWhrL/0EV+C6oDDRarfqeEq6JHXibZtBj5SU/CMtFn1rBhYte4
         FehHZGuOf3c3Idh2eU3T+gQvHj67b2fGeQKHCuKIBv6xjofpGnCTRDstEGPsFnEjoC8b
         /0Dyw+UgkF1XDJ2cEQOvP3QnB4EJh8OveOSkSy/n0z+l2iutfPWQOm8JmuncF/Ge9xpA
         /ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gGIHYdmRjg5m41qmmxsUTXNEd4XhPx2gZ2QzRYnj4Ig=;
        b=Khljly927Ra9oSW/BAkK+x6r/Dad/EcU/RfIhFI8JYFabaSdnmqVww0wcMHoeNOt3q
         tGy1kMwnFHVJcUBTiXaOC9DVroaxdJ9Kcy+d2rYjsjr5U2hj4MCzAYndOfqUFnf2U0DN
         0U+Liiyi57bKiYC/ZhVbSh0wOlXa3w7ggnjKRXJd5Ii80U1YZRhUkBjwHGxvArLON5eE
         aHgO9k0Z/wnM0QQrUriJObrn1r2OONp3OjfCgDIXvhcB2nchElQry1ujgIz8hY1INwJu
         843dd1SkNeOKASyf7HPumTs/P+jPuuho6ElnE5tmJo8BCXwc0hgEyw3APcQ5oiH3st7J
         Xl8g==
X-Gm-Message-State: APjAAAVGQNLuVHjitN33c0KdsxHnizibKJkJaccyiGnRMZ14fSaurvLB
        IRCG4+4WfaV57GbkRvp7pbLB1Q==
X-Google-Smtp-Source: APXvYqzYEdn3fbh38uQrD1Vjq+iTc2nIJUF9BD+5AUw3tCLJagwim6R86OA20DlyjP8JxOWrAcrozg==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr2047516wmt.108.1571212795369;
        Wed, 16 Oct 2019 00:59:55 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:75dd:9b83:7d04:b72e? ([2a01:e34:ed2f:f020:75dd:9b83:7d04:b72e])
        by smtp.googlemail.com with ESMTPSA id o18sm5426512wrm.11.2019.10.16.00.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 00:59:54 -0700 (PDT)
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1571210269.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 mQINBFv/yykBEADDdW8RZu7iZILSf3zxq5y8YdaeyZjI/MaqgnvG/c3WjFaunoTMspeusiFE
 sXvtg3ehTOoyD0oFjKkHaia1Zpa1m/gnNdT/WvTveLfGA1gH+yGes2Sr53Ht8hWYZFYMZc8V
 2pbSKh8wepq4g8r5YI1XUy9YbcTdj5mVrTklyGWA49NOeJz2QbfytMT3DJmk40LqwK6CCSU0
 9Ed8n0a+vevmQoRZJEd3Y1qXn2XHys0F6OHCC+VLENqNNZXdZE9E+b3FFW0lk49oLTzLRNIq
 0wHeR1H54RffhLQAor2+4kSSu8mW5qB0n5Eb/zXJZZ/bRiXmT8kNg85UdYhvf03ZAsp3qxcr
 xMfMsC7m3+ADOtW90rNNLZnRvjhsYNrGIKH8Ub0UKXFXibHbafSuq7RqyRQzt01Ud8CAtq+w
 P9EftUysLtovGpLSpGDO5zQ++4ZGVygdYFr318aGDqCljKAKZ9hYgRimPBToDedho1S1uE6F
 6YiBFnI3ry9+/KUnEP6L8Sfezwy7fp2JUNkUr41QF76nz43tl7oersrLxHzj2dYfWUAZWXva
 wW4IKF5sOPFMMgxoOJovSWqwh1b7hqI+nDlD3mmVMd20VyE9W7AgTIsvDxWUnMPvww5iExlY
 eIC0Wj9K4UqSYBOHcUPrVOKTcsBVPQA6SAMJlt82/v5l4J0pSQARAQABtCpEYW5pZWwgTGV6
 Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz6JAlcEEwEIAEECGwEFCwkIBwIGFQoJ
 CAsCBBYCAwECHgECF4ACGQEWIQQk1ibyU76eh+bOW/SP9LjScWdVJwUCXAkeagUJDRnjhwAK
 CRCP9LjScWdVJ+vYEACStDg7is2JdE7xz1PFu7jnrlOzoITfw05BurgJMqlvoiFYt9tEeUMl
 zdU2+r0cevsmepqSUVuUvXztN8HA/Ep2vccmWnCXzlE56X1AK7PRRdaQd1SK/eVsJVaKbQTr
 ii0wjbs6AU1uo0LdLINLjwwItnQ83/ttbf1LheyN8yknlch7jn6H6J2A/ORZECTfJbG4ecVr
 7AEm4A/G5nyPO4BG7dMKtjQ+crl/pSSuxV+JTDuoEWUO+YOClg6azjv8Onm0cQ46x9JRtahw
 YmXdIXD6NsJHmMG9bKmVI0I7o5Q4XL52X6QxkeMi8+VhvqXXIkIZeizZe5XLTYUvFHLdexzX
 Xze0LwLpmMObFLifjziJQsLP2lWwOfg6ZiH8z8eQJFB8bYTSMqmfTulB61YO0mhd676q17Y7
 Z7u3md3CLH7rh61wU1g7FcLm9p5tXXWWaAud9Aa2kne2O3sirO0+JhsKbItz3d9yXuWgv6w3
 heOIF0b91JyrY6tjz42hvyjxtHywRr4cdAEQa2S7HeQkw48BQOG6PqQ9d3FYU34pt3WFJ19V
 A5qqAiEjqc4N0uPkC79W32yLGdyg0EEe8v0Uhs3CxM9euGg37kr5fujMm+akMtR1ENITo+UI
 fgsxdwjBD5lNb/UGodU4QvPipB/xx4zz7pS5+2jGimfLeoe7mgGJxrkBDQRb/8z6AQgAvSkg
 5w7dVCSbpP6nXc+i8OBz59aq8kuL3YpxT9RXE/y45IFUVuSc2kuUj683rEEgyD7XCf4QKzOw
 +XgnJcKFQiACpYAowhF/XNkMPQFspPNM1ChnIL5KWJdTp0DhW+WBeCnyCQ2pzeCzQlS/qfs3
 dMLzzm9qCDrrDh/aEegMMZFO+reIgPZnInAcbHj3xUhz8p2dkExRMTnLry8XXkiMu9WpchHy
 XXWYxXbMnHkSRuT00lUfZAkYpMP7La2UudC/Uw9WqGuAQzTqhvE1kSQe0e11Uc+PqceLRHA2
 bq/wz0cGriUrcCrnkzRmzYLoGXQHqRuZazMZn2/pSIMZdDxLbwARAQABiQI2BBgBCAAgFiEE
 JNYm8lO+nofmzlv0j/S40nFnVScFAlv/zPoCGwwACgkQj/S40nFnVSf4OhAAhWJPjgUu6VfS
 mV53AUGIyqpOynPvSaMoGJzhNsDeNUDfV5dEZN8K4qjuz2CTNvGIyt4DE/IJbtasvi5dW4wW
 Fl85bF6xeLM0qpCaZtXAsU5gzp3uT7ut++nTPYW+CpfYIlIpyOIzVAmw7rZbfgsId2Lj7g1w
 QCjvGHw19mq85/wiEiZZNHeJQ3GuAr/uMoiaRBnf6wVcdpUTFMXlkE8/tYHPWbW0YKcKFwJ3
 uIsNxZUe6coNzYnL0d9GK2fkDoqKfKbFjNhW9TygfeL2Qhk949jMGQudFS3zlwvN9wwVaC0i
 KC/D303DiTnB0WFPT8CltMAZSbQ1WEWfwqxhY26di3k9pj+X3BfOmDL9GBlnRTSgwjqjqzpG
 VZsWouuTfXd9ZPPzvYdUBrlTKgojk1C8v4fhSqb+ard+bZcwNp8Tzl/EI9ygw6lYEATGCUYI
 Wco+fjehCgG1FWvWavMU+jLNs8/8uwj1u+BtRpWFj4ug/VaDDIuiApKPwl1Ge+zoC7TLMtyb
 c00W5/8EckjmNgLDIINEsOsidMH61ZOlwDKCxo2lbV+Ij078KHBIY76zuHlwonEQaHLCAdqm
 WiI95pYZNruAJEqZCpvXDdClmBVMZRDRePzSljCvoHxn7ArEt3F14mabn2RRq/hqB8IhC6ny
 xAEPQIZaxxginIFYEziOjR65AQ0EW//NCAEIALcJqSmQdkt04vIBD12dryF6WcVWYvVwhspt
 RlZbZ/NZ6nzarzEYPFcXaYOZCOCv+Xtm6hB8fh5XHd7Y8CWuZNDVp3ozuqwTkzQuux/aVdNb
 Fe4VNeKGN2FK1aNlguAXJNCDNRCpWgRHuU3rWwGUMgentJogARvxfex2/RV/5mzYG/N1DJKt
 F7g1zEcQD3JtK6WOwZXd+NDyke3tdG7vsNRFjMDkV4046bOOh1BKbWYu8nL3UtWBxhWKx3Pu
 1VOBUVwL2MJKW6umk+WqUNgYc2bjelgcTSdz4A6ZhJxstUO4IUfjvYRjoqle+dQcx1u+mmCn
 8EdKJlbAoR4NUFZy7WUAEQEAAYkDbAQYAQgAIBYhBCTWJvJTvp6H5s5b9I/0uNJxZ1UnBQJb
 /80IAhsCAUAJEI/0uNJxZ1UnwHQgBBkBCAAdFiEEGn3N4YVz0WNVyHskqDIjiipP6E8FAlv/
 zQgACgkQqDIjiipP6E+FuggAl6lkO7BhTkrRbFhrcjCm0bEoYWnCkQtX9YFvElQeA7MhxznO
 BY/r1q2Uf6Ifr3YGEkLnME/tQQzUwznydM94CtRJ8KDSa1CxOseEsKq6B38xJtjgYSxNdgQb
 EIfCzUHIGfk94AFKPdV6pqqSU5VpPUagF+JxiAkoEPOdFiQCULFNRLMsOtG7yp8uSyJRp6Tz
 cQ+0+1QyX1krcHBUlNlvfdmL9DM+umPtbS9F6oRph15mvKVYiPObI1z8ymHoc68ReWjhUuHc
 IDQs4w9rJVAyLypQ0p+ySDcTc+AmPP6PGUayIHYX63Q0KhJFgpr1wH0pHKpC78DPtX1a7HGM
 7MqzQ4NbD/4oLKKwByrIp12wLpSe3gDQPxLpfGgsJs6BBuAGVdkrdfIx2e6ENnwDoF0Veeji
 BGrVmjVgLUWV9nUP92zpyByzd8HkRSPNZNlisU4gnz1tKhQl+j6G/l2lDYsqKeRG55TXbu9M
 LqJYccPJ85B0PXcy63fL9U5DTysmxKQ5RgaxcxIZCM528ULFQs3dfEx5euWTWnnh7pN30RLg
 a+0AjSGd886Bh0kT1Dznrite0dzYlTHlacbITZG84yRk/gS7DkYQdjL8zgFr/pxH5CbYJDk0
 tYUhisTESeesbvWSPO5uNqqy1dAFw+dqRcF5gXIh3NKX0gqiAA87NM7nL5ym/CNpJ7z7nRC8
 qePOXubgouxumi5RQs1+crBmCDa/AyJHKdG2mqCt9fx5EPbDpw6Zzx7hgURh4ikHoS7/tLjK
 iqWjuat8/HWc01yEd8rtkGuUcMqbCi1XhcAmkaOnX8FYscMRoyyMrWClRZEQRokqZIj79+PR
 adkDXtr4MeL8BaB7Ij2oyRVjXUwhFQNKi5Z5Rve0a3zvGkkqw8Mz20BOksjSWjAF6g9byukl
 CUVjC03PdMSufNLK06x5hPc/c4tFR4J9cLrV+XxdCX7r0zGos9SzTPGNuIk1LK++S3EJhLFj
 4eoWtNhMWc1uiTf9ENza0ntqH9XBWEQ6IA1gubCniGG+XrkBDQRb/80VAQgA8QHL8REXb0Cy
 79EKg2lmFl/Vp14kb2yNssurgDbi/+lslAifbBP8uwqkOZ9QAq/DKuF6dfoXoceWjQFbm+Yx
 0VICaLdsCdm+QTjZCpqTE/FTg53Ur6GHDKlMurxaT+ItFC2uRGhuog+roLSGBzECfRG0VgPz
 5KxiwDl2lXtzE4AQOPzoh8nW7ibvWJ13r7H8h1VkaJRLbGi+hWJ10PYm44ar9ozCLe9/vfdz
 +t9Z1MYyvHCnzeaej5G2O00jNGuXPjmSgz6nagFVO6RYxt3J6Ru3Xfz7T3FGlCJuGtvejo4K
 fQb5DRNRsZp3my/qE0ixh2lio79giWTR6dURdYXWGwARAQABiQI2BBgBCAAgFiEEJNYm8lO+
 nofmzlv0j/S40nFnVScFAlv/zRUCGyAACgkQj/S40nFnVSdS0g//a5ahjaIt6hbDKb/gmBHO
 FuB9M/IIU/Ee+tXToWw1igxfXdP+CGS5BGR+myCyDejNilYypm4tQRyPYpNvXjwHFlzvvhNc
 VkWJeTRx778eyZcx441DgfbQpH3U9OYSg9cobchn7OPiy1gQRNAROb004m0jwk4yldbCmWS6
 ovmJkRsdBcyRmpRE4644bbFMULGfPkB9mN3OHPTiUIulLlyXt5PPX68wA4UVjR3vKPAoJekx
 ulW043tveaNktIhOeObwaJIKaqMvr6EuB9h9akqEAcjAZ/4Y21wawb5aAB9eyx07OdsRZRnV
 yrfuDuwdn8yDNEyLdVQPcHC2T0eGuiJEDpPGiOtC6XOi+u8AWygw1NaltVyjW1zZt4fu4z5S
 uRccMjf84wsbC9K9vplNJmgM2c2qvvgn19Lfofw4SIX0BMhpnkKrRMx19wAG0PwrRiS0JVsI
 op7JpZPGVNqCnAgGujh9ZgvSJchJ2RFXY3jJCq/C/E3venVGlqDprU61Ot1moaBD1Q5igmlT
 GZae2XlFWBEWfqX3hb8fJbEGIWTRWz0uR2WroDg7vG3k+iLkqQfp61rsVzJNzeF/nGFr1AYg
 D53Es2aGJyrAeHWCnk9vzsPJoI5k5P1yNjgjA+W6tnOj8Kdpo//uKMYXV6hXkEAtyap6ggsw
 PASsWZc3OelnWN2JAq0EGAEIACAWIQQk1ibyU76eh+bOW/SP9LjScWdVJwUCXZLIEgIbAgCB
 CRCP9LjScWdVJ3YgBBkWCAAdFiEEbinX+DPdhovb6oob3uarTi9/eqYFAl2SyBIACgkQ3uar
 Ti9/eqZ2RgD9HN1UWo90QRDlBisR83Lte2VJyKCS46R3ZDXwZ1lPflIA/28E8ROelnfJEGdn
 tlE8uATPPdOxbCYAECy+LQ9mGYIMkJoP/RhDJ9TOOlHUacJKRtothMRSzJoe5Y8j+5KkpO1x
 u22li/5CZiwjAP3wJ4ffPBjReX/V8T0fLn3PpXG/1hVqkvHSc8M4DXMNU2rYye63Edvy34ia
 PPgRELHKyq19iu+BqjcT+HRzxIR6H5uHkySPCZTwLBnd2hbKJV1QsoRJ7v8azk66EXNoNU8K
 lZ2wp0IAbJS4//6pFbAoZWlY/RGu3oxMrbght67fERk7xzdc4Rcfl32d/phGoEQiLMB5ygKv
 TQT1z7oGVFLQCpE5ALf8ybuta1yjf5Y6uJ2pVeSSj0BxnwCIzme7QXwCpgYqDTLu+QvYs4/y
 6zzkvSnnsyohHW6AOchOVNjTHhFhFYn36TuV53laydaXK/zgo3NsOpATFObyK3N5lhb1G9tN
 Lrev/4WVxNr0LPXl9bdCbQGzIQK+kAPcg8u9f2MMhHQiQX8FAjhP3wtACRhfUz9RaQykxiwv
 y0s5uI05ZSXhqFs9iLlh3zNU1i6J1cdzA8BReoa3cKz4UiGKEffT857iMvT/ZmgSdYY57EgV
 UWm57SN2ok2Ii8AXlanH5SJPkbwJZhiB7kO0cjebmoA/1SA+5yTc3zEKKFuxcpfiXxt0d/OJ
 om6jCJ5/uKB5Cz9bJj0WdlvS2Xb11Jrs90MoVa74H5me4jOw7m9Yyg3qExOFOXUPFL6N
Message-ID: <6e6c6da8-0948-581c-a4a3-7a2617ac5dd0@linaro.org>
Date:   Wed, 16 Oct 2019 09:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/10/2019 09:33, Amit Kucheria wrote:
> Hi Thermal and MSM maintainers,
> 
> I believe this series is now ready to be merged. The DT bindings and driver
> changes should go through the thermal tree and the changes to the DT files
> themselves should go through the MSM tree. There is no hard ordering
> dependency because we're adding a new property to the driver. It would help
> to soak in linux-next for a few weeks to catch anything on kernelci.org.

So the ones going to thermal are:

1-7, 14, 15 right ?

> Changes since v4:
> - Change to of-thermal core[1] to force interrupts w/o changing polling-delay DT
>   parameter
> - Corresponding changes to DT files to remove the hunks setting the values
>   to 0
> - Collected reviews and acks
> 
> Changes since v3:
> - Fix up the YAML definitions based on Rob's review
> 
> Changes since v2:
> - Addressed Stephen's review comment
> - Moved the dt-bindings to yaml (This throws up some new warnings in various QCOM
> devicetrees. I'll send out a separate series to fix them up)
> - Collected reviews and acks
> - Added the dt-bindings to MAINTAINERS
> 
> Changes since v1:
> - Collected reviews and acks
> - Addressed Stephen's review comments (hopefully I got them all).
> - Completely removed critical interrupt infrastructure from this series.
>   Will post that separately.
> - Fixed a bug in sign-extension of temperature.
> - Fixed DT bindings to use the name of the interrupt e.g. "uplow" and use
>   platform_get_irq_byname().
> 
> Add interrupt support to TSENS. The first 6 patches are general fixes and
> cleanups to the driver before interrupt support is introduced.
> 
> [1] https://lore.kernel.org/linux-arm-msm/1b53ef537203e629328285b4597a09e4a586d688.1571181041.git.amit.kucheria@linaro.org/
> 
> Amit Kucheria (15):
>   drivers: thermal: tsens: Get rid of id field in tsens_sensor
>   drivers: thermal: tsens: Simplify code flow in tsens_probe
>   drivers: thermal: tsens: Add __func__ identifier to debug statements
>   drivers: thermal: tsens: Add debugfs support
>   arm: dts: msm8974: thermal: Add thermal zones for each sensor
>   arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
>   dt-bindings: thermal: tsens: Convert over to a yaml schema
>   arm64: dts: sdm845: thermal: Add interrupt support
>   arm64: dts: msm8996: thermal: Add interrupt support
>   arm64: dts: msm8998: thermal: Add interrupt support
>   arm64: dts: qcs404: thermal: Add interrupt support
>   arm: dts: msm8974: thermal: Add interrupt support
>   arm64: dts: msm8916: thermal: Add interrupt support
>   drivers: thermal: tsens: Create function to return sign-extended
>     temperature
>   drivers: thermal: tsens: Add interrupt support
> 
>  .../bindings/thermal/qcom-tsens.txt           |  55 --
>  .../bindings/thermal/qcom-tsens.yaml          | 168 ++++++
>  MAINTAINERS                                   |   1 +
>  arch/arm/boot/dts/qcom-msm8974.dtsi           |  92 +++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   6 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         |   6 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          |   2 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +
>  drivers/thermal/qcom/tsens-8960.c             |   4 +-
>  drivers/thermal/qcom/tsens-common.c           | 529 ++++++++++++++++--
>  drivers/thermal/qcom/tsens-v0_1.c             |  11 +
>  drivers/thermal/qcom/tsens-v1.c               |  29 +
>  drivers/thermal/qcom/tsens-v2.c               |  13 +
>  drivers/thermal/qcom/tsens.c                  |  58 +-
>  drivers/thermal/qcom/tsens.h                  | 286 ++++++++--
>  16 files changed, 1102 insertions(+), 166 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

