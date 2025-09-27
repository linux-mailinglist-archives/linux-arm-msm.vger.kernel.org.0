Return-Path: <linux-arm-msm+bounces-75369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C7BA5BB8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 10:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0D24C509C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D962D5A07;
	Sat, 27 Sep 2025 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXF2nlsi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD962D5934
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758963546; cv=none; b=mOBU3hLbljLNFA9VoTzeGRPwbAgIhCfFLWCTjqKDqmpfG0XNC2HIGhe1YiZCIGEtWwpz/vGZoruxgC9rIN2XdaUIbxsVzW4yt7fLfm2I2iimjw9U9pZ31dq6hkBwVUeh5DSfA/h8FYuochK8wlfIsm35Y2RMLMMnnIwu+Xn5TQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758963546; c=relaxed/simple;
	bh=Fqv0rk2xEnCxMxdyvu6LEpbT7k7Ly6+YLv0Ia7aryGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYCI6XlTQ82ftpZqI97XGNikW7Ig9ciFHpgJYWMGYmHlAWAUyowmOTbbaGgHyr5/A1yK4ZjtSaSfing4Uw6qOW0VICEZoF/j+lJXluRTlXgPVy7qFx4i7JmzHbsM+SC5zsg/0lKzXTrCuWbV1/MofBMQ2u/EzCVNrp0ExsKiagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXF2nlsi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4060b4b1200so2722386f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758963541; x=1759568341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x79LHukRr0nnGPYI9WtBJE+PwBazgPmAPIbZ3yhdhJk=;
        b=jXF2nlsiXp4XwMXUS6R7iD7Ch3SttM/9WsoAWHnZQjXW1xoNMlsWHd386HWLL3kyOk
         W4xrQeGkmIzhakH0t28nKgrJkEUngS4NO6Ylz+LuGG/FhWjOhbRLv/ERi4Fk9fhUUrDY
         7/Q3zl5LJP4MkmEXSv533nccYvKKOfwnBWarCjW2mkZvMM3/XjSJ1h9/uQPfzesPb2On
         TJFjqIefYOg1X2b6NOzc22QnCM3+PBxDrIoJPcGQdkp0DPtshxJ6kIA4Ta7IVAFzpYNj
         EjiJQaVvDOi86G3Sk+7EqK/OC32WCPThH0aorG/oG1J6wYJkIFpHQ4Dazea0TjhCkJ41
         M5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758963541; x=1759568341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x79LHukRr0nnGPYI9WtBJE+PwBazgPmAPIbZ3yhdhJk=;
        b=piNxZwfneJ5Gsw1WcEh34Knbnngez2umVscXeiwGADaPRBe8b3DUeX2SKfkuuvXFvJ
         41WcmkALXUqcOwtIxes9SmMfrtrTsUUUBEk3KdC8uhhdpwxsNP1/trGhRKoLkPOwXOby
         Lh40c7VZl6UJvy/ac91kRuif7QKg9/EHJqxleYFLOCFUVmpFjZThRmTwBOPyFBKgAvlP
         AJ8hmP+zcMRR1z0d5mz2VBvK7pjdgaX0H4l+jubwBSRwlx4arXXEvTVHq3yJOu2f6jim
         5UzanlFTIJJ/Ve8J9VL5ECNkMfHJmDxRhgTb4AB57ONN+3iC/DEithnZtrOm7C6ytofV
         Ka6A==
X-Forwarded-Encrypted: i=1; AJvYcCUQkuE9JW80RCTmizaQYxai4zXUeNZwZlgdJufY6OIxe1vv5bZL1q50oO5sqgU0LEvjb6aG6zRzWH5MiwH+@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKHLksm7jXINbMUxxMn+hJd2nFChmhbxvibhzfRI6FBTuUjlc
	FoFpSteNg9eRDJ4Lfl4gv5ni6bmmPRCsxbCoSYT4QqcRKrnwuYsDSv1DUSCmZzpoEZU=
X-Gm-Gg: ASbGncvg9e120ZkPg7LlkZdxhPTd6FgC34+bnlzF3m2sYzDTMj13JDvNs4wQmY1k3zT
	Hf0FBITYwp5GQLlCt2j4+TTOmCgsU9PMrS2VOdNe2uPKKZYg5x5/zpdiVF2W7ate8xq4J2ivUXQ
	9bp8Kv4Fz+4g7uKGZE1n8eVLGstNP+pcZqTHwEnb9GfZ5waC2lBAYqbgCQiebPElAW7b8dVGIUH
	7tm6rV1vaBfCVzc3psXO6TkJQFBQj/MbYd1QVR4O22Ub3OdKnB7cStAu5epuuO8rfnR2zUSYMH5
	2uuBLGoTUamuenZsH8m3VL7qk/xAEF6+3ZvSzZeK/octp3B1FANqJSshekEkjhS4GWT4LXVqbln
	6RWFno2TGV06zjDBHHUWS6okPdquECYc1uX73aFOm1nsgTiLpQB3e4cnZQf3XbIlSjj8SNBowyc
	CDEfwTj6aAi53VOWVbRJtNBhi+1A5Uic4=
X-Google-Smtp-Source: AGHT+IGfnon4MSQqIVTAixxjvIFsxE8Oezc5BNxym0Kqm+h8CrAyJE0vkTIm4xnHCIpiDfBBZXcogQ==
X-Received: by 2002:a05:6000:1884:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-40e4bb2f61dmr8701044f8f.29.1758963541203;
        Sat, 27 Sep 2025 01:59:01 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fe4237f32sm10058496f8f.63.2025.09.27.01.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 01:59:00 -0700 (PDT)
Message-ID: <b6066559-72f0-4f1d-9134-c93f732fa6dc@linaro.org>
Date: Sat, 27 Sep 2025 09:59:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Laurentiu Tudor <laurentiu.tudor1@dell.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250927032240.20759-1-val@packett.cool>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250927032240.20759-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2025 04:22, Val Packett wrote:
> The commit that moved data-lanes into the SoC dtsi (458de5842) got merged
> in parallel with the Thena dtsi (e7733b42) so these lines remained.
> 
> Remove them to enable 4-lane DP on the X1E Dell Inspiron/Latitude.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index d71b67824a99..ef83e87e1b7a 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -1090,7 +1090,6 @@ &mdss_dp0 {
>   };
>   
>   &mdss_dp0_out {
> -	data-lanes = <0 1>;
>   	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>   };
>   
> @@ -1099,7 +1098,6 @@ &mdss_dp1 {
>   };
>   
>   &mdss_dp1_out {
> -	data-lanes = <0 1>;
>   	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>   };
>   

You should include those commits in the style of below

commit df8922afc37aa2111ca79a216653a629146763ad
Author: Jens Axboe <axboe@kernel.dk>
Date:   Thu Sep 18 13:59:15 2025 -0600

     io_uring/msg_ring: kill alloc_cache for io_kiocb allocations

     A recent commit:

     fc582cd26e88 ("io_uring/msg_ring: ensure io_kiocb freeing is 
deferred for RCU")

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

