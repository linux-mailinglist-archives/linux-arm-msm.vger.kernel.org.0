Return-Path: <linux-arm-msm+bounces-40601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66D9E5D05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592F5281DD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D6A22578A;
	Thu,  5 Dec 2024 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIqXCpJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E412225764
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419499; cv=none; b=KPym0cLMLA7K81zeHGmEpZNYcKKw8IFQFG9wd8OT9F/H9c0eCW+wnAlsVmSclIGii8hfLnJbxLxp8oQdrrPKmXyR8Z1Um9BDLbCrMWZ7PpIwbZ8bktDW1nJI+9xBwqVJOendK19mu4jyz03vdMb6bSnA27dYKXKQ7V+EtHnc2tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419499; c=relaxed/simple;
	bh=8iqaVQEzbHatx0dItN9CGjEVuPOwodMcycThZ2wp2ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz/yVm1Ih6A0R32gGTiS+ZiNZ73S+3TP/Z+OxjSJTKXV5NcPixeyX/TBR9XVfEI251fo8MsJrAYAX4eaS8mvoQtePkpgzVQ+wrYJ4hbNUp4ZkJXKhB6sSTZCR/8jxJUgj4HL41Ik+cNzF05O6jIbHi6e1/3HMBCd+QFM6le2cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIqXCpJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EWlA2016480
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Yk44VEFeQYWq/aMUQP1cCfyktFWIWkcN9QVAYEAMyE=; b=JIqXCpJ8xHu7YLNG
	mH9q06PhkUQ1ha96qEo1/sR4UaPbtrGus2yxZXxNVUYA9hQHDznTsg4baxFPmkdt
	/M6HbHjQv5vhd+Q0tFi9G91Jeub7JOP2x2p3j1+R57InvgEvrGJM/rShXl+FgTHo
	RDf0goRJ6JgAQt0eNKeXPhVxGf22OVCvTP6MLTXHr5P7a85Ci2r8Ny7ET1XHAkRU
	4GqRlK1JAdR3egKiA65SooLS61RIWF63/G/lOAetPJeZlRKsS6gJ8qd/AmDsWZ7w
	3jnuC4cHSk56RxISEpibkkGAg5EDznKiKN8OfSxUCmU61NG5i4otSIQkNvgBy8K+
	naNfTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170gt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:24:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d885b3003cso3400746d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419495; x=1734024295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Yk44VEFeQYWq/aMUQP1cCfyktFWIWkcN9QVAYEAMyE=;
        b=THWnJr7ENrUdXqiVOSNUszCdbJ+YgUtutb2fH0urFbrRN3eVazEJIqoff41yNKst9v
         iKgPkPSbg++tSUZBdhQSFGzt4kCUE02bkw/cyGI1ZeLiGcAuyfNaDtm4kH1GoRTJdIP6
         cV1TPIKNSwxuK/04hzDExAv8qHLHpCVnMO6wveMWjLcrO2WgDsW2FZBtz3M18Srw8eTj
         dNDQMLW+RPQuIEn5PpnwkeM8cmxBau36ymBVv5YDus1WgBb+ywRw1llqIWhpQKfZuIyx
         EjOUyRnmRaMV2rJnAqyvSnsX3eSMN1o9S1QvV5ORLsW91MvYn1LXEqbefElsEBLi2ece
         2z1Q==
X-Gm-Message-State: AOJu0Yw1A64vuYQB7k/uYi+ayFnq3Ph6kkVKVGUyrXsR5HjVrA6L4Yhr
	iRPXCbB4aDoBkZzqR8OD5kRWZGZiJAjCNQ+R9OOxl2nwlaQ2x69tnBBTpUoFEYeXzObbV6HFutm
	ix7D9M8h3EczyOy/wSJVu++2PbfNUKKuouQ9G81YMwHKjUVk7QKiKduHy8Y21Y/D9
X-Gm-Gg: ASbGnctEPpAJwCkzo2aMt5IJgcSxIHdgep19RJ3K8OdmGCAqRArYYbRrsXSsqxX0pGJ
	5UZt2fMFTilPqZucRYlQbIgZX+dlhEJhFQKBiJy6wbCr09COhRDISXQs913rWGKm1QrIq5bXd8z
	LF+jp+X9CXIktovmSkqWIX94eykBvmRsXaUDuswD94wrK4jAJzywMwP8Paek6cRrp89zy1/5v8y
	ROZGiGLF8fEd0vDHyNbBeA2Ihsu5MTovBbqXDeN0uzrcgletozXQg8Qa5MmFo1a6p1eDsdHAdSE
	0ztzaXf2yluQdnskEJG0nlyMGjb3oKM=
X-Received: by 2002:a05:6214:21e4:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6d8b72eec55mr75126656d6.1.1733419494980;
        Thu, 05 Dec 2024 09:24:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw9bsOhJSV0/o/fbAR4Gewtit13XCazbhsTB/3e9KkmJBjvW+hEQtMSQWw487E9cgauG0+qw==
X-Received: by 2002:a05:6214:21e4:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6d8b72eec55mr75126446d6.1.1733419494554;
        Thu, 05 Dec 2024 09:24:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58ddesm121274466b.40.2024.12.05.09.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:24:53 -0800 (PST)
Message-ID: <5255398f-cc9d-4f85-8433-d6a4183dc449@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:24:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: ice: Prevent UFS probe deferral on ICE
 probe failure
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241203024005.391654-1-quic_yrangana@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241203024005.391654-1-quic_yrangana@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kTCxjAHIJ4VfwuU5wg13G5Z90RUHVI9O
X-Proofpoint-ORIG-GUID: kTCxjAHIJ4VfwuU5wg13G5Z90RUHVI9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126

On 3.12.2024 3:40 AM, Yuvaraj Ranganathan wrote:
> When the ICE key programming interface is unavailable, the ice create
> function fails, causing the probe to set NULL as the driver data. As a 
> result, when the UFS driver reads the ICE driver data and encounters a 
> NULL, leading to the deferral of the UFS probe and preventing the device
> from booting to the shell.
> 
> To address this issue, modify the behavior to return an "operation not
> supported" error when the ICE key programming interface is unavailable.
> Additionally, mark this error in a global variable. When the UFS driver
> attempts to read the ICE driver data, it will check for this error and
> return it, rather than deferring the probe.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  drivers/soc/qcom/ice.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 393d2d1d275f..160916cb8fb0 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -41,6 +41,8 @@
>  #define qcom_ice_readl(engine, reg)	\
>  	readl((engine)->base + (reg))
>  
> +static bool qcom_ice_create_error;

So you could drop this..

> +
>  struct qcom_ice {
>  	struct device *dev;
>  	void __iomem *base;
> @@ -215,7 +217,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  
>  	if (!qcom_scm_ice_available()) {
>  		dev_warn(dev, "ICE SCM interface not found\n");
> -		return NULL;
> +		return ERR_PTR(-EOPNOTSUPP);
>  	}
>  
>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -303,6 +305,9 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> +	if (qcom_ice_create_error)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	ice = platform_get_drvdata(pdev);
>  	if (!ice) {

..and check for || IS_ERR(ice) here

if I'm reading things right

Konrad

