Return-Path: <linux-arm-msm+bounces-54010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C000A85C96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D89A58C2EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8916729C33A;
	Fri, 11 Apr 2025 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwJagw9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060A29C339;
	Fri, 11 Apr 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373421; cv=none; b=WpNlBzlpX15F2AAET2V2UL8FmbIXC2YQOUJLPhuDO+oQXPQqhqBKRUUYvrVIYVhyOP7i9VBINHeRenPeLF3L7mwGwa9c3d1kslk0auumf73bYGJK4ATLYdo1cPjsOSU5ieAfFcL1AqGJ4FEIOUyn98kHYaBQukd63gN8QOSgjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373421; c=relaxed/simple;
	bh=DQ7MOBRsZsKWT1Px7XHST574lWvLmJ1SanyS9Jv2Kjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FfTkD85fjXd00IQ23GddDg8uKso9fhUhuz84rgY9KFJA7GdVjUrT0DXJrsy7vJScvMNS/zgDnEE0spXFBzdEFGeIygHJwOEiI1HdN4UuvzMvwq3/Lg08s3wwhKn2U+b6E9CMFlyvc1BbqtohdGxDK87hMtxmqUrmyp0pMr8Tvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwJagw9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66472C4CEEA;
	Fri, 11 Apr 2025 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373420;
	bh=DQ7MOBRsZsKWT1Px7XHST574lWvLmJ1SanyS9Jv2Kjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bwJagw9qhXk84yfiY9ZmZUprVi2rsI9lVLKa2fKtKh9r4xEgziuFuMNiufAUWGSqJ
	 93SAme0Vj2VuhM0XRoqGNRiyjf1uM5b1kfDtcTWegeQkh/HctXGfSzhkbT6bKak6rV
	 rpEvKNejby5MdTx888KHHvMVFgUH4OdFyDI+dhsOu7g0dEhWIcZeczquANRk7v93C9
	 mrs2P2A5QrX6NXykAGfBOx8cUnm6gLcD3C8+HIrwmzl8EmjP1yNfiv+Qq56nOa8Cyr
	 qZSJaqFSQfa8zY7+aaRmL3RE1Z4fuL1QGHapRO6+8Kv46Z91U+uMQnv7S3zYZRbCef
	 ixwhh0Qx/8xVQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, manivannan.sadhasivam@linaro.org, 
 quic_mapa@quicinc.com, neil.armstrong@linaro.org, 
 konrad.dybcio@oss.qualcomm.com, Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250407121008.22230-1-quic_nitirawa@quicinc.com>
References: <20250407121008.22230-1-quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V1] phy: qcom-qmp-ufs: check for mode type for phy
 setting
Message-Id: <174437341804.673813.10672950006968682394.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 07 Apr 2025 17:40:08 +0530, Nitin Rawat wrote:
> Generally all target supports Rate B but for very few like SM8550,
> two sets of UFS PHY settings are provided, one set is to support
> HS-G5 Rate A and another set is to support HS-G4 and lower
> gears with Rate B.
> 
> Commit b02cc9a17679("phy: qcom-qmp-ufs: Add PHY Configuration support
> for sm8750") apply Rate B setting for SM8550 gear 5 without checking
> for mode value (Rate A or Rate B) from Controller driver which caused
> issue as SM8550 support rate A for Gear 5.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-ufs: check for mode type for phy setting
      commit: d784552e76a23c4ffad0e383670cd1d86064a6be

Best regards,
-- 
~Vinod



