Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF6E7A26A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 20:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236503AbjIOS4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 14:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbjIOSzs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 14:55:48 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE332719
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 11:53:29 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso41363831fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 11:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694804008; x=1695408808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0FAxuwdbhL1UZWKRYCu/VMuW55QBQ5O7sg1MPHSWY4E=;
        b=jIQE6ALDQscrqMQc8P6Q7nLsCs98uFFGQU6xEY9CpZMUuA3QpXgmKcQ4M5bwisTwI6
         y1oP6dpukR0PR+qsAm71qaXlq3HNcUFEBiotajR+27mr+hjWaCUjyKl0VBVgnQV9UfCz
         0UvMg/3TSWW40MNxi6IBBPJxsNo8FeXD9xNk9iMJ3HN876gYg/3KHOMDCuLbhsgkPbqQ
         ZyqNaP7RMvVHlgDgDTAgDDFLCch4kQO1GjJGEnbPdrr5TrkDspkM49uS4NKVn+DzQSGN
         ObU4zs3ESOJujx4wiAQMftoyGYhuBwHgT1Vka7eIYzsrIbltm9OnTBMP431CfhjlpQE1
         o3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694804008; x=1695408808;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FAxuwdbhL1UZWKRYCu/VMuW55QBQ5O7sg1MPHSWY4E=;
        b=fZRqjrcr2hLO9m4lw/Oz2qjlvn8Z3TkpzgFEaNkWGqLysUVQaHQ5jIvpqNX1pp2zc0
         gKD0PGOuhW3aSqhwK6Vlh12HkZynsVIJlM47nOYJlyRJpG1fh15TJKdnlTnQqYkyU2Sm
         lhOpR9jzYfVKdrAZCyZPQcefLgsP2HuGxUoaWexx/TxzLCcaM4HkYxpGdqnSfLH4YCS5
         vk2To0FXLdaBGC5IBNy53uHgLiuRgdGTcnbO34KxtLY1RcxCQoTL5WmGHPmJE5m0w2IR
         90lKO8dvDbcarfmKYDfmWaEfOyUXn1vP0AbolepnRX/PStSi7mClL7xZ6HPaB5nX2ZYz
         mvtQ==
X-Gm-Message-State: AOJu0YzhWJPj+Y8WFM8x4VP05ioDUfYCQvvWip7gyE4FJCxJzuhL0rpl
        J4gEWz17PTuBC6mdXVYO4nqmyuixtCDz32kYYu8TNmCO
X-Google-Smtp-Source: AGHT+IEP0i/tzM96cbqyLGXPCqm1aai/p4wEqDzPSxtw+6pTtUjvSOEHloAluxuoxtcLZWKmedVJMA==
X-Received: by 2002:a2e:850b:0:b0:2bf:ac97:df26 with SMTP id j11-20020a2e850b000000b002bfac97df26mr2304956lji.25.1694804007626;
        Fri, 15 Sep 2023 11:53:27 -0700 (PDT)
