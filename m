Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEF41C527B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 12:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgEEKD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 06:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEKD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 06:03:57 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC67C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 03:03:57 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id a16so206203uaq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SwgIljhh2ADHvK3uJNC3DXF55+C4+DHGO17j6uXokDs=;
        b=OQvPzqLwG0nn07TKRqDvgqsB+PJtlA8q51zhokXSANL9cSRKC6v50Cl/lD8czDX2AG
         svg+voWRneqMTFLWbq8CH4D8p9p1cgm0JoRQfjp7hWImMCPnUFXTgURG2Skp2bvy55Dx
         9S4Y5USLPM0B3OKeiyGtI38SCUzHneUefsa6CIy9EtGE1FcfzMRTNoUy6q3/VVz4hE14
         L75wU69+WlxL/ErBQ6oe/vR6AgIAuPUFWQtECBuy9o5anzmhH1p5PjrpZ4yB3Me8Zcwq
         WeIrA8hOgTPPmFyBVh4ua1N3vj+SBlOSdcSReSvd9mb5/APHA46+ADytI0t80SR1Dhmh
         ul9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SwgIljhh2ADHvK3uJNC3DXF55+C4+DHGO17j6uXokDs=;
        b=AfTmoCkoobjMn4z+q0IAsAR8nF0uSgSoPoRkVL4ouocTCk6nTvtDYZuRg1iQbUvQmr
         x62U80Ioz2LSJTYadyPUWTxXoLidY8Rd26FpXGhZVRO36XPb6/WbfS45VSPDZCnagNzY
         kpd5eBjvrL0DGjyC7An9C/gdM4hvHSGPo48AxGFTLM8JobbQc7SIw+OE+VI10m8PuR7q
         tMNiw73qJzTdh6C0XmRNACecyWC72eSodz7+qQIbu9/jtRGQ4r2mtAZvfDZUWAF3gRvn
         Iqx9/8H3m07pwg7FQDC0ZJO17K3KCLNyHdMpQR7eLwGicNC+aeY0TSOgERAzIOjKT8KN
         q22Q==
X-Gm-Message-State: AGi0PuanQi3dgS6e9AQXMgS2K1SvMRNa6GhoiJyWb2wV42Ua4ifiqYe9
        yUgjnI2W9k/zaELXoIPAZyStx+HMDkD//AFt/on5SQ==
X-Google-Smtp-Source: APiQypIyMDmkY/PVkNpUwcTV/UGuhSFxO0YSwEcKHkZNkt7TGzbMjP6STCP+deU4BRZ7L+LiO2rQ92PTszIKg/ovve4=
X-Received: by 2002:ab0:22c5:: with SMTP id z5mr1571664uam.48.1588673035832;
 Tue, 05 May 2020 03:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1587993846-30773-1-git-send-email-jprakash@codeaurora.org> <1587993846-30773-4-git-send-email-jprakash@codeaurora.org>
In-Reply-To: <1587993846-30773-4-git-send-email-jprakash@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 5 May 2020 15:33:24 +0530
Message-ID: <CAHLCerPrZNBt+J_yZom1dtJ20r-H2_dAmHWFf9_bs3QV823Lgw@mail.gmail.com>
Subject: Re: [PATCH V3 3/4] iio: adc: Add support for PMIC7 ADC
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan.Cameron@huawei.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-iio@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jishnu,

It is nice to cc a reviewer from a previous version. Just saw this.

