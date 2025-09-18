Return-Path: <linux-arm-msm+bounces-74091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B5B85167
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43E37B8A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA90E31B111;
	Thu, 18 Sep 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+A9wdZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B04C235046
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204410; cv=none; b=A5FSJzvzZOby4Px5E5v5WMRYgrvWIzedDcLn5FsBoBGP7mavl5IGCjiXIQiJznDD666nFlk5/We+bYrjpKYKuQK+HK0z5CbZrRm0+Nv8eBEjPQmx/sPQmeUHOYb8Vi2pQMdbwOAIJl/o+PLVf0eFbYhYCf3SLUlHmY3pq4QBCWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204410; c=relaxed/simple;
	bh=kVCd8Fct7e7bf0vwHwrNQa3GHUMPil3Om0eSTrEc/VA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rUvaX3Es8TnYmjyAUiscSe7OsD651vXd7A/D2wv/DLoTFWF4x3MviBTY0oh5qXr0KpfCQZYidOFGuqvTRvSKB9cCwdj4FOJiJeYMCk737CWFKQ8yA5niTxRYvJlQ2QXh9f055zn6f0QoFVwQZGCCEwT8MZtxSfbcmfUWy18lZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+A9wdZn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso10379245e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758204406; x=1758809206; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Qwyr/Q/DO684tqA5E2UFLoEcNHQATu4w24pIRPlXIs=;
        b=B+A9wdZnnFszIaqjGLTOGwB4bzybE6Z3yYVzNxuwhlKBKZn1rTYw/x6/9P1K6z+MOj
         xAyn+YONwQ2Kkt4dxgt2WlCvKuIURm1Yoxql/JiRLgTJa3svrUVlGWDwM8JMx1id4vaN
         cit6qp0pnFbfNCZn1Byu/DfEQT03132H5s7ra6z+DfNmJwOtBRA/SK3yi9bUrFdJmPIR
         yENbC72+vcWHCZgzvvqPwuAAyzmIGkYyznzNBJs0rnfjxDeJu6kIRsQFT4iKmDSN+7Xs
         96bi2y5iS2Fgo0fUFEMwcQQIhH7c3YFDmNVfxjcTrc2EniEijAOz8fW8JQZqSQAsH01Y
         fKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204406; x=1758809206;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Qwyr/Q/DO684tqA5E2UFLoEcNHQATu4w24pIRPlXIs=;
        b=LYp3AlYBYsBJjhRhiqZiKdRqvpwuS0C7Azy7dc9gUU4h+WGxTQx5XhYoMFxobiij0C
         vB1hv9pbDWP1zbz9qiJAgf6LqtzZM92QG/6O2vhij4isVSUWBMRqTrSQK0urB0Gtcs9l
         BM89EgS9pJYPzFRSO1uMlqibjHDu8GDP66FGjZVsSul199t4JA+wk+I4XTspOBj5To0i
         1NVJ6CYY/UxbrS4FMvMur2oUunVgL0WZoAr2+3rtB3VDFh8nOBxeOdNAWsPZCSbBY88s
         NhUk/Pg6aFh6CrURcLJbAsoWtBYRj3DgKHcTwmjj68cSrQnLPtet9GnS2U9FN5gz4rxj
         pHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG13aVRGxyBGZueLId7tSJkHD9vovWYNtzLJmBbbMs/KtEgf15sfYBuxdDe5VzmUK1JplPvnNO28WWhlcy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2yaVopxlfp65t0SO/O3+/RLHFCqz7wNeuwSFY6ykLq57jCAO
	Ne6YkXVCEoIERb+/CEemo15NdwbHVJgWfUkpuYXl3S3llw/MhUYVrbMxcJhlLezdV7A=
X-Gm-Gg: ASbGncsyv6XQRETPM74ODzqgJ9X6R6kobKKs1whaQbIA9Y/CsWQs+QJYcY81xhupwX4
	PtSSm7MwloGNv7jkBZLa7IBfHUuPZjh96P3DFHCPnPKDf/DRC2mkxqiLLlsbwALDhk6Irm3nSKM
	If5YhOYDK13jmesSCtDK9vtlIPVWJSC5p65sCg0oFATvTkaz4SB+/akCEJqd3wxasv7EFQLyr/U
	j1wjFq10i6N6vjMr9lekcwIdw/ivEXK1efEk7FvIG3kxy4kEz24zpUYcWr3bI6bnLZWyy/tG4Q6
	2pGPQkmw0USoG6POwFmD1jzk/zHOmIbUk7kW6FKqdmS0yKSlQSU8OOGmq4cL1VXbixOaA1UiEvC
	W5svuoRDYIBnugTnc+QhF1xUcO4iXOHdv+k4W3b2aIxuKfLE=
X-Google-Smtp-Source: AGHT+IERljH7jdoxo2opn/uBJwfRgd6NXD2EBQPVMIWYZg2WmEP7Evl3akNrhDu4Phe9l2VQFkR+sA==
X-Received: by 2002:a05:600c:42c1:b0:45c:b6fa:352e with SMTP id 5b1f17b1804b1-462d4ca0573mr40002205e9.18.1758204405811;
        Thu, 18 Sep 2025 07:06:45 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf286dsm3713795f8f.56.2025.09.18.07.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 15:06:42 +0100
Message-Id: <DCVZFZQUBDLU.ZKUOLCK5HWSW@linaro.org>
Cc: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: lemans: add GDSP
 fastrpc-compute-cb nodes
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Ling Xu" <quic_lxu5@quicinc.com>, <srini@kernel.org>,
 <amahesh@qti.qualcomm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
 <20250813030638.1075-3-quic_lxu5@quicinc.com>
In-Reply-To: <20250813030638.1075-3-quic_lxu5@quicinc.com>

On Wed Aug 13, 2025 at 4:06 AM BST, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for lemans SoC.

How was it tested?
Does it actually work or was constructed from downstream files?


> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 58 ++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 322abd0294be..a4c79194cee9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[...]

Best regards,
Alexey

