Return-Path: <linux-arm-msm+bounces-46981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F1A29A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 21:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B531887346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 20:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A34B1DE89E;
	Wed,  5 Feb 2025 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imwkpbI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8958D211472;
	Wed,  5 Feb 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785697; cv=none; b=diNvxAYD1O+82So4U5N3AgGhqdmmQRKKLRPTs8Q/0AWfwue0gW8TGDksnkvA2Wz0qQm2Q2xRCY4z8UoMu4hYb+k0BKfxN04Zw++Y4KiDYTm2Sge4IIPmWAHedUF8s1o8IhMGDhdYhSFwiwXlP1mvzdzT6sgBrqqCP/rJl6AQs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785697; c=relaxed/simple;
	bh=5iMo7L4/hiUTbWP4kJwoHzYawUN7CAx8gnO17nTMfpg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LIk7LB5MKb6U92HhXpC7kJbdowGf9UE1IKmzdtzle2CwLRifl/qmxp2WOhzNpZPa3gTATejggSMnnWIk8+CnkqNNLn/Bmp4Ao3OF0UZLISBdDa0pni3S4ruMMNbTiWroo8F2GPc3zjjMNmGtZ74IF3/qP6Z9tBkINMvie20q8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imwkpbI0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38da72cc47bso96376f8f.2;
        Wed, 05 Feb 2025 12:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738785694; x=1739390494; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UbkTgbUXqLczyGQYofRcX3t8JYWpKFqOH51mhvVnnU0=;
        b=imwkpbI05qCjMA4zOf7poiXPnt0q9s9TMoknoSanPqhv2BshEG1BBKFGgYf3ItNgHJ
         eSiWDUYyHDNlDjfaewm03FW+1mEB9l8sLLOmdQexeqlw4GyUumJzR7AqtrQQ+SFreLAn
         RzM4Bp1Y0JxtMjHXINcnP0Eq87sSw5cSAh+OWURQ9m6BdoNkB80JWKl1Fb+MJ0wfqXSp
         CJo/49V4qkZEUOr+YW1ZzgvKUb/WaSU/XFIGlmBXmrRa/URB12Uonc/ZuxEJNOR976mu
         JVUPjDF9+b0se/Js4HU+WpfQQJVVTxilWuuUTTkyEaGkl+YcGtsDK+MiaZRVVxNyVGQ6
         Gu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785694; x=1739390494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbkTgbUXqLczyGQYofRcX3t8JYWpKFqOH51mhvVnnU0=;
        b=V0Q616Wlca362UZIQzauX2n5/VYm99+JOUcoMQsJIzmi79W87cqTvx+DbdAgdI/rEM
         43qZcI7clnEPo5uMlhCwsi2WnFFC2ybwgCxbe4zPhRTvqdby0bmfkwakl1UpdYTTqKRb
         NACMI7P33erVgqT4TeeaQEOHwoppBor7SRSViA+2tEwV5ZMxxPjnC/TIQF2qSj6sllTJ
         1EiL3goCDMXuP1CgW9meO2+vTQpjeUWzxMJwp5gzQhLIcW9DPOrPoybW4sOBYfUZ0DNb
         i/3djcErsqAbj+d7AtmdLzEUscpdkEv4/2qt45o6g5BtfEBS11XVub12jfXa3ZWhuBMq
         wIAA==
X-Forwarded-Encrypted: i=1; AJvYcCU/zTs9NcYmaoZj+iCc22FMf5uLQlR12RbGsF38MbPK4I481NKbs78AkxmssyhyT3G61n27FUMykTn9Ag==@vger.kernel.org, AJvYcCWg6/i9lkKaMk8E0jFQ29Co907SpOSIH3CFEA7eaQboJ70sUo6SV/GcG1ElJWT85tPW1mHybq47r/yI9eY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3khslRAffK4soZw9ysSWAvPpjsYVy/WLVvSO470PVHz+17Ye
	eUbooDXqTi8HenvM38Ymr9Uv84NujBLYyCEFoFYY1I4LRvrzkSjL
X-Gm-Gg: ASbGncuLuMeJ6XZSq5ZnZL+ogCnyBNirHR3lB4fe88dXkz2nNgU4ofSMvm770mCX3IK
	RJ+3w2+9RTQCC0eC7h7n0KvyDFaKcR5EACUddWHwiO0H0pOQi4j577neRAYi39E++lLXKy/EkDN
	IK1bBQ6jDs0MeREHDDXJ2w/B6w3wa6M/a50X8qHlqkh+KlAO6waeMlb6Nj/c/Q5rKDd96d9r1Z4
	C5DMPTFp2w9ENpYGApVcJCqE9LxaRBS9/IbaQDp+Wpm8v5kHJg2pUWNQ1jvsSRD8VDL/7HQBrI1
	252z0d6D7/dMBs2C+A==
X-Google-Smtp-Source: AGHT+IET3MTf5g5qTtse/jPMo+vTVksupGoy1x6ir0U5AG6jovnegYODWdkdIzCBE4yaiNHRcDMITg==
X-Received: by 2002:a5d:5f4d:0:b0:38c:4a5f:bf70 with SMTP id ffacd0b85a97d-38db49775ddmr3257049f8f.55.1738785693462;
        Wed, 05 Feb 2025 12:01:33 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da1ca14bcsm8548895f8f.95.2025.02.05.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:01:32 -0800 (PST)
Message-ID: <062a1d50bacc21708fa1738022d9127214049a5a.camel@gmail.com>
Subject: Re: [PATCH v3 5/8] scsi: ufs: core: Enable multi-level gear scaling
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Andrew Halaney <ahalaney@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Date: Wed, 05 Feb 2025 21:01:31 +0100
In-Reply-To: <20250203081109.1614395-6-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-6-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> With OPP V2 enabled, devfreq can scale clocks amongst multiple
> frequency
> plans. However, the gear speed is only toggled between min and max
> during
> clock scaling. Enable multi-level gear scaling by mapping clock
> frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can
> put
> the UFS link at the appropraite gear speeds accordingly.
		       appropraite->appropriate

Reviewed-by: Bean Huo <beanhuo@micron.com>

