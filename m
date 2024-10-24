Return-Path: <linux-arm-msm+bounces-35723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34059AED0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1FA0B20575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E25D1F819C;
	Thu, 24 Oct 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKESlf/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7761F6676
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789384; cv=none; b=uOFajvnWSx83YoZLARbHa1K6ZfBB3eZnyqhLyyB5nz3uTx8Li5gcZ7mD7bA9h2wAIhKBAfcGynpdSZG3+TK6H00tq5O6oQd0pAE0VlGNiYjdmHpWPCLOH72YXYmyCVqU1e3+eywz3OPgF3lLph20uhUQbjOO/vRbk+Wrtk3E76c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789384; c=relaxed/simple;
	bh=PQ4zZ+vpUUBZz98OPfmQ/f9IgAytod+hx01dezT1/kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYJj5pYMO/pupnR7w2YC2Zh66TqfDg5NHMDHlQJSOT5ls1IhHg1ZBrbC+U9bcj+rbjtrAe3YuZmIDrQi/u9CLBtrAPlvI3Sh/JJitBGspY+HgnNZ4TP7VCLj6aX2MvNGhns2iZ4Wcb/1RmvOT2wb1J0VSRTCLsFH8+820l4Uu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKESlf/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OCdYkS028832
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUlMzHI7+1FWYVHdeE+crFlz144uqgJoZlthEYfdU7U=; b=fKESlf/cCsBm2Ppp
	RQIteynzNNWaFkaLO1FXpFcChrBOoPX5Vh/s9z7X17kGsuPU/czEpSpU8JfWWZJ5
	Nu726f8E02rucu4KWubtnuuhkvbIZUhh2fnloFBOc2mf1i9vECZ83fP371gRewIo
	accEVEYI2bCxapJkvRopZ1ohiVRF8j45LU5woXjWO5aUJBLY5NIpOVcugoVMLWpL
	XGBaXKbtDvO7FDLExy56wdhPFeYhQXA4+GezctdGht4mYCT0WclulzmudByipIjo
	5xno0bXZM68hnn8PHS+NPXscqTiTD/TY+PW54s+i1Ajs2KvskDMTObPnvfUPe8mP
	wyLy3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxj7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:03:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe5e8658fso2539306d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 10:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789380; x=1730394180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUlMzHI7+1FWYVHdeE+crFlz144uqgJoZlthEYfdU7U=;
        b=f0PzREPjdRRLujJ6LzIi1son0VPIaqr9O/ESn11rYVLrZd6fK/GyKxPsC/4NUqBiAC
         uomcTXHQt5FTE6Ot8G12K4tAgtM5hdl4MKaHWWGsFQ3HQiAMDQOGOHBN3E0BpJ98BTPC
         jbYwC3cArH65+CGw5tTp373TtzX1l1QUV6XDJDBjOBtTLO0EWn+MGgGDTxmZxOGWR/Sg
         HPWIpVj9Cfcc3P8ks4x/jaH5omAmyc7Q5UBSXhS5x9b432YULN64Df0Ucong9dy1hi8w
         dzhu9EzHmRBz9DZhbZoUu2yQBlFyO3hx8hgn0dPLSC0IWupjtk2wPFqw4qD05yQrd19B
         Q1Yg==
X-Gm-Message-State: AOJu0YyGxhUVh2O5ET0ohs+SjsCpjaE5mIOR6zqwVMG/c2ew4QeUTTMQ
	o/wvCd9B/HPeMF7V20OcoG/8wtzGmktOzgZorQR0MKn8kSiNpd4/cSZEAbMFy8ciCXY3k8QZKOm
	Pz77lYo+I8rYM/043hT/18MDbFa+1w1JtANmU/pyRPZCsly0uY0L231PGj9xFZFDO
X-Received: by 2002:ad4:5e8e:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6ce3429efe7mr40119766d6.12.1729789380294;
        Thu, 24 Oct 2024 10:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErivPc6fmXIZH89b8InKtojO/piGnSylk4Q1RcUf5kCpJfBLE2UQ3WYyeNfa4RF6q6QGeTdg==
X-Received: by 2002:ad4:5e8e:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6ce3429efe7mr40119036d6.12.1729789378414;
        Thu, 24 Oct 2024 10:02:58 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571ef4sm639419366b.153.2024.10.24.10.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:02:58 -0700 (PDT)
Message-ID: <adee8553-a531-4789-af19-1bbbe2adb59a@oss.qualcomm.com>
Date: Thu, 24 Oct 2024 19:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar
 <quic_sibis@quicinc.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241021231823.2635534-1-quic_molvera@quicinc.com>
 <20241021231823.2635534-3-quic_molvera@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021231823.2635534-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4sYEQgNBANFc4bIwL_VMY0cwwTqdh0Mf
X-Proofpoint-ORIG-GUID: 4sYEQgNBANFc4bIwL_VMY0cwwTqdh0Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=881
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240140

On 22.10.2024 1:18 AM, Melody Olvera wrote:
> From: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> 
> Introduce SM8750 interconnect provider driver using the interconnect
> framework.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +static struct qcom_icc_bcm *lpass_ag_noc_bcms[] = {
> +};

Drop empty BCM lists, the code handles nulls fine

Konrad

