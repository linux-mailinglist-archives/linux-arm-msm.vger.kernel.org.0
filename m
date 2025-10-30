Return-Path: <linux-arm-msm+bounces-79552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F3C1E28E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500CE189C2B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 02:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A6732AADB;
	Thu, 30 Oct 2025 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="A25hRuzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m832.xmail.ntesmail.com (mail-m832.xmail.ntesmail.com [156.224.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB8264F96
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.83.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761792559; cv=none; b=NSUnp7S9R7M8L4PcgagE3SLnAQySKt/Cot4nPVz03aIW4AFA9Z5YeiTUCPQr2uNYsUc2wGGfUNtt+DstHkOy0a+VTQ4uzTMjGn13Sv0IPmu7eAw+B//RLrRZ2N431EDUlxhvG3Tkr1UhTEOeFgTJSAy8YZ5G+KmpZTimT0fmmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761792559; c=relaxed/simple;
	bh=lvw5ZlOkpO142gfHGr0wDC8vR7qP7Ne08TiImHbYoi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4GXQChi25K8jhg6cbFY3kAcms1ylEQTLc0ceQKnQ7vAN578V/FdrbU6vqIHHgm4WWjsJPSOqNtOO0VCThnp1U4W2IMNgrYViNgJ9M+QFkR9L/8vldqupXI7sshekwuZYeWnJZIVBg7/UrKwj8hMXA+o+B0fnAR22VilsP+iU5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=A25hRuzp; arc=none smtp.client-ip=156.224.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27b5ed410;
	Thu, 30 Oct 2025 10:33:49 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu, 30 Oct 2025 10:33:35 +0800
Message-ID: <20251030023335.10188-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <90175296-7a38-45e4-b53d-1b79317975ca@kernel.org>
References: <90175296-7a38-45e4-b53d-1b79317975ca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a32f6d95009d5kunmef44540d43d934
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSR1OVkhOTUNNGB4aTB8aTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=A25hRuzpkExpQ7vJTI1AaOaTbL5bMapNKfk5ot2LwXMR8IRleSMOArEvYnpVLLPCCgv2nXlxEc1N5qDlBI6xsQVqASF7fqPrJaIbvpA5qqqyjvdY7TW6p5ik298ihE7uflXyS6wSQeEz5b2hBK946Jt9nXRJpPly7xsBE4eOdwY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=20b+ONHXDXR5CXGwKs8X5FBtt+H61B5bSMVGX/Mkvnw=;
	h=date:mime-version:subject:message-id:from;

> On 25/10/2025 14:27, Hongyang Zhao wrote:
> > Add binding for the Thundercomm RUBIK Pi 3 board,
> > which is based on the Qualcomm Dragonwing QCS6490 SoC.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > Cc: Casey Connolly <casey.connolly@linaro.org>
> > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> 
> 
> You ignored comments. Respond to them and then implement them.
> 

Hi Krzysztof,

Sorry, my workflow was incorrect.
I will use the b4 tool later to check and send my patch.

Thank you!
Hongyang

