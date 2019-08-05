Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3FF818E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEMMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 08:12:00 -0400
Received: from mout.web.de ([212.227.17.12]:57253 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfHEMMA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 08:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1565007107;
        bh=DN9auCtedXhVjg71g+2ZUtne4mAwANQeTHFbI2JnUog=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=qTmcwj2PIJM30D5lMlE0iAel3Iuc3Gd0U+yHH/D0IbszIT7A8Ys6AMY5jHL9rQ0lS
         at3YxMG0nUauUCsN35QJ76Dn0eA+jFW3B9Hy26mXqq20GmDz5BGyrYUx+9CWwfqvb3
         qvg6xIJGI+FNaHwXG5Ah7iqfflf017W2z7baB1lg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.163.134]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LZvUH-1ibwLu0e8T-00lmys; Mon, 05
 Aug 2019 14:11:47 +0200
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190804162420.6005-1-nishkadg.linux@gmail.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-qmp: Add of_node_put() before
 return
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <239020d9-ff8a-237d-b52c-bf2423f9609b@web.de>
Date:   Mon, 5 Aug 2019 14:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190804162420.6005-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:l5HrBNNs+hVlre9sLU5kguHduTygiitpXMFzs6LEZ9C3DkAZah2
 kJRGoW0XigxBxuNCKgezh7xeJ6RfJ+MS23m65UMa34OSua+1YoZtyKAuL7Q4HA27fSkIjNb
 6Do0yfRxp5kt09ZFJE8/QNiCEGFqZCaNRHkAmcl/BCCIuYVTUU90HYa1d0odKW0yQIQTsD9
 1aYnZH/QgqPwMl7req/qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+eqZ6FNivI0=:c8Be0f21BiZvDKF++97y/a
 qCPgkB5/bEnTqk9zRDk+klz6gR7TgVX8/2ucy99QbvMwfwgs39T2nTBBwzETbLiVfCTz8Y1pT
 6oNLiLeOBkz+qnjRxIFswC2uJWVDl6E1fyw9bPero4Cs2Po8rYSa4EhLhyxFvI5fyyDW3XUJN
 PSHAIPyjAWM6hfUVhszhMDo7PzVbo9VzyLc+hLa15cUyPKvyRt9sSNksf/h/EQC0xwZAKTcGk
 8sRFa/rdcUcwGRNLHNyaie3+gEvxESRAPqfhbD8xHV9GNMQ26TTrlx7hOZdS6kDJWGWw8wrsz
 wqJjWQeOu/1aj0PbDc3yrDeEuNpDdBdoB5HXPiir4cBcc069icYu2/S9FEAFlXDr++GTwtH/h
 Gek+7A7jqBtJJnva8nrrT63ngBwdc7Yupytyz8sYE9DRT2whaZUqo66QsCZJJsehUDUbc93+C
 bSk9lrvCHSYER5fxhJomUbM6itbEZ+Pcqkx/WQHpRfv7FWLtBm+C5GfWL7QwsbE2mIN7/nDkB
 +U1sRWNpRDHv5Xf19/9mwgsATGSA1qlq803JZmjIY9i+RPXsCjjIInM7i9lZfzRfCYetR4+fb
 NuG2Ok38oNF88+WjAgWFc68xJ5Q8bMXT+Dsdi3oTcjsCLjFdOAQeYyLwIgCo0bfrVBsWyxaOF
 NM9AgLIaZ7d7hBb42Q40qpuUq805PimonKn+JA43aqm0ildu/VLPzd5IsFboBqBZ7FPC/N28T
 6NXIZwj2FSSeYT0KzYIiZ3B3Ni6nFLdeAvjBIKElxoAT4YqUZuik/UAvcms4pulyt0EpXnG3C
 Sh9hhmNmK+S9pkmQgEMATPvP/HB9UulNU4+dmmhj09+NgoH0HuBAz+INgRIRBTZjgBICxu1Hd
 ZF3gLvp58gAO6i2dQxQPr0N2rIYlL8Ff/goI3eThn3AREceKQKvZtFH1WrETeS0mQ1RS634k+
 kwTyK5Pjt7HD7c9oVxvGUtmwBu0KUxCJ90DpHoMagr/CI5zByIOqI932YzCne1hMXGyOiI7Ex
 mvpVZxDfzsL4gbZXyR9Yd6sryBfx5OjZo9+8fM1IGlP9QujwpNftT1X+yXojpDN/2PkucQonA
 HbEhM2oTf4HGwHMAGcIdh7erBgzW4zn9VQZ+eRGj5ipCzuCeqiW1sRh3aUAqiVjvWLSh7UujE
 0MxZc=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2094,6 +2094,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>  			dev_err(dev, "failed to create lane%d phy, %d\n",
>  				id, ret);
>  			pm_runtime_disable(dev);
> +			of_node_put(child);
>  			return ret;
>  		}

I suggest to move a bit of common exception handling code to the end of
this function implementation.
Would you like to add a jump target?

Regards,
Markus
