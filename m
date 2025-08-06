Return-Path: <linux-arm-msm+bounces-67926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85362B1C871
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38C9162CAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B228F95E;
	Wed,  6 Aug 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khTcZuR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390719A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493202; cv=none; b=j8cfFbLXbkO+xFe0st2EPFfiSlAD8iNGfTboiHknlgVqVrnfHEPBuq6qGksIoBd86pC+X9nRV/28HeO7c67KrxkNORWFpNu35PiDBJtAiaOBpg6S3ZVe3uzZ/2cb6bpkgjCCEH8niwXiCYuEEVQe/A5cCjBBRUfWpfAbc+jr6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493202; c=relaxed/simple;
	bh=E1ywD+6b5TLidW881C8mih+zT9s566iOTR/teEUThjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Udp77Ywxd5OxxyoqkpTF7pbYSydQ5GcrHY7kwWaoQ98zKPTeIXaEjhkZI0H8bKP2p3vOjhw7IRjU7PsxWsBgTjdUtkkUaivOoP1GZyJFhRt7M7dqTIytJIoZWEh35SlzkKP7CSW89b4AUIT9sxRpfvb5+oBLdJVO4QvuawWRLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khTcZuR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CtEiP031579
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 15:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoD5ue7FLv/tVVaOYwgBAkYsHyRWsTQqwoytYtbdy8s=; b=khTcZuR5SEhABMhO
	WwwhLWA5NvWeZ3UTRbz//6qHPRP6zoOaKH+jm41Ar0R3QiURPxJlIeRaiCI1mjvJ
	hf2GyoYqtjuusjbVywIroHfjbUZoftoUdB+Dn8a5hYBAhE11k/OuvYZrGVRq7q8i
	Ts6pnSkBprKFdNFQyTDqDEvkZKzRLA2icIDCFnLQO0w60667mcNcNV6q+UZh4NzO
	eYvDXM4aJVtOpRmQX6zGoby+oVH6PiLU2dsSKrQUNCkSHkqU/NOjxpGD0IDhYwdO
	nQeI6eDpKV3q5tURWaYc190g3xOcnhBcfkE3sNPHAD3z6siBecp0rT0Js/sLJDVJ
	ebpO+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybb6s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 15:13:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-707778f7829so111736d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493199; x=1755097999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoD5ue7FLv/tVVaOYwgBAkYsHyRWsTQqwoytYtbdy8s=;
        b=n63xSjLDthlJpJS3EN9x15Goteokr5V8AjTs/wC567W2mKvW9/XovmsHgY6o0B8W9q
         zEmWasWoGy/+bWua0tcScgJ9a+AnlhYpXHd4T156XjKGpEPpEIaeAkmo99bN7ofXOIOv
         3X35ydbAFu6qZ9sAjRtmdb2LoqOOb4MSBZOIysqN8pZj4wTU46pPqpcsxwzCZYnW8vJi
         nZfSf5nW4Q/sAn2Gj1HSPLY8phtSXKnEHDaJwAP5s+SVVEz8SKyzP3QBvSAWQAVewGjo
         aGrGHUaSTxJmIyLpYzV0ePx9F5OdcqYmn8LaVUbsv9eHYRT4qvh/CTlYc4eyKjvUjGlg
         rbww==
X-Forwarded-Encrypted: i=1; AJvYcCW55ZKRNH0R5qGzkjkMFWZV59XSUAPolRlldXpnyl+NmedW+MlfeiftWyg8rUjnFeZ9pJUein/wvk645E1I@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4bZ38fk6BZGIdPu6SKh9Lra2N8FsfBuWRdC1QcCPJAezuZ9X5
	KxCuI/SfEA5x5zVQ9cTybJsbujJq5/eO9qLN9baEnp+O5Ee6mVWdjM189gyp+dTqiAmAK04ki9x
	sxooIkBi+FS6EeACnAzOJijoIPEflWZTVUWBgRs1cZmaObHulrb6abaxi/G9TnjSQ5jbM
X-Gm-Gg: ASbGncu/KV+nQUS6BckMUBfO+7rydn+6r/g2KE8MomsWGnD6WDsr+wLUczzwomEugCq
	MmSd62NuVxLPvgorNuT2OktQ4a/P2vgIFrLbnQMsgy8Xk2vdFrBHwtjBrWuumiI96ii5F/Yf3x0
	NH59q6tmJ4n6kk1piO5R3KQtXT7iVUFXghMdrB7aM7UracZDOHtoqxdC7nrbdruxV/mB8blWAMt
	Y4K8m7+ydk16/hV/DCY86abvFIn2xKyeftA9S/NXVcAd8LX33g4be08w8TE7oglgThbY1GdNlcJ
	zTAs1LfjgCCWg5juz/k6Fy6GTP9sdq4YT6/UsH3J5Njk3F74mpqVhKdwbvbi1y+JdRFc3Hyt55G
	u5x7rz1iKjeVh+V9ikw==
X-Received: by 2002:a05:622a:486:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b091575d69mr22519661cf.8.1754493198888;
        Wed, 06 Aug 2025 08:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVjPaBvVyXemUS3cDbhkwc4YdKlt9IkD9oqd8GDTb3Ol2Pm9hJNwgpylnDtIcL+fPMzpoJVQ==
X-Received: by 2002:a05:622a:486:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b091575d69mr22519121cf.8.1754493198074;
        Wed, 06 Aug 2025 08:13:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ecfsm1118111766b.94.2025.08.06.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:13:17 -0700 (PDT)
Message-ID: <581aaa8f-9e08-475e-ad23-3369fa05e53e@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 17:13:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator
 support
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX14o5XRZTLAP5
 3pOF4hEl9hF1Od03LrPO7Y2BCw0G/oL7elpw5bgRt5ib1JoYBML24dLdN4LntIbi3UUIoN37YQ4
 Hk0nHtp0FzE8txDWzIU+SWe4tcKNIjlQnDpA6uUpIPCQXBX+zUm5Z/enHiPJAQu/M0GuQ9Sr2W2
 WE689I+2OF+Ep0d8eBfKv98irIkhk10HkQ4lrXjivmBgwGYhdmmHIwgI+nPpZKy3RYgwk18c+kw
 J0qHLgjNniad8i/vo04iSn0BudBKK1uxh8WIehf/X/bUmeuXEBlIwsgxIpiUkZyMvAg2yEH9Td1
 VXdFNVVZbYu0MQddE+o6rQy1jkK8dmZvMj8rIXkKMCgI+n+q4AQ/bVNBNkXO11Tp7XTI3IntSY6
 Dmm71qw/
X-Proofpoint-GUID: W1L0ClNpCiaJUhqwLPExlsGsEmEir1wX
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6893710f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ZdkvxXOI2w3T0V8kwTkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: W1L0ClNpCiaJUhqwLPExlsGsEmEir1wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 5:10 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86927).
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 4c6cb4a644e2..9576efdf1e8d 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
>  		};
>  	};
>  
> -	/* AW86927FCR haptics @ 5a */
> +	vibrator@5a {
> +		compatible = "awinic,aw86927";

I noticed the suffix is absent in the compatible - does it matter
for discerning the particular chip and other variants?
Anyway, so long as you and the bindings folks agree on it:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

