Return-Path: <linux-arm-msm+bounces-81917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D5C5F628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BAC114E229B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE2D35C187;
	Fri, 14 Nov 2025 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdzeNmUa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZxrPiWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4774235C181
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763156173; cv=none; b=mSFvvBTc06tzwSOfym8BmpJ/3F1x8vN43B0nIx24XEa3qXpWX/gAnRK66ldXamM7bagFBgySqZ5mTono5APUGumWqN33ER5BFFJ0yqHO/pI+LpSIs/DN5Q6t4B0JuktvX1H/5PlyI/hfoKj/Hj04XV4CDQOQXioCc8w0CNNOjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763156173; c=relaxed/simple;
	bh=n7fDD4yKBwatySQBmHtw3k00GR7BloSg8ghm20h6mzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiRf4UcX5xMgcl28BlU7sCQugMVgQXRufM6yVK04hlk04Ha73A7NcSTmsdny5WgzovGhaMc2VIbvzER1sfOhAclrysad9vgOoK3TOPoe5SQvi1dSoTML9NF42o+DYgXQa/d+HE4YdJzabqDy9oPC3JAJX2WB3kOoOTXfMsTG/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdzeNmUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZxrPiWU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AELDSr6668488
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzgANvEqYOdK1XDzb4ZLBbFAjL/qcC8ia7bKN/ZiJos=; b=GdzeNmUaE1FiAVdu
	vHncRb+FF9LjK3ES1Gk4GRdB2YZ81j+RAvy3oyFWVh65QzTJ1dA9YUE0WvStStqU
	P2F6iaZNVZYqGd/6TnSJrNx63sQfJosriIJjhR5Rls4QXyG/X4fotzKR3yCJlQFe
	zAeV5RL7WUoFHcqChqFVgyxccgYELq4CSZ0E29OsLoiD39cnoVP1KtirFgdoDmtZ
	N5ueMKEmdEWx+FZCr3AShyt+ctWrrLcO8QlvYA0eoN1DDdvn/n8UxxfA5pm+coIY
	DBwGLhxnE7jHjELo2eh9vukKUws+ItWMPsqi2Xipe09ZN2Kr30IH2wEPiXRWhmUM
	2biNVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aec5d819d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:36:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so99665785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763156170; x=1763760970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzgANvEqYOdK1XDzb4ZLBbFAjL/qcC8ia7bKN/ZiJos=;
        b=LZxrPiWUv4U0Vx9gpEYl0S1wn2rcCxEBA9u2XyXF5pUTtWZeH7eo/6XxvlotOHXe7P
         cva8KIsP0qdEi30nl1xHsQL707r5G1VzpRtGO/DIwFbDfrZYnLXQw/qk9rRTsYQhfq9S
         zd6/IvdX/xUSACQ2EtfJYqtKt5+4GaalJk8wJr5aBbJ7D9n5JZ4OfcOfdib31JUV0fqu
         Nx3+yqZnbugiedHbU9SbA0DEOhpUSPR5VMUwlLiRxgq/Yh1q8Z/ui3ZuEqFgcqcBRmll
         izjYmuX34Jmpk5Ewwtma3iBB1ommgg4dwlF7EJPMgR2TInpCWOXANMVYswORg1vGkIf0
         o1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763156170; x=1763760970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzgANvEqYOdK1XDzb4ZLBbFAjL/qcC8ia7bKN/ZiJos=;
        b=FLRBKWAfRQeqw6lqMuEMatFdeM7Dw9TELK/fq18e44CZnqCeOklFz+7Z0WLhmgo10Y
         ORGxaiVDBkvUzj39MRTmTnFDLIbHdp3sFflYqiHYn0Q4QlQ2ydhpJVyZZL6CMC7URiST
         GS+61qidCXUXKdF6pHM0eArP6K2JJL2s08U6+0pC/GcMH/WMT60egRDoo9kUO0bRyyX+
         OA1ODrsdHuNDcE4R+ci9EgeJ1Ts2cizutaQSaM3JWK/rX+eZNOOINqOoZLmG8Cw9GtEN
         DFHn4FuwSk5mvyiQl+IX92tbxl+c4N1FbYdwCuwcTj03r8XzfNOGxPK+KGMi0hxHxLtv
         38Ag==
