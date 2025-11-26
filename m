Return-Path: <linux-arm-msm+bounces-83408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F5C88E11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7D244E36B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C10130E0D6;
	Wed, 26 Nov 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f10k7ebD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA143054E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148335; cv=none; b=EBY0MYzXSbaseqmtUoJ0LXye/9f8Qth3lrKTo7sP3pUoryadtwkHnn5JI3lYfPenUyCWprMqt9Ci8QIXVWQ4AMRAIjuaS18nFlAX/pPQmSnEzYW2gtvnIBlnsClXikQku0OFZaXU3VDgb5MNfGZ1hHPFY0SqlRI4AvwYtC/vWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148335; c=relaxed/simple;
	bh=Ac8CZP+Qex8Cxr3YMCs9FjqLpA6yqzxjM0g2KRy0diA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnQ3WzDo4D344Jdu7Jz+jYoDt//ktw5A+rHplY3sSu9nDHrDc3W9eh4dLMAcL5kMI8nbDtKhy/LQHXdCcrInDw0QqvwYbrZwCW0WOHhnTrPi3P3fZjLecF0UBPmavF7D1pEs4a/k5ESHIdN4xXiHut+3e2xQTNWrhwDJrUGpHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f10k7ebD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-596baf468a6so42415e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764148331; x=1764753131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4E49NrknmyKVbrF6BTVDIBB/Xa/FxUkYV6oPh/haHmA=;
        b=f10k7ebDqeit/whzItsesgffDM1qZNnof1nyJRdvM3BDnvFekg9OpalEugn5R1J99l
         oTEeEl3Ve8osQEp3jprMlFmVgnHZWSLpxXUJico2NJJuukBRs8GIq2ys1e+lyIv5o6rO
         VxHU1b1nq76ttIrjUuGhP+em/xmeFvCxu4qN9JEJGsrriHx5sTf/3z9gbBtfJrxgLkJ9
         QSD6SIe5EQK1f0TOweqKHj7s9K/Y/0p4bT3RbYzdX/i8IJ4kHOvo9PJE/XXgydqgYQHg
         wlAstgraG7WkdSxUNM+kJHy2vkZxbOntYTlDiNbd17Akqdy3SdxDqAM1V2czg5pWCyNS
         clWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148331; x=1764753131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E49NrknmyKVbrF6BTVDIBB/Xa/FxUkYV6oPh/haHmA=;
        b=dlrTMTpigP8/0k/3Y8sOhVsJ8LZwJQ94Ioun6sJhpnpqFWS0/vQThv3uFUNuf57Ckj
         RzJ5PQUERxcU5nWszvRRZHlbYWrDHyiDp0JkEMRnHc6/UAl1TOyqXWiXxif99ZYeSd6s
         WTLBAcNf33Z8QLHLTvRllcWInyjR/YShHFduj0bP12ET+Ud6aw2Aa+6lfhfSPruAlTVG
         gCioovFNzJqqrJ6rstRtrmjsV254xHD2KTXVT8cdhNKSc1G+FffpgYN377iuMe1XOjg3
         rK2+Ydz0AWC/f7gyUXqXUflPFRx+BAsr5Pd+ZsqOw8gnmyqzE3PkQYPYBH6HS++jN7YH
         o5YA==
X-Forwarded-Encrypted: i=1; AJvYcCWO/fbAp6zaTuSGH+6ZVRIoX9B5kx7ut29QpXLl+4oDfBKj5wd9OEkHgk+i02+uYvWYG4JfSr+fzeUdKm1m@vger.kernel.org
X-Gm-Message-State: AOJu0YynU24KUfXutK28vL1VmpUj53WET20aWDeva+2sqGqACTkm8eO6
	ztcwBR3qpoLtB5JNgts0LeSwVBd572XQIKqcxIGYsDJJ2y5rCLubWa0+MloZGQIa1b4=
X-Gm-Gg: ASbGncvfXnMu7EHpq3zMGbIeDReko+k4DKIbATG7QNxiSXNiQtmVsJjoLMDBZ3OM9q9
	uNt3kgSMz2A6DCWPiVnJ0KD5qc/FZUjWsQZo5ijir6O5kqhfmzYNtvtBtOAebWPe5n8ZrnzBnos
	X4W5RWAb3TXWwacuhtxXL2w216xONRR67djTgxQ/xpZCvPobQbe0CMfJ+2aqs9SEzbSWI0WPAAZ
	IwAcsZPMUTLJOAIOCTwefZOGyzkujGsHVuwv9Oecx4K38bSYonDKu+quoIZ+dPvtSQaXO7voKNV
	3gw3UdlZSW+mzcps4JLNpkRLw9WjhI7W1kEZ1OyEHVxB59qzJ91sU38+4VdKE8K/Xdee4aMSqTm
	/sS2Pdt//juLOgyQcoucaeEeMyNjd/yp+k7LWJNbR+nt/wd/WEoLrIb9yWxLh1tWEEgvC8vCB+E
	7xvbxYDp/rWfR9wjVIbJB3SEOc53UOLv8H6aeRfaArH/Z3yKQ6oyySTxsCm7IC+0TGVg==
X-Google-Smtp-Source: AGHT+IEtv1/pqxDyMoeRgW07garbnn9xBGkcn7E+1kvZ3ghmdiBvIFJ3o1bJzPKRN5xC8NfZc8dg0w==
X-Received: by 2002:a05:6512:685:b0:594:2654:5e6f with SMTP id 2adb3069b0e04-596a3eb7a36mr3728362e87.3.1764148331332;
        Wed, 26 Nov 2025 01:12:11 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75710sm5743525e87.8.2025.11.26.01.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:12:10 -0800 (PST)
Message-ID: <ea87160a-18d7-4b8e-8902-4d9b4526ff4b@linaro.org>
Date: Wed, 26 Nov 2025 11:11:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Melody Olvera
 <quic_molvera@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 06:15, Jagadeesh Kona wrote:
> This series updates the clock ops to clk_rcg2_shared_floor_ops
> for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
> chipsets.
> 
> This change is required to ensure RCG is safely parked during
> disable and new parent configuration is programmed in hardware
> only when new parent is enabled, to avoid cases where RCG
> configuration fails to update and overclocking issues.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
> Jagadeesh Kona (5):
>        clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
>        clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
>        clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
>        clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
>        clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
> 
>   drivers/clk/qcom/gcc-milos.c  | 6 +++---
>   drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
>   drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>   drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>   drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>   5 files changed, 12 insertions(+), 12 deletions(-)

For all patches in the series

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

