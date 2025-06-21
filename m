Return-Path: <linux-arm-msm+bounces-61922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF0AE2847
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66C2189EE54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF4C1F2BB5;
	Sat, 21 Jun 2025 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFZQ7X08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2481F3B98
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498551; cv=none; b=Q2kD28PWafrZRKM/bwWmD24Rj4J52keE/yKLZ8N2zXNJwjXyBAWsVILJV/A6MuyFb6RDMGbo0GL/YwSTct5EIazCz6d4EfdklNbOZDjzdPPIgOxbgkPNlFGB+QVV5AX+nYJZYZ8VRSjOpiatQSVis6GpPy5gejbje0r/hyJxUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498551; c=relaxed/simple;
	bh=qMez/6e9iR0UjmQAW2ieUww2UFBew2FQJHL9FRtnHzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQNoi/oyMjl5RtnayDm5/Ci6Vo4tG7JDf299Gx7/+zTlR4prAci/vwOhEsHMemFA9c8kATuef4Dgs1PPL3KYt1LW/Ovn2TUNymLGymmWI6aQmiw4a/RugJy7W188Z8s/78O+JAG68SnUUdZAy10moZtfKX9H+cDbum9ipDXwM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFZQ7X08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L6R9Rk006709
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwPF+41HTQ/VpkvHzZlY0OYp5Xr0moDhEfA9/UXqwyo=; b=BFZQ7X085MEX/2LQ
	ci6JVm4UPS+RZ0g80A816DkSIZ6czqmepuUqBbodCU80q/lIdrE7e+nQHy3pjlq9
	Bsp2KMBL1k+3fzBlbfCx4B5sLZtBA+7jvIvNbJezFep+F8/m47rRm3r9wc0D0r+a
	ysd9YuFO6iGXIj9SF5virgUj0wxVxy2egCO7hi/HEEzKVXiZtWwAOrf8MWLkFMbg
	UUkU01e1Qk3UKlasBgYBaqsf5OzifyV6DM9wkHE4rjeePAsBNyzr1ga4U+6TizYw
	NfYo9giAoE8boYUf3ZaO9fpP4wCZ7GY0yN96CaZbRj4+z6yZznnFdD1MKPc5xHwv
	OnPDqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dngk8cyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:35:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979c176eso50665985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 02:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750498542; x=1751103342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwPF+41HTQ/VpkvHzZlY0OYp5Xr0moDhEfA9/UXqwyo=;
        b=uMEA3w0a7u1ftJaqfviMQVvxhOT2vI4lj8++LsNvwwwzBullonEEk93B/xmCMPoHGh
         YypgcWNJy5xYmo+7cnIsqEwLgmEUn31sPEJxzEIleAV/E2DpWOIAwPok/NWZOzAyJTTk
         hSK98D4Kmn66fpOg0qujsLHmJTts8bAg11JWEjxHdhqiW2FzArq/hh0cFXmGTGowIFpn
         qa+Xh9R0+jf9mZO3VjC87SxMoJimTJ2zYQBEcRRqjEpB+zrqT1OAkS2AdVKDZkrxESTS
         uOyECiQxfwwLQoUt6RTJg1BT2ML0FP0t2+OMN+YVJvHf0s4zULam80gCWNzt1zknL1W/
         pHhg==
X-Forwarded-Encrypted: i=1; AJvYcCUwSVylSRyasuzaffyID96eMVuCZNgORTEUP7vMFwYmmr30YeTGEJyuC1PIl75aM7AjSBMXdiVGdCcIBAte@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36Wl27vxZ63bFq1e4AyNHYg3UvtKWQZTIUr1xRpDuDA+ofjQ/
	A1/4u7OroxnlTJnnhqA4gTqFNcbUCgm7P4F9D4+QPw/oBpdvVWkFL7HpKQ+e/G00TrxbJ39m6rx
	Q9SPgGr4H2MG/o8Zs+a7ir/egbmtoVJJuIkymuLs/jjKR+8+umqJxfTACDx3VesoTCicP
