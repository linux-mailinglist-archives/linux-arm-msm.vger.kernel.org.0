Return-Path: <linux-arm-msm+bounces-1130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9B7F1263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 12:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9E2282630
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 11:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2345B1803B;
	Mon, 20 Nov 2023 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz/Brs50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE2F14F82;
	Mon, 20 Nov 2023 11:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9208C433C8;
	Mon, 20 Nov 2023 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700480906;
	bh=UJCr0Qxyssxmu6qLQ79trNX/zz2V3o6aWjqu9Go9EGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kz/Brs50IcMgJfxqKA3Y45Qnhy8zmk2rLYiKRpB5gtTmmIT5c1FTOWLh9+v0r3E/f
	 /F4UgkVSOXxaDkI65mOp8SyHQES4a3VHlPa3Bv+XolZFGSOrHlaeiEho+40GWOyrIK
	 xMeB3zP2c+KKRrNcDFvO7eaHgu7l2y7Eq4lJ4vqsQV7DXhb7Uj4fb7dfirehA3r7V4
	 aTng1b9w/0jH0cKHhSXP9YCUfDs2IinC0+wm3XsRgBm4nX018THuQXsDWM+c+OfD5e
	 xPm9rJKN7dS26zFB4c9DIEuCP0COqiKjHOvBWZaOKX9ZByD7FXg9FbjP/q6zYvqEgq
	 5pzIQbH37FRTg==
Message-ID: <47925f9e-32aa-4762-a4ec-aa559e18ff12@kernel.org>
Date: Mon, 20 Nov 2023 12:48:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/4] Add runtime PM support for videocc on SM8150
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2023 13:39, Satya Priya Kakitapalli wrote:
> Add runtime support for videocc on SM8150 and update the resets
> and video_pll0_config configuration.
> 
> Satya Priya Kakitapalli (4):
>   dt-bindings: clock: Update the videocc resets for sm8150
>   clk: qcom: videocc-sm8150: Update the videocc resets
>   clk: qcom: videocc-sm8150: Add missing PLL config properties
>   clk: qcom: videocc-sm8150: Add runtime PM support
Hi, it's good practive to include a link to the previous revision
and a summary of changes.

The b4 tool [1] does that for you, please consider using it.

Konrad

[1] https://b4.docs.kernel.org/en/latest/index.html

