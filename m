Return-Path: <linux-arm-msm+bounces-85482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BFCC780C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C21AF301CD2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D1532A3C2;
	Wed, 17 Dec 2025 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceOhw4I9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dF1CU8BA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8000C30BF4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970601; cv=none; b=NQu0C1Toum8n1zXHDoL2CtD7QAJ4iwzYSbiA/kXY7xUtTN3Remu0uLL9+UsXzeBUDnwfNICGCxiNtKPSRJCR1Bzqw2T23IypXjJHDMzu3ULGtv2zViOnsSssR8UNAteEVMp+axBUpinwvguGSVxnuxFwj6N7pFAC20Q1Tyn7ASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970601; c=relaxed/simple;
	bh=huR+GWIirjOdOMYg3mVBFAkB4KRuUGNGpg6QM5adZUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1Sn2q18/lNldrZCXV5DH2TU5YAqlwTvb2PdeMXtrnlDPDbcpvsd9RN/yApkMJcdenrbTJpuQJdXMQPib5lCGo91EcMf1NSdRfKV4N4GFA+O+Q7UCEPsZxrHgMH4fYCJXpwmptpOzYdtSqXnriucm0Z4E8VADfLVOYbzrCXzp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceOhw4I9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dF1CU8BA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XMVT2316084
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhwWA1wEAAxOR9ob++f3Td1XwWbr/zxBGj1xkgKoml0=; b=ceOhw4I9YvfR1LmR
	PcejJ+3TqyMu4hMf+K3sKaedpTaQpueTOcdRxmr4q9GM9PsZs3QgBDN+1vBxUJpQ
	JE7/dnhVsD4QbUwArXPZcurstSG4qEc4jV07uVGBtI/LEK0zgVuWJFVjq3zev6YZ
	Iw6PqHzhL1tWLqOX5AEIXt1Jr/5BroS4JVU5aJ0RmMYgGzmQ/6Cpg5GuzOdh3u9E
	LjBqjq6LDpFAl/l4OSTggUpmJBoaQqrOoJBn44OLfjrCOdBtob1ctME9IkaK8MK5
	MLoXj21Gb4/eBQiCVERfcXN3yiiOw4aDRy+PEqZ+Dc6BygK2YF6tbmgICuVyzym6
	BgSteg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkh8x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:23:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39073c8bso9940156d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765970595; x=1766575395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhwWA1wEAAxOR9ob++f3Td1XwWbr/zxBGj1xkgKoml0=;
        b=dF1CU8BACmEOPFsUeuDl48mJOER5qYajE4BW34Pu8dOw2nSmwIV3spuqkY+8ZCtIbt
         RaiPa2LhC/1GSowtaNrMSR1BP1lR0m9g/QZNv4AfDJPFS4jnBW5LK7+ZeE4kTyQeB/MC
         d+tlXhBX3TiAOj2J3XPKpRfDkNixwaNA6VQSkT9R6XicVpL38XIoFJkA8GeQ/IP5RCJK
         MLaDulnmqo5AR6dV67QCfIP8R/ZAhpvBEjiTAu2OOZCsD3GYt0oDxlGBlm80fNWm2hWi
         cS2TZHHhcj9LwWi+qGe3vb8fqonRAxgptP6LgLJABs8klrOpVUO4CZdWiBuuvSlsD6A8
         TNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970595; x=1766575395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhwWA1wEAAxOR9ob++f3Td1XwWbr/zxBGj1xkgKoml0=;
        b=eKk/XUz85SEl4ZBZfPj6h5/bT4KTr/ODswiMk25WVcaG/omymhFkxSFjrX3eI6VOOx
         Bqf63oEtnsJ0CALTp+4606V75M5wp7jNDTplM2vCW9fTcqkQ1jiVDyNQHCJby1dzD0Ah
         D1IbWl8HVLSppmj3Xow86VQsCOM6k1P130mJqUVQ7gNK41cGhU+WQClObGYCH60U9aDU
         zzBADE/x470y6RymxjuyPIncnQiOjYoBCMe4Tag5McMnJWt62ykCK+UXgmvjDepB8XtY
         YEZTKl9sYTjXYFcYOyoj18OCJ7dis9Apbuhk9R67SWwPvb5H9SbHWUeqIYkfhEZBJr0K
         vuww==
