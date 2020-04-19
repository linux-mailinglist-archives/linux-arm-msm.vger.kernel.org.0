Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2463F1AF9FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2020 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgDSMci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Apr 2020 08:32:38 -0400
Received: from mout.web.de ([212.227.17.12]:58229 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbgDSMch (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Apr 2020 08:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587299542;
        bh=Ony+WtCvlJwCqxG8+ifcy1TdD6Z04JNAUahBHfvqML0=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=hwUT37ZyJ1NZa2m+oW4WilqNetQKZGbV3Lpon+oHOpiD0cHy8nFjrsWvi9c19zQ6l
         EaFrBCgqQvsEYPNweB8cxUDLdOgMwQ86YFhlE0mJsLyntvJKTtB8wJRIC8f8g3e0ea
         85DnTNWN4s0RdTAKRNhHlgNG9RGYRo3g9/klrxCg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.85.208]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrryk-1jEhom2LNO-013aGB; Sun, 19
 Apr 2020 14:32:22 +0200
To:     Tang Bin <tangbin@cmss.chinamobile.com>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] iommu/qcom: Fix local_base status check
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <73736017-cae3-1c2a-dcf4-d771d0f3bbbf@web.de>
Date:   Sun, 19 Apr 2020 14:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aM9D41FDFG533iB8w4muwOHig3soCihnk6pAK/NdvHKorniyPir
 iyQlK51/Kfk4yD8O+bwuZeovMtlA7rs/2WH5M9OlWqRCCbgeKVEQESYq+3M+0690hF18C9c
 qqkiLrbft/PoMxtRn19FtmatjUFPexga8qEjY5CKq5LZ8kAUPGaIK2AimKjj2+SPDwUaUYx
 coVSg/uQkvT05B1rJSviw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YfONjDXL5x0=:3wx3LPQ+RgsxVKYkWsZgwg
 3QgRYFxbV80SPNOpnRpsERd9bDi5bH8kHBZCZkpbGbIC/BoxJnxEOraXfCbUOj0R3LwhlYzCX
 Do2unHX8eqH2+utRbDs/WJKxbMeaDr7vodPvcV1vE0CRInXUQpJ3vVIsN8eQfXYtQdZoEGmjI
 nLSRsA1RYbAiFLLhIdngkurSmm9wMynXWZtfBwka03y1m7LuKAA/9NZHvpjJUtKeg0LYQbt5P
 q48+tvmOxxHPYPt/XpgsbYI0GfC543CZU8vHxA1RGbsw6C5iswVCGo8TzHs/mlHca3rkpJuv8
 fDNIAIRuzONIdxTXgESaYpXySEB/Fwm7WOhmsxz6QpAb5Ilr4arWLIhJjLmfHHVIjdOntECwZ
 Z6bxDkZAkt0WMoCcCO1n0gS5T76xJg1zED1G7VvgrhwMaTyOQocFTuXnsrGQ4jc+EQjdwu2Ab
 NW6ZCfu46ZFScj0Y9OPll8D5M+frIcC9HQBUUIP0SvNJFL7me/2sAKqvUa70MuNv6UqmODtJ2
 9fykdEdMNBvbM5ARFWsVerWcmdAWBzttswdw/Ejf72qNCiGEs4JP5jKRmq4a5zgUcDD9NHFPN
 N/Sl4E5plJ3cQXqoIyPhPZYuCtK3M769oYby+9vSQVIUhV5P+NdKZFXfYLaQ1SqrjUmQPKEmf
 +FSaukDfxfphjYxlSph3uJvAPTLYKbGsGIiCVHAaZ7LL3v/owPeTEN2to7wcFwd2etQsx1Qv6
 GJ+Ll3HnvqaWd+9twFGS9KcvKBr5Mr+y28HPIQsxot5lQdpGGMJ4Q9/OQC1LgNrN0EnmeIilU
 MQPhjXP96P4LnWLX0fGDkm5om31eApBqjHUcB0QOBl7ZKSDrk4VbM6jhUjv1tlfzJqJwB/sSD
 v0M9BqgZtIMGnC7fbyPn+VCu7vdfoBjcZqR3ExO0IhXmXZQSGat2etii1b0uC9vC1NimX7KK2
 //PazBLnUjlfHQBHihX2hGJwZ36CVzYty2NJGtdplii/sIg/gghw56RW8SWjDuQYhLErW5njH
 N7OIGMQKf8y7xDLDImFe+EIPBaGT8BtpzUawYujG5dO1Ff9YjGP2JbTqPgONIYMBT/xMe/mxj
 ZYHAqrPlxau0VRLD285o5eYf9vLm1ei4Kf/e024S5cNebqS7RYpC/GTFgdc1x498hLbGJTFjF
 sDZZpCAfsD/R75venw8Ue0HMZWOey3VZwrL2ZGdJjJGo8QB/wfh0Q6FAON8+OWNsMV2mIdRc1
 8pqehv5/i1X/1uGGK
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> The function qcom_iommu_device_probe() does not perform sufficient
> error checking after executing devm_ioremap_resource(), which can
> result in crashes if a critical error path is encountered.

Your update suggestion will be rechecked once more.

* Can it be that the patch would need a higher version number
  according to previous review comments?

* Would you like to adjust the patch subject?


=E2=80=A6
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_=
device *pdev)
>  	qcom_iommu->dev =3D dev;
>
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)

I find the deletion of this check appropriate.


> +	if (res) {
>  		qcom_iommu->local_base =3D devm_ioremap_resource(dev, res);

But I do not see a need to preserve such a check because this function
performs input parameter validation.
https://elixir.bootlin.com/linux/v5.7-rc1/source/lib/devres.c#L116
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/li=
b/devres.c?id=3D50cc09c18985eacbbd666acfd7be2391394733f5#n116

Please take another look at a corresponding usage example.

Regards,
Markus
