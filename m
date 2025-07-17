Return-Path: <linux-arm-msm+bounces-65374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421DDB084E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919301AA24E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3590286348;
	Thu, 17 Jul 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ekMwIdBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F282153FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 06:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752733639; cv=none; b=fh7rXIKcD7+qsoIEcqomB3rs4HG2dOWEA/y0m9xiK/+Yoty0T55Cbto2ENWfHbEEdCQbo1Lf/RKDHLFws8C51M/gdVVqQ9h4nFxev2O6e14cC5ZOIhoPzBOT4+N4gNuIHPt4wWHEYZRL5KR5abRwCdHvXtTIBdplScCMlO54ELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752733639; c=relaxed/simple;
	bh=OwXzItnnsraIcYnVt0zgQl604aTargDqKQyzSiybBRA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=uC1oOpnFAZMXjbO9PXpkBHip0C8nsr1pdtGVf7Cg2jrBUKneGVEg9AKGJ7DEfzp4VH25LIeN5id90bQKLAaxrebYMCZE0JE5bPtw24NSbcyeJ9l1Q5fDtvIQzOCn4jNIF4wA4+vca18Pvr9jXRKhkdTkdWA4KAy8nbTQ8+sH5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ekMwIdBf; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1095792a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752733634; x=1753338434; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMULLTVpVqv7dK7IgKD5UscRXMfGKKGocHzIjlBduJg=;
        b=ekMwIdBfRqT3Cl4PfmI2InsnINddZmMiV6KE4fN7/M/X5dXq81gEspq05a7L31JHOM
         izR9n5uYlOW2OGG1MZ72wNQUXmVq1HMd7ZGLpzI8vxBsha/IKPQkDadC4vU4xeUbdjnc
         a00972zikT/C2ixrBcXMBxarN6EljSjlOCs4wJuRtcr2nL0ClMRnDJ52m8iHEcvFxUyW
         DGmdaGdyDC5c3bfKMLy9SQiE3NLE62YCOhq482LNTwC33dq6IX9TGa0ThD1To607dty/
         Qk1Zow73Z3AxdSOihuHxVPi0I0IKuCmkJTlsPVs99vmGRYLiHgVhzYXAWIKQWZdwBnYG
         p8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733634; x=1753338434;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMULLTVpVqv7dK7IgKD5UscRXMfGKKGocHzIjlBduJg=;
        b=qo5UfCqzk5ETpgwSpE9F5YYV/LdiOPph9xue1dQHBSlOGoYb1lZcivtfXpNN5KA+iX
         9VFcyo10vfi55lTDuD+MhXV5e3I0R0dtFnjBEV3BPxO6lltewqdl1d8VvfRdCTdcvXJL
         kCdCH0YGN+m4MwG13u4ANzZcHsicmOhWV0KMjml97THBJLfFvsMUGhMp2xZJOTrOvwBO
         m3XGfsexNJ1Jwrw7EzkTP/jXkUTyGqC8FDH9j4h3u7EzFvbYref6WUoO+So+OMJbV493
         He7ysczH2mR5GFASlHRpj1horvu7Z18dlOt3j2JRxnCqulHgl9Ql3A8qStIRQddgXqIJ
         j9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX8s8snKEDDac6hNQ/36OvUDEebjjBYP8RCQs9gVU2nAqoMfn1J5wj2YDbyEEl1W2MjPvn3SwiWw/0PZvfr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tR/PA9Ii5ijSyQd5dpq5x1w9WMMXy6Z3hqMyW5f9JJP5IOGF
	RXA/sXHlVB4/yFTX25ekPs8ieK5U43r7y7Ipt4QNiKwnnb5B7X6x4JmYTnDaNfjzGko=
X-Gm-Gg: ASbGncsXfgas3FSc5okmjQwk6bzLMzwA54FcJ8xkg3ADVA9D563B2T0mAp7pFy62WiO
	j+drwHOPmNeq8ZszAJ89Bx8EpkGFFoxyCtIGZC7oE5IONCWChhvljjtSSTQE7223gLwqEK1JtCn
	zWicSK5qk+73YlP9fKqUl4qXQE7Vbf6T2hNcNHHhWiAnpqINZh3a0mgQ2ULQTqcHtVj0jh/vMfh
	6Rr/ZIJG22rJ2MMWUYN3w+NS1vMP54Fg/q5a2W+716aQtRDKg7S7lgDKkLfAZ4Iubg62CFWAgad
	cj+RIMbcJjRq0Ks6R+wIIsKzVDiGQZFy66WqAZ2aGpkWvWEjre9kgXTTv0Llfw2ZIKDk2Y28W0O
	uEQc7L1Y5jA2ZR6NoObSQmhXwQ/65CJqz0oy+R7vG0tnM1goqRIew5OGO
X-Google-Smtp-Source: AGHT+IF9a43om4qwgcmFxHyk8twYfyDWlHEsMHaoiDb9jvi+87ZzfY3SJkjrZxOIH7xwJwnMChdjOg==
X-Received: by 2002:a17:907:7b9d:b0:ade:9b6d:779f with SMTP id a640c23a62f3a-ae9c9b13e4dmr648808166b.32.1752733634110;
        Wed, 16 Jul 2025 23:27:14 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a16sm1295669566b.24.2025.07.16.23.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 23:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 08:27:11 +0200
Message-Id: <DBE47UNGCDLE.3AZF5XENB5BEB@fairphone.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and
 Glymur SoCs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>

On Wed Jul 16, 2025 at 6:24 PM CEST, Krzysztof Kozlowski wrote:
> Extend the schema enforcing correct SoC-block naming to cover Milos
> (compatibles already accepted by some maintainers for next release) and
> Glymur (posted on mailing lists [1]) SoCs.
>
> Link: https://lore.kernel.org/linux-devicetree/20250716152017.4070029-1-p=
ankaj.patil@oss.qualcomm.com/ [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I asked for documenting the Milos name at v2 of Milos patchset... it did
> not happen and patches are already being accepted.

Sorry about that, I seem to have missed that.

However I did not see any dt validation errors with my milos dts or
dt_binding_check on the bindings, where are these patterns relevant, in
case I should touch it again in the future?

Regards
Luca

>
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom-soc.yaml
> index a77d68dcad4e..27261039d56f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -23,7 +23,9 @@ description: |
>  select:
>    properties:
>      compatible:
> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx=
]|sm|x1[ep])[0-9]+.*$"
> +      oneOf:
> +        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd=
[amx]|sm|x1[ep])[0-9]+.*$"
> +        - pattern: "^qcom,.*(glymur|milos).*$"
>    required:
>      - compatible
> =20
> @@ -34,6 +36,7 @@ properties:
>        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
|x1[ep])[0-9]+(pro)?-.*$"
>        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> +      - pattern: "^qcom,(glymur|milos)-.*$"
> =20
>        # Legacy namings - variations of existing patterns/compatibles are=
 OK,
>        # but do not add completely new entries to these:


