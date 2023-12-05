Return-Path: <linux-arm-msm+bounces-3470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F2805AE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E79281E55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579306928A;
	Tue,  5 Dec 2023 17:12:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DAC1B6;
	Tue,  5 Dec 2023 09:12:01 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ce2ff70619so1828772b3a.2;
        Tue, 05 Dec 2023 09:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701796320; x=1702401120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIgtlDTFB4ifEMLDlLmo9Odq54+Ds0nrV8Ow5EkAIJU=;
        b=RrHlwgWYD+BzQORJacpjZ/JZKcWlId6KwX/N/mrbENPKCLcsPLDtxlEVzd2vvc+Ysj
         7CB6r5LW0+Kcg0LMHwIK9e6XoA7GNfnproYdUIax5V2v3kHpEZj3hgQbMpUJCMQ5Zqcu
         fekv6Fx3YrMhhc+Dgvb0ObIKhi4ONMWsd0D0e4BuUxjVV0i1zwSLehI+b/Y8wRb+1JqS
         NquELOsXZDiLw+Sf4LmSyBK71akY0TBYJGybficzl4dGlzU2LjK3jcxsj9ZrFCNopT28
         r0DRfoM0rLOUGD1X60A0qnKGsFA9dKyBakrufMUNp5o4CvCia9VWYT7Azmj8DkVZjPsD
         Q6Pw==
X-Gm-Message-State: AOJu0YyTaUHd40WTqoNLBuAlY0lUF25Gonmh1io+TnMuBE98zGrouuDL
	+LDwj0Cceu/Bm8u0HG12x+Y=
X-Google-Smtp-Source: AGHT+IF7E5x8UjIWIzapLtbdXMzc56ip0B+yOdQGhzLNbJWo3FqUwECSSsaBg30dT08e4RQCQaiGiA==
X-Received: by 2002:a05:6a20:9384:b0:18b:94c5:24c2 with SMTP id x4-20020a056a20938400b0018b94c524c2mr3656735pzh.60.1701796320419;
        Tue, 05 Dec 2023 09:12:00 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com. [173.197.90.226])
        by smtp.gmail.com with ESMTPSA id bf8-20020a170902b90800b001cfd077fab4sm10409920plb.282.2023.12.05.09.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 09:12:00 -0800 (PST)
Message-ID: <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
Date: Tue, 5 Dec 2023 07:11:56 -1000
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
To: Naresh Maramaina <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chu.stanley@gmail.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/23 21:58, Naresh Maramaina wrote:
> On 12/5/2023 12:30 AM, Bart Van Assche wrote:
>> On 12/4/23 06:30, Maramaina Naresh wrote:
>>> +    /* This capability allows the host controller driver to use the 
>>> PM QoS
>>> +     * feature.
>>> +     */
>>> +    UFSHCD_CAP_PM_QOS                = 1 << 13,
>>>   };
>>
>> Why does it depend on the host driver whether or not PM QoS is
>> enabled? Why isn't it enabled unconditionally?
> 
> For some platform vendors power KPI might be more important than random 
> io KPI. Hence this flag is disabled by default and can be enabled based 
> on platform requirement.

How about leaving this flag out unless if a host vendor asks explicitly
for this flag?
>>
>>> + * @pm_qos_req: PM QoS request handle
>>> + * @pm_qos_init: flag to check if pm qos init completed
>>>    */
>>
>> Documentation for pm_qos_init is missing.
>>
> Sorry, i didn't get your comment, i have already added documentation for 
> @pm_qos_init, @pm_qos_req variable as above. Do you want me to add this 
> information some where else as well?

Oops, I meant 'qos_vote'.

Thanks,

Bart.


