Return-Path: <linux-arm-msm+bounces-90940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +APMKIDleWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:31:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F69F7C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBC3300B129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E442F60B2;
	Wed, 28 Jan 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMmpt+tY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PY+joWuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122542FBDFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596204; cv=none; b=J7KfKzlg9iDHZidZsI21rhw3OO6nEcL64yg2bpxhv81/E0y7pzo3n7ON4U7Qznt5JdKu5bgwixoXmzaKjrIR98gnmBYkK/DJWO4Kx0oK8Q6zSHY67dSJgiHGzsuzaiiDyNkBz/B+YmiTECvejpi2Nwa0pmSA2DhCRgJQWmIHq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596204; c=relaxed/simple;
	bh=Ku1dicgL2xpotWHSMBu9pXBNXEFotq5+e2fMmlKlf28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USE16ahe9LC876pi89cM/rVoU1FvMaQsbdSaKQzMwof9cFGdYzeG9xt1uVhquZOfupTtDJaI0wdVng6gvhqArJCtXNE+Bj8P1i/ZM7alcyJqEYUUDp3PoVd9vdJkIMVUGDK5RDHwbitrwZtp4bX7+rPfvOPLhkbpBuCz7fRLHBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMmpt+tY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PY+joWuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91oLg3442235
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sNgo83WOwXJW4+gUjlHILnrYJlHZyRwyZOx9BXqRn0=; b=SMmpt+tYOCKtv4we
	/AQhuxAhvoEhkenJJDs/NZq5yVLfo0S93hZLuSIP5/H5RgdO6RvQ0Q2O2BifWC3N
	zH/ihOn9/h8ZgeJFLEHsk6Dl0Z20/SuPiHK9laKXFXcUkNTU9p/BQz3jiYdxTrks
	RRIzF0g1reJ9Wp3UBd94OULESQmSsgYkwweoA9n7ZocClClk3Sep7xcJZUW1fSTf
	bf0tkkD1AfAOPYdfkRmJxbT18UXOdbbq9Nr4xcV5FC7gjkilC544n59tnimIxjkk
	j7+V26ppl3N3VPZyUc5bhWLd4p3WOOu+LpoxA8s/spCpM/2t77mwnhgvicqdhP+h
	jEQ6jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanah99u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:30:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so47353685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596201; x=1770201001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sNgo83WOwXJW4+gUjlHILnrYJlHZyRwyZOx9BXqRn0=;
        b=PY+joWuWCnzbwfVCekhjwfHhPdFxd+Pw7FbsQYp18k3S7MGjwduBMVPZ63Ch78SKGf
         rZxzNNb0AOe9qqxQ9H0cjX6820BQmk/4phcGRdstch+a+1FvdfSVdEQp6i3dWW9CuzgI
         QWIoDKH4KpyBRZi9AboGjAsMqJzyKzUVe9uCAEhLJ/uNK5SfeeEVyOX43XAfKO1FwdJY
         RwppJ/xLjgFNXiKzHYj/aKd+VCS7dnAG2FRW16Ra86Kyef/lvdChHKKVevM/72OJdg5Z
         T7eQhEXAmt9cIMjXqe5Kf3CPOhbaIphId4v6zMe6/Wb1kN7v58r3w6Hax341/pgq5MdO
         WDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596201; x=1770201001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sNgo83WOwXJW4+gUjlHILnrYJlHZyRwyZOx9BXqRn0=;
        b=J6AqBzlmokKrZ4eDGHT/BCXLajssjiNwoAgN/S72U9wkX9kbgQTE8WGEq5lo98gLj1
         MXaYUllXtWBZZRvbnBb9E9Iee/9mfGC+YJfFNejjrrRp73w/7XTTB+8sn0k5c5TZB9FB
         YfW17pNUgzUO0gLWWYjV6F1pi+e9ecqKgMjcwJEPWMBs8pnEnIp9OG+mn8TuCA3mkkFK
         d/YcpbpCOmykVX97bV0m1CIniUFqRFnx5zpCcMw40uCgtiRkw7D1B3E+U3Q7rveTWOs5
         jtmIpu38pscNoLJrKqGzSFo0MCd/RwhHrFXMI15VHIheREwL6X1fcUC6TICtMpljZy8a
         XNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZpEyfB9t2irzPOcXqpTzmyMvDFCaAEXlLlFCI54ChyCOy/UnEOTjMs4oTtl1RyD6mvP6GbIng0Opi77ZC@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMYTcv2uI0fYurZ3yOiy/lzPh17PK/3YEFxoRArnT6PGN1zIa
	miHwFlBAzMyvfmJr03gu15mH7Gsb6TYXLnecc7GHoqLEBtlcYBy5mQGGSHNZR/Y8ZI4NjWE4Gnt
	yqsR5Mcq1tNIxumMOyrTFmeGJHiKrtvA7sjQfyJHIBUth3mQ+EvD4/Z1UWLvqzLnjleZTC4gt2h
	dR
