Return-Path: <linux-arm-msm+bounces-85520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE3CC7E5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93A5D3039181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4F736B067;
	Wed, 17 Dec 2025 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjHTJBiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUR0qxxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91836B05E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978716; cv=none; b=aBTY6lTkAq9Nt4kF5H09RityHtRgxSD/phdfQrAb/+/y3Yk5IFNq2CQFiHRAn5xqBZLbUXrgRAiMsTcG5PyPbCFQ5KdYZi7NzXhbYQ7OgZuJoQq00daLzGEifs498ki0nFJ3sTclFL5M4AN4yuXQ3mAu8Lpq12cGTRwepqWJfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978716; c=relaxed/simple;
	bh=qBsmSMkB8mpTkKHGzzntWtXUsP9GejRmq/cM9Hh1lz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1mPx1ii5pBOz4MnoETWVtBtj++gBEQWb47ulRwoK1q9vhJt3uq0NVbVoDVVkXAT5JxnMHdQAbWtIGj5WN22iXOUVA4//HvkYP+elzKNl++q7lWlIYbUqXXAoS75vZ8hou2Bu02T8n+6bgvKynEANjNnFMX0+2+nfPLoS4+Z2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjHTJBiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUR0qxxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL9BE2675127
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RExCqmuiZb7XbXWVxX5TZJ7UJhWSvJ6F76hdyqz/mZg=; b=jjHTJBiFTVCV9VNg
	XzpaNuvuAumVLzhEahy4pZoAudQ+niDB300Rk6DrfNuLj/Vsbqu7vd2mj7TJVln+
	e3hsONgeKM2t1RNWlJuCFRYz68orhS360IjaCv1qsJ8FedQBOcv2ZOfx6a76pn0W
	iyYk2idB9qMrrTuh2aOW8FmRk3U6H/Gw9L4WIAodqAFW4JlpsgsAaYWITWUhJ7wt
	6asTiFXbXazoYsirpAbP69jCgBrT5HpQcU+A4n0ozcfrdBRMaDDigVylPpNT71gR
	vaDQqnXDiOJoEQQunElWxBbBIYrvTrm3ZkFLLxN3cV+MNCD4CvRvXD/gPUSxTO+W
	UnIv6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1r2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:38:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1aba09639so18615841cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765978713; x=1766583513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RExCqmuiZb7XbXWVxX5TZJ7UJhWSvJ6F76hdyqz/mZg=;
        b=NUR0qxxM8KpU0q3iH1ykAYylBE3YBVfZVogoQtSkDti9MCiBm0PuueoI4PY/DYhlzn
         2qmBw6iKsxGNxXhyPDUpNrNTUaRkGmFQfz/WG6WHD6k890Mj23kTIwFvMczwYy/aY1cn
         MeDbs93XnTlwKOGxSPIW+TdL9W8Ft6i6fIHz4HVP4SfsbDoff5VLim1ZfYQa+YjiGV/p
         uUaSMXi/ViBwNbjeJFisiZj3r2POEywvipv82+cp8Bs8sIn+12gQz7WmuVpSE8q8ZOYA
         Q3lnRPDmVuRvQj8gYBhu0oMmD/5CfNh/HgrN3it3AVxlKCmtGP5Mys9O8q7dWA5O/NjB
         /2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978713; x=1766583513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RExCqmuiZb7XbXWVxX5TZJ7UJhWSvJ6F76hdyqz/mZg=;
        b=lglfNkScUKaWRTor+oYHau19nOdHLKcMtEMLQ3L70394FFOr9gFpl6eVmvpqYEaqgQ
         BIOhkYabjQyCDYIO1Wn+SeoE1NM/5alm3nUTEsrt3ZMjV6eyTaeYoqg4dA82wmcZj/kk
         lH5H2xh5KVxJdHZhK5q8ROtsn9mZuxG3Co2Qlb/Po0TgmfoeS3V8O8AfZq/N4lxChVXt
         9eEKfc3ZaMc65zcBA8qOEgKCbxGeHlx85VBdm2AwJmvhdIxiiVUjG34J04QyLSRbHIVb
         Mxk/4B91SYDu2AVK+e6VkVd91rk+pI7m3+PCRzQgQzRrtQoByuXVIgLbpUJRFzjLTMTo
         GDOg==