X-Gm-Message-State: AOJu0YxctBAUsZJxs36draT1P7Yv96q5pRPVC1TkZzccyMl7IoJc622U
	Qb5iPRtgFGvPSuGKj40XUAekLO+Z94l6ab3SfNXiUt1MPTRGoAE2Cf23Ba+oDnOTSCrO+thHuty
	XbhPME2vGOxdS/cMMyJ2XpdzMPLE3tLt5NK4IAEVLlozIzHasq3OITVBDsq1zW81k5Xax
X-Gm-Gg: AY/fxX4Xb6rPRWSfV/nEoagE4LAhOwoxOrznmqOkA9bAWJcFtTDfxl8P/+iPBWrl99O
	A+oSr5gzwROdcHUzluypUzJVhBNxPpu7D0CkALTQ9hFcp0uSNnVYFb0FdBZAdadwplG7/2tpgGS
	taHutn41iCzP92j15l8GjZUH/I5+ux3Y0DpZ34M60SZEnyecqfEg8hCvV407o2VHUiZjdRGxPd0
	wcby3jKuttR81rlfeh03TgxvmybWZLXOC9NHLJYSMQeHx8OsGOFnBBshuxGBN/e9lz/+IX5T7Kl
	p5bFkiQ4mF2UKQvjTVXHaiPSn5ttm3wmRXfbkEjouwMBS5Nv5h/uqVcjsGcSyOypgNplH4WGaRR
	GWH7Yku7Psuy9dEpfTTGp9L+opowM1TQU1zf9pY2JCvN/rN3Nl7ifirw26xoqs0RAsA==
X-Received: by 2002:a05:620a:4091:b0:89d:4a69:1502 with SMTP id af79cd13be357-8bb398d9d6cmr1833093585a.3.1765970595325;
        Wed, 17 Dec 2025 03:23:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIPAsKI6WuJq1oqaqsh5Z8B+BthTkvS08uASi5ghcWxLWkI4BWbb0w6Lv8FYMEJKWggwpv8Q==
X-Received: by 2002:a05:620a:4091:b0:89d:4a69:1502 with SMTP id af79cd13be357-8bb398d9d6cmr1833091885a.3.1765970594814;
        Wed, 17 Dec 2025 03:23:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f584800sm2172569a12.30.2025.12.17.03.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:23:14 -0800 (PST)
Message-ID: <494447ca-126b-439e-b150-7481f6d5ee45@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:23:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort
 over USB
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
 <20251216-sm8750-display-dts-v3-4-3889ace2ff0b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216-sm8750-display-dts-v3-4-3889ace2ff0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4HrAevprRGvBV04xSXpeovDMyiLfehFQ
X-Proofpoint-ORIG-GUID: 4HrAevprRGvBV04xSXpeovDMyiLfehFQ
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=694292a3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xgWhb89BDjTtD9WMArQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX/udH/NVr9Qh9
 xOGYue3qysH48830MEjsLokPhiAOTMfk69jhevDqh0DL2U2O+ieMzs/qV85W5Z4QFQ1eeBn5slk
 qdAaGPIefQzCc517tNI/EgBYJtdsJgGCDxpmNZxmtd7yluih3jMFEiXoBZiyirSsENuI6wo6qnZ
 3nwW+z93uP5p636P3w4IsMm5lbo7nGlX0SXIXMANll8Gyuu6I+CitR5erwpjltnlcZQj2fY5nM3
 cJqQaJkMgu+d/CxYjNoZaZpr1/5pjcV7q7u/s8JPIS48VMlFFvmp1ML2YOeqIBDve6OzWfE70wW
 qtooAjyjkhpG5r+PCYiZKG3R9rQxFeAo/OKGkEnGeBD8B4JJii27RWo9RffrwplEoQCC/SbQAi1
 Nx/ibl/lQ2s+OM6J7Ky8zw73Zq4Itg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/16/25 5:47 PM, Krzysztof Kozlowski wrote:
> Hook up DisplayPort parts over Type-C USB on MTP8750.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

