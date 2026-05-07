Return-Path: <linux-arm-msm+bounces-106521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADmOBuH4/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 721104EEC73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65A1330B0C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8821E492503;
	Thu,  7 May 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCygCqTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CC4921BF;
	Thu,  7 May 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186095; cv=none; b=cK/t/KHQ9MpMm9EFRCMUsVipDJhjjHnuE63U+eC22HwhYGWUiqEkE9qYUA7gZRiaqQzouCM+qzIGsilQEL2YnFe6I6w24xe4AOyZlekA14W40Z0w+7rqI4MxDL0h2Ny/DLPuoWcWBHmM1E1/6j3x0CAe+FTyTMhheojqoJKL8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186095; c=relaxed/simple;
	bh=d9z4W4cvdQSBbKFsB4JetTff9eP2VqHJsrLuYasqOfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpmwgM973uVKIlJ09lxhrtA38FdqWvicrAVEtla/jns6++1ia3ELeDRSIVuKyfyo7LILtJuiHcJiNU+l8NQQ0cjfv0vpvWTl7EjOhl5hp78dlNlyv+Eyfv5ligr867NGCfcLxhkGe4dLUlYCf/rN5U5hKxqFTwR1lSM2JZK9PPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCygCqTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0B3C2BCF5;
	Thu,  7 May 2026 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186095;
	bh=d9z4W4cvdQSBbKFsB4JetTff9eP2VqHJsrLuYasqOfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UCygCqTkHIbbZ74gkH5kmoHPi4CASlIFNLaJeboijSbyAYh7eMAkUUx4kNmYLdht0
	 MZBAb0w3JagQ7K7LIA7reTbVJI+R3YW7ZixGV7SFLNTGd4WbMNz/Mt2ZdzRMnKjXtD
	 UlW/wV5GSgpx+1hb8gqI28jBDXp0C/sMnQK39BzcwlKedtypWXJ8y6NkbbVg61fGRQ
	 /ZxwySM8IKbCp2FVCsYewV7OKqRp3dqPvaZVixi9/8pCvvsJ7XLXc4M4iV+B4yc4M+
	 pj2FbSfjE7kFLiCbSoV4OzGnBV/+j2Ur6NM9VmKEq7kWciC82rfpWfvsAe/ZeR2NaX
	 mLNHnmQAUUVYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: fix temp-alarm probe failure for PMH0104 on Glymur
Date: Thu,  7 May 2026 15:34:19 -0500
Message-ID: <177818606029.73000.7985421402216569693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
References: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 721104EEC73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106521-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 06 Apr 2026 19:05:55 +0530, Kamal Wadhwa wrote:
> The temp-alarm driver probe is failing for the pmh0104 PMICs on glymur.
> 
> [    3.999713] spmi-temp-alarm c426000.spmi:pmic@8:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.015066] spmi-temp-alarm c426000.spmi:pmic@9:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.033908] spmi-temp-alarm c437000.spmi:pmic@b:temp-alarm@a00: error -ENODEV: failed to register sensor
> 
> This happens because thermal zone associated with the temp alarm was
> defined under the thermal zones parent node which had a typo (used `_` in
> place of `-`). Correct the typo to fix probe failure.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: fix temp-alarm probe failure for PMH0104 on Glymur
      commit: e8fae9152e100b4bb30d38b25bc9c81623e8e91e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

