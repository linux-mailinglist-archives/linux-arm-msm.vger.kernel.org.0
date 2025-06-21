Return-Path: <linux-arm-msm+bounces-61924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A73AE2869
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398771894D1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740291EDA3A;
	Sat, 21 Jun 2025 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ41U0ng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFEF1A2632
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499543; cv=none; b=XKzBoMukTPdi8UNv2LXpXip+1JHJqCaLkr1cmeDST9blbs3iUYlNjW8RAqvd16JM0c07xk22uJgTSBtqISTsMj3+kUB48z6xQTcgPgRi2006k3H39hM30wRqMgEAEnpCHlI7IBiloFruCqM+piAFCGRFTAyaXlOwuJv7r2VJWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499543; c=relaxed/simple;
	bh=TIOGS5SCJXWCddfJl4KBZfmMAUXC5JfjUaRnfjaBJvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChNf6y+y9bw3YrJZBuNqUQ6I/5xNEAzL6Gm/nL3XB1OrTH67FFZWBzmlGFZjctIBfED36ztZJW2s9RJwOqObDWrOTwCMGdEHAj8nOMj9wErF/jXAsjrsaX+CUucW2/uHs56f2oZr11X9ivdq8wD/NuuU6iXP4hdSWVHnYkqsCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ41U0ng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L5flG6019962
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrVWxOcdaryip895kznrb0Ayb7JA8Nch7LFAlupRSz8=; b=kZ41U0ng980P4AQ9
	F/kx6YTwZUCE5XLx0Iyg0VqMuJPM/q9dRTg/Nv0RTqEui9C6dPqBWF+hC+d/gblQ
	RfTckV/npgfTNKGrbj8EgmDdnbGT4VjzEPzmaAwMGadrO/hTH4L3ximxKlTMtiiA
	BHtl33HcOY5NPf64eAJ9HtMEG3EMEwtGP5UQYSrleNy/SByFz/h0rpmq+hhRM0tp
	0PbTr0ID10lIzmSTJFA1UK9srjHd5dFKZiqzkgOmV4qBo1nHRQq8BPDqTidRV/iv
	RPT1bulkVNM4DcYWgotYxuthWGXEcHzV2T0jvh/bFZrfuwt0+Q0Gh+myjhldCcCo
	xFcw1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dkragh37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:52:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso53725185a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 02:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499540; x=1751104340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MrVWxOcdaryip895kznrb0Ayb7JA8Nch7LFAlupRSz8=;
        b=Np4A6V1bu1jZKlwawTxhx7A2kUzHQcgAWRshN56D4w4I5nSUn/+TEhfrkoGVVe72pv
         FE0IXDmS6I0H0qHKVP0CLPasBoGJe1Uz/0/FhRstzxMR57PLX6D0EpOITkmnj4EJVbny
         c1aWVbNSc71gMTi9jd5UcuwtUglhFZYwpqm0ySPPN01FkfA53McfGYNEY0XgGwR156un
         SXU7vbGQGpX9W3nMNNaMVRycfqk9HTzQ8OZbhhVRI1+RMeSl297g9V3FHDP9pNGolBD5
         ti+Zl5by/Z9p6d5paBrybci2l/GgHhG9UvhptzEXFJJ1x8bS1gLsH+rochHnTPj0r0PE
         RMUw==
X-Forwarded-Encrypted: i=1; AJvYcCVOM1DySDAPMM/9D5+lhL/c/jnOPn4G6PeOxIizUKoevOrOy0WNQyYfld/4ZGzLDE6I+RM21jSjGV8qLnQs@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhseZ+UsdHvzxYXLL+0i0RNDpEWC96HIU8nAqZF3V38L3twXO
	oG14Gu8E5jsUFnpwnsxblAx5gv99HbuG3132C+w/hAeC7C+Oe5Zl3HO76uocFYADSOf5NPnUTiT
	Ai38n8Hh7+CbYETDMOy1zT85yCtElCpde/Es9JsviKKTQji/9rgNV44xtlRY3i9FKcUe7
