Return-Path: <linux-arm-msm+bounces-46478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB5A21909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D8E3A40BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C6933981;
	Wed, 29 Jan 2025 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e7zXH1e1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5795191F95
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139355; cv=none; b=rIvKeuu92nCEGu1HgpFE9vwZQCyJLVvS8jGhkXrdWTVpx/WLT2RD3yasIgoSW6tkCqD/UM5gzj8V0DfQRsoS0CzwYGcK/YdsuQVlv/7DaeZVC/1WmjhcodM3TlIR77agZ7/UC4Nnq1C27mx6AO5UsLB3Kt/RM2FtGDkzHmNsbqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139355; c=relaxed/simple;
	bh=Qj1Qiix889YPzXYdzBdu6+p6yUTG+1RD4rG0Dcj1ddg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nLTmwt6Rdbvdi6zipd3uM0iHd9pXr+r6JAGvAD+vs2/u9H2cebKfMLSBZqYYbGWem5gKfROlojSzfVlwZPINYK+ZvIH5jW4ighWCkpqCDuQwMIwmIVOx4qX6CS3jbPuw6f8QP2lbszXgFqOkv8kang5FgibB3yCl0A9WVfPOdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e7zXH1e1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5686135f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738139352; x=1738744152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQNYCdG1yalzr+nhTkmask1WyrAuIEflxT0cAB6dcWI=;
        b=e7zXH1e126AfaYtdBEp9qU6i+kHbX7Xaksi6mDi8DEySIXTRsfi4mfv7ytmWn0bnia
         We0CkNhUh6DEvrgMXTj0nzA+dTamA6lclyIiXlM56ia4FOlD951HnPtz9GDfdEd0scYD
         Q8/QEi9V8fzjzPvQZlBYUBP0O5yE4kR6ERS7Vl4PpKm2z15hCIs7VNDHMmh8BIMG+jdc
         gTcrITDLlVnhhBR7rnJeE0jo9zkzsOh++dU2qRhn3nSMT1lxXMhtYpOgAqm/Zz+1RIzs
         ct7uZaYQwafp38QPtemhjNbk5EqFtOWvar+tZnSZbTize8RidXVw9t7+e+KndBBsZFiM
         1OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139352; x=1738744152;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KQNYCdG1yalzr+nhTkmask1WyrAuIEflxT0cAB6dcWI=;
        b=leE6FXXORh5XsQeUllXOUshy36W5SuYH475g5827j8P3EaavgATkYqzLd+qU+aUhv/
         oLYwrpIBcevqr7Lya8tPmZE8s0CR6R7wEktr7827SU235JU+UxQUqwWqt4fKaoXAbQBT
         ncKA+jhz23nLq3PmbL3qIoiWXgwOz7XchvAT1voVN5k+rJ4G6cnlXVZJk234+V4feuHu
         r/qU2+N1Oxs49uImezMgZGBoQBsLdiRFEzwOuZTnaj2Eh9LkQpvI2XQtx7A7XCRBQQ6k
         K6RF2etl+GrKtZwn/upf1zRUG5+qEXbx4Vzc1Vy4ye4zn/QhoRLiAUyG7hcRYFvC2n+w
         Vmlw==
X-Forwarded-Encrypted: i=1; AJvYcCVyoo7MhTKuwKWjjoi9zkQKv58ZnlkDmoCDxzMhrbVQRGM+QXsQS/MeSnjX+fP8hLZgs3Mwi7KgIDR50L0F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3e+zaWO1vLV1s3bJksh8sPP4XI6hiCiaBdlGYtsX6ya8XRTII
	HxAM9uvoa6fLx8SBFY4MK2aoAGYBsFPi5oABN+FzVwptfosRxxjz0fq/yYaRTgY=
X-Gm-Gg: ASbGnctfDt0Q9I5FF/+ASVel/KWmpYxDdsj+V3C0Zdt1KFgrsmGHZY8MeZvvvQMU9YX
	Mxf+2y3dQc4DXxpb+ekGAG2cix3xmAFsODIa/H3WUaR5ADxzuWuVoncSOTEBhYE9bKxU2HY3SML
	1lsDdZeIkL6zxhcL359os/16B+1ce/ZGlKNo+wxOWDbCaO31MypnEtIf0u9yIV2TaG1v2Li+JJo
	1oH/55OmBZQDqU5Peb/HFI+o6L2lKHl5iNOEBhVZzI1KS4Lp2a5H+jNxdiLEiQ826S5TPbFXKVp
	wtwu2QMFpzHwWbGqjYY2Ls+MRZvl+JojVTxjQvZgbL1lRRKObwLwVzbzj94RhYdwHToW
X-Google-Smtp-Source: AGHT+IFAr02Y7e6yIfhkFOqiUS1YKF/uSP0j+bSryAqDn2OKuFT4ZAHdeqJksqWGEDwv/Ztk59DZlA==
X-Received: by 2002:a5d:47cf:0:b0:38b:eb7b:316 with SMTP id ffacd0b85a97d-38c520bb8bdmr1512622f8f.47.1738139351871;
        Wed, 29 Jan 2025 00:29:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d697sm16047435f8f.29.2025.01.29.00.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:29:11 -0800 (PST)
Message-ID: <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
Date: Wed, 29 Jan 2025 09:29:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
 <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
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
In-Reply-To: <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2025 14:10, Konrad Dybcio wrote:
> On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
>> + Mayank (with whom I discussed this topic internally)
>>
>> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>>
>>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>
>>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>>> be reset but PHY registers will be retained,
>>>>>> I'm sorry, I can't parse this.
>>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>>> are programed. After Linux boot up, the registers will not be reset but
>>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>>> skip phy setting.
>>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>>> similar text to the commit message.
>>>>
>>>>>>> which means PHY setting can
>>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>>> no_csr is toggled after that.
>>>>>>>
>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>>> established with no_csr reset only.
>>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>>> programming tables, the kernel will get them earlier than the
>>>>>> bootloader.
> 
> We're assuming that if a product has shipped, the sequences used to power up
> the PHY in the bootloader (e.g. for NVMe) are already good.
> 
> If some tragedy happens and an erratum is needed, we can always introduce a
> small override with the existing driver infrastructure (i.e. adding a new
> entry with a couple registers worth of programming sequence, leaving the other
> values in tact)

Assuming Linux will be always ran directly after the bootloader is a wild assumption.

Yes, we should make use the noscr if the PHY is always programmed, but we should be
always able to reprogram the PHY entirely to recover a faulty programmation.

Neil


<snip>


