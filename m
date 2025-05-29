Return-Path: <linux-arm-msm+bounces-59819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD56AC7D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 13:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D3F3BEF3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5690728E60E;
	Thu, 29 May 2025 11:32:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0520F062;
	Thu, 29 May 2025 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518331; cv=none; b=SsmyhACKk4wO1CkdZ4kIpVkDLn+8ekexgDAdHZwMkUxIh20nLbBNcEQ9Nicjkt/8hX+KHm9bo11tCN9RPtsHZaKigwu8ei/D+a61IUUJEnB+vM4SZyoc7Ty+kvTaxdxiVU67wmjlvfFSFYz1Q/ETIgKmMRhq5HRvbkVyv0Rf/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518331; c=relaxed/simple;
	bh=LLCGHmDewdKE5445AIC0pfX5Vc1itVyKydymaIpwztg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1NTue9MMGDVl7Bu+Ps9e6vYdl6JcHxuFLnsdvQ10QkTUHFmbGmvh1dtkqLY6IHVBlXGUybI+dBIFutKh9/lNBKyUimD8prTaxjqeCznhY15zn3nwSGS8ewoQp7t132+znlFrJPKy56pxaVkWugHFj9I+ow/lleS18HBwO/4uIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7PJG3z5wz6L5kh;
	Thu, 29 May 2025 19:28:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1036614022E;
	Thu, 29 May 2025 19:32:07 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:32:06 +0200
Date: Thu, 29 May 2025 12:32:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Songwei Chai <quic_songchai@quicinc.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] coresight-tgu: Add TGU decode support
Message-ID: <20250529123204.00005b78@huawei.com>
In-Reply-To: <20250529081949.26493-5-quic_songchai@quicinc.com>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
	<20250529081949.26493-5-quic_songchai@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 29 May 2025 16:19:45 +0800
Songwei Chai <quic_songchai@quicinc.com> wrote:

> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
>=20
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtrac=
ing/coresight/coresight-tgu.c
> index 6dbfd4c604b1..8dbe8ab30174 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -21,13 +21,35 @@ static int calculate_array_location(struct tgu_drvdat=
a *drvdata,

> +
>  static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		      void *data)
>  {
> +	int ret =3D 0;
=46rom what can be seen here, looks like ret is always set, so no need to ini=
t.
>  	struct tgu_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent);
> =20
>  	spin_lock(&drvdata->spinlock);
> @@ -150,11 +264,15 @@ static int tgu_enable(struct coresight_device *csde=
v, enum cs_mode mode,
>  		spin_unlock(&drvdata->spinlock);
>  		return -EBUSY;
>  	}
> -	tgu_write_all_hw_regs(drvdata);
> +	ret =3D tgu_write_all_hw_regs(drvdata);
> +
> +	if (ret =3D=3D -EINVAL)
> +		goto exit;
>  	drvdata->enable =3D true;
> =20
> +exit:
>  	spin_unlock(&drvdata->spinlock);
> -	return 0;
> +	return ret;
>  }

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtrac=
ing/coresight/coresight-tgu.h
> index f07ead505365..691da393ffa3 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h

>  enum operation_index {
>  	TGU_PRIORITY0,
>  	TGU_PRIORITY1,
>  	TGU_PRIORITY2,
> -	TGU_PRIORITY3
> +	TGU_PRIORITY3,

And here is why the previous patch should definitely have had the ,

> +	TGU_CONDITION_DECODE
> =20
>  };

>=20
>=20


