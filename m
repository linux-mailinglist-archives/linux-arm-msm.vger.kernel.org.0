Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D72F119DD06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404111AbgDCRpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:45:47 -0400
Received: from mout.web.de ([212.227.15.14]:47105 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728296AbgDCRpq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1585935919;
        bh=LvQFEUP2P8FDxYUu5yT7cRrTHnGhQPCprZqje+0q9aE=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=iNICajo+41gSXPFlOmtZUr+pnTJa60jZFuAgSrrTCvaxRJUKytJkR8a9C+00Xp7Fu
         CgUHMcio0m8ugruNJh6COq2cR03hZO/03zhOEE35R9RIcW0QHfhHojQYvN1tlI3g9Z
         MQdEAflFrYgXoLoTQjjKS2wUYbrU/e+PENBd+b48=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.25.116]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lk8Ow-1in1Mr0wNG-00cAWp; Fri, 03
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
 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 FEE=
Message-ID: <7ab96d6a-93ee-4d22-7e51-6a9ad4268d5d@web.de>
Date:   Fri, 3 Apr 2020 19:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RDsIcVUj3rnoAk6AtOinl6//UfKFbvoCj+ZACu7/BztMlrGKqn0
 8ttuvGTyF5B7/WOyEyGecLZAKq1gRbFRCKbp4mtt01e2/nKyt+x5/oGxUwwklTBQYBLc1o7
 eQuLfmkdttlgdJkE8moMVKrWB5vrZOo45ioNQCEm0psnaNP8kvU14ZdI4fkVO8xuZfXNQux
 mfgeKatpx29JVxdXCTeVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i7ko+qJWk98=:p3g17sJW+Gr6sPAuEa425y
 BlsjenyHgPEjhbr0bOjswM2KxAuTIlE6+5bft0VGdQ7mYgCanq74afo8p7AwKnc/I9zoNc+mH
 ADukExNVzjjVxPrBw5iqZJ/22Cmr7wAuUm3fThudNp+NbVyuTtMGN7c276TqLmv/NTB6t+6Gt
 RLbmXfM7yj94ebzPPG0gtST1kIksqGcMeYlepJdq4XkfoaJqqrxkCisqKS+d6o1xhGjtDpanH
 CZkJzIRCJHBHMV20CyWPS0MAN07Rb0ZNC57n5A1cKiQzcutu08jcv2435BQ81SsYQr8Hs8Z/Z
 bR4NuoTV2q0NQndkqgnKJlQpXsj6UdirSKO+4ElBykxTYXbjRQpXbyj+oC9xVwE4Hs2IMkwS7
 MCDALA1NdWB1Phzx7iQxQsFep4pob/JBJiXQzXlflJaQdwZ/WhIODl91yxOIg2iMeIt7yVwRw
 gMIqqN5h571yVAzV2Y0UBaD4id9lwKnv70LXHEtHBnhYqbS8uRL/o8N/FSy4kwBwmLoV6zyK9
 dgT3rotahCj/dSubymjhYDPgBX3lNoOXQCmNlPsEqM/IDf/KTUzmerAFtZ6vXzNYzD/vicnTK
 8n62LFArYDkMBf6ldJGgau/UKxnPDZ0Z6mLLJ5RSy/Jq/83T1eMYtyhaYr+gdwK1Z18rxtIT8
 E7qeUTOy/WgQB2pxg6p5elYK2DoqH6OsmYGXNdq3qN+YU/7C1LdGbAxQ9vEN3oVHCeepo4myj
 9zSxrgpKxg1o8xxFggjo7RPvTPAVV3GOQt14I8eUiqL3ELuXw4v6WZS+xAdP9FXAIlA6EFCC3
 8QB1dynJ4DcOF8ELdAb+MfeY9Y/M49H/JJoImZbrUpRiuR1EnuM8JiKsViRYOg6pKIc4M7fXm
 kXV7fwQKP/oOMVa2DTeJTerZnqt4yYgnHZS44YPCRocRA0MwajRsdziT2OaZvEoKcEXCw3YOH
 x+JYitEPP6WEqVpuSdwZ8w8JPsxyszOQPapoQ8dXF6qkRXwXCSzb52dnQjdT4e30StSGC67j+
 UOqhz0YpUdCRVHlcRjpiVrBcOAp+TKvz0UEE+G9rHKX59Hv7vEajM6oD+J/DCR0op9fiqddgq
 /MlMAu8IR0VhUFy+FGEl2k23NwfBbzmAuPvUK/OCaD2cNXYbEs0jWQrrr0sPjPV2YdiCWafkq
 RhjugkT/vNjMhVN8z11vtttOBfNiKv2PPyKGciumVAQz6vOa75vBmIVInxyrMNqB7BUPPkuIG
 nZNYT0qBj75taaPA7
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
