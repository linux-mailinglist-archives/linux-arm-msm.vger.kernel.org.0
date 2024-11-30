Return-Path: <linux-arm-msm+bounces-39694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95B9DEF8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 10:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC6BB21B61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 09:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946261537AA;
	Sat, 30 Nov 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fyfeh4vG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD5149DFF
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732959043; cv=none; b=mkJ7BfneZyoksdv4ba+QnLOI9+tJFmK88M51DYxm9ZEp2a1DEIXVMw6UmL0IZMy7TKqxM4SXFREHyezrruEGRKtGulxAzw1LNcBm0I/uJv2aUQ8BIVPZ063+sDzwTz4FRZ2uRSZksm6iKhTIp61E73jkcCcBj8iVP/YjxYv0OMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732959043; c=relaxed/simple;
	bh=GGcoDVrrmGOBOnQrOwTBqmoytJ87VR6L+NmhjB4EZaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yzhzf+/qTNK4SMpHm/iucB99xj6pe6cRltObnwNdRopfeMNrD1VygcGgsP/35HfWzVNr+othrLytfCOetthG6hGn2qN5DIougFJCPT1gXu9DGXR2eHlTxt3UwDjdKfa5o+BpbuAYRhDoeqWvVi68jWc7JR99qwTHRvJbk1YJgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fyfeh4vG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434975a1fb1so2226345e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732959040; x=1733563840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=egJfWDkT0UXr8umOBNy5NUnLgDDOV4+vBIoPAkgzGag=;
        b=Fyfeh4vGwx5GtOjPqPeJUj8OHhlzL/vX+rEJjMdJIputrdCBmiMwlaMI56WMX7BYce
         pwU4ecWr8c5ZfpuDEm5U4kd8hA2shugRxJtk4fHJysoY3uE28Kkrn09gJHTkOdX79rW4
         EnJGvcdqF55ta2PTg9NIxqzdL/QQTfhWLRFxJMyhef9uESXHi8Av2LeQ2rH4Cdvq/zBH
         s+soUQ8PZf2rFrGEl1XswA6CrRdfR3IVQwbbIhfYuy8hBdfomvo/LDEQjwuEgYCkHCee
         i1zWRpBm/nb1icRGeLT7wRPOtBrpXlqdJcozJTnJgaDrJQiOvwMJoEFBEM3OP+8qFsTw
         7UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732959040; x=1733563840;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egJfWDkT0UXr8umOBNy5NUnLgDDOV4+vBIoPAkgzGag=;
        b=W53fW9A54nsspgqxSgyftojk9CR+o9x9iBn76XAYFry+c/rHAo+1Pd6CKJozdSIL/9
         C3fEhbVDcYKTSImbv0DiP5caXIXYXbt5DnAEsTfeAjTa+jjYYvf7/IR7errNRpMnHdAf
         sAJARBSu6vtlgjHw0L1iOmZdOF8pc+9LEsotdxhgwc+oOcp16uNcX0nL5VySRtS1v6jD
         UrYi6kXUyey8/nRG9S5LPI2WQYp2cmNl4w7hgKL19rVUK4KWlJsCnQskZdHCrVU4kvWq
         aChu7gZ2VPhb+uKn0dwRjx5sjJiUjfzTieqz2iuoZmrC4UKJozBbzOeprDamOlJWvnZP
         WY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWbcbSUhMtBoBSPh6aVed9P5oaT+zpTOUebjdCY81fcvwkVklghTtNytF2aWTxIY9X2HygTBSUFCEIDAklN@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9bjBIFHTpt/FeCz4/1JDE4e7IEqKafOg2HhALQLxX0MxYqGy
	EG1pcCOvqSBYzV7dVRTMMtrckBM74RbHKxk9qRq5evNRMlurP85oXFmC5Z0/nug=
X-Gm-Gg: ASbGncvbnM9JPWp51mRJ3D6qISY6VmrIif3XX51GTn9dCbDBag+JF59EgHLl4lsEE9Z
	M4Vwx1oy0HanWMGWvJmlfyUOpvDw8YIemgymoFETkOQrrRlYhngQ3XAPxIG39E6InV+iLL6jApU
	q0tv7okHPkLA/fASZgn5X3LIcCcsaB/TnfNjqhD5//nSIAAQZImNPsqTX1ckf++Otl2P8L9Oo7a
	3QdzvX4aXsmDCxJIr/LfjJjHwRrBOcBGHg4a3vcgpXQRH82M/BmP8/r/kEUCWdzFcm7
X-Google-Smtp-Source: AGHT+IGwNjrM0vQw5VkFK+wbUfZhDnw6nn6RQU2j3oePjtfzmU/sGlZmymLiRAU98jS0/WX/cRGeCA==
X-Received: by 2002:a05:6000:2a4:b0:382:4b80:abb1 with SMTP id ffacd0b85a97d-385c6edb20dmr5193412f8f.10.1732959040326;
        Sat, 30 Nov 2024 01:30:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385df15e1e7sm3911397f8f.40.2024.11.30.01.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 01:30:38 -0800 (PST)
Message-ID: <8fbfe9e8-c7cb-4cf5-b851-75dd37f43ef5@linaro.org>
Date: Sat, 30 Nov 2024 10:30:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/31] arm64: dts: qcom: sc8280xp: move board clocks to
 sc8280xp.dtsi file
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>,
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>,
 =?UTF-8?Q?Bastian_K=C3=B6cher?= <git@kchr.de>,
 Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Fenglin Wu <quic_fenglinw@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>,
 James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-25-b9a35858657e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241130-fix-board-clocks-v2-25-b9a35858657e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/11/2024 02:44, Dmitry Baryshkov wrote:
> SC8280XP, SA8540P and SA8295P have main XO clock definition split
> between the SoC dtsi file and the board file.
> This is not optimal, as the clocks are a part of the SoC + PMICs design.
> Frequencies are common for the whole set of devices using the same SoC.
> Remove the split and move frequencies to the SoC DTSI file.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

