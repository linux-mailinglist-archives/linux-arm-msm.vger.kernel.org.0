Return-Path: <linux-arm-msm+bounces-80997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86FC46611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628083A9EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE1A307AE1;
	Mon, 10 Nov 2025 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk76Bm0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvx5R2QP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4E30CD83
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775404; cv=none; b=VQLjcfdGPZiOd4JeBvAv9CT+2qAKlyG2q7mySS0J2c0l4wQgYh+oBVXud7B2lvp7G6YCnqcASwHFo6pIQZtaFBJMFCWJf0qO4VwHyloIq4C4wHFotWxxPPQ47gsyhKtgQ+0jYNbTtfJdlsRhWG7RViLLqmeL5d2xjlZVbHkRkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775404; c=relaxed/simple;
	bh=PbfOgtPT0n2UXrEeiTGt3mSbUyFEmdqiEYouVpjeTQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxBfz3EwXKuTIh/WNrLDWaH8nUtoyx7/B5tEaktsddRkTHAiVpWk0ovhUDHwFN16YKaca26wpCxKfMk2BH+rrNindMinqzB6Kg+fo13KYYN+xfDvbw9RR7wmtSkUyee/6x0Sw4FIpzGaH9Rnpr2xnz+q2sWHocWVyCQ4yTGgwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk76Bm0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvx5R2QP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAAcKjN2546988
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toGXLTCJlydVt4OAEmWhLmfjiiINqMpQruYYZvrtmdI=; b=gk76Bm0HEIR3QPsF
	p7UsJGZS/mEfyH6qsxu3gXJ1AhsXIYhbfNQg94YOOVS6o8U+T8h5Sek35YtId91i
	cqj7Gj5N77/fYFyyw4EeC7KvyVPlkTSAzOMj9OLvf66DoA9hxsP/IM4bc/0JD2hG
	8RONuhFUHeg5hLuJHdjoJWcGeIL8P+QU0wlD+o2/KDiDkst/UXG7WGXItqYXjCW6
	5W0BQfPmLHk+Wx2Ygy7+mvpRdbebCFsDvDo3LE6IXZBODMirnJRHjLyRCRG83Dkm
	UGiMb7fYn/bsJEIgYcKKKcUwUBFa7ic1wERFslFeSMTEEb8t3uU4DvJginSUOso4
	6AIrTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea9any-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:50:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8906754b823so115823585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762775400; x=1763380200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=toGXLTCJlydVt4OAEmWhLmfjiiINqMpQruYYZvrtmdI=;
        b=kvx5R2QP6T4yRuayO5k5s6nvc9Balhe/8wpNMPyn7BFeA0dLjbAp4pLoTNFkss2dTC
         nESxj2KPlakZtFHJTm7KAlKF5uItfjNVeOHI+tfSrh3y9Z692EExyk7bfHbQsgIWCRTH
         9k0n8pENWYSehv+Q0GL+DUzv1mNaFK6mfjDbP2uTjLwKu10hSSHxRIaXtb0exuiIze1x
         ibVx0ENVa0EBxD0tS/pF/c0nEZXnN7/a+nDvsjLuWWCB0MzdDuxiLY9kKFFuhWyuLIZW
         EGpq7TNbe6TGcB6WaMBzhbzndmec8yVDUU+EMlym0o4g8piGt3aSrgvJdcvuDp3ni7rR
         73WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775400; x=1763380200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toGXLTCJlydVt4OAEmWhLmfjiiINqMpQruYYZvrtmdI=;
        b=lpGkPG9pqOARr0CXf3SaQDoPo1gNKA85uKly6HTJxWy2/OmJpMdMP4AeAXxZrSCqZu
         3oJi72lqnXRkYABGEiONscSXlp/7p+bsJfI98PyH34ngSdY29acox5rR288iunKSWkBF
         opdAe4G5L26uPE/xWq2MlrUFJKslDT0e0ar04IoBNEgoRzFHYcKLzd7Rj3uQz0IgKQgR
         YkupPv6gFMgHpSLDZvrKQdmTfzxJJ9603PSi9ZDryt0T/6ZUJ5+iWl6DgPjozZdPRrN+
         q6AEsKgpOrMw9KYxZcpQY7NyzNflio75SMhyCX8Tey0MBmGPK0dMRCQLxJ/kW+1ChD5Q
         JXEg==
