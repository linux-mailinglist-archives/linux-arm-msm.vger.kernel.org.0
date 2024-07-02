Return-Path: <linux-arm-msm+bounces-24888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAA923F19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EEF51C21A12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9A41BA886;
	Tue,  2 Jul 2024 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asKQJdbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24AE1BA877;
	Tue,  2 Jul 2024 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927375; cv=none; b=Ojaq3BdeuMmOripMMkk8Ec7wSc/JcBlwm5/3PPgqQ9j9ecdsXfNrrUcD0SUzSKw3uMSm2BoZGX1IKRHRAkcYuSeuca9Tb9OiU9LsM9tuNI6g30nzJ5LDLMS+01KulDbV8Xt7PhKoRXWFg2S7VzcPXlp+Uyk49Om49PrkdkJayjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927375; c=relaxed/simple;
	bh=iuCyZDHCjUYh1ESjfx75LKbK8pm+Pveq1GXDorcZ1BE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GK/IQ1CAuwNafJe290JkLcaHZorrCOrAG+ynL9ROB5Q6BaGK21YR6wtiaFh1osXMcdDvy3tHAVd38XhGsPA4e1ExPHELNdW82FV47KJBWutJ1HPQT5UWHCfGjT5WKT88rTUgnG30CQejnG4h/cER+WAzXxVMp3thZwQ0h3KYzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asKQJdbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8FAC4AF07;
	Tue,  2 Jul 2024 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927374;
	bh=iuCyZDHCjUYh1ESjfx75LKbK8pm+Pveq1GXDorcZ1BE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=asKQJdbHZMp9fW5ZZLxkwsKC796lTozLhyTnmV0uIqh+G/pr/uJfZGotHs8lAVdkz
	 rtl8rCUdY6oaJKb/uqSQRdwQWSMTbjwv2QGQyzSykBhw/Rej+VGlyv6HuktFb1A9Au
	 FRk3WukAHFFCW23mnbAtwNiw7d4yWVMXzl6hTgnXLrOg6vLRg6cA0ZhX58C7jP11fT
	 YefzHYViAIejRbq+PVFxgqf0nXSMWdR1CO3kj7l16kVBFlnlqhAN7fAYzUnSgNktCJ
	 KKSLFH53Svl+IrfZUiDP6UF824tX1pKpBXU4pgqR+ezYzGi1ORpWSxi4JNuwESaNDd
	 4pAiYOZrzwBVg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, YijieYang <quic_yijiyang@quicinc.com>
Cc: quic_tengfan@quicinc.com, quic_aiquny@quicinc.com, 
 quic_jiegan@quicinc.com, kernel@quicinc.com, stable@vger.kernel.org
In-Reply-To: <20240624021916.2033062-1-quic_yijiyang@quicinc.com>
References: <20240624021916.2033062-1-quic_yijiyang@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,qmp-usb: fix spelling error
Message-Id: <171992737051.699169.5180410107372263971.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:06:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 24 Jun 2024 10:19:16 +0800, YijieYang wrote:
> Correct the spelling error, changing 'com' to 'qcom'.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,qmp-usb: fix spelling error
      commit: 3d83abcae6e8fa6698f6b0a026ca650302bdbfd8

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


