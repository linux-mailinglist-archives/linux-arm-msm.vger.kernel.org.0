Return-Path: <linux-arm-msm+bounces-79765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236A8C22658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 22:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F023AA1B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 21:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA5C273D73;
	Thu, 30 Oct 2025 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="or7uHJAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7531C84A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761859020; cv=none; b=epbjCbvs7Z6UCSb91p23POaiqXpjco59iP194RBDnSGTszzqTwyZprFCbfUoveVnkh+cIL61lCBUWRN4vCs14spgd+cwYN1DaPMo54qrglBo2AzRCntRVLoK7qJWhXsZ/hgPpzdrjrILbTVXxhx0/a81+Y0gQJ3/HgOx75SvnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761859020; c=relaxed/simple;
	bh=z6375WTq4Yvi4ovxduQFOHZwxvwgNlfEn5b74zi9Rbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ansq7RC2z4wuh1JEaGoUzh4ezMSY9nSjwG0KP87oZKzQsEaPHgkK7tSNjWT4aDIFutX40liYbbCHaj5Tqalmn7KXt3plH3gX6d6UHZaZ/6Gu27KU9258REO+C4+T8WNie8mvxvulrSQ4U9FwqcH695kZEYDOi4FmrnSV3dx0C8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=or7uHJAn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42421b1514fso980403f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761859016; x=1762463816; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6375WTq4Yvi4ovxduQFOHZwxvwgNlfEn5b74zi9Rbg=;
        b=or7uHJAne3M168VW5hkOAZiNpBMKOY/XL62YNrIOzzKli99+ZiKYNPGbBTTqHhJAcC
         h8BaAR/XjfhU0KG8oOpSV2rWvK5zON3ddOhOUG94cz6m7Nsivhma0lfflIr4zWBf9OMC
         LkmZa7csBbFQxKFaqTU+y4pz0Q/K44e4M1YycNmryoUWcT8RPV8mhIBw6E6LZz3Nklz1
         e/H1DL38CV1fDfXkd5Se7aElLvaxurMsqbRvB3KRDXdz8ibIlVDeOQQ0YCF2hZE6MUTR
         7ZO95od0DmaVP9INcPeH1fagbYP03duxKLGtFPFtpzWE4k2LsnztzQ891E7KyX/y+n82
         AgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761859016; x=1762463816;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6375WTq4Yvi4ovxduQFOHZwxvwgNlfEn5b74zi9Rbg=;
        b=MsSnHBn/NFzPxt5lzzBmLOahWtOZdje4AEreZQqG8pSmCeeD5erBm0s2TweP39+iuy
         y1mjZhL4l/E63Wv5Ur4ZBveunRPEvOsu35beJriBYhYTbYgeFr1ntTFVPGpRAjyinMR7
         bAwGFjPK8Pl/17HK9XQd73gYc0n4x/3sC0bR29LfrSCnQ/37yFmzL+tYEvcg/BDR/S1y
         nHCzO3/F/t5f83Ke2f7HqlhRLmToF8CuB4xQ0PtSaUT+dItotGIxhkClQXzJRml2df9i
         EwRWyFRr7+VATphq7kERIE5LmD/czTFQDWRK8pZY2+OT8aG/RA/2FgmPitjSekesM3Ns
         c++g==
X-Gm-Message-State: AOJu0Yx/gIiJBgn9qv6TsgLqsgXboJGas8jS5FXZHRgmZxdhuZ37qTnh
	ybA+vY+lQA3FwMWzGdcJdCO9FnPyyxlG4VBCAt4yqCaHm3kPQzOhuSsFyUzpOKQq2vnd6COYpkH
	8a70hsVQ=
X-Gm-Gg: ASbGncsYDuV35FbBtHad+Yz4+ZfB28JrFgduq5649NbL6WDYUeg7ECTIGtYjXOIOa+X
	BxdxAQlJW28soTXRDAV30FiLv2bHzLPf2XuTbHIqsw8w0aDOhU1ZtqYTlFEgg51yLtQcsC5SGiz
	8oj1aLLvNvBdcM0jDH/s7jga3dPOVeGhXRMwpIAJNvxwSLafFRGFwTb5YL8yx+UjbsYt7WVhNSr
	wjnhKv9ZIfYSztl46Sttz9u8lqfJUZacFmKuvNmMyDKjD49Tel5iy9SG4tcUwSTeTwVNj3L1ubH
	Unn3V5LtX+Os9E2TLXxPRAYyJMSIhmNTnvsm/w3NRZ3c+HWGoZ3zUZI2JhKhb8SxzG3oedXg/P7
	7I4rIyefAr1FNwT/QbrEPaXHYTT8z8QizvQaR8rnaoP/0uBOhfSbY++iCJIRYzYZeaW7c/zUyn8
	oxYXZftTFXrMAXb5K/EUExVdk+RQ==
X-Google-Smtp-Source: AGHT+IER+NlrHMyAE87dwI1tkEn0iN9IkW6YNIezVtY3mnKy8AByh4iQATc1QapWcTKE5yrO18mcDQ==
X-Received: by 2002:a5d:588e:0:b0:428:5674:7a13 with SMTP id ffacd0b85a97d-429bd6adccamr865686f8f.36.1761859016075;
        Thu, 30 Oct 2025 14:16:56 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429bf19c53csm626241f8f.34.2025.10.30.14.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 21:16:54 +0000
Message-Id: <DDVYW9DO3Y24.36V1557ZYB2XI@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: rename qcm2290 to agatti
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <20251030-rename-dts-2-v1-1-80c0b81c4d77@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-1-80c0b81c4d77@oss.qualcomm.com>

On Thu Oct 30, 2025 at 6:20 PM GMT, Dmitry Baryshkov wrote:
> QCM2290 and QRB2210 are two names for the same die, collectively known
> as 'agatti'. Follow the example of other platforms and rename QCM2290 to
> agatti.dtsi.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>


Thanks,
Alexey

