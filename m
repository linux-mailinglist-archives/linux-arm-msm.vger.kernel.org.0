Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2341644BE4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 11:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhKJKPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 05:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJKPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 05:15:21 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2540C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:12:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id g14so8470693edz.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iwrQkGdUPhk+QMSVvZiSAulM37+6icUvxRn7kPKP+hw=;
        b=uP3euyDDsU9oS9V9jaeqz+9kbCdTk2b/bFUScZCBdkhwnGVOlDfYzb9X/NVGZbY5Wl
         dzsUhlwUCbR0xRdiDe5bVaBSGfoOxxxYmuZgoMofeTGxL8EkJWBqm/Y6ZgyZ4y0xzrWQ
         aYoBHmP0/93iceTpdPCoh04IMRytqrdWYPkLs5T/5pPvyCuTAxF3Um+SuZd9l6c8NdBb
         kA4xuXl3TnWRmCEnL9IcJZssNfTE0uACotqi4UmIe0/vkjDwxs9QnLMGRFNssKy+2t8A
         Z8X33Y5Wlam0kkD7Q9H8rHYgCxy5imrrxEbBI5rwbH/8QNA3JIHG8ne0wDSj8igRMWLp
         al1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iwrQkGdUPhk+QMSVvZiSAulM37+6icUvxRn7kPKP+hw=;
        b=ZOrMaClXcRI/NKQLISo7dTXGotAin4y5tfTqxAQGHi6ofGacM5/y8W3DLWqpdJP5ut
         Img8RnEWRbNnwioPSYArJOnE8KjZwpYuyQqa5ed83w12X4+vzqd05Xcq9RaljjnoZAdp
         9cTIiTMX5VgJ7wpI9r0SwlX9pC8yGdoepV8Pd8+cMi8dQDwBaVO58LkUzUn/Tz9amYoB
         qm1v0jJuMwp7Jxqkc8Gx9bd1dvlYCyfbHvO9kpNx20SHP8ajEDiiKperay47IviDC0El
         U/dN+10ZMwSsE01IzXhY3+y8Y+d6tfYHHUsRKL0lrUbGCU2Cj6OIUYFDkfCHK9qWWAmL
         pzaQ==
X-Gm-Message-State: AOAM530gb747No8AyaqMS3kHtbbiaSgFgOkBVcOtJiJrnUYL44ySORuI
        kNK1IbQgVLjVPL5s5BtaCiYu/g==
X-Google-Smtp-Source: ABdhPJyFMAADT0iNvQneqnoq3jXcfQ9exfItDCCBzjODGF6El21zfS6VYYeAkF3SXF3XSP6ZcoJNwg==
X-Received: by 2002:a05:6402:42c8:: with SMTP id i8mr20478536edc.60.1636539152289;
        Wed, 10 Nov 2021 02:12:32 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id r19sm12287575edt.54.2021.11.10.02.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 02:12:31 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: MBHC: Add support for special headset
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8422a82f-5aa7-2458-8080-87f330fa63ea@linaro.org>
Date:   Wed, 10 Nov 2021 10:12:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for adding this support.

few minor nits,

On 03/11/2021 11:18, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 78 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 405128c..3b4cd39 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1022,6 +1022,57 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
>   	return plug_type;
>   }
>   
> +static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
> +{
> +	int hs_threshold, micbias_mv;
> +
> +	micbias_mv = wcd_mbhc_get_micbias(mbhc);
> +	if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
> +		if (mbhc->cfg->micb_mv == micbias_mv)
> +			hs_threshold = mbhc->cfg->hs_thr;
> +		else
> +			hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) /
> +								mbhc->cfg->micb_mv;

You should consider using 100 chars per line, so that reading is much easy.

> +	} else {
> +		hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
> +							WCD_MBHC_ADC_MICBIAS_MV);
> +	}
> +	return hs_threshold;
> +}
> +
> +static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
> +{
> +	bool is_spl_hs = false;
> +	int output_mv, hs_threshold, hph_threshold;
> +
> +	if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
> +		return false;
> +
> +	/* Bump up MIC_BIAS2 to 2.7V */
> +	mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
> +	usleep_range(10000, 10100);
> +
> +	output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
> +	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
> +
> +	if (output_mv > hs_threshold || output_mv < hph_threshold) {
> +		if (mbhc->force_linein == true)
> +			is_spl_hs = false;
> +	} else {
> +		is_spl_hs = true;
> +	}
> +
> +	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
> +	if (!is_spl_hs) {
> +		mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
> +		/* Add 10ms delay for micbias to settle */
> +		usleep_range(10000, 10100);
> +	}
> +
> +	return is_spl_hs;
> +}
> +
>   static void wcd_correct_swch_plug(struct work_struct *work)
>   {
>   	struct wcd_mbhc *mbhc;
> @@ -1029,12 +1080,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   	enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
>   	unsigned long timeout;
>   	int pt_gnd_mic_swap_cnt = 0;
> -	int output_mv, cross_conn, hs_threshold, try = 0;
> +	int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
> +	bool is_spl_hs = false;
>   	bool is_pa_on;
>   
>   	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
>   	component = mbhc->component;
>   
> +	micbias_mv = wcd_mbhc_get_micbias(mbhc);
>   	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
>   
>   	/* Mask ADC COMPLETE interrupt */
> @@ -1097,6 +1150,18 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
>   		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
>   
> +
unnecessary extra new line here.

> +		if ((output_mv > hs_threshold) &&
> +		    (!is_spl_hs)) {
wrap to 100 chars and unneccessary brackets around the conditions.

With those fixed


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> +			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
> +			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +
> +			if (is_spl_hs) {
> +				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
> +									micbias_mv; > +			}
> +		}
> +
>   		if ((output_mv <= hs_threshold) && !is_pa_on) {
>   			/* Check for cross connection*/
>   			cross_conn = wcd_check_cross_conn(mbhc);
> @@ -1122,14 +1187,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   			}
>   		}
>   
> -		if (output_mv > hs_threshold) /* cable is extension cable */
> +		/* cable is extension cable */
> +		if (output_mv > hs_threshold || mbhc->force_linein == true)
>   			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
>   	}
>   
>   	wcd_mbhc_bcs_enable(mbhc, plug_type, true);
>   
> -	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
> -		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
> +		if (is_spl_hs)
> +			plug_type = MBHC_PLUG_TYPE_HEADSET;
> +		else
> +			wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +	}
>   
>   	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
>   	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
> 
