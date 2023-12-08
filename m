Return-Path: <linux-arm-msm+bounces-3968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99D80A5F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409681C20E28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74202032A;
	Fri,  8 Dec 2023 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tn8QxkVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B91E538;
	Fri,  8 Dec 2023 14:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51706C433BB;
	Fri,  8 Dec 2023 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047073;
	bh=sZGnGeqLpB1IxcKgVGkGof0R2a8lgrqRAyyzVhs+8U8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tn8QxkVAlTqmxjTnSmv0OKh8GH+Q3HrAEPw9sAdcYdRBN3bIDB5sL0A7PYLLcYA1N
	 aCXFsj4fEMeMjBadIXAWihd7nLXv2iLekTr2vDSLwLLO6uxoQ5Qcadm0YF7bpY8SUP
	 attWJ0vtiwdV7cyBkOBFNDAjmdKZhOJydvWwx//gDClo8rYZB8afbMu74JX3XslX0x
	 ZqngfzxqRSBwqvM3mC+lGiuPj4dUY4OZp+MS7URUkLJP11eMFFMq0A0nfcGslcCiAA
	 2JHiCZqmRsQq6TNMqr0z5rIN923Vxt12B7srwYCGnwShsyLbGgK7eAQ/5otOipcmrF
	 r1yBSoDZSQKYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alex Elder <elder@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable IPA on sm8650
Date: Fri,  8 Dec 2023 06:55:21 -0800
Message-ID: <170204733636.342318.7110729892065912812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
References: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Dec 2023 14:50:40 +0100, Neil Armstrong wrote:
> Add the basic DTS information for supporting IPA on the Qualcomm
> SM8650 SoC.  Enable IPA on the SM8650 QRD platform; GSI firmware is
> loaded by the AP in this case.
> 
> Tested on SM8650 QRD:
> [    5.764240] ipa 3f40000.ipa: IPA driver initialized
> [    5.787438] ipa 3f40000.ipa: IPA driver setup completed successfully
> [    7.446693] ipa 3f40000.ipa: received modem starting event
> [    8.413152] ipa 3f40000.ipa: received modem running event
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8650: add IPA information
      commit: 9fdddbd134a68843364c3e8c57fbdc5da2a7083d
[2/2] arm64: dts: qcom: sm8650-qrd: enable IPA
      commit: 83c054b913cf6accd4cb31cee51729b322bde7fb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

