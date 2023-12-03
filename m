Return-Path: <linux-arm-msm+bounces-3093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C38020D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE892B20AAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3136015BF;
	Sun,  3 Dec 2023 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXNxNk51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4183D9F;
	Sun,  3 Dec 2023 04:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0673EC433CA;
	Sun,  3 Dec 2023 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579111;
	bh=yKZzimRPOiELfhstYOIdCWyYa+W/ni1uppnmF40LDYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fXNxNk51PfFqJ0m+MMvYoXpCHzBWipjYYBWygIYQPjhHoMGrEsArWB20/Af5tEO0W
	 nkKhSJE/jx95epORf1zEpMs5WK+Nv2Jq2L9zG85MbDKBppLR41DR1MnEkA6cA3ijC6
	 HrEx+Z7KWA1C1yWc/tc9Ms9IRnYicjgyDsrixa2YPfgG6Ac9vk54gyQA8PaxhTEey2
	 11IaR+svNJMrTUTcjEYnFq9eKZtvBGcorMf85lyDTmY3LmtcS40lY4+no69HPGj9Bt
	 WqlgtkI093f8Vz9mf+1S1MlJyIJbqAmZ4i3JlQf5+lPKJ06EbLjNYwgRyW4n2/8Zz1
	 PKuKqLm6R2lRg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm632-fairphone-fp3: Enable LPASS
Date: Sat,  2 Dec 2023 20:54:40 -0800
Message-ID: <170157925832.1717511.16869847799170927483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015-fp3-lpass-v1-1-4d46a399a035@z3ntu.xyz>
References: <20231015-fp3-lpass-v1-1-4d46a399a035@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Oct 2023 22:06:56 +0200, Luca Weiss wrote:
> Enable the LPASS/ADSP found on the phone.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm632-fairphone-fp3: Enable LPASS
      commit: 2dee68e77cb5322d7cfe44f3c84ff8ae2eaf4aee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

