Return-Path: <linux-arm-msm+bounces-42847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65C9F8654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD37518967CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E391BD039;
	Thu, 19 Dec 2024 20:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lq/k1cLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10C22612
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641532; cv=none; b=kYDWNihPqEOoxOh8yP06Dcy2UZ2FsHjCf6MQtctD5LQwSImiNxcHOlqCraxWhlBKYGJ+LS19E7Vh36G8oOtlCIz0npSbaSG3Sdaf0cFM26JTFJECkQatupFfGYaSvjvUcXuJBWcgT/CTAMPNpKU1rHdYTj7EySiE6sZGnVIN0yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641532; c=relaxed/simple;
	bh=3zL/XGIzKXCff+csXDFxTpovp+OFcsO7pqY0yPDKX1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGfCNV2PidYKUjrXMeeBvASJTMDmF097mJlc3k+jGStqstCAPChEAVF08EHyblLb9MaZo7m5Gv6fdS7qc3jOfBCInKiuPopUqBN2b4iAvGQGqmDXKfPplMmN5zK/MrGcKe+sUKrTKazXDgR7/lGA1Jpdy16sg9hsvSR9jC9uRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lq/k1cLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJKhoCK032628
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDOY4crGsVLPcT0+9a95bCil/8vxrgosDFEPLg10pYI=; b=Lq/k1cLEDsTRGzFY
	gjWDUnX6iK2xLX+dbISBbp0OoHnY0L7vYdK3cUVRBuN5zNTLZc+Uam0Qjx/RWo3P
	hJZ/WAhgid2v3vojqLGAOyJEm1suoZQpsD4/ZhKzDAQQb9fPCTaHIzmd/p6JVm4V
	zbHUOzaLgDkz1kncX3u5VqZ3PAtXykqNLQHIG6E6FQxMPVFbC5MBXno10vNNirm0
	kC5Za79rsmCBYEqah9OvXcv4hV/cMTGcsvCcHOdO26S3tDJKzacXg0ijlJ+2Ltan
	Grna7/w3jZsniJ7H61ETOwXHxAsV4gWB41ZkaAeroDLV4VGHwvHzAbyeLrTyf955
	9qF/eg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mh3y9njc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:52:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d88fe63f21so2810016d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641528; x=1735246328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDOY4crGsVLPcT0+9a95bCil/8vxrgosDFEPLg10pYI=;
        b=fgrjlq1u/CJjJPmCBa2uzEUW0xSMSnVOTbZyTuF7HiAILGXLnlBb17r4MfQq71Sd1r
         pNasjEQHW9jKQRm/ond48mjO3owcjfG5+fzBu2lOuvUsYyDK9NfSBlPGJhamo66cd7BQ
         isf9yxyfZxJ40snrDIos+MsFaUdfx3Yn45L6xStcFw8z6LX5+OrMm3sVpuo7CI7cTbXE
         WBLmTXCTwfjxJHvwFGNEZqiI+7ofdgAyr1+xA7iejnamymZwl1B37H/l3wi8fLoE3IgZ
         PMCFJhaCazwpvt5IgQbqsrajiQuJv2LjFhLRHFEo2V1NcSPhCbR86XQDfZP4LlB3PEaT
         aCqQ==
X-Gm-Message-State: AOJu0Yz2fC0dB7+YMzcof7pcbhy/bSjBSNKQ/0h6oABoChwpfLFQsPyc
	flzjfg+V5BKFytEyrBAWA4R07FnQO8IWYqfNwR9q1yQX9NgrCqWvYedPR+IqCFO6jJWgoJKsTYV
	UZTt8Ot7iZWtW8X7dksMndlB0hTGbDmthnr19QU4N0F5GnLY64yvV8qdYG/q3nyJi
X-Gm-Gg: ASbGnctlqNauBx/Hj0MoqEUiQfr1u4yT+mvKv+FjAKHDVVlK9r72WDAdJtq0T/OwFOg
	4JVRGRYJ/3oGE9B+nP/ki23sZJ/dC17J9TLJgLJQ6fQVEpngpPTNBba+fJlOo6KwL1AM9mr7OnE
	w1rthBkQ5WmKJcKjW53EmEDlvjQVcKo/7ZJARfUNvctuQAK7g0CmFjv0khDZccEj6Tpq6W0xV0J
	jFaL7m3b/PfqNywIw4B0Ljp/cd6rj/p6oNlf1va7cpy5/sodDZJrEJek9e+vgEM69WbmRLXcuHw
	9Z7wts9ScsQksHUnrpdmJrQGCh0nRFTvJLw=
X-Received: by 2002:a05:620a:191b:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7b9ba7f78b7mr19746885a.13.1734641528073;
        Thu, 19 Dec 2024 12:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbPWNityfSPQey2DKDG/NfZELCU1gh/+dN2ktEbVKy/E66cxvlkGEYdkUjO2KDmHkudRidQg==
X-Received: by 2002:a05:620a:191b:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7b9ba7f78b7mr19745085a.13.1734641527740;
        Thu, 19 Dec 2024 12:52:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f065391sm100798266b.178.2024.12.19.12.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:52:07 -0800 (PST)
Message-ID: <f6128290-ff08-4780-8dbd-851ce013582c@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable secondary
 USB controller on QCS615 Ride
To: Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
 <20241218-add_usb_host_mode_for_qcs615-v3-2-d9d29fe39a4b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241218-add_usb_host_mode_for_qcs615-v3-2-d9d29fe39a4b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eDZCVeA0b27YbzWg8bqRCXiaTxk_eEt4
X-Proofpoint-GUID: eDZCVeA0b27YbzWg8bqRCXiaTxk_eEt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=762 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190165

On 18.12.2024 1:12 PM, Song Xue wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable secondary USB controller on QCS615 Ride platform. The secondary
> USB controller is made "host", as it is a Type-A port.
> 
> Secondary USB controller of QCS615 Ride has Type-A port exposed for
> connecting peripheral. The VBUS to the peripheral is provided by
> TPS2549IRTERQ1 regulator connected to the port. The regulator has an
> enable pin controlled by PM8150. Model it as fixed regulator and keep it
> Always-On at boot, since the regulator is GPIO controlled regulator.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

