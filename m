Return-Path: <linux-arm-msm+bounces-36459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB79B645A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454881C20992
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245971EB9EE;
	Wed, 30 Oct 2024 13:40:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CE1E570E;
	Wed, 30 Oct 2024 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295651; cv=none; b=QZe+to5tqUxpQRHqLsdakRFDN8HJCKSRPQ2cKO63oFxPsPnFxb1BIxu73/5zszTryTUOy/mZTGfgkddp9s2wt8QdBJIgS5mWhAXG60kwwSBWbmoJC983eVJ+gf9CIFF2phRwZp/50e+UpKlhGLuRDaHTilzN9wEFTI9X6B97Lwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295651; c=relaxed/simple;
	bh=3CF5SW17LqX7ufLrQVAuxlnJAC1vVC/NA66X+hKZa1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RfJMzzRmuBVwR3JNHuAIfZughykf9+TIAVLHYHyvXqX8lOXFTTckYWaDicoNzq4lkZ03pMLm+PK6MWZ82tU+zqx29nLlvO115WDfxr8p0+BjA9c6GpaSbkneOwVArTdXXNyjSsoIQxgL/M3gctWpx9lm7mUb8DcokhvCBw5so9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [116.25.95.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1515cd61;
	Wed, 30 Oct 2024 21:40:42 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
Date: Wed, 30 Oct 2024 21:40:39 +0800
Message-Id: <20241030134039.488706-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030133015.487183-1-amadeus@jmu.edu.cn>
References: <20241030133015.487183-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUoaVklMSE9KHU1JTkNDTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUpKWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a92dda83b5e03a2kunm1515cd61
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OD46Dhw*NTIoHwFWGjgMLiEL
	PgswCjZVSlVKTEhLSUJOTU9ITU9JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCTlVJSkpZV1kIAVlBSENINwY+

>    arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
>
>        The early version of IPQ6000 (soc id: IPQ6018, SBL version:
>        BOOT.XF.0.3-00086-IPQ60xxLZB-1) and IPQ6005 SoCs can reach
>        a max frequency of 1.5GHz, so add this CPU frequency.

SBL version: BOOT.XF.0.3-00077-IPQ60xxLZB-2
Sorry, I made the wrong typo here.

Thanks,
Chukun

-- 
2.25.1


