Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636601BE8CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 22:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgD2UkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 16:40:18 -0400
Received: from mout.web.de ([217.72.192.78]:46955 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2UkS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 16:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588192815;
        bh=8fq5kKb5JAAZeSiX1DV8FG7ZAdha5JcsGzSBfJwO+J8=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=rsjVotyJ4aS1jW446N5apGj68bjpE72DoLasx2SdhBzt8XizxwKAfpEQNF/JDibCh
         Ac/oGISuXbgczgKMVx1+faF65cXJKEt2ydMZyxXkNovAy3z32rPebqnvW9+pTlw/9T
         KNhtSqwGb+L1Gz8mkidFJ4NCUKf+JVkqI6ced3Is=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.72.72]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LZeZU-1ikd7439VU-00lVHB; Wed, 29
 Apr 2020 22:40:14 +0200
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] misc: fastrpc: fix memory leak
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1471e6f6-fd20-334a-041b-9d55be234111@web.de>
Date:   Wed, 29 Apr 2020 22:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Q/qlzsIA4LYqvgxDqPzB8lxHjXoIkNEkdJGffuv8h4VBdhJxNZ
 YJev0clulNWs+t4r6qidigLolhETUwCvEhkriQbbQwi/kem9ET9qb02OPXDD5mbelUVIhKU
 puJhnDJl69ydxKN36YEfZ1+xfte59sWsey9KzLVRmcvCchHd5ZRwnGOZs41SmUDcuyh8z7F
 WwoKzS9HUTSy2MA7YRRsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rw7HbqKYQLE=:ME1JDvpkIKGYAs86RRHNuU
 GVTKgojN/xkvack88BEbCfN2nWAwT+uoaloy5j/3QJ0DgvSYLfbNDxUXLQHtRQZ3pIkuzM1l7
 sS8HbpECMLJehrn/TigsF+L2B/m3SOZYwPpBFqFTysCPmyhS7QR08kpk0wCdqdkw/xsyUR7rP
 TtUqlcyuXTb6V1hTV9r/tvohy6DCTav6IRNIVifRrtcd1AsT+NteZQ5w+tZoeg1hO03KLm8/w
 f3uNYUqbH0xJKfkiFmR1WOTZNyPWPPCzoyOay+y36ItGNQvfmIZY+6kiEU9lCNw/7wdPkWERk
 RBw9Aukmdt/NckoC30rMh39vH8Gzuu1ajnIpUY9ssyMdN9uFAo/bQXaJPHnmOFXuwgPgeN+DO
 ahwCnG4oyO5kcoD9onyv1k/fGN5b2RJxHdr/oco1Kr4e2yjtRMr+cca5OLkYBK7sUEFPIibij
 C9JVtSR/rpMsZse1rWxdsnaqV3spz/sdU6hDbUfopGT7fSSJi5uc7jBk95M5E4QQcYwXRRv74
 UR9G8RhZwneeVl4Zjo+PMpm76edGCg5u2HPgWxT8VT6y6THUPBm853LE3L3n/NuitZ5XSTYZB
 xsG/T9IXBVDGcYWBXTckglS2twJGsyOYYMCKZzx0irVa4BP3Evtb9pxXCx/rS4N9XoshyvNIc
 c+uU9Om5YqHjaE88Pk2NpI9CjGqhZjTWpIpZCCzLXQk3dggQzYduhOyFj+zSvW/ZDIPk6LX4W
 +osANhU5T20i9Li6ABdulVuddEdCXz//o1E81Mz1ER2FNlLpboNvNNOn0bl123/AxIWyvWY1g
 DlogmBDl/YYSYUtPSdyWEF61HA3M3sxW7QhvpYiZFxlOl6I9myGTk4FbDPiflfCbhQau9fAu4
 Hxmb/dOLWsoF51fu1/X40eFihsLvcE8RfRK/gdyiUV8PbBYiF0k8CO/IMkm0feDRH6lEVOx8R
 6mxukxTPQl3X5LHQnhL1rr2IAV8E2uoLDDc7kmEL3fT0xuOXbIJQC6uzjbJni6OyvfTlMrVWj
 zRHMQAnavq4Qjh9ozEyWLrVRq88Ugln3GntjoyU+IlHLv2WvRvYoeYNiqLriD+hZr1YaRYJ0w
 X31sbwpltxLdN9i+z2+hV5MQi4EJPXAkFrwzb3FXaPdyoNzFEpAthpMHRHQux6f4IlIW07i8Q
 o7qfWxVmIJf1B2hi02tZjiG0EejTR7fI94vpL35H3MLdQJ8gTWUtZh0uzJzbeHbNe16A+nofA
 cxqfFfzVSHwb/+Fi5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> if misc_register() fails, previously allocated data is left without free=
ing,
> this could result in memory leak.

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] misc: fastrpc: Fix an incomplete memory release in fastrpc_r=
pmsg_probe()

   Change description:
   A few fastrpc data were not released after a call of the
   function =E2=80=9Cmisc_register=E2=80=9D failed.
   Thus add a call of the function =E2=80=9Ckfree=E2=80=9D.


> So fix it!

Would you like to replace such an information by the tag =E2=80=9CFixes=E2=
=80=9D?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D96c9a7802af7d500a582d89a8b=
864584fe878c1b#n183

Regards,
Markus
