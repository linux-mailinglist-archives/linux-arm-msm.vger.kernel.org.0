Return-Path: <linux-arm-msm+bounces-87098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B835ACEBE1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6438B3029207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E060E320A2E;
	Wed, 31 Dec 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDCg2RiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfImhtpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6631578E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182133; cv=none; b=VD3xp+AVmGF8sXQnQtzGKiAltTARS1cqGvKnxJl4+s01EiloJDLmMoPMuzeeiuSydefMm6LG7nQ6KXjB6C+Yt7+4n2z/SRpJqbnQtTNQ1GofNhs2ycGeiFM6MixGMN+713WKhOCap3aB+EwHk4qJdoSUjSuRujKnHYtX3dDz10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182133; c=relaxed/simple;
	bh=YcnEwOIhio1pqk3VoTFvxX55HjCeJC0Ms1DLaK9GUv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEh9ghyA8D0H9u25BvEYVaiVlTzjh0PV2eL9lEq7se6U4NWoH7XBeg+VoOGUutiC+kNfGULcj4RtEepYEKxN5TdN2uX4KFH8WzGRzvVL8kDFNBXGpiPzlj8gjzDGvL3mzkPhpo/Y7LZp2x5rdxhHefiDWjUXNlhIK1yknaudtGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDCg2RiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfImhtpC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULV4jc1231816
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgAS+XV4NGIbS5AlOxK3JgWg3/RW+6Jpy0ZJY+OBdY=; b=eDCg2RiQIPCiD4/r
	OZgu/lfRh9HRoEAx1zkNlebLqf8IxPXFNEktnbGD5a5L1knj1WrfBY+6V2Pq1Zsc
	bFtWQOz7ttYHRKT8iz7j8QiKTNZlz2lLg82tvlzoi8sodrVtW697pS0jJCX0k45P
	oPZmqjTpAbB2rZeAc//aX9q8Ch6tXSkq8DyHWl2NzkWtxsPpe8oZzRgyBozHYh4e
	kY40fRnxD6xZNzhX7YiIn5T7AsGLzGrnuOcr4cPYhh9tPPZbExchWzbzLLCirjY5
	1Fe+crApel5VBpL0Msr7YuhHW80l1iShUvj64kCUCHERyS+5UamdJa9eONpsObhl
	ovdP6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvbv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:55:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1be0fdfe1so446865785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182129; x=1767786929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRgAS+XV4NGIbS5AlOxK3JgWg3/RW+6Jpy0ZJY+OBdY=;
        b=WfImhtpCjwn6Hp4LDTwUhPpSEaoi9EaZHa7LxXxT8fbQaBYRPnMTJL80DIVjxFLHpl
         mKXiLcwBRKsgIRdB6Sz9bHdwwXVho9v0Phv6pKqxZMVIoVQAgSjnEf01joN6kByZfLyk
         g0tpjw7/dCEL3PVn9oDMZ+Sq0tkXE34q0xl6J4ygCkRljYVM88bD/Pg2SpvlLON4h2hr
         UYksRGYNloc+/UWdpjL8Cj/Ao0XfxuIIalmDQIP1daE/UOe/9HXlnbfoE0Fv8T9ZJBXG
         quQnU5xD4WtM+dp6pochFnP6vxuuObq5kXOiotENtPBeqTQHvoa2zV28Fg+UMAo/4YZV
         BBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182129; x=1767786929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgAS+XV4NGIbS5AlOxK3JgWg3/RW+6Jpy0ZJY+OBdY=;
        b=XA6ChwRnjhWwlGumSomgUslUH9+HlTWPHlDTrJEDGLUj1o2cT0itKYh0yhJeSWdHV3
         UuY1yg96oT8io7hZWGCEKXs32Zbn3HvnQ4sma8lFYYDH5Mmo2XbWreKYT/DkzinW/46k
         is6dSEzRKZ9jxRVbQ96Rf8Xxt63rWZExSU6pcI+OCMEl3HrZuZXWeNH0b3C7tG9ZTWpl
         FSczNgwJSsLkgeB4+wifkPZ/ai+VtT8JsqyN0ZGVgGlrTMgMio4OTVIRu9MBsKgSp7PZ
         OElU/CKY4nMgKKx7yWlDj8UewEI+fOOriy1qLKIbeta62B209DxeOaheXKXm540OYgsB
         YxRA==
