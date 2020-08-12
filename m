Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D421824250B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 07:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgHLFoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 01:44:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20952 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgHLFoZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 01:44:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597211064; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=m01s5x5/4OPtVhR5XhuB+WL65++5knXHg8y55k3ANL8=; b=VFWO1AKTM0i7Dgjtxrcw+R3UEHZjKXc6VGfXNLji2ryfpSKa3PC2ULCd4XVe6tGo4IHphS/v
 pEjFtLCRJnEIQuuAvuDjZnBb8fyx0cWEF8cXtSP6aYaqkk3HOHEyuzXnCVQk31uUYNxFDqSy
 QxQuA7J77VMn+O0zugw6FU/px0k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f3381b81e4d3989d431ce44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 05:44:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE983C43395; Wed, 12 Aug 2020 05:44:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1A92C433C9;
        Wed, 12 Aug 2020 05:44:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Aug 2020 11:14:22 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Add 51.2MHz frequency
 support
Message-ID: <4038aa8b67405c89e4917791f147e8fa@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2020-05-31 00:39, Stephen Boyd wrote:
> Quoting satya priya (2020-05-29 03:14:42)
>> To support BT use case over UART at baud rate of 3.2 Mbps,
>> we need SE clocks to run at 51.2MHz frequency. Previously this
>> frequency was not available in clk src, so, we were requesting
>> for 102.4 MHz and dividing it internally by 2 to get 51.2MHz.
>> 
>> As now 51.2MHz frequency is made available in clk src,
>> adding this frequency to UART frequency table.
>> 
>> We will save significant amount of power, if 51.2 is used
>> because it belongs to LowSVS range whereas 102.4 fall into
>> Nominal category.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
> 
> Great commit text! Maybe point to the commit that adds it to the
> frequency table in the gcc clk driver instead of the patchwork link.
> 
>> ---
>> 
>> Note: This depend on clk patch 
>> https://patchwork.kernel.org/patch/11554073/
>> 
>>  drivers/tty/serial/qcom_geni_serial.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 6119090..168e1c0 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -141,9 +141,10 @@ static void qcom_geni_serial_stop_rx(struct 
>> uart_port *uport);
>>  static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool 
>> drop);
>> 
>>  static const unsigned long root_freq[] = {7372800, 14745600, 
>> 19200000, 29491200,
>> -                                       32000000, 48000000, 64000000, 
>> 80000000,
>> -                                       96000000, 100000000, 
>> 102400000,
>> -                                       112000000, 120000000, 
>> 128000000};
>> +                                       32000000, 48000000, 51200000, 
>> 64000000,
>> +                                       80000000, 96000000, 100000000,
>> +                                       102400000, 112000000, 
>> 120000000,
>> +                                       128000000};
> 
> Will this break sdm845? That clk frequency table hasn't been updated to
> add 51.2 MHz.

No, as the sampling rate in sdm845 is 32, we will not be requesting 51.2 
over there.

> 
> Furthermore, it would be nice to get rid of this table and use
> clk_round_rate() to find a frequency that will work with the requested
> baud rate. Can we do that instead? That would make it work regardless 
> of
> what the clk driver supports for the particular SoC. Presumably we can
> just call clk_round_rate() and then make sure it is evenly divisible by
> the requested rate and then it will be mostly the same as before.

Okay.

> 
> Or if we need to we can keep multiplying the rate 10 or 20 times and
> test with clk_round_rate() each time and then give up if we don't find 
> a
> frequency that will work. The divider value looks like it is 12 bits
> wide so there are 4095 possible dividers. If we need to loop through 
> all
> possible dividers then it may make sense to register a clk in this
> driver and have it call divider_round_rate() to find the closest rate 
> to
> the desired rate. That would avoid reinventing a bunch of code that we
> already have to implement clk dividers.
> 

If i understand correctly, clk_round_rate gives the nearest possible 
value to the desired clk rate, but i am not very clear about 
divider_round_rate API, is it an alternate method to get nearest clk 
rate? Also it has few parameters like prate, clk_hw etc which we are not 
sure of. For now we are planning to post the change for clk_round_rate 
API.

> And one more thing, I see that this driver doesn't use DFS. Instead it
> relies on the clk_set_rate() call to change the qup clk frequency. We
> could support DFS by adding a driver specific member to struct
> clk_rate_request that can be used to communicate back extra info to the
> child clk. The idea is that the DFS clk (the qup uart one) can round 
> the
> rate and jam in the DFS index that corresponds to the rate into the new
> member. Then the clk implemented in this serial driver can stash away
> that index into some table that maps frequency of parent to DFS index
> and then look up the DFS index during clk_set_rate() based on the 
> parent
> rate the clk_op is called with to program the DFS value in the uart
> registers in addition to the divider.
> 
okay will look into this.

> ---8<---
> diff --git a/drivers/tty/serial/qcom_geni_serial.c
> b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090ce045..7d147be997e5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -140,11 +140,6 @@ static unsigned int
> qcom_geni_serial_tx_empty(struct uart_port *port);
>  static void qcom_geni_serial_stop_rx(struct uart_port *uport);
>  static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool 
> drop);
> 
> -static const unsigned long root_freq[] = {7372800, 14745600,
> 19200000, 29491200,
> -					32000000, 48000000, 64000000, 80000000,
> -					96000000, 100000000, 102400000,
> -					112000000, 120000000, 128000000};
> -
>  #define to_dev_port(ptr, member) \
>  		container_of(ptr, struct qcom_geni_serial_port, member)
> 
> @@ -900,30 +895,22 @@ static int qcom_geni_serial_startup(struct
> uart_port *uport)
>  	return 0;
>  }
> 
> -static unsigned long get_clk_cfg(unsigned long clk_freq)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(root_freq); i++) {
> -		if (!(root_freq[i] % clk_freq))
> -			return root_freq[i];
> -	}
> -	return 0;
> -}
> -
> -static unsigned long get_clk_div_rate(unsigned int baud,
> +static unsigned long get_clk_div_rate(const struct geni_se *se,
> +			unsigned int baud,
>  			unsigned int sampling_rate, unsigned int *clk_div)
>  {
>  	unsigned long ser_clk;
>  	unsigned long desired_clk;
> +	long actual_clk;
> 
>  	desired_clk = baud * sampling_rate;
> -	ser_clk = get_clk_cfg(desired_clk);
> -	if (!ser_clk) {
> +	actual_clk = clk_round_rate(se->clk, desired_clk);
> +	if (actual_clk % desired_clk != 0) {
>  		pr_err("%s: Can't find matching DFS entry for baud %d\n",
>  								__func__, baud);
> -		return ser_clk;
> +		return 0;
>  	}
> +	ser_clk = actual_clk;
> 
>  	*clk_div = ser_clk / desired_clk;
>  	return ser_clk;
> @@ -956,7 +943,7 @@ static void qcom_geni_serial_set_termios(struct
> uart_port *uport,
>  	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 
> 5)
>  		sampling_rate /= 2;
> 
> -	clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
> +	clk_rate = get_clk_div_rate(&port->se, baud, sampling_rate, 
> &clk_div);
>  	if (!clk_rate)
>  		goto out_restart_rx;

Thanks,
Satya Priya
