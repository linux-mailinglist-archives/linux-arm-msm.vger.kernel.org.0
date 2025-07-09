Return-Path: <linux-arm-msm+bounces-64224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C817AAFE838
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354474A5A55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4B82D663A;
	Wed,  9 Jul 2025 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N6Qx6lO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABF293B5F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061731; cv=none; b=ux1ZRORo7YwP3w78PcWsz/iQ/E6o8DQDL5ZB3lXylhr8jUtc04aRTe4LCShDTzVedoFGZyRzbF+v8VCip5WEdDLP0BPKgxPIQahXrfoQDSLsFjGp8xaZQa35GZ8WjUjYGywwD19hlbvYyIJ5i+vXuL9zJ6Ej9Cw5ArJ+4wSYpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061731; c=relaxed/simple;
	bh=LuFaLCJ0xTPoiWwHiRW6DMu6C4be3/3wdgnHwU5aw20=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XyOOmitsxuY0A7l+DqGSzJrX1PO879OsUFAeRTOP9qsE7bezcedks/ZvefdZ7ux/OvPj3GwyJGN1fZfeMzyZGBgEjYe572Ee0kkP7e21+tPduRUdCQKytaXTHxsqCr0e+UzZ6C9rD3fgBNur49CpLaP3Hm9/qZ4iwH2AiVkQoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N6Qx6lO2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae36e88a5daso1058179366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061729; x=1752666529; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=N6Qx6lO2URXqxTheYpr0pbnhSDFAlFwTG/3+A0UDlh+TWi08qhFU7NLS4kHfJ5RkLc
         fqRyFyyn0x4JezJj6FOUIThCMs/mSSa7+IVNYFO/dejS4h+iFB2f2euXiN/jJpJ77mDJ
         n79c+jZGUU/mH7KnKAt/sJ/XW/eY6e616pUK+Y4m1F1gtljFQ5wsFy8r/JSUe8uaWx9l
         apeqCUr1j11/vrv543D2c5eUWITRibL2488RJCAlN7r23isPhIPVIYdUL1nT4sDtmqAE
         sne5ox5AjQzs9q3iDVt6MwYHfzlloI9WirB08iqZ5SMWr7qTg+hFeNWd3YcppJ8vH7Jn
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061729; x=1752666529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=f4UVW91zUiu5y+4/5yNIt696n6JvQbc0Sd+3UsAdM2wAsGeMiLU77H5CLKzJwolDhg
         b8VxsVIy6db5bB1B9HGM1GvbKtC4apXCmIH2rrpQsfh06c8o+mVsJjJoS81L1tAEoQiC
         U9ixXny+iddohD5QzngsH43A7Q3SWkfwq7aaqzJhXB/Kr4xi1qTBjSkhuLEI8Lgh3Q71
         T3DD8WBGwh/pO1/VAL5qf9ck2PCH14r3oueq2Tjf+JIl/YUSysdEVClTNUhLFPDI+rOM
         1zYRwU//5E7upm47tj46HYofSFGhMqHvYc/F54U36U7Up9F+I+fGIaWr4lJ5mbt8FNaF
         hz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvOfIavdyEuUz3gDFe/2ifUNrUys+dxLD6M0sQUhwATzdIQJOo5kBROtpxsn48w+HlMi7xKJ3R3qhi26Kk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf2wRV14AoR1h+MmD6fCa+znr47bJGUJS3ZvPK51F63ot250+Z
	+/sVTATpuJIUDjrumqDIA8SdGiIIHnFtTf/QlAWeeZVbHdzAwMaCzFPAdr1UPqwxCyY=
X-Gm-Gg: ASbGncvma5VnXVo1VDguiPyYNxMjgykAXhHY5PNkhDaLOlO5H3/O17VW1izlzu/gDKs
	m4y20gN4hbEzUhOzFvzFhxueK7Gi0W3lz+LDp9qCj1ncKPfWghpRb80gjY1bMBW9pKbNrF/c3JW
	5RCtbY30jNT4opnPKP0cZkF0F30baD6s/skKYrIzkZHpFF4MOST9IIqbi/lRnAXBbFMRMHljchp
	GIdYnQEgIjwVoccFhaL9835CzvwrJkoIrNITlG9eCJwR/89+EioxRwOkdMzjWkjcmjxT1FExm8s
	bFzRWRwPxIjIjYiVk95kgsicygwSrOQOHW6DNM6ncP4J9GVOsv6Tp4akUvB+Qci+FfvqHi7z9o3
	ArcYTjfJhqXvwGsY5NJY7HkXZU/TNQsM=
X-Google-Smtp-Source: AGHT+IFHTk7KUMsYqkCmoCKYDOQn2JjjlDGYad8nB1UbcgqlsPnK+ZRxIkDwhxTp1MQMCfkMx5xzIg==
X-Received: by 2002:a17:907:f816:b0:ae0:a88e:6f20 with SMTP id a640c23a62f3a-ae6cf5b81dcmr253307366b.15.1752061728625;
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm1091150266b.107.2025.07.09.04.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:48:48 +0200
Message-Id: <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Taniya Das"
 <quic_tdas@quicinc.com>, "Ajit Pandey" <quic_ajipan@quicinc.com>, "Imran
 Shaik" <quic_imrashai@quicinc.com>
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jagadeesh Kona" <quic_jkona@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
In-Reply-To: <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>

Hi Jagadeesh,

On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
>
>
> On 7/4/2025 12:46 PM, Luca Weiss wrote:
>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
>> allows users to move the call from the probe function to static
>> properties.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/common.c | 8 ++++++++
>>  drivers/clk/qcom/common.h | 2 ++
>>  2 files changed, 10 insertions(+)
>>=20
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f=
72603b694966e216 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>>  			goto put_rpm;
>>  	}
>> =20
>> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
>> +		ret =3D qcom_cc_register_rcg_dfs(regmap,
>> +					       desc->dfs_rcgs,
>> +					       desc->num_dfs_rcgs);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>> +
>>  	cc->rclks =3D rclks;
>>  	cc->num_rclks =3D num_clks;
>> =20
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac=
9022e608a6aad35f 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
>>  	size_t num_gdscs;
>>  	struct clk_hw **clk_hws;
>>  	size_t num_clk_hws;
>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
>> +	size_t num_dfs_rcgs;
>
> Since all other probe configurations are added in qcom_cc_driver_data str=
uct, it is better to
> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_de=
sc.

Dmitry suggested to use struct qcom_cc_desc:
https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2=
rjacvzgj44vmf@auonp4ugbgow/

I personally don't have a preference.

Regards
Luca

>
> Thanks,
> Jagadeesh
>
>>  	const struct qcom_icc_hws_data *icc_hws;
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>=20


