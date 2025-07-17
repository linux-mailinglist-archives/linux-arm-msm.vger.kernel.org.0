Return-Path: <linux-arm-msm+bounces-65360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87AB083F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B7EA47D27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C2D220F2B;
	Thu, 17 Jul 2025 04:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avoZKtDB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE0202F70;
	Thu, 17 Jul 2025 04:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726694; cv=none; b=aye/Ig2eNkozpnYLvctitxJHwr/zIAQ03iK/6jZbupm2kdLjgM1VwT0SPDbywjvf+MZEaTup7mYbhmsNkCGivgGnm6fp0k+t4ZgItGr08AMlP1mov98r+jcisXtH1lokj0HtQANda03pgLwYglsJu1/qWcCoAQYnVLjrVlIUbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726694; c=relaxed/simple;
	bh=pIYH0KO1l0XN0H//I8Ogw8n4JPiT1JUXM0jP0Wxrr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TnXsOtQl0ayJuRaMuA4Mq/QQRFlkf4gaOH50TZFG3EwvsWZLmb0x+xG1+j87ZMKEUyatw7TuQpfIVUgsk/QqnFp9M57DEsqnpQA8lExflH8LKiSdcfzHbDS/8sTv/CkyO+EgDin3B1KH71SVBY9Gn53wNoiCurK9i9k8Cmgu69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avoZKtDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA93FC4CEE3;
	Thu, 17 Jul 2025 04:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726694;
	bh=pIYH0KO1l0XN0H//I8Ogw8n4JPiT1JUXM0jP0Wxrr5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avoZKtDBTTOQPkLgZP+ACnVzLFKdHPB26tlizxGveUmmSAtp3Nu+vk4mA1sTIdT7S
	 EpO3oXpfL4Pu5vBJj5L+Uzjee/0WZW49PYAaPOA5ufPYbXo7cYCsCcVCU7Y24Xu9X0
	 i/7ds+rsLSBi7pY6FdIKjSDwHEGzhhG4z9b2/mu5bqNydJ/BAahVBnqiRk7lg1Etxm
	 fZmdnSeK7IYG0qS3ctWWBB69M0G0VvQwieHBL4zj1XPffm3/ikVikR6XooxP67lrwi
	 i4Vch7qkju6ZmpUzggQusnsBfBEXdFh5GPTkw0n7pS45Wc48DBYFKyHQQo5gEvA3R3
	 XC1pZMUP3VLqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Felipe Balbi <balbi@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4 smartphone
Date: Wed, 16 Jul 2025 23:31:06 -0500
Message-ID: <175272667125.130869.1491563405757140609.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 May 2025 08:48:46 +0200, Luca Weiss wrote:
> Since the series for the USB sound offloading driver was finally merged,
> we can add the sm6350 dts and enable it on Fairphone 4.
> 
> A few devicetree binding bits have also been missing in that series, so
> there's some extra patches for the basics in this series.
> 
> Depends on:
> - For qcom,sm8250.yaml & sm8250.c:
>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com/T/
> - For dts:
>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com/
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
      commit: 30237c2bfda59e3abd7f7e92879e75bc730edfd8
[5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload support
      commit: ddcc0ad9a9b8488d3ee0b4ca6fd9b092c462491f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

