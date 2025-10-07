Return-Path: <linux-arm-msm+bounces-76263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FABC295C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 22:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5CC3188975D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 20:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3229621C9FD;
	Tue,  7 Oct 2025 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXFuihzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11281E32A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867551; cv=none; b=nycd0W/mKkw2mSu/hVNLZdURPw5MzbDjYrMmj3CTMlgwfNc5/B5Z8ExMwDjmGiolp3iUdhyrxlAbxOqsHCI4pkeKlqQo/JjgKO5R/FbpFAwLg9DyjM3STsy8TP//fVyTL3MeUGip0cQjx8Llhqgqcyk66r3NwgXwehRe94fUsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867551; c=relaxed/simple;
	bh=/wx3OL9BWAx8+NeMdMJilvmQwFIyfrk5gha8xKZQqWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Omsv8gzbOVcIaEAsDQxPqmSgHo+bgDkyllUnJ5wLVRehwFD5zX/v+l9UTKmCwFO0n2D4I/oDjaQHBmYzSSJbALAASH90xoI0sQGbFHgVKvOkvR6xw5aRx++S3lHg1An7eG3c7hCbnNIiK62kDcKfO0l3tbugue55G4xB/ZW2mZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXFuihzm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7uM031500
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoDPH+wTfwtuvStswvFGoT4dXqTUMaHE2qAkUsYf+Jc=; b=cXFuihzm/lPoih06
	Kby1agkE2ZRzp8o0IapSJg125FMFstSV1yhAptvzG9yA9WrzCBifg5xJohinn6Nx
	JTmasvte0xkPVmAvjU6Lk8m5uw3Tofa+zO3gHPwiFJ43hJjZeTReLUGiONcldLwr
	RyM+3OrSrJwfQ4JJk1Hx+LkbAhu9uM8TyW7GvBF9LLNQY2yPZDEdRZRA3tWdOIqZ
	qwrKn9VGQZ67lM3bIadLD5QVIYUwhpK0TbkVKBRZmnI9YSvuOB3I6kiJLLggKQYz
	mtF316Qic3iu5EL0dVhFjTtPd/BtYU/5Izc0zjCOPgMS8pb71lI1BnWFLnEoxZxO
	aZHTUQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk70g1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:05:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78106e63bc9so6502687b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867545; x=1760472345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoDPH+wTfwtuvStswvFGoT4dXqTUMaHE2qAkUsYf+Jc=;
        b=MsNc4bWL6kZwW7D7Iq3mh7lnDVEXhppRBJyFL0pNPZ0ZxBq8xy/YoQrKcRMbQTG9sM
         HTpQXUn/ySR1l+krs+PKPFmo3Kzo+CfkoW0Z1ftlG+kyJNaawhpNrI4OXWmoWiE3leYZ
         TGM/fhvcU2wqrh0QNw4pxylB68c4eKJOqccJJsDKvdIHmJPJVGGTcV15wJqLEu00XEGC
         P542BelKN5I9OYKaIfbNP2LHSPK5N5+X+9P34TVbZQC6zaAQQe8QwZei/M3TEjZjtGgC
         sF3OgYmwuKoSnd4K4lzpIZOYUbsu71+PzAapcKOdKweVZBMotlenLAM7qRYDBZyKR+HC
         CJWA==
X-Forwarded-Encrypted: i=1; AJvYcCVEjLSwbgJj5MS1manVT0vEA6OhCJQoJv4O14886fIgwzR3zEvlTEFbtoI8TkuirUWBX0Ix/gP9ZhS6byOa@vger.kernel.org
X-Gm-Message-State: AOJu0YzVygQoiDsLQ1GqLiNm06JLqw5ZJ+xrclXjxaYP2/gjyCBrq1aJ
	u67B+6HEvj45PaY7kUQTRWBvP+zNd4JmCndc5+BBwb3oQyVhiqZSRQc3MTglndaBYKpJYZ9cVa6
	0HGD01dMpbJ7+6eD6EntRen0R/mzgzeBGCrMik3ZkY3FMhG7zZnrX7rAxJnXVs/P67cLb
X-Gm-Gg: ASbGncvmKt2bY6Pmg7RSYrXUM2iiEFKGm1ml4x2SE6wH41KFZGIOMy1uAT3YTGOY3Vr
	SMYDef/4LheJslKMwRPS9ewX0tv/fSLfjk7x1RLDldjPnD4ukx4rqT2ysJJFByD2EEibnPlAPBl
	jN/bVpD/vTK+8IyhSN7fuz0ooKH0MZ0bNz2B91xnvSbUEGy1vAQs+oeislFtqvieiT+idDY2M2+
	Q+SXE1U9eDBXAMkZJq9lUd6IYEmhb64l2aDbAjKuunkIcA6uXz1qFW3U3u0E/K/1hJNqOB+iBWn
	QibLCO8yFdjBfGP4/zwFjernTOsK7wuFaO7/h46oyr/Fgek3sqQWbAvtBQ4LYKxPviowFcD/l/m
	JvXskIAHcXIIRMm3N6KA=
X-Received: by 2002:a05:6a20:918e:b0:261:f6d2:e733 with SMTP id adf61e73a8af0-32da817d154mr1048539637.16.1759867544939;
        Tue, 07 Oct 2025 13:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8l70aiodUmZ54xERjc1Cbl6PHEPvR9gXUdjABZD3bJEqnABNFeiUwROTx5szqU2jJ1eAy4w==
X-Received: by 2002:a05:6a20:918e:b0:261:f6d2:e733 with SMTP id adf61e73a8af0-32da817d154mr1048498637.16.1759867544350;
        Tue, 07 Oct 2025 13:05:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053767sm16529325b3a.52.2025.10.07.13.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 13:05:43 -0700 (PDT)
Message-ID: <e6311506-59da-4728-a711-0823cae0d0b9@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:05:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX6Y8ASjHERojI
 eAj7Idh9EbO2zRW9xOq0YV00wcfjYjUkANnoPGiNBE47mkwrmRx6MUGxTEULQmpoc0PSZlJdp6x
 NzoCfLf/1bVa7ay0IIoE2dUAM7U3IFjmE/9Zo3k03d7oEpYo3aV1MgmxMpji9XgGaHswBEEU0Fp
 Gz/4kd1kQBkRQxz7QZ9O8I8nvfKCjonCIA1ejI5rfsIKx0onsei9ByZjwcNph8uu+K9cqZ3m9Ry
 bcC9VbIJiLBd1Yd4JRPoBY/4buXjUMioyro/fQRqZlgoO4LZ3o3jnylbPU8gkNN5S87obnxTNaY
 i+i3h54dhmV1BVfR7Hfi7cx2YOv4H3kkJDIZTiGM8q3uaEmdYCaDRCKDXFrJdlgDZJTv0XjlLVV
 I/v4C0Bo3Fw9EdViId46V2GTEDiTwg==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e5729a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: XLauFaNtFVRE6a6pQ-PwgspI4DvgDl9j
X-Proofpoint-ORIG-GUID: XLauFaNtFVRE6a6pQ-PwgspI4DvgDl9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 10/7/2025 11:01 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Found via code inspection that when encode_message() fails in the middle
> of processing, instead of returning the actual error code, it always
> returns -EINVAL. This is because the entire message length has not been
> processed, and the error code is set to -EINVAL.
> Instead, take the 'out' path on failure to return the actual error code.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

