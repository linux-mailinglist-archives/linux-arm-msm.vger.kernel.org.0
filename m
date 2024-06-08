Return-Path: <linux-arm-msm+bounces-22135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F69012A8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 18:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F9AA2822E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3CF17B4E9;
	Sat,  8 Jun 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDv4T1md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDED17B411;
	Sat,  8 Jun 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717863080; cv=none; b=kqfz5drE7HznFj4AJ80dLxN5DjPPWAzpl/PVp6Fz5DJHYIE8w4Td+4kBpJObTie87Lc54eM/F+tsfEIAGnQY4rLGZL5Wnv/r4a86j9QoUCSiaTzhZAH0TIPPi2B/QJa9gaG319kQxpiv9r1aYAqE6+7gyt6jUo+srJM7j4kJsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717863080; c=relaxed/simple;
	bh=/uwRUI/YsWFpgfwjwsOyJzuR2HOJ5zMOT3h3yHM7+JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uCJODW9rNaaHv4P7rRFQRj1dSwgZwRdrUjmgmTK8Y/cQD+hz+iLn5MO9Lprdo/HXwqIVsM2YjxOkcgVi+dI9ae7STmuvMV0Amev36wEAfGwU5iKwMdkLQg1VFAGpbGVD/lQ1Rp0t1hH8geVJ2jHY3Pd/tYjCxgPAhUJzGdasYkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDv4T1md; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD83C4AF0A;
	Sat,  8 Jun 2024 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717863080;
	bh=/uwRUI/YsWFpgfwjwsOyJzuR2HOJ5zMOT3h3yHM7+JU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDv4T1mdEAD6YIw6KhJDrK+44OqV31pIXyBKBjnSw4RhvCBYpool4jpTQGZFDjbqu
	 3pUe8e4Lv5mwe8HL7D14917qerQjd4jd0+cXIunmWfP1XuZl4AwrUstLDzQm6F+YJm
	 Y1aUy8ySwLO2GlY6YOHPh1aEG94CMpXEZdHyJITTNtxj8MFVTwIfiWen8xSbjwmcVz
	 gJg/3rdHsJL6UQaByFBDRDRxL0zy7NcSvQJAD1oddNwHIgpqN5mOBhTXjHAK/xxbSC
	 FOJ5PIeO5/mOc5VwVHQjKJqhbE75/P2ricR9khxbrwLDksc/wLZJCYVBeXsDqrzpbv
	 JUYosm/LV5t1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/31] Clean up thermal zone polling-delay
Date: Sat,  8 Jun 2024 11:11:16 -0500
Message-ID: <171786307408.851553.16016904343712298022.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 May 2024 13:59:23 +0200, Konrad Dybcio wrote:
> A trivial follow-up on the changes introduced in Commit 488164006a28
> ("thermal/of: Assume polling-delay(-passive) 0 when absent").
> 
> Should probably wait until v6.9-rc1 so that the patch in question is
> in the base tree, otherwise TZs will fail to register.
> 
> FWIW, Compile-tested only (except 8280).
> 
> [...]

Applied, thanks!

[01/31] arm64: dts: qcom: ipq6018-*: Remove thermal zone polling delays
        commit: 28930820bf8928c8247d6b001e042ce7e0037350
[02/31] arm64: dts: qcom: ipq8074-*: Remove thermal zone polling delays
        commit: bebd3c6476c97d0aee8985eb9544dfd82f6e8e36
[03/31] arm64: dts: qcom: ipq9574-*: Remove thermal zone polling delays
        commit: 88dd10e237ee1cfc70595c0feb37c8a71e521bfc
[04/31] arm64: dts: qcom: msm8916-*: Remove thermal zone polling delays
        commit: b3f0d522b548e969b138c48c0fd4098703363c53
[05/31] arm64: dts: qcom: msm8939-*: Remove thermal zone polling delays
        commit: 19c658e5bfe71b01ae41e85dab076da051814857
[06/31] arm64: dts: qcom: msm8953-*: Remove thermal zone polling delays
        commit: 1a43ff5b5f5a51c2dd0859bc46020e7f1c282414