X-Gm-Message-State: AOJu0Yw2hldslyUYCUDmDieqLruaQHCB9Xcfs5IuJ7Imq2StZoWnjWNH
	QMjbnMPDwua2vazsvH7LTzKNdk+zJx+UZ2rDw96ZGutpDsmk4K9X3qvlY3MB/4tJX4Ap8n1P0nb
	KTqYVuxyDTZ6KSM2lR5821qr+hDwOVyXboPjXG4tuVFQ2VIGFDbTeMG+5HvFgk2QoDDR0xPMD3N
	Pk
X-Gm-Gg: AY/fxX5jCSbSnPPeF3HIqLUeS4BWNDtKkf+XEw4BSuz5UUGbYB6KLR2oJtrxG/2SmXn
	aEcUjEoUFvmE6tfmHuFRzx2hflAMOp33LCrRGnBlsE2+B7rH/O+Db6RW/NqQ5Pxci3Wt9kFKT4C
	6KAZrGaLaYB1xiYA2hlm4kTNdVUtUKPXIrlhdGy8dFZhrnX6Y9qtO6lVtav0nqZt29FoYZ+F4WM
	O8/e7Sod0yi6z2gyso4oJxo4V3qGMAugcsyDk2kzeOMMwqK5b7tlb2LkPmGjIKfHxqfOsNeUi52
	77N7S+CWUC7JiNpdsL+xHpxqTWsq6hHI0Yx5FT0P+YFEaxRzJI3rRBgaGnBu+ZQxXpxVPxFMw7V
	BTg1l+zieZITRd4wiNff7DJy4cvk2CWKX98UP61YJ7LOQ90gBkRDF6+o2rEQXQwrOSQ==
X-Received: by 2002:a05:622a:110e:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-4f4abcd2aa0mr417993481cf.1.1767182129653;
        Wed, 31 Dec 2025 03:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUEj0uHQJWKcVrybQ4kVXd/G8cMAoL8phJ7s4l4QL/dkGOzS3sg17A+M/DrhwRiYE8vhnPzg==
X-Received: by 2002:a05:622a:110e:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-4f4abcd2aa0mr417993341cf.1.1767182129315;
        Wed, 31 Dec 2025 03:55:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm4062214666b.49.2025.12.31.03.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 03:55:28 -0800 (PST)
Message-ID: <5490878e-8fe4-4493-bb57-e671ebd00318@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 12:55:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-5-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231101951.1026163-5-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XCQuAqmUu-oDMkNUoCiXGeywYBaNOiMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNCBTYWx0ZWRfX2vcUBb4D/Zd1
 wgSvlKwJDn6R+4IzsyrZ8BO9d0Tc3GlW6VzBfGgwTQ6yzgBg50BSPU7kGDUiHRFy7k2396FLD/8
 fdl9EXg7ErN17brSM/7Rsyvv1suSoR9T/MURMQCo1sU+RgamT3MO4Xd6HE/DYu4mIFrS2xR5vE+
 8JwEkqyyE74MkK/IBgvRtrrjvbgagj7+TGTbXmOfSAI4e3THIUq6dWbdOU0VN+5plKTn4bQfa7e
 KnYGt893ofGIQjnc0jREaU8k6fBlVzKIuBpn/BZaMBjUNDB5iP9FwOEJi4YC4Amv8ixFR53n0kr
 KQuOJ/kJ+RhHGPJBrAbg2xYqB7b95rLIJWziTnwZX6uTDo9RqpqEuQeh/86dPVlXeLKwl5/Ab2P
 JP7v7iAK5Fxj0ZZprRgKQPBzX/Y9CY1hfo8OMqFMDvEepWp+x61xKvbGHlEyXOwYJJwu5hwWy35
 t8FUgHr+7UIGMGw4omw==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69550f32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V-KO45gPXDKAuljG5boA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XCQuAqmUu-oDMkNUoCiXGeywYBaNOiMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310104

On 12/31/25 11:19 AM, Pradeep P V K wrote:
> Enable UFS for HAMOA-IOT-EVK board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

