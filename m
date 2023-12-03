Return-Path: <linux-arm-msm+bounces-3101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E68020E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1FE280FB0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A3A619BF;
	Sun,  3 Dec 2023 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1LjHFHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454D63D5;
	Sun,  3 Dec 2023 04:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED74C433C9;
	Sun,  3 Dec 2023 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579122;
	bh=7fwoAq1Nxg2nO9O4kxbtpvBac+C2ltWlwTbj6a6iAZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s1LjHFHzpn1B3Hp2+ULu24wF1BmgF+XQmVsbZ8qveUDdkh5uPaSiYz940o+6woWj/
	 W2x3yociHVLBao9XmhAsxAhtn3/o2a0JCL/cTNJGgTMg7bmqHSWmCKpCSu3w1CpiDx
	 ZTy3a5BFQPT6hEyvzlnsQGTA1951e4BLhIGQweiIqcw16KDHknwVsH4ngOo+RP5sqF
	 HU0um2pAuD9n9Mo+pl1TXgfDxKRcgJAi/TmOTZw5H8S+sJYxfFjVqhJ6C00ksUS9ps
	 8ptIV2xblKk7KoZVhO6q/TMaCo+Yn9LJFmwFZuuU5k/F0uQXki1fB3pn6YF4Du/SBf
	 ZSXVi3gw2+RCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x-primus: Fix HALL_INT polarity
Date: Sat,  2 Dec 2023 20:54:48 -0800
Message-ID: <170157925835.1717511.7071965404233684888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130-sc8180x-primus-lid-polarity-v1-1-da917b59604b@quicinc.com>
References: <20231130-sc8180x-primus-lid-polarity-v1-1-da917b59604b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 16:11:10 -0800, Bjorn Andersson wrote:
> The hall sensor interrupt on the Primus is active low, which means that
> with the current configuration the device attempts to suspend when the
> LID is open.
> 
> Fix the polarity of the HALL_INT GPIO to avoid this.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x-primus: Fix HALL_INT polarity
      commit: 1aaa08e8de365cce59203541cafadb5053b1ec1a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

