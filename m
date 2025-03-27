Return-Path: <linux-arm-msm+bounces-52642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42316A73273
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8917A596B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5211ACEC9;
	Thu, 27 Mar 2025 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUEZS7yG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE29946F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079517; cv=none; b=YCOhgwwJipPWmYyNpOvwygT1GHBlzCtBOV7wdpQE3dFEu2x1yFzkzzJWPj47iz2rjxFc+dB5nnwPkMkbMnJDyiUPdX2wmnZ8M4Ek/Bit9NQ9leJXSuGVJqBRc3AZpC6HTASHmI2DfCafOT0ivoBCOhpF8vj/Co0n4KxqSFE46h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079517; c=relaxed/simple;
	bh=cCH/5sxof+Jwrxn5q6j/c5RtIig5fu0OfDqoAuP9pS4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JxdELCfohcW/Q2K74d0qeW7EveGH2YttYo0Zp2gE9wLAd0dgfDzwaEzTI7MVGQbMn+k6UMS/hqGcfAmhdZVV2MEHb2XS7u+c14zm/83xP8QHnJGuB2uybKhmUH3JTsPsCg0hB3Ck/fqmgGAJ9lOYSCVi9w/oz8h7Omikuc0p5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUEZS7yG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso474313f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743079513; x=1743684313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywAiSUZQUifgGtMlK3LsbrcuFMsJsdDYrlO3CXbZmvk=;
        b=HUEZS7yGDGUsNhBY8r2u7KsvufBsHX1MLjVPQqKl+wguM8O90oKE/eM6zoqOcLEVN8
         ET/Zt6/BSU+IYvdl7n3twgeu0sQdC9aWT88JUc4fSb5EUt0n0101FTsCZofk6U3wCNEN
         SlseVAKlgjcqXy4cY7hSJUHgEwaBGGKWQk4izG6402d0ZTUzB2PntNhJV9htlej5xVqO
         aRhVfcb4VC26DMWtTuzzWDf8l+YlF7NyZqVh/qodThDKDYegOXWKxRbe8f3+7UrW3IZX
         NStAsNhyiu+HI6WRP/VoNKk/JXHxnJ6cLNV/Sm1DkiFkvffSe738Dq4N5VBX33kIwUQz
         jHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079513; x=1743684313;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ywAiSUZQUifgGtMlK3LsbrcuFMsJsdDYrlO3CXbZmvk=;
        b=n1Zdzr/X89uHITN7EGBkkwHK//SgyvJ4HQTm0g9g+NP+s+NbEGfn0678Ae3Ez0xiwS
         PqU+CYHJI1GOSctEZGkbGAVu2IpJnPuX6iOBwweAXmAnHfmepBAIQaWtTU54kLvjS4sQ
         rMu1CVFSoPL7ShPBlpeqZI+wMMhiW94XkW3HLNHhodQ5Hm40CZjUQwmuPlqpFIt1dLVU
         +YW8BK9RzPhjbu6Qjp2DDlssu9ti+kJXFagc+knw4QNuoEpSy5ArDJLZWzSgmggQoHPV
         IAYe6e3C1ZPCZTw7i+qUGYVFbsilrQeqERHEbjQy95GTfGdE6GxjjcJ+1lcdlaxlp5gD
         aJZg==
X-Forwarded-Encrypted: i=1; AJvYcCX2gak68NP4HSY3eMwidi/KqOZWr/XDkzXtn+ZpB0uEVFYcaqrMAsuAGltCOwq06N7GQQLn6/tiTOxNDocA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/iHWqV332aA7PfmguPjmkA/9H7t+20Pm3qxQh8NH/+PER7cwc
	CAqxomGIb53aZaEXsDOr5GDsaBHn32fy17C3n33X2JnkFu0sKCd7P3XxQqrAQUA=
X-Gm-Gg: ASbGnctOzgyJURyfY4n6h0J5poMqIQZjxRitHvE5epEIlJcVAxa4uQUEvx9MwMDbTU2
	oGJ6bL1wEj8xsTtGUGIc40tHjW2gKmOrVSNEWEs8TlMf5CRjYQTs90Xy74+UTM9wBscqQjU+K46
	QtEngSo1AVIXuVTrWS3lmMRy6FORxVr8OPzdK6ucxouFJsbebuYnVFhUiKH2Q4GZhU+8cXOTY/W
	NIw1N68EkobjOjr6Ic7qWQLFb3bQTl1yZCzU6KuHVHFL2AUynIyS5+2LdgoqesQcnQoPds7Jy2M
	J3COvpprv/6GDxpQGTjDvOaKLgLCjK61ZgKHaLOn5gGrNpoVa2OpfpFJVnBUvvn1hciUImrX+lr
	Zhu0kdyJtVW4x7waRYj1n8g==
X-Google-Smtp-Source: AGHT+IHdurar+Tu8wipmQyMmuoiO9flVMh0KrvWfca1Xs1qUXaSz9acwMVGXJo0NlFeWT+eD0GNBAA==
X-Received: by 2002:a05:6000:4021:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39ad1746712mr2449821f8f.17.1743079513560;
        Thu, 27 Mar 2025 05:45:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6445sm19920328f8f.71.2025.03.27.05.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:45:13 -0700 (PDT)
Message-ID: <fe202971-e2b5-4b0a-adb9-ed805076804e@linaro.org>
Date: Thu, 27 Mar 2025 13:45:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 1/2] ufs: core: drop last_intr_status/ts stats
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
 <20250326-topic-ufs-use-threaded-irq-v2-1-7b3e8a5037e6@linaro.org>
 <8aff7086-5cf4-4212-b97f-cf0bffd79440@acm.org>
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
In-Reply-To: <8aff7086-5cf4-4212-b97f-cf0bffd79440@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 12:40, Bart Van Assche wrote:
> On 3/26/25 4:36 AM, Neil Armstrong wrote:
>> Drop last_intr_status & last_intr_ts drop the ufs_stats struct,
>> and the associated debug code.
> 
> Patch descriptions should not only explain what has been changed but
> also why a change is being made. In this case, this change prepares for
> making an interrupt handler threaded. If this patch series has to be resent, please add this information to the patch description. Anyway,
> since the patch itself looks good to me:
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> 

Ack will update the commit msg

Thanks,
Neil