X-Gm-Message-State: AOJu0Yy8pWd/Cm3YP0DZZtLwugYnQdy8dnOVBfxtofxy+j/1RTFxRSnj
	dZN3btBSZk5rQA9NG2Sp7JQAFKmJemQeKfVjqzH870mdcOS5kEX1bPnkVTNWR6uj9PL/EMU0LVn
	x4h5eY+9dyPz57xAc4WopGiO7Hr3W+ovw7VJ0lVG4zaOsInXQ5vYw8F9tJDM/QBnUASlg
X-Gm-Gg: AY/fxX6ucPRWAy4GyDqFTvMtumX+2osAsNUoy8JA5njlJO7lITDsGiuzcbWbhovDgak
	jTk8VTt5jRITRgnVzvrrExgp7Qvh6Rd3nkilDGdqMTA/gcmwl4DB3MLh6VOKna6J3AaSgAGlhEm
	3KpNQrIP+UKlhptIxY38Vj1Oal2+U3RFXZdJOf/xlekiDyfUSsRHpygDdgvcvg4NF+d2Qpn8On8
	S8pnVqlrAFvKHaYQGP3rCjTgJkDUlhX8N7F2Gcc0m+Xwd1JgWQBRRDCMO2aZlzsf2xjq7Q4RiGF
	0BpFWH/e0HIscTvmKsDPW1dnj1+VCNrgLoGKTdqvqKoBmDeFJwSRNpbQGyfME8bXLOwJ4E8iBNt
	wOHiBnAFypqkTP7VyrUP4ExlJDc5aSSFtU+6uUTJlMDfOmdYyhaWe64hBgZKeLXpVTg==
X-Received: by 2002:a05:622a:65c5:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4f1d66ef677mr132396611cf.1.1765978713339;
        Wed, 17 Dec 2025 05:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeiF9tt3v1dbsXhSel/fFCb954NV3N4bJ8os04zl+9fTBlU5Gk5YaHVVpUzZ00cqHVe63bTQ==
X-Received: by 2002:a05:622a:65c5:b0:4f1:d267:dd2b with SMTP id d75a77b69052e-4f1d66ef677mr132396381cf.1.1765978712865;
        Wed, 17 Dec 2025 05:38:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5633a6sm2540499a12.18.2025.12.17.05.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:38:32 -0800 (PST)
Message-ID: <692ed5c5-1773-4511-9d4d-7a6fb6ea8bbb@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwNiBTYWx0ZWRfX0C7qwiGXcpsn
 +Zb+6YqJ7G/5PNOP8xP4PbRdVs+u3ps7rn26gasZA5IfeAv41jjmCZ5yLLYNQmvKp0V3UJOQzbH
 3IUoV+kDi4U1M7i2CZx1T6k5S33cJGlFNopubIw7EMbvkJeeYLC6XJs33fr90NE9HoKxsBtg/f1
 8+l8fxAqoZJIuJw/eG2gZqhr4xeD+UYvxCBZ5sxkc8Y7ml8wmAcIzP1u1Gbo6G1wLsygoHxgTTc
 0nPVmTomAojjk126QMo9H70BOjgt1OtfVlLurvxFUPDyOKK5qhNSz6M23LLh+LhsigcZZZEyVJB
 59G9TcTaRxb2oqU4eLTfgaFfqDtDSUUaiTEjUNOIrHUH8Vt0nzf7GiG+2mY6g+O6lKNzIBaSHei
 ZodyzUjvp2thEDXPpO2cyO2RpN+sdg==
X-Proofpoint-ORIG-GUID: FaHX5EpvsH26GLYK7VYl9Kxz48RnMNUN
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942b25a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fLcEx35aZHfAyDpaXisA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FaHX5EpvsH26GLYK7VYl9Kxz48RnMNUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170106

On 12/11/25 9:49 AM, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already merged):
>     
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v6:
> - Added Reviewed-by tag from Abel.
> - Link to v5: https://lore.kernel.org/r/20251210-crypto_dt_node_x1e80100-v5-1-5ad22a869a56@oss.qualcomm.com

Please don't resend just to collect tags, the maintainer tooling
takes care of this already

Konrad

