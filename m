Return-Path: <linux-arm-msm+bounces-3087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A62A8020B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59DA1F21035
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080F628F5;
	Sun,  3 Dec 2023 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6iXsYuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99732598;
	Sun,  3 Dec 2023 04:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9117BC43395;
	Sun,  3 Dec 2023 04:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579103;
	bh=KxxZEEg473444shSwsQVNT62EcqGr7edvl7KfR+ahCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t6iXsYuXZ6QQ2wJt3hqVo5Xg7Ymt46/SdGxPjwcj4z5CJGYOOoq+Uv+dLOORVdH9t
	 f2EZFAPJXwK+9Cnhvh6ZrywJB9Hp91KZFtwTqBgd2unLBUEEWSmNRTUeoG194I7FVz
	 ZoNLHYwrh00gJUH2I6EXgyQpMDs/YxsRrtZJJaoexyhwpAjjhsyuNf7KRSlZPZ6k3l
	 VTzCnJkBNz38NVLQDKmE85nmcPOQ6vJkFCQhMX0I3nim5MaDmEDmtksN2r4jheb+iX
	 5Il67n9rsptVrSXLRXHiQbEQDpmRYM7NTHyRegKdOlftoxtNB5LZVr6VO6iljDk56E
	 wiaXKZ96gEp1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] RB2 bluetooth
Date: Sat,  2 Dec 2023 20:54:34 -0800
Message-ID: <170157925818.1717511.140667965490935754.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120-topic-rb2_bt-v2-0-4bbf266258ef@linaro.org>
References: <20231120-topic-rb2_bt-v2-0-4bbf266258ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Nov 2023 12:23:26 +0100, Konrad Dybcio wrote:
> The bluetooth module on RB2 seems to work ootb with the WCN3988 setup.
> Enable it.
> 
> Scanning for devices works, couldn't test pairing on a remote board.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm6115: Add UART3
      commit: ba5f5610841fad3b15c69c6949ed6e19bd5b466e
[2/2] arm64: dts: qcom: qrb4210-rb2: Enable bluetooth
      commit: cab60b166575dd6db4c85487e87a9b677e04c153

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

