Return-Path: <linux-arm-msm+bounces-98216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAkLNh5wuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:15:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA32ACCB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11041312A0CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28E23E92B2;
	Tue, 17 Mar 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKceOj4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD23E51DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760040; cv=none; b=SPdGI/JdqtAQJLDdhe2fyOMprzVfgV0Zr6HA0URpGKdVuDo77KnMBamq7f/foyCzFcdRBI1qNswy4QszUS0HmMa5dJKM9VQydHvfrvHVRENtw41+JfbHszmhuEnFZIo2t0iFVaY168IJjk8ZrORxeuPVxby+91W8lqwBUYiuoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760040; c=relaxed/simple;
	bh=Iv/a4IgbzJgm6NP1RXA/rQfgyglwxFeOlAZc2sejIkY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XE4qrWibOf64T5bslJ+DpB2rtgm3XIWDvRtLu2vddg5YFo5gzH2dk76xTrtiQOnkGj9Kmf4JI1I1XeuVah52vvC6xzagzcFoH54TaI0H/x3vz3NZ7MJ/EABc8m9lo0hrtZBxs+OpIaYN/TqiCRkk5+xkCN2mBT8nwLUgksh0eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKceOj4d; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so6575284f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773760038; x=1774364838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm0ZtV2qY3lSQlH2YKeSIbYlq5LZMAlOCxYEN5/copQ=;
        b=GKceOj4dhZGIXWlooH+yDKtbH6mm536RE1rqo6Us2fGVeGlfxRC3Za59XXBBaJ3Z9D
         I62kEAmB+GKRefJV43yOU+V1dS05EkZcZNyEWGnMf0IFXjDY28p2MSXuXssoVPK9KElY
         OZityYBKWfo+GFHpwMI5mOvWAkGiG45hVr31ptcaMKxOJ3Ffs+M5xGqUOCTIHClq2Ovd
         /s294D+V/KdY7qFsyjw9Ps0AYiyRfrzMXHK5Rj3RKsKqiPA2Xy+1Sxpmchc54TxNWfY3
         MToTTt6H7uzyUT7QLZASrWxwgAPniGaAXEOL1i1R6EBYVbZBdkHmlsiOLEuxHDAbtcZs
         Dx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760038; x=1774364838;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm0ZtV2qY3lSQlH2YKeSIbYlq5LZMAlOCxYEN5/copQ=;
        b=d3cSisHtfjhRe4TWOjQag5oNt7D8/L0VJvzo/9fiwh0vgK6KJQvob2D9bi3fpsjEOJ
         mZX2ziYNmitnRSidVdei3f17bIsFjR3uiiYQUC1qMWqR4kAX1c0G0PsHrrdKwkJrWbC4
         sJWFJNgjeQXPF1Tf/HEUjTF54sYJB8f+27BiEM9xaInxSyxEgSUaJWnyLg7Y0OKaHQIE
         j03Q0o1aGTqNUsh5LMU7tHsIoxk9iCZe1rOz0pMdmzJx5Ko64YrxNrI8eHY5Lkr2A/Nx
         iH9ATBKEWzcT8bZjkmQhuWDIOfkd2Zkl2Ihryb04AJuU2LEGhwXen/60JGUOt/t7NcBw
         l8sA==
X-Gm-Message-State: AOJu0YxLNoKcVKkUMygjuBpt6+uDT5v7yfmDk/T8v3xtwANRUIU01Krf
	+BQv9DoPZmv/DmR2y1o0f4hepKDbt07cuERhqcsf1dKYPdgt2ZyPZx6iUIhAnpSHJo4=
X-Gm-Gg: ATEYQzyyX2ADylq7RXgxotTRE98MrxXk18jIXGIttw1ajyHTLKQYD4jE2w7hOlIrDXc
	L/BTPyKpoeVZ2DpYZZSsYb0GgsmX+zchKpag/4DtPYfLrveDRbp81svluKe/F+sWMHZkC3sCKQ3
	GFshg6OFJnEgY211X/Gf4n1nSZZ7/qx3Svl7O9ERcuMAigVbnUgXWoCYYsv5pTxKWNKiMux31Ay
	SssfCnmEzAxzsA+19XUyVO/Cdb2AN8HWCaYmgmbH1F7K9mJZUhKyNinrwpZ+es5eXuwrnGojWWK
	8u85luAmTymmzkD47/IKEY059OrkibGLOTeFuVRL2KwUbqQ0mvsWJCtDf6gSEBLJ7miUsoEM8aq
	T9eWsD3XYRvM/aV7POmjKtdGiYBYdcHcMSk3R4Wh5scjAtG1crOfl9YB1z43CW/2Mn/RzZy0u3c
	RpoBOmUFjzGPKE+QJU0Xdtw6xNy3EFph6DaL5pBd9eIL9Qcjf/lfBPGQOMNbGtZQy9XVHqSGfBb
	rcZqHk=
X-Received: by 2002:a05:6000:40db:b0:439:beee:43be with SMTP id ffacd0b85a97d-43a04d8805cmr30967537f8f.24.1773760037631;
        Tue, 17 Mar 2026 08:07:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c778:639f:c042:aa01? ([2a01:e0a:106d:1080:c778:639f:c042:aa01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm176539f8f.5.2026.03.17.08.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:07:16 -0700 (PDT)
Message-ID: <cf00d511-515e-44fa-9e1a-55f76577a27b@linaro.org>
Date: Tue, 17 Mar 2026 16:07:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8650: Fix GIC_ITS range length
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jishnu Prakash <quic_jprakash@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
 <20260317-topic-its_range_fixup-v1-5-49be8076adb1@oss.qualcomm.com>
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
In-Reply-To: <20260317-topic-its_range_fixup-v1-5-49be8076adb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-98216-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,1.5.137.32:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 45FA32ACCB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 15:41, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, the GITS_SGIR register is cut off. Fix it up.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 357e43b90740..e411f5b770d1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -7219,7 +7219,7 @@ ppi_cluster2: interrupt-partition-2 {
>   
>   			gic_its: msi-controller@17140000 {
>   				compatible = "arm,gic-v3-its";
> -				reg = <0 0x17140000 0 0x20000>;
> +				reg = <0 0x17140000 0 0x40000>;
>   
>   				msi-controller;
>   				#msi-cells = <1>;
> 

Good finding, indeed the ITS code would remap phys_base + SZ_128K for sgir already
which is out of the original range.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

