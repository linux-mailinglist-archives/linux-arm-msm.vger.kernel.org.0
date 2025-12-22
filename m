Return-Path: <linux-arm-msm+bounces-86208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399FCD59E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B201301CE5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98743321B8;
	Mon, 22 Dec 2025 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2/LCd8O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihKrpcvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9D3321B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399093; cv=none; b=BZw2W70z0a4g0EQtbxv4VBLj4qVNxcyxIZp50I0VJVzOC/ij147ZSGHlgAMWymNxxHrA5Vb+wgEivrffRO2wH8MC7X8Ji1sJve5yV8YL65347q+zy3OUbYzgy03b/k7aILc/KIV4zojXtr1u8dVDpjs2cTdjCmqZHWxFbAZbm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399093; c=relaxed/simple;
	bh=gTzP0yxnU4K516FBF62gyin7+fK1amINjIXHdHvg2zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fADfWvzIumSQD8/VfLiXrGtNvyK4i/D1gIL4CFIGiZAZwYsADKWRwummu8/5CbA6ShosWutlcVubica5bkektlRTyr8c3ViBnNwco9NSVtZ9/RKoQn56tP2f5TdXVogyOUaOaQs3sQF8TPU9Phld8pvqYGYkJMiXjuK6LbtzH4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2/LCd8O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihKrpcvJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM86N7L3729732
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2KBA4Mw2FCor6hDg/0DA6Qs6b7AfElOdR4303C870s=; b=F2/LCd8OGLw1y/Yy
	s6i0zbwMK++xVBd1+ae0XWWOVSS/6Eu2HohkUoZolgVfh/AyfzZTPWicPKJppwuM
	ixU1bO3O0Npiit1uMTV1M29+7Gtn11f0/yCtxGYUsRfRhgI7v66JaXX7soYI29hg
	0Rrq4M+2Z6qY9vV7SdflaO1cvnxYKg6iGnitgc3Ci3nvjWU3IPXftaXr2xAv4/0U
	NGhxojmyFu0AbdUn6Jgz5QcRpOaoPgsf1Z/dDrHSA5sILXTrF65aKFvDdIfop21C
	8uIGMJsvHNKne7RQPy1WLgwGTTajn/xexc7tNaHsf6zcncaYsYpkUmEdmwfbaeN7
	691KTQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4nc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso4693932b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399090; x=1767003890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2KBA4Mw2FCor6hDg/0DA6Qs6b7AfElOdR4303C870s=;
        b=ihKrpcvJC8cq51KUgW03YhbiYe9M/j3GPG2Pv58HVo9RLb/VG0fN22u+6vyL5UEYso
         G+ZbCfSIDv3nftxgp8VCsQ/QpQyXClhGga0xHlqSeqKtXAxjq2M+0iTMWzODYkKFeCwk
         RuoZkjbUMfLpz8BhFGyho/xsNZlmHqgI2D1i6ub3NqLIhJuzdEFVnFN/GSQ017YIMMpk
         aUZMlRyYJxPAxqlgBD28e7XvrZSC9SKEGMDxVYfzXKlT/6P74+wkLRLKh7HHzgngLo2Y
         ++xiEz2135JoZ0Cwg63W31m1lF6GvuPH8xEn3JQYj5MJf1OXJyFZHu6Y5laRivYLv2z8
         hzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399090; x=1767003890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2KBA4Mw2FCor6hDg/0DA6Qs6b7AfElOdR4303C870s=;
        b=v8I/L9YFS28pfIE3CjncfnI4dDwLfBPbVHYwsZGb7AJChxpCuHhoMeu+WwPNl4mBb7
         jbatoSZ+n+zyWA3Iq4zg+lz+oquSZapY+/6Bkm2vJ27eecgDiv4eqcJt7bW/R9NQ76MN
         +YujPLU6wHV7ZbCNaZF73PNaMO13axJ/ytxTUT3ZYTM7QZJLZDeeQGluAyELhs9/Ro/t
         x63Z4JvbaCk5pF1RgrXGjT3wj+NHMw58kfW/VMeYO48u2QjXKwPyU94O3btBRT9yGted
         JmWMVfDTgPDkZdj7f5WnO9s2C/4g7BL1LnF4B9AmM3TyEso5ggiI7qV1h3QEG22I++Kx
         aWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVOqMwXHtUIR6RJtZx6oDoWkBKsAR0Pdy5DucOlZu1EgNWdB0JULv9eKhHba1vEzyElkDGqy0SqszkKTGmx@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgUULgVIJnGnIrPlDqjaUfMlqYaiuZPSc/J/u22CCNTCEIMlh
	3Z1n8qFoNZqth53qbPkdEiI7v1LrzUZvAjVPsbk9txWjdoQ8AFDA13rK32VGbbhUxSmOgP8uujo
	ndeQBnJgCPxDBS1I1AD9L33of3S86ulXJxczZ5zik5dA3HJxIvpD3upnz04I80FYBpehU
