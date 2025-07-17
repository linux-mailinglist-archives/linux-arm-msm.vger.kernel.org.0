Return-Path: <linux-arm-msm+bounces-65497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C319AB08F32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054AF168DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3AE2F7CF1;
	Thu, 17 Jul 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuuI6zuY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028802F6F9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762460; cv=none; b=Qtikg6ANkMDHwcJWuVUD44cS4w53pvNw+hxl0B7PM7kUd92z8rsBWeNZgsuj3RYePQDTQ/hOpOKRzsBmVyVCFue/PZXqh4yo8Ht7XwoNWmB1AV7QCy2gGtrAY41qDkxtT28avoElsZAxPj9Y7UBDU1cN7Cd3Cqo020DhFBulhpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762460; c=relaxed/simple;
	bh=Giia1zcux7YT5W/j1PgJvxHqUXQxyrJ3hWTfSdKmYTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFyU6USx48o136Y3pZwdZpUq5HG8tJ6tJdZOJbeKvNS1OlUe+nRtyh/VhfNWKu6RIayaEoMWrFo0drd7FXEcLhn8I7qfHH1oyfvTgkKHmUHf05WOXY/dtLDyMBBrgcMVERYVdSYATWhGe3YjoLmt4joeFfEI88DoS9b7jNGZe3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuuI6zuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCTk4l000567
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBFJBbIapGojYSgQNuCXD6Rtrv4L7r+GtYk2FLS75D0=; b=AuuI6zuYN+331Q/N
	pya2ZupuYLuIBMdhuMlE/67DY6ORp7pUXZtWz4iWRACZQmLt35M7X7S2jmEc4kmD
	hXucqj2X9hdozji9PzquDvskzBwD7w3AT4H8gVXj1zCqz4f1scQIk5vFGQohUXel
	tAeKwtvoBJqafkZ/LszLGyqC6n5uLWepTNLFdtAuU9Z2qRKRHcIm9NQuu0FzEjgf
	Yxj+oEweL83WV7sV5i7tB6fwlDz2s0Dpx7SXwY9p2xPc/2RRYlNLMDZJmcw8hIPR
	ZP3vz1+Myd4IXFxg9d4jGPxWAcVywmCuQHNm6kj4uwixv+lOW3wItQaIyW/qULUL
	oGY3DQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dru1dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:27:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd5e07066eso3395596d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762457; x=1753367257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBFJBbIapGojYSgQNuCXD6Rtrv4L7r+GtYk2FLS75D0=;
        b=NTjpIJXWVndfyHQS3tlP4YHavEn7MvUblulMh6w52acmoICSi8HE//6ucYsNYRc+oo
         /hzNrDKeVHGPAtdPfcdKh+PKS3DpwS0GS5jnlkrVYKMcMMzxz2776ZO0WdyseWriS9gA
         ZLxgpVRbr2T1pLkkJynV5c/X/bKDCFFMMWyDEtchs4bq6Hnf3IWTX+oaC+HBSxN1P1yn
         YBh4P5ln0xRx9cTwIR/RFHwpCm/I8/EPDYNAt2ziB+bZZCiua8Gq+5cjCRswDQjSu+lH
         78WWQkH6BRvKKTDa3L/yponyDwMNMHE7FGvLLulkOyV6grbtXYclQppy8THJHVvBleDD
         99Bw==
X-Gm-Message-State: AOJu0Yw/aJMDItAr8UVd9eRUiEO1fj184q/cVGIQYd21Pkep8aFYlSkN
	NCf6YqHl/j/MB+3zx6+9ZQCJghMOB6vtP3IPdcwUOlL7apyGB+Xi5cMQ3u6R7HRv1pDSZrIxjB9
	fVvH0Ytj7TV6sUFnIY9BGtJi0qufi+lVMB/PCxbojVI5GTX6G6RoLW+GQsvQXuuLw7vA+
