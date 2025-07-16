Return-Path: <linux-arm-msm+bounces-65251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF12CB0768A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6CE47A429A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B732F0E5F;
	Wed, 16 Jul 2025 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnE6UyyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7D290D95
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670964; cv=none; b=JM4hn3ezlkZYmOVPpU+xaKnZYZghlGloAjopaL7eZ43/M7es2uiO3/kD6uJQm0V+aHfjJW5HYyTg5ePL3uMscADB90CZI5rMisdKVn+TR+9fdNqmhdkZE2dm0jUNomEDybV2Ep8mBZNOc1QkcF4RWD3zShIhAoWwfD9TYU7ZId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670964; c=relaxed/simple;
	bh=2n+yEqRmpHWX55ymaGQwEcO5PTCabHBKt4em2S2nQWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srTGFDqSxdCy71GHL4UqnEmD2Von+uu+YAT5QRLx7nPpyxi2SJ0k1x2WiDTJim+99NWIqv0YSrYIRDmyScQvq6kAWsGT9wKTdRSFhpiGl0hYy0l6SyeoDxOYakBeqeWlrkaypl97QGSCngLCBiqOSEMo5U/B2Y2sQS/2h0fOsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnE6UyyH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G63Zub007290
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 13:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbwfXFuBFxnOjI7T6twSdJDR/3cB26VOmjbK5IrO4Xc=; b=MnE6UyyHfZ0YXRqu
	8J0WeRFTtmcikbH0hEoZyJRjqI3QIUZngUYM91lRGunMI4FJn6dhbkQv/Dpul2Vd
	qkgTdU3G6ijnHg4sIT2BKIv2Z4Coy7ZlYqkEKRDbi9J7bujWhN6TQMGyedP1YawE
	lkXib5WzzRG9ajf9tEePxrWoYZ+m+5leNPTBHOfbZNH5PM04gG9220GL+x/7A8xA
	U8ksYoeCqCfimPkl/mMc42Aa3aClMk2SICAx0llxIiK+pCYEFclF53M2X29ZHBwR
	JTHa1B6jebloBlsXZX409RKhRlAXbgRVoBkcQaBBA7QxWBQwOg4hG42HlYSeMjmw
	l0vQjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5v631-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 13:02:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd5e07066eso16963706d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 06:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670960; x=1753275760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbwfXFuBFxnOjI7T6twSdJDR/3cB26VOmjbK5IrO4Xc=;
        b=V0PH+MMou4IKDmlS1nbMXCqwlGB960N9BYVnVN03etgiUOPljajfg4RtnM5jiOMLg4
         N5b9vD9VFckDKwfcAe0f08SSg6R5N8zGayuaxd6Njq++IfuShrBu7A9TN4NYjjf888gL
         l53c1sc+SNV9SIsqZf948A3kHXkpyd+npsYebgvPrOhYAeWLv7meq3vZY1Ty9cpZ3vbd
         bydDPAZA/6CjHk9YWoP39vJtOBUT31Sv1Kk7goADz2T9S7vcE7y2eZNiEH3ifnsjZvVW
         ofS7lNoJFrqflJ8/Cz0ES/Ul9Ec5YdxrUMtW6dJ+4rdXvALtXmG2TZXR+Fx/UHvzJRw/
         53dg==
X-Forwarded-Encrypted: i=1; AJvYcCVFvLHfrLN7uJw8osCA16LcT537BTsRH59O0mTHVMFvGoql2/xeWtwOPirXEb3MxHvQAVOkxCBpPtO5DltW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9kqFWFta87jniY7dyy3IVu4IEHItNpa0ulHWHb1ZkT1CzyBa1
	04Dny5jpmQjM9R1D/HXCT3s5vq49vXZO9Ya7BJb2Clp9OMZgxR96g+xD8dFmIV/QjrNQ/TN6tfU
	D+wyDd5W29fZKLp9ma0HQdhI46//5yy+fihytjpUEfRQigb+mCf0YWIzTinOnU+1ePPlR