On Mon, Apr 27, 2020 at 6:55 PM Jishnu Prakash <jprakash@codeaurora.org> wrote:
>
> The ADC architecture on PMIC7 is changed as compared to PMIC5. The
> major change from PMIC5 is that all SW communication to ADC goes through
> PMK8350, which communicates with other PMICs through PBS when the ADC
> on PMK8350 works in master mode. The SID register is used to identify the
> PMICs with which the PBS needs to communicate. Add support for the same.
>
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
> ---
>  drivers/iio/adc/qcom-spmi-adc5.c   | 239 +++++++++++++++++++++++++++++++++-
>  drivers/iio/adc/qcom-vadc-common.c | 260 +++++++++++++++++++++++++++++++++++++
>  drivers/iio/adc/qcom-vadc-common.h |  15 +++
>  3 files changed, 510 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
> index 21fdcde..a66eeb7 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved.
>   */
>
>  #include <linux/bitops.h>
> @@ -23,6 +23,7 @@
>
>  #define ADC5_USR_REVISION1                     0x0
>  #define ADC5_USR_STATUS1                       0x8
> +#define ADC5_USR_STATUS1_CONV_FAULT            BIT(7)
>  #define ADC5_USR_STATUS1_REQ_STS               BIT(1)
>  #define ADC5_USR_STATUS1_EOC                   BIT(0)
>  #define ADC5_USR_STATUS1_REQ_STS_EOC_MASK      0x3
> @@ -65,6 +66,9 @@
>
>  #define ADC5_USR_IBAT_DATA1                    0x53
>
> +#define ADC_CHANNEL_OFFSET                     0x8
> +#define ADC_CHANNEL_MASK                       GENMASK(7, 0)
> +
>  /*
>   * Conversion time varies based on the decimation, clock rate, fast average
>   * samples and measurements queued across different VADC peripherals.
> @@ -79,6 +83,11 @@
>  #define ADC5_HW_SETTLE_DIFF_MINOR              3
>  #define ADC5_HW_SETTLE_DIFF_MAJOR              5
>
> +/* For PMIC7 */
> +#define ADC_APP_SID                            0x40
> +#define ADC_APP_SID_MASK                       GENMASK(3, 0)
> +#define ADC7_CONV_TIMEOUT                      msecs_to_jiffies(10)
> +
>  enum adc5_cal_method {
>         ADC5_NO_CAL = 0,
>         ADC5_RATIOMETRIC_CAL,
> @@ -96,6 +105,7 @@ enum adc5_cal_val {
>   * @cal_method: calibration method.
>   * @cal_val: calibration value
>   * @decimation: sampling rate supported for the channel.
> + * @sid: slave id of PMIC owning the channel, for PMIC7.
>   * @prescale: channel scaling performed on the input signal.
>   * @hw_settle_time: the time between AMUX being configured and the
>   *     start of conversion.
> @@ -110,6 +120,7 @@ struct adc5_channel_prop {
>         enum adc5_cal_method    cal_method;
>         enum adc5_cal_val       cal_val;
>         unsigned int            decimation;
> +       unsigned int            sid;
>         unsigned int            prescale;
>         unsigned int            hw_settle_time;
>         unsigned int            avg_samples;
> @@ -140,6 +151,7 @@ struct adc5_chip {
>         bool                    poll_eoc;
>         struct completion       complete;
>         struct mutex            lock;
> +       int                     irq_eoc;
>         const struct adc5_data  *data;
>  };
>
> @@ -155,6 +167,8 @@ static const struct vadc_prescale_ratio adc5_prescale_ratios[] = {
>         {.num =  1, .den = 16}
>  };
>
> +static const struct adc5_data adc7_data_pmic;
> +
>  static int adc5_read(struct adc5_chip *adc, u16 offset, u8 *data, int len)
>  {
>         return regmap_bulk_read(adc->regmap, adc->base + offset, data, len);
> @@ -165,6 +179,11 @@ static int adc5_write(struct adc5_chip *adc, u16 offset, u8 *data, int len)
>         return regmap_bulk_write(adc->regmap, adc->base + offset, data, len);
>  }
>
> +static int adc5_masked_write(struct adc5_chip *adc, u16 offset, u8 mask, u8 val)
> +{
> +       return regmap_update_bits(adc->regmap, adc->base + offset, mask, val);
> +}
> +
>  static int adc5_prescaling_from_dt(u32 num, u32 den)
>  {
>         unsigned int pre;
> @@ -314,6 +333,47 @@ static int adc5_configure(struct adc5_chip *adc,
>         return adc5_write(adc, ADC5_USR_DIG_PARAM, buf, sizeof(buf));
>  }
>
> +static int adc7_configure(struct adc5_chip *adc,
> +                       struct adc5_channel_prop *prop)
> +{
> +       int ret;
> +       u8 conv_req = 0, buf[4];
> +
> +       ret = adc5_masked_write(adc, ADC_APP_SID, ADC_APP_SID_MASK, prop->sid);
> +       if (ret)
> +               return ret;
> +
> +       ret = adc5_read(adc, ADC5_USR_DIG_PARAM, buf, sizeof(buf));
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Digital param selection */
> +       adc5_update_dig_param(adc, prop, &buf[0]);
> +
> +       /* Update fast average sample value */
> +       buf[1] &= 0xff & ~ADC5_USR_FAST_AVG_CTL_SAMPLES_MASK;

Did you answer Andy's query about this in v2? I couldn't find it.

> +       buf[1] |= prop->avg_samples;
> +
> +       /* Select ADC channel */
> +       buf[2] = prop->channel;
> +
> +       /* Select HW settle delay for channel */
> +       buf[3] &= 0xff & ~ADC5_USR_HW_SETTLE_DELAY_MASK;

Same here.

> +       buf[3] |= prop->hw_settle_time;
> +
> +       /* Select CONV request */
> +       conv_req = ADC5_USR_CONV_REQ_REQ;
> +
> +       if (!adc->poll_eoc)
> +               reinit_completion(&adc->complete);
> +
> +       ret = adc5_write(adc, ADC5_USR_DIG_PARAM, buf, sizeof(buf));
> +       if (ret)
> +               return ret;
> +
> +       return adc5_write(adc, ADC5_USR_CONV_REQ, &conv_req, 1);

Is it required to call adc5_write() twice here in sequence on the
adc7? adc5_configure() above manages just fine by having an extra
element in buf and one call.

> +}
> +
>  static int adc5_do_conversion(struct adc5_chip *adc,
>                         struct adc5_channel_prop *prop,
>                         struct iio_chan_spec const *chan,
> @@ -355,6 +415,43 @@ static int adc5_do_conversion(struct adc5_chip *adc,
>         return ret;
>  }
>
> +static int adc7_do_conversion(struct adc5_chip *adc,
> +                       struct adc5_channel_prop *prop,
> +                       struct iio_chan_spec const *chan,
> +                       u16 *data_volt, u16 *data_cur)
> +{
> +       int ret;
> +       u8 status;
> +
> +       mutex_lock(&adc->lock);
> +
> +       ret = adc7_configure(adc, prop);
> +       if (ret) {
> +               dev_err(adc->dev, "ADC configure failed with %d\n", ret);
> +               goto unlock;
> +       }
> +
> +       /* No support for polling mode at present */
> +       wait_for_completion_timeout(&adc->complete, ADC7_CONV_TIMEOUT);
> +
> +       ret = adc5_read(adc, ADC5_USR_STATUS1, &status, 1);
> +       if (ret < 0)
> +               goto unlock;
> +
> +       if (status & ADC5_USR_STATUS1_CONV_FAULT) {
> +               dev_err(adc->dev, "Unexpected conversion fault\n");
> +               ret = -EIO;
> +               goto unlock;
> +       }
> +
> +       ret = adc5_read_voltage_data(adc, data_volt);
> +
> +unlock:
> +       mutex_unlock(&adc->lock);
> +
> +       return ret;
> +}
> +
>  static irqreturn_t adc5_isr(int irq, void *dev_id)
>  {
>         struct adc5_chip *adc = dev_id;
> @@ -377,6 +474,56 @@ static int adc5_of_xlate(struct iio_dev *indio_dev,
>         return -EINVAL;
>  }
>
> +static int adc7_of_xlate(struct iio_dev *indio_dev,
> +                               const struct of_phandle_args *iiospec)
> +{
> +       struct adc5_chip *adc = iio_priv(indio_dev);
> +       int i, v_channel;
> +
> +       for (i = 0; i < adc->nchannels; i++) {
> +               v_channel = (adc->chan_props[i].sid << ADC_CHANNEL_OFFSET |
> +                       adc->chan_props[i].channel);
> +               if (v_channel == iiospec->args[0])
> +                       return i;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int adc7_read_raw(struct iio_dev *indio_dev,
> +                        struct iio_chan_spec const *chan, int *val, int *val2,
> +                        long mask)

Just a nit. Since all your adc7 functions follow your adc5 functions,
please move this below adc5_read_raw for consistency.

> +{
> +       struct adc5_chip *adc = iio_priv(indio_dev);
> +       struct adc5_channel_prop *prop;
> +       u16 adc_code_volt, adc_code_cur;
> +       int ret;
> +
> +       prop = &adc->chan_props[chan->address];
> +
> +       switch (mask) {
> +       case IIO_CHAN_INFO_PROCESSED:
> +               ret = adc7_do_conversion(adc, prop, chan,

Except for this bit (call to adc7_do_conversion instead of
adc5_do_conversion), this function is identical to adc5_read_raw.

How about making adc5_read_raw and adc7_read_raw a shim around a
function adc_read_raw_common() that takes a function pointer?

> +                                       &adc_code_volt, &adc_code_cur);
> +               if (ret)
> +                       return ret;
> +
> +               ret = qcom_adc5_hw_scale(prop->scale_fn_type,
> +                       &adc5_prescale_ratios[prop->prescale],
> +                       adc->data,
> +                       adc_code_volt, val);
> +
> +               if (ret)
> +                       return ret;
> +
> +               return IIO_VAL_INT;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static int adc5_read_raw(struct iio_dev *indio_dev,
>                          struct iio_chan_spec const *chan, int *val, int *val2,
>                          long mask)
> @@ -415,6 +562,11 @@ static const struct iio_info adc5_info = {
>         .of_xlate = adc5_of_xlate,
>  };
>
> +static const struct iio_info adc7_info = {
> +       .read_raw = adc7_read_raw,
> +       .of_xlate = adc7_of_xlate,
> +};
> +
>  struct adc5_channels {
>         const char *datasheet_name;
>         unsigned int prescale_index;
> @@ -477,6 +629,39 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
>                                         SCALE_HW_CALIB_PM5_SMB_TEMP)
>  };
>
> +static const struct adc5_channels adc7_chans_pmic[ADC5_MAX_CHANNEL] = {
> +       [ADC7_REF_GND]          = ADC5_CHAN_VOLT("ref_gnd", 0,
> +                                       SCALE_HW_CALIB_DEFAULT)
> +       [ADC7_1P25VREF]         = ADC5_CHAN_VOLT("vref_1p25", 0,
> +                                       SCALE_HW_CALIB_DEFAULT)
> +       [ADC7_VPH_PWR]          = ADC5_CHAN_VOLT("vph_pwr", 1,
> +                                       SCALE_HW_CALIB_DEFAULT)
> +       [ADC7_VBAT_SNS]         = ADC5_CHAN_VOLT("vbat_sns", 3,
> +                                       SCALE_HW_CALIB_DEFAULT)
> +       [ADC7_DIE_TEMP]         = ADC5_CHAN_TEMP("die_temp", 0,
> +                                       SCALE_HW_CALIB_PMIC_THERM_PM7)
> +       [ADC7_AMUX_THM1_100K_PU]        = ADC5_CHAN_TEMP("amux_thm1_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_AMUX_THM2_100K_PU]        = ADC5_CHAN_TEMP("amux_thm2_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_AMUX_THM3_100K_PU]        = ADC5_CHAN_TEMP("amux_thm3_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_AMUX_THM4_100K_PU]        = ADC5_CHAN_TEMP("amux_thm4_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_AMUX_THM5_100K_PU]        = ADC5_CHAN_TEMP("amux_thm5_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_AMUX_THM6_100K_PU]        = ADC5_CHAN_TEMP("amux_thm6_pu2", 0,

Use space instead of tab for indentation in all the THMx channels to
make it look more in line.

> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_GPIO1_100K_PU]    = ADC5_CHAN_TEMP("gpio1_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_GPIO2_100K_PU]    = ADC5_CHAN_TEMP("gpio2_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_GPIO3_100K_PU]    = ADC5_CHAN_TEMP("gpio3_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +       [ADC7_GPIO4_100K_PU]    = ADC5_CHAN_TEMP("gpio4_pu2", 0,
> +                                       SCALE_HW_CALIB_THERM_100K_PU_PM7)
> +};
> +
>  static const struct adc5_channels adc5_chans_rev2[ADC5_MAX_CHANNEL] = {
>         [ADC5_REF_GND]          = ADC5_CHAN_VOLT("ref_gnd", 0,
>                                         SCALE_HW_CALIB_DEFAULT)
> @@ -511,6 +696,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
>  {
>         const char *name = node->name, *channel_name;
>         u32 chan, value, varr[2];
> +       u32 sid = 0;
>         int ret;
>         struct device *dev = adc->dev;
>
> @@ -520,6 +706,15 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
>                 return ret;
>         }
>
> +       /* Value read from "reg" is virtual channel number */
> +
> +       /* virtual channel number = sid << 8 | channel number */
> +
> +       if (adc->data == &adc7_data_pmic) {
> +               sid = chan >> ADC_CHANNEL_OFFSET;
> +               chan = chan & ADC_CHANNEL_MASK;
> +       }
> +
>         if (chan > ADC5_PARALLEL_ISENSE_VBAT_IDATA ||
>             !data->adc_chans[chan].datasheet_name) {
>                 dev_err(dev, "%s invalid channel number %d\n", name, chan);
> @@ -528,6 +723,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
>
>         /* the channel has DT description */
>         prop->channel = chan;
> +       prop->sid = sid;
>
>         channel_name = of_get_property(node,
>                                 "label", NULL) ? : node->name;
> @@ -578,8 +774,9 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
>                 pr_debug("dig_ver:minor:%d, major:%d\n", dig_version[0],
>                                                 dig_version[1]);
>                 /* Digital controller >= 5.3 have hw_settle_2 option */
> -               if (dig_version[0] >= ADC5_HW_SETTLE_DIFF_MINOR &&
> -                       dig_version[1] >= ADC5_HW_SETTLE_DIFF_MAJOR)
> +               if ((dig_version[0] >= ADC5_HW_SETTLE_DIFF_MINOR &&
> +                       dig_version[1] >= ADC5_HW_SETTLE_DIFF_MAJOR) ||
> +                       adc->data == &adc7_data_pmic)
>                         ret = adc5_hw_settle_time_from_dt(value,
>                                                         data->hw_settle_2);
>                 else
> @@ -629,6 +826,7 @@ static const struct adc5_data adc5_data_pmic = {
>         .full_scale_code_volt = 0x70e4,
>         .full_scale_code_cur = 0x2710,
>         .adc_chans = adc5_chans_pmic,
> +       .info = &adc5_info,

This belongs in a separate patch along with the change in
adc5_data_pmic_rev2 below

>         .decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
>                                 {250, 420, 840},
>         .hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
> @@ -639,10 +837,23 @@ static const struct adc5_data adc5_data_pmic = {
>                                 1, 2, 4, 8, 16, 32, 64, 128},
>  };
>
> +static const struct adc5_data adc7_data_pmic = {
> +       .full_scale_code_volt = 0x70e4,
> +       .adc_chans = adc7_chans_pmic,
> +       .info = &adc7_info,
> +       .decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
> +                               {85, 340, 1360},
> +       .hw_settle_2 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
> +                               {15, 100, 200, 300, 400, 500, 600, 700,
> +                               1000, 2000, 4000, 8000, 16000, 32000,
> +                               64000, 128000},
> +};
> +
>  static const struct adc5_data adc5_data_pmic_rev2 = {
>         .full_scale_code_volt = 0x4000,
>         .full_scale_code_cur = 0x1800,
>         .adc_chans = adc5_chans_rev2,
> +       .info = &adc5_info,

Separate patch.

>         .decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
>                                 {256, 512, 1024},
>         .hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
> @@ -659,6 +870,10 @@ static const struct of_device_id adc5_match_table[] = {
>                 .data = &adc5_data_pmic,
>         },
>         {
> +               .compatible = "qcom,spmi-adc7",
> +               .data = &adc7_data_pmic,
> +       },
> +       {
>                 .compatible = "qcom,spmi-adc-rev2",
>                 .data = &adc5_data_pmic_rev2,
>         },
> @@ -752,6 +967,9 @@ static int adc5_probe(struct platform_device *pdev)
>         adc->regmap = regmap;
>         adc->dev = dev;
>         adc->base = reg;
> +
> +       platform_set_drvdata(pdev, adc);
> +
>         init_completion(&adc->complete);
>         mutex_init(&adc->lock);
>
> @@ -761,6 +979,8 @@ static int adc5_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       indio_dev->info = adc->data->info;
> +
>         irq_eoc = platform_get_irq(pdev, 0);
>         if (irq_eoc < 0) {
>                 if (irq_eoc == -EPROBE_DEFER || irq_eoc == -EINVAL)
> @@ -773,23 +993,34 @@ static int adc5_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       adc->irq_eoc = irq_eoc;
> +

I think this belongs in a separate patch along with the adc5_exit
function below.

>         indio_dev->dev.parent = dev;
>         indio_dev->dev.of_node = node;
>         indio_dev->name = pdev->name;
>         indio_dev->modes = INDIO_DIRECT_MODE;
> -       indio_dev->info = &adc5_info;
>         indio_dev->channels = adc->iio_chans;
>         indio_dev->num_channels = adc->nchannels;
>
>         return devm_iio_device_register(dev, indio_dev);
>  }
>
> +static int adc5_exit(struct platform_device *pdev)
> +{
> +       struct adc5_chip *adc = platform_get_drvdata(pdev);
> +
> +       if (adc->irq_eoc >= 0)
> +               disable_irq(adc->irq_eoc);
> +       return 0;
> +}
> +
>  static struct platform_driver adc5_driver = {
>         .driver = {
>                 .name = "qcom-spmi-adc5.c",
>                 .of_match_table = adc5_match_table,
>         },
>         .probe = adc5_probe,
> +       .remove = adc5_exit,

This really belongs in a separate patch

>  };
>  module_platform_driver(adc5_driver);
>
> diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
> index 2bb78d1..b6915c2 100644
> --- a/drivers/iio/adc/qcom-vadc-common.c
> +++ b/drivers/iio/adc/qcom-vadc-common.c
> @@ -89,6 +89,195 @@ static const struct vadc_map_pt adcmap_100k_104ef_104fb_1875_vref[] = {
>         { 46,   125000 },
>  };
>
> +static const struct vadc_map_pt adcmap7_die_temp[] = {
> +       { 433700, 1967},
> +       { 473100, 1964},
> +       { 512400, 1957},
> +       { 551500, 1949},
> +       { 590500, 1940},
> +       { 629300, 1930},
> +       { 667900, 1921},
> +       { 706400, 1910},
> +       { 744600, 1896},
> +       { 782500, 1878},
> +       { 820100, 1859},
> +       { 857300, 0},
> +};
> +
> +/*
> + * Resistance to temperature table for 100k pull up for NTCG104EF104.
> + */
> +static const struct vadc_map_pt adcmap7_100k[] = {
> +       { 4250657, -40960 },
> +       { 3962085, -39936 },
> +       { 3694875, -38912 },
> +       { 3447322, -37888 },
> +       { 3217867, -36864 },
> +       { 3005082, -35840 },
> +       { 2807660, -34816 },
> +       { 2624405, -33792 },
> +       { 2454218, -32768 },
> +       { 2296094, -31744 },
> +       { 2149108, -30720 },
> +       { 2012414, -29696 },
> +       { 1885232, -28672 },
> +       { 1766846, -27648 },
> +       { 1656598, -26624 },
> +       { 1553884, -25600 },
> +       { 1458147, -24576 },
> +       { 1368873, -23552 },
> +       { 1285590, -22528 },
> +       { 1207863, -21504 },
> +       { 1135290, -20480 },
> +       { 1067501, -19456 },
> +       { 1004155, -18432 },
> +       { 944935, -17408 },
> +       { 889550, -16384 },
> +       { 837731, -15360 },
> +       { 789229, -14336 },
> +       { 743813, -13312 },
> +       { 701271, -12288 },
> +       { 661405, -11264 },
> +       { 624032, -10240 },
> +       { 588982, -9216 },
> +       { 556100, -8192 },
> +       { 525239, -7168 },
> +       { 496264, -6144 },
> +       { 469050, -5120 },
> +       { 443480, -4096 },
> +       { 419448, -3072 },
> +       { 396851, -2048 },
> +       { 375597, -1024 },
> +       { 355598, 0 },
> +       { 336775, 1024 },
> +       { 319052, 2048 },
> +       { 302359, 3072 },
> +       { 286630, 4096 },
> +       { 271806, 5120 },
> +       { 257829, 6144 },
> +       { 244646, 7168 },
> +       { 232209, 8192 },
> +       { 220471, 9216 },
> +       { 209390, 10240 },
> +       { 198926, 11264 },
> +       { 189040, 12288 },
> +       { 179698, 13312 },
> +       { 170868, 14336 },
> +       { 162519, 15360 },
> +       { 154622, 16384 },
> +       { 147150, 17408 },
> +       { 140079, 18432 },
> +       { 133385, 19456 },
> +       { 127046, 20480 },
> +       { 121042, 21504 },
> +       { 115352, 22528 },
> +       { 109960, 23552 },
> +       { 104848, 24576 },
> +       { 100000, 25600 },
> +       { 95402, 26624 },
> +       { 91038, 27648 },
> +       { 86897, 28672 },
> +       { 82965, 29696 },
> +       { 79232, 30720 },
> +       { 75686, 31744 },
> +       { 72316, 32768 },
> +       { 69114, 33792 },
> +       { 66070, 34816 },
> +       { 63176, 35840 },
> +       { 60423, 36864 },
> +       { 57804, 37888 },
> +       { 55312, 38912 },
> +       { 52940, 39936 },
> +       { 50681, 40960 },
> +       { 48531, 41984 },
> +       { 46482, 43008 },
> +       { 44530, 44032 },
> +       { 42670, 45056 },
> +       { 40897, 46080 },
> +       { 39207, 47104 },
> +       { 37595, 48128 },
> +       { 36057, 49152 },
> +       { 34590, 50176 },
> +       { 33190, 51200 },
> +       { 31853, 52224 },
> +       { 30577, 53248 },
> +       { 29358, 54272 },
> +       { 28194, 55296 },
> +       { 27082, 56320 },
> +       { 26020, 57344 },
> +       { 25004, 58368 },
> +       { 24033, 59392 },
> +       { 23104, 60416 },
> +       { 22216, 61440 },
> +       { 21367, 62464 },
> +       { 20554, 63488 },
> +       { 19776, 64512 },
> +       { 19031, 65536 },
> +       { 18318, 66560 },
> +       { 17636, 67584 },
> +       { 16982, 68608 },
> +       { 16355, 69632 },
> +       { 15755, 70656 },
> +       { 15180, 71680 },
> +       { 14628, 72704 },
> +       { 14099, 73728 },
> +       { 13592, 74752 },
> +       { 13106, 75776 },
> +       { 12640, 76800 },
> +       { 12192, 77824 },
> +       { 11762, 78848 },
> +       { 11350, 79872 },
> +       { 10954, 80896 },
> +       { 10574, 81920 },
> +       { 10209, 82944 },
> +       { 9858, 83968 },
> +       { 9521, 84992 },
> +       { 9197, 86016 },
> +       { 8886, 87040 },
> +       { 8587, 88064 },
> +       { 8299, 89088 },
> +       { 8023, 90112 },
> +       { 7757, 91136 },
> +       { 7501, 92160 },
> +       { 7254, 93184 },
> +       { 7017, 94208 },
> +       { 6789, 95232 },
> +       { 6570, 96256 },
> +       { 6358, 97280 },
> +       { 6155, 98304 },
> +       { 5959, 99328 },
> +       { 5770, 100352 },
> +       { 5588, 101376 },
> +       { 5412, 102400 },
> +       { 5243, 103424 },
> +       { 5080, 104448 },
> +       { 4923, 105472 },
> +       { 4771, 106496 },
> +       { 4625, 107520 },
> +       { 4484, 108544 },
> +       { 4348, 109568 },
> +       { 4217, 110592 },
> +       { 4090, 111616 },
> +       { 3968, 112640 },
> +       { 3850, 113664 },
> +       { 3736, 114688 },
> +       { 3626, 115712 },
> +       { 3519, 116736 },
> +       { 3417, 117760 },
> +       { 3317, 118784 },
> +       { 3221, 119808 },
> +       { 3129, 120832 },
> +       { 3039, 121856 },
> +       { 2952, 122880 },
> +       { 2868, 123904 },
> +       { 2787, 124928 },
> +       { 2709, 125952 },
> +       { 2633, 126976 },
> +       { 2560, 128000 },
> +       { 2489, 129024 },
> +       { 2420, 130048 }
> +};
> +
>  static int qcom_vadc_scale_hw_calib_volt(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
> @@ -97,6 +286,10 @@ static int qcom_vadc_scale_hw_calib_therm(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
>                                 u16 adc_code, int *result_mdec);
> +static int qcom_vadc7_scale_hw_calib_therm(
> +                               const struct vadc_prescale_ratio *prescale,
> +                               const struct adc5_data *data,
> +                               u16 adc_code, int *result_mdec);
>  static int qcom_vadc_scale_hw_smb_temp(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
> @@ -109,12 +302,20 @@ static int qcom_vadc_scale_hw_calib_die_temp(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
>                                 u16 adc_code, int *result_mdec);
> +static int qcom_vadc7_scale_hw_calib_die_temp(
> +                               const struct vadc_prescale_ratio *prescale,
> +                               const struct adc5_data *data,
> +                               u16 adc_code, int *result_mdec);
>
>  static struct qcom_adc5_scale_type scale_adc5_fn[] = {
>         [SCALE_HW_CALIB_DEFAULT] = {qcom_vadc_scale_hw_calib_volt},
>         [SCALE_HW_CALIB_THERM_100K_PULLUP] = {qcom_vadc_scale_hw_calib_therm},
>         [SCALE_HW_CALIB_XOTHERM] = {qcom_vadc_scale_hw_calib_therm},
> +       [SCALE_HW_CALIB_THERM_100K_PU_PM7] = {
> +                                       qcom_vadc7_scale_hw_calib_therm},
>         [SCALE_HW_CALIB_PMIC_THERM] = {qcom_vadc_scale_hw_calib_die_temp},
> +       [SCALE_HW_CALIB_PMIC_THERM_PM7] = {
> +                                       qcom_vadc7_scale_hw_calib_die_temp},
>         [SCALE_HW_CALIB_PM5_CHG_TEMP] = {qcom_vadc_scale_hw_chg5_temp},
>         [SCALE_HW_CALIB_PM5_SMB_TEMP] = {qcom_vadc_scale_hw_smb_temp},
>  };
> @@ -291,6 +492,32 @@ static int qcom_vadc_scale_code_voltage_factor(u16 adc_code,
>         return (int) voltage;
>  }
>
> +static int qcom_vadc7_scale_hw_calib_therm(
> +                               const struct vadc_prescale_ratio *prescale,
> +                               const struct adc5_data *data,
> +                               u16 adc_code, int *result_mdec)
> +{
> +       s64 resistance = adc_code;
> +       int ret, result;
> +
> +       if (adc_code >= RATIO_MAX_ADC7)
> +               return -EINVAL;
> +
> +       /* (ADC code * R_PULLUP (100Kohm)) / (full_scale_code - ADC code)*/
> +       resistance *= R_PU_100K;
> +       resistance = div64_s64(resistance, RATIO_MAX_ADC7 - adc_code);
> +
> +       ret = qcom_vadc_map_voltage_temp(adcmap7_100k,
> +                                ARRAY_SIZE(adcmap7_100k),
> +                                resistance, &result);
> +       if (ret)
> +               return ret;
> +
> +       *result_mdec = result;
> +
> +       return 0;
> +}
> +
>  static int qcom_vadc_scale_hw_calib_volt(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
> @@ -330,6 +557,39 @@ static int qcom_vadc_scale_hw_calib_die_temp(
>         return 0;
>  }
>
> +static int qcom_vadc7_scale_hw_calib_die_temp(
> +                               const struct vadc_prescale_ratio *prescale,
> +                               const struct adc5_data *data,
> +                               u16 adc_code, int *result_mdec)
> +{
> +
> +       int voltage, vtemp0, temp, i = ARRAY_SIZE(adcmap7_die_temp) - 1;
> +
> +       voltage = qcom_vadc_scale_code_voltage_factor(adc_code,
> +                               prescale, data, 1);
> +
> +       if (adcmap7_die_temp[0].x > voltage) {
> +               *result_mdec = DIE_TEMP_ADC7_SCALE_1;
> +               return 0;
> +       } else if (adcmap7_die_temp[i].x <= voltage) {
> +               *result_mdec = DIE_TEMP_ADC7_MAX;
> +               return 0;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(adcmap7_die_temp); i++)
> +               if (adcmap7_die_temp[i].x > voltage)
> +                       break;
> +
> +       vtemp0 = adcmap7_die_temp[i - 1].x;
> +       voltage = voltage - vtemp0;
> +       temp = div64_s64(voltage * DIE_TEMP_ADC7_SCALE_FACTOR,
> +               adcmap7_die_temp[i - 1].y);
> +       temp += DIE_TEMP_ADC7_SCALE_1 + (DIE_TEMP_ADC7_SCALE_2 * (i - 1));
> +       *result_mdec = temp;
> +
> +       return 0;
> +}
> +
>  static int qcom_vadc_scale_hw_smb_temp(
>                                 const struct vadc_prescale_ratio *prescale,
>                                 const struct adc5_data *data,
> diff --git a/drivers/iio/adc/qcom-vadc-common.h b/drivers/iio/adc/qcom-vadc-common.h
> index e074902a..d195e83 100644
> --- a/drivers/iio/adc/qcom-vadc-common.h
> +++ b/drivers/iio/adc/qcom-vadc-common.h
> @@ -49,6 +49,14 @@
>  #define ADC5_FULL_SCALE_CODE                   0x70e4
>  #define ADC5_USR_DATA_CHECK                    0x8000
>
> +#define R_PU_100K                      100000
> +#define RATIO_MAX_ADC7         0x4000
> +
> +#define DIE_TEMP_ADC7_SCALE_1                          -60000
> +#define DIE_TEMP_ADC7_SCALE_2                          20000
> +#define DIE_TEMP_ADC7_SCALE_FACTOR                     1000
> +#define DIE_TEMP_ADC7_MAX                              160000
> +
>  /**
>   * struct vadc_map_pt - Map the graph representation for ADC channel
>   * @x: Represent the ADC digitized code.
> @@ -110,8 +118,12 @@ struct vadc_prescale_ratio {
>   *     lookup table. The hardware applies offset/slope to adc code.
>   * SCALE_HW_CALIB_XOTHERM: Returns XO thermistor voltage in millidegC using
>   *     100k pullup. The hardware applies offset/slope to adc code.
> + * SCALE_HW_CALIB_THERM_100K_PU_PM7: Returns temperature in millidegC using
> + *     lookup table for PMIC7. The hardware applies offset/slope to adc code.
>   * SCALE_HW_CALIB_PMIC_THERM: Returns result in milli degree's Centigrade.
>   *     The hardware applies offset/slope to adc code.
> + * SCALE_HW_CALIB_PMIC_THERM: Returns result in milli degree's Centigrade.
> + *     The hardware applies offset/slope to adc code. This is for PMIC7.
>   * SCALE_HW_CALIB_PM5_CHG_TEMP: Returns result in millidegrees for PMIC5
>   *     charger temperature.
>   * SCALE_HW_CALIB_PM5_SMB_TEMP: Returns result in millidegrees for PMIC5
> @@ -126,7 +138,9 @@ enum vadc_scale_fn_type {
>         SCALE_HW_CALIB_DEFAULT,
>         SCALE_HW_CALIB_THERM_100K_PULLUP,
>         SCALE_HW_CALIB_XOTHERM,
> +       SCALE_HW_CALIB_THERM_100K_PU_PM7,
>         SCALE_HW_CALIB_PMIC_THERM,
> +       SCALE_HW_CALIB_PMIC_THERM_PM7,
>         SCALE_HW_CALIB_PM5_CHG_TEMP,
>         SCALE_HW_CALIB_PM5_SMB_TEMP,
>         SCALE_HW_CALIB_INVALID,
> @@ -136,6 +150,7 @@ struct adc5_data {
>         const u32       full_scale_code_volt;
>         const u32       full_scale_code_cur;
>         const struct adc5_channels *adc_chans;
> +       const struct iio_info *info;
>         unsigned int    *decimation;
>         unsigned int    *hw_settle_1;
>         unsigned int    *hw_settle_2;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
