Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B803E6D5561
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 02:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjDDAGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 20:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjDDAGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 20:06:52 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCC43AAB
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 17:06:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o32so18011344wms.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680566810; x=1683158810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVJcegeEVkVpBnNgqVhoC9cBXlIAWh7tc4ZKcUax88E=;
        b=Sl7CFi5QiQgoo2j98k+Xf7t8TmmvsLmVTzVPUrdXlYI+DonQ7dUbKtRyZrjyUyRahe
         COYHW/FScp5NSIaHg3Qq3RcKdbzsbit8Fs3NegXN2gZL//OGVI4+vpbIaKfPxG/DUaR4
         rE1ui6ysQ5VtOx0uDfQfAynEmAuOhC9CopQ3U1PI7tGcrqaudJ9eJzlaj5WuOrWULi0n
         NHkl8uft7lhjaD+FYNtbl3/fChnzLT2hdbx2X1INfHWj/tgW/Ifi+rzp4PgHAcPPaSUA
         Q5OFj5w75bP2pvLL0iqSJPR6ZtP25t5v5GCTAZsvxSh4QoMiMo8BWKbyEb94Lk0duvn/
         nJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680566810; x=1683158810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVJcegeEVkVpBnNgqVhoC9cBXlIAWh7tc4ZKcUax88E=;
        b=yvd/cHhPZxbvAuVe5BLmNtBnbIF5c8RySUgih1He96YXfAcxD/O5yfKc3Vfisuo2zb
         sIWPofF7ovcApzgUyb6Cl9cRK87jDu3cbuysUUVXH2vyR6eDO+w60mcpeWLDwkKlnq2t
         Iadh4JpuikjycxdeJvHCyVXh6aSTbwH4gXePITVmhx3vLUMOENCjqL7RZJYRJrX8plKE
         w98BVSIuW7lvlZf/w4pfqo5rZPBNqQW1RfiPU2evcVlQ6XkmnQJYHquLw7QwOPJ5Dtsq
         3Vnm13sz4tTo3gK7mMSzkpD6+4DiZ0siI41YmwDEb07T/nKv2hmKCTXaAhhpYxsA+frC
         Xd0g==
X-Gm-Message-State: AAQBX9cA3JD1JKATRU6b5ZrQ1gaC4e4cVtF3BcmJUmPWjDn+jvh9rVRr
        vZR3bmTCMQR8MaOIvpqNj7qYNuTMIyNxteL6MCk=
X-Google-Smtp-Source: AKy350YbuP8doRdJgBuldoHwcdBYs6ILsdvysGdga52rj8VwsUX0F6Sn6KfL5WWmXzQiUTp93Q6j2g==
X-Received: by 2002:a7b:c38b:0:b0:3ed:8bef:6a04 with SMTP id s11-20020a7bc38b000000b003ed8bef6a04mr726174wmj.27.1680566809945;
        Mon, 03 Apr 2023 17:06:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z7-20020a7bc7c7000000b003ed1f111fdesm13444611wmk.20.2023.04.03.17.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 17:06:49 -0700 (PDT)
Message-ID: <8b8bbe5c-8a6c-3fc8-d9c1-a6e8516b71f6@linaro.org>
Date:   Tue, 4 Apr 2023 01:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
 <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
 <f26174aa-a6ca-151c-2602-2f39b40bb7da@linaro.org>
 <7b3cb8a6-8306-f001-5701-af3b482421e9@quicinc.com>
 <d500c5bb-7aca-ae0d-f23e-495cd049e422@linaro.org>
 <d653be97-337f-dc09-786c-b13304c643fe@quicinc.com>
 <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
 <bd8db6b5-eab6-418f-529f-03a9b81f99c4@quicinc.com>
 <3bcfa144-68a0-736e-1927-df49ea50d9f5@linaro.org>
 <9893e607-8d66-df4a-c66d-4442a4a66f2c@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9893e607-8d66-df4a-c66d-4442a4a66f2c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 13:16, Milen Mitkov (Consultant) wrote:
> 
> On 03/04/2023 15:10, Bryan O'Donoghue wrote:
>> On 03/04/2023 12:01, Milen Mitkov (Consultant) wrote:
>>> Hi Bryan,
>>>
>>> no, the iteration through the mask didn't go away? The print shows up 
>>> when the csid entity's source pad(s) enables the link to the ife sink 
>>> pad(s). Maybe the client (libcamera?) decides to disable this link 
>>> for some reason?
>>>
>>> Regards,
>>>
>>> Milen
>>
>> So previously we had one CSI device in user-space and after your 
>> change we have one CSI device per VC, correct ?
>>
>> ---
>> bod
> 
> With these changes there's still one CSID device/media entity, but it 
> has more source pads (4 vs 1 previously).
> 
> Regards,
> 
> Milen
> 

OK.

I took the time to apply this series to my development tree.

Before:
- entity 19: msm_csid0 (2 pads, 10 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev6
         pad0: Sink
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 <- "msm_csiphy0":1 []
                 <- "msm_csiphy1":1 []
                 <- "msm_csiphy2":1 []
                 <- "msm_csiphy3":1 []
                 <- "msm_csiphy4":1 []
                 <- "msm_csiphy5":1 []
         pad1: Source
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 -> "msm_vfe0_rdi0":0 []
                 -> "msm_vfe1_rdi0":0 []
                 -> "msm_vfe2_rdi0":0 []
                 -> "msm_vfe3_rdi0":0 []

After:
- entity 19: msm_csid0 (5 pads, 22 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev6
         pad0: Sink
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 <- "msm_csiphy0":1 []
                 <- "msm_csiphy1":1 []
                 <- "msm_csiphy2":1 [ENABLED]
                 <- "msm_csiphy3":1 []
                 <- "msm_csiphy4":1 []
                 <- "msm_csiphy5":1 []
         pad1: Source
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 -> "msm_vfe0_rdi0":0 [ENABLED]
                 -> "msm_vfe1_rdi0":0 []
                 -> "msm_vfe2_rdi0":0 []
                 -> "msm_vfe3_rdi0":0 []
         pad2: Source
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 -> "msm_vfe0_rdi1":0 []
                 -> "msm_vfe1_rdi1":0 []
                 -> "msm_vfe2_rdi1":0 []
                 -> "msm_vfe3_rdi1":0 []
         pad3: Source
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 -> "msm_vfe0_rdi2":0 []
                 -> "msm_vfe1_rdi2":0 []
                 -> "msm_vfe2_rdi2":0 []
                 -> "msm_vfe3_rdi2":0 []
         pad4: Source
                 [fmt:UYVY8_2X8/1920x1080 field:none colorspace:srgb]
                 -> "msm_vfe0_pix":0 []
                 -> "msm_vfe1_pix":0 []
                 -> "msm_vfe2_pix":0 []
                 -> "msm_vfe3_pix":0 []

So that's consistent and this worked for me.

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx577 
'20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
build/yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
/dev/video0

For the series.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
