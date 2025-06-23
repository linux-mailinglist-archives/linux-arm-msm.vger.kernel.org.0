Return-Path: <linux-arm-msm+bounces-62072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC36AE40C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69E081697BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3739F24A049;
	Mon, 23 Jun 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+t0h0WD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819FF23BD09
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682383; cv=none; b=Km6NEyi6A8w5HDZATZK5PcVmn8l3GRVPS8nymujmcbycPK/+9AZJOyaIiMKY1k6Pus/hNczTSKL2azD9gVcacrt/1igOrz2UfSxprUm3EEO/uk9Vw8HPyJLDy779mOB59RFoOHMDhyPzOTl2ltCUZvyIDLlPHCJ1x/5mcR0QU/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682383; c=relaxed/simple;
	bh=Cu9jHf/ikY8NTIpPtIILN+lROMbPCSrdR9Xd8v8FLdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOZusWGs82hjpgGpimC+esYF10XsJEBU+M61VToZejzwALYLI5tFSBlf+d3MwiByG1ypNkzqjFzI7gU5M+lZjT60V25/EKddelRQHu7Yal7uLys8DusM1frZwNlRhtA8yhxHW2B9IWarPh00OCt3HyycXi2zZh69WAyUmKT9yNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+t0h0WD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N92f9O014947
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=; b=Z+t0h0WDpKpKqXL2
	g6+2p6EFptin2q3B64PTIZ6rJtpCa3WxnmKiHk7ouLlSBmEtzWaUjENYfE4owF8/
	DpqPmPjQiv+Epmo9CWNOkjAcZaAB6o7nZBOVvPA/ehLlmB7fxrjLSYN0DC79BBIg
	FJzfP/Mpx9zLFnbZ9NHli7X7DtM+s5NYZzyuE9qBqB+3oe65orBBVN35gKyaXAeT
	sFLD7tq3kyLMLNX1LTZDGt3K/UgCl2Rh0nzHGGCMTL76LQgRp/f7Y76Efs3cw3yb
	y/4KLgnHkVqiOPJz4jRU2TnABVP2UPahkzPisO8ZzNePgOUzKX9H5Nljt50vcjLp
	mXr0CA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0kyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facde431b2so5898586d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682379; x=1751287179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=;
        b=i3wsVifaMN+619O73kCyy3I+lzNUGlGsyn6AFphXTS5cjvqpT8mDpAXsa6AsjJx8QZ
         kapUrqaxybm9Hb2MvlIFDNVDxi69WBRNGbNPKOoPPhhDT35FCdrBtZGkcx+h4SwyZM4W
         2o7twF582I0XWRRbxpQEaxgMdcst8sr4eZ5cHm4pIYIjEhwCRo68ZqKMZIqCNhnIljFV
         qMX/OowaxWyRXOaMJAYzrkv7UgInWb6o5bNq+5DSgxw+4QtuURup0sHNgiLbHth4Is0S
         yLyXu7Dimo/OpPS9goQExzDo8xSLfLnXfeiWUkpHC698fgvuBfJK+GddzidU86XglmHz
         l8JA==
X-Gm-Message-State: AOJu0YxKsiYj1d5frMwSwL42jp6i5TFh3a9sEJWh8GuzKYRjBii8HIu/
	5zgQqEIuEHc5WQ7lbeHYe59HFpgzt8TlIEC8IQkJhCiP80q39UvT/NNtxu1NTjF0rFY6VfTUlAa
	fOnIK+W4P+1DjoJs08xDsx9mUo4p/N4bqnpX6ZZJUoR2+g9cObtXDwowJxW0/991VwhWH
X-Gm-Gg: ASbGncvQVrnj8IS5ZalU1zRVYOfjT1fPQLMVVrLnQ3R4/6OtvwFO0zAWUxnek01/N4w
	n0KtIlIGe+LM4pMVqWEgaVjvo5O9PomtUukLsdyQeNL4LSkVShVS9YdRCIjmhilkztcT4KvWg0l
	HbkgImhE3Rs3JHM5QOUbC5P1KTelrMzoep8LNTkHEA6gMxUkvEdHP1nVhufkQMk5dMkMnMwpuW7
	UpF3QQS7OzM2V8LqyYBFZq7u+OJbI8nyIc66lNhZIthVDrxJDAX77zT5ru+bT61HWmywvOe3JM8
	RGfwoizXUK2Vz/mIyfuxNYuOepmLFgSsshqiG/rJB62AiQirBypqCwBfv/XE5rdDOzJzVTdqboK
	+pLc=
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72710141cf.0.1750682379049;
        Mon, 23 Jun 2025 05:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzLE5XIZwxXABQIRsBupydSEdmMwxw+uZsKhm0u2LXtGuTXdMotWQUEt+fgx8u5hMzuy3tA==
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72709901cf.0.1750682378617;
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cba668sm5900336a12.58.2025.06.23.05.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Message-ID: <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NiBTYWx0ZWRfX/QmrmjbYkxd7
 Kud6nwr53elVZPkcKz/9/thPkQUe4q3pnjkP+4QDgy1cZ4nw80JoflquCV5FFTi55PyqM+yj++P
 YaesHUkGMra0mNBnKFqnFuNI7iiHcipXllx10OjJEI8ikTS096UxMbSWu27PIORncoC0qhvUhVU
 d/CVzTIpBErIyA/alKf5yukQAQnGyoPIWUDQ6TZ4HsKH1fTfPFCsoYuXC/fVfq+CZ6G8Cue3n+o
 m9a4Yx8yI9t73OHdJr9YvQEGx/O9kqitz5W+WAsYNXu2IXm+MwGvo05qRjq8gOGFwL6+bKmRQ29
 2S4itJlYPRSaKQ6jy+iGgnphjv9jsA61uotEnmTzC7vM8f7k36lyBIgwn/uo10Lmebq2BiR+/EJ
 tQ/GsVtdZv90Eh+oKfXGpiH1UJB5csuKVP7eM4vdNl5lmPbiZW1TY2zVonbqwLxeQ7jQ7Z+x
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68594b0c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=obA5ZJVW5cAYRlcEQtoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: uts2tDi51f2AwzzB_5Eht_PQTUajeJW2
X-Proofpoint-GUID: uts2tDi51f2AwzzB_5Eht_PQTUajeJW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=943 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230076

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Due to historical reasons all msm8974 boards have used the CX power rail
> as regulator instead of going through the power domain framework.
> 
> Since rpmpd has gained msm8974 support quite a bit ago, let's start
> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
> 
> For reference, downstream is using GFX power rail as parent-supply for
> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
> modelled upstream.

if you use an opp table with described rpmpd levels and bind the GFX
domain to gpucc, it should propagate - check it out

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

