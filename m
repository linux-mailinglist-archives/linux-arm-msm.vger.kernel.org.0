Return-Path: <linux-arm-msm+bounces-25276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFC9275D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 14:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37012B21A94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB72E1AC23E;
	Thu,  4 Jul 2024 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FPG1Gpwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AD1A072E;
	Thu,  4 Jul 2024 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720095681; cv=none; b=IwDEtEySvX7tbnsBiPisyjsg5DZ2KUVH8MYnZh95VaVYLHNmCPmO0NQ7AzV4Jxfn18cx5eL+RudUI6BuqoPB3ehHyjnfHIF0jeZv6dMC32eMtPSmIlFI5w1Lg+UBfeIijPJ+uk/SxJqoY+pzxNRR2xksT1XjhhIFrHxd4sPeQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720095681; c=relaxed/simple;
	bh=HxsvT81qKePcMxn8Vt6TAWWT85euwfj751GojjeLcOo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=SlnN6s4cfnkq7ik/1nNc2/z2kUesyjbfYiQQFkvLGsQ0w6goG0MB/wNaf6Awxf1TJOsosvJ9iyIF3kr8Wfu3HCkfAXpwfT81j8ddBiWgQGTk/EGLWu9oIEtJS6hp3rfFic9ks5QxhRkS4U8880keSJ1CErxtTey/M/wMNfS5DfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FPG1Gpwq; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720095657; x=1720700457; i=markus.elfring@web.de;
	bh=RkwvNaNtMTa/E1eey+qDqTLd5BXYMTgaMsbsOtcI6eY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FPG1Gpwq9oxaMJdRBNG/DPztQODGZDU1TKFOeqxHqndD4Pbs8hb0fokYtndiIFNk
	 mX6pnXZwkgbUMjb44Le6zTFmzWOxntEGzB2zZFVC/UiDxejmNF7qt67yxWfc2RV9R
	 Tn4EIgk5ijq+RQl31ezeSZ/zSUXRb1ybRZWCssIOwPRLIVXk/qbNuLJImIisxMo7O
	 C+zCohjmLTav5Q/7oJID1coRw9UPHUczcDRnVybYU1rXQEPJjG4CLa434Bz9uSf7/
	 sZzTaQTXFvUcgLf/tMeEOzZ0uElGnhjiZdp4TsiH2nbrs/hxfhkgYdPHV/HXH8/HF
	 Z6SvLx8A+xSgOAqzIA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuVGC-1s77oh2Lxq-016qBk; Thu, 04
 Jul 2024 14:20:57 +0200
Message-ID: <0fd113ef-67f9-4510-ab28-8b49089ef4ff@web.de>
Date: Thu, 4 Jul 2024 14:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <quic_tdas@quicinc.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-3-db295a846ee7@quicinc.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-3-db295a846ee7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w1JpRox6PEFAAvDdVOuSIdokeECm0Nb9I2VXa0A3zhcX8CkCoVi
 EY/TvlgYk7yoVjyr62ckdf+BU6IEO6MKiTbc9kTzO9CaFbrwgLIWy4Xu3ghHLcjOl3dUd60
 uooblIDaF+wXNiSFL53ZwmZQjjTf1GpnxBboW20+tXTqUj+hjJwesQc5WLySMaR6CrrA2Li
 W+8nWJut+sQn9iGxQYL/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kg9mRIQBY6M=;42unBiiR+YXfe+cQ+fl8JPqiA4i
 o4rstFvyCG2ouiUFMBwEQCcvjzjMfBFObW7sPaU81trk1bYBkWiFFcnZlItPK5rBmf3iG5IrD
 PbvwnUZZAoBqghKTIw9oSCuYzYeOvEY1ge7Gh7thR+P33y5rtNr8vpHuUXZQ2VGQeXajRlIfA
 RW/NwlHT86Rqa4GRVd2l8/2u/G7iDByahoxT6KEkCXOzmBEZFRLjwRCtL4/dv8ygHGkQw/jnU
 5SmshY40SAHXkidfQ8CARSYyGYS61ICWOxTY2uPy5Oxez3doeLxRDwB5TXUBIFQWJVthkcSWA
 D44+jW2MuxNUZbNq6OmtCKR3o+tc/R9KxZHVP9wOrNtduCsZqgLoOQWKL34Ta++GfDnPxQyen
 /e2rKtMyh3QZs+h2exPlUh8HStJu2hMJZiEF0LeF3jYxhA36aO3lfEDKl1rB7UrzrdDUEiFyU
 SV5DwhnC7JRRmKJoMbc4TSkYOLWCM6Q2iuuBACudafAuY2s8OtLPrR5GU4p1T5t8DP0O6mMOV
 laBpVRBEQfFMHpDncZk/JZuQWGJUcp34fmGoK4okJ/dYLR/GxcXUTWTjMURr0Sax89otafevW
 jCdMrm9B0jIAJNoAkSo8CPU19G2Ubsi1YQTPV2uqZ3ZwzyA3C2tFjEZQ9HlPiMuNlbNhPSF//
 5mzJXTeukIxmm9QYZj/6Nf1l8Ps68Ort+htQwPEXuLdwjEjiYoP94OCrb5/opXVfdzMV7uYjr
 aZ5/w/m8U2irQRJ3QrgQyDI+Ab6Nee0GHghIW7xPYk47REC89jjIDFJblq9HU0bwPxSwk2zyR
 6vJxZVFJb7bqtCqAqROi1KLLodLyjMHjltt+WAsCGSYxM=

=E2=80=A6
> +++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
> @@ -0,0 +1,107 @@
=E2=80=A6
> +/* CAM_CC clocks */
> +#define CAM_CC_CAMNOC_AXI_CLK					0
> +#define CAM_CC_CAMNOC_AXI_CLK_SRC				1
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> +#define CAM_CC_CAMNOC_XO_CLK					3
=E2=80=A6

How do you think about to offer such information as an enumeration?

Regards,
Markus

