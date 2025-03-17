Return-Path: <linux-arm-msm+bounces-51641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E445EA65A2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F838172A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21A1DF963;
	Mon, 17 Mar 2025 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="iYuN7RWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742F1A3163;
	Mon, 17 Mar 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231492; cv=none; b=EnxJFj7enoR9YExa/VYei8msdAVyRip4Xtq4r7fIGTcDlE7XAVoDM25sSpbTnORLO0jC/lwLDLCEuIAHdR66QpUmIlyK+NYQgNoE3fBu+zFMeNuv8QmS4opLTPHmFACjhr4oeHffhvNae4xgUvcJcuXeepg8LPrpPGnzpoiyB4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231492; c=relaxed/simple;
	bh=ql3BNZNoZ6lCMjPIVaKAHFDnwQ4YjwOtyGLg0W57xL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YS9waF2mD+qfANiSa7DpQivVFXIqhCJP1yjh9cykUEQ09U1pfBkURjyuv26UNCmlcj4VYTIidp4bKXd7dhNbP79Ais5XaOmHC95Is91Ds9LzXrWBuZFXQQw5TNB1RY5cQzrIl0/Aq7Zat36HMFaNQD7KhSF4tptfU8pK8Q4L1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=iYuN7RWt; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1742231050; bh=ql3BNZNoZ6lCMjPIVaKAHFDnwQ4YjwOtyGLg0W57xL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iYuN7RWtR7xkVp/Oaez2Phtb2ec5XJp8Bc3yk5cxNtfKk/Td6OQKFAsbuY+oERIp2
	 Tj3dgLdvJdLbbXggpi/mijUD0qQif9fOSq8bvRwpL/zEn7mx1510Xt3qA+poAEQVuj
	 Xeq09prGXz7lgfLNv6ofUhClPHRCF8Yxg3C7V3+w=
Message-ID: <d605e4df-594d-49e0-a8fc-5992e36d6310@lucaweiss.eu>
Date: Mon, 17 Mar 2025 18:04:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: mailbox: qcom: add compatible for
 MSM8226 SoC
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
 <20240619-msm8226-cpufreq-v1-1-85143f5291d1@lucaweiss.eu>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-1-85143f5291d1@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/24 11:02 PM, Luca Weiss wrote:
> Add the mailbox compatible for MSM8226 SoC.

Hi all,

This patch is still pending.

Regards
Luca

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>   Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 982c741e6225..dc75ea2383f1 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -25,6 +25,7 @@ properties:
>             - const: qcom,ipq6018-apcs-apps-global
>         - items:
>             - enum:
> +              - qcom,msm8226-apcs-kpss-global
>                 - qcom,qcs404-apcs-apps-global
>             - const: qcom,msm8916-apcs-kpss-global
>             - const: syscon
> 


