Return-Path: <linux-arm-msm+bounces-26671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDF938411
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 10:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5350E1F213E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412EC2C6;
	Sun, 21 Jul 2024 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObkI0JcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C69479
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jul 2024 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721551933; cv=none; b=gCFgyFGjv6TGRLP8DRNoKIpsM0/yL11/rTstfCHSNmzl386k/8AmzQBp5cTdT+2WyXp1M9reGYAIa5/xvPjzX2rEzYtCU8sFGst/M5ol6oessn6tviU2OaEBvBRNmD1n1a14U1jnIgG+E9u//zMZ8iS5sbSciFW3DwcNxGsn0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721551933; c=relaxed/simple;
	bh=iCQdZOj68/akTNvWefpiYEBVhYawxW0/QS2Pv7LOC/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+c44cTwPGU3vtqH9veLmBHtjxZpTYGM3VUwggoU8djG/3ellDyVrgwYJbTXEPzqc3TTmJIuDfoYmJlYrvUGU6tfCUBtajGHVas8kQHlX07NATC1dHp73MEW4SOQ9xiEnsPtoUyVZtIk1kCi63EcohDyvdH+EEGXd+SpDvGleyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObkI0JcH; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-26109c97728so1326180fac.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jul 2024 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721551930; x=1722156730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X7ZS2uPOUje55mIE52CAqCCri08pD10wNTzXXCn3ihY=;
        b=ObkI0JcHS09zeI6Rl/r0Yi2B5ERCcSZMGN6lIFnN7BdP/rdLqeHRarBwiwNm+gw4lG
         30PgHdbxyLbey1iyGsT9JfGY4U+6WwcT/1ODCJ8e7P1hTG4ytd+8Z9p2j2Sv5oLjTvmI
         RZK0xN+WUv9lHKawRC21zM6rohnmsqGl0tOrKGo6dsKtK3ECYhnOr0CiUfeMywUpA5lT
         paP04jfG3RbzGnGeo506MyiKweja+vrkjLQ9L7JUGd12AFpa9i7X5cxIzFxmy5GAOgMk
         vtIQ9ZlugokyziJFteum2SMi9Sbxx+MlivJBTia9n8vewFUnC+sDKy6BYMlIcq2rIWMA
         v3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721551930; x=1722156730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7ZS2uPOUje55mIE52CAqCCri08pD10wNTzXXCn3ihY=;
        b=FzqZpO6CgaO3B2byNcHOtCwow5W2UWtn66P+mW/x8wATtmPLuD4OpnqcSgOgga3S9R
         GfXQmohxE7JcnZalNzoTIqqDgscf+ZfE0HMxYLaXIaTaqFcR5UP9gtGbzqu8l9q5ChWY
         wA+0AUpFwnyaLnCpGDS5cB2kcTngtvxzQYHl416hTxOk2L3N36pEOKrcwbQTs2yFGhHS
         ZY6g90FpvV9Wz+Mvy6joX+V4TXP5Ai5o4r5fpNEnAN629BNbgOWywBggYGGgKPc9PnSO
         PCddQIBkX7kzZzTxvqjfeUNAIdnr9LUeYzZA0QPdZ3MD+74r1bt5BBy6HHCYJ5UKmN8y
         6suw==
X-Forwarded-Encrypted: i=1; AJvYcCVSCkneVeNanCe5sedwlgFNT/C6lnbjdYVrxEmtKX/5q3BAejxnlk2eDKiXcrn6K2EcPNlugyVmQErQByasMeoMvYjJB6Ikscgt8CM/BA==
X-Gm-Message-State: AOJu0YxH3SV+LpAv7J2bP2OIgbQ8xyBDMGxJ5cdIlav2+mz0KjQAYc/O
	+PEZaH7gQLP18sZcl0BWZplAHnGvDtmMuhFdm3ZPq5/vCNj1mGgKbp6dgohHCg==
X-Google-Smtp-Source: AGHT+IEc7fqKlPNWS9Lge1u0WJuAaJVMRY75Y8sIwcx5LAC81F2MWI3JcVI2FJjY9FR1mPBL0NCVBg==
X-Received: by 2002:a05:6870:171e:b0:260:eb3a:1b2 with SMTP id 586e51a60fabf-26121303088mr4811129fac.7.1721551930158;
        Sun, 21 Jul 2024 01:52:10 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d24065a1esm415083b3a.120.2024.07.21.01.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 01:52:09 -0700 (PDT)
Date: Sun, 21 Jul 2024 14:22:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document the QCS9100
 IPCC
Message-ID: <20240721085205.GM1908@thinkpad>
References: <20240709-document_qcs9100_ipcc_compatible-v2-1-0fd67000e6b1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709-document_qcs9100_ipcc_compatible-v2-1-0fd67000e6b1@quicinc.com>

On Tue, Jul 09, 2024 at 10:01:47PM +0800, Tengfei Fan wrote:
> Document the Inter-Processor Communication Controller on the QCS9100
> Platform.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-ipcc" to describe non-SCMI
> based IPCC.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> ---
> Changes in v2:
>   - Split huge patch series into different patch series according to
>     subsytems
>   - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 05e4e1d51713..916c47fbc238 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,qcs9100-ipcc
>            - qcom,qdu1000-ipcc
>            - qcom,sa8775p-ipcc
>            - qcom,sc7280-ipcc
> 
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-document_qcs9100_ipcc_compatible-f5f933d24098
> 
> Best regards,
> -- 
> Tengfei Fan <quic_tengfan@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

