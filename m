Return-Path: <linux-arm-msm+bounces-57595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A4AB329B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 11:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28981887A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ADF25A623;
	Mon, 12 May 2025 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msGuLrHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253725A63D;
	Mon, 12 May 2025 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040319; cv=none; b=tlKKEvxVrKfKu8vzRSQni85Gn5RPJWAoqNDkALfb1azcmvbVRy0yi+Xi3+LSd8OxivfqKPP9ua55ijHpyGxbecSo7BaZ3DBMNw8BmODadRg1ZbtdQJtQuddD42Uv0h3ZiqWYaLCBptV5h0GtBMeAUJV8NCSjHqBoylwhtdFUCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040319; c=relaxed/simple;
	bh=A7P8XUPXv6zRLcCTZFqD9dlTu6yVWVAX4HC3mjQThoU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gsKjr9a6ujLnBjVGxHl2p5phxLQHVy67rX2BbD/yfOfc/tgnxwM4NYmtgeC4BKNFEuc8HqJJ3VVe1YzkoV80zk+rCm+fxLpRISX6kIEQJgslj48wOaNUk5JA4+EFEd8MsdmXP1AyOCuUCV7R/neRwEIayjxyqlUrBpyRlnP9Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msGuLrHp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace94273f0dso806655666b.3;
        Mon, 12 May 2025 01:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747040316; x=1747645116; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A7P8XUPXv6zRLcCTZFqD9dlTu6yVWVAX4HC3mjQThoU=;
        b=msGuLrHpi06fJXS4DEn6xwwPl3KbLOBlCVy4meK+POOkU26oLfs9YUpyrhTSBcTYC5
         jG2Hq1Xn72oVvuSjXY/n19xHH1wLcsRYQNOp9/NmQPePlG3yXHnWOKmqACqIomv0zOrV
         whqnO+Zqv5P5VcOIjtcvi9PF594K1mpd6Bh02x4ybk8jprQESBOlXtyotu9naR8xf5sS
         bEGBRhxQzSKARuvsInvbFXJik2wd7XsvRCQYSXqlcpFiBx/khTi0OTQ7hL2Iir5g6bJu
         VWrmv45IclDN7kmW7+8AChZT00qEGx2tmB5p/jTWbGWFoq0BU8dwP9tmdHTYwtgMThEA
         JdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040316; x=1747645116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7P8XUPXv6zRLcCTZFqD9dlTu6yVWVAX4HC3mjQThoU=;
        b=qEvI03bfQPRL2gpETQevfy22m+UBch/ZH4t9+eIkHx2tktZ8RZW0KSQkj1X8JFfnHN
         aGErN5BPv4K9dglsd6NvySzYGV5Go3EtXFFhMH8gUwIAZiwSUq0tnVb6n/f27JC25PIT
         D4X+IfAkjkLbPmO+dgveDBdGtWt+xrmxR06mBXPywG0ejOCEscVCxIgyM1esm+qec7zV
         BHIJZablEYr00VjCHmYgPPMeo7jNaQUQV+vzyVAUEpmQbBeDHgOK7JO+Dfb9O/7l5wxh
         lWxnY7D6jCyvmU7GvtKTPcpxqEI2cWFoSebo0lsoSsA2JOyD2foO5Cm9dIf67zDdnXiU
         i6pw==
X-Forwarded-Encrypted: i=1; AJvYcCWo8yBVZkT6tg4lcKL59wgvOw9V2xK3RiurShNm8y5VsNspocu8wddirQ6wg4NbHUwAHR6uOzBlnw6oIg==@vger.kernel.org, AJvYcCX15gV7azWWdv6N/vL4YRP5yQeag00K3QMhweH5Jut4Ct/pa4z7P60VzmsTx09aOuYnA60YOIIP/YAIooU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz7LsNhUaXoDKXiK2m4MJPuN573vowo3CuD5n4pjQY9XklkmBy
	+DdjMdA/FocH1BHtIXDxMRadkwHr+SF2pB3HLxCfN06K7CEv1KwC
X-Gm-Gg: ASbGncsfWPhd0Ur0OnjQnufqsVbTws/dBp+D49XnutVsOUVmt8nKlJXpFW4v8Jkepa3
	5o/iDiKJ7j0oq3WP0W/I5jH4IaBxrT/k3glNO02ujqrnZuyFlwbshKh3jIpmqgT3yO+t95kefVR
	HayjrWFx1Tl+1npOmurIeE8JBE2KvWxdS9Zwyhq8OXYPG4G3yLu/Yifcab7b6/HTtdhCWIZERM2
	wQTiWTGnvFcd1U+3KfYVAH9eU9IZHIPRKFf6CdmIsDWYJ6v+kJwmM1HkW7mpf1kNMyQ1elWlj90
	udIfgma6TtrlY3db0mN7M8TXqyyLWlsEiTvgTCKlSHSYc9944Xm6Tg==
X-Google-Smtp-Source: AGHT+IGeqWIQDxmfP89wFb+3ktXSBHf1gFxheovUtgKj4Mon4MoBshJI9dMIu/Mj07TgMoIJaG8i+A==
X-Received: by 2002:a17:907:6a13:b0:ace:8004:2a87 with SMTP id a640c23a62f3a-ad218f1e3d7mr1226887666b.16.1747040315688;
        Mon, 12 May 2025 01:58:35 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198b6ebcsm582162766b.185.2025.05.12.01.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:58:35 -0700 (PDT)
Message-ID: <93ff21984da1fcc67a5d99e4f68fff00572cf59a.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in
 clock scaling path
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org, 
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com, 
 peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Mon, 12 May 2025 10:58:33 +0200
In-Reply-To: <20250509075029.3776419-4-quic_ziqichen@quicinc.com>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
	 <20250509075029.3776419-4-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-09 at 15:50 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> ufs_qcom_cfg_timers() is clock freq dependent like ufs_qcom_set_core_clk_
> ctrl(), hence move ufs_qcom_cfg_timers() call to clock scaling path. In
> addition, do not assume the devfreq OPP freq is always the 'core_clock'
> freq although 'core_clock' is the first clock phandle in device tree, use
> ufs_qcom_opp_freq_to_clk_freq() to find the core clk freq.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

