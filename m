Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA8D15A8C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 13:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgBLMID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 07:08:03 -0500
Received: from mail.serbinski.com ([162.218.126.2]:55886 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgBLMIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 07:08:02 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 466BDD006F9;
        Wed, 12 Feb 2020 12:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id deXudkH907vE; Wed, 12 Feb 2020 07:07:56 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 83312D00693;
        Wed, 12 Feb 2020 07:07:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 83312D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581509276;
        bh=X01imo3rNxuo1cF/d14QGPIrzjN/5R3N1tchGdwIcuM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nqRz0MyG1yj3DNcgdIf2qJfu1oOkEQn7Ym3BuVi5yhlRzpQQPtL2jW93ZI/8XnaQ5
         0bW0hvRbhDsG4mbB20QDLJ1/y0hq+puU4mrVmkUsBcdr5vIkxnwTVaxXlVwJVwZd3X
         jA0EUmFJmqQNNUYc0zU07mVp7isl1EeaMGKNqWwI=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 12 Feb 2020 07:07:56 -0500
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
Subject: Re: [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
 documentation
In-Reply-To: <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
 <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
 <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
 <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <d4e16b7944adbd8859c8287673da3417@serbinski.com>
X-Sender: adam@serbinski.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-12 06:43, Srinivas Kandagatla wrote:
> On 12/02/2020 11:01, Adam Serbinski wrote:
>>>> 
>>>> +
>>>> + - qcom,pcm-slot-mapping
>>>> +    Usage: required for pcm interface
>>> 
>>> Are these not specific to 8k and 16k mode ?
>>> We should probably list values for both modes here.
>> 
>> No, this is just the offset that the audio sample is placed in with 
>> respect to a maximum of 4 slots, 16 bits wide, beginning with the sync 
>> pulse.
> 
> 
> That's not true atleast by the QDSP documentation,
> according to it we will use more slots to transfer at higher sample 
> rate. ex:
> 16 kHz data can be transferred using 8 kHz samples in two
> slots.
> 
> Also there are 32 slots for each of 4 supported channels for PCM AFE 
> port.

Ok, if that's the case, then it sounds like someone else is going to 
have to implement it. I have no way to test that kind of a 
configuration, so attempting to implement it would be futile.

> 
> 
>> 
>> When switching between 8 and 16k sample rate, it is just the sync 
>> pulse rate that is changed. The audio sample will be delivered in the 
>> same slot, just at a different frequency.
