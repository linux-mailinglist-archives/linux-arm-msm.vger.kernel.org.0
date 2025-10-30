Return-Path: <linux-arm-msm+bounces-79654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03493C1FAD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64D751A21871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59543546F0;
	Thu, 30 Oct 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptxXamHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5ukTVkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EF345CB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821848; cv=none; b=shPqkcienV8u7jufoMHN3UUaD+2shLsRG35MsoLJxw2LS4jde3a2XfFPAbfdSt8Bd4uwodMDFbODvXJL5E9YZ9XGfaguky6uSB0ucSrpPEqPpnjkLckbl3IZVF/yL6mpzKN5HqyJ4eNnjkARA+JVRfGNUbBx5G5zYUk32N9vynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821848; c=relaxed/simple;
	bh=CpO4cFWeZy8MJxTpQgzEci5n2dWvROiycCuVUOoSAE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muCqV9sy+jIa5DKISmRX3dyaXDuSFIkfNVwFysZCL65EcKUOgGUSkMNiFgeOXIsZaZuvJ30yK+Y9ACHH1s3MhX565rO1BjLGPrtTa0FVkuGOl7uwRA4RrJpBjhGTBA35TcMCBxDZsZBwCLduqc5F4jKjvFZCZqVBAXmleloSzVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptxXamHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5ukTVkL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7VnYU1599392
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wI3InEQIECMqkQy7O5TfdepIrBxYkVLDZFE9coGVYfg=; b=ptxXamHHU/1VFGsH
	rLlLxHZVOoWuQ0ks8izQvLWqRlEVkPum8GU4x81voDPLbxgGeeu9AcIX4OJ4MFwi
	6d4cPmHlWMoBce2NVqQwdUPPNeAWxcrIH1zEicO4WuarG/Xbp8kW25nqRuZ3SdS7
	EJ/nqJodV21MyWvrSnhvXtvTtz0E/Hguhi0OQawtbGBhMMDWGk5xf7xyYv6jf05r
	H0H3EX0TfdxhSgBlKOlhiWimyU8N+l4DhNsldulhM3P03DGAueEcb35DlvMAgUyy
	jTCqdRw78AX8Z2attXs+78mJ0pdlSiDEJdYvC+BPx56pX/THeK2rmBD9hcRYbhFG
	XEBidg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7t66x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:57:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a4f7e885c9so29181085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821846; x=1762426646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wI3InEQIECMqkQy7O5TfdepIrBxYkVLDZFE9coGVYfg=;
        b=c5ukTVkLmQkaVvIRUhDhY1vvgK0EQDDIwe2Do95k5eNQOje6/ScXcJZCqOgsPArJon
         Z6n1Q+Eqg6gRxZA8Y6BKDwsXaFWAQwueJshSKzbXsIa5xnhpDcs94AkTqPNY7F2e2+7h
         3rfeC82eA2lADtQE+28P2BmYs2aPMcRLWG0/FOqLLCIWlaI2h4kXbUXJI+30NTPNW+h9
         L6OqNH2aFVt7vhk2zip2FWkD8x7JaggBsvwGXBxUn61eRBuRadujR1cyrAMjYODUd60S
         dTTMA0wkLjnjvA3SxDKAkoK7sXjTnXd8gkRgRUhhwZX2oqIqjGbYIRI7YZ4SaIDPsW5a
         yrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821846; x=1762426646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wI3InEQIECMqkQy7O5TfdepIrBxYkVLDZFE9coGVYfg=;
        b=ItG5OHOoDsGe9iE9QzQwKjzh34O0CxaQEM034nz/N0jwyMKQ5PVFlYs8nZaUGTWhgx
         58RQg1b1MgZBmTI+/cU9ZvEM2/4YX97surfpwJ0MM1T89sB4exGTSE4atguuhx9tricC
         UgZp55cc/SHNYpMBt7yWmL3/c6VoKjyxpQ/0mu7ebYWIGj//sMhyam6AmcCHO1tGzKMb
         QAO/64OHZYpwEz2l4gMI6rvK12JiP4S4TGaW927YOYQrC0s3ylG/6KNWpIWrjV+1PGJv
         R0gOZFxAjnkpFNnv5XfgDklFaZcYE4tTQ5SBOXLKlesLJ7QDJO+8C9YexPRx0UzNq7u8
         vdbA==
