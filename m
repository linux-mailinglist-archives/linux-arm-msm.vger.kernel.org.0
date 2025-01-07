Return-Path: <linux-arm-msm+bounces-44175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE1A04697
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D8818880E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D551DF969;
	Tue,  7 Jan 2025 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTrntird"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AD19883C;
	Tue,  7 Jan 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267948; cv=none; b=Ml1pQhZ440iq4rnrQMdvv/GtgC7HOlQlcVYx9qtVhU34pya1Ky0UlxuOb7ubZC4KZNV6E0+J3lgsJfh7JD5/OHTVnFcy9KDxhW4s2VRTORo3TXp9uN7cI0d/i6KBALEZM5BQpU2taxZk+VuuKhQ7fBZBNsPnHy/5eMw00tZOTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267948; c=relaxed/simple;
	bh=mUHGIB73RZxxMyv3dtWH9DzVwiDIdj7ZAf8ZRBeQdpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NSctiWObdPBKiMpHdtjLPtHw0EABtL3jlx7q3Jwpdva+b3IsiFIcyCm8++54O1xU1JMX+QSPIVb/PuOXZ4lBGKc9DKXFI1aJlNMfYKyCR/10gLN9d2Y4QjZ0BzQMnLUPArqGgwcIM2c49/sY+p85Uaok08N8O4cOjVtfap7Mlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTrntird; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77DAC4CEE0;
	Tue,  7 Jan 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267947;
	bh=mUHGIB73RZxxMyv3dtWH9DzVwiDIdj7ZAf8ZRBeQdpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JTrntirdydvbY13cuJ916pUUwuWDPyzTcnVzvw6RtaDHtkySkgmClXpWPx1ckEyZU
	 aAKc0LqjsGiboiKB0STXME2xqOPGMPkjvI8pbbN4fkKhnEVuYyV7inrr9t7R7AYIpL
	 d8Oyuw7bjlicXYf54rrjqtlL8ffTkEJKdKe7//nkOqgTQF8uc6QQxaUY79UeTWa8fY
	 YTcRH69NAzBj33o61kC6i1QAuu7Oy4nuWP92HtDJFXki862Ezq1qWSZwfpm+aKut0S
	 47RKX/iumIeYkJRipAebyAwMMC7WqjMHqDIe3iPax/KuevSjBMirvmhR8lZxS4kRRa
	 UhciPn6BVYeEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/23] arm64: dts: qcom: Fix remoteproc memory base and length
Date: Tue,  7 Jan 2025 10:38:39 -0600
Message-ID: <173626793407.69400.16139733162948175673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Dec 2024 15:53:49 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Add Rb tags
> - Add four new patches (at the end) for sdx75 and sm6115
> - Link to v2: https://lore.kernel.org/r/20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org
> 
> Changes in v2:
> - arm64: dts: qcom: x1e80100: Fix ADSP...:
>   Commit msg corrections, second paragraph (Johan)
> - Add tags
> - Link to v1: https://lore.kernel.org/r/20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org
> 
> [...]

Applied, thanks!

[01/23] arm64: dts: qcom: sm8350: Fix ADSP memory base and length
        commit: f9ba85566ddd5a3db8fa291aaecd70c4e55a3732
[02/23] arm64: dts: qcom: sm8350: Fix CDSP memory base and length
        commit: f4afd8ba453b6e82245b9068868c72c831aec84e
[03/23] arm64: dts: qcom: sm8350: Fix MPSS memory length
        commit: da1937dec9cd986e685b6a429b528a4cbc7b1603
[04/23] arm64: dts: qcom: sm8450: Fix ADSP memory base and length
        commit: 13c96bee5d5e5b61a9d8d000c9bb37bb9a2a0551
[05/23] arm64: dts: qcom: sm8450: Fix CDSP memory length
        commit: 3751fe2cba2a9fba2204ef62102bc4bb027cec7b
[06/23] arm64: dts: qcom: sm8450: Fix MPSS memory length
        commit: fa6442e87ab7c4a58c0b5fc64aab1aacc8034712
[07/23] arm64: dts: qcom: sm8550: Fix ADSP memory base and length
        commit: a6a8f54bc2af555738322783ba1e990c2ae7f443
[08/23] arm64: dts: qcom: sm8550: Fix CDSP memory length
        commit: 6b2570e1e43e4acd0fcb98c6489736fe1c67b222
[09/23] arm64: dts: qcom: sm8550: Fix MPSS memory length
        commit: 8ef227e93a513d431f9345f23cd4d2d65607b985
[10/23] arm64: dts: qcom: sm8650: Fix ADSP memory base and length
        commit: b6ddc5c37323f7875c2533cc4949be58d15e430a
[11/23] arm64: dts: qcom: sm8650: Fix CDSP memory length
        commit: aca0053f051625a224c2e802a0e88755770819e4
[12/23] arm64: dts: qcom: sm8650: Fix MPSS memory length
        commit: d4fa87daf3dd39d6bd4b69613e22bfb43c737831
[13/23] arm64: dts: qcom: x1e80100: Fix ADSP memory base and length
        commit: 7a003077366946a5ed1adab6d177efb2ab59e815
[14/23] arm64: dts: qcom: x1e80100: Fix CDSP memory length
        commit: 3de1bf12c6bfb9a92f0803941ecae39b08470446
[15/23] arm64: dts: qcom: sm6350: Fix ADSP memory length
        commit: b0805a864459a29831577d2a47165afebe338faf
[16/23] arm64: dts: qcom: sm6350: Fix MPSS memory length
        commit: cd8d83de9cc9ecfb1f9a12bc838041c4eb4d10bd
[17/23] arm64: dts: qcom: sm6375: Fix ADSP memory length
        commit: bf4dda83da27b7efc49326ebb82cbd8b3e637c38
[18/23] arm64: dts: qcom: sm6375: Fix CDSP memory base and length
        commit: c9f7f341e896836c99709421a23bae5f53039aab
[19/23] arm64: dts: qcom: sm6375: Fix MPSS memory base and length
        commit: 918e71ba0c08c3d609ad69067854b0f675c4a253
[20/23] arm64: dts: qcom: sdx75: Fix MPSS memory length
        commit: 9a27f0e1869e992e4107e2af8ec348e1a3b9d4d5
[21/23] arm64: dts: qcom: sm6115: Fix MPSS memory length
        commit: 472d65e7cb591c8379dd6f40561f96be73a46f0f
[22/23] arm64: dts: qcom: sm6115: Fix CDSP memory length
        commit: 846f49c3f01680f4af3043bf5b7abc9cf71bb42d
[23/23] arm64: dts: qcom: sm6115: Fix ADSP memory base and length
        commit: 47d178caac3ec13f5f472afda25fcfdfaa00d0da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

