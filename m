Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4CB157DC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 15:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgBJOuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 09:50:24 -0500
Received: from mail.serbinski.com ([162.218.126.2]:44398 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbgBJOuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 09:50:24 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 06191D006F9;
        Mon, 10 Feb 2020 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4SG34I_usFwg; Mon, 10 Feb 2020 09:50:17 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 4D479D00693;
        Mon, 10 Feb 2020 09:50:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 4D479D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581346217;
        bh=AM31Nu9OJOn3Ets32wl1am+N+bfHUPcUFazJCovf5Vw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yFuXwYDdU7nP2Y6H636YQuCZ0iVIhRD8IXev+Cd1kaanj+pniISRIwhHjXMarSrpD
         NTzrKINGDWQ3cyAS2G04cXl/akvTvU2Sibu2lyJbBX/dB24cVSSV45r/XPm8ZBc69s
         i6Vw61cavVG6khsGcgUzp/2Jewf2eF7sj5HM5u4E=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Feb 2020 09:50:17 -0500
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] ASoC: qdsp6: q6afe: add support to pcm ports
In-Reply-To: <20200210133143.GG7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-3-adam@serbinski.com>
 <20200210133143.GG7685@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <4df03448f7919187a8a056d3f10415ab@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-10 08:31, Mark Brown wrote:
> On Sun, Feb 09, 2020 at 10:47:42AM -0500, Adam Serbinski wrote:
> 
>> 
>> +#define AFE_API_VERSION_PCM_CONFIG	0x1
>> +/* Enumeration for the auxiliary PCM synchronization signal
>> + * provided by an external source.
>> + */
>> +
>> +#define AFE_PORT_PCM_SYNC_SRC_EXTERNAL 0x0
>> +/*	Enumeration for the auxiliary PCM synchronization signal
>> + * provided by an internal source.
>> + */
> 
> This is a *weird* commenting style for these #defines and it's not
> consistent within the block, I'm seeing at least 3 different styles.

I will clean up the commenting.


>> +	default:
>> +		break;
>> +	}
> 
> Why is this not returning an error on unsupported values?

Only to be consistent with the pre-existing implementation for i2s 
ports.
I will add an error return.

> 
>> +
>> +	switch (cfg->sample_rate) {
>> +	case 8000:
>> +		pcfg->pcm_cfg.frame_setting = AFE_PORT_PCM_BITS_PER_FRAME_128;
>> +		break;
>> +	case 16000:
>> +		pcfg->pcm_cfg.frame_setting = AFE_PORT_PCM_BITS_PER_FRAME_64;
>> +		break;
>> +	}
> 
> Same here.

I will also add the error return here.
