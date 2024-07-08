Return-Path: <linux-arm-msm+bounces-25492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73992A2E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55FBE1F22003
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE173811F7;
	Mon,  8 Jul 2024 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pdizYSDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD780C1D;
	Mon,  8 Jul 2024 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720442222; cv=none; b=JpM/dGJr3sjsQWMC2wIatte4REtpYnnDd2uFZeQvqSVlRKkSbLaxrf9oTevAeoghQr1qObWCE48uCe5g2ud7C+gG1Flzyxi7IlSkUySfJ2Kmn0aOT4/KYK3+RHNQ75m0V3OKY43BqHItnP5hdT0aAtR6PMaGngmE1yuZ8m01u9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720442222; c=relaxed/simple;
	bh=k2nKkDwz2QUcUUubz+8bTRR+mcQV8cGn88iaImb1KnI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=TROVc97HjeXuZMW9CdA3gIJie2NMq0AC/mXylh8Zz8Y5Pqgy+5e3H/nssfVOMecHwL+wWwxw4Pz9Frn3DTq5NHLHdLF6M/AkA6ZmM1v9I3VRH94+IBTzEMAXrX5D3zWSDW769YQ+iM9ZrIMwe13rzFWBmUi/6Z8igziPFZT0Omk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pdizYSDo; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720442185; x=1721046985; i=markus.elfring@web.de;
	bh=cMrB7BHtiDHWjGBwQZ00kQOwlupR+xSgXUFnmpTv91U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pdizYSDojXw7AtchFs1pXBqXpZPhlNn+TFbAaM9kML7LGKgr/csRNmmLldbRoVxt
	 MEUK+boVQhC3GawxnB0xcZfitAJEKz56c9MQlAOzU8P21PfMIxiu//odMNR5xyB9K
	 TGgqaOU5SyfsTZA9kC9wxLeg5d2umLyMtUUYF3Lxyxhj0kxfpkpvknPdr9Ehojfm5
	 Fvyg7VMI7Cu7Cwb7oBMuozkNr1jy1kog92n7+Rp+cQrlwsAKQ0LBSp6PXYPmSHcDv
	 962pDJWpYvYntkyLV0JzZ+I+GSK+ANmJtXvAhRqwxMQodQjcgDXSwOcavMu/0xmys
	 4dtte0npcteg/f+V8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpTxm-1s3ZHY41vA-00aKyi; Mon, 08
 Jul 2024 14:36:25 +0200
Message-ID: <25a195a5-9c05-489b-8ad0-909486c15d25@web.de>
Date: Mon, 8 Jul 2024 14:36:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20240705090049.1656986-2-quic_jiegan@quicinc.com>
Subject: Re: [PATCH v2 1/4] Coresight: Add trace_id function to collect trace
 ID
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705090049.1656986-2-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ppbjShWg3ECY6M4nE8zVf+rKqhRfa0Xrt77Ns2HfQrBggCoV4QR
 J3wqtpk2WFk/l1+YrOVH/JF+vrUl7fd2H897VKaOFeJBT1tVTweussO0HSO8jjEdTqeHvqC
 0vVgvhz3VR1Y3O/DkpJj9cK0xqNvuTbc0BXko4r8L2nle+pUQbGxz2Kmcla6Rny3qZF81kq
 VfY+MkxlbfrugFa+pMmhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bot9zNdFTVg=;5Z1ZIogJWU8LIfZLe0Ik57JF8te
 iLlu8HZsNBs3mYuz6h3N/8F0NqaLCgOsIasPV6QaCtyNa1UThySNplj3Qv7txKtZ9AEpV9eS+
 D5XDGSb1DzSHfvF06OfqO4PIyh6zx5cCh2MUpuqBKhh7LCt0qC8SjG8648m7GVZiFZ1LsEmUJ
 8Va3cd5cYA7fWsxLZrasMTsJTroIoOIt7RZJTOy8LyNMcO/MavtGdz8rbbxT9azQrAwsTVR/D
 yGYS/08/gEbGjXXiRwNodufHQdEU0NLb6Ho5+Aw55wYBhFsThEnhO3VyUfzdlacnAeMOTIotd
 gfmvaysZ8wNB8Js4G4UoCWoJLS8AaTm0vrk9/Rb48rpZod/I3wA5Zs1V8cKDtm9zBD+mNkeEC
 vjAf1Zufqmft+lJqGRClMacljR/Sxfuroij8QplyOwemRcWHaglivwdYqbAmjgoXoizBO4jkH
 eh7+VPSn6eIwekxtJB0huaqY3N/n1/9piLli6vflBYadlvgH+1A7p+bYKn+I23EgC3pJ64cKe
 PG7/PPgd/lfj5frRNTr+b0W6bNJbYD6X39MB9q9+MgWAlicpn+Ga5QHvJhYey4LzapXSRgsD5
 eMFladDFNfuwPNP6RDCZtgqRQjopDYjUsYLDlpmrxAhiltYYC+RlROh4AvadH9d53bOW7yCAU
 mucpSgNYPtJTwXl0RxkWtHSdn3lT0jyUoaSfL2tYHBaOMHZBAFAqrHACx/E3Mb9IqtpR37JPU
 mRmCGTRQjeKVhhnMgYKy6MP7SgyxuKPq2o++NxWfX11xbCGrowmTKK/UxzvZ494IlYcBcmAec
 JVIJ02ZoFjU9Tqj8CgVXtmTQV4DI+AF1T9P3Q0vd4Yrr4=

> Add 'trace_id' function pointer in ops. It's responsible for collect the
=E2=80=A6

                                          It is?               collecting?


=E2=80=A6
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
=E2=80=A6
> +	sink_data =3D kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +	if (!sink_data)
> +		goto fail_end_stop;
=E2=80=A6
> +	if (coresight_enable_path(path, CS_MODE_PERF, sink_data)) {
> +		kfree(sink_data);
>  		goto fail_end_stop;
> +	}
=E2=80=A6

Would you like to to benefit any more from further applications of scope-b=
ased
resource management by using an attribute like =E2=80=9C__free(kfree)=E2=
=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/slab.h#L28=
2

Regards,
Markus

