Return-Path: <linux-arm-msm+bounces-31540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D6975F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 04:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB534285460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 02:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23426F2FD;
	Thu, 12 Sep 2024 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ciVd/Z3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D746F2E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108835; cv=none; b=PUPomBRyvRuhFCIb5VloVtH7iBa5VrbADxlGLSNWXXzcTM7QBSzucKEs0gcrHJVsmQ2JvU6DRYXTO7HpdmJNYbfgObtupCPF6VKAyflVDdjhkAZ+UkiADL3Jf0nXvopHtfPQLHJAnJRY4h74Pn3pJVbfefkoHNpW5oKWddEqsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108835; c=relaxed/simple;
	bh=c6C5+9co9bNXfuUc3JS4ckFeninBzAqCfURuN1k4pZA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MT6dJTzMstF5jv9VXho0DlwO+p49T9g0f+cFsIDPeo1FMLSTejO9ILi76V26hbM9ymPNb5T7pMi33VRAgtVsQmCW7dUR8Jia7RgVveZ5xzYfJ1gVAqs7ox6+pjBOUNVhzhkZX2Wr2TZk+CiY540IoAPI8ic/U599xC3E0TxFAcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ciVd/Z3g; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726108832;
	bh=c6C5+9co9bNXfuUc3JS4ckFeninBzAqCfURuN1k4pZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ciVd/Z3gf/OUc0zm1DiU4yeFezG8V+ULE6dwuNu4o8IKQvceXfHurAM7PCm6lAH0C
	 luKNIdL1sCeQSGwUk79BGusCagPxiWjfMlnwvtkFIjPzXulNmyr7wa2JJ0WRgGJsAN
	 vgjd8M9yXIitofy6wcOVq28uVvCNoUm8IWN5owoNOATMtGFfzsb1DcmJ/5QM5UlQDS
	 6Abdano821Kg/CFtrGPa3/11x7fg9TSBJw1GREyuER9YI3xV4VWqhIl7Cm8iCuH3/8
	 mIpjGyKBaV98jFQIWez73s6nKp1nidPUMR/z0pGNyK9dden+Guk8QW3lwwGMLo/tYj
	 o+WUQmPeoWr5w==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A315B650D6;
	Thu, 12 Sep 2024 10:40:31 +0800 (AWST)
Message-ID: <354f8d1c5ef517337c9f9a74e70580a8d97fc159.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] soc: aspeed: Simplify code with dev_err_probe()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zhang Zekun <zhangzekun11@huawei.com>, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, joel@jms.id.au, 
	linux-aspeed@lists.ozlabs.org
Cc: chenjun102@huawei.com
Date: Thu, 12 Sep 2024 12:10:30 +0930
In-Reply-To: <20240909122921.12627-3-zhangzekun11@huawei.com>
References: <20240909122921.12627-1-zhangzekun11@huawei.com>
	 <20240909122921.12627-3-zhangzekun11@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-09-09 at 20:29 +0800, Zhang Zekun wrote:
> Use dev_err_probe() directly in the driver probe phase, and we
> don't need to judge if the error code is not equal to -EPROBE_DEFER.
> This can simplify the code a bit.
>=20
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


