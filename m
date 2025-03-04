Return-Path: <linux-arm-msm+bounces-50242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F50A4EAB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2B03BABB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951DC29238F;
	Tue,  4 Mar 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdY0ZHSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B88292385;
	Tue,  4 Mar 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107631; cv=none; b=EcCFi/e41zzrVlKqVs8No8NBbDAYgla45L+i3XmQzPitl9bRnBVcDLvwmMU7YYd1qWiBJoDniEfWrhcdzlNWm+ka6z8dV7lOstKtvV/FUDR169RjgrEBKvWV5TBA4t4jBWqEKJtLdwm0f24btRDTtFlf1nE1Y7Nn6Vxf+iGbxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107631; c=relaxed/simple;
	bh=P9EBUUhSDv8YAhAMlI9j9Wq8atw0atGmA0EIGY1k0S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjHZghKiUUdwyVsMwFtf/QsHnR0R06kYzxOvvWBOpqDPsIrW5vrwVs/Z6dAp/avXwf65iYW3wdEfu2LqqCXS6s3dsObnGlzdEO13bowhm1MPLaMrORu/ATXLzM994Q7UC+glPObwUqUbLCpFyl7lDVU7EsD29Fg50bMeqeMdrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdY0ZHSy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DA6C4CEEB;
	Tue,  4 Mar 2025 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107630;
	bh=P9EBUUhSDv8YAhAMlI9j9Wq8atw0atGmA0EIGY1k0S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdY0ZHSyvXBRvN0Kxqcweq7HErWseQLLPDMZTLoau0ZmVT6LHtG9Uj2CWd0QXXivp
	 IQsLfFMnTe2XHqYivnJcds0Mj9ZQkneqkn4TTAkuXrq1J9/HCMoUEz/835ZZKW0kwp
	 IlSzJZkn5QGgQuXZrQyn0O9Crura7f0KGkS/3idos+Sp7XHH0gFhwp9sx1u8a0y/TI
	 ZMPej2ApBrWqgsb5xWPmLQy2TX0gf4WRA1L4T6mED9W77Dk7SF/igCMdEyuyqoP2H6
	 VltfFmtdUZ+BRyRoT79hRdlEI8yPm0frjIzINEZ0kWWZxCk9BQJt7VDwVjo5u3raJh
	 c0Pw1Tx3p1MqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
Date: Tue,  4 Mar 2025 11:00:17 -0600
Message-ID: <174110761297.741733.9623107008860729417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
References: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Mar 2025 00:39:36 +0200, Vladimir Zapolskiy wrote:
> Qualcomm x1e80100-camcc was moved to its own dt bindings description
> file, however a small leftover was left, remove it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
      commit: 53fc6fe160c1b941e531a35e3a2e6d2aaef86999

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

