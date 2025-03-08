Return-Path: <linux-arm-msm+bounces-50717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155AA57C8F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E88E37A5A60
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19DB1A2C27;
	Sat,  8 Mar 2025 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKkITgoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C3AD4B
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741456694; cv=none; b=KhC2n5TorU1MVGq+TGUUnm8LID8LX3ZYPJ9mO3S45Ur8z24qG7pAYGAIVF7t/ppy2Sp+5W6jru1MT/vlsCCqNv7c+ilznMC+UpHmneM2KI2nmudprmD+NYDtxTRoC992r48c3nHIM68DOf25Iql6s/lpFcbYKPRZJjRsL7BZH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741456694; c=relaxed/simple;
	bh=DTwxP2GW5T7DulwloGAKdjS+EfeDO0vUSjlUc8CnGJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmieu8rQptHNIQQJSpQkrY/+yPNANz07ewagg+pG+gqB1PBkLWKQR/9lUB8gygNhCGFuuyqH1N7jBE3pjeTRbJ0rsOJgzKNOrEsLir/i396tqpO9fftyOlXD0fSVsuoGTN7bE7XoaeDcE5pn8ukYWMxo3APSCwJDUue+HDlB+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKkITgoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528DKDW0025341
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 17:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndoPm+wLhTR15mIqP6fWmUhkHpLNXcNulvnJ9Nq1v/g=; b=TKkITgoZ5L62rZPh
	bz6Cplt1ieq0AROpN2hdXQWHeTuRwTYQKxfMH+TnThQGPfL1NujmXxtuk+TFoxdH
	2jxpLTU1DvbfM0cuyAWVIw47k7oJxps4RUtk95J+ISoc2ppJx19X3cfTe+6pFel8
	InG4pzAd9SlsNPdHlcJDDOWIl8qG7OK8ZW3eJhSHdtGNDcM0DCiOdsLzjz/uTb3L
	OQ+0GlUvvFM47IjN7ABMpOd9cIX3RQhUsORuSnXq9kwRQLgPZt+Unmn9s+7xjzsl
	6ajTKzg8oWBrx7xzQQ9XWhleQPTG21AxYojaLlLBgRao688FBt51UiRXZhuG92nJ
	AxS63A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rx9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 17:58:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766ce9a08cso546091cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 09:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741456691; x=1742061491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndoPm+wLhTR15mIqP6fWmUhkHpLNXcNulvnJ9Nq1v/g=;
        b=fUq+G6oeIulPfxcyKT1WjPNaHkTg/5GqLH/R2qXw/pdwS3OAE63dJfJAJAIeO7nu5T
         8PwEU2wrTilf5TGmSUA1GKjG3HaPRmHd0LCUBrWsgLAw/gYkKSj/mP6vp0ioGau9Zhrp
         gwckew8SrCHEe6wfwdEHpj4B7Jq6eMmUUky915AYPV/PFCRkJ0G/BA+lXhwtQgK9wDaE
         kjSdnV2hHImkhkE9H4BW+XSgRN/am5qRfR02tdLr7NrIvf7mEZ3+xwsROidtD+Qwg9mA
         lqaZY+fuijjIIiEECvqeu0vGmAWLxsU2Bt3pXhmvB+HXuIF2BLdWjQa04os06mBuRtNG
         /V5Q==
X-Gm-Message-State: AOJu0Yx0Yeg/vqcvqU2cnx6GKfzOMxRiCRzGgghirK4C58uNfeQSNSDm
	23MnsgrQOQ8jTk8bN2GYCKL0vwQ47V8EEZXf644IXoJxyrYEcJP9MtwAWgBJmaAfj1626vaplds
	P+MURxcH0JTblG54UWrZogqskzgSE+fIDu6w0yO1ZkA1b8lf+VEtMesuR6SeqZiCJ
X-Gm-Gg: ASbGncv3yJRMxTk1bH3du3hp84Y20p1RgDcspGRZKpLsLp/rQ4YFEnKf1zgR+hGH/fp
	sEyeqTtraeXOG5m0wKjgjEHzOLG+/JFx2CjmCcMKYH3wj85Ocfnv8ZuihyVS+5TSObD8a/lLZE0
	YBiDd74yt/wZs3lc1d/yCbrig0lS74oby1t4IQ7nX9hg8e/LjO4C0NDZGWuTVKXkQA1ZeC0Thzy
	Xjkwl6XuqVECq/q9rqDss9C4Ml7hxC3j8qd8eAkOR9lfLuzfFDm6E3r48Pl1rfKE4N+s1S8Tafh
	KyOjHqfKljTYjURyVy1ds0EGJ2GYLq7Hs9w8jfWrmqG0jrwDJTz6rifgcqtjM23xrnRywQ==
X-Received: by 2002:ad4:5de6:0:b0:6e8:d9b5:4131 with SMTP id 6a1803df08f44-6e908ca81cemr18109346d6.4.1741456691242;
        Sat, 08 Mar 2025 09:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwWnxVYC3JH5zrCZZSA7cwgUX9Nj/k5VDUse5wQOlChTKjJAlW3O9RMHr7yqSsRMJeeDCyQw==
X-Received: by 2002:ad4:5de6:0:b0:6e8:d9b5:4131 with SMTP id 6a1803df08f44-6e908ca81cemr18109196d6.4.1741456690860;
        Sat, 08 Mar 2025 09:58:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438117sm459641466b.26.2025.03.08.09.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 09:58:10 -0800 (PST)
Message-ID: <27c48f41-dfc3-4fb0-84f2-c9123d2fef56@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 18:58:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: sc8280x: Flatten the USB nodes
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-7-4415e7111e49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-7-4415e7111e49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc8534 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=08ITDv3IiRPUJx8zK7wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yqIFhQSr_zeujum2eihYOWwFAw3o-XuZ
X-Proofpoint-ORIG-GUID: yqIFhQSr_zeujum2eihYOWwFAw3o-XuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=719 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080138

On 27.02.2025 1:17 AM, Bjorn Andersson wrote:
> Transition the three USB controllers found in sc8280xp to the newly
> introduced, flattened representation of the Qualcomm USB block, i.e.
> qcom,snps-dwc3, to show the end result.
> 
> The reg and interrupts properties from the usb child node are merged
> with their counterpart in the outer node, remaining properties and child
> nodes are simply moved.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

