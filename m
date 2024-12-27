Return-Path: <linux-arm-msm+bounces-43454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C19FD011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2439C7A1453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B57B12F59C;
	Fri, 27 Dec 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpWM/2f3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDC12CD8B;
	Fri, 27 Dec 2024 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272934; cv=none; b=n1cco2ZZqkC4aIq+2TB0J8314PD5Pgy7KeblYgWXupj+julNbDNH6dpv5q/kFMpsF2cFno27S9uWD3wF3BEO7xTykds+QwmQlF13/Kvv5R+OTAmVS4wZmfydBauAbbKpbtRR8bfeDouezhZD8W1cGgG1suB68TXWW1BgI6p0mVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272934; c=relaxed/simple;
	bh=Zkh8w3uLFLm4xhv03VscIxKqRv7PHOVaGcX0UvbosX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsNENDz/T3435a/GlvCe9QJdcg2rxadgNEJvJRQmY56Qxd0+TuJpyqrF+yzgHDpsRAStHgqk+4yJtqE6uWoHK+tOrm13kdY3nqRZf+ptsiP+LMpOxBtXv7zZ5MDmQjWK12Z1ph/w4VMIBOqqsAwoxgG/gNVh0A903HeTfyeW/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpWM/2f3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B082C4CEDD;
	Fri, 27 Dec 2024 04:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272933;
	bh=Zkh8w3uLFLm4xhv03VscIxKqRv7PHOVaGcX0UvbosX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpWM/2f3hNPNsWbJ/XQ4lQnHz/p+/rnad+i/yF/QBunmrH7eaEFL7RZNb03RyXZMz
	 XYjHVPRW7kOLAUNGjlYpjeCq1sfvqXHz6zcE5YX16sbWNnOWLNGsKrmk7n5tSa8oJn
	 pj/yyCYX7VLAFflHmoKWpS7RRAuPgf/az8EBwd6Vnha6TxHmeG/VYnkHidCBZ3wifo
	 A/yKziO9zfYgZPEDAOaxYAUIw91hZzwofbZh0Kw4Az7Dwj6yu3ODoT88Wc9kwGmFoc
	 1zANfUyx81YMVo0sowK1kjgvO1m1kuYjPZfx7T/b3rj6j4ai8NgdlUSF/wsuUsnjqC
	 49r++tKYewqWw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Leo Yan <leo.yan@linux.dev>,
	Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Zac Crosby <zac@squareup.com>,
	=?UTF-8?q?Bastian=20K=C3=B6cher?= <git@kchr.de>,
	Jeremy McNicoll <jeremymc@redhat.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Stephen Boyd <swboyd@chromium.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Martin Botka <martin.botka@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Vinod Koul <vkoul@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jun Nie <jun.nie@linaro.org>,
	Max Chen <mchen@squareup.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] arm64: dts: qcom: correct sleep clocks
Date: Thu, 26 Dec 2024 22:15:21 -0600
Message-ID: <173527291947.1467503.265731707642759034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Dec 2024 12:16:59 +0200, Dmitry Baryshkov wrote:
> Correct sleep clock frequencies. For several platforms I wasn't able to
> find corresponding document and as such I didn't change defined clocks.
> These platforms are: IPQ5018, IPQ5332, IPQ5424, IPQ6018, IPQ8074,
> IPQ9574, MSM8953.
> 
> Also several MSM8996 / MSM8994 devices define divisor clocks at
> 32.768 kHz. Most likely these clocks are also generated by dividing the
> 19.2 MHz clock and should have the frequency 32.764 kHz, but being not
> 100% sure I decided to leave those as is for now.
> 
> [...]

Applied, thanks!

[01/21] arm64: dts: qcom: msm8916: correct sleep clock frequency
        commit: f088b921890cef28862913e5627bb2e2b5f82125
[02/21] arm64: dts: qcom: msm8939: correct sleep clock frequency
        commit: 5c775f586cde4fca3c5591c43b6dc8b243bc304c
[03/21] arm64: dts: qcom: msm8994: correct sleep clock frequency
        commit: a4148d869d47d8c86da0291dd95d411a5ebe90c8
[04/21] arm64: dts: qcom: qcs404: correct sleep clock frequency
        commit: 1473ff0b69de68b23ce9874548cdabc64d72725e
[05/21] arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
        commit: 5546604e034b6c383b65676ff8615b346897eccd
[06/21] arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
        commit: 298192f365a343d84e9d2755e47bebebf0cfb82e
[07/21] arm64: dts: qcom: sar2130p: correct sleep clock frequency
        commit: 7fb01ef4907e3888c2002d71bf66ef52eb0fa634
[08/21] arm64: dts: qcom: sc7280: correct sleep clock frequency
        commit: f6ccdca14eac545320ab03d6ca91ca343e7372e5
[09/21] arm64: dts: qcom: sdx75: correct sleep clock frequency
        commit: b8021da9ddc65fa041e12ea1e0ff2dfce5c926eb
[10/21] arm64: dts: qcom: sm4450: correct sleep clock frequency
        commit: 158e67cf3619dbb5b9914bb364889041f4b90eea
[11/21] arm64: dts: qcom: sm6125: correct sleep clock frequency
        commit: b3c547e1507862f0e4d46432b665c5c6e61e14d6
[12/21] arm64: dts: qcom: sm6375: correct sleep clock frequency
        commit: 223382c94f1f07c475d39713e4c058401480b441
[13/21] arm64: dts: qcom: sm8250: correct sleep clock frequency
        commit: 75420e437eed69fa95d1d7c339dad86dea35319a
[14/21] arm64: dts: qcom: sm8350: correct sleep clock frequency
        commit: f4cc8c75cfc5d06084a31da2ff67e477565f0cae
[15/21] arm64: dts: qcom: sm8450: correct sleep clock frequency
        commit: c375ff3b887abf376607d4769c1114c5e3b6ea72
[16/21] arm64: dts: qcom: sm8550: correct sleep clock frequency
        commit: e59334a088c3e722c0a287d4616af997f46c985e
[17/21] arm64: dts: qcom: sm8650: correct sleep clock frequency
        commit: 448db0ba6ad2aafee2cbd91b491246749f6a6abc
[18/21] arm64: dts: qcom: x1e80100: correct sleep clock frequency
        commit: 67e25a3e12d128336114a5d1572e055a8bd33129
[19/21] arm64: dts: qcom: sc8180x: drop extra XO clock frequencies
        commit: aacd8c54b391c9e26a31483cf40f8837ffcfbdee
[20/21] arm64: dts: qcom: sdm670: move board clocks to sdm670.dtsi file
        commit: 55cc39c70d95460fbe08d2518e53a7f8870e1657
[21/21] arm64: dts: qcom: q[dr]u1000: move board clocks to qdu1000.dtsi file
        commit: a21fde626f775288aa62c6a5ae07f7e55c2b18c4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

