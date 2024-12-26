Return-Path: <linux-arm-msm+bounces-43399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487DF9FCCD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F4C163365
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7885A1DDC0B;
	Thu, 26 Dec 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtuuASnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A91DDC07
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237654; cv=none; b=eronEtiSYdvA5kk1MDxxUnzYCILgrHXubxNwiEZOxRs0qbE427h+KRmbIzKGfmkiatqlaQE+tUt7khtqyNie8O+5fk+h2zCXON+QaOHsGbgsxknqFiPI8NzaSJZaXgqOsHaWMYVpkhJIn99jlZHqurOQRt99yEE2bPcAjwKQ0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237654; c=relaxed/simple;
	bh=1DPQtXeY2lW4ULK4iYAuWa//tALBbd3EmRCjgsaprJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYK1HoyPHBOdcHLNBWLAPtA41434mbaGznlm13vEXAy9wcLj4H0d0s1jf73zdCgINz5/9jtHaYJJGcVzwoGr60zdgb7ttrUy3K518tTVF5l2njKIQAr8f6FEknWnzCPz9ENVWGpunsjfd45VEt0+7Sqw4cW5UFxtJ9g9aidF4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtuuASnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8C1C4CED4;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237654;
	bh=1DPQtXeY2lW4ULK4iYAuWa//tALBbd3EmRCjgsaprJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtuuASnONPuXpFz9lBbd/Qlh53Q0kavG0jffFXYRTiZ7AgockVjUaA9z9zv/si+KI
	 aslPR++1AAHZsy69utoBEYXZdH7hkrirt1t4zWEaKHAqVvOvYU/oGzm/4LCtBfg30l
	 ZspD3dW9dsuLe1gkETcaqtNCVFnmPCD+BbQ6yAHoc7qihp6o1QHNsR5bxW207cwfyH
	 +6cVxd7yRW20q+Du84vlMKX4ssu28PquqUlhEwwMcZ+A+id1snxLw0BEwZQvwM3WWg
	 IExW9rBatfElMCY0ujC00Ng8xv6LycVEPYbR7AWNdb4oeZiYBIl2P7GueBXduNR7fI
	 unVwH/Lp79hBA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Petr Vorel <petr.vorel@gmail.com>
Cc: Alexander Reimelt <alexander.reimelt@posteo.de>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: msm8994-angler: Enable power key, volume up/down
Date: Thu, 26 Dec 2024 12:26:52 -0600
Message-ID: <173523761392.1412574.874264828976839558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241123221708.862901-1-petr.vorel@gmail.com>
References: <20241123221708.862901-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 23 Nov 2024 23:17:08 +0100, Petr Vorel wrote:
> 


Applied, thanks!

[1/1] arm64: dts: qcom: msm8994-angler: Enable power key, volume up/down
      commit: 507aae9a3549cd173d8ca5e896706e4ca92c15ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

