Return-Path: <linux-arm-msm+bounces-85884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51CCCFFC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 595593032E61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8A33242B7;
	Fri, 19 Dec 2025 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rdkQli19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502131ED60
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149437; cv=none; b=NSmlbitLCgcAHm51scXo/ks2ipuwaCU89n5UB5js09MCwxNgCLs6KYfFfRa6YPekQsj0ixBz5S99bqWyolmNHfNC60ElzowXGMlqS8BQUI1VOS7I78HDdL16RXyUrcscJdhEFWCr/NQTVkoupyXWHHKhcbg3skVNKYjB/urdCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149437; c=relaxed/simple;
	bh=EE/IMt3bWpzuwoh4Y4VtblwKWctMNVKGBDh9u8GUYg4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qmbb7Ixx36W1okf4WLEJ3fSa2lcALeTYSOoFs+cIIEQo0C+ObRJ4000wr5djFu2A9b6qiJ3gHYBRDU96G/imLDdNkapLdX29oPsFL89b21UYFb0Z70P5cclTG3PQhJ1z3XlL0OffdcLtR7NSTadHY6T/WfdyN55xt87Zsc1hhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rdkQli19; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so301639566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766149434; x=1766754234; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xYZmg2CKda72uPjDDhOOvObRBbG4YdmNuqSLpmH/Go=;
        b=rdkQli19NK7ZEFHBRsA5+cEoaTtjs0dkJIY4AiX/DVUiiCUmYs6ErlxDUXa1ZNQPV/
         Fwj7zF+TZE3+sx6a5lBgBF+lLAkpjj+eKs42IIyJLTP4AjRzaaCGVVAg8G2w2JofOQ61
         OqOi4XmIKyot0DosmjRoIM9NvTnQ/QkiQnYjf3mM0+fMHyK/2Gr0NPpNZ1ILuzpXGclf
         4hvOGVA8nUKkH9tUXicpXtcDK3vOdZC0/epBjlorfgUOzVI6d7pJx1+pfi4GHt3XN5MR
         knAIyiWTFDad2ZGMGOvR02ssNj9LxLxU0f6uW4oBjqumk6ixccZj9TTAoqFC3zCXooV1
         c9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149434; x=1766754234;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xYZmg2CKda72uPjDDhOOvObRBbG4YdmNuqSLpmH/Go=;
        b=TtOeXM4gmo1sOeW2pwmk+H4uYemHhjszgHOYW8tJrIOOWUudO/hLyY8I5s2PTOD2nG
         yFKD1+HfObwaspQtEtrdLsO/+wrxH8WNcqd9L7TSnj/fLcP0mNNV1v7zna1WnXiGhJoE
         pM1wLwnGdUcs62pjUsMm5s/ZdtFMqIKFzvh52adoMazzoo96ECqLe4Xz1YQMR+3ntge4
         Ae/3IA23pizIijeBRGM535hJZeHpo81jVsXFfKhZon7la6rcKfvdh0htdOJMWecMYmbU
         M+3YHN/mWgBqAxZbvKIH4MyF+cRf8kiVgDYmcjfqLu2WdcuaXU63zbIlBfuLS9+uAVCg
         aW6g==
X-Forwarded-Encrypted: i=1; AJvYcCVbWuxhjwFfF0TVxWz+/37r2NZkZ5yzvL2pbmQrIM1vCOv6wfoWV1N+lmpuE2nAGR4RM8itb8LdBeFuixJP@vger.kernel.org
X-Gm-Message-State: AOJu0YxymaQ2JOFO19d4xmVVJqvENFmGbx69koh3AEe89/6XTQzEsoNK
	0+vVT6qaUji8I9D1QdPCQO5SjqchPAU7M7gLabLECB5aVsHvvexDWcCkwP4nvZn0tWQ=
X-Gm-Gg: AY/fxX4vjdMnIuy+xq7NYGFnyrHpAJPQUaYeDCfNBt/ARpqqLPC2lJ7TGK78eV0xxdY
	wDui3haepw4qxxu44T6srGdabyrZkY/ZrmICuwKU243vZs2VvFj+YDXaypg1QMBTzQDNyyjpbuk
	NXPKxwa6ddClMTubAt8CGsOScBo+bOXRPLnLhYkpJD3yMGdmtfh+yJePEVWPgKZ/H+CO9QpC6OY
	1WI8tD+6YTPcgFFfUFHbwtRztWBUxdGFH7lv8eX18ozqTzfKNIJJtM1QPnNiqhEmuq+9LohVXM+
	nDsBjo8adWEdVDZOW+jd1A2D1oq6fU0GwjUc3rpA9Sps4B1pQD3EvtBvw2Y6I9kOa4pz9OPaabp
	Mpn5TXBtDnxynKbvL7txqBdqU524QB/fa7+6Ic28cONdbXaPPhUKVpeNAB8asEfbcLK+ZnqbRlD
	L0jfGL3PVs2OKbq6SLGIDlbtG1ken7aVLzag/1n4K+P6bbTdAYqyC8/tyoS3tzOAYU57npLev0Q
	afCrYSDF/QWBViEvEPwd5xn
X-Google-Smtp-Source: AGHT+IEUfFWnQG7RAyzRaKjx7Ol55uUIMDfqgbftEXKGsTsm+LxGEOqp3Py4SFBBhTsoJjx3bbI4nA==
X-Received: by 2002:a17:907:7ea2:b0:b79:a827:4c4a with SMTP id a640c23a62f3a-b8036f1308cmr281276266b.15.1766149433565;
        Fri, 19 Dec 2025 05:03:53 -0800 (PST)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cb27sm221143266b.51.2025.12.19.05.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 14:03:52 +0100
Message-Id: <DF27Q0DG1UZG.1Q5HP9SBKYBT0@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: crypto: qcom,prng: document Milos
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>

Hi Herbert,

On Wed Dec 10, 2025 at 2:43 AM CET, Luca Weiss wrote:
> Document Milos SoC compatible for the True Random Number Generator.

Could you please pick this patch up? It's been on the lists since months
and blocking this series from landing.

Regards
Luca

>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Do=
cumentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 597441d94cf1..a9674e29144e 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,ipq5424-trng
>                - qcom,ipq9574-trng
>                - qcom,kaanapali-trng
> +              - qcom,milos-trng
>                - qcom,qcs615-trng
>                - qcom,qcs8300-trng
>                - qcom,sa8255p-trng


