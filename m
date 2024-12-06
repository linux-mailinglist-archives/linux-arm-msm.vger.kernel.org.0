Return-Path: <linux-arm-msm+bounces-40783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B89E6DED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 13:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008A418835A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6447201023;
	Fri,  6 Dec 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlRJ2MvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270671FCCF3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733487468; cv=none; b=MnEPqZ50cR8IbN3iYeB03oSYzM9mDNs4KAdrJjFAI4Uw83eNQf2GtVNn1etVCi3ATO3thEh1XawrOSbeupOalAvx+iHaz6QdQOEnXhYZuIQH1qz7D9jOq8uwH/AoqPeTWXr+R07BfSrgDcdTNa6RRWzXlQpYLdE6NUGxZR+5R+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733487468; c=relaxed/simple;
	bh=5wkWfO+hWZHxAXWoCicEQ/+F+PuZSVuy3eYlYUHtBzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fq/avUb5lG16LKZZran09HvOCL1NjvPgMeSB9uiU2cttYre6+Dr4QolpDAGjQN3G7wiPZ1+GcUGZz7wH/vIQreLiFFIhF/gCR6V8KZg2YFn39RnLN0aXMxreqa0UV3Xrt/9iblLLO27jbbqxqYMSxbDQlPr0PALp5t6siLc6MDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlRJ2MvL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67PBws007706
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Dec 2024 12:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIc1Z7YLPTzeUFAcgBGUiX8WBgeyaJlURl7cKhkV0Mk=; b=SlRJ2MvL4q1Ukucx
	79NnJZPYf3AwwiUZtxBtsKv4R79lDrO+981RLsN0/EeDxchjMAkki99q/m9NUTKu
	7DkGHBiWamEjP7g9rGGQTZi0nawZ6Ysyih5WQYRC6YBZoxiHvxiYQyYiL87O9l09
	WzQFlZ125EctI7FuHeLfqT8kuQ668ubQ2oM49CKXnCJxO6SHMWMnLUVRgjsYjW35
	GfjtxMBWXzRtcSl1Ee3PvDy1boJ56zwwwwOv3RXPfXREieE9BhJbDx6KdTHPzi0f
	caHK9N/ZpCSLgwnfj0tsCFUba8Sk8wXLsbOKlDQdLKwqRBGYatXxQMt2/VlrAlwG
	qngQuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8b0sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 12:17:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b667e652c4so14054285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 04:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733487464; x=1734092264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIc1Z7YLPTzeUFAcgBGUiX8WBgeyaJlURl7cKhkV0Mk=;
        b=K3KNgnOsxhgcjIAbt8lty+0sg7Yf1Pr1aWfqLa0F+TsFbTv92J0DyuyQzFBek2XzwD
         rdtgh9MCoJUFL0W3M3Q3pBB3jVPy3ixUVjG8i3aa1F4xAmii4pMKHVjrQRCn9oWx88W+
         JTTwpKaD8Pzz21cSKTDe1HS0RRRaxy0o0SecXK5mSM0DEm6zTECcemzJINogaZPHmCpL
         vhmADValuhAfK5mYZwrey+aCfIkqDy5jklnEtVV2uqkXoCZmtC7nPhlKR62NB2RUwgXz
         QVEayZEQDLI/JAAZXl9stzzbR+ybIN9g32vjvfLtDPcercl19dS4ItuTe0QMia1S8N4T
         tn/w==
X-Gm-Message-State: AOJu0Yy8gkA/1Z6J0bI1riUFZVPjoo9UdQrqg9nI6Ktscjvemu+M+tDV
	YhqIp+ZnDmPF7CtiG1OLzvleGGNg/rPZdR9tNS05N26/u8Q9thi19Vu0wZ00X5+B+clvLYSUI6I
	e7urD9bv/flZkVm+nJm2EWeZuRPuA0Qx4Y1PRllQ18h+fjOsND5R7WwOikU+ok80I
X-Gm-Gg: ASbGnctl9OAp5T9YhVNx/z7p/khGc/hbHOfwUa2TQx8NHI0Oc8uyGNbwp9/k9+zZgYH
	mwBG6mZAHxTlUyykdsc9gV1coR91NgY7Y4K6qCb4Er0NRJM8DGpmzJE6F6CCnYm2bxq1KaSVybd
	fydBujCkTxg7hB7sfG4Q87CH8Md1VSv8MOtjh7YV9L5YQh0I/9C3I2Y+U7kz9+WHlZt++MIfvDY
	SYmFU6eFpJVvgyll4t1ZqCRiGYvaWrCpG0NpspbbesVPjje6vL2O+Bu1u1Ai4Oe589ORrqsjARu
	iR+8mpYA02wpmSknZJoltKOd4UIaZQw=
X-Received: by 2002:a05:620a:190d:b0:7b1:1313:cf42 with SMTP id af79cd13be357-7b6bcb5c27cmr209648485a.14.1733487464058;
        Fri, 06 Dec 2024 04:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfEbyz/to2eX0ORRsVQ69uE30/rqBFU89xE7K3MXKBCOC+9NJDlOjylc2i3dLlYap3aPAV7Q==
X-Received: by 2002:a05:620a:190d:b0:7b1:1313:cf42 with SMTP id af79cd13be357-7b6bcb5c27cmr209647185a.14.1733487463721;
        Fri, 06 Dec 2024 04:17:43 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96b0csm231761666b.58.2024.12.06.04.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 04:17:43 -0800 (PST)
Message-ID: <da297f8a-a925-4ae0-9cd0-c4b7f8556c49@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 13:17:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
 <20241206-dts_qcs8300-v5-2-422e4fda292d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206-dts_qcs8300-v5-2-422e4fda292d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L4-nCiSTRpM9obUvNSjX0mdnDaTUMQSS
X-Proofpoint-GUID: L4-nCiSTRpM9obUvNSjX0mdnDaTUMQSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=748 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060092

On 6.12.2024 2:35 AM, Yijie Yang wrote:
> Enable the SerDes PHY on qcs8300-ride. Add the MDC and MDIO pin functions
> for ethernet0 on qcs8300-ride. Enable the ethernet port on qcs8300-ride.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