X-Gm-Gg: ASbGnct/qZeZjbDglW3Dm+DUmM2w2zhWkOC9Zwu2H3PLj1adaDc5JWpq5IWg9GV7DQf
	0nN+0zfLQWyZXXMd7ZvClzHO8efW3Z6vNvvaEflq255Qs2pvGDbkKh2yNc7lzRU9pHPzphD+fTw
	bkofVUT4U4Tj8NO3hVCa7Ooex5PeXLLfwLX1soeV0wEbbKmFkNjLJ6r7KSr3c0sbA9opzzqUfyc
	UVC2hPRnccrkUhPAhqSd2arBgWP/bAL1i3VcIIvtRZhJd15Ye6vHLjXaMAGQy+9D+ibWSsDmgga
	rdi/lAfQkTvaDcXBb+eUx9mmbQPys4lsoEyzpFg3skIMdaIvc3DI4mJi4R0vQMfoYRFU+l0mMZk
	w6Tw=
X-Received: by 2002:a05:620a:8392:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3f991e6ddmr314324885a.10.1750499539918;
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq734alkVNfmP2y8YBUA+DkY0abDKaREh8B4fbmcqxx1pQveG+x3JgzRBjRxMOuxlvhFuZAw==
X-Received: by 2002:a05:620a:8392:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3f991e6ddmr314323985a.10.1750499539490;
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4e32sm339696066b.57.2025.06.21.02.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
Message-ID: <8555840a-5cbe-4650-9499-f3876528891b@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] thermal: qcom-spmi-temp-alarm: add support for
 GEN2 rev 2 PMIC peripherals
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aNQrwWtadPeqOxWVHTbC1ZKw9cZPWtNL
X-Authority-Analysis: v=2.4 cv=YKWfyQGx c=1 sm=1 tr=0 ts=685680d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iJ2Ah6jtJjwnyIaW4igA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aNQrwWtadPeqOxWVHTbC1ZKw9cZPWtNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1NyBTYWx0ZWRfX1lCc5mbZgOqd
 Z16q1Oa2Wnt+E9fpbWZg6Jq4JXCnCG5Y9Jt9UaRIDSNxyeeCZ4280ehqnq7UmmLTD1qji4Cr7/V
 cKJxMe0AGUbw6wpEe88/t7QP6SeAqzyBlXXfjwmXl0otsfEVXxlznbXOHe8INfS2oll0HOpRx26
 qKP8R3fHILPRrGH0tuDQpUb9zDTWgNkwCDxjdg6sHiFqQOIbUlkHlW6dOZQWefUodUuZinPm6nV
 /r3p1tByFULgQWedjeQpKAUpZQ5+otpEUPlA+ygeS3IpMFSU9C0UHhTEyLOAQyYMhX3YZy+9kmp
 41qw4r6M8m5zMWz3ysDCYNovROdA4H9xh87kIu+z3HJe+aDkbwXypLTl+VuDQmw3ptGlT3MUknm
 fC6ghaG9nEhtt+LWgCxu9T2MWxNqWHFoVOqUEg0OM8Maefni1305ACoxYKa9EKxywZincVh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210057

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
> revision 2.  This revision utilizes individual temp DAC registers
> to set the threshold temperature for over-temperature stages 1 (warning),
> 2 (system shutdown), and 3 (emergency shutdown) instead of a single
> register to specify a set of thresholds.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>

A lone s-o-b from a non-author, without a c-d-b or similar is
ambiguous

[...]

>  /*
>   * This function intializes the internal temp value based on only the
>   * current thermal stage and threshold.
> @@ -486,6 +620,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  	chip->subtype = subtype;
>  	if (subtype == QPNP_TM_SUBTYPE_GEN1)
>  		chip->data = &spmi_temp_alarm_data;
> +	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
> +		chip->data = &spmi_temp_alarm_gen2_rev2_data;
>  	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
>  		chip->data = &spmi_temp_alarm_gen2_rev1_data;

how about:

if (subtype == ..GEN1)
	...
else if (subtype == GEN2 && dig_major == 0)
	...
else if (subtype == GEN2 && dig_major == 1)
	...
else if (subtype == GEN2 && dig_major == (>=?) 2)
	...
else
	ENODEV

Konrad