X-Gm-Gg: ASbGncuimpkjSUD10dzltFI/6LhyrA8ZwZ9B17dFkD0MXENFhrOoi+Rzj71N5ZIo+3l
	88nbJgVVHvJ7mWAfGYT82Y4HoSoYM4xgtbX1/NpPv3oWerQbF3fRJnD+cUmx86ZU3DQgT/x7v8M
	SKfxbGr07Yg3ECxgniZ9zm1osAAI477NrhbrUMZ59aotw//Cd01GiazUVqofBvmyk1bHtDV0rCK
	rHNZ+G2v7kTfRW5BD1x4gRe1hjMyQBpsetoIDr8iRY12YsNF/YxX6jNSMuLl6ZejNeXVlOl6GFe
	cq1CmXl8VG/IESgIcUsGCsdK7x1MoTsVGDLhw6WS78GLaVcpbqZlt8tEAgN4vDW4eN/DinOsHra
	hxZ1YohhR/R3Ba/RCOaHC
X-Received: by 2002:a05:620a:1a9f:b0:7d4:4353:880 with SMTP id af79cd13be357-7e342aa89e3mr435557885a.6.1752762456656;
        Thu, 17 Jul 2025 07:27:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwTD42e+PjHQyFrj0UD6uthkWAeqqyE1yXMhHiDxTiWgju1pnmMocBVblEWVBkf05S3h1Gbg==
X-Received: by 2002:a05:620a:1a9f:b0:7d4:4353:880 with SMTP id af79cd13be357-7e342aa89e3mr435554385a.6.1752762456010;
        Thu, 17 Jul 2025 07:27:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7c09dfdsm1361278966b.0.2025.07.17.07.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:27:35 -0700 (PDT)
Message-ID: <2ed06cfb-2b06-41ae-ace6-b404878a97dc@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8150: use correct PD for
 DisplayPort controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
 <20250717-fix-rpmhpd-abi-v1-2-4c82e25e3280@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-2-4c82e25e3280@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dl7cHBHs88qUZT6fpUtVqAcEQVpRqml6
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6879085a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=3MXfoZClvQzxQ6RW9QYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: dl7cHBHs88qUZT6fpUtVqAcEQVpRqml6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNyBTYWx0ZWRfX296jMaN8mLvU
 jxQhXPELKolqhVru6P+iws8F/sxJmfo+E217gASwrY+RgOJWMtantQw9cG0l6AAdsXUWaNcWBKf
 SZ1U5FkvO3svIYVqCFG4SpZwu0QbPDiLKM+VNIm54TWKUddrZuDifqlywS5R049bfJOjXI5knEZ
 v+v6kBAZHNgR7kiyKbNx5o7qnbDKj1h0pEjYcnSCqR7e1wNbFMxpa6nDfm8uPGdYoacBdX4h1Sd
 862e9EFhG6Iks7p6OGeuSRZMAOcB5wH73M8UXA7Btm/y+jvfQVJpqIwO++5WKI7V9YvWhB2e5IR
 vQN3AE+IJK9g1ibTIBhLsyLnHjV9WzFGX394MWfE7XWLzlKguN7xYd8RYFJfkkKzgVIlLBXdYdL
 CwKpC6IL8GbDlfK/p9b0iYHwo4IX2Aho/e4fdrfyqfOkhbTwffz59R8IZQOJocvqePpCduvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=772 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170127

On 7/17/25 2:48 PM, Dmitry Baryshkov wrote:
> Commit 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort
> controller") specified SM8250_MMCX for the DisplayPort power domain,
> however on SM8160 this indices maps to SM8150_MX_AO. Use correct indice

81*6*0 typo

> instead (SM8150_MMCX).
include/dt-bindings/power/qcom-rpmpd.h
90:#define SM8150_MMCX  9
91:#define SM8150_MMCX_AO       10
109:#define SM8250_MMCX 6
110:#define SM8250_MMCX_AO      7

(i.e. the commit message is misleading)


Konrad

