Return-Path: <linux-arm-msm+bounces-67018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76553B14F87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC5F4E0903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D93D1EF09B;
	Tue, 29 Jul 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bmn6cDz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2317CA17
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753800590; cv=none; b=Yc+5JTAyw4jjg35umGN1oVXs/vudExYOYSle6rN5ZHouy18TF20gM1L3zVeGVh/OrBMkB6F8xkJBVsEhbgAc5IcfyjVnSG9udMRSozRBvrxJDnGAUxKbAQAyvAYZvD97L1TSrcgIA6uNtquDNRGtfTG2Id3QEabATWRWMFqn4zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753800590; c=relaxed/simple;
	bh=r1UFwYmz+BrZUMtrDL/wYAGPPAvKhZrnCmrHrv4UKII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Om+bWubwnSmYc+Z4iyOq8xsw3e5+bip9wnfYYZpmbX4DUHce2N9YprXvySwtf/NnDkDCMLzkTzdaVrcFUR8vhwhbCmzSeVOfiIgNQKh5TSVbD2kGge4c7sFSPvk7wxjBAWURxI7ckVA/s0uThY5Rz6ZLcRt9cQM3KYxUzpl1KhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bmn6cDz8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so37301345e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753800587; x=1754405387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2Tf3e5iOqKYNcNlcuxa0oZJpIWmxXLdr8GMxVlz+Bk=;
        b=Bmn6cDz8coWYujkE7kKSU+5/kVyJiF7nTTu4K5EkBGX2w9WgwRvbbz9K6lDA5PTSSo
         rSHRjdsZ5jWRRn3vwj22EJPKryn+/pmHYF7IdQSjZCO1sMWT9tdCHW0DykUoh3th/N/P
         QUnZhfjEWLH8QWzsqFqJk73C3nUMKtoG1s//bv1sjSBTWtsj0bi50oB6yyzYdKctySJu
         XB6R+fbVJ+eIMiw5umTINmz4E/JvfbOeFVxzGbMrieGcjTg6aqJg46wxe7dluyuaWVqI
         w11CXFW5LVqDFjf8fJf0q6S5uZ5eDSniyr2JaPM2huI7X3QTnef+cZ4MWHNYcpQahfbY
         6+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800587; x=1754405387;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I2Tf3e5iOqKYNcNlcuxa0oZJpIWmxXLdr8GMxVlz+Bk=;
        b=dncGti7Sd+qo0WK7W6m+VaLZNwFbiF7IuDJn2D0hsndzo0mSaSr4EulJllIyvsUEvH
         7pWQC8GhfvfcfLRKmxW935LomSkNL7DNRXVP7z/Ik9W/KPQbmTb+D4UrX+v5GKE1hXNE
         YUpZkwckWj8KwAG+LBCDHf0QT+XCszszn5x4eCyTaAm3CPFtOvN2EMHi/6AGDuFkjYNc
         ha80Ir0ypUoKAi+25xDfMOhiKIr+efGmshAxIMpZ1NItBAsCrp33gOo73lqyGjWuL/QT
         bXPOcYuoJqINlNQnoxUiN+7GQJTSILvECksMnTOVniegLJVpdLIdYIhep8MQ3wcDeS6K
         vGvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAQAgTl1DmD2eHETHwAg0kL6AaydX2nvdgWN1vbh3gHe+brE5kxmnD1ilNygsd6Yofjs0GrjB8OKoyILL9@vger.kernel.org
X-Gm-Message-State: AOJu0YzEROo++evf7O/PY1zq1P+5IAfXLlaOZYNRU89iaxhelgLh3+Q3
	+1lCmd6nrevRO4v1wy3N9WEtiH35iialJOXvhbiQLyd9oEFMjMEHo+136cbwTCpcZGCr/7Xbtbk
	SHRqg
X-Gm-Gg: ASbGncuV+/ntnEqX/yMTAO2GSctdRnj3dkIvIObJXAXp8VvR9IgDpABeMRsEyRlOCQD
	GNpKeoT7IadIx0XZPdQivFcA6OIqje+j1BO9PPREOyWQQ4joabwLxV7+2OFUilV1iKdVRvcOYkZ
	IqtmPYojHwy/YcMGS51JR6retxQ7sfIyJH+fSAChE7TmtZybT0qF1/cJlqsxNQxtf83sqBOs2Aq
	86EBZooDWTahMIiN9LF9GTUe7K6Us7lucksK7s7UWQiU/2+TTavQi2usG0aaNSbQzOjvUoqMpBC
	/pJ/T6zfNt+WC0udvX6uPPLn6eEanpH8F8N/Md9Kz7QOORHtS3wPsJmDp4hw+UQOpHDlB754vVi
	Hx/EHm1WiKuWO0CALHqpcHXzz1luWEHg8M7x7DKmPy8Gjqu+m/9vU0kydtqMnS2IbWpH0FU03
X-Google-Smtp-Source: AGHT+IGs+i9gy28kaa/QqdfY4LVRaZI+Pn4+pjakJLPgQYO8ePjbRR7h1sRiSp3ATzjonbD4ntYgzQ==
X-Received: by 2002:a05:600c:3e0b:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45892b9c21fmr947055e9.9.1753800586710;
        Tue, 29 Jul 2025 07:49:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328? ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377f0sm200315055e9.6.2025.07.29.07.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 07:49:46 -0700 (PDT)
Message-ID: <8e56e1a8-7b26-44df-ad57-e2092cb5c9ab@linaro.org>
Date: Tue, 29 Jul 2025 16:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 00/18] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/05/2025 15:20, Jagadeesh Kona wrote:
> In recent QCOM chipsets, PLLs require more than one power domain to be
> kept ON to configure the PLL. But the current code doesn't enable all
> the required power domains while configuring the PLLs, this leads to
> functional issues due to suboptimal settings of PLLs.
> 
> To address this, add support for handling runtime power management,
> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> The clock controller can specify PLLs, critical clocks, and runtime PM
> requirements using the descriptor data. The code in qcom_cc_really_probe()
> ensures all necessary power domains are enabled before configuring PLLs
> or critical clocks.
> 
> This series fixes the below warning reported in SM8550 venus testing due
> to video_cc_pll0 not properly getting configured during videocc probe
> 
> [   46.535132] Lucid PLL latch failed. Output may be unstable!
> 
> The patch adding support to configure the PLLs from common code is
> picked from below series and updated it.
> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
> 
> This series is dependent on bindings patch in below Vladimir's series, hence
> included the Vladimir's series patches also in this series and updated them.
> https://lore.kernel.org/all/20250303225521.1780611-1-vladimir.zapolskiy@linaro.org/


Could you re-spin patches 13 to 18 to fix the bindings checks ?

Thanks,
Neil

<snip>