X-Gm-Gg: AY/fxX5lIVkgN/U0Fu63G/ogQMWDjsRcH2l+/NZbsrWkCjJXRF0DWVy7XFXucf8spPH
	xOPmc8etnqwdoGY5c28q4f+nsRgpTxmSQVcSbNv7gkrl5RMiOBEMrnZHQ12FQYFmTDWjgKA50PM
	2I7gm13VSHJDuWXAYcqGNuK5Az49cS1jeGQ2IV617FqFNBeZkoL/3X7UHdKJL5WOtwrJC4Drlki
	9UFKujrxdfGOvznt2Pb0+lf5D+KNhMYDDrq4nIBcc6J0RsqmZw3PlnhiwnAovGkMAv9PPTcDpuv
	jCHnCuo7q4BcYz19f7fHxV0ZlT/FOBfqoBpWM/JQLEDJC/5+ndLJr5Xy8Jn3BRmnWQckS68jMFx
	79ctn5VU/PKICcXeK80FdZx+zIqxS0R1Cp1Uv/hx733DpOPT648gLfNzffDa9dq3sl5krn3IT8f
	ZVbt9YByYFymAaXJSCqd07KQSi/Nc=
X-Received: by 2002:a05:6a21:e097:b0:342:873d:7e62 with SMTP id adf61e73a8af0-376a7bf0d49mr9365460637.29.1766399089644;
        Mon, 22 Dec 2025 02:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7N3N8s+HFdppf1uqPZ3c9RQfSGPc9XgBiqUADzM3FpvaaUprae0amvTxPQKt3VMLG5dc4/w==
X-Received: by 2002:a05:6a21:e097:b0:342:873d:7e62 with SMTP id adf61e73a8af0-376a7bf0d49mr9365425637.29.1766399089095;
        Mon, 22 Dec 2025 02:24:49 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018586sm9020009a12.15.2025.12.22.02.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:24:48 -0800 (PST)
Message-ID: <b349691e-07f3-45f9-b28d-d352107bd66b@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 15:54:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
 <2iu6xuoeubohzsjfo46lxnxnzi7jdcqh6joxms6e5kcln52pr7@ewte5v4m2dmr>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <2iu6xuoeubohzsjfo46lxnxnzi7jdcqh6joxms6e5kcln52pr7@ewte5v4m2dmr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX+Oq7M7ulh1Nr
 JGdKlJKtWmQXeqBLslAnO1YunuFVqniafQM2Lv/PMjuBByUIoMaV0HGT8yFifcAclninduGpw4U
 3xZtPd3jIgtTQskeXFrI6oI3We3YY1+PQM+hTN1QHh74yu6cyC9t0EcO27JmM9i5O0RCdi6N3G6
 lXg/zFX5n6MPzm7y5q1ew/NxC5TLWWudr8Ocds9a8XPe3Opg2zsye8OgmIxrdvdgmTUZq6MHoJM
 1qAifNp3Aet4QDCLLi9BuRHolbht7Qijs3tcCgsvarFniKl6kEkCnrN9bclwF1kSq1FLL7iS80x
 ArtBFpOPyZO6TPpk4W++6GiWpGup149ZpkM6DPXcBYg8C39Egw7a5W9cPFTmNOUZsvH9Q5ahRJZ
 g/ZCizmCke7H57pCh9h0uKLjO/YIbVOR485AoBONY4L+hLTSDYvPuurLkEsGO+AbYJym+yWBOLB
 PS7nJD7Gs4IQ07oi+zA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491c72 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z2YfEO7aLxX9g5b9vT4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: I6ykTm78hccPP4QDdOdRrRGVDQksXafa
X-Proofpoint-GUID: I6ykTm78hccPP4QDdOdRrRGVDQksXafa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

On 12/20/2025 10:47 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 08:16:55PM +0530, Pankaj Patil wrote:
>> The serial engine must be properly setup before kernel reaches
>> "init",so UART driver and its dependencies needs to be built in.
>> Enable its dependency clocks,interconnect and pinctrl as built-in
>> to boot Glymur CRD board to UART console with rootfs on nvme storage.
>> DISPCC enabled as module, used for display.
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> @@ -1425,6 +1426,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_GLYMUR_DISPCC=m
>> +CONFIG_CLK_GLYMUR_GCC=y
>> +CONFIG_CLK_GLYMUR_TCSRCC=y
> Is TCSRCC also required for serial?

Not required for serial, will update to m in next rev

>
>>  CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y


