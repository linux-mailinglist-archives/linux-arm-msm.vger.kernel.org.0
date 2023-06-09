Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CC37293F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 10:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240958AbjFII5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 04:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240972AbjFII52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 04:57:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FE3358C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 01:56:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f644dffd71so1904201e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686301006; x=1688893006;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ8EAz3IAPCoKMsP5lnMwjtfBcG41hslbw2SnA8v2JU=;
        b=OEgiS5DyaF7scVtBk5M9rgCwhMdxFpuBvKLSqlsiHVWTj9cp+bIJC26wSBWnV6gz+1
         WE5gEcFYX8Xjh6kv1T09hWPuVSokmOjSFidxHLiCwyrIDZZhH+5FvJfuGzJ89p/o0bwJ
         z+cEAB8C285u83zioQ1UtX2r/mmaotF+p63qqeVHxry3bxUc3fEiPeG3FKKoRJuS9mBb
         MZB0Gt97Ymw2GObNbFzgISves2C7Iy26di8m80pxjNVcE2ONWJHR1evGWC5h6M8Q7a5U
         vpwLbVGG7y7Lclb2/xlF+XNC0stJElXJCDj08rlipNcUTQxDqu1/Nlr+0nYWtfdPGsF7
         mtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686301006; x=1688893006;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZ8EAz3IAPCoKMsP5lnMwjtfBcG41hslbw2SnA8v2JU=;
        b=du0BsZdCnuMPJzeE4IAi/W4pmMUw4TPRBGx7GX0U0ra1Nz5VPwfu8XNLMEDiYeXjc0
         j0x/qvvKQ/xI1qals13sLEBnKw11hJxLCOGOhUE8ULeOqBQPt7j18vxZ46Q11jlGBFo9
         aRLZMCxe/rWIcBSaqCr6aS65xJgeAe0aO1Eq2kXKEvtn4ePy25Snn2VGKKYpINfuGAlv
         ktJuugnAm+Wc90vmJlOCSJjgAIcQirf60dqca03Zos8ArgXMubP7CA7mEJIPJnksroZb
         aIrXRMpV7xrTCR3ASL85QcGS3ObYVFyvQA+aDY0FRkHxWwZBxrytqdh8g9AfXuG27n1z
         yTQw==
X-Gm-Message-State: AC+VfDwtdASXALY4Bbnc546/47rkOhvdmBC3uEhkFHOTSqFlXpt17Mrb
        Ih/o0Yu4ipyF0v06fXPJHzLE5Q==
X-Google-Smtp-Source: ACHHUZ6OoNZDgxplcOy7E7sTPdgQYPjV4rTE9rHqpSz8TyCUq+cpdz1rYVONoiOn4MzIMRiNoYKYoQ==
X-Received: by 2002:a19:661a:0:b0:4dd:9a38:fcc with SMTP id a26-20020a19661a000000b004dd9a380fccmr417827lfc.63.1686301006059;
        Fri, 09 Jun 2023 01:56:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p5-20020ac246c5000000b004f62fdf61fdsm473548lfo.204.2023.06.09.01.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:56:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------GYmyCXdemZ1VyOZMsdA20KP3"
Message-ID: <e8700c76-17db-f0b1-c60b-20bf292f0a85@linaro.org>
Date:   Fri, 9 Jun 2023 10:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Add support for the interconnect
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <20230609055225.20717-1-quic_ppareek@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230609055225.20717-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a multi-part message in MIME format.
--------------GYmyCXdemZ1VyOZMsdA20KP3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9.06.2023 07:52, Parikshit Pareek wrote:
> Introduce support to detect the interconnect, and set its bandwidth.
> For certain targets, we need to set the bandwidth of interconnect,
> connecting smmu to memory. This is accessed during memory mapped IO
> access to smmu registers, and during page tables walks.
> 
> Reported-by: Eric Chanudet <echanude@redhat.com>
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
Quite recently, I've been toying with this too.. I coded it in
a way that allows it to be reused by other impls and uses OPP APIs.
Please take a look at the attached patch.

