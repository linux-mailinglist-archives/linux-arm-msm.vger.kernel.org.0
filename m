Return-Path: <linux-arm-msm+bounces-61572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98FADC680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 661837A5C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ED6292B5F;
	Tue, 17 Jun 2025 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vg3Bnd/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0C21B91F;
	Tue, 17 Jun 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152674; cv=none; b=jaSkTacU/E4TPYwmYZwGDdH2drKhU4tnQCrpwfbNWzbn/gdaFX85qx7FGkKb6ST67gY54Nt88J1dDjqXsPjSOC8b0IT8nPNU2pNYISHg20APOC94yBJVZNBFwIk5JwaNubh3Tl/tURGcSnxWX4ZSt2ccPEHfe+Xt9uGlizvq5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152674; c=relaxed/simple;
	bh=nu2hjN4b9TyZ+tFtBQLhEmYKvLPVNWjy1Dx0+sy8lEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eEGqBSj5y7xa5C1i+r+gASuoL5cX5aLtJeigGD/e1zFcsSbw/cKXTpirlieKlDOO5idtxIW73hnbWR99Vv2Mo4faRqtPdeTH7btp6OA7EAWzP32pcIk6zJ21YI+JH/fRh2twyew+c0Foyw2ZIdFHsd4HN2wPJL74IeV8yLK0p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vg3Bnd/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA43CC4CEED;
	Tue, 17 Jun 2025 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152673;
	bh=nu2hjN4b9TyZ+tFtBQLhEmYKvLPVNWjy1Dx0+sy8lEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vg3Bnd/WKTFPcnuIohV2mcliKrxQJGTeURjXZEkR/ifEE2dmZXgTsuo9ajhm80rXb
	 eqjosn97HvzY2/xohCSzpJIgXfOwj8cgy/pBmbeXIZ/3RYJctZ6MvqN5HNq0A318Ao
	 LfHw55A0wEtmwkt+odJnMtuiAeYpOIGxJE/P48PgagaWkoFl3rPaOcuMuktE2g+hQx
	 WGWGp8j0b1+p3U1KvH1nspwUrL3nLqWPr/C6wB4AY6RUPRRjF4yunWxCt0IGgNTLi7
	 CfJD6eGZIq7xaqRDcPYaXzqy9oRfWDrD5LQMgIMWbHO/wqVvrXE3M/3AVYYdn+gedM
	 cUPsG4xx6b4lw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250425-vdev_next-20250411_pm_disable-v4-1-d4870a73ebf9@quicinc.com>
References: <20250425-vdev_next-20250411_pm_disable-v4-1-d4870a73ebf9@quicinc.com>
Subject: Re: [PATCH v4] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-Id: <175015267132.23180.13399990237992618967.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 15:01:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 25 Apr 2025 12:49:31 +0530, Vivek Pernamitta wrote:
> The QDU100 device does not support the MHI M3 state, necessitating the
> disabling of runtime PM for this device. It is essential to disable
> runtime PM if the device does not support M3 state.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci: Disable runtime PM for QDU100
      commit: 700081f7c15577de4d3281528aaa6ff8bc3cafea

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


