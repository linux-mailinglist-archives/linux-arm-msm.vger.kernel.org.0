Return-Path: <linux-arm-msm+bounces-61997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E96AE3672
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FB627A7A1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 06:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFDC1F3B85;
	Mon, 23 Jun 2025 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5V39glY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7EA1EF397
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662048; cv=none; b=q7VSLuOSx+mTiAlkMVKr+BLha0oMLHGi2DiaFI89MKw2h10cYi1pdf26Sy7nzBYFGt9hITHnqv0xbSWYSveVuOB62I7rcICpiXT0vUz2zy259Be3jDphzrx2beWYYES6iSSBkLhMXxWKQrVAsPVmZY44HrvzwCNTs8hFBfKXNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662048; c=relaxed/simple;
	bh=fkTxCHWLdcqIaJ40UUfakQLAPsDE0f9aTf0SAjS7K8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1WyjmVs3UncYZU7b90V7WipLiqTKD13O7GW7Ev/jAvTFKtoV9c1r8b0DBKOn2x6DVq5SSHes3otsuv268PrOEkap/yT4SHrcYKIro7Cv2+CDL/XwKwZvlqUDitF4FOygNQeVy3vekINsmjEuYVcmP1RZiUYuPIdbT1aG5HNxyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U5V39glY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74264d1832eso4854907b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750662045; x=1751266845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
        b=U5V39glYuZvXxL3VttRKjvPcWtpHvljpMylgNK+IAc9vfYOppbi8vo1ELcshjQwDUt
         HAcfD83xmrAAEmnDs3SAstXlnspZmhbb7wxkjGb+J9N2MB0O9tZIW9+WE+PtcaGg64Sm
         t5mewOuU1B/o5TZTX68RD30Bj2/yZv+LJ6PxMPJwPNcDMj3hvDohGpYWBRFxzzrW5vhC
         O4iWuGFrSxr1KO9rCn4I9d1r8+zFSp3ae6pnzJjHRFTXvFyrxQ30FIfniGQ/xYpvDbMh
         vii0iIewo9gewU/+VLFwDolR8RvBkVMvQs7tdsyIiQh05/L/bYliX4hLzTGVTch+7F4t
         hUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662045; x=1751266845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
        b=hO1OMlGuFlg0/kuOU2vejp+iC9NXEgSUo90VMQWCpdEpCeoIQyBP79Gj+ykybgzFXS
         Ka28eNbn2WGi3dY4gafrJEH8SgxwTaX196ru2ebrQWla6h1OvIZt5pqRNiFyY44REMSI
         KX8CQHjCTnlX/16l4cQNNkLJn9wqg5l3JL++ava8NSpO0HqcewVYAUYDjL/aWJARy96t
         IqYjs1LaT7YHHWlIEivW6eExNeuf+jddVHND1DVJPgk4bvrLgw+RsWOGrp5yOpbIQqrM
         Rg/jqIWElhqHpiXDEOWcVxjwu5O5wwFPcC2mYXjc/uJs0xrzNiN0yWuGTinC63gBfDuk
         s50w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/exdsPSt7w9fzDdGgUsZ7GjrqJDBzUE3BGJ5OKjCKW/ewme9bQb47RSa4Zpk8ugWoilDnJe4IcfpmxTB@vger.kernel.org
X-Gm-Message-State: AOJu0YxZENtnw35UMf9eBkExm+/JilMuAlplDlbu04fl6hd4oRsp1lOP
	BWh62lZ3uR9KUrBpXahifPodnss2X2TuLYFYgBwRAjcbk2MriclKp8OzncZPSZzyJng=
X-Gm-Gg: ASbGncuNVl1oAXaoRh4lAZDDs+LSgVZ0gG6Af8yyN9ynwDljqwC4hpwGyxJdpzY/8+G
	LLHoBfJ3hU90qdIO3KdRWles9DsXIU6OCCovHf2JTL6BWvFCjm3SeMkzFpsaMq+SMAM3kBiXYGR
	sjHJEUl+cGBKyqcmEdUMOWKsttdeD42f1oRKxJHmjgvABikrIpM9mbyzFV1z/wkK74uwp8kaxaC
	4Z4jUvDTyGjugwONaLBUzjJ0PM6RQR+KkQoLvTD9pejcU3+VYzEVdFpskxoPZ5L1zoY25TFHte1
	NGkUFnFAgxLaOypTruVsMzXJXKchMEDDKgORNP2EzImJg6OqNhKSfAdjUFVVmuE=
X-Google-Smtp-Source: AGHT+IEXarhTj8XelbP6w978NQxFdzm3KYgRpu9wOKj/2FZyhLsamJaeZ3ORI0nsqTL5pXTi/4utUw==
X-Received: by 2002:a05:6a00:4fc2:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7490d52ca7cmr17381283b3a.6.1750662044834;
        Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm7310911b3a.163.2025.06.23.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:30:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
Message-ID: <20250623070042.d7ibrjc24gbtfyci@vireshk-i7>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>

On 20-06-25, 12:24, Akhil P Oommen wrote:
> In some cases, an OPP may have multiple varients to describe the
> differences in the resources between SKUs. As an example, we may
> want to vote different peak bandwidths in different SKUs for the
> same frequency and the OPP node names can have an additional
> integer suffix to denote this difference like below:
> 
>  opp-666000000-0 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <8171875>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0xf>;
>  };
> 
>  /* Only applicable for SKUs which has 666Mhz as Fmax */
>  opp-666000000-1 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <16500000>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0x10>;
>  };
> 
> Update the regex to allow this usecase.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -23,7 +23,7 @@ properties:
>        const: operating-points-v2-adreno
>  
>  patternProperties:
> -  '^opp-[0-9]+$':
> +  '^opp(-[0-9]+){1,2}$':
>      type: object
>      additionalProperties: false

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

