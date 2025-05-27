Return-Path: <linux-arm-msm+bounces-59564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34CAC50AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 16:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A3CA16257B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A6927602E;
	Tue, 27 May 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWoXrTj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1EA274FCE
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355452; cv=none; b=JEVmrZz7ojj7sBHoEeN06NbDz52yQqsKnHVHbRUnNuG2YfEwLxYxQ46dxVueQ5FPBBoRqYrjjd11Ai12RDhT58u2aUnbDjxokTaZuCa/bdhOxLIoKs5BpmDGV4mDTs5OwR9oTyRrPR9JDoejRVh3JMpXt0kcl2ywtLUv2oRSPe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355452; c=relaxed/simple;
	bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=S0NbBnYZ9+qJe80pBAphp/lLjk9/QL0m+yG2gFVGq5OFbO5eFMcNmG5npnC+pX/Abo3EbEwNBB9ZKTNUzxZeT7IEc/iBpd/5VELKtcHRdO5hPIw+aD89ndJ1NSF69JuUWHrMOlGt5I0qwNvGuP9Q5bitRfyNFnmgWe2C75ZpFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWoXrTj5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-440685d6afcso42767105e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355449; x=1748960249; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=PWoXrTj5c0wrG0Y6Jv8+00M6uhEEK7DhE36StAOFiZjUSCyW/eWIQn12d7nMnaZ138
         DiAd7KJDg49x7dkOkeK3TDjE5S4gGSLFpioteWAyQnw7gnsmHHPxo4WC4COBWM4mFQzc
         oX8nTtYncuXaiCNKex3BZGNMPbsIBp+jmAi8LbUkq8fZY3x1S+snE+zBQ246zwrrg1+l
         d7eOPRCNZNTfK+EiySop4Hb15WQriDh9wHVIKrqV7LzmYFKaTEAmkj23Pan4sDkQ6eDs
         YeRUFCn/B/n7Add3qeNupatooyaoDQd8mDu6AmkpQ06yqy+YgL9PNSzf+CuNMMC8tejx
         4Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355449; x=1748960249;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=lhz3/3xKhffHuYw7hFSr4PnWAkjO7SzHEhWjfhbx2Z4DlLBp4sxOSmHWHkmuUGb/Th
         bQjndjOFY8kcyEfjRKUAA3WZvFVAHnVvJ9FEFqDSZG5bYnoPQt+ee84clJ//sYXQbCKk
         VFE0p7eER3V+7ZimCkrMSbG5Cia2PQY0K7Y1U6zydwklr4LjOuvTFEBm4ps9d6kOfnYA
         muzFZQr7DpqQ/bnY15nI7sDqWYWrMi6AG5alx4xdAnGMM1Au5P7hRQExcsOiWdSd7fwl
         bj+z8c3rQ56v6bRdZZqQ8+hc6KdNyRB9ac0kZZXSdlT+GkzR15Id7P7tE8ohjLusBpp8
         /eaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmrxf2BIwR6X+x5ErIgWJ0nGqygXUp32lQVKhtmiGRBgaRq1eVa/JJml90juapDg3MV5bK3jUBglxv8I+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEljIAo+mct2SY2kJTXesk9qNuq9DKIoBzb4kDDfBVs6knrEs
	Lk9VO5Y/f3VJbU0odhjRJqVyNh33vrj+mDdd4REMHU7jeexuAY7jrYOwjpRyGfFOkg4=
X-Gm-Gg: ASbGncu7YnIpToscQmgwjwR7AFtdzWd3LpsBuGd/LOgugxju9TkscSlZYh0ufjjyzo0
	8/ORTjq2fo0J3yAWSWl01X4B6PuQpyJrt3Q82mkeLe/xT1q2gNOzIDbBeAaaQWcjW/vMlEhkveb
	GpBwdSR/r0FqpqJVv8Duycvn4wT8SAcEBeQjSXrUs/NrN7Mbymiz0Dk9NLu8Pc7Y667jHEy2P+v
	vMHyJwnFdXxKSDQ90QEbQkMgTxppexngOemS4yZ8okZg/mklGyiANeILyJRuSvMJVtA9LU/y4wA
	atECzSKHggYbZaaFdRrMDYfaAUPByFxkYRzFMjSiU3sSVdJuJVVrqI+gCA==
X-Google-Smtp-Source: AGHT+IEhc9SSryCY2JDYzu6BuvIZwbGB1eIwIJMculZ/SWsJAs6OkosbQI944ev/3eMu/PMW8z+Bgg==
X-Received: by 2002:a05:600c:5103:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-44c955da49fmr100008385e9.22.1748355448879;
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99absm266645615e9.37.2025.05.27.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 15:17:27 +0100
Message-Id: <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>

On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp board=
s.
> The updates include adding the necessary audio device tree support and th=
e required
> dependencies.

Do you have topology file and mixers commands (or UCM profile) to test this=
?

I already asked but I don't see any replies. How this can be tested?

Thanks,
Alexey

