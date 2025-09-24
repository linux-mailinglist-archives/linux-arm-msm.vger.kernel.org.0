Return-Path: <linux-arm-msm+bounces-74617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F067B9A8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D8F1B25E49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D5F1DFDB8;
	Wed, 24 Sep 2025 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="b55StsIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647FE225401
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758727022; cv=none; b=Q+dWJpo3cl9IKv8BWSQ8aSnv85HJfbAMMYkZt7RWBOdQQoBGsYmrChI7UbfZeB/5XRm9kfPxc8T7wX9X4RomKFpTR+eEzVbA8gcxYDiHJ0shkNCpLLYA5IlinLyg64jmfMbjbJcOU7Wj3cNqgyKqFeb+YCS2w4zfC2ML4QwXOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758727022; c=relaxed/simple;
	bh=G9s8h+DFdmZLoowPgxaUCOF+BjpHZtYG92ZpldD2Fek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUImDs2DhYp7+EKUEceTrWorQefI8ekyzHzni6Vue80xruwHtjAy+EwF5eEpb7hPVs0qMtkNlvPqbsPl53eTzHqCATiGHiyWd+8hMKFslDOu79cXtnVykWNzUirHSjN925KS0H1zQcInHzv40P+npPGISOqbyiAXH70QB1igAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=b55StsIr; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [113.235.126.201])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23ee9bd72;
	Wed, 24 Sep 2025 23:16:49 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Wed, 24 Sep 2025 23:16:27 +0800
Message-ID: <20250924151628.9984-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <23e2d458-1ef2-483b-b87e-7e8b52d90eb0@oss.qualcomm.com>
References: <23e2d458-1ef2-483b-b87e-7e8b52d90eb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997c4c72b509d5kunmde2ea66838b5fe
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSBoZVkwdSx5CSU9DSR1PQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTVVJS0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=b55StsIrP8AVWwqD3S/02tTeRhBeQHRbvZ16J1FwJIGS34NzAepOWrUcsZQnQoy2hLatN+AqdxMeuPnPhAMEoTaHn5g+U/sAmN0Te9gGggRc/q/gCTRNfkVi5JtdDB15UU/ZA3ODbsZdgKaFrxPYukXTNE/BLlRPa3TKsvj1uEg=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=kNR2j1yI2D7pGqwKqu3TOCD20i3ToA+gy9DDHn17AmA=;
	h=date:mime-version:subject:message-id:from;

>On 9/23/25 8:43 AM, Hongyang Zhao wrote:
>> From: hongyang-rp <hongyang.zhao@thundersoft.com>
>> 
>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>> QCS6490 SoC.
>> This will add support for debug uart, usb-typec, wifi,
>> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
>> and some voltage regulators to the board.
>> 
>> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
>
>Please fix your git config, so that it presumably matches your
>name found in the sender field

Hi Konrad,

Thanks, I should fix that.

-- 
Thanks,

Hongyang