X-Gm-Message-State: AOJu0YwN0tU2fof2jvrJi80qOQIk+5yJzMmvqvFFSp7jJvrA77+k7g5D
	7490BJc9kcupw8VZGCbc8Ym7uEZy4VzbtkdDwKwADhGurheEUGl/ziXIIKiyZ5qwsqJDVZkwZT+
	OzIkQrNW6OHopL0HIXqPr+BHLajqha+dwLs41pK0V5kwionsLjFAy1chmThsS8X9x9WRW
X-Gm-Gg: ASbGncvaMngWRT03h6FMUysH5qD/RNuYyPxKrB7VunpB1kaFK5M0QBRUADqY1z7MvlK
	/Wvs1m1YL5rvDP6dQyk0MfBGMciGQI1nYq4J2IzSO8Yoe8Wx0eGv5KUKrob30pZDvmzhnU1iIH6
	aHEYlxT/NrEL9+X8hL1mSnJYJpeKVLyswfLpX9OIb9u6nQlgx4D3A/ZjX+tLah3/0oMgZOQi53h
	/vBaNBzRiJrjz3xWs/336bKe60Jj1IDA/l86uVN43TKb3dannNTyUxgCCaHvb12aBH8LQrDc7/X
	sqyL9rYtU8RlHlwLKHMXFKnIiXz0DYuoPR6Y8cdGhRqbNZZd0qQQqT1Ofdrdf/GnI2Zu0oJ5GqU
	RTzJqWV89anppsx2abFJADpaO8tA0PQelrsFRocsUl8ZCU24hiApy01kT
X-Received: by 2002:ac8:5790:0:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed1e188a7dmr39841801cf.13.1761821845721;
        Thu, 30 Oct 2025 03:57:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl6BONJiKyE7lXcYLZDY1WqwI8TXc3wEg7QiVTOYxQ9Xnr7NkX2YFXbcmSDRDE5nWX4mRkfw==
X-Received: by 2002:ac8:5790:0:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed1e188a7dmr39841541cf.13.1761821845253;
        Thu, 30 Oct 2025 03:57:25 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85413b88sm1692295066b.55.2025.10.30.03.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:57:24 -0700 (PDT)
Message-ID: <a64bf9e8-5cc5-489c-b747-fcdc36a0b2fa@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:57:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sdm845: create common zap-shader
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-2-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-2-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=69034496 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3S55o6r4CRsqHmcx2iYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xrML9rLYN7GIUM5vTSxSkzfNiBujsZp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfX2mgc/NbZxOeR
 tm/ZXtYJpEAzbxpibe5K9g22wO95km7lT7AxHkAwibE2DfbHw8/BcdqyjTGGHwyZ1fK2JRS+cSP
 Q6iaeQ4KhM/fg440E6KdjSyXG8g6V7iOoEtsZX/QJFGblAxnTEV39dUJmklTPth1cOIOkXZqfLn
 JQJ2hvJHLVPuTW7vzOgDeTURicbJnegcPFh8/HndcZePfVFUyXuMJmDJfKBha3wwucELTcAUcXG
 ljDDnbzWDsSXX37yVNwAbiK/I7cZqeNFGy8yfi+h/BcR22X9+7nfr+CbLMHEXnYDMemNDrnIxnv
 ZUdP/sCKs5zmgy5iQY+ENC7BgpaHcTNORRpfVOeMLAYaISqeafYO4GGTMQrCtQtH5ha5WP3bQ5x
 JR8QW71idgW5hhkpQ4YguKAFM6fSrQ==
X-Proofpoint-GUID: xrML9rLYN7GIUM5vTSxSkzfNiBujsZp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300089

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> In order to reduce duplication, move common GPU memory configuration
> from individual board files to sdm845.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

