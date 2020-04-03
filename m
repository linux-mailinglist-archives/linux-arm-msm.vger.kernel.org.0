Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC44919DD00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403978AbgDCRpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:45:47 -0400
Received: from mout.web.de ([212.227.15.14]:50001 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728219AbgDCRpq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1585935919;
        bh=LvQFEUP2P8FDxYUu5yT7cRrTHnGhQPCprZqje+0q9aE=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=iNICajo+41gSXPFlOmtZUr+pnTJa60jZFuAgSrrTCvaxRJUKytJkR8a9C+00Xp7Fu
         CgUHMcio0m8ugruNJh6COq2cR03hZO/03zhOEE35R9RIcW0QHfhHojQYvN1tlI3g9Z
         MQdEAflFrYgXoLoTQjjKS2wUYbrU/e+PENBd+b48=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.25.116]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LtoCT-1jAHXe2DiP-011Ek8; Fri, 03
 Apr 2020 19:45:19 +0200
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH v2] iommu/qcom: Fix local_base status check
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <3086d8cf-d733-6164-5834-b29c11a8f84a@web.de>
Date:   Fri, 3 Apr 2020 19:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SDREOMA87v8AXoknDefenrsnuRXRRNzhpXtgtgh+l4xZbev+8Qk
 lPBnMyuLuC7PTKunQmNovPvYx4pEvxFlYmyOvOLd0Osur8cYIer6QI4LIRd3S1CSrtM4Yin
 gr9yNcOtPWtVTXDrUsamPM9qX1h5RKL928Z5p+DjQZyXQ84Y68B6+neCJECmwOFwjRxe2zx
 DL47XK84VxHcNHtwZuuFA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qQBvDo1g1zc=:EVHky1t1bUwdbudfMIB26s
 m611K6+uX4Crhdo8monoiQ0kZAx14/7ZAUqBiPq69L8CNCi7vsRnCnWyCq3XQRpaQiVQAeY4U
 SM0LM2Nqzyijmry9AhrrNNVEQV2N4AJeHoDL3n8YHn0N6eXRGD6kUBMT+evJiXl1/SSM1QbKt
 szHVYLviV3Z4qiVREIyEADJ5XUqbot8g1Kqx+NE6wHckraPR2KxSRID2hmTnDk5EdkQhyTWyF
 2GqHGFMYfI4wMqNQqu6c7j82cXmPHNdgMA2NiXvrVgP05yJY48PT+tKrKJB8s3VYy7nqfz1/y
 FQoeyILdpS3HeDldK8q0uMWm6ogaW4PoPmQh2K65LNnTj9zhqnRV/MO6z9U7B6m8j7Zu4Tlls
 v0uWcApqc7mNHofDHyPwk9ePuX0XAZJ3r0RJZ0siRzZwg+9cA/45rjC7zj0TCLo49wB5O1IYv
 wN3K6PYingH+58SoG2HIV7wZvSwZbOF9wJyovU6bReVu8xj+9HxN50rWsiPNmCh6NYPHwzfpF
 Ukxgzw6OeXzpqdA3H+mjF8QUM3EfIKMGB4P1DiuSfLk/HcP+aFzc4O8ZzpAfc9t743JokkII8
 doKEUXYI43welkXQopYwkQ/ODsXauyKh6/eRwWJTl0BAAY3Sm34K/7SSHI+K0kXqMoS3W7g3S
 Syft3FDqFHVgyjcpVbWv9pvL/dFB+1Or5q0fjL8slfj+ULPGDdoaJcANc7U6AT3r7xtFgksSg
 hsMCpsMI6KnMYoxULvwJIIzXle7fexjCWk0fFU3n1ZeFEFuBu3nBv8PPy6MVMvc/cEOQSIeyt
 cNvc2hdLX3J4eRyK/aHASfKG2xUwJNZnhKrC68dTM8F0ubzeGW6X5sd1XaXRmdxBr1jJc2q+b
 D9OjM9YzrSTe+zPRy1dTwu6cZlRr9OYZldbW8gbJkawsshVzd3nCu3LyxhpsShl/gZY+lYhot
 CmANYim/9C/qhZPID/tMsJot2C8NfXGejVTvR0CnU37EgITLWnlD+EPzLsa+QQIygPFAOm3NS
 KIZW31WATmnFkvbOmT2sQSd9jJ7rTeiuvlmxxOl+dRpInR5fcvubtn503L4QmwQLwqH34EQG1
 ytcO/HeUr1mo3/5i7taOknEw3H87fjhz0UZN3quEa2peU6H96VNaWQphm0Fkxau60zgogyFCF
 Cbkhy1rUthuHOg1LP4+mJOB/mR8E8lda4ZVkKF4ec6CaQ2USysS8UxVqK9a2nYJh3SCUxz/Np
 DFPkK+Cfbt4f0opia
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > ------v2-----------------
> > As requested, add some {} around this chunk.
> >
> > ------v1-----------------
>
> The changelog typically goes after the ---, as it doesn't add value to
> the resulting git log. So please drop the above 4 lines from the commit
> message. And please use ./scripts/get_maintainer.pl to find your
> recipient list.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

How does this tag fit to the requested changes?

Regards,
Markus
