Return-Path: <linux-arm-msm+bounces-5138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A053F816207
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 21:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FBAC1F21DBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 20:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728C048CEF;
	Sun, 17 Dec 2023 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tE8XIjpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8D48CD7;
	Sun, 17 Dec 2023 20:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8B7C433BB;
	Sun, 17 Dec 2023 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702844671;
	bh=+DX0N7UdIUqjXqpFVCPOLF099qME+OXVv4kkpQPaS9w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tE8XIjpiaHI1UXKM4RRe8VsYU03DL9s8UV3sNs3LwmPrhwtzOb6o83hzDr2bocAHu
	 cX/mSKqrtHPzv0Jgw1Iz26EgZs4o62eGBjRsqeY3+/+1bsvE+kUn2POrrOG9eOKMyw
	 WdabEXIbz0CnHSd2/hxhwqqSMmSotRnlHHal9nGkr7Zdtu4lscOKUN+LaxVfe+jazX
	 VqdwGckSxuOsJFBtH5nvaAAHwMnUKOGbeT57Ei7yX+H1AlSnZ0rKzAFDo9n5vDX41i
	 leiFIl/UCSGqybpds17i1hMOt32cAlJjXoWR9bR968AKmpYyME3pXfTiWjglHRqhRF
	 tyUNqR/rslG4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Ryan McCann <quic_rmccann@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v4 0/6] SDM670 display subsystem support
Date: Sun, 17 Dec 2023 14:24:25 -0600
Message-ID: <170284466197.74678.17866515484062477720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Oct 2023 22:18:07 -0400, Richard Acayan wrote:
> Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
>  - move status properties down (review tag retained) (6/6)
>  - accumulate review tag (3/6)
> 
> Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
>  - rebase on series and reference generic sblk definitions (5/6)
>  - add interconnects properties in example (3/6)
>  - remove phy-names properties from dtsi (6/6)
>  - accumulate review tags (4/6, 6/6)
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sdm670: add display subsystem
      commit: 5f8ba4f28ddb432c8a9720c337f9047e38fa7e36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

