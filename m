Return-Path: <linux-arm-msm+bounces-68586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94DB21924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC33A19083BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969CD2264C7;
	Mon, 11 Aug 2025 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgNodGpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429C21B9C5;
	Mon, 11 Aug 2025 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954838; cv=none; b=qm4JDqOhKnsYgIhbsV/453g/UXeufp2NrH1bbvI+abS+TWXq6lJtg6CirYVLDXKciXyS9m6Ag0Ybv0B5TEhG3Xiw5GD5y9d3wWj1Rlnw+t5KWwJe8INPsB+16Z4vwcyHu1ynY19EzC9KQSsFyuvxTwzN4F1y09CcLdo0zp4xwS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954838; c=relaxed/simple;
	bh=oLFBVU6bsttUPJMzJBCFbq4Ps0CA+lIcLpo4erUI3FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7zMpL5JXl9etHPH2NHpVcGeM5Kt4VBfWPVrPjUmaAbcCpMP45Rrzs6EhTSmb3dq7e613hq+4E4hYXJXrmAM4zzBKDQxfSIJlT63RwotYy+LlZA1w3eHzy10+dph1TrQlRH9ZO9MDb1NRw0O2jXaxQ2MfupK1z+rmcufpjlPsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgNodGpr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8147FC4CEF8;
	Mon, 11 Aug 2025 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954837;
	bh=oLFBVU6bsttUPJMzJBCFbq4Ps0CA+lIcLpo4erUI3FQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgNodGprg5dlEJ0PopB/l9rlq/K8ArJajZPCCN/5yzRV9mZjaJRJnvez4ZQWMtrk7
	 qPRPikiiU3M0fmkCpii7oa7XZyR/gYGEkFDAaNRxNlAQtvG0xpCsSXG22BGnz557uA
	 092MDfacj/pgbOlVXQ1BuPHoDqpzQBvmmmcMm8By07YxQ+6jbrGozdcGy9hZebqIQZ
	 6gxHGipd+dtf1kUBjtNjjkRrWVJfOawh4IaSVEL5LNcZzA4cizmrOyjcBneFpYgqyW
	 TErNB3JtUHYmnhNoHbcoyEXNLyco0ldcAYKeCwMxJevYnRbmfROTpJwLTPONVPThTb
	 RpyPDwGMT0Iig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: ipq5018: Add crypto nodes
Date: Mon, 11 Aug 2025 18:26:53 -0500
Message-ID: <175495482436.157244.1443969995708040792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721-ipq5018-crypto-v3-1-b9cd9b0ef147@outlook.com>
References: <20250721-ipq5018-crypto-v3-1-b9cd9b0ef147@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 10:23:15 +0400, George Moussalem wrote:
> IPQ5018 uses Qualcomm QCE crypto engine v5.1 which is already supported.
> So let's add the dts nodes for its DMA v1.7.4 and QCE itself.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: Add crypto nodes
      commit: ed5789ba7c2ce548f01ebbdbd7488dd9cccc4513

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

