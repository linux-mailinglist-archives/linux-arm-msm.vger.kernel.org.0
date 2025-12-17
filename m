Return-Path: <linux-arm-msm+bounces-85599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C269CC9C04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 23:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1170930450B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3B732FA2E;
	Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXzeNu0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4832FA24;
	Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012372; cv=none; b=Vgu0P5YG7A+DIzLCAbJDtl96x0/DBwXp4Q8BkzJNw9i/+wPg/4w2o76+oMT3wzeCr3P/AVUJ1Rn1rCS7+wUUyAzyDdFNVv+OdowISP+5qSUQdR5iqrs8oGekjJAG7i+UQhdVsTv5G7Uo8uQXEhi2FY/nJIh98qMBAiIYzThzjAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012372; c=relaxed/simple;
	bh=fn1kDPY6rMOjXhDscgtHgNCp1+YcUmrlIgMwFQEfw9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjNctI4l3EUScgNrdi6LCpbeOcCoR/TSnCRLgPwx/7H7dWngptXwDbzAPJDwRCSBR3G4yerHw436nnOerHwI2HS3Lk2rOym3Y+ysS8TdYueUmwqRl0EAdFz4+S3GEGUd5HkJC90av/8N/hcENU4Kvi39yrr2Dd8tJ3M8jsc+yOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXzeNu0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3139AC113D0;
	Wed, 17 Dec 2025 22:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766012372;
	bh=fn1kDPY6rMOjXhDscgtHgNCp1+YcUmrlIgMwFQEfw9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXzeNu0c97ypua0FWdYUCoRRDswAtwUVqhEGuUCvo2aoaKNlJWopNo1GOat/wrxO1
	 sJqXyArsDuB7GPc5ygo7jj5lLFME7QD1KM3hZB4OhQLWNrHr4DzKsA/Ista5nmtDYs
	 jRhUjCH5KycrC20wD4uLYwmGzt39kaLOiw5U66pDeVEAbAk4YVZwXG1QzxfoRMmcUO
	 JX98+qG5pNMXUuIYuC8gn0HgZtmPFkGXMLl+YFVXjDghkksnZYH+6XFe01Q/EQoqYW
	 GgUryOP8nJ51eO3BUXu7XKTU5wfkVcAkvp5Ij/0wtOwJ1QWriACGGMD8udFaqB42t7
	 TnqOaamGJMRTA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Neeraj Soni <quic_neersoni@quicinc.com>,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: x1e80100: Add crypto engine
Date: Wed, 17 Dec 2025 17:07:34 -0600
Message-ID: <176601285474.201175.12149445350886027064.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
References: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 14:19:45 +0530, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add crypto engine
      commit: 7d1974ce80fc386834e5667b0f579c2c766c4faa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

