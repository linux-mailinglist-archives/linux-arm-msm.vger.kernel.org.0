Return-Path: <linux-arm-msm+bounces-40781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8A9E6DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 13:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B842188323C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 12:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF41FCD07;
	Fri,  6 Dec 2024 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oap3SO36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04721FA246
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733487330; cv=none; b=L8IP1ZNy0Til1yhPRuxx9ZxCCesKTNK0rhazsYNssmv2q6+JsBX6gr8FvWM1fJE8E1uQj8bHZWxp+sZiNJs/5+MxqLNIEr91GMLoHXNxorBhLkKfVvKICmTiTTjtwhms1xdQHEe+bzAm5GgGKRVomh8EAmoPpKIqINiX3Xdn1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733487330; c=relaxed/simple;
	bh=69qXwDohScIWAfOVSletqrNr7qyRi4Q8ER4mXTXso78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDBtVB6ZGhx24tNLPvdlsTZOe7s8JrFXeCwwh1l+cdJR0b+WfldFLnoPQCDVGx3vZQzWD+N0cTkEj6S58Tjckx2u1YlbokEpN5SO/KwY8tGURXTLqYYiQ7uXlrS06vyhi+gaVWCEFUnHaqL/b+Z2xZpoIsU5BcQ7DNx+AqvFjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oap3SO36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67hIY8003829
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Dec 2024 12:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OKC0p2yYzG/HSgY9TWkAGbxInJSraSIIykvrnmj30I=; b=Oap3SO36aA4Bmimg
	qevVSJjCqQQTEUcGqcUyOEzB/MJuptREbOcmAN6RHC0k/00TGx1uG7vBUyGotksR
	7iSY2PYclrQ/78NrrQqnWSQjYblGrRNfysHHoHM/pwvPH/bICbAt9knU0gSmsC1B
	Ulx/oZojWyFzXoqzC3a2++ETIWGtKd048uNVT6HBLvWqjy5lbr34R83qCRGQYma2
	qYOXE0LmsyxQ9z4bk4OhfibHxNSehyjftnzPJxoClDKMgu2uM3qZl8YWYfPVDaOI
	BdVuMmcL2Q0eN7bCREcql9/1+VlxLhJ7FG851dEF7mO5zSRKJbqwdqeqmIlSL7GH
	uCtR8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm3h42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 12:15:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e7016630so1467476d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 04:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733487326; x=1734092126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OKC0p2yYzG/HSgY9TWkAGbxInJSraSIIykvrnmj30I=;
        b=D8ktEM1lu2/v1g7+Uma1W8gz/GqKZLr18bJ6F5nwwfcqWVckHumo9tzkRImcJwO2sC
         iApO+SKi7KvnAoPxBvpDFoMIoGyAppqTE+1NTDb71Ss1y3cnXj2EbH9BUm3u+g41YKZk
         8QiJzJO8G22Ha5Q9ZKkMoWsKtZtAl/h8pLKpxmNjy5htSYusETAx/DTSx7wSC0g/iCT8
         LfvVTvgc9Ns1uyF/m36fYhQ+V17qYwPvnMNDEKHrjQzR3i6s7y9iEA2uDRfkvgwUUSsu
         onlslEzHddEjYl4j1yFD1FOjd7hTGJ3r6qnYB8Dzs9Ux0SLpzZRxAYwhr+vPI48IdPWe
         yt5g==
X-Forwarded-Encrypted: i=1; AJvYcCUIdg4fg4FpeuuaDUiwk3pmZ7Vlh2FH9Q9vFyzVCTISkAJNjBcnMInOsA8LG5NrKKrOfV/j9uY+nfTvsvCU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmw4hRDHp5dr1wD+BiUpGnOlnX4ML4XFWY3zGbD/LS5SKChe0Q
	hid5chhXwahI6kzA1l+61YODnTQRD3gCBQiw0Ic9aIe4mN487KzBV1Xczw/m43rUVrLsfeNruoC
	Vo1qmhsZIA4B2iYd+m/mntsBcfpmJtxZJTCx9yiMRy3fJNqVYeai0+Nc9tYRz37kP
X-Gm-Gg: ASbGncuTI/JMGXdWwTXmIz6GpzYfWkVzS5jcH/2wNe7PwctvyHhGwfJHqTKl+sXQyrj
	+f8w6G7UfDl5sf6Dujgn669Ajf+H6YnGXEwCA+LGf7RoGEhvPNrqQvsKCR4pHuIWJYS2kGxtbl9
	vkAMzZn4wh7qgRhitYxM65Vo/6gA2uGKAYvcnyuAK1SNR/MD6ewi3qLc8sQG3LrFIY97WUCUouG
	QwbnGDEnnmtbJoyprkvpcVrDbYhaCdUGNQyhAPxf/bWI7mJxrBEesjlzRCO1S5UBOG+5lqyh3Cu
	Xz5KS0cDUY3I7rugDfhP0YvGXg4W/pc=
X-Received: by 2002:a05:620a:40d1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6bcbb4a89mr152023785a.16.1733487326578;
        Fri, 06 Dec 2024 04:15:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP4i0WvzvqwHWvWzwD583pgEuYU7s1i/4a3MUxHVC4hDHUnMnNWl+iRwgty6HfmN9rqe918g==
X-Received: by 2002:a05:620a:40d1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6bcbb4a89mr152022585a.16.1733487326129;
        Fri, 06 Dec 2024 04:15:26 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798fbasm2096012a12.59.2024.12.06.04.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 04:15:25 -0800 (PST)
Message-ID: <f948da90-91d0-43e2-aa3c-27e15e1cc7a3@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 13:15:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add capacity and DPC
 properties
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_anshar@quicinc.com, quic_tengfan@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241206-qcs8300_dpc-v1-1-af2e8e6d3da9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206-qcs8300_dpc-v1-1-af2e8e6d3da9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_xW408cyIWuKQXSUj62bDV09fh506QI
X-Proofpoint-ORIG-GUID: d_xW408cyIWuKQXSUj62bDV09fh506QI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=862 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060091

On 6.12.2024 7:41 AM, Jingyi Wang wrote:
> The "capacity-dmips-mhz" and "dynamic-power-coefficient" are used to
> build Energy Model which in turn is used by EAS to take placement
> decisions. So add it to QCS8300 SoC.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

I'm willing to believe these numbers for a78c vs a55

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


