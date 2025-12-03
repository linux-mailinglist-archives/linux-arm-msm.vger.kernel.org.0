Return-Path: <linux-arm-msm+bounces-84206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8CC9ED08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC0F3A230B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3B828B415;
	Wed,  3 Dec 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3TaJ4FL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmHG5WWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E92EA146
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760185; cv=none; b=fUoS6tHIRXTsTY4xFoSCcRn49T8hYXNZEztaVZnswpHUEqI7CZ5NjrGxvz9TZthmW0L5aw9AvmKiKhBIEoFURDbeF8vQ8rFzgUzKNrYcHB3lRgEUhj6QunDXVh5e0wMCSrVrPwkAjt5+txixB3+IveGslPBwdiNwbH11926pfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760185; c=relaxed/simple;
	bh=vdFkK7ypt9X+ce/+DbnA0cFqtIl7lp/UAM9TuaXU3ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6YZbfGIycnMH2aUXC0DrcXxZImw+bMeVd4MC++4gb7H+uBo7L9QCsuX2OrmtZC9RcaUYqXOv10pECt4cWBFtJSzIG0bia0s0ot59/xA6FgMvai5cMOknzNY4ggvc8ywCVjR+YcopNCbO2cPqmKWH2YGPPUPoEpaj1ySzu1LlWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3TaJ4FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmHG5WWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3Cgm1374513
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ez9X+gNVpOb3V8RgGtBRfzZ2PPzE0pOUGurV9fILGA4=; b=i3TaJ4FL2Ys0kBZm
	Os74tZwQ5qyiTeV7QJQ1Ues6f4TDohDRZQh6JjnzruYO9GgfT02diiwpoITfsuGL
	TVHGxJucm26wl+RhG3bukMM9CAZ0qohftOhP1VvOPIAst4tBKnwDGhUvrvAM+UXZ
	1HZ6KOyuDYItMEI5eRfToEgEeFcyTySui+pD+fbh6JEDx8M67hyUopFUvkwtftgZ
	Pb9GqgIpbvfv2A+tXGYbL/FJlfEqHm5V9uMrvMC2o2i19Jrs8DqcRetO6pK/ksmF
	FBdXw/OLPDcxiv1z+IdSsyDInqo2HiM0wyLDGGWerQphqVLjvab4ejRME/yQnFnj
	LM4B8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b80qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so199797985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764760182; x=1765364982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ez9X+gNVpOb3V8RgGtBRfzZ2PPzE0pOUGurV9fILGA4=;
        b=NmHG5WWwOM0jtGnKNxLK7tDaAk7JL0QnVoNeRcrO3hkZeWSLwQUaO86ZtBk+pdii4Y
         piGVP/zlnqjrQQRCoONpKkxsf90QAMmlpaQgwqYMPmrAzx4K18Cn1tsC9a0NiW3+YvCh
         5PM7q4QIM+ZgF6Ri3Ev6b5w88hD6SVElX1aIxTAC84hQBLzXHtgPZxiocoZYTK7JUw2T
         qkiT5CsgJBD6KU46c9aN4ExVO1ifqdRXE8i4U1PS3sgxwc/wcAThf5yMw4KFeTlPeZCl
         IFpBte3+0J3cp/fDJQHChwNUPYDChBOkhn/1SsWnsY6tX+0VX2mk5g66T8v5jw5uH0Q4
         tlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760182; x=1765364982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez9X+gNVpOb3V8RgGtBRfzZ2PPzE0pOUGurV9fILGA4=;
        b=Ne609gv4XVjwjJtM9x8tnMIYmG07HGwurc0oNCV1Md8uLeoPInsve7Jh7tgOaSqiKn
         lVhjbngvJZvO35R5QpgVe7hHzMq5yd07+EIo39RJcXm0FjncLmSKSmCbtUfaK53WejrW
         F77gr/4ZTU7FNuRQxiwKTlr6HlMSj1eiBruX1S7NzevZXCCr+1TiAIhA1FUbEhJ+1zZN
         wq99GQYXmiMQx/gkSBz9y0Eg1g35VFIYF7XdZFxqwt1syjZvQmPG9WkcbwWBv34OrkbI
         tkLoUn/i4iBBpRQaTWqNKv8dpreTCc97AsJsjgAB7Cy9rVMcQRZvNFCH2LLJunchNpZI
         r6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+l6W6qxAevyJ5tY7br6pWlSntj5S83kbI+8wUx2fxhROSOIWHuqVagNKYt/Id46ja/ud7DI/ghH3qWZH@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/mwpbmNbjd7FhZwPChErenFXOs7RQMzv0F0AumlUR7fIWirU
	YxctzOv2TIq45JLi7Rq6En7xMNxlxSMYhJtNoHiPUVIZBJAZ8ToBlxc0GGJyn9MzYN5hB7Rxhuw
	0Ayci+Y3DkqhtZLyaO2LU9rnZ5fWd0ZuDMDexxk4/9LcMFsrc2CnZpFAt72u0hLtvcZDv
