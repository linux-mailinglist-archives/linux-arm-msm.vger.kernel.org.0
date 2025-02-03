Return-Path: <linux-arm-msm+bounces-46763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3985A25BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001231887C45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4572066C4;
	Mon,  3 Feb 2025 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9V84eji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAF2063CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591239; cv=none; b=WZnhEypU6ooqyRZ5gEIsEbUfmmjCYqIWXRNZLM6nWIDAVe8+9VFHaNNKBw9w6pxFOpOaA99SmH0y1lW2x4Q0JAsHNJ+OfiGUZ4NG6v7NXXpfZOKWxImJIWrIObsycDt6muTbTQIT/JvhgW4eAL9XOVIjVzVBLRevgGi+UZUyZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591239; c=relaxed/simple;
	bh=YEBc9w8PsnWAIH0OCO/5q9BJSPFXkTLscni1Aov5z9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stFEMskPr7+0aBFxenPOrXlWiZsoX1JOHYAfCa/uzoOq/Q7XDotYSEfipzOkYmTw0iY+5RH1hDI+FzukStqTWU7ZShH8RXYEau1eJ6VJ53UKeybvACu7u3Rkdof3horDbaHJRc/oACXyl2vzV1onCdgV4YGUM9NeIhVZ+vUS2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9V84eji; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f6ca9a3425so27644607b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591236; x=1739196036; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3ZAg9pl88KjIvs5mS1f1EZymy0dyDgkN4GT1M3eKZY=;
        b=V9V84eji9P0HdcWV65pg2VDRgL/ECXM/J3o0xCoJb+98/pWGKI8rmPrjBzlqhwNVlV
         m+IQRGRUBT2/BKK1IblkVojJGo3u2oLoucIEhnsY2uGRQBiR30eqHJwDLJDkO5H69TEc
         RFWAn91/KBOM1pDeu0tFpS8lCIPKFkxM6oOnxVGWD79uKuRYi3xbXaDo6wHfB2eie/sE
         v8EGbHywSl9nVjIBs5RLqX2HrRvhYjSKkkX6ziKpviwCf1QZnsDjKOOy2F3tvGyrUSxd
         maGkyCQqhdqXRzP1uiyWUJSkuTB5GFbwxmw0aXIZ1u4uMRsSWIp1TrhVLsVZsqvf2Q5w
         Pz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591236; x=1739196036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3ZAg9pl88KjIvs5mS1f1EZymy0dyDgkN4GT1M3eKZY=;
        b=U+uXWEGhSFD53KwsEK3t16RlwZTQgTCeko0qKruENChg5Z1aXTkk37cd4kjVThm4Rj
         ipk09rBpZ5bvXcqakOaSVby5VHbpMc6RX7S67qdDlGgpfAidTrZAd4Xi7sE1dxUQ6meG
         oXKIHdymb6J614UBQDDkQwFa2XZWcfQ7OTcG+ie/IJoDgU5hkdMowhKFWIFxa88p+eIV
         3rs0XqkXd06aB7Q2Rd8yMLP86CwFazq6JNL9Gw1O4lIMlS8ujEg59lf+ScGrubop0n6r
         pnCUFaV/bKkDOWsqR2xMscpLbR4qjk01jVpfgmlxwRI/AMDcTc0vWOoxXEHw8YV1fYPj
         VKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZk+xjgb0QAtdNsVR+8yxCilGvwAnsitq+iVjwFTwmITfOGbQVfTiabjEsCphTGgq8al9LWrwTXz+7223I@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+wAsYB2KZXiDo/4OsZp6h9+jLOjeFw82nFDUup5WpJPn3aiQ
	01ovTtzUDTMzR3m8XHZ/eeuMeIgX8uRpSct3HjMeO1CNE+WvV7PWig/bS7ECMgj7Acu7rjK6y8W
	qTBEchluYSwhZow+7MGVX9i7qGbsao3CRcKuwJw==
X-Gm-Gg: ASbGncv7x1vvQelPX7SdiGdMY3qo8k+nEnQOAU+Um5W5VN0RGN4b9K1QUb9UOzUAw2s
	2NvSUIbfK2nlb3mfLMqj1zHK2lLe++f/kiLQlCMBXyyhLkrwosvpyxWHTtcIh0dvzk8c+XA==
X-Google-Smtp-Source: AGHT+IHuL252vql+MeLPa1il2bPxNj6ynbBWo3mzurFA8SbfqbWEn52CWFCkQZHR2nMMtJaAFqXqFRxN0N0x3eiX1YU=
X-Received: by 2002:a05:690c:6486:b0:6f6:c8fc:61b1 with SMTP id
 00721157ae682-6f7a83fe138mr161266737b3.28.1738591234763; Mon, 03 Feb 2025
 06:00:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org> <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
 <d5e1e6ae-b773-4ec8-a66b-2e1830827164@oss.qualcomm.com>
In-Reply-To: <d5e1e6ae-b773-4ec8-a66b-2e1830827164@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Feb 2025 16:00:26 +0200
X-Gm-Features: AWEUYZmz1ECIXn-mrFsqggOTDVeuYLmbYaHev8MsZuEQbvNP_yfferj5PUkoYTw
Message-ID: <CAA8EJppMVzuRLLakNJd4M9MRbW5P-0x=rTf1p9kj0zj88SOOGA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 15:50, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> > While adding interconnect support for the QCM2290 platform some of them
> > got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
> > interconnect. Turn that into SLAVE_QUP_0 as expected.
> >
> > Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
> > Reported-by: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f0746123e594d5ce5cc314c956eaca11556a9211..6e3e57dd02612f3568f07f1e198028413f463c69 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1073,7 +1073,7 @@ spi0: spi@4a80000 {
> >                               interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
> >                                                &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> >                                               <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> > -                                              &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
> > +                                              &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
>
> Still incorrect, this should be &qup_virt SLAVE_QUP_CORE_0

Hmm, why? qup_virt has its own path. I think this one (using CNOC)
matches the usage on other platforms.

>
> Konrad



-- 
With best wishes
Dmitry

