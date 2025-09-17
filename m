Return-Path: <linux-arm-msm+bounces-73922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BAB7F4DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E4818879DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7121DE894;
	Wed, 17 Sep 2025 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocnB/XGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA11A76DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115461; cv=none; b=nvDQ+6PYQWSMVd078IAQhh+5+CrgYZ+vO89hck/fj3bX4Hk0xM46nhzmcd/CvSKgM9W1HR+0Z17JWIIPtGAAI9CCGGBkRjGqKLN0KdCd8I55zDLdszoMUUrlfKboR6P3VFHLGcoD0sbotkXRGe+QYleLA+TM4m262t9ro0I9QqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115461; c=relaxed/simple;
	bh=bj/BACpeROC8lw+J8b2bN0fD1ySfsfKEilZbae/Zl6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODnOGd24v3sjq7DPa2EiDSMXTpFnwObN8swhlABBJWbC49an2n/YexGJS66UgL6xR+22a4cjo3GdLt0daOOb5/SfbW11AUadxLcyRCoe/4Dplp05+NE8QLdHQOejclDSt+gSG8FT6cT1M1HERikGAtTaJOK648l2AtACw0d3kN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocnB/XGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XkWB014401
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UaA1Alzuj9hbbX3YKQBafNDVZKoSiqpKwrruMOzYFw=; b=ocnB/XGMcqYtd6v4
	SHW/deuOFOng8MN75MJQ8/2RF0AVc8szwffmXa12YbPbzNIT+MnmMrhaIMy4E8NW
	wWhHCj52MPk8Nmry53zCm1d7h6RmW/opFLD6FooNBR9KZoSpJqahm3UXLH1iZB6t
	GP/1ZeJAlk6L6FOJchtp/wtdWkdx8J0w6V1coYhpzS75fEUatTiGG3HOaGPOZI7U
	QsaiNlj+FEdV40SLgNL3aahd7Do9BQ8geTYyqo9bfzU8rjyJAlhBe2DW1j0Z5grd
	kDS6ScAVytN+TForR7734VirlvncgBChsDQI4J+rWMAl2oePBA0D8tt9UMU3Qy+9
	J8tKmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu2grn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:24:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-780e20b83b3so12313786d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758115458; x=1758720258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UaA1Alzuj9hbbX3YKQBafNDVZKoSiqpKwrruMOzYFw=;
        b=gO2YrYOKVWbna/oHJ6XHwR7+Mo8fGVfUPSDzXtLZDLI9P15Gqj2GJc25IXN3bUa42K
         tNFeoIkqG2a0xJBGAcg2sjwnz+lXzAo9o1Ejla6D2PyoU4lRJ/4niHW1uPlV6GwiU3SD
         86sofU2+vkHNgdKH6CUYiUYd9yshCJ71CPF9k0AwypHyYYBTgJixq9/FYhV1s3Huj8bm
         f1SnibNYNV5kBerKreDkGb+0iLDfHZ/NNNrMYV6gV+TZYqx2vr7CkxPLsZRgc9lNXhKJ
         BrnpS9uZzNizla8v1zza9BBUY/nGKoIMSZfps3tnWTx0h+TubbDORGBybcQZL/4/Zt4r
         GvRw==
X-Gm-Message-State: AOJu0YzLYyw/pvtvSDDEwdnWAw5yK9HhLsvyQBJK0vFgKA6hLR8Lnwyn
	pPqG9M0jZrM1RG+8vrcMnbSsW38i8Pbww3TXAImAOWTTHAGPaDZmW8iXDAy4sBpZ8t8zLPHGZJm
	uJDdoFgWZ4H07uXDuydLJ0nMA2EQAtOCUprfUKuJm9L8nS4LTMeAHvXoa+sEdvHTEn62RIbBMj9
	uj
X-Gm-Gg: ASbGncuHS+yCbssdiZz8KTiqoJTS8l0qtSGtciCRiVGFwGxFZjJE2zmUOFYwXgwbSgP
	LqgfhCf4eUXsnc5vSj+Yq1HF85/8B8ePdryBzwqC2B4eE6mhHoqD8UUq6LFPywA6/vRo0EIBAZx
	B6S1iMGpyNYzegy9RX1kZSdd6kqMtVVSCC9ADcCTSXfyNj24qi4fH9NJOnKo4miCYKEcP/RpeKW
	p4thxG/37LN4JY2BkenW1HV+I0/0TE/25Pi00rJsVPoyewc2fk8WlEQRp9CEFtPvpBc2X4dHRQm
	6XQllhtU7MCs08mlq1QrYBA7jw/k1YZcIIUJtFo4ZhPH6cKXjVdkPaqhHodGGZl76rGpmWKfbIh
	IYbk3eVnFHGUgiFYqrN8BlA==
X-Received: by 2002:a05:6214:1c0f:b0:776:6653:c4cc with SMTP id 6a1803df08f44-78ece74a22dmr13485086d6.3.1758115457776;
        Wed, 17 Sep 2025 06:24:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6mmSdxwVDKEVLfwNysJ/iADklZpu3mgw2fSh+qUBhavczlYOkfMoJa/ppr1K2MifbYqtsyQ==
X-Received: by 2002:a05:6214:1c0f:b0:776:6653:c4cc with SMTP id 6a1803df08f44-78ece74a22dmr13484606d6.3.1758115456985;
        Wed, 17 Sep 2025 06:24:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f0c7a5546sm9223456a12.43.2025.09.17.06.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:24:16 -0700 (PDT)
Message-ID: <3b26f3e5-1342-420e-8668-10376aecb127@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Flatten usb controller nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9MXWVvSsbu+j
 hecO4c2DotooCHASe5iqZqUJ6b7egm9BzIEJRpX4gQymzDG3wpuK4FzaYGhy3sF/4KXv0TUQ192
 inQMZ4wyCv/WZw48yY+bv9ywLbKJF7RfKNUlHaKCoK9BuuCw3n4Y94lRp8ybFI4rraHP5ht1XQV
 PQYINCeaMZHRPIr4e8dUsMUPblxeQ3kpG/3OZXgxtKPsvSogU9tcEt9UlX4G8lb91l2/zmwBU8F
 yMmuWXJsRr3HMgO2C8Y+6m1aBE7urRtQ8O+1ik9HhHczcjfolpRHLZsKboU/IxzryJQ5WIncwz3
 XQTDvUNNdU931IByhF3Czg1ZyW8kQYYOxhVN7LvkB1QYDcsSEfVKIz9P0ksKHrfvL9WNgDMJQN0
 Dbd8+7I9
X-Proofpoint-ORIG-GUID: IswGi1iCuITOq_dMKouNuUV31xO3cbIm
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cab683 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=J2N_nXOhfcilw9lcM9MA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: IswGi1iCuITOq_dMKouNuUV31xO3cbIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 2:38 PM, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach. Enumeration of ADB has been tested on EVK
> Platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

