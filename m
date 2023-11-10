Return-Path: <linux-arm-msm+bounces-422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B27E7A88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18F19B20BA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D644C10A0F;
	Fri, 10 Nov 2023 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ctgh/v6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38610965
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 09:18:00 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757582B7FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:17:58 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso2700717a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699607877; x=1700212677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LYDpBcl0MlEH+R1oWmv0xRfeWfotESF7unF3rtHosM=;
        b=ctgh/v6P7PGtWsqzmBXVNaa3RTWxGLNZ1z/PZVK8DdmLD1DUizCahIAn1rxnmqcCvm
         D9Drs5rkdEVkQI0Xn9NvZBAmDQ6ERUQMTI0ZkWSZPKzC1PsE9pVkPhx1vSYklkP0C6UF
         teVMNxtDaMF0vare7+0l+VbJ5P3qUDPLF/qGU5d6gkK39ac/NbDtG4DtOusJgEQaj+wr
         s7xpyyNQhJGizLXenmo4nt9fNaW+xIgiGoPKSRUK4ZbpOqQeBNpMen+OvjK+HD3uit/U
         kU1yHgKUdFnyjVTSwpUm40BIZ7gM3qLdTylaMStF5vMSWDGKHioXe/xVe/CjoP/xrICB
         WuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607877; x=1700212677;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4LYDpBcl0MlEH+R1oWmv0xRfeWfotESF7unF3rtHosM=;
        b=L263vOjBmdeGT2OpJ5cM/YqXPbsKzlU5V7ObLl7e1PXGHnjgdMSIAB9wesvvHSfKzk
         LgMT3xCyCRO8CDWo2G2hCU8XzU4kbom1ytOo5QV6mZBKFUaTu4mr0MIL4IKqPD+3j8Ff
         1NtuVf3Gx1ZPPD5fAYnXlwOjYuL37heUTCAQy/MfSAIc+TocCCsx9XaaGCNSsElWmVva
         57VHUSO8kXjLEPMUxmyXKHfHIgLtveUC3TQ03foipSDgE+xngXT+ZfA4Bk1ge1meC/E6
         OmyEhdQuWQYJxo5A9Mg5qjTBubb5LOa6ry4h7i0KwNGuZTF+vaVQbddv4f6WGwJeCJx2
         /oUQ==
X-Gm-Message-State: AOJu0YyCnmSEJt2qHtC/jlv7Vgm0+UOPVltYe+jA56/jgNpwuq0aiW/k
	fy5aJxyv0R6pHoBsS1QJJnTCCg==
X-Google-Smtp-Source: AGHT+IEi+jnigMNlZUp5tY2hieuoJdQ+0SEgWhSPbTbvPnM2yM5Sou8lXJBCGZLHxF5rHcGAfKoDWQ==
X-Received: by 2002:a17:907:7b95:b0:9c7:59d1:b2c9 with SMTP id ne21-20020a1709077b9500b009c759d1b2c9mr6807869ejc.17.1699607876897;
        Fri, 10 Nov 2023 01:17:56 -0800 (PST)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b004090ca6d785sm4601196wmq.2.2023.11.10.01.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 01:17:56 -0800 (PST)
Message-ID: <10cbb859-bdbf-4763-9887-fa13003b58cd@linaro.org>
Date: Fri, 10 Nov 2023 10:17:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 6/7] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
Content-Language: en-US, fr
To: Can Guo <quic_cang@quicinc.com>, Can Guo <cang@qti.qualcomm.com>,
 bvanassche@acm.org, mani@kernel.org, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-7-git-send-email-cang@qti.qualcomm.com>
 <e4bafeaf-bbeb-4990-b6f2-497159995910@linaro.org>
 <c3fb1fa1-4ba6-613f-a545-79e0e4b2658f@quicinc.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <c3fb1fa1-4ba6-613f-a545-79e0e4b2658f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/11/2023 10:03, Can Guo wrote:
> Hi Neil,
> 
> On 11/10/2023 4:47 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 07/11/2023 05:46, Can Guo wrote:
>>> From: Can Guo <quic_cang@quicinc.com>
>>>
>>> On SM8550, two sets of UFS PHY settings are provided, one set is to support
>>> HS-G5, another set is to support HS-G4 and lower gears. The two sets of PHY
>>> settings are programming different values to different registers, mixing
>>> the two sets and/or overwriting one set with another set is definitely not
>>> blessed by UFS PHY designers. In order to add HS-G5 support for SM8550, we
>>> need to split the two sets into their dedicated tables, and leave only the
>>> common settings in the .tlbs. To have the PHY programmed with the correct
>>> set of PHY settings, the submode passed to PHY driver must be either HS-G4
>>> or HS-G5.
>>
>> I guess I'll need to rebase my SM8650 UFS PHY driver to support both G4 and G5 modes
>> at some point ?
> 
> 
> Thank for reaching out. Yes, please.
> 
> I can help review the PHY settings.

Ok I'll try rebasing on this serie and add G5 support.

> 
> BTW, are you enabling MCQ (by adding MCQ related DT) at the same time?

I tested MCQ but it triggers the same issues we have with suspend/resume on SM8550 & SM8650,
and the bindings are not present of the UFS qcom node.

Neil

> 
> Thanks,
> Can Guo.
> 
>>
>> Neil
>>


