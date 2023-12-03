Return-Path: <linux-arm-msm+bounces-3084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DB8020AD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF23A280F70
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9810E9;
	Sun,  3 Dec 2023 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfmrlXWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F1138E;
	Sun,  3 Dec 2023 04:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C80C433CD;
	Sun,  3 Dec 2023 04:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579100;
	bh=ryt2h7SkbYQcn12xnCcjVqqS+Lbdhr5WerU/Zo8DJWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfmrlXWlhbIE7h6iKf2cASBdiB80r7n697VPkclNShPdg/V9W7MCrF86RpO8cy3en
	 sof730zloJV/UmoDUtxDSGQ/nTon0w+LgiWxCpG4y1qn5W/dS0icFU5EbSTDJWuSlJ
	 jtKKDyC9EIK/INYJx+13z7evbfw67J/LQFDPUsZAQaZ4SST1IWIwlhjj+Q3FKXNCLo
	 56oj4/EXlAZ8qnVfMwzjXpBhlSsVhtBWPB4ZxsBz6SgJP8Rl0PPlSQqgrcoxBH+k/C
	 gOAduZNCwFotwCQu6W0BVlJzFjMwSXiYmpANvxucu9qfG1QFuc8yBsIlHuP8w6Pq6+
	 lMCOJU9LKxN/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8939-longcheer-l9100: Add proximity-near-level
Date: Sat,  2 Dec 2023 20:54:31 -0800
Message-ID: <170157925819.1717511.9438209599308488014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126-bqm5_prox-v2-1-b7defc3979ac@apitzsch.eu>
References: <20231126-bqm5_prox-v2-1-b7defc3979ac@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 26 Nov 2023 22:46:20 +0100, André Apitzsch wrote:
> Consider an object near to the sensor when their distance is about 4 cm
> or below.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-longcheer-l9100: Add proximity-near-level
      commit: fbe0870c48ac84f117860096048055a4f078a976

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