X-Gm-Message-State: AOJu0YxBSBv0i14qGZzq3PaMda3vlhHUTG8pIMOOchfLkl99+CZY1piB
	BxDRh/h/lthjB20phxQGYcE3HP4HYroWRF0hanovJygTTiSIZb9+uU96blpHLsPoSPMUGgBZIRu
	O++S+WOqec2Up6vpB/e8rT5BtAo80shyCwMZEbGAm+1XoVOGRvTlSN9YgTjlEV+O5KJY2
X-Gm-Gg: ASbGnct5vTVHYBXONdWrVZAbDuxqoHAzvFxvg+czSiVvlAW70uXCsHVfjLCCLR/x4QS
	yqWvsUM27reVMRWAGeTOeFCe1F19SrCrwDn8cmkJAHdfH9Ft4L9PUwTvziDTZ6tzUzBijz6Y9HG
	xsenrow2IGQUKHLmq0btL9l4M7dUD87+06jqpKsJbuKXdICVY125mR5N3Qh5C9Dp1Rrv5FPuMci
	8KXUhjLnEKGhcYjFobRiEWekPw5DV7EwVYDNLU0ey87cemYpkPB3+avZ9yDqIuDHIZA0kWTFMNj
	EqKvN+Qy04erQhCcGASdR+bRfrNqWP6Sa+x2c29jY2yNtW7d6TscF0p/ZO4WLNGIDSNCQBvzVVF
	zpN9An0V/u2N4qMhto2BFD2wRhQqGDETIAIy02kAKhaNcSc4JlHbl5CD0
X-Received: by 2002:a05:620a:1727:b0:89f:5a1b:1ec5 with SMTP id af79cd13be357-8b2c3385908mr429818485a.2.1763156170047;
        Fri, 14 Nov 2025 13:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQafM5tfJl8iiOcV+sFNKjVsPnc8ly8ZPBXDu0RtuiPvMI04u9o4I6pQ+LRejF7OeHIqGjAg==
X-Received: by 2002:a05:620a:1727:b0:89f:5a1b:1ec5 with SMTP id af79cd13be357-8b2c3385908mr429815485a.2.1763156169578;
        Fri, 14 Nov 2025 13:36:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm463726366b.63.2025.11.14.13.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:36:09 -0800 (PST)
Message-ID: <3b309b8d-e9e4-452b-b2bd-cee96ceb5549@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:36:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdx75: Flatten usb controller
 node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
 <20251114061553.512441-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114061553.512441-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a5tfiGSlpxRnw0CATWfe_nYqXSG5kRBd
X-Proofpoint-GUID: a5tfiGSlpxRnw0CATWfe_nYqXSG5kRBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3NiBTYWx0ZWRfX07nQD1k8ENxC
 hA5BqhLaejYOQUoHP1pl2sNKI0h6NFjBA2Z+X2dttvyhPEnwZ94243d3PB+jFx9PnaLx0bLCNZm
 ob9oIYZQaHizQoX4VoNXQbN6Qnl9pJ+lURtROjB+w1LJygzkG+VyKda7+OFuLCNKof9sNVNuelu
 KM9dwwTYyHEfmvzFiqoeffdNgqWydeXJzUMJ5wI0hvxgNY0khXB1eSHSQowFJWF7/tQbMEINb7s
 0+hoVyUQNMHo5Xi81UGB2W1/gOZXO4P97LfuAHM26NMy1jUFMu5K4R+h8duvRxRjcRDlR/px8EA
 Xh33i8Fhs5b/AE5mSwH501KxyNwFioHqC0IbTFJcvRpNnAp/3Ps6GRpQCKTNZOlqfB0MKH1vYXh
 PC4TmUcSg2j83rajELiji65TxlVQtg==
X-Authority-Analysis: v=2.4 cv=KYnfcAYD c=1 sm=1 tr=0 ts=6917a0cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mfzWiC2-gXe58cy3zFUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140176

On 11/14/25 7:15 AM, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

