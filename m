Return-Path: <linux-arm-msm+bounces-65368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4AB08411
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8465648DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E10022A4E9;
	Thu, 17 Jul 2025 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8A6r2hW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC9228CBC;
	Thu, 17 Jul 2025 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726703; cv=none; b=HFeLs6nOLSsayymDATKTbzDiwbBdJLDbve7GxIMbR8zEYW6Rx7CdQgQdDTL47Da9Y+NIr7E03XFL96PT5Slbsj33Lvq2SRbA49lJe66X9gjaW6zOGNIV2sws91zb1EP2pMzOKYr83FUVwdRuUqp8qXeTaIVwDhmGkw+Bh01el58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726703; c=relaxed/simple;
	bh=bUTpYbwxOljo10TrwdQnbYmrkI7PJVprtxMfhIWivR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HbAxV5/GYBxqHntE7gfPQXA7+keRtQ0nnIYa6hZvlLra+7uyU03BcMMbyX7BwxY/lw9T+QEX3RiRiaD3Kz1BqA5qnSLkPo4qs45kpA+pXKoFhXELtq29IywrByJ90Cme1NWoC49mmE5oc5ncTstRCC41mVal6Bhl2f/qI8OZ3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8A6r2hW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A86EC4CEF5;
	Thu, 17 Jul 2025 04:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726703;
	bh=bUTpYbwxOljo10TrwdQnbYmrkI7PJVprtxMfhIWivR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8A6r2hWyYxJe3sIS3qvCfQXpZcYJOjYl09k/lmu8pfSruEu31njZdalTJefwiZmR
	 5cqR3ja/KW/h+J8ygxPBvbarFb6ZqDbgH5MTsrp1CsTqECQeOzcBCqOoM5FZvGoong
	 mQBRbNLAz0BZVZ4SPNJ2teTwm4d5+8TKN9cTBM9AR396KPjhRfNdCwuE23OjnDWqiv
	 OktBQqM50gJ/Bss8sAdT7Nsn6c7G+0kwGrzBMzSgGpJEyU7Fvi7DQCuLd3ECLG/vx3
	 iWWX61/oxuZWoGdqLR4OixvtASXoDp+COLIc8y8rVBSb8ddXcMx8B33PU80yyWngFA
	 jdr3Tx9zCgAkA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: add missing dt property in QUP SEs
Date: Wed, 16 Jul 2025 23:31:14 -0500
Message-ID: <175272667118.130869.5764431873638352730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 12:13:38 +0530, Viken Dadhaniya wrote:
> Add the missing required-opps and operating-points-v2 properties to
> several I2C, SPI, and UART nodes in the QUP SEs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: add missing dt property in QUP SEs
      commit: d8356c7975f75c1db52e9ac908cf2597272ce2aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

