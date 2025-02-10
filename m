Return-Path: <linux-arm-msm+bounces-47390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623BA2E7FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D691889205
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDF81C4A02;
	Mon, 10 Feb 2025 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1A2PBwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84611C3C0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180349; cv=none; b=HDKetmCCWMNaC6r0g09w3dTD07DLyf+RekskboE0z+wsrhmxLaOm/AnybQtqwCchCu5CaM5XIy1XcPEzXuJnVNj6vSxM8IOim2ZC28PR73HSSq9Q7j71uDuOpHb8WywqyrnpV5ArFA3IZPe1bQLtLnh59CjHmQAubPWxIEKRWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180349; c=relaxed/simple;
	bh=Evggzw1mm78crygEZHz0M0KJuKx/SLpnc9JUY2lUjKA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=itl2/TlSQHFqSKpoSvaf4vYTfk5+ex2zcH3DmRCZpSC+xmpWhdTjCLq7BxdU6DHvF/+u6XhGafwZ3Aq+ds4Ie65Tu8QyR8RLQFloAE7OMNh2c0Tqkj+aufpOiVwsj3LGUMpuJlClyFlpQrf0TrCzn+fBCsBIbU+cp7fKB/lLz58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1A2PBwc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so3326675e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739180346; x=1739785146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srrij2tofXvckDkWsV9cjxYMgt/c8bcDWt6f2Pgk2Ho=;
        b=n1A2PBwcA8wJwg5EFY1f62SjVUszsaSqFq6hRdrf91Qyi9wBlt3MftA5yEcL2p22JF
         eTpknOcGBDMQdpoPkLi3kvpIMPfa0c1xyxOiGagUDQ+MTEmVgk96ttBWoMNpnKvZ9pJm
         QFqtPPXERxHcKuFGUXk55OPGJ0nhIZ6WrPlN8Cs2sYyE8T7nBLpnx0yM0n2XoJicmGeM
         ppvfqDnnhCi+VKq/n4TMdeYl8c8pRG2Fkd8AHRtc27RY+IvB47cxdXEIErzxhkdindGK
         FsV4nzoXTmqZMhUk6/EalYUGJ1/gLurr1UWnx8ZU5imKfsD8GR8S2W4PLiTvB9WHb6AM
         D2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180346; x=1739785146;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=srrij2tofXvckDkWsV9cjxYMgt/c8bcDWt6f2Pgk2Ho=;
        b=u01ovKGLUJARxQV4yZLYWfRhZRCBxXLK+H9uzV9PqadNQ46VrRawEvCzO3WdOYrWEe
         Fy3PtbWHYQyRM3Fp6iFDHJZXTXibQ/zasjzH6PZZ0OLRKl5bK656BsX+g9h4WI5CJY8x
         f9OTgz2vNDVSjvVSLQBBJvQYRYUtqEVPDYhwBa1QwBa3zDkabPTxBMpuF1AmcAT/E3Vn
         zFMED6Pvqgcqk/BFfmhdLhdorwyBpJ9SnxqQgUAW3inxH825rElEM/qwSDcnLR9TROZb
         rQeQ6u/AnYt9gsPsZhPxfpiNTcO/Sad70AqGmV8MEDIUn7jpm38H6CVYPWX32vBDZ4vI
         EulQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX1nuQ3r/iSaqz67fvjNnVZO4olAXO29QyycQnCom5vOyGiQh9lwaF8o56afGgqMsBuFaDIG4V32uH1gIU@vger.kernel.org
X-Gm-Message-State: AOJu0YxkD2utgrVWvZppF/diUcH7Q4SyQF1zfy7TWnFBNKcNgcOnFdjF
	UZIrFEu/8U0VV1FFW0lViYw4NGDP7rrTTpZYL8t1upI+8pdNI05GxlFymcjzTHw=
X-Gm-Gg: ASbGncujLT1BSABZ5cwpFmRx4AYtSGc1GtkJ8DprW1kqJyE3MNuCxX3gUCWaP94jLms
	zU1mU9V4xPCv05a8IkN/DrTjbY28fzUAPDCESVwl9QSUpBNPGE2F9wJpjfeAZrebf9puYHJ4n6l
	3JNPxhEosa8hJkD0wYWZFJiNuq7tQO9XixASagiQ30655VuOvCehzr6FRHzvWK3SzmXQyEPg4nY
	A/9sJLiQ7tNn6KCTU74JQQaEcVl//aXXqMhW/AIHiN0I9HT1qnOwu5rklrwwqygHgp4Xr2NVMq7
	MLemfXMdBBw7ul9mZmZdZt92VxggD8YSw6ERODlPuurS0IOrVakbPw61As/x4NP2TM8c
X-Google-Smtp-Source: AGHT+IEHtY/xpnewLZHMrP5i7kiQ+idRtu5NbOM9k48vStwcKa1bF7nM6dGfWD5FqFw16XgafuQ3QA==
X-Received: by 2002:a05:6000:1448:b0:38d:b2e4:6d97 with SMTP id ffacd0b85a97d-38dc9343d93mr10722664f8f.41.1739180345812;
        Mon, 10 Feb 2025 01:39:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm174462705e9.0.2025.02.10.01.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:39:05 -0800 (PST)
Message-ID: <ae9ba351-53c8-4389-b13b-7b23926a8390@linaro.org>
Date: Mon, 10 Feb 2025 10:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/5] Add UFS support for SM8750
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 Nitin Rawat <quic_nitirawa@quicinc.com>,
 Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
 <20250209152140.cyry6g7ltccxcmyj@thinkpad>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20250209152140.cyry6g7ltccxcmyj@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2025 16:21, Manivannan Sadhasivam wrote:
> On Fri, Feb 07, 2025 at 11:47:12PM +0100, Konrad Dybcio wrote:
>> On 13.01.2025 10:46 PM, Melody Olvera wrote:
>>> Add UFS support for SM8750 SoCs.
>>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>>> Nitin Rawat (5):
>>>        dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the SM8750 QMP UFS PHY
>>>        phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
>>>        dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
>>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
>>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and MTP boards
>>
>> You still need the same workaround 8550/8650 have in the UFS driver
>> (UFSHCD_QUIRK_BROKEN_LSDBS_CAP) for it to work reliably, or at least
>> that was the case for me on a 8750 QRD.
>>
>> Please check whether we can make that quirk apply based on ctrl
>> version or so, so that we don't have to keep growing the compatible
>> list in the driver.
>>
> 
> That would be a bizarre. When I added the quirk, I was told that it would affect
> only SM8550 and SM8650 (this one I learned later). I'm not against applying the
> quirk based on UFSHC version if the bug is carried forward, but that would be an
> indication of bad design.

Isn't 8750 capable of using MCQ now ? because this is the whole issue behind
this UFSHCD_QUIRK_BROKEN_LSDBS_CAP, it's supposed to use MCQ by default... but
we don't.

Is there any news about that ? It's a clear regression against downstream, not
having MCQ makes the UFS driver struggle to reach high bandwidth when the system
is busy because we can't spread the load over all CPUs and we have only single
queue to submit requests.

Neil

> 
> - Mani
> 


