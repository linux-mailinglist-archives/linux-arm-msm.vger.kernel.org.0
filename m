Return-Path: <linux-arm-msm+bounces-104849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKElIHkr8GmBPQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:37:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B0F47D1A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6223B30234C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6162765FF;
	Tue, 28 Apr 2026 03:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT23CfrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5477404E;
	Tue, 28 Apr 2026 03:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347445; cv=none; b=JJuv3klSai+2Ml6GIYC4Wp67apF1a+Qlh4XIksZYaRHnzKEolV+mERe1SYBk8G1vkPns6Xl1nx2o3nzOoWsW2/ZbmM1v20YFVkBo8R86zMLnBnkgI9045HJrDD2ByGuZmIp8ZdrwBHhhDcJpcHcnDz4E/468jUvLiT3O1NXhGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347445; c=relaxed/simple;
	bh=+pLxNKzVbDT5VbW3yYMkCdfxj3d2fvBuAxoNX8+DvzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gb6aCLfo1ef84DEu2Hybat5lBHNcsgVHh2hKGePGRGYS9A5nHbdcIpN+/6/I2wB0QXtKXqGGXFf23wmqdTwBth8nlnBl1e1I8flha9mgcuvc1gzJoQbKsPuqroYy4bmbxHoEPdccsE77piLsrcaMGvzotRzxNjhiIc+eBAayfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT23CfrV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D00CC2BCAF;
	Tue, 28 Apr 2026 03:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347445;
	bh=+pLxNKzVbDT5VbW3yYMkCdfxj3d2fvBuAxoNX8+DvzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IT23CfrVMSc79SX5d0gi3ajEW45UuHSSlDgQbhOmQajFuqtrSBs18b8IMfV0se7Nt
	 MOecPSIVzbbU4WhP8ENmr7txY8yADfzd7EVIQYRKOPp9MDChkWddoS34TepKHjnGcl
	 7/cLyC4CaKwyPrKUhSy6Z5qRVFFMz+hJOBcZSkiYNpQOsTQEzYNZeIT8K/BjRCEOuT
	 b7aDabXuYRAMyx4aYRftFcPoEY6P4u4RmJBayylAdGDH/fJ0shlZEdpzBOcYXUix0/
	 nd7AcW4Y6AgY2gjEmcLJ4qsfjxiPs27FRl9EmRLlenOZQRguImagw6PGDD4yjXtCgX
	 Kq6B9dIVaY/WQ==
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add PMAU0102 RPMH regulator support
Message-Id: <177733258718.324244.8879121147375028827.b4-ty@b4>
Date: Tue, 28 Apr 2026 08:29:47 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+pLxNKzVbDT5VbW3yYMkCdfxj3d2fvBuAxoNX8+DvzY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8CtxEI9oCIvXdYxO67QBx8W9YECca1Q+c86Ia
 iNea5oD/duJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafArcQAKCRAk1otyXVSH
 0D72B/4i8qf9+e2/+kJlFLWHHbMwHumSI176AQewS5L4S6Ps3sgj6Tud7kbk5tRjC30vRY2TlVt
 7jbDRsydvG7Ph+8ePBiYeUHrhd+9WmMtT0XEhW9A99feNsBA3/RVZUQyDvDt9yerYQvuVJ71gU/
 1um3fgSSf74udm32ZZJmnZO7emXgAYGwHqBI6KTeB0gStsPmcL26IV9/qYre+pzY2gzywCt8APZ
 qTzKrJCMMIcvbm2Jo9UKAmAoMyAm7svKouKysrFd4QZuw8Q6HfvWDRD9a989vyfg5S1Z2kT2qII
 Tq+ime6nQX1Kdv7nkFxhg/DOusRmx0Hq2fVCFR67wIeFwPMz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 21B0F47D1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104849-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 09:11:57 +0800, Shawn Guo wrote:
> Add PMAU0102 RPMH regulator support
> 
> This series adds RPMH regulator support for PMAU0102 PMIC found on
> Qualcomm Nord SoC based devices.
> 
> Patch 1 adds the PMAU0102 compatible to the dt-bindings for
> qcom,rpmh-regulator, documenting its 8 SMPSes and 3 LDOs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support
      https://git.kernel.org/broonie/regulator/c/1804b8a1b436
[2/2] regulator: rpmh-regulator: Add RPMH regulator support for Nord
      https://git.kernel.org/broonie/regulator/c/bb6ea5ae0b27

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


