Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081A43DB20A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 05:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbhG3Dxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 23:53:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24067 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234733AbhG3Dxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 23:53:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627617215; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=h3QRUbjY3/MYcxFAA6X5fTV80RY62f6e6ae8EIvlifc=; b=kcwmMWt7jslEjim9VAi21i5ojNaPy0n86vnnN8GvvudkKVqFuyExZXWXJlIHQ4AXDtQiPHlT
 kEMWuxS6vq6A6d3cLbQs50h5lbRRUH2lp8D618imEyHWlKa6xsrfd38XgNBw0tThV1a6d8nn
 b2t+4hYJzuuOFiz4Ag3O2GVuU10=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 610377b74815712f3aa6fd30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 03:53:27
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51C32C43460; Fri, 30 Jul 2021 03:53:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.227.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CD6CC433D3;
        Fri, 30 Jul 2021 03:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CD6CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm: msm: Add 680 gpu to the adreno gpu list
To:     Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sean Paul <sean@poorly.run>
References: <20210725032002.3961691-1-bjorn.andersson@linaro.org>
 <CAF6AEGvADHz7YmOZQTX8g+ZRG1rp7sk9wevgBQsknQytH+eFSA@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20412cce-df2f-6271-9284-611f6b2ef1c5@codeaurora.org>
Date:   Fri, 30 Jul 2021 09:23:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvADHz7YmOZQTX8g+ZRG1rp7sk9wevgBQsknQytH+eFSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/30/2021 5:38 AM, Rob Clark wrote:
> On Sat, Jul 24, 2021 at 8:21 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>>
>> This patch adds a Adreno 680 entry to the gpulist.
> 
> Looks reasonable, but I wonder if we should just go ahead and add
> adreno_is_a640_family() in a similar vein to
> adreno_is_a650_familiy()/adreno_is_a660_family().. I think most of the
> 'if (a640) ...' should also apply to a680?

If there is no delta, wouldn't it be better to simply add a680 to 
adreno_is_a640?

-Akhil.

> 
> BR,
> -R
> 
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 +++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 +++++++-----
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  2 +-
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>>   5 files changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index b349692219b7..1c0d75e1189f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -521,7 +521,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>
>>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>>                  pdc_in_aop = true;
>> -       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>> +       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
>> +                adreno_is_a680(adreno_gpu))
>>                  pdc_address_offset = 0x30090;
>>          else
>>                  pdc_address_offset = 0x30080;
>> @@ -1522,7 +1523,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>                          SZ_16M - SZ_16K, 0x04000);
>>                  if (ret)
>>                          goto err_memory;
>> -       } else if (adreno_is_a640(adreno_gpu)) {
>> +       } else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
>>                  ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>>                          SZ_256K - SZ_16K, 0x04000);
>>                  if (ret)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 9c5e4618aa0a..5cdafc6c8bb0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>          if (adreno_is_a618(adreno_gpu))
>>                  return;
>>
>> -       if (adreno_is_a640(adreno_gpu))
>> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>>                  amsbc = 1;
>>
>>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>> @@ -757,7 +757,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>>           * a660 targets have all the critical security fixes from the start
>>           */
>>          if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
>> -               adreno_is_a640(adreno_gpu)) {
>> +           adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
>>                  /*
>>                   * If the lowest nibble is 0xa that is an indication that this
>>                   * microcode has been patched. The actual version is in dword
>> @@ -897,7 +897,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>          a6xx_set_hwcg(gpu, true);
>>
>>          /* VBIF/GBIF start*/
>> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
>> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
>> +           adreno_is_a680(adreno_gpu)) {
>>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
>>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
>> @@ -935,7 +936,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>          gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
>>          gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
>>
>> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
>> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
>> +           adreno_is_a680(adreno_gpu))
>>                  gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
>>          else
>>                  gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
>> @@ -952,7 +954,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>          */
>>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>> -       else if (adreno_is_a640(adreno_gpu))
>> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
>>          else
>>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 919433732b43..df8af237cf6a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -428,7 +428,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>
>>          if (adreno_is_a618(adreno_gpu))
>>                  a618_build_bw_table(&msg);
>> -       else if (adreno_is_a640(adreno_gpu))
>> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
>>                  a640_build_bw_table(&msg);
>>          else if (adreno_is_a650(adreno_gpu))
>>                  a650_build_bw_table(&msg);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 6dad8015c9a1..799e4a35ca44 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -300,6 +300,19 @@ static const struct adreno_info gpulist[] = {
>>                  .init = a6xx_gpu_init,
>>                  .zapfw = "a660_zap.mdt",
>>                  .hwcg = a660_hwcg,
>> +       }, {
>> +               .rev = ADRENO_REV(6, 8, 0, ANY_ID),
>> +               .revn = 680,
>> +               .name = "A680",
>> +               .fw = {
>> +                       [ADRENO_FW_SQE] = "a630_sqe.fw",
>> +                       [ADRENO_FW_GMU] = "a640_gmu.bin",
>> +               },
>> +               .gmem = SZ_2M,
>> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +               .init = a6xx_gpu_init,
>> +               .zapfw = "a640_zap.mdt",
>> +               .hwcg = a640_hwcg,
>>          },
>>   };
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 8dbe0d157520..a7e843e81b1e 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -258,6 +258,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>>          return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
>>   }
>>
>> +static inline int adreno_is_a680(struct adreno_gpu *gpu)
>> +{
>> +       return gpu->revn == 680;
>> +}
>> +
>>   int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>>   const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>>                  const char *fwname);
>> --
>> 2.29.2
>>

