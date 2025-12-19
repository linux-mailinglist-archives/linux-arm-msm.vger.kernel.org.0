Return-Path: <linux-arm-msm+bounces-85882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60670CCFF1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7196F30323FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75DD324B1F;
	Fri, 19 Dec 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Nxw1pCJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AF321F27
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149266; cv=none; b=YHvCSVL2M+jTAxMi72IX5/w6z9Jsb7PTCS83/zk2FufIhKa1Ff633ELlJ8jdTx838MoSZ58Su0fqTkQZIbnKsb8kn0ULm7LRLF9pL5zroqToH8aTdhiFWCNLYyn+AYFwsi9EpU0PGwYDbkoliRnBeN1gDIAmfZaKhCsWAw9S1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149266; c=relaxed/simple;
	bh=OMj7xeqwJMwjOl9SBTbfE9Y8LYVng9ddlrSM4o/HdWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ccFWD+M50fgQMRQpOntE7gkBvbWXkIEyXH1jamF0ugvH8Pues83T9Q/30mgeyEyncePY8R+TsluzOwIJy0/cipXw9++mHk+FhMA5BJSsnHDli3HaqumaIwzYTra7uFLCOguNBXezjsvix8KJYqcE4KFz0n4tc1MRrjl8rwEqGMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Nxw1pCJe; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b727f452fffso456543166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766149258; x=1766754058; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH9a092t0vWzb6LlKTi2ntIznrIkgJiQ0lVDXHwlCgM=;
        b=Nxw1pCJeW6oYa0o7jXMT8/6bl0Qhufe/V6WkUqMzXlQARU542McV65Oi/jPSqlsZn/
         1GLdq0p/m3WxvDD27Z0cwi61SyEJ8ka7YygzMCSArhE+byrxS8Hr8HnQc+mFNmbWRhh/
         ZewHkSu1CVwenStJijMPshEsPoHM5V38SiDf9YLrQ4DMYZGTURGhWO5HZibBeZLdl2Tf
         H7WM76XqfwudX4lwdNHmTLSmc98SAmLrhTuJZUtEPCx04ER10yFEww5SUJ1pz8sbXLMC
         nMhYEuF9q32CvQYex+TBIFv+YYIcSczWUJet0EPT/rwbpBo1SnPYWfpEOISQpAJPq9RM
         iLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149258; x=1766754058;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH9a092t0vWzb6LlKTi2ntIznrIkgJiQ0lVDXHwlCgM=;
        b=GZpPlgNf+sXZtTEw16ttTDLWudKUPfoXQ1INbpgiYYQgVOnQ0CvFizmyGl7Nc4r7iv
         4Zgg5Ikwum5Zvm8KsLXcLV6YjsxdPDHXgif3kx1EkTNrPFv1ra1E5STnHMU8Cm3cKUta
         SirEEv6tgPJKf7v6FTRjAH3Qs4FVkRZ4dLyA6Hjo+y/zXJ7QR4P/PiYY+Ko8w2Lsyi4Z
         nVbFxmI5IROWBnQQe5czYkrdsmaFDzhgcY4Q0Z6R+vc/kWrCm4+WNMse1UdMNpP0iwgr
         6zLa7dtEdCVw9oj4OtAVEE54wF3mbaBoBhc0WIGToivLZJ+qmWwx/pQz1ZqHTmD9AN47
         hBDg==
X-Forwarded-Encrypted: i=1; AJvYcCWgQpEYwialNiMJyUf4pqh+zQYu/R1I/tJ54vHK6/KIzaixMGKAL1t18cwtbCTkNyf7sVBIZFbgWo1VVoct@vger.kernel.org
X-Gm-Message-State: AOJu0YxDc8KoJJ0/Ck6vKD7hKvr1bAqL0TBRCy/9cqC+aUZ/OqTNJetM
	yBFZr1g1fvhpcPjH3xN/zfhYFt99O6NTHrVneG5r/fKamcMKmes/kvgCAfdYQ2hZtOE=
X-Gm-Gg: AY/fxX7yl8LxmuXkdSHCY3rcbePBZBOrdB/ZZtUA8jCB8jNdFHTD3l17h1Mc7sM3WUI
	0YsEy7uH+CSV+850cAcIGzBbdX8jyygn90jfYyzu3IFvJlbyByqaY5rD275cmBMQFRbLcjViPny
	sh5BCfXe6WGnflPS6l442LJH2ev2wm9HebdYc844ysT1MwbctvkbCbrN8jv96hYNwO7hTfibDXa
	ygeaYQzxs9EK38OErTJ2NkGGJhiSQb/OOc7fk5TwiZCd1WzY4RvApb1kHWkKxXT3J88ePWuF5LD
	qCVpz7ocYI3q8qrtxySkPi8fCsROkGY01O4NRPUTAppKJTjAVUq84ELPo9Dy2Runwc2hoqhb8fv
	Sa3sm0RVKx2Bk39t5qxkw02vJzy5F7j6wKBVB/IGtrNUkGHOoKFfa/9yMOwATyQU2DQ9W76suFq
	h2oLQOCax89/iiA3iUqTTT8rHL80A0gl7z0uH+U01NOpsao6jUFvaohz+nO3oYhSQOLlrlG9baW
	WuMi+trhJy5JCgCLabZMnCs
X-Google-Smtp-Source: AGHT+IHLGt3dLozOmdXSlTcHVXCnuuxt1U6E7k8MjKzoQF2b3nEBMoU2ft3Yv3cwbA/6YNKG+iAu0A==
X-Received: by 2002:a17:907:fdc1:b0:b7d:266a:772c with SMTP id a640c23a62f3a-b803574c34fmr311215066b.21.1766149258484;
        Fri, 19 Dec 2025 05:00:58 -0800 (PST)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de11e5sm223530866b.39.2025.12.19.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 14:00:57 +0100
Message-Id: <DF27NRY60F8J.19D014VO387TN@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
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
 <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>

Hi Rob,

On Wed Dec 10, 2025 at 2:43 AM CET, Luca Weiss wrote:
> Document the Power Domain Controller on the Milos SoC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Looking at other commits in qcom,pdc.yaml, you're the person who usually
picks up these patches.

Could you please pick this patch up, it has been on the lists since
months, blocking the arm64 dts from going in.

Regards
Luca

> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.=
yaml
> index 38d0c2d57dd6..0c80bf79c162 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yam=
l
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yam=
l
> @@ -27,6 +27,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-pdc
> +          - qcom,milos-pdc
>            - qcom,qcs615-pdc
>            - qcom,qcs8300-pdc
>            - qcom,qdu1000-pdc