X-Gm-Gg: ASbGncvziwbz5A7r5q4gqg7Fc8ZaDrCA4UPdmOp9stUDl59xE8MXg57rbgDVR6I23ZY
	rSCeJsjy4AW7eMLPBWhYJ4BUPbe4+Wgz/2xMKg0bMsjtg0cOdSGB80jAxdncGL/cFnqmSfzL2N9
	djT1Ga37/kiLaodqWpitOM5eoONfy9hHbpCIPCZeowb7utjK1gS593PKNokaVYr1lqhRN/ttlb3
	4X7Tv19Hesa5yOrXFRt7B4d4dugwSXan2qpEY8bfK1XDb9G7UlMUTLDQKfFXYHj8UK8pmmtBfb5
	0SH2UJCEOQ8oWAi6ZlyqOeadjMA73UZv/suSvG/v3xns/fh27kxyD0FFAXOxC+1tSSzt1qY7IsT
	1DivSGSum0IGegKgdvTr/
X-Received: by 2002:a05:620a:f0f:b0:7e0:1602:a4f9 with SMTP id af79cd13be357-7e342b735admr177288685a.14.1752670960375;
        Wed, 16 Jul 2025 06:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7HT9MPyzsZ1m459bgHi8F8nr4lOxvRazSKaZ/G/h/LdCB+WOUXISiLr7eVmDce1y+UDGzHQ==
X-Received: by 2002:a05:620a:f0f:b0:7e0:1602:a4f9 with SMTP id af79cd13be357-7e342b735admr177284285a.14.1752670959667;
        Wed, 16 Jul 2025 06:02:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bc2sm1190983766b.135.2025.07.16.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 06:02:39 -0700 (PDT)
Message-ID: <4a189f35-66f1-4c1e-a9f5-e9ed01544538@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 15:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add support for Dell Inspiron
 7441 / Latitude 7455
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716003139.18543-1-val@packett.cool>
 <20250716003139.18543-4-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716003139.18543-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877a2f2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=iLNU1ar6AAAA:8
 a=EUspDBNiAAAA:8 a=M8z6rC266kevX9ldIuUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oI-9dtJPSfCw3Dz0YwgiRA-mbLDYfXQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExNiBTYWx0ZWRfX+/DKkFBfLLH8
 LJODpcPobLhwUm/k1foNkpHGkUq0xsbKFNeLmRXBK4t0OvN2kUB/YAoPJC3RVpZoRzJtSb4C94F
 99jE2n6vcN5whlkA5kLZsRlDlQ/OS4UqWS86es5IC2ss0R2e912B8Bo1ppSiyyRLysyubbvh+sF
 jtTAKbnn17xFVeOpL9jSB/+EZVAbhgbwuK4zE+3g8AR3uo2eknH8YVgNvJ9KCHCQAshh5TyRonK
 1VB38l7D4FGXL2mZ66ABmdc9nIEC7HMqDzjw5iX3sCqGABNwer4HHcBZgLKCmvCW39LSYcRq4ZL
 VV9WYUDAnPDJNoalXastrUak7STFHYGMr3ZeQm06mYxLfY/KbqWU0kJYJUbVWelU0oTmK44Cb6J
 mAnVLgv21p43TsQlkuDp+Cd9h4e0PsgIY0HryQrekNG0jBuvBwD8hqEEMNuDJbpB+3sJsgrP
X-Proofpoint-ORIG-GUID: oI-9dtJPSfCw3Dz0YwgiRA-mbLDYfXQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=989 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160116

On 7/16/25 2:26 AM, Val Packett wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add device trees for both SKUs of the X1E80100 Thena laptop:
> - Dell Latitude 7455
> - Dell Inspiron 14 Plus 7441
> 
> Works:
> - Wi-Fi (WCN7850 hw2.0)
> - Bluetooth
> - USB Type-C x2 (with DP alt mode)
> - USB Type-A
> - USB Fingerprint reader
> - eDP Display (with brightness)
> - NVMe
> - SDHC (microSD slot)
> - Keyboard
> - Touchpad
> - Touchscreen
> - Audio (4 Speakers, 2 DMICs, Combo Jack)
> - Battery
> 
> Not included:
> - Camera
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> Reviewed-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

