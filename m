Return-Path: <linux-arm-msm+bounces-44346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B2A058C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397591652A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 10:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8D91F8900;
	Wed,  8 Jan 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMBh2FSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C87A1F8685
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333658; cv=none; b=VxA1GQbk5jZmKaGMkdvPWQzmF9td7PXhnnWkZV6iD/UA6dPP9EaEVNwjdVpaCKGnAqY9GOdODY6/EeMrgR3Uqz8CHhaqR40BaIPYMrGmrW41ordyYjgkGdFG0ITWT32E25bBOio54D8KmmnhtdYhEp9Dz98Mze/G1du8LPW7jjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333658; c=relaxed/simple;
	bh=xfPbO4siHbepFuqT00coFy2gx+RHsJcexQO02LcOy0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVgl2SgxprfxhPFZKO9/UzFqyTRyD+fDKqQXBMX0CuFIxsclbvAVP+cLL4rGJaqwqCetNJ36Rq8y8bh6oVLL9cf74uUJBEcapJIod8xfIdicxLF69ATcx/UHlrgsyT+RuBVH9jzmsgL5UGQTJiILWkQxCA68NQ9117S+EzoOgUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMBh2FSw; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e54bd61e793so5307339276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 02:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736333655; x=1736938455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLNt/fipL8txqhoiZlT5cpcY9NIeIicmN6z7rLLh9ww=;
        b=rMBh2FSwoFqCPnKV6K0hdeVk8x5W95WML1ArvakgueDpNa6eEhfJlaJSwIopOQX5vh
         zSLtQkmBC7/BS+PkOD0CiD5c6LrAnJlmQwimp5BsxtJG89vWxSE9mG8fcSgnmjDwKzTj
         rFdEcfYH6f4ueWbQU3F18SyIHq6oiAc24+eZpG1ZxBRqilRjOUjqBBOhzsA1XJK5YHBz
         4I2vn+18Z6HGCP/mZx+6ApoiYOsf4JC91wfNjxpzPj8S6SBTPlLcryX+zBvVoEqyai23
         oEdrobiXjFxHb9dZoaEEQuUlC2nS6VJDUZu2jucC+52NJPDxPaLzXkNnXAWqqCLBPjWQ
         FJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333655; x=1736938455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLNt/fipL8txqhoiZlT5cpcY9NIeIicmN6z7rLLh9ww=;
        b=RRJz1eLPZjTb8Xw9MLdDnADHPOhvO1vNLTobGp1tIRD09FfCzC+tkOH3QN+X3Fa3Gk
         Yn7DNBZKKLMD8PIk3GwToIFS/tvOhSYYewsFKcGXmZPip7aove/+l5kAKLq5U2BSNzRB
         wwYy8V9XFbnvKs+fUK6nGPEGVp3pdQpqB3/yE25exN64IN0/TIwGUNYmfgUaKv4XlumJ
         yEQ9KNz+Ra/KrTSqzRNJFOdQPvAhLQwQko4QKU4xu8y+w4YtmnTwQ6XNnmOwuL4pbXtR
         g4B54iIn7qAafQ3zk6sXUHHku2ZDPw72MyeSrK6BPDtcSkCj9+5mn6BZ8n+m6Oi19X7e
         5Bng==
X-Forwarded-Encrypted: i=1; AJvYcCVLmIoxr36tl78UsHHG+0ZXjc6dLQ/KxMi0jqKTmW5TGxDWheigw9cHmoHQSf9/kM7ugdYodj3ZpsC2ir+G@vger.kernel.org
X-Gm-Message-State: AOJu0YzYzrzhBwohl9NfFQQX4V+4nfo+t0blTCWc2mGpydlOfXOFkgih
	wGF5IoZ3+UoH28sxwFvtcLKBkSPIzmZvpzbwLDMu2gejAsV1XY6k6Bh4B0UZu13fGSdzTsbZS8v
	BjnXJnUx/4t0HQzR1NyW3Ew3ZJCwcfODfOkL2cg==
X-Gm-Gg: ASbGncvqA5AA2KPRR47YFMX6azJHjgHKEBiCFiD54Bw9sLinEtS3eyLVGwajbz2TCQ/
	dwP401gzqPNQyQYI0h+bEwzzE1iPOXwDIHN9Zw4XNHO84SZFIrXcLfotqCaxkYMu2UEK/wQ==
X-Google-Smtp-Source: AGHT+IFLLOC7LQVGKj7Xv8yhMwD+/uQH+vteYYlRekt55USR33yr0LXCfhenra8iPQKn5Nehn+wsSVxFmy74JrlwB4U=
X-Received: by 2002:a05:690c:3612:b0:6ef:8451:dd99 with SMTP id
 00721157ae682-6f53124b4dcmr19388017b3.24.1736333655229; Wed, 08 Jan 2025
 02:54:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com> <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
 <3e64b792-bfca-4b07-a13e-6deb966f3d4f@quicinc.com>
In-Reply-To: <3e64b792-bfca-4b07-a13e-6deb966f3d4f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Jan 2025 12:54:04 +0200
X-Gm-Features: AbW1kva4gmKTCpDvcHQN2ENBM5bwKXSzh8i4nE2so3UExC72BAqV63-em6-eMpc
Message-ID: <CAA8EJprxYeNGvr7zed8eRcxDFczxM_TMdJ51GK+cHshhj4C1-g@mail.gmail.com>
Subject: Re: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jan 2025 at 14:52, Gokul Sriram P <quic_gokulsri@quicinc.com> wrote:
>
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    remoteproc@d100000 {
> +      compatible = "qcom,ipq5332-wcss-sec-pil";
> +      reg = <0xd100000 0x4040>;
> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
>
> Nit: .mbn
>
> Hi Dmitry,

Please fix your email client to never ever send HTML emails if you are
participating in discussions on the public mailing lists. For example,
quotation level is incorrect.

> Its .mdt format only in our case.

NAK, please work with Kalle to pil-squash the remoteproc firmware.

-- 
With best wishes
Dmitry

