Return-Path: <linux-arm-msm+bounces-27103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9A93D615
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59C41C21F99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 15:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8141C17BB3B;
	Fri, 26 Jul 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zi34ICTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03D17BB25;
	Fri, 26 Jul 2024 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007675; cv=none; b=fPGj1skzAeF9KLL1WlRNRGjRzmF/lv0DcPHjXssz+KShY7DcvVVvoq0vAO6Yon1Mk09Mby76bmxxzQ7ON7Ceb2guDFOL4GkHc77PQkq7VPKbCpT3gyBG5AunyVDvouB2SNHxFEnoNXzVVQQUq2XG53x3e8+za91Ea0x3o214ymA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007675; c=relaxed/simple;
	bh=gtgVQmvtAfcIMuCSuZcH72FRVeWgwwO4aGTXPO2bpfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fcH4IMGJsZsIQoiz86aPspgDkQ6ZVag/0lLBNRmx241CDZ+UVtc8CytJQIe3D9nwgzuJFJP/c+ZYZYAyw81aIJXs/P0c5Ts59UmYysgHWsDx0akFaQy7I1oWj+uSFmelh88F0HklG8uMKhfMF1IOTC3SlKfqsw+1UxWVRSkcNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zi34ICTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QCDIiX028031;
	Fri, 26 Jul 2024 15:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuW0j7tkEr9M+1LyOt03nsrJG37MWXe+co0XWH1Rc8o=; b=Zi34ICTgA34IhmSX
	NV5c0UPBq68GQ8/FPGgCIc+b1BUIRQF0+mGeNHqWIJGbe0gHKlgcP5Sh+IhfSJF7
	jcwaAP0ukSCsSpWUvREGolpeRabCYbmCKrQ6dtaECj5vYkj+nYykWm+4M6yRLjcr
	g+ZaS8ZdV2KKWAa9mgU+YXB2sCbT/nWdA79a8FoOfGJbzciYhi9b/HX+D9GrF2oD
	Ne5Z1nA7nefjzhgLcj8IKPCQtnbG4bRIeh4HDRVYAyi57mdc7o1cxQ4It0fRLSDw
	U3IGlDhrnlGyaJZk3sUwNeYbyk8aTfoy2S36Y7RDiY3BkBrv8FJxNcYBB0wQLm+q
	DX55oA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1v19sp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:27:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QFRn2O013107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:27:49 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 08:27:49 -0700
Message-ID: <4435523a-8d26-ab12-02aa-11b98d68a339@quicinc.com>
Date: Fri, 26 Jul 2024 09:27:48 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8998-lenovo-miix-630: add
 WiFi calibration variant
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
 <20240723-miix630-support-v2-5-7d98f6047a17@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240723-miix630-support-v2-5-7d98f6047a17@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dgev2ENI1a5nqd_z0yq4Gp8guhFRO3vY
X-Proofpoint-GUID: dgev2ENI1a5nqd_z0yq4Gp8guhFRO3vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=745 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407260104

On 7/23/2024 5:28 AM, Dmitry Baryshkov wrote:
> As most other board Miix uses board-id = 0xff, so define calibration
> variant to distinguish it from other devices with the same chip_id.
> 
> qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
> 
> Cc: Kalle Valo <kvalo@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