X-Gm-Message-State: AOJu0YwLggPN8UCI9V1Y9Fv+dJ285yDSAC47IDeCyBUJbPnLYtlRD4Vc
	X63/pWA4+fho1LNp0zN2ItNGB8ntFYz5/UGqis6mlCwoLMy9glzWLSnoVWc4TiyoEJ4bYThfK3L
	KArAdcQApciE8rpw8CxhrIyJxQ2W2oJWoU+Kwez9CV5qLEx8L0i9YsVwN9+NWEJyVoSgZ
X-Gm-Gg: ASbGncv6FOL59E7Vzn79ozFuhPFDQ4BqaLgc8ZdhjJ0bPiq4cx2Q/QN70X8g1sQ9aRi
	Wqh1au3zk6Bys87yvJD8Rw49w6M6qHgmRVv2e/BNCZlo6PqlkacyeOqZ1UvCJqGhuNKyfyp6B5q
	TpWqCr9TxCTTgVXTeotPmGKVUQXhv6SFOGyzjmIX62e9gmtlK+a9mGEMfBhTi7JgfWm6mTfPaF/
	6tHAvwgtKkG8qpJF7h66ZtX+gXwR2LCh13iIkN/T0ceAiKepOp5ewveB/GJo3urBTRfUslOVzhk
	Cve2riJMUXUEq+8RHfeyXATpQ50nGpZTbVNXPT7IIVlyYCVBFCEx6iIhtciFGQbe9KXAmuhkkYG
	EY5Ic9SXSK3upUu3sUdVwX9p+O4Flncsyf7tZi/cE1ijb3SYyy+91tHp/
X-Received: by 2002:a05:620a:28d0:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b257f06a92mr604940985a.6.1762775400417;
        Mon, 10 Nov 2025 03:50:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVjQGFZFRM2pmp/M8zDXVLETjOwEc3uxHXPygKZvWFAmQzq7WVw+Rm1obV6L2pDPnFYmJtbg==
X-Received: by 2002:a05:620a:28d0:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b257f06a92mr604939685a.6.1762775399998;
        Mon, 10 Nov 2025 03:49:59 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbce8f9sm1072113366b.2.2025.11.10.03.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:49:59 -0800 (PST)
Message-ID: <28ffece5-29b7-4d6f-a6cf-5fdf3b8259ef@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nrablyWJmVSI6JKsamBheNdYaqbWW1jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwMyBTYWx0ZWRfX6VN6pedxlyjd
 v8gh5jtb1o/+xSGxgAxkMwbDH1B8TGCF0OJZroVwyu/c9kkzteuXfNN6gPFQ5x1cFO65Za7ChmB
 7N29+9B/DHnxuljsx0m3/eVZQIb+RMcs6NoWczIlYo6eS81qHuK4jAnOQZ0ERNmBwIbi7FtCgdO
 Dcl/uSsjX+IWfZ5u0yLYNmZVrguDslLlFdwr54lnIb3H4qk31mznFU10xOYl4w66Rjjids1dzwX
 SGRgvEORIOGk1asNyUHOfQ82LRwh9Hja77enbvoY8/XxV5Oh7DnRlteRCam2dY+Wi09dtQOjwKU
 DovWx2fxFIvYu/C/6AsLlo7forkinE0nw2JjQagorTb1rPBAt1TTQQ1mQc/Ydfo8XS25S1bkLb8
 OvctgQJUqDW41YceXTtY+KIMasCWQQ==
X-Proofpoint-ORIG-GUID: nrablyWJmVSI6JKsamBheNdYaqbWW1jZ
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911d169 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b7yh_2p2DTCkp5fgmd0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100103

On 11/10/25 6:57 AM, Wei Deng wrote:
> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> Bluetooth work, we need to define the necessary device tree nodes,
> including UART configuration and power supplies.
> 
> Since there is no standard M.2 binding in the device tree at present,
> the PMU is described using dedicated PMU nodes to represent the
> internal regulators required by the module.
> 
> The 3.3V supply for the module is assumed to come directly from the
> main board supply, which is 12V. To model this in the device tree, we
> add a fixed 12V regulator node as the DC-IN source and connect it to
> the 3.3V regulator node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

>  &apps_rsc {
> @@ -627,6 +708,22 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&qup_uart17_cts {
> +	bias-disable;
> +};
> +
> +&qup_uart17_rts {
> +	bias-pull-down;
> +};
> +
> +&qup_uart17_tx {
> +	bias-pull-up;
> +};
> +
> +&qup_uart17_rx {
> +	bias-pull-down;
> +};

This is notably different than all other platforms' bluetooth pin
settings - for example pulling down RX sounds odd, since UART signal
is supposed to be high at idle

see hamoa.dtsi : qup_uart14_default as an example

Konrad