X-Gm-Gg: ASbGncs+LYirL39LAHFCiYx5TJQ1s24BaFXH5FLWSX5+ZqvI548vdyl2Bij5Z+pL+Rc
	vBm+8MzoCRqBnkvRvHdki3hEgtc+fZTOlo3//tc1CWRmk2/57dTNFid2iQaL78dkv4DaCB+0h5i
	hqL145XGef68t9Hx9+64AiF6F9TiRf+RAvSsHd3L+o9wdw/Q0aMp4dlG9/iRG3IN5cqrA4uBZEZ
	dJlteACkOwohFhhxondNykWqrmGyYf9P2efnMKsLDOFvQja8fKrvFAtS7AMn0IK5XL7BYJd4+3x
	/rTmYHH2NtoApC0R7eTVMK9Y0OHkIGwwubd7fskSVY43wML7l4dYovya5likthbOto8PQ8e2e5r
	lsYelI80sNK+MGRDc7/rLPku5sWiBvOs1RILVSbrKsVmXXp7Yi/LK4UG5QI0baYcJzQ==
X-Received: by 2002:a05:620a:2808:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b5f965a3e4mr65534885a.11.1764760182447;
        Wed, 03 Dec 2025 03:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0uO9lEaWLeMvhQ4EzNvfXWea8g0DFzrI1CbrVVYIEqi3PGL3TREVaHZOEr3O73OTIifEJRg==
X-Received: by 2002:a05:620a:2808:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b5f965a3e4mr65532385a.11.1764760182027;
        Wed, 03 Dec 2025 03:09:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035af1sm18524137a12.16.2025.12.03.03.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:09:41 -0800 (PST)
Message-ID: <254824c4-67e9-4bb7-a0e1-98886a0e5df1@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:09:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-qrd: rename image sensor
 supply properties
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203040538.71119-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69301a77 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=O7eCob1Rr8zABwO4z4IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mRqmHqbXo3Cvq8359KjBfU6IheCIAIAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfX2xmtE/6NbQIQ
 IpdurBm1JRmscyhXdiDGTjc8rytWYsLL2jCa42ZsSQE85gOPTqhbC5F677exmRDYFm0wSVb6NWu
 HsG/pZBwghZc2Ooe0MpUzJYFqSq2l/+CXinJH8MTZVUxtGpxQEf0kub3kJnwPrsPql/i7jECbYE
 2RCMofus7du0qHOZM+yhr7+4m3yuk0nMo0OQ4FxQ3D2hCjIxITKurtEt9aBpaWbZKJEyr+f9q5z
 Q2g0PVmcHXtXM6XCVhsf6kfKonwowhjyENvdEUDPc+BvECMH/cYpH4ds53TgVq1VqegkQ8FVJ92
 OyxqLCV7chIDLN1DxCt2/72ZVpQgbyOFYSVg3IJcj6dazwKPcvpSsW2aeQ+WXQzoQoxEulZOcjL
 UScN3K1AzPpk8WLvaGxqHa3T9aPBFg==
X-Proofpoint-GUID: mRqmHqbXo3Cvq8359KjBfU6IheCIAIAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087

On 12/3/25 5:05 AM, Vladimir Zapolskiy wrote:
> At first voltage supply properties of Samsung S5K3M5 image sensor got
> names following a pad name convention for Omnivision image sensors. Now
> the property names were corrected in the sensor dt bindings documentation,
> and it should be updated in the SM8550-QRD board dts file.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

