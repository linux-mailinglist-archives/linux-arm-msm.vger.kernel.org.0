Return-Path: <linux-arm-msm+bounces-79304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 028C0C172E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45ED135601F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E7630171D;
	Tue, 28 Oct 2025 22:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="Waz7b385"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005F2DCC1A;
	Tue, 28 Oct 2025 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761690092; cv=none; b=gmaqQc7vyl1WbqjGn8BhT5PIZa11saD+EnKKyOu4780nnKpppmul2ei1oi8XyVyzT7iQ7HH8Ocub5+E/8UXjPJc6tDqk7Nrtt6dk8ST1SVFzJzSNqgqNDZE+re1OdQdWo6Kj9cDrCoVmDoLBhSEJyL++iZsPinXdzOzhaV4o9R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761690092; c=relaxed/simple;
	bh=kOQwnveLNESBS5XSfIiu7xbSkWevnLBvX3n3tyH2iZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpgX97fvdwPQrRSunRxlFNwelxOKGiSSFcyjy0C8qVGmigKLTn8zNMN+lebwBl9hG7PFntXNg4VGUrY4V3hIb3ST95INQY0RszyRCtjA2yFYKgGx9OchV9XRRMemTCrDgt3i4nyaYQ8FIxIn8IfoQAg+4I5E4LDIhUGzOjTBjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=Waz7b385; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id C7D3A5340881;
	Tue, 28 Oct 2025 23:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1761690079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=77Bg3T01vRKpoGhywDO/WQjALV4dBQVM+8I2GzO3egM=;
	b=Waz7b385sQKp4FxSXBNqOjc3Oqk8Aoq7Rj4WZnjnhUZ9+oKjbMS5FYKEvbnFkd5Lt49k0b
	X9DJ+5Unw/iPxwxBMFA6QgZSCgIFVwtUq+OzftjsywvChyM/VUKJSZ5ddkFi/f1vL+XqoZ
	JhjasCS9giPlBIYb7RFobRB56Xa8oB0=
Message-ID: <f6a6b24c-e41b-4da1-96a6-cd9102eacbe7@ixit.cz>
Date: Tue, 28 Oct 2025 23:21:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 21:59, Dmitry Baryshkov wrote:
> Historically all devices manually defined GPU zap-shader node in their
> board DT files. This practice is frowned upon. Add the zap-shader node
> on all platforms, define a label for it and use the label in order to
> patch the node with the firmware name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (7):
>        arm64: dts: qcom: sdm670: create common zap-shader node
>        arm64: dts: qcom: sdm845: create common zap-shader node
>        arm64: dts: qcom: sc8180x: create common zap-shader node
>        arm64: dts: qcom: sc8280xp: create common zap-shader node
>        arm64: dts: qcom: sm8250: drop duplicate memory-region defs
>        arm64: dts: qcom: sc7180: add gpu_zap_shader label
>        arm64: dts: qcom: add gpu_zap_shader label

Reviewed-by: David Heidelberg <david@ixit.cz>

> 
>   arch/arm64/boot/dts/qcom/apq8096-db820c.dts                |  6 +++---
>   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts              |  6 +++---
>   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts             |  6 +++---
>   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts         |  6 ++----
>   arch/arm64/boot/dts/qcom/msm8996.dtsi                      |  2 +-
>   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts     |  6 ++----
>   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts     |  6 ++----
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi                      |  2 +-
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  6 +++---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  6 +++---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  7 +++----
>   arch/arm64/boot/dts/qcom/sa8295p-adp.dts                   | 14 +++-----------
>   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts           |  9 ++++-----
>   arch/arm64/boot/dts/qcom/sc7180-el2.dtso                   |  6 ++----
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts                    |  1 +
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               |  1 +
>   arch/arm64/boot/dts/qcom/sc7180.dtsi                       |  4 ++++
>   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8180x-primus.dts                |  9 +++++----
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi                      |  9 +++++++++
>   arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso                 |  6 ++----
>   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 12 +++---------
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     |  9 +++++++++
>   arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts           |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm670.dtsi                       |  4 ++++
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts                 |  8 ++++----
>   arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi             |  4 ----
>   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts              |  6 ++----
>   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts               |  6 ++----
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts                    |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi        |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts    |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts          |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi      |  7 +++----
>   .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi      |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts         |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm845.dtsi                       |  4 ++++
>   arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts |  7 +++----
>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       |  9 ++++-----
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  6 +++---
>   arch/arm64/boot/dts/qcom/sm6115.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts          |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8150.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm8250-mtp.dts                    |  7 +++----
>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  7 +++----
>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts            |  7 +++----
>   arch/arm64/boot/dts/qcom/sm8250.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts                    |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                       |  2 +-
>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               |  6 +++---
>   .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi |  6 +++---
>   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    |  6 +++---
>   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      |  6 +++---
>   .../boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts      |  6 ++----
>   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   |  6 +++---
>   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   |  8 ++++----
>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  |  6 +++---
>   70 files changed, 198 insertions(+), 244 deletions(-)
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-dt-zap-shader-df7c258f6ffc
> 
> Best regards,

-- 
David Heidelberg


