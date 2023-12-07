Return-Path: <linux-arm-msm+bounces-3601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360E807D86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 02:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EEE71F20EE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 01:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A93B7F6;
	Thu,  7 Dec 2023 01:02:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA23EE;
	Wed,  6 Dec 2023 17:02:10 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ce6dd83945so114584b3a.3;
        Wed, 06 Dec 2023 17:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910930; x=1702515730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsY9pw0TDst5fn7pyaJpwFYHQHsp2P8sIo6DgROWKDI=;
        b=flfmmCKko9MjYEAXqz8N4rr30vWeSv0cPcBgzzjh2IsIZpx/uE2colbPUaQfPjOwtx
         v8FCnfBFOk9NFcKRLHWY3eJSPd9ZHbVIxl1li3PlwjZNbABmH7CvCmZEXA2/cEjF+FBx
         EzxeyDG0db64mhNweXW4DNxXRT5A/mnrrCDmNhwKsAMP839h6cAvN35EF9mQmf2jV7S0
         i0iMK5kBhMkS8/41NCI0KKy9OW4EiYOoFWpR53lEYEYmM8gb/C77eYCVKBInDPy1MNHd
         JVQWl3W2CDR9C4FWd7zI8pMuupimVS+iieFL6QLdrvtYNLsE104+OQb2eLOYLY0dMhHh
         zFAg==
X-Gm-Message-State: AOJu0Ywd892/Pq4IcvU/z6a0PAbJHL100pLT0tBDtoL5S+01RvPxqWbT
	auePmjotkWlSlSl1jTkMsfM=
X-Google-Smtp-Source: AGHT+IHMqy62pr33s+axRTNU9zRKI+eQxYUdPtYiMKmdFwxGEZ5YOdCxe0OaOGpyoMV2n57/gKS5ZA==
X-Received: by 2002:a05:6a20:43a7:b0:18f:bf91:2938 with SMTP id i39-20020a056a2043a700b0018fbf912938mr2423155pzl.125.1701910930060;
        Wed, 06 Dec 2023 17:02:10 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com. [173.197.90.226])
        by smtp.gmail.com with ESMTPSA id p2-20020aa78602000000b006889511ab14sm134543pfn.37.2023.12.06.17.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 17:02:08 -0800 (PST)
Message-ID: <effb603e-ca7a-4f24-9783-4d62790165ae@acm.org>
Date: Wed, 6 Dec 2023 15:02:04 -1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>,
 Naresh Maramaina <quic_mnaresh@quicinc.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chu.stanley@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
 <20231206153242.GI12802@thinkpad>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231206153242.GI12802@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/6/23 05:32, Manivannan Sadhasivam wrote:
> On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
>> On 12/5/2023 10:41 PM, Bart Van Assche wrote:
>>> On 12/4/23 21:58, Naresh Maramaina wrote:
>>>> On 12/5/2023 12:30 AM, Bart Van Assche wrote:
>>>>> On 12/4/23 06:30, Maramaina Naresh wrote:
>>>>>> +    /* This capability allows the host controller driver to
>>>>>> use the PM QoS
>>>>>> +     * feature.
>>>>>> +     */
>>>>>> +    UFSHCD_CAP_PM_QOS                = 1 << 13,
>>>>>>    };
>>>>>
>>>>> Why does it depend on the host driver whether or not PM QoS is
>>>>> enabled? Why isn't it enabled unconditionally?
>>>>
>>>> For some platform vendors power KPI might be more important than
>>>> random io KPI. Hence this flag is disabled by default and can be
>>>> enabled based on platform requirement.
>>>
>>> How about leaving this flag out unless if a host vendor asks explicitly
>>> for this flag?
>>
>> IMHO, instead of completely removing this flag, how about having
>> flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
>> by default and if some host vendor wants to disable it explicitly,
>> they can enable that flag.
>> Please let me know your opinion.

That would result in a flag that is tested but that is never set by
upstream code. I'm not sure that's acceptable.

> If a vendor wants to disable this feature, then the driver has to be modified.
> That won't be very convenient. So either this has to be configured through sysfs
> or Kconfig if flexibility matters.

Kconfig sounds worse to me because changing any Kconfig flag requires a
modification of the Android GKI kernel.

Thanks,

Bart.

