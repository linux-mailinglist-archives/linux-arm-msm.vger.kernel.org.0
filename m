Return-Path: <linux-arm-msm+bounces-82643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C2C73191
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E1384E6002
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E40130F953;
	Thu, 20 Nov 2025 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnGMjYsr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXv7VPgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2502130F537
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630555; cv=none; b=Wl0QW5c8q2nyPm5hBnVbbpg9OivgUD9bd4N7/N9KneYcKc99LqE8o1Cm1c7kNAT17ovlTSRGsN062M9W7GwRiHmVaGfcrwf10zF0YPTJEUTE0WLSEA/1YIAlfyFFgKJTb2nQ+S3vxa+t+M7RwOIgKmv8MuxHudcpx6Ray2vXTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630555; c=relaxed/simple;
	bh=tSGXRzIAViCY+EvVlYPFI/aCyLbiIkPIKR5LrIQC/3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTAT5gnE6Tlup7QNIoG0fT5o8UNdwGtm8wqrqWgOMMWbDQwwctKT7EKb3nwJVv7b1dug7xO25tjgcMh0xTlwOS/1iOqymPLsZ3nLflzBjS/AAUkYytlIHBDmS1lUxKJljZGhWTdOaXfBgUu8RU7N3Kkjvp0CUTT6cVWwz1FAb0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnGMjYsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXv7VPgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pWI3047680
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=; b=RnGMjYsrmS/a6yDA
	y+VUGBRSlD+YJ7sSALJWzKzOS4igkSu9sZxkmIqjZb1k1OQI2nefh/zfS/tctSxy
	DBkAIx7JurZiHuu3fPdkbOgzq1ONYXKCRaemhaxf2aSKV/S46Kv/PAuu0wuUgKA2
	fBMsoFLO4sNiZ9nrHS3xd4TGqebZqGYzgGCFbC7sczN5W5W/IyshIIfwjhxmEAOt
	DPNJEqnv6PAAEKQWT/Kv3/C7GpOTgHq5PLAGRRuAgGU7P6sg6Qn+LLxplLn1MZ/3
	1yGshLdZtnSDNUY8H2BK0HSIpDSABAy0YmllcistKhSrGbXSNvW0ZguwUtzkTZV7
	Xip45g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqnkk6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:22:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso2066951cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630552; x=1764235352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=;
        b=hXv7VPgDdhSPdgh23rqwYQHWHijD89gH0mHrnmB+NTeRfpxykULLSGFY16NktMJen9
         J1frZKLAoZgZUzJn84HPIQOkQrmXi0RwJjq46aZv83uqVsEPbVTp7UQ6NL/6PTNH/EAz
         ZX6vOiaqO2UPUNrsSRJ2r6eIUPLtKz/O4IZ2HLKDoMVuwgxwIk/pUV/Qy7i0DQ9xCf1n
         XXUxGT7YYLJZuZvQw/oylrzBJ0t+uwW3bAS0/gWD3zxO72wPAYwoP1qBfqbqG8bXzHVx
         8cKn3XhXXAORYM9CbJk/vVTq+PtKLQR3apXB6ht1DiZ0urfTrjiEP99AMfFIvPm2nxAj
         75Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630552; x=1764235352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=;
        b=TEXPxk6WFTRDZ6kyKHnhn9/N+zL9waqbJLBoSusHo8oUH+OYXkw3OAqm0HfHp6Icd4
         VIV2BVTS/ffOo1rHXIlhcsjl/IXBnqflS+l3incGFsyFSjEVqB8ERyRx3RqlOhf5yKfc
         nyr2V+7MEtpEg8qQ2Mjbylesq1xeIGCNQ8Znzo3wvph3C5ceF99ilLx6D/gok3Dbo7Bk
         jbF6ExqDFroxbvw3//9TJxzGeRmuPQ8SZv9SDxV4Krgdez5aQZwkJh04DwoznMwr2pjh
         xy6bjECtry51Pj6DFe1PIWfwV20T1n54hQnZIWka/gUcc2i9h33uHIWD/WjCwiPZ9HAn
         S0lw==
