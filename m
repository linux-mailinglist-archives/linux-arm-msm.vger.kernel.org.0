Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651BE19DC9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404322AbgDCRVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:21:06 -0400
Received: from mout.web.de ([212.227.15.4]:60643 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728066AbgDCRVG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1585934437;
        bh=F9+0iNVN/a+RVMnBnJdNBU74AYqMy21kwnfqkkiNbBE=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=VOphlUdXZfNgudGMpAMjysIP8EgolgN1sg8RY2Yt4FE1d7YfWPhIQJRIDoXRxorkw
         QUrjRJGLSdxT0dbOJXIvHY077oMlas9lpIS/15JxDqgamHaBg2K4K0xeXOuSi0vRup
         siaXuqXNWGZC5DRA2YVsB8eQVa7wh19HU1XSGSjQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.25.116]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOlTq-1jN9ox2PNm-0068Li; Fri, 03
 Apr 2020 19:20:37 +0200
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
Message-ID: <084eb9b2-3f5f-4e87-08aa-fe57ed3f5d35@web.de>
Date:   Fri, 3 Apr 2020 19:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hpy7tG+6LUJMeU5uQuElQKaca1QpFU1e+UTi5sL2zkkRxn6H59o
 vs1+rlUxOwVshOR1yyH7Ko1uo+NzsIMD0Srv1fshtmBzLDzFAalzDuzrtzWrR7vd/BzEeWd
 lqPu6oQ0ba8zhHtHocaWc/7MsnkuNp/Iddr5lf1wyO+6+E96x9oVWxCDcdPjV0A0bxxkJ93
 TH3nbYk7kl9UaB/ZSS1VQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:snu08ePOQ4Y=:RERL+WTQn6HpQ6VfYEVlHO
 UXU85GqBFMvttK96XRK6n8M1VBFCKIF016QJ8DKvfQLNy5uEBxcRnXQ3O7AhYHxXS5aBwyymi
 WGqDg5cVVolvhYPG7Of1lEhHvrxozWagv6ElJGNMqb0Q63k2aByZCBBuuS3f4grF2aChqCXSr
 CvunvGRzG8kKN6jFafdW4cP1RrwmSwc70z8QjgmcQa0jRUJ4DbsjEgTS+pcp9I4HeP3dUYy53
 ZVx/gNeVPntplWct/B+SZUWHlpshNGSJrZo1YW9bMLKez/SNd6q0YOTa0Wy+4PPr1RCkLere8
 cqMcMJ9EU8lsUJOGLDWgvlVd4TPG9HKLT86bJtR87Ygl0cLr80R6ck7wsb8Qr+Nmd1uGuBf44
 YLPpNmRPUQsTb2itsRjGtBc/oAtexHl2CI8Oelvj/hT2xVxAdqZjEl7Gpx+L/3LZlywb2/6ar
 j+YHP+YMoZoZGuX95M+FTVJVd+NFljOPUffS6qzTdtqZH9vK0TaBlXQHoYzr4LNE2pKuftF6e
 txYuTXQTwUEqM0Ai6mZu4LiMrDXIjdCIdSNXoZtfiKI0xGzVfeeqIeIYn6Ij+u5lv3Yieipdm
 259NgBXXMtpEsz0SDT2e/aQs2S2PMJ6kkI9RFCiPUTeyiYK43FT4QmtaTVOHeXXjm9ICB8Jjq
 decirzYn+Fk4bj+ePMTP9iVEvPAfqmhBglHPM3gX+9U5trOLVxsqq8Fa++1rzOG7mj8eYN5iV
 85m1M1dm1vY5zx2e8fCcmoUtrsPJUc3PH+mfSWksHjjH+vuMyqc47tQFlydyR6j61MTMKbIE5
 HVqmEkGvgnP+zoiNMDp5OEf2c+JQXdft55QDi2hAI4/yNDlcwub2q7gG3d8oa5zo2VfWNQSNr
 5crK6iUAPmTx3oxUA0EVmVoh4gfDjnWER9hOj99efi5FPBvSoU77IdqL68xvrDcSV7ICo20Gl
 OaXO9q+/Jqg5DRAxhgdxhBGpWrqkqPElcc+b/RAjfRvZVebtsnZGbCtN+TJuMtm7e2B3dAkqO
 sm27odlHxgwxpVg0GHtKgcLs+MMZyohkP8fIEWWpvyif+QFlbqyb35hpvdTFuzHmlfIwOPKJN
 fQo9CEiMI36fdhUFlc/qDZUYBcwD6mO55QhUfLW0aitRUjiehkiTafBoZSeAWUY4J5eXFqBMc
 tcNwHy8M3jdCZTnrq5DwSmytiWNRQ62M4Lvn1wRTvPBIcGQB00q3R+AMSQLCwefWQNxt+vjXk
 vgx5hjJkW3mCFeQOM
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Release resources when exiting on error.

I have got doubts that such a change description fits to
the proposed source code adjustment.


=E2=80=A6
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_=
device *pdev)
>  	qcom_iommu->dev =3D dev;
>
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>  		qcom_iommu->local_base =3D devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}
>
>  	qcom_iommu->iface_clk =3D devm_clk_get(dev, "iface");
=E2=80=A6

Will the commit message be improved any further?

Would you like to add the tag =E2=80=9CFixes=E2=80=9D?

Regards,
Markus