[07/31] arm64: dts: qcom: msm8976-*: Remove thermal zone polling delays
        commit: adfb64b78f2f0e894c2520b8e2ff8bd5f2d49825
[08/31] arm64: dts: qcom: msm8996-*: Remove thermal zone polling delays
        commit: 612f017315fb466bc9348fb9a5f1d9506f4b5260
[09/31] arm64: dts: qcom: msm8998-*: Remove thermal zone polling delays
        commit: 47d92455f59f7e8414ebc962f60bd7a990563a7c
[10/31] arm64: dts: qcom: pm7550ba: Remove thermal zone polling delays
        commit: d96854de5d69a08a893d4a137d69c65f2feb40d5
[11/31] arm64: dts: qcom: pms405: Remove thermal zone polling delays
        commit: 1a78b5da8164afc1d60bec7c02b8fd8e6451f0f3
[12/31] arm64: dts: qcom: pmx75: Remove thermal zone polling delays
        commit: 8e49df9200591c469dfbdd29c93ee6cbe970aa2a
[13/31] arm64: dts: qcom: qcm2290-*: Remove thermal zone polling delays
        commit: d3eb8179f21f86439053745bb1504791236d38bf
[14/31] arm64: dts: qcom: qcs404-*: Remove thermal zone polling delays
        commit: 8d7807d24746af11ba966bce854ef3cd8df5267e
[15/31] arm64: dts: qcom: sa8775p-*: Remove thermal zone polling delays
        commit: a759962163af22b7f50c8f43ed8b3fc5e09bec19
[16/31] arm64: dts: qcom: sc7180-*: Remove thermal zone polling delays
        commit: 7cd2d9080a6eb281701f7303b1699719640380d0
[17/31] arm64: dts: qcom: sc7280-*: Remove thermal zone polling delays
        commit: 7747a49db7e54978151d74b22907a373c9b4de1b
[18/31] arm64: dts: qcom: sc8180x-*: Remove thermal zone polling delays
        commit: 1f57b1cff485c02678ea2dfe0ff7efa3b9f51e9d
[19/31] arm64: dts: qcom: sc8280xp-*: Remove thermal zone polling delays
        commit: e388421387e8b1b51c507883aaf13f40277fe137
[20/31] arm64: dts: qcom: sdm660-*: Remove thermal zone polling delays
        commit: 82162bf535a76f87e20a6eece83375d2dd791655
[21/31] arm64: dts: qcom: sdm845-*: Remove thermal zone polling delays
        commit: 2e58dbeae40e5fc7b2742bed05957cae32031387
[22/31] arm64: dts: qcom: sm6115-*: Remove thermal zone polling delays
        commit: 190f743561a44cf0176707b6e2f37b1a1b7ff367
[23/31] arm64: dts: qcom: sm6125-*: Remove thermal zone polling delays
        commit: d1a12560ef38021ce42ac31408fc53d2b8e08cc8
[24/31] arm64: dts: qcom: sm6350-*: Remove thermal zone polling delays
        commit: 2aad3fd3820d047fa70b62906565c185d830465c
[25/31] arm64: dts: qcom: sm6375-*: Remove thermal zone polling delays
        commit: 088d826d5af3cda20deb04dce406c95ef1ed8563
[26/31] arm64: dts: qcom: sm8150-*: Remove thermal zone polling delays
        commit: fc2f92b522019a5bfd464c946b15d180c31b092b
[27/31] arm64: dts: qcom: sm8250-*: Remove thermal zone polling delays
        commit: 2d10e2e28df7a690d670b3452d4891b50011dc42
[28/31] arm64: dts: qcom: sm8350-*: Remove thermal zone polling delays
        commit: 07fab48327ad0d85c2b2763d26ce56c84043515a
[29/31] arm64: dts: qcom: sm8450-*: Remove thermal zone polling delays
        commit: d0730a729f1a723f06e7b9db7f1a540cf72de871
[30/31] arm64: dts: qcom: sm8550-*: Remove thermal zone polling delays
        commit: fe5cb7d30795d81ed55888bcfb896086af3adc01
[31/31] arm64: dts: qcom: sm8650-*: Remove thermal zone polling delays
        commit: 92332cca0551b7c5c44f4236b8d1ce2828888e92

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

