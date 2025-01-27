Return-Path: <linux-arm-msm+bounces-46221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED70A1D43F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A45A3A7581
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C461FC7D3;
	Mon, 27 Jan 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mVpnGmoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE56282EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972989; cv=none; b=g2Gz33vq3sBxzihNYixVGnDGG+ICyLdB0Pga/ZKAdJVb8IrlLU49l+fGCJa7p3US/LaWHNv/AqH2ZivcfDvJMTeqWgFW7xoU3CyfUyrBZH+SDfQX1aPRbh76wF6xe2ktgvHSY2Vlh8FZRL+HjvyDdlNgXZnBq6a+xXCjAxREm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972989; c=relaxed/simple;
	bh=obQsn4n7j3csTpncFqIxH2uui8/pigmf4CVX1DuQRO0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=MuEaWqWEzCV9sNUZahCgsw9ksxTsYZb3DxdO/ZQe9aaV0ppJb30FeSSNaiLRFOC2+zBe+PHLaOPsrcgJ0QyG87JMTH7z5NCccpjYnOMLoNCx9d1o1MiUr8+8OIHK4LrsGjR0Y31qKYSrtk9Z1PoLgsvjxe/hyav+iBGUD+LQZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mVpnGmoF; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so680239766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1737972985; x=1738577785; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/2xaO6ZwSPMjtqS6BLYIWLcBC2EYqu3omtVNpOuuag=;
        b=mVpnGmoFo9bQY/Lkg2/+nTujQsKYOn9VQE/UeEvDyRrLBVoshMqZe14LzwImA6h/eW
         Gxx7eXlhLLLeGSMkf7aFBp35sXbpl9zKDEPfKlaOvR63NZxxB1pdKbjkWmldbTn3clw+
         WbTY+YbZC7he0JqcsBkZBbQXYVLw9ms8cwQvOtkZ2kanS0A8pEFf1LEAncYMbVnuYIYS
         HgDQ80q/9QjX4x0+20GlnGSYFWCYDYBIkGTlDLFxL+YUPgDVVjXLThW+H+OXHGGkEl3h
         aHGFVjT8CGaw4fxH/20hshmv1qTvenJTAauU08kjbcdLvn4BP5V4ZktgmD/LBgCXUoDi
         0a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972985; x=1738577785;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/2xaO6ZwSPMjtqS6BLYIWLcBC2EYqu3omtVNpOuuag=;
        b=g4xio9BquUuQ+duoxrnDgA+w+m3F1uaFF9Lt4ivCM5+LoG0unOnlSe98ezEl5Tw+aE
         Zh81rWsK5Yd8/09ny65Q13d7qsc1VXFCo0zPauv8KEZ/1my5ULVkg43A+NnsDt/ZQEji
         UaX1ZL8ygrZfxjcV0H5c1JpKR3uP+LEnom0Ze2uKxW0pnPlQWD78J/a5bd2sXwALRXvS
         eGRG6JRWs8CjhNUGn6+EraQ9QYGHxxo3RBj2zLrIXVAj0zEGzGv5PmrwaU9Nl1roXG3E
         NuHav+alfFQ6nx3AhHADQvbpazwdisTaSfIUAIkS2q68NORSE7S0lAxLZORfznEDpLVR
         JFlA==
X-Forwarded-Encrypted: i=1; AJvYcCU53RtxzNvt53mejdCduDiD0h5SOZeR2PQkOGLGMyzA8gk2c6X/6u0C3FVJjgfvS+iQyMu0YS6MQO47RWgf@vger.kernel.org
X-Gm-Message-State: AOJu0Yygrhqj01zcnbvpUPDCCT1Nit4+KtFhsSnM8ZUqzRV9l9h1ulF9
	rZpyhc7Ze587yp8NW1V2K/rmYkXTtFZVIvahfyiClAEtQAqoTDDV95d/e00+/ew=
X-Gm-Gg: ASbGncsYDfVzOA+DHMjzemGcuz+nTZPMBZQzEAIWzXBb8UdBN/neNjSyVO1eqyJzkon
	jTlWpHEO7pkg94V4YphhHn+4lO0BvUhPw7sEMXecNUOYpSHfa3X4qZgL1rSgBt6iCeN1YTaEv8x
	6dPUAEAyCoCGusHwvzQi/fzM9CeqkBEzqUVu9W7RVpGXpw51WaQ/B7CdXWrHVEJDKltHmii+nVk
	Ds1EK0iAXfONxBN1jpfjS0O/assgL6FNhMSAZH6GZajscT2M7NnbnOAMJg+QjidDcZGvvNZrSCc
	PXkERWR/e/IUlVabbamxRvW0tgcHU9uIH4ps2777YV9HVeirDg==
X-Google-Smtp-Source: AGHT+IEgVzXXA7K++zDeXRdG9gymB7ci66L3akpPcMPbt52hmSJZiloLpPQ6jyZUInZAMPERyeQkww==
X-Received: by 2002:a17:907:94c7:b0:aab:daf0:3198 with SMTP id a640c23a62f3a-ab38b36bed2mr3924063166b.40.1737972985195;
        Mon, 27 Jan 2025 02:16:25 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e63187sm567191466b.54.2025.01.27.02.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:16:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 11:16:24 +0100
Message-Id: <D7CS06UAY85B.1L2QQXQ63GFZ7@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
In-Reply-To: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>

On Mon Dec 2, 2024 at 4:45 PM CET, Luca Weiss wrote:
> During an earlier commit, the comment from SM6350 was copied without
> modifying. Adjust the comment to reflect the defines.

Ping, could this trivial patch be picked up please?

Regards
Luca

>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings=
/power/qcom-rpmpd.h
> index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4=
fe21d195c919ef5 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -65,7 +65,7 @@
>  #define SM6350_MSS	4
>  #define SM6350_MX	5
> =20
> -/* SM6350 Power Domain Indexes */
> +/* SM6375 Power Domain Indexes */
>  #define SM6375_VDDCX		0
>  #define SM6375_VDDCX_AO	1
>  #define SM6375_VDDCX_VFL	2
>
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241202-rpmpd-sm6375-06582e126d7f
>
> Best regards,