Received: from [127.0.0.1] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a2e8094000000b002b9bf5b071bsm819625ljg.20.2023.09.15.11.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 11:53:27 -0700 (PDT)
Date:   Fri, 15 Sep 2023 05:31:45 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Can Guo <quic_cang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, mani@kernel.org,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        martin.petersen@oracle.com
CC:     linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/6=5D_scsi=3A_ufs=3A_ufs-qcom=3A_Add?= =?US-ASCII?Q?_support_for_UFS_device_version_detection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <d34242f8-6e21-1549-b87d-3db2e825b7d5@quicinc.com>
References: <1694411968-14413-1-git-send-email-quic_cang@quicinc.com> <1694411968-14413-3-git-send-email-quic_cang@quicinc.com> <6055cd57-4de7-4b7e-a4f3-68a7de1aef28@linaro.org> <6225a132-4b7f-bbb4-e863-4e62b99dd79d@quicinc.com> <31823dc4-6f50-435b-9a20-66471209ec31@linaro.org> <d34242f8-6e21-1549-b87d-3db2e825b7d5@quicinc.com>
Message-ID: <1413119B-8B9C-4DE4-A086-476B2BAA60AD@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11 September 2023 13:02:50 GMT+03:00, Can Guo <quic_cang@quicinc=2Ecom> =
wrote:
>
>On 9/11/2023 5:46 PM, Konrad Dybcio wrote:
>> On 11=2E09=2E2023 11:42, Can Guo wrote:
>>> Hi Konrad,
>>>=20
>>> On 9/11/2023 5:17 PM, Konrad Dybcio wrote:
>>>> On 11=2E09=2E2023 07:59, Can Guo wrote:
>>>>> From: "Bao D=2E Nguyen" <quic_nguyenb@quicinc=2Ecom>
>>>>>=20
>>>>> Retrieve UFS device version from UFS host controller's spare registe=
r
>>>>> which is populated by bootloader, and use the UFS device version tog=
ether
>>>>> with host controller's HW version to decide the proper power modes w=
hich
>>>>> should be used to configure the UFS PHY=2E
>>>> That sounds a bit fishy=2E=2E is there no bootloader-independent
>>>> solution to that? Can't we bring in the code that the bootloader
>>>> uses to determine these values?
>>>>=20
>>>> Konrad
>>>=20
>>> Agree, it is=2E
>>>=20
>>>=20
>>> All these complexities come from one request from PHY design team - po=
wer saving=2E
>>>=20
>>> And to achieve power saving, Qualcomm UFS developers are requested to =
use the
>>>=20
>>> lowest hanging PHY settings which can sustain the Max agreed HS Gear (=
btw host
>>>=20
>>> and UFS device) during UFS's lifecycle in High Level OS,=C2=A0 whereas=
 the power saving
>>>=20
>>> request does not apply to bootloader, which works for only a few secon=
ds during
>>>=20
>>> bootup=2E Hence, there is no such version detect code in bootloader -=
=C2=A0 it just uses the
>>>=20
>>> highest PHY settings to configure PHY, boot up UFS and put UFS device =
version in this
>>>=20
>>> register=2E
>> First of all, your email client seems to be inserting 2 newlines
>> instead of 1=2E If you're using thunderbird, you may want to edit:
>>=20
>> mail=2Eidentity=2E(default or your mail identity idx)=2Edefault=2Ecompo=
se_html
>>=20
>> to `false`
>>=20
>> and add that to your internal wiki page, as I see many @quic folks havi=
ng
>> this issue=2E
>>=20
>>=20
>> Going back to the main topic, I don't think we understood each other=2E
>> The commit message states:
>>=20
>>=20
>> "Retrieve UFS device version from UFS host controller's spare register
>> which is populated by bootloader"
>>=20
>>=20
>> Which means the bootloader is able to somehow determine the value
>> that's in the spare register and write it there=2E
>>=20
>> I'm asking whether we can take the logic behind this value and
>> move it to Linux so that we don't depend on the bootloader to
>> guarantee it (e=2Eg=2E Chrome or some other devices with more exotic
>> fw may not work this way)=2E
>>=20
>>=20
>> Konrad
>
>
>There is no logic behind this value at all in bootloader, as I explained,=
 after bootloader
>
>initializes UFS, bootloader simply reads UFS's device version (the value =
you are referring)
>
>and write it to the register=2E But in Linux kernel, we need (or want to =
know) this value
>
>BEFORE we initialize UFS host controller (and UFS device)=2E

Depending on the bootloader behaviour is not an option=2E For example the =
kernel might be started via kexec=2E Or via u-boot=2E Or grub=2E Or any oth=
er bootloader=2E So please duplicate the logic to read the UFS version inst=
ead=2E


P=2ES=2E you have been asked to fix your email client=2E Please do so=2E O=
r, if you are inserting these linebreaks manually, please stop=2E

>Thanks,
>
>Can Guo=2E
>

