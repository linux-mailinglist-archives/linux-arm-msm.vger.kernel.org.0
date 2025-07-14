Return-Path: <linux-arm-msm+bounces-64809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22CB03E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D67B3A61F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019A21FE471;
	Mon, 14 Jul 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfbNB7i9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593680B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752495372; cv=none; b=g+T2B62cDSle3Ot1rwlYAu6Ycwf5SeFHRRPhcWmdd3nUKBOdoOcUpLoTqNDV00QuepBf+coyGDiVq/ff1Ut7ptX36Q/b143Q8QGoSA1lbSUNXY3Jm329LpOB7bZKYYX/9uxsKQEkSLzrc31nYN5lFgXFAZf4bKFI9fAgsc/vWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752495372; c=relaxed/simple;
	bh=Vyeu+QiMbOwu86RKcH8fkphcLeAnnuEM9Fw6UpjuzrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl2lvIqVwXoyEe5EljqTem4xOjbTFHBcbc/0FBIDPwqYRA+f1QjWSPDY5gKBV2PScAwDHGv6RTz+xZUw8pm3DJEpCTFR3YoWjl7mQdC3k/xuH86vLAfECWqfNQN1gGQncCMu9ftG8Cmkrz9UQvl25/heNEZi+PD8zhhuF6hTKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfbNB7i9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECEoD2004470
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdRSmpVGBOQnwqugOp0k7YiXL90KQtzCPk+rW9r7tLA=; b=KfbNB7i92g6NJVhk
	DwC2UKjJSwnQnDOMTnDM2yXjXmWcY4hTWJPdpAZEuDVVz1mT9BtyvFkqBgh8BqvI
	uX3rQhQhy2WU0BkwcDrrm2L6HGUW1KbC4ZmpkFNKkYVdArwymUOD5fBPgzZPLf/G
	nzzYSqib0jkA6sqMg2jqHv+SRY3GIF2wN4ZedhSgB4gDPLr0EgiYTSntSIUP4v43
	6637o5qF8mYRxM9hsD3Letj8A82ffEF33pjwF0mv972pou7B7kejqT9edMVUKwei
	f9wcWkntVnGEvz84ntmCPJupYleEa/iWiQ67sKi5D5T1ffA1OJnY+bKRn6syKTkf
	oKJMqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0s6v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:16:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dfeacb6dbdso18494685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495369; x=1753100169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdRSmpVGBOQnwqugOp0k7YiXL90KQtzCPk+rW9r7tLA=;
        b=PWWaDrsW9VswQ0RluegduQL4jt+2vxB060z1TZRccE8+w9fsCE+ONmcIdKbbg9/G5h
         E45yZRr1gXfW/fgyGrGPuCqNvODqB1dHZeNXJ0BOfpAbF5KMewOAnODCFlZZHBnZcc6D
         wB60nFOAYkIYYHJ4GlVnJHfpBEYJB7AZK11uFBVMQs4eVAPj0YheJkrafL4rgBcT8axS
         8xqC6dYwAASVQHr2xLsachkHyomexSua51yBe8HS7dshIxWbTVuQNG9F7p12gH8UoK16
         ZNPVAnJvtvnh64xli1Dn++JtyIR3IpvnnLJFfqPXct3C+H4R7jM32OpUDrwz0YKLBBaU
         nv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsyYNZQJubSvpb56PKQQK4CzD1ztDTZc/gC8uO9uTzkib/wF5h9xVRZAshRRNGCIwbazv6XT7Ix4IYU247@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvlszytu8jMN3hPNrLwuEnGLQXYwLQ3ABPax2BKZerakYcWnyh
	Hz6REJKYhu7noHAKmYHPpAX/wt8HBdYY/r/idt5VqACzrREajcYtrVkVqmQ9XvHxwlkwNNa5fmr
	nVBwykva2i1H8aCtBaVIbN20xbCY+F3M5IRZ7Ntmo78yHF4n1UgLCMrBrxEfreeRPpKoe
X-Gm-Gg: ASbGncvMi0YZXAl3WxCkM4g6TOL7N/UjnicXiNHdwN827VmMys4c7is62OzswfWva46
	S3dR9tRLj25M0z/+wJQ9ApLJcpQ99RMZIpEPoVq7fbsczOo4p46vOmdVFTJhsbnmjRKmKoIWTzD
	8TnLY2/t+01POIyiINYUN0AxyjVvI09//rF6FoGMqZbYVAkimSXywBUKkkqXcBfs7vi1b8UoMVz
	pZ2+dnK1uBMjVoXj0Ky48mrk/VAFRcdvfoPO8zFHzseUtCKaki0V46DCwDS3A1yg+Yha4ZS8w1q
	f+VLczeLAkVKVv42PoYuCy9nROhAVB9LthS7ddn2nSfX6zBMnlWrkH+MJ59vUDEwCeZ4Sdsm0zN
	/bSa6cxZ1ECYTe/ItY57K
X-Received: by 2002:a05:620a:a003:b0:7d5:d01f:602 with SMTP id af79cd13be357-7ddebf7dab9mr655449785a.14.1752495369229;
        Mon, 14 Jul 2025 05:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqDFY2LUDJWJKJDllYLF4aFMaNOU6OwD93goYemebkVnOeOPXbah23nYaZ32vbmOeya/kHoA==
X-Received: by 2002:a05:620a:a003:b0:7d5:d01f:602 with SMTP id af79cd13be357-7ddebf7dab9mr655446585a.14.1752495368724;
        Mon, 14 Jul 2025 05:16:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8313036sm799472766b.180.2025.07.14.05.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:16:08 -0700 (PDT)
Message-ID: <0d60632e-ad2d-4dbd-bf48-7daca73b6347@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 14:16:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LpXdX9I6eOuxytTC0vPGVwhFzTebAPU6
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6874f50a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ZM3GxCyrS3NlQnMyuMUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LpXdX9I6eOuxytTC0vPGVwhFzTebAPU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MSBTYWx0ZWRfX85qFdhAxRvjd
 AGNfgyB60+GxmpexwvHq5XXM6oySaVCgivcQ8t9Gn52D0mu5R3hP3SCzSM3ql0Ch8F3aLdV1x05
 +N2ez6pnONvdRhhle1FzHpcsIlwaXJoR/ppDdohWmGENLxQTP+xN8+4wsad/jK6NqHtXYZ3YIM9
 vBuyYECmqImCrQzkJdvdL8Jn1n97LHY6hhLQk4O6bzwEvpwAmgUbSfrC65BAjh+y9RWAMQtmGuO
 BLcvDVylI0sNgGGPY/BtoNyTq5b8nFRDS5KvNjufXGiDM7fJymgVL+7QKHlCews6V0P+DApXhoG
 YLUPCkgERauh21ULThZO4Zqdymp+SyrBg415pp0GNFwgfmnVTkS4gshZYfAJovvh6quMeZUuK54
 5AYfIy09G5G7YiLCRH71HsTfBmpKB8vzO3dA1+bwqzCweSkESnd34yc9CEd2zlHRv+CRLasZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=526 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140071

On 7/14/25 1:48 PM, Stephan Gerhold wrote:
> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> multiport controller on eUSB6. All other ports (including USB super-speed
> pins) are unused.
> 
> Set it up in the device tree together with the NXP PTN3222 repeater.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

