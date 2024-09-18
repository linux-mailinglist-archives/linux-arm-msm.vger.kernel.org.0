Return-Path: <linux-arm-msm+bounces-31947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7197B8A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 09:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BCF1F22EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 07:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A20816F0E8;
	Wed, 18 Sep 2024 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CsIwwC/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED5C15B57F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726645144; cv=none; b=NT04XYCAwtOpl2wHCQyEODfdDW8O7L6mP44BaV9/CwhLEuhFwqfR7Ki5qV4f+Z/P32nTBd7Pf7PBdNA4O09o/xCHT2sCmvJwSIm1vztwwsrsPr/r+LF+kZ+Y0QnpZxdU/SKR5mPH3lXxaIOnfa5SClnxHyZxQrlNEpk3IVIxhj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726645144; c=relaxed/simple;
	bh=//pIglqzc8dzYvGNeS5Ko9SdNk4llqFHy43hfE20ldg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=YwId4oOaPmDYL/KiQ4n/iMOJMguiLUWZ380ezhVBgz4Wwu4keidRnlCghWYbiIrAlZolLOIteo9tHLs1UAzxxAFdNxYvzBaf4r1McHlHaEC0s176w698G7E2sidRbrpjx2W+8HY1MURxSz4i7v4iVdYw5ebyDqRVvIMaSRaIPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CsIwwC/W; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8ce5db8668so43744066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 00:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1726645140; x=1727249940; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2jmoIVe7y4meKOlJ6qsYCF/E/rFl2kVumr9vup8PFw=;
        b=CsIwwC/WO3/MQf/eFaHNW9ztHmDu02PBTLoAGqnfoHlELVZuxJEXhfBdZPxcZAHJE8
         mXAIso9Qlh2sHlEYFbZdRv0BYYApoW3VyIw7wPFOpOrc6NhwocZHMCQUh6wHueYTxEe4
         bTT06dAwJGkqQGqRWmL+dVwKOMu7y9KkUXwGIDip/jhWWx4fzjwKC/r+uaYrVi332vAF
         0qgpwK9cz6FdAEjYjtnTBRM6yUjZkw9UKzScl6dnhPDapOx6zqmXHqExGPwjLsWWX7kW
         LeD5BcFgA9nTFqkNjPRVpGvvFXLqWYKYhEuTUbVNYRndXZ3YnQx4nmcUl1YkXSHF4/18
         tM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726645140; x=1727249940;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2jmoIVe7y4meKOlJ6qsYCF/E/rFl2kVumr9vup8PFw=;
        b=LIFxFZBaz+wZq5s6A83morAw3OOBi1WYKdWV96fDXMj5W1R06FWsHO4TxsLb2yVAh1
         kVD8/cAqRv37uHV9VWzbE2VqZzl+T/9wAn0R/PzkV36r2UypTH027xkijygVWCMed79G
         5t6Lfa5599nrChub7LCEavv8QhTaISqrmRc0wG9ng+EBCk2rLHsmC4J/Ap19WK0hi26J
         JbAk2qn5pTFbqBUroPxGqL2gRP2f1hl718c/DlGwhyATL+F3TGMKPIhSh91nFDvOIUJ6
         eODQGJmXywmZBBLT9YLln3EqyvdVnkVTJ2kcsTl4x2jAp0KCND8+0ex3dI5rK8Onaim2
         6qOg==
X-Gm-Message-State: AOJu0Yw6udwWiuzZwdCf6MjZeZES/6uOluA3uhNhvKkUdStr89abfX/Y
	5NSopvO8+qAskSEf4ZLh68dxY3RXQjcfCXPOmwrJ7aNu5ZPYqX8L05RVfZdglk8=
X-Google-Smtp-Source: AGHT+IFinsfrLJxQPIM62bR1nTdw6sMrl8MRa9zZrqsJ/V6spvPBZm85g7rw3MsYHtujZaGQwgKEDQ==
X-Received: by 2002:a17:907:c882:b0:a89:c8db:3810 with SMTP id a640c23a62f3a-a9029492510mr2239940366b.30.1726645139623;
        Wed, 18 Sep 2024 00:38:59 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a1csm543157866b.156.2024.09.18.00.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 00:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Sep 2024 09:38:57 +0200
Message-Id: <D498M9YSOTE8.2LB8FJBSBBLT2@fairphone.com>
To: <quic_vnagar@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6460-rb3gen2: enable venus node
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>
In-Reply-To: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>

Hi Vedang!

On Tue Sep 17, 2024 at 11:24 AM CEST, Vedang Nagar via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
>
> Enable the venus node on Qualcomm Rb3gen2 so that the
> video decoder will start working.
>
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 0d45662b8028bff475024cff37c33e01d2ee251b..d52a7e0a35bf941c66ccaa004=
25147781976b359 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -790,6 +790,10 @@ &ufs_mem_phy {
>  	status =3D "okay";
>  };
> =20
> +&venus {
> +	status =3D "okay";

Don't you want to set firmware-name property here?

Regards
Luca

> +};
> +
>  &wifi {
>  	memory-region =3D <&wlan_fw_mem>;
>  };
>
> ---
> base-commit: 3f52e32445a1f63b788bc8969b7dc2386a80a24d
> change-id: 20240917-venus_rb3_gen2-502e672d0e20
> prerequisite-change-id: 20240913-qcm6490-clock-configs-0239f30babb5:v1
> prerequisite-patch-id: faac726ebdf08240ab0913132beb2c620e52a98a
>
> Best regards,


