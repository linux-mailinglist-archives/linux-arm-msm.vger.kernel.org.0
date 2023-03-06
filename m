Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E3D6AC403
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 15:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjCFOyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 09:54:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjCFOyE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 09:54:04 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D4225B94;
        Mon,  6 Mar 2023 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NNhilVAt6dmcwGs0PfDq2BDBRY9wUkNpd3jlQa3ol1U=; b=bgMusvPdyx+sGt1nEnXi9BjEO2
        T5iw3wgYkIVxiOm+NFD68Wo17qirTSNEmj5+3P3DaSvnH/nwqsXgqB2cdZWO2LdpHSTJ4n+YsWbrK
        3Mpv3s/VoDn/QxiLRLPgI5jsUvz0TkeyJz1YoDJ36D7jcXBJi0vKuL19OWSoAVKD3TnpROcjJmA3Q
        Pzl+pS8NLIFVD2aHzUicvLdgr8Lfc9vS0Oq7ytOsULWUTMHgEAMFoqW4b3HB7742ZOVqqIm8PwYTE
        ovZoYOHWqK4WC1FY/6y1Hcvp6zRZewwXexFwZm670SBqwEwOfIbgyD5aXzCU44VkPzZh2AUYAfsFV
        YRV+erfw==;
Received: from 201-68-164-191.dsl.telesp.net.br ([201.68.164.191] helo=[192.168.1.60])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1pZCD3-006n3Z-Vx; Mon, 06 Mar 2023 15:53:07 +0100
Message-ID: <7c25f97f-c4bf-0e99-c60f-a9026ca42965@igalia.com>
Date:   Mon, 6 Mar 2023 11:52:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing property for
 OnePlus 3T
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Harry Austen <hpausten@protonmail.com>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20230213201651.1902323-1-gpiccoli@igalia.com>
 <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
 <09879b66-4f72-a205-3e2d-cd8d8113625c@igalia.com>
 <97676add-de6b-4057-a5ef-dab313cf7050@linaro.org>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <97676add-de6b-4057-a5ef-dab313cf7050@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/03/2023 07:14, Konrad Dybcio wrote:
>[...] 
>> Curiosity questions, since I'm far from expert in the device-tree world:
>> what happens in case the device-tree doesn't export/contain this
>> property (exactly the case we have right now)? Does the device work
>> fine? Also, having it "wrong" (based on the other OnePlus 3) is worse
>> than not having it? In other words, what's the default value picked if
>> none is provided in the DT?
> Basically:
> 
> if (msm_id) {
>     if is_close_enough(msm_id, internal_msm_id)
>         boot()
>     else
>         die()
> } else
>     die()
> 
> Konrad
>>

Thanks, interesting...

So, if I understand correctly, currently we end-up in the 2nd else
block, and we straight die(), right?

With this patch, we have some chance to boot, by falling in the if()
block or...if we're not lucky, we also die() heh

With that said, any con in accepting this as-is if we don't find anybody
to test? Notice it at least has the advantage of fixing the device-tree
blob creation...

Ah, of course by "as-is" I mean I'd send a V2 fixing what you mentioned
before ("...use the preprocessor constant...etc").
Thanks,


Guilherme
