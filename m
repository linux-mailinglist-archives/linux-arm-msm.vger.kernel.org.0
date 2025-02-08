Return-Path: <linux-arm-msm+bounces-47230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C680CA2D4BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 09:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C736E3A9FB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEF019CD01;
	Sat,  8 Feb 2025 08:05:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC926ACB;
	Sat,  8 Feb 2025 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001935; cv=none; b=mOMLNnQleA7wHnK8gf/AOiAcTghDTCvJuipuTRmEsZiJLtCCwusVqZL6OGGTmDRNeg6Z8DDdTtEDjuVCxKezGKk/yr17CZO3yNYm81ff1neQXWslBTY6exdiU7D887Mj/LgYDv7PGthDCjpz+r2Na+h+Mwkh2kBPfZbJXprcI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001935; c=relaxed/simple;
	bh=wbPPDEMyvr3jFmtgy8HcllCGQwqur23bpd3k6/B2Cek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejFZ7Y/dxBPd8eEpav+IQV8d3PaeqV4rZxrQijBjwkyt5coWouvriqt0AheRRbHz3zcL5bMkW10UJVcbY6RC4jEf4zEMgnKaRF7nYqQclP7ITbOfQShY7HGP9+bTJS/PW4RL/faXdGYpJh5qy8kwaQTgzwEtOLpH75uX0dpvKcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c01:6750::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id a7bb8f72;
	Sat, 8 Feb 2025 16:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dmitry.baryshkov@linaro.org
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
Date: Sat,  8 Feb 2025 16:00:15 +0800
Message-Id: <20250208080015.553458-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <z6vspyykbj7e55uequibwacdx7uuwubtuabnsxagcudmqrfwn3@4gfna5rqiimc>
References: <z6vspyykbj7e55uequibwacdx7uuwubtuabnsxagcudmqrfwn3@4gfna5rqiimc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkIaVkoZQx9OH05ITR0ZTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQU1MTktBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a94e492dde703a2kunma7bb8f72
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kyo6MTo*KzIcFgIuLx9LAzU8
	NxVPFCtVSlVKTEhCS0tKTUpDTExCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBTUxOS0FBSllXWQgBWUFNSEg3Bg++

Hi,
> Wouldn't it be better to move it to the board file without having
> intermediate include files?

The intermediate include files were suggested by you:
https://lore.kernel.org/lkml/xmvtbib3q72tnfpcaic3vbgwilpo7yjnqimr5uk2myjgtslbgm@mlp2kqvljayc/

Unlike mobile phones or development boards, the pmic (voltage) setting
on routers is relatively fixed. (Because QCA will not provide relevant
documents). On IPQ60xx SoCs, s2 supplies to cpu, l2 supplies to emmc.
The downstream vendor kernel puts it in soc.dtsi (no device override),
so I think the include files is more appropriate.

Thanks,
Chukun

-- 
2.25.1