Konrad
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c71afda79d64..6961d564869b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/of_device.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/interconnect.h>
>  
>  #include "arm-smmu.h"
>  #include "arm-smmu-qcom.h"
> @@ -549,6 +550,8 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
>  	const struct device_node *np = smmu->dev->of_node;
>  	const struct of_device_id *match;
> +	struct icc_path *icc_path;
> +	int ret, icc_bw;
>  
>  #ifdef CONFIG_ACPI
>  	if (np == NULL) {
> @@ -558,6 +561,19 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  	}
>  #endif
>  
> +	icc_path = devm_of_icc_get(smmu->dev, "tbu_mc");
> +	if (IS_ERR(icc_path))
> +		return (struct arm_smmu_device *)icc_path;
> +
> +	ret = of_property_read_u32(np, "icc_bw", &icc_bw);
> +
> +	/*if interconnect exists, check for the  bandwidth value*/
> +	if (icc_path && !ret) {
> +		ret = icc_set_bw(icc_path, 0, MBps_to_icc(icc_bw));
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
>  	match = of_match_node(qcom_smmu_impl_of_match, np);
>  	if (match)
>  		return qcom_smmu_create(smmu, match->data);
--------------GYmyCXdemZ1VyOZMsdA20KP3
Content-Type: text/x-patch; charset=UTF-8; name="0001-smmu-opp-wip.patch"
Content-Disposition: attachment; filename="0001-smmu-opp-wip.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MTEyZDhmOGI5YTQzMTc4YWYzYjIwM2UzZmNmOTRjYmQyNDUxMGE0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQGxp
bmFyby5vcmc+CkRhdGU6IFR1ZSwgMzAgTWF5IDIwMjMgMjM6Mzk6NTYgKzAyMDAKU3ViamVj
dDogW1BBVENIXSBzbW11IG9wcCB3aXAKCi0tLQogZHJpdmVycy9pb21tdS9hcm0vYXJtLXNt
bXUvYXJtLXNtbXUuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21t
dS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYwppbmRleCBhODZhY2Q3NmMxZGYuLjAzNDQ4YmY4
YWU3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUu
YworKysgYi9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jCkBAIC0zMiw2
ICszMiw3IEBACiAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVk
ZSA8bGludXgvcG1fb3BwLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JhdGVsaW1pdC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KQEAg
LTE5NzAsNyArMTk3MSwxMCBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9kdF9wcm9i
ZShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LAogewogCWNvbnN0IHN0cnVjdCBhcm1f
c21tdV9tYXRjaF9kYXRhICpkYXRhOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IHNtbXUtPmRl
djsKKwlzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwOwogCWJvb2wgbGVnYWN5X2JpbmRpbmc7CisJ
dW5zaWduZWQgaW50IGJ3ID0gMDsKKwlpbnQgcmV0OwogCiAJaWYgKG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKGRldi0+b2Zfbm9kZSwgIiNnbG9iYWwtaW50ZXJydXB0cyIsIGdsb2JhbF9pcnFz
KSkKIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLApAQCAtMTk5OCw3ICsy
MDAyLDI1IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNlX2R0X3Byb2JlKHN0cnVjdCBh
cm1fc21tdV9kZXZpY2UgKnNtbXUsCiAJaWYgKG9mX2RtYV9pc19jb2hlcmVudChkZXYtPm9m
X25vZGUpKQogCQlzbW11LT5mZWF0dXJlcyB8PSBBUk1fU01NVV9GRUFUX0NPSEVSRU5UX1dB
TEs7CiAKLQlyZXR1cm4gMDsKKwkvKiBJdCdzIGZpbmUgdG8gb21pdCB0aGUgT1BQIHRhYmxl
ICovCisJaWYgKCFkZXZfcG1fb3BwX29mX2dldF9vcHBfZGVzY19ub2RlKGRldikpCisJCXJl
dHVybiAwOworCisJcmV0ID0gZGV2bV9wbV9vcHBfb2ZfYWRkX3RhYmxlKGRldik7CisJaWYg
KHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldCA9IGRldl9wbV9vcHBfb2ZfZmluZF9pY2Nf
cGF0aHMoZGV2LCBOVUxMKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJb3BwID0g
ZGV2X3BtX29wcF9maW5kX2J3X2NlaWwoZGV2LCAmYncsIDApOworCWlmIChJU19FUlIob3Bw
KSkKKwkJcmV0dXJuIFBUUl9FUlIob3BwKTsKKworCWRldl9wbV9vcHBfc2V0X29wcChkZXYs
IG9wcCk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgdm9pZCBhcm1fc21tdV9ybXJf
aW5zdGFsbF9ieXBhc3Nfc21yKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpCkBAIC0y
MjI0LDggKzIyNDYsMjAgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfZGV2aWNlX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBhcm1fc21tdV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0
cnVjdCBkZXZfcG1fb3BwICpvcHA7CisJdW5zaWduZWQgaW50IGJ3ID0gMDsKIAlpbnQgcmV0
OwogCisJaWYgKFBUUl9FUlIoZGV2X3BtX29wcF9nZXRfb3BwX3RhYmxlKGRldikpIDwgMCkK
KwkJZ290byBza2lwX29wcDsKKworCW9wcCA9IGRldl9wbV9vcHBfZmluZF9id19jZWlsKGRl
diwgJmJ3LCAwKTsKKwlpZiAoSVNfRVJSKG9wcCkpCisJCXJldHVybiBQVFJfRVJSKG9wcCk7
CisKKwlkZXZfcG1fb3BwX3NldF9vcHAoZGV2LCBvcHApOworCitza2lwX29wcDoKIAlyZXQg
PSBjbGtfYnVsa19lbmFibGUoc21tdS0+bnVtX2Nsa3MsIHNtbXUtPmNsa3MpOwogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CkBAIC0yMjQxLDYgKzIyNzUsMTEgQEAgc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBhcm1fc21tdV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQogCiAJY2xrX2J1bGtfZGlzYWJsZShzbW11LT5udW1fY2xrcywgc21tdS0+Y2xrcyk7
CiAKKwlpZiAoUFRSX0VSUihkZXZfcG1fb3BwX2dldF9vcHBfdGFibGUoZGV2KSkgPCAwKQor
CQlyZXR1cm4gMDsKKworCWRldl9wbV9vcHBfc2V0X29wcChkZXYsIE5VTEwpOworCiAJcmV0
dXJuIDA7CiB9CiAKLS0gCjIuNDEuMAoK

--------------GYmyCXdemZ1VyOZMsdA20KP3--