X-Forwarded-Encrypted: i=1; AJvYcCVthucRfm2q0CbHp+uYOC9OxpjYnKwPJlktrRoyo1bsyYeqxwFTbHZXCIPMZmUtEuUUCIkg7KvOemwz/GVu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7h6tqJQ5GnKovhuqe0A4jvcqhxe2WPykJZVHoCxrhSCM/d1X
	yQJw0HF7Z7bTtjD3WxUwUbCe9OpYLPqZi4kn/BEhk8GZLwABY4c2YyoioOCdcFkIefFaiM8HdSO
	mHHHRDCRM4tUFNwgQzZXf0dX2L3HpE9yfAyrauIA3nAkmJZGTkSIRkYhG0QsLIWC5DHviZxGdzj
	ci
X-Gm-Gg: ASbGncsDzyhrpHmchEFwvuUIDpWGYWphhlH8N7T2X5p/rWh3/3RCutCh8UkcA1ssXPJ
	yiDqwM8YOd/X/syo2xxVseAkr8Z112FHoHsh1sCzhXWDCTEsF+uZWBA2n3jACKYJ2b7DzL3uU7H
	k85RTgvbchab/bfoNNaFrcvXgryoPFsawe1ds2i3wI+0cSr0isBPwM6J/so03tTmSMs1jMak/KU
	gg+YqBCj7Eiapvu+I3Tlzos9Gn6v2artk+o1R/QMvC901Uk3V4g/kw+eazJ4qjsgDRfBG0UmXd9
	fibJjpcA0AFNieM7oNeMH/tqYJtYvdeHuWe97CbcZ0GiP+WnAVbnzBVJ9tHnLOPtXVsbiLzrMGQ
	uzniv9SYELdK7qrW/uRK2RqOba9dwsvjrB9r3z3cqdW8LUniGJL3oSHKhDT4UiobecPU=
X-Received: by 2002:a05:622a:1898:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee4d46e7cemr7411251cf.6.1763630551937;
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAJO3aHE2R9ki5PG+spz966VyxtyYO6+zj+lYg+CQGNg6px0oTZFG+eeB/j7TFx+4fSV+xvQ==
X-Received: by 2002:a05:622a:1898:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee4d46e7cemr7411101cf.6.1763630551522;
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd62bsm168359766b.5.2025.11.20.01.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
Message-ID: <95ba4c5f-b973-44b0-98e5-f314336844ac@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NiBTYWx0ZWRfX11MTB3ZvJFT/
 Q+GpvJIC9aDoDbsphnLsfTW5VIi21sYovMgDFj/RrWoeKzBQxGM0eeZXQoCf9MUGglOgcLX+nOj
 8Mfg7P2uNA0RbTYwfBJ1JeYEz5iPqP3IDLEdJgzqEa5aDuhZIVWQGUYx/mPhKYMVtmETrp6aQtd
 REBhV9KECSc/I2O0oPtWHMjVz28IlGw1jL+l0yr1fRyTzYPtSk1uytt3cbVSFozaCvlxfdqTs+r
 ovUcN/qUK38h3JYm/Gx5Uz7k7JdDdRtVW1TglLcg+UhTMCEC8SmZn/5RAUL+XCPDy+RMrXzGxBW
 1NzjpfFAMk1maafObwWoNeiUFgBkBppflmGoDKC7KeL2UU6pCyS/NIVW05R+LAKO+4A+pnSPTbB
 7Byj7W6mMc+evcekRTZ3jHDpCzn96g==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691eddd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DfD8mOSChUYQOWL1AdoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Y26zyMT33XYePwgmTgS1yuusS_p6sxSK
X-Proofpoint-ORIG-GUID: Y26zyMT33XYePwgmTgS1yuusS_p6sxSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200056

On 11/19/25 4:18 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: then intention is to land this in 6.20, which might let us to
> start dropping those platforms from the Venus driver in 6.21+.
> ---

[...]

>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7506f5d0f609ac8984ab90ba207e64750df8a9ec..c7acacaa53b880c66b11bba2cca8d625b4f8fb9d 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -54,8 +54,10 @@ enum vpu_version {
>  	VPU_VERSION_AR50,
>  	VPU_VERSION_AR50_LITE,
>  	VPU_VERSION_IRIS1,
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	VPU_VERSION_IRIS2,
>  	VPU_VERSION_IRIS2_1,
> +#endif

This feels a little overkill, but your changes look good

Konrad