X-Gm-Gg: ASbGncsqDqdpkjzjI2lKbO+DSMX+xhzWkX7hA41NgA1JQv37DpSh85o/xfktbIr5V/U
	aZPf+1OBEJB4czPrC8c4v06RxZ44E7Wczq79u+fpP4KWEy6hvdB9PHscXevkRsUf1EhlVU8Xxp1
	MGn7XEnL/fw6PjCQM2Kd/YknU8VXpHWTQJcI8B3OIEgLpReLEj0c7r8W6vwRiYTdEjXoSHgWT+k
	LEEbEFi6S7uABCv6sWYXFc66o2EXkGSKForBjRtMJFMttCFxyvWvzeQvm7aZE3dQAOhJGK+CRyH
	yQSaBYhBsk6vu5MMV+KpKHdJUiwpayCo4HxizDkA86RDinFCbjLXNcBPiHIxD95HD2Gr8/DsLzH
	L1XU=
X-Received: by 2002:a05:620a:1aaa:b0:7c3:e399:328f with SMTP id af79cd13be357-7d3f991e796mr267151285a.11.1750498542020;
        Sat, 21 Jun 2025 02:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg2nByYBPFIwY3g4IMg6xmOect607XngDyi/VlYZ801y6UNBlPPKA1JzXmjP9Pfk2EZTJmBg==
X-Received: by 2002:a05:620a:1aaa:b0:7c3:e399:328f with SMTP id af79cd13be357-7d3f991e796mr267150485a.11.1750498541579;
        Sat, 21 Jun 2025 02:35:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504ef4sm2880152a12.15.2025.06.21.02.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:35:41 -0700 (PDT)
Message-ID: <e171a7fb-ff96-42a4-9a29-37640e99177b@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:35:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm data
 struct based on HW subtype
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1NSBTYWx0ZWRfX20p8S0ZgJ8IY
 P0ok/R/85eqU1BZL3vlmqoZRnpoL4L5C5ExrnD76i4uqIC9hsc0R6lcTXye3Sw+hMI+UpVRWS/9
 E4auIbmQYn4nc6JBhJmo1pngA3unPgUkLiSvDRxF3cYBTDOl5GEwOw6FeW1wot4tcIKmduHdieF
 uuWOewqPJh1fv83LAFZxEVohQpb+BE9IDISfBRlKgbF5ZzJ//shv7zPKlCk4jU9nELis9Tpx7s+
 Gv0mymaZsU6gY9E9tG+++08CQKrxZIxzwkKsA7MqkcVUE1uZnRIhUAd6DL1QpuLDU5T1yLOXKcV
 T+XkHSOadkRsi81hMSHzaW6G2j6Oixh/1rFG0pJT+BZ95YpPKRQYepGdWT02/cBrhtaYu9+uq+Y
 4xHi+p2h6ndaS4w3FtcxXT39CSAIZ6PEfH8JGcOl6uMACsfZwbjDgh5YgYL/5UQvV8lOuPR3
X-Proofpoint-ORIG-GUID: Ul7-ygpraUNs83SkOHQ4gtjM4X1lcAuE
X-Proofpoint-GUID: Ul7-ygpraUNs83SkOHQ4gtjM4X1lcAuE
X-Authority-Analysis: v=2.4 cv=K+giHzWI c=1 sm=1 tr=0 ts=68567cef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ClHdKqAKKX4Pgx4N8LcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210055

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> Currently multiple if/else statements are used in functions to decipher
> between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
> refactor the driver so that SPMI temp alarm chips will have reference to a
> spmi_temp_alarm_data struct which defines data and function callbacks
> based on the HW subtype.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +static int qpnp_tm_gen1_get_temp_stage(struct qpnp_tm_chip *chip)
>  {
>  	int ret;
>  	u8 reg = 0;

this initialization is not necessary, as you override the
value right below (there's more cases of this)

[...]

> @@ -221,10 +235,10 @@ static int qpnp_tm_get_temp(struct thermal_zone_device *tz, int *temp)
>  static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
>  					     int temp)
>  {
> -	long stage2_threshold_min = (*chip->temp_map)[THRESH_MIN][1];
> -	long stage2_threshold_max = (*chip->temp_map)[THRESH_MAX][1];
> +	long stage2_threshold_min = (*chip->data->temp_map)[THRESH_MIN][1];
> +	long stage2_threshold_max = (*chip->data->temp_map)[THRESH_MAX][1];

maybe we could go with an `enum overtemp_stage` to get rid of
such magic indexations - not necessarily in this patch, but in
general

lgtm otherwise

Konrad

