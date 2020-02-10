Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C507158147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBJRWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:22:32 -0500
Received: from mail.serbinski.com ([162.218.126.2]:39976 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBJRWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:22:31 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 52FC3D006F9;
        Mon, 10 Feb 2020 17:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q5mv8vr5Wc_5; Mon, 10 Feb 2020 12:22:26 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id C52E1D00693;
        Mon, 10 Feb 2020 12:22:25 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com C52E1D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581355345;
        bh=LBzPdGEvwXi/b0wHoq1y99U4fh/apqlgThb7ByyzJUQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I+oJYFeyvVH0rl8fhLnZoA46MBMSXaNBbQgsWJHz/BIT7MyH5m+W8OKmZe/ZdtgY5
         oW8fB5nV3+qJK4zTqKNQ1zJB2SMGVPrO/1EkP3gX0dJxhuJM05szGSU1hJuq+m92O1
         ija4PhNMz5IrU7i3eVCjph9mJwspfSL0dQIzBaT4=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Feb 2020 12:22:25 -0500
From:   Adam Serbinski <adam@serbinski.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v2 3/8] ASoC: qdsp6: q6afe-dai: add support to pcm port
 dais
In-Reply-To: <d0437f6d-84c8-e1cd-b6f5-c1009e00245d@linaro.org>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-4-adam@serbinski.com>
 <d0437f6d-84c8-e1cd-b6f5-c1009e00245d@linaro.org>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <616e3042f46cb7f052fc71e0ba4919a2@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-10 12:13, Srinivas Kandagatla wrote:
> Few minor comments
> 
>> +static int q6afe_tdm_set_sysclk(struct snd_soc_dai *dai,
>> +		int clk_id, unsigned int freq, int dir)
>> +{
> 
> Why are we adding exactly duplicate function of q6afe_mi2s_set_sysclk 
> here?

It isn't an exact duplicate.

The reason I split off the new function is because the clock IDs for PCM
overlap/duplicate the clock IDs for TDM, yet the parameters to
q6afe_port_set_sysclk are not the same for PCM and TDM.


>>   +	SND_SOC_DAPM_AIF_IN("QUAT_PCM_RX", NULL,
>> +			    0, 0, 0, 0),
> 
> This can be in single line, same for below

I will adjust these.
