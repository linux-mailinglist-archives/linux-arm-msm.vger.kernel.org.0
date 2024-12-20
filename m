Return-Path: <linux-arm-msm+bounces-43021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D253E9F9BB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 22:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 863BD16D0C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 21:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561882253EE;
	Fri, 20 Dec 2024 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhJ+sqyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFE225A30
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729244; cv=none; b=mnbsukWB0NGg39jG2TYNUCcJT43/NH6fI4p4zBau4UvpM3knSfEmiSKOt15NuzOWz/XLTUQ1Z7ZidGhqeCZ+BRTPZ0/hCHBZC/K/lmcCL49uBitXag8vMfT54pDd8+pNGcVmxCHvqekXCsj5Z0e1mkhXKVQT3/8WE9rG4kjRJRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729244; c=relaxed/simple;
	bh=bTKNbmI8l+7/+sS+R/FrtdqTQ3QdzzjPdnrRPb/TWfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A98eHIA5fGq76p1oeTCujr1GjuNwgu13n3U9Z9+2PChJ4e3SJGV2LnpRrIw6ojJkx8FOpItTW+4xf7CTulrOEwogKcfSJISUafOd7rbZjdckciH5NWPAfLS2fHEPBmN9ax/yDbnlb3SqoLJx/HGd6XfVBjyxMoTlsVgaNO9P6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhJ+sqyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKJbdXi020295
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 21:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULFvHCKeDDUb2+fSzMfuP2TGS+5S2gvdH6j+crREbx4=; b=lhJ+sqyAExgv7yFx
	lv+0LLZdwS+Pt0KxKiKodKrCqcPGx+a6afsv7CQN9yoYx5yO/SXzvkWQyowVy2fj
	Pyk69st0PBLD4YLf38C4WIIaOuRh8gd92MOm7ZJgrYNrU6qVcte6bGQ2GrRzbsfe
	3nHxLhhvJM51utZlr3LajdgsZ3cP5w8MA5pqGZGpGcKzf3Gnfwv3wkcT315z3UNe
	dxSrKBqpX6TCehzRLeX9wazUR+4Lr+Eg/tc0cSlmlokzHTB7mLrUqIqSpxh9j0M5
	eUIbIJwTrOFI0Nhk4bV2tbBcrOLs4Fsu9jN3T9L/K1Wt2ud2Hg/eeg5u/yWXegOv
	XUUkJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43newf851x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 21:14:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6f28dc247so37941385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734729240; x=1735334040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULFvHCKeDDUb2+fSzMfuP2TGS+5S2gvdH6j+crREbx4=;
        b=ZH6kmy3/Ne6mQHy5lNo3MzMYecWo/oL3cNDGbtQ+RfgPIm8M0CNu/MJS4Bw/eH0P+H
         rCMn7VaqR4Jm4CwRdlFPjsXU76jO0ScgCGfB0lE1aIFsrJi/I5O0P6SDQdbcVlY/hLE1
         HOl8sKh/NEU9QnLKcLVTXV5JMQlYPBPZnaSa0Yp9SMQDvxhwNJHWlBfm077iUJ9S3Gq8
         pFWZjd2a+Cg3+q8jo2uh0QeXbK+ZqgPiu+Y94MPM/wxoioe3XBq5yFZKyyTVI6bClDcG
         eNn6XgUJ9ULb7uXuoIi6kF1TdYWFP+Yzv+LooVrUIMHHxHUsntNkh1U6tysk0Xx+tPgV
         eJRg==
X-Forwarded-Encrypted: i=1; AJvYcCWLidVhSE+2OMqHRR8GyeYtET2IBBFPBpRDzEIakkhMtChyIFVD1mlqW7Opa6Y+v9J+2I2g7Nt8BCURJa8E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9doyd6d7btysDN0CDO52iAxO/Dao0W5ZWRAJhojkPDc/H0zEM
	8tYBfRx2bUbxWDbQX34b4K96BFGuO2iAvDPn2AXCIs9O7GO/JN8v7I/mzfK7gwexh3BJ1oMaLY4
	YBL7vaCZfTcTsBWMzJi6p5+rhqtBJ61cfkD/GvA6gxxYT/7SGAEXlx1SY2VvoG/Jd
X-Gm-Gg: ASbGncsvfWtDDpHj8KOWg/TNG4JoLxkW8qcFkEczecZyxv1VYQiUEWS2KLW0kS/rA7t
	AV3gFH5puFjW4dCjNrRtrw77F3KNCatFNZiEa3vX8cAsKMhKu1CqLGXjq7des9RPfYpCxgzSTMI
	3+080dretCLJmY/aBLrv+jEUSpkiShXiFKjZUCkth05vk8pRWzDrZwNf4Jn5BhuRTqTW2ECqFBc
	W6SnGSaOEV6khLqTI/V0A2CpI76LnFWTbBN2JaisunGn1HWQKwI9LUT5VEZ5lSmJBp60IbeN0iT
	CL+TNBp+dXXfwNShgOm/Q6EAyZrEWGrRxdA=
X-Received: by 2002:a05:622a:607:b0:467:58ae:b8dd with SMTP id d75a77b69052e-46a4a8cddb2mr29621671cf.4.1734729240282;
        Fri, 20 Dec 2024 13:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG52+oSHDe//Ui0Zbu1Y+oxEvjl/VIqO9wOSXLng49yM4ccm1QJQPqhBC8PCJWWjzKK/k3+2w==
X-Received: by 2002:a05:622a:607:b0:467:58ae:b8dd with SMTP id d75a77b69052e-46a4a8cddb2mr29621591cf.4.1734729239954;
        Fri, 20 Dec 2024 13:13:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830abfsm215773766b.20.2024.12.20.13.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 13:13:59 -0800 (PST)
Message-ID: <d46f0ad4-4319-496f-9093-54bb5a000875@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 22:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E
 Go (sc8280xp)
To: Pengyu Luo <mitltlatltl@gmail.com>, andersson@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org
Cc: chenxuecong2009@outlook.com, devicetree@vger.kernel.org, gty0622@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220160530.444864-1-mitltlatltl@gmail.com>
 <20241220160530.444864-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220160530.444864-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _1aBKn3s9NB4O73ggQzjgOVSfOEAunkw
X-Proofpoint-ORIG-GUID: _1aBKn3s9NB4O73ggQzjgOVSfOEAunkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=865
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200170

On 20.12.2024 5:05 PM, Pengyu Luo wrote:
> Add an initial devicetree for the Huawei Matebook E Go, which is based on
> sc8280xp.
> 
> There are 3 variants, Huawei released first 2 at the same time.
> Huawei Matebook E Go LTE(sc8180x), codename should be gaokun2.
> Huawei Matebook E Go(sc8280xp@3.0GHz), codename is gaokun3.
> Huawei Matebook E Go 2023(sc8280xp@2.69GHz).
> 
> We add support for the latter two variants.
> 
> This work started by Tianyu Gao and Xuecong Chen, they made the
> devicetree based on existing work(i.e. the Lenovo X13s and the
> Qualcomm CRD), it can boot with framebuffer.
> 

So this looks good now, but

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@c6200000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xc6200000 0x0 0x02400000>;
> +			width = <1600>;
> +			height = <2560>;
> +			stride = <(1600 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};

I still don't understand why efifb doesn't work for you.

Could you share your .config file?

Konrad

