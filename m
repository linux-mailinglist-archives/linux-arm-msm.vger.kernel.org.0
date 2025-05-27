Return-Path: <linux-arm-msm+bounces-59505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59CAC4C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA2617427D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA1F254841;
	Tue, 27 May 2025 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvF79/2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB525742F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341993; cv=none; b=qqUi1/nQBZajcs/paiV58Izv++Er7buc0X8LgF7bWH4LuXS2y+5Pqp/ceG2CiFfTqOsu/ciSuong71Ra/AGE6hgL65DYM/YxYfXk12FzsMfFCWR071LWvrlvN6K+Tg34O3P8zp3HzSDI5+ZSZHq8zzqNRnKdCI30hAxBGhs9ymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341993; c=relaxed/simple;
	bh=orS6naTu85AKEnJfe89l4WIdi88qpbgmbGoyfqLfYi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/96uXwIXPIuqxZUV18Z6JEmG4FxSPhCndBPzh+Vjv5U6BR585V+7AD5kR6OSNPfwZrIHo5A56iDNNx4rFju0MxV3iwP0ImIdaA+WgL9R2JEaGt0ENQG9gtOvc0YuXGF8kn9FHIqXuXA2ixvgB+wHmuVmFFCUb/cAtOov+opLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvF79/2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAEZpU008758
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVSa5TyFULpC2g1pbka3bw5G/Zxf0bHM9jfUTPl9ru4=; b=hvF79/2qxLLoKwOP
	5875/eDnHvxydQpDbWKUI6GvwbLSK92P9GY3ly/Jc5zi59dK7KmR/1sGLpS8Yio5
	6nbCaYdFVqhh3kXABUjPHx+9c/rn4ZHpwe/nFOZv95mYqSPSUVuYa9iR4l0HFyWA
	37Kp+eVga/C07rfj0R1YdwHVWP+7/xFSG7jOxkGDCmSXduGjjiteD1YISs0wgGKD
	uvngDp1k8Ij32XYtTOI0QEVTuduQ660kcIDUdC+LFkTihpyOJPKqYWkU8mZRRBRb
	sUaWku+nC71t94QcstkLrPHBtY6t3kZ2FnvDApmyrSztH07aquMLvfD7m/Q9C0vu
	I4JzxQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8xghe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:33:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faa0435aa8so8595896d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341988; x=1748946788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVSa5TyFULpC2g1pbka3bw5G/Zxf0bHM9jfUTPl9ru4=;
        b=pmMDPjiJJZjpIt1D0BNbVHXaYPdcY4zvcgoc6oaSf/a1G/METOilV3mmCNgyVJtPiH
         MQQthOA+mWEvOL7wJ9QiUjGB/se2xZkKJZx6jXMTEX9pLiRiqdfMei8fUI1FNeZG5xKC
         s/XFuH4Z/t1+hZPEG/6nMzcO51Ud34LSWxPr9JFuVo9cuaOB4wEJnCoDVdaNWYz2xd4H
         4SH2ANgyEIV8CccCYcxIjsVexjjYpxRw3pXQ0Twi+RinfSODUbjBihyQXr+glfkCgDZ8
         lwY4XVW0f1bll219eMkKtWOKz2i/3fCGY6xklJ/JfHwbOmaB8PFvikB4NszKifgsD8j3
         zXCw==
X-Gm-Message-State: AOJu0Yz/jwTkrYxQTft9u/ILTJyWrBq/i2pkUvaIhuHisPd740pOqkTU
	kbanZWZr09CqXqShVw4n6u+kFnr/uVUGFWgJMKFvua1xKDOO+1GeY5ibF5XN/EOFSTQzZ2UEEki
	H16zVGQiwepb6DSAktr8opO1qW8FBUGul+kWrNUEiLQm8K+QDQuH2RoXbsCjXQQC2u8Js
X-Gm-Gg: ASbGncukSqK/mSdsYP52/yxOkvNvMpYV8Chb7ggyjm/Oo3+KVpCV827C90qneBKqyDj
	NHL5cLw4zPR33ry9ePei+BcWpiaRVUD8NBXLWiPZPa7sGWpo+XJ6XgQXe5mEim7YrirdP7/KHMm
	6jl/44wL/vTMczeVaVZsmhWoGwHbYyLnV6z9ecm+xyE5D3B7EzunMe0w1sP6clUrr9ogkoIbrvS
	OcOk1Jk+lBILdjuProJHP2C6SISYyNuSmVrt24WxWyDij1+zs6G1wP7K7K7JRZ3CnlpSbL/FOhh
	Wf8Gf7tiAvFcA+5Ca8hAAXu0rsxfuvm1e+ICr6RR7qq0c3QNG3/CHZCHPTNvOQzJdg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr72941246d6.8.1748341987898;
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJSSlpTDFYDWxRvDO2PO8VMKZpkqF2yx2SQnwuybT0OCxg5u7Q/jhHeEqb2VX9nRjheRGEgg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr72941136d6.8.1748341987473;
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88973815asm127933566b.129.2025.05.27.03.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
Message-ID: <49839473-58de-47f1-8b2d-cc994cbd6488@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: remove unused reg
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250525152317.1378105-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525152317.1378105-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683594e5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=kyqvF6sjOl33UedpCx0A:9 a=QEXdDO2ut3YA:10 a=Y3S50wn-SOoA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: o_JDIuxHfQYepEDChU57joFDQ2m-dkRV
X-Proofpoint-GUID: o_JDIuxHfQYepEDChU57joFDQ2m-dkRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX9pQs81l5uI7W
 +VaD6E9d+ouko+/hLf03/vatPeXUfijavPMSB3aqrqaTrg8OMokfRlYHTzjDDDNTcrPKX1EgPDx
 nqwP7uqWpwpIrnwlPKmSJ2EqP3VXmoQEy9zpQajezla+QIuAEHEzkofjYeuA2NAdwKNGrx8lAuK
 eDMPSL7ASqBSaJzwaJxysBywlK2ZwA0pobFjNdWTjMw8Cpc9R/xIhcMKVWxguGj3+svazWkbrs6
 VWRSzuTIdn9K7K5sBmzOvIIETPPoNwgeV7EIWHMPu9jLA3yK57DgcK+u7f3zx6sO8SS37olsyc/
 RqtpK6JPV9s5rWar3NpFoG3CEwSzORY+HbHh9hwGgRxmvvGIS3lUc3hpZlyFnLWnq2Z+2ZyfBFq
 8s7Rzgk4Kk9YoBSMlTsVSbkmEWU1xjpEKmjvkRZzFwcD5dhnZpyerhz8TtnMto8nbMRw9m8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=811
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086

On 5/25/25 5:23 PM, Pengyu Luo wrote:
> <0 0x17a30000 0 0x10000> is unused for apps_rsc.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

This indeed seems to be unused

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

