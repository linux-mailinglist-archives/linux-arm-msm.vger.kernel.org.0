Return-Path: <linux-arm-msm+bounces-21382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 325648D72DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 01:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFE32818D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 23:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E8A4500E;
	Sat,  1 Jun 2024 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeHNRvPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051B1EA91;
	Sat,  1 Jun 2024 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717286173; cv=none; b=HWCD6S/w8wjZS3U/4mEXRD8ekhlH477EWO7NoqulB3kVLGnO5E2DVrJ5ZkWSpbjIqH16A20KSZ9fBCzcqfaXpuWsSRMmjTPChqIDpZbRC2OPdvNYcdeWzgFmDttGrO7+rrQGGlVxiFaCLsj68BNoBAD+cjywDcXWo2WASWYASho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717286173; c=relaxed/simple;
	bh=8XwwMsiULlR5UpZba5VbfZR8Iq2Le3N3f/pvR70D2vY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bmna1Jf27A9Ijsov5HRlXWtKa4nl0drbtt9V41qqfbTEZomfcHp8M+uqYMntT6Wxwmr9B3+plhrVoMGr0sLOgoBnc0CrBVyG+gpefDN38tTUylgKPfnYGkZc6Yjva5zuTgDnt9mpHmxw4FxOGTwPmDUzAFK4RKoy9KHW17a5UDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeHNRvPk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5D7C116B1;
	Sat,  1 Jun 2024 23:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717286172;
	bh=8XwwMsiULlR5UpZba5VbfZR8Iq2Le3N3f/pvR70D2vY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YeHNRvPkPNIeRQWZOYkqfF2kv9uGQLztt1Meh7H3OWRFFnLOCPsHYNj8Br6Zq332C
	 wrrAI4k1xTxsWXVI/lEoy7Gh17J3fU13YjlYnSqI/CSwJEsZMpcGUYwx1q24g9eqJY
	 s3Arsbp/gucbfWw8j0O6EWmv0KdB34NucwNY3XR9SGjCZejmXNI7olw0qyk0RglYnu
	 1gEopzQtpF6VtDxJWKB13gwjq0+EeGFeYqTEHbNvKk/hWBrrYWZKMty+08yuyRa6SD
	 hqp8RSTWxYGdS+L8AZNy2/qiDDcPSdRkJ1YkpWIw+o6IKznnwGf29Mqn0k3pBVXilp
	 9Lpz7Su4Xw9iA==
Date: Sat, 1 Jun 2024 16:56:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sarannya S <quic_sarannya@quicinc.com>
Cc: <quic_bjorande@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Chris
 Lew <quic_clew@quicinc.com>, Simon Horman <horms@kernel.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, "open list:NETWORKING [GENERAL]"
 <netdev@vger.kernel.org>
Subject: Re: [PATCH V2] net: qrtr: ns: Ignore ENODEV failures in ns
Message-ID: <20240601165611.418dd7ba@kernel.org>
In-Reply-To: <20240530103617.3536374-1-quic_sarannya@quicinc.com>
References: <20240530103617.3536374-1-quic_sarannya@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 May 2024 16:06:17 +0530 Sarannya S wrote:
> -static int service_announce_del(struct sockaddr_qrtr *dest,
> +static void service_announce_del(struct sockaddr_qrtr *dest,
>  				struct qrtr_server *srv)

nit: please realign the continuation line

