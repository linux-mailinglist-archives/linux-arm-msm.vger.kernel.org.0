Return-Path: <linux-arm-msm+bounces-29814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F49962EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174ED1C209CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94C01A7065;
	Wed, 28 Aug 2024 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kGW+CQYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013EB1A4F35;
	Wed, 28 Aug 2024 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724867480; cv=none; b=GlBLG8jYwnURl/dX4a/xIG2EWPrLFRr/j1p0yK6GOf2rSGdAtB/HtudjTu2NGFCJW6R+Nig/IrXuXpT3LWJ0p451ZiceYiNevhJLtRx4gBouBIwBCbANqNAR6Z+KrMfDxJZhWQ+2SSHW6qz1S6nkWQQE+PTdX0f9ghcGaKD9YZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724867480; c=relaxed/simple;
	bh=Vu3wQoB9JYtFic0j/rwHtnjmjZKjbsRQ4ZzYVn+MFrE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EyPJjsJtFqGvxegPGAMtU2/+rMozF84L3TFJxEuBz8o7xyNh1YKYuAAs34lQUImWHUDBcrPv7GpvdkA41mf+t3kpnIfXYBiL79nZ2bUp6Zf6nj/VrfefFvU5QXfGNZaU8I9FLX770ScNvlxWjVsp7PHcZ2wn+O9t0MG5EhXRZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kGW+CQYN; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724867436; x=1725472236; i=markus.elfring@web.de;
	bh=LtVGxGVh9TDYbEyEfnGiuVp5FC+9j4hnBSLVAPE83ac=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kGW+CQYNBSQqkuBaq1GlK8XiqaM5ncEdFXGuAcs0O7H1i+c2bdl7L1yFVfWiu2dU
	 mum4MNqLpcUX8NUEWIjRD9BzwK7yk3l8bV4ro7fILPsMWYNOVlhvr1QssDf4Vfa0l
	 hH3orzUY//aOozH6tfT/xmjUiXssyfjGgxGj+2bzjnRNvv7CEd4rYwFflv1YTb08g
	 rMJMt6/zueAOM03ZK33l4LpoKkYZPdYu5Qgd2R0cG+/w/IqDz58F6hb7k6IhoQKIW
	 W0t4pbTLyYkmQk6HXshTeZAOx6owbktrrG0HxuyHDCx7YSiSTgfmFyllSMH1cAFvu
	 x+5tEZKE4y2iytkekg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSqXS-1sWcoE0zIU-00U7H7; Wed, 28
 Aug 2024 19:50:36 +0200
Message-ID: <7eb981c3-4a5c-4173-a62a-7180acb9f299@web.de>
Date: Wed, 28 Aug 2024 19:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 James Clark <james.clark@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Song Chai
 <quic_songchai@quicinc.com>, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20240828012706.543605-3-quic_jiegan@quicinc.com>
Subject: Re: [PATCH v4 2/5] Coresight: Add trace_id function to retrieving the
 trace ID
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240828012706.543605-3-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rjkUlUIXEG7BqyN36JwLp90ca4DoKkKrF4nYX/VqHLE5YYvtHik
 xl07Ou3U4ZCub7FNZ7SJQf0ONV00l3DsHMyLW2l+rBHK2wZRMOmnuhecYgCH/oEJyv3TPEy
 HZVG5C8we3bkP8rPl1sXSWg5Jjt0zjLmr4uPbIhAU+uqJ8Wa7P/rnh1MceCoRXg3LlDQdSS
 kleG43kfF8Koyy8NewxuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4H5l6eoKx5Q=;NFCpzLicFw+OLKbYbZGbHV7+FNE
 N3E/yZCNcIbOOsqPolIn8RztVSC7/ZadGIvqR3vkHSk7zVlFuE+akgHqp+WzFb/pJ4y+08wGb
 V7jhybsGk1exi9S2h0csm3WIYL8Lc0oxMBdxBDPsgPai9lWu4xZYfBmwMc5UBlbjU7N9FQVEy
 Pq73arExOmIsG+WppiAjQK8dl11llbnLV4sl2juYnegn4jI46kgHHRBoAkLeZH4eTASldtHAm
 KHIuM0HnKO7XlBfVV2P47mzYgX1d6NAkyMCB/VXATNscn/+XV/1dSSX+2uNklPitr+gAS7hFl
 JqZvItzuQPMwBo9DmP+MAUeifQxgtuB4Y0cnnbMYM9k/maRdR3hN9Vlaz9ic/oIRpvBWDY/Rk
 NFDIrHzwrHkzd7qCxNE9oP3F92gIJOnfTl4piCTxoHQM4JXZOev8wX48ANbyq4tibD+mjfjb2
 ZFXi8q7ch/5gIQpf9zuILyHsJwVPjQTrU1o1CG9IdDkiCxYtCMamjJUUNo37TBV/sZ5XRp8gv
 tVHcSJBtacjN6gy5jNmc85wD3ozy7YftWPxEjplqGXmsB5QxGvmJLjHJl5VxtDzEPNWMoKdQQ
 avk4uRkCR515KOGmm+TI0uWX3kdorOB95/iU3BGztRQyvE3fNlo8U1pePkuWIdF5FRle6cYNV
 ml0QMz1WtwUTN9fo1cHHjHikMyZ8ER7DIz/usbiTBZEBBhbYcEKP+h6YtKz+/JAjbXFu9T/IN
 Ufxp+aFrPpfVRcWdKhce5K7hOqDBQdoPGjSBkhYYeJ4AgBkNaZAKDk/H/76sMvyq3N9a1iIxN
 C8uSjzQq2wJD68Ma2k6eY+Lw==

=E2=80=A6
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -168,6 +168,7 @@ int coresight_enable_sysfs(struct coresight_device *=
csdev)
>  	int cpu, ret =3D 0;
>  	struct coresight_device *sink;
>  	struct list_head *path;
> +	struct cs_sink_data *sink_data;
=E2=80=A6

* How do you think about to use the attribute =E2=80=9C__free(kfree)=E2=80=
=9D at more places accordingly?
  https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/slab.h#L=
282

* Would you like to reduce the scope for such a local variable?


Regards,
Markus

