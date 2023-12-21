Return-Path: <linux-arm-msm+bounces-5817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D645E81BF12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D586D1C21C08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917646519F;
	Thu, 21 Dec 2023 19:25:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4765198;
	Thu, 21 Dec 2023 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3e05abcaeso8466645ad.1;
        Thu, 21 Dec 2023 11:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703186753; x=1703791553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbeiS+nR5HLz0VyzxksNmQP936OjapFJccP6nWbsbVg=;
        b=joiwnadZzEP0UHX9FvH2iZLpwlDLkJ/RUjal2dsxpIoACVE7FK7BpUEqECV7AFArAI
         8XcuhJYenrFrPX0Tg+5Uyqx6QN0PUrEM9HwAsk4aQyZfjBcBRSmF56zlUhybZI4Bm2fO
         o9WzMKhySTSO9Y4T7/kSzWoDW83rBn3ghAmWLkqcv0m7ejg9kZalKRPf+rPS+srryDEb
         /zpmvgiUE8P4I7i6u9dyMn4ei9/452aWfaYiA7nfDHvNwkdyYprxzRkBR3OgOuZPSokZ
         hIJu3CSVR1eZW+4eyZvbd3/4ST86jCWW8Sg9v45hPirr+34NHiZLPKEtTJNzCBuH7By4
         3ONQ==
X-Gm-Message-State: AOJu0Yx3/NXDly5roU91n2MspLX6MDF0uXiSzvgnvMKfdwo7XRROyh0R
	KnrhkeYPG1kzn6EFNE0cKKQ=
X-Google-Smtp-Source: AGHT+IHVT54J/2E66aR0G9wm0i8JbNSgVX8TliNvjir0D8eFXVHHG8DYGEoUI/TMDbHQDGDFwfMPnw==
X-Received: by 2002:a17:903:40cc:b0:1d3:4860:591b with SMTP id t12-20020a17090340cc00b001d34860591bmr168869pld.0.1703186753353;
        Thu, 21 Dec 2023 11:25:53 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:872c:d7b7:41e9:3edd? ([2620:0:1000:8411:872c:d7b7:41e9:3edd])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902ec8700b001d08e08003esm2004315plg.174.2023.12.21.11.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 11:25:50 -0800 (PST)
Message-ID: <d4e9bf6c-0a71-49d1-a74b-76eba3af6a51@acm.org>
Date: Thu, 21 Dec 2023 11:25:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 11/11] scsi: ufs: core: Perform read back before
 writing run/stop regs
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.de>, Janek Kotas <jank@cadence.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Can Guo <quic_cang@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com>
 <20231221-ufs-reset-ensure-effect-before-delay-v3-11-2195a1b66d2e@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231221-ufs-reset-ensure-effect-before-delay-v3-11-2195a1b66d2e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/23 11:09, Andrew Halaney wrote:
> Currently a wmb() is used to ensure that writes to the
> UTP_TASK_REQ_LIST_BASE* regs are completed prior to following writes to
> the run/stop registers.
> 
> wmb() ensure that the write completes, but completion doesn't mean that
> it isn't stored in a buffer somewhere. The recommendation for
> ensuring the bits have taken effect on the device is to perform a read
> back to force it to make it all the way to the device. This is
> documented in device-io.rst and a talk by Will Deacon on this can
> be seen over here:
> 
>      https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678
> 
> Let's do that to ensure the bits hit the device. Because the wmb()'s
> purpose wasn't to add extra ordering (on top of the ordering guaranteed
> by writel()/readl()), it can safely be removed.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