X-Gm-Gg: AZuq6aKbJSI8PGi6wGLdBFF3YjuqsctmBMmDTo00skGdR2O00i70rShXSyeql6dHZhU
	dZfOqJWFIseY66fVQu2zEHCy9pKyakmcv8xipEWvAjgubTAxtnUIXc2DiZYG8CT62/XK8jA0gv8
	sYB9G5SjMZxRcS6HHMmsjf94aWhXKtFRfTSxu7ovoaXBc/rjytBrMwZhpBKQ6N45AnfKg0wtmAH
	t3kAAHMiTMP9s8WQ9h5f5AYOkxH50NudtTfL2rp8HkmUju46ldMsTrtJvTWzk/bp0n+3BOhj0PS
	1leFRZIXpcXeeYVv9UbqlkOhbQ6IHIUZ+VNEfHqSHAFTtxEJPrXKVmtI3LxSTgTTtVwwcb8c+tX
	nKLOqrkiulzGn8xjFEoSgFO7JObKkl1KVQmUl6pBBW3jPhNFf/D3g+cyBs0xfnzszPJg=
X-Received: by 2002:a05:620a:4723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c714b4467emr120128085a.1.1769596200622;
        Wed, 28 Jan 2026 02:30:00 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c714b4467emr120126785a.1.1769596200133;
        Wed, 28 Jan 2026 02:30:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0213sm109996666b.48.2026.01.28.02.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:29:59 -0800 (PST)
Message-ID: <663cfee5-ea40-4990-9391-3b12d9279cea@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:29:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
To: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org, lgirdwood@gmail.com
Cc: andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127173736.82976-1-bjsaikiran@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127173736.82976-1-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZCg0cvOcWmWCUxZjfbFS8WTrlZQRwfy3
X-Proofpoint-ORIG-GUID: ZCg0cvOcWmWCUxZjfbFS8WTrlZQRwfy3
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979e529 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=rk3K33iGrHrTizFJfSAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NSBTYWx0ZWRfX4pw1s+/6fSIv
 BgYHYfUycpxk87Yu2cu4TvHnJx536Gra8CbzU3yaXhKIJ8tfX18JyUFNKvepPreIE6xkr56SuSx
 IQKSB+K9NUdEd5rDF5d/wa9LmCXic1nMH7g12FrMj1OYdeuCyCR2ISbeQxL5dAsD4iPg+XTDrLr
 MysRsw2GbXMFeO0VqCGTK77laylYaqsCpThOf2c9/2gX8WQNmSmY+Kz9AE2AuDIWyOmFVCx/Hio
 pitqQukR0QJbkROZNdP0U/4y1ZH5cxi7ZH756A3wZNz0Gz1YTXMi1i1VgdBPyxdot7Fvwts3f33
 E4XcP2AtnXMnKlav5LzyDEzQcGiEEfhPqdDdrm1jNhe+jk+31/EOINeAIJpKiq7lk3rK9xOJyQc
 Ow8bKmi7PsQWliIILQznKJ21mcyp8si485RC3EMWMqus7kK9Hr7G0LVlNjh+lWXNOJs2GyWFB7R
 GLFBM4dRwZerp8LRelg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90940-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E93F69F7C9
X-Rspamd-Action: no action

On 1/27/26 6:37 PM, Saikiran wrote:
> The core regulator framework supports enforcing a physical off-time via
> standard properties, but the `qcom-rpmh-regulator` driver currently ignores
> them. This prevents boards with slow-discharging rails from enforcing safe
> power-cycling constraints.
> 
> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), certain camera regulators
> rely on passive discharge and require a significant off-time to drop below
> brownout thresholds. Without this driver support, we cannot enforce this
> constraint via Device Tree, leading to sensor initialization failures during
> rapid power cycling.
> 
> Add support for parsing the `regulator-off-on-delay-us` property from
> the device tree.
> 
> I have tested this on the Yoga Slim 7x. When the delay property is present
> in the device tree, the regulator core correctly blocks re-enable calls
> until the delay passes, fixing the camera brownout issues.
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 6e4cb2871fca..aafba61551b3 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -503,6 +503,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
>  	vreg->always_wait_for_ack = of_property_read_bool(node,
>  						"qcom,always-wait-for-ack");
>  
> +	of_property_read_u32(node, "regulator-off-on-delay-us",
> +			     &vreg->rdesc.off_on_delay);

Would it not be a better fit for of_regulator.c?

Konrad

