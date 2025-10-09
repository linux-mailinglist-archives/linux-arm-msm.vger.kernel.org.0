Return-Path: <linux-arm-msm+bounces-76632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9DBC8C20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 13:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C57E3A3833
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 11:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FF72C2340;
	Thu,  9 Oct 2025 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="JVhNqty+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973198.qiye.163.com (mail-m1973198.qiye.163.com [220.197.31.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9452DCC04
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008844; cv=none; b=VxHShBojWqXOmSlFvUcLskh4+Zcu9eUUACH6Egkryi5G2xxspzPcWTKVpSN3/5wDsnV7GGWtt2tA6zvCb5Ca7If94iH5JbJ0HXFs9607e/otCqJlhJqarg/y/da0gWD3jszeSsQWY9gFAp600rpbJ4ppjIy3PU0IgaBVm1/sumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008844; c=relaxed/simple;
	bh=683eplXecpV3mO/PNwac7R2FamvLWw3mQ40wgkBfXdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nw5NOM7zQXmNwhXFNczYM56bnDuPwguMmv/l6FouwQHCg6UredP5Jg1GyCmMzSyzeK47EF+YjsPOW2gAmElpWKhh1XB7DnLtbambYeOGHrBzduj0CJ4zKSxCIyOy3/DU0IKdBbgsvDkWmo9EoYdopQmcP2ZK9hYW+z+mX3rGrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=JVhNqty+; arc=none smtp.client-ip=220.197.31.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 255210424;
	Thu, 9 Oct 2025 19:05:21 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu,  9 Oct 2025 19:05:10 +0800
Message-ID: <20251009110510.23698-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <92e387fe-9481-485b-ba1e-7eb6d520dc77@kernel.org>
References: <92e387fe-9481-485b-ba1e-7eb6d520dc77@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99c8a59cd509d5kunm0f93cca9fd8e06
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0tDVk9NQh0YHkIaSR9KGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=JVhNqty+DnbqpqxrrQWbgjsj//V0aS2v9fLKlzmTh/5GmN829t+5L+aFOIMUlKzr6+E2WjXnHX3JoPEkikgSCYQ7BOoTe7dHDCRUh3/MT2PgytPw1x0oV9tjno8mVULV1jRhxeCleQ3oO2T7HXX/9w86uGngiYTyH/EmFHXtyrg=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=YGOvp9Ha0h33sEs1H8NBZDRRuubyE/Y9un70WVREDUs=;
	h=date:mime-version:subject:message-id:from;

> On 30/09/2025 13:32, Hongyang Zhao wrote:
> > Add binding for the Thundercomm RUBIK Pi 3 board,
> > which is based on the Qualcomm Dragonwing QCS6490 SoC.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
> 
> Best regards,
> Krzysztof

Thank you very much. Understood. I will make the adjustments and resend
the new patch. However, since the discussion on [PATCH v4 1/2] is
still ongoing, I should wait a few days before sending it.

--
Thanks,
Hongyang

