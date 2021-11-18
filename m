Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F9D455970
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 11:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343557AbhKRKyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 05:54:36 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:48837 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343535AbhKRKyS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 05:54:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637232679; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5k+Vd3sGwqSJp8FP3QGkz1tM793VxNS0bm6nEdBfGzE=; b=Sm4qlhchgPoM6zwCbGqmugTxQYC6qAGuJZ5cyjl3GpGpxSezb7imaiWxPh1oWt4aP1bulGID
 74frjZFZhT/rXsNY3pErzIAhRBKkzqQmEUUQbDQ0l9IGoyxU7HAMnrePRl5ZyzqUTTP2g9SJ
 P3+kyGg0AOziaI7rl0Z8hzG5SNA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61963026638a2f4d611d3629 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:51:18
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A700C4361C; Thu, 18 Nov 2021 10:51:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C66BC43460;
        Thu, 18 Nov 2021 10:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9C66BC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
 <CAE-0n52n7nscLfqt8-7+UmXdEh2suDNC-ywPRUZL8FdPONbhZQ@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <38575d20-8e3f-2ba2-800d-e4b9b8ee0b68@codeaurora.org>
Date:   Thu, 18 Nov 2021 16:21:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52n7nscLfqt8-7+UmXdEh2suDNC-ywPRUZL8FdPONbhZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/16/2021 5:06 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
As this patch is already accepted, will post your review comments as 
additional patch.
> Quoting Srinivasa Rao Mandadapu (2021-11-14 23:11:28)
>> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
>> index 405128c..d6545e4 100644
>> --- a/sound/soc/codecs/wcd-mbhc-v2.c
>> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
>> @@ -1022,6 +1022,56 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
>>          return plug_type;
>>   }
>>
>> +static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
>> +{
>> +       int hs_threshold, micbias_mv;
>> +
>> +       micbias_mv = wcd_mbhc_get_micbias(mbhc);
>> +       if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
>> +               if (mbhc->cfg->micb_mv == micbias_mv)
>> +                       hs_threshold = mbhc->cfg->hs_thr;
>> +               else
>> +                       hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) / mbhc->cfg->micb_mv;
>> +       } else {
>> +               hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
>> +                                                       WCD_MBHC_ADC_MICBIAS_MV);
>> +       }
>> +       return hs_threshold;
>> +}
>> +
>> +static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
>> +{
>> +       bool is_spl_hs = false;
>> +       int output_mv, hs_threshold, hph_threshold;
>> +
>> +       if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
>> +               return false;
>> +
>> +       /* Bump up MIC_BIAS2 to 2.7V */
>> +       mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
>> +       usleep_range(10000, 10100);
>> +
>> +       output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
>> +       hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
>> +       hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
>> +
>> +       if (output_mv > hs_threshold || output_mv < hph_threshold) {
>> +               if (mbhc->force_linein == true)
> Just 'if (mbhc->force_linein)'
>
> Also, if this is false, then false is set above. So checking for
> mbhc->force_linein is useless.
Okay. Will check and do changes.
>
>> +                       is_spl_hs = false;
>> +       } else {
>> +               is_spl_hs = true;
>> +       }
>> +
>> +       /* Back MIC_BIAS2 to 1.8v if the type is not special headset */
>> +       if (!is_spl_hs) {
>> +               mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
>> +               /* Add 10ms delay for micbias to settle */
>> +               usleep_range(10000, 10100);
>> +       }
>> +
>> +       return is_spl_hs;
>> +}
>> +
>>   static void wcd_correct_swch_plug(struct work_struct *work)
>>   {
>>          struct wcd_mbhc *mbhc;
>> @@ -1029,12 +1079,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>>          enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
>>          unsigned long timeout;
>>          int pt_gnd_mic_swap_cnt = 0;
>> -       int output_mv, cross_conn, hs_threshold, try = 0;
>> +       int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
>> +       bool is_spl_hs = false;
>>          bool is_pa_on;
>>
>>          mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
>>          component = mbhc->component;
>>
>> +       micbias_mv = wcd_mbhc_get_micbias(mbhc);
>>          hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
>>
>>          /* Mask ADC COMPLETE interrupt */
>> @@ -1097,6 +1149,16 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>>                  plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
>>                  is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
>>
>> +               if ((output_mv > hs_threshold) && (!is_spl_hs)) {
> Please drop useless parenthesis
Okay.
>
>> +                       is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
>> +                       output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
>> +
>> +                       if (is_spl_hs) {
>> +                               hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
>> +                                                                       micbias_mv;
> Same. It may be good to split it to two assignments to clarify
> overflow/underflow.
Okay.
>
>> +                       }
>> +               }
>> +
>>                  if ((output_mv <= hs_threshold) && !is_pa_on) {
>>                          /* Check for cross connection*/
>>                          cross_conn = wcd_check_cross_conn(mbhc);
>> @@ -1122,14 +1184,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>>                          }
>>                  }
>>
>> -               if (output_mv > hs_threshold) /* cable is extension cable */
>> +               /* cable is extension cable */
>> +               if (output_mv > hs_threshold || mbhc->force_linein == true)
> Drop the == true please.
Okay.
>
>>                          plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
>>          }
>>
>>          wcd_mbhc_bcs_enable(mbhc, plug_type, true);
>>
>> -       if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
>> -               wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
>> +       if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
>> +               if (is_spl_hs)
>> +                       plug_type = MBHC_PLUG_TYPE_HEADSET;
>> +               else
>> +                       wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
>> +       }
>>
>>          wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
>>          wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

