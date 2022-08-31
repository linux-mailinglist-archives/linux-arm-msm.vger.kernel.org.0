Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10ACE5A79D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 11:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbiHaJNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 05:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiHaJNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 05:13:10 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB16CC2752
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:13:06 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu22so17042626wrb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=f2v5wnUzlFw+ZpCjocjtmhUbEHEChafEgOfgj/yM2oA=;
        b=ROtwCweIXDZJ3VmlCBhJ4Iq+wLvqrZhbK+rPGKnuip2Lq5URIot/G52HWlVEOKksaj
         fuA33npDQ1NYBIyWo3He+08zCl5ll3mDZJ77pFQwyPe1WEi4jNf0uBIUTCUpmKSbivvT
         kHHADPpVy+N2SjXWQDzFuCU4XKCam4rpYCdC5hslLvF75OkOfO6+n0TQBp2QOJFoCkkz
         z7J7QFA95J0rV1VxHsJe71UxWNMvSBjE6iF989kXMXrBQBcGaOFL0rz4eepf0y8hESdv
         EhNJB/+kf3qdwLQszZz4wMiAZKT8eTeajacUPVgT5+qpN18UPy8Rt9rzqF8YLl20JeI3
         xKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=f2v5wnUzlFw+ZpCjocjtmhUbEHEChafEgOfgj/yM2oA=;
        b=HGafjM48aCp36ggC6Orcr3hFHND2WxhHhVBx41CJ/tBvYD7GnYeGmz2Q+/Z15mTEER
         JNXtGj4S63t+M1icWDiJ9iGjM5+QuxFM7VEpuozxTL6VrINBxOz0ZmnphRh1u8jjtMlW
         wNjuBIz3qV6q6x/puHQH29pskV+TE6cq3eFe1pIy2enJ2QGS2Pc/upBIru1CHvf+udLp
         +ZaTID5Rm0K2CCBdK4fLIwnIlamUdUq7JrS1uoGZp1JoAgtDteOoAlgwM0IMuvosC48w
         QF8/GSbgwQPH8/h5l61xd0ogOYll/lKe8RnVzvoKqiQgVScsIgin47Za5NkJ3EFeClCc
         7Wmg==
X-Gm-Message-State: ACgBeo2EvGf60FvCSNMBg2obi6kfX0KpPt/tdj5pMTSjfHTthmt8Aqqb
        TBzdq//GWxL+3r6NVeRyPxcf8Q==
X-Google-Smtp-Source: AA6agR4ZTrmaB0FuE/OJ12vVcZ843QapxOfCMEEVKeMwgs176P7BPzEF02U7iQFlRcedt0l23og91g==
X-Received: by 2002:a5d:6c6e:0:b0:225:5a20:1bd1 with SMTP id r14-20020a5d6c6e000000b002255a201bd1mr11217058wrz.717.1661937185312;
        Wed, 31 Aug 2022 02:13:05 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id u14-20020adfdd4e000000b0021f131de6aesm11661830wrm.34.2022.08.31.02.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 02:13:04 -0700 (PDT)
Message-ID: <eeea8a27-eed9-6ebc-dfa5-73a10e711c04@linaro.org>
Date:   Wed, 31 Aug 2022 10:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
 <20220818135817.10142-3-srinivas.kandagatla@linaro.org>
 <Yv9rIGE+GNEzzizz@sirena.org.uk>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Yv9rIGE+GNEzzizz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/08/2022 11:51, Mark Brown wrote:
> On Thu, Aug 18, 2022 at 02:58:16PM +0100, Srinivas Kandagatla wrote:
> 
>> +	}
>> +	*stream_prepared  = true;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(qcom_snd_sdw_prepare);
> 
> The ASoC framework is all EXPORT_SYMBOL_GPL(), things that depend
> directly on it should be too.
thanks, I agree, there are already 3 symbols that are exported without 
_GPL, I will fix them too  in next spin.

thanks,
srini


