Return-Path: <linux-arm-msm+bounces-57145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6084CAADDEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A317B1DEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 11:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015DB2580E7;
	Wed,  7 May 2025 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6f+0JzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB782580CE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619198; cv=none; b=dyKFHvZNCkWgGnbVlL85/dzCsn5Yns3ijnUFQPmEpMEmI4QXXgeuMlsqk9hB6d2ncusACCD+hyIdX4IQsrTTEsCM71m2q3cYDXHrNYw1K0RSNdwLlSgIdIdFkEKtFw0PEIXBZEYdiFF7JITMXM5OJ/C+foYuwQ1D10K5tBSCs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619198; c=relaxed/simple;
	bh=qbnCw7dOQkq3nFndIdhgatR4r8qCPfL3w4RscWXHG3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HXYmcV83e/ZIGVksrrTV+uf+aYvVDJ0jx8E6cAupvkZhsqXxGi1fRDVaMfaiWnsi2AfUyeycfNjcvVoJPio4My7yI5vOmGy0FpO4J3pibEJWjqHfS+0J0g7giQphZOFKbXzxb1opiDnKikaRXIo8ETi7bIqBmVWtb9CSuj7t+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6f+0JzF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso56531885e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746619195; x=1747223995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqPJI4HdquVpCx3k4hEKfR3V8+wlA5emf3OFZSQ9jYg=;
        b=j6f+0JzFQYl3GPNHcnI6Ch7j/dtyjYiKszBG2AbKIgQlBLvH/okBpQqj+O2tgFkIvA
         EBd2u5dNU7V9VDxa2mUqWvvg9x+2o98uVyWs8LM3vuOJTwvmUNHQNQnZoOT8pmdtmfPc
         lXpIUW9P0SoWMl3eTHP7p74PPs51rInyU7eUoNNVjrr543ChEFzOFTSOtVqoaYc9GGmo
         oVBjz5Nzhrm6BeckPNxEVJ8wGYiQ2/34FMSJRsWljB1H/XmQF4g6zMSwz7yJEA5R4Clb
         umeU/cPJkEaHy44QUWHoj9EGSmG8/frWcYO2vmqsxRl1Z0bMtoerKhewNVTPueiuzNDt
         AjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619195; x=1747223995;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CqPJI4HdquVpCx3k4hEKfR3V8+wlA5emf3OFZSQ9jYg=;
        b=np6irD9s6BRLYdLp8zyeq1AzhDYwXPTBS1+bEHVV4BK2AGqFsO7fVMBarTsQCNd+jk
         4lRn0IBxyqymhsbMjNdZ87O7ZW2p0/ooPYxKfkbeqfdNPT1MqJqpsa0704GMx8xyhZ8F
         1r+83d7ivBfZFdv+hdPBpQ3r4V4PqAD3QciBBkQ0pOg6zkG5tZYKtA6iBmJ49SJHe6td
         OhQ91tJavcgYPM4LMeU43pWp4rGG9ry4Oy/qDC3/u5uB/QqK0thcUc8D9cyGw2XT0mls
         pl/BhT9lX1wjT460Xg3KMRq+d3Rpwr+4JK+cnU9Wm01OAy5uNnWbFd4PVof+5TfzQ7G1
         ltZQ==
X-Gm-Message-State: AOJu0YxGpEtz0Uy1Qbdsw4Q8RQEkJ87YvRjs48WF9x2ynB8ZuVvpmuiH
	sSKJIRRgAYsbOnIcl/z3F1Z3u92kgt8EVrRTZ3S5PB77USY2ycEomuLDOzY0g88=
X-Gm-Gg: ASbGnctu/K+YzgjN55E7EZVK2M5BSkL2yXUNyomKLltmyfwleXUCGczI78XTVA16HZ9
	lIAfFLBepghMvmcvxs7gpfKUnZUTNS+xNX25SRNxxzz5Rra0u4cGyxvTld3R0GwMSEuIt97ss2/
	9EvztZOHHMoy4O7XIZW68l4wOioFU4LbsmgPl61vq3VUmFsBdAuwpjh6/Jxp2xHXdcyo3yJkuTV
	xA7UfpP35RmtYUSWMO3b9ekvn45KNhKulJ75Git1nsh7144Xe/90zPDOrXG4lbsQfi7hlsm6VW/
	mOsygMXOfJ1BvRBZ+TSu6TBXayzoGXhlpNmyoZIRL/VGQ/xo0EKhC7pO2WRt99SJISorx2dc+JP
	7MSN5P2giaiGwIxT2kg==
X-Google-Smtp-Source: AGHT+IFIxLzUQYS8WbSe7gjUBBLP5moevd2VzC6lwoikd3JqtPlVaRPaA2s8NpuN78U3XjMiFPwpFw==
X-Received: by 2002:a05:600c:1c8c:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-441d4eeb512mr15437105e9.14.1746619195054;
        Wed, 07 May 2025 04:59:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:784f:3312:6406:12a9? ([2a01:e0a:3d9:2080:784f:3312:6406:12a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17096sm17206685f8f.96.2025.05.07.04.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:59:54 -0700 (PDT)
Message-ID: <7ccbd722-c99a-43b3-9ceb-4c207521822d@linaro.org>
Date: Wed, 7 May 2025 13:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
To: Ziqi Chen <quic_ziqichen@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
 <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
 <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>
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
In-Reply-To: <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/05/2025 11:09, Ziqi Chen wrote:
> Hi Luca,
> 
> On 5/7/2025 4:19 PM, Luca Weiss wrote:
>> Hi Ziqi,
>>
>> On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
>>> From: Can Guo <quic_cang@quicinc.com>
>>>
>>> On some platforms, the devfreq OPP freq may be different than the unipro
>>> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
>>> find the unipro core clk freq.
>>>
>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>> ---
>>>   drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 71 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>> index 7f10926100a5..804c8ccd8d03 100644
>>> --- a/drivers/ufs/host/ufs-qcom.c
>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>>> +                                                   unsigned long freq, char *name)
>>> +{
>>> +    struct ufs_clk_info *clki;
>>> +    struct dev_pm_opp *opp;
>>> +    unsigned long clk_freq;
>>> +    int idx = 0;
>>> +    bool found = false;
>>> +
>>> +    opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>>> +    if (IS_ERR(opp)) {
>>> +        dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq);
>>
>> I'm hitting this print on bootup:
>>
>> [    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
>> [    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
>>
>> Doesn't look like it's intended? The number is (2^64 - 1)
>>
> Yes, this is expected. During link startup, the frequency
> ULONG_MAX will be passed to ufs_qcom_set_core_clk_ctrl() and
> ufs_qcom_cfg_timer(). This frequency cannot be found through the API
> dev_pm_opp_find_freq_exact_indexed(). Therefore, we handle the
> frequency ULONG_MAX separately within Ufs_qcom_set_core_clk_ctrl()
> and ufs_qcom_cfg_timer().
> 
> This print only be print twice during link startup. If you think print
> such print during bootup is not make sense, I can improve the code and
> update a new vwesion.

I think just don't call ufs_qcom_opp_freq_to_clk_freq() if freq==ULONG_MAX

Neil

> 
> BRs.
> Ziqi
> 
>> Regards
>> Luca
>>
> 
> 


