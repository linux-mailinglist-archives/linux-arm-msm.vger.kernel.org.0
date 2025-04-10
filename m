Return-Path: <linux-arm-msm+bounces-53881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF649A84A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C2A44A513A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47501EDA14;
	Thu, 10 Apr 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jooRrozr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0B1E8323
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303284; cv=none; b=IxzEGX3GpOmTLA6Qa7ELQe5JfnkM+2ogCU79WvbciMzhLTEvKP9FVEPf0KOL2svbrpN0TvJBR30xLjo9byKJWgyRB2HAMZY9r9Ys+HOdiIkstfakfuCoBONkP/GIWKyW45txV1jbUBxW2eSAlm8u3s/sOq84d4NETv5N3PcUKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303284; c=relaxed/simple;
	bh=Hcr+OsbV0giuq3OJQt+MLAFzhy4z/J4/UvCBYVt5Ipc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4LgsXtT9DJKpmDdvidOGOAJfK4RCSn5ZiFRfzIvH7kKzIARpK5tJRtP/U8w+VB8ByhpQTL9cPJz/VTC/dcRAnEszomssVJTtek7URa9OtvZgMMS882HIzGPNrC/3WS/oS6flblOA+lMC5IsIfNMlZQxbDiEOjaBvs9von63CPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jooRrozr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFlQoc028831
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nz3AV0ZTJrVixT1lebo/KxCHi2vspT4PrctEXCftC3c=; b=jooRrozrTmVsxT8y
	iVOKgnQF/yctxkX/Riuy9pLd2BkHVUGuOC/0MM9M1YnC8Saj2EAT4z0/55c0l7Ix
	LVSCAA39XdGqSxhirFSNQwg9SQNxEG2J8oX7aXSDjefkQl2mxMppbz0N5cUfWI4h
	MqGgKAseeILwa4vHLi4eDzyMJGpF6Z8o6DeVY8dCTRQm3Doq8x5lsNruqkn6MWx1
	6Ow90tWKjPjSc42dxlbpS15e8aqXKgNWWAgo/c0EubPPR3oUHoG6nUB3ltoULHFg
	2Kn9GJfW3qY/e2sEC3HkaSbEiet8vk4aOdt4GOVVDAnrnUjCc7rOA2lMoqBfr1QH
	oVwuKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuqmdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:41:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso24640685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744303281; x=1744908081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nz3AV0ZTJrVixT1lebo/KxCHi2vspT4PrctEXCftC3c=;
        b=YQLflNANzZFe4xwi/7nQ3S7vMkdDUCMEh32Emfg1WPgFNrjwaovLFt+LjYkchk7+qy
         VQJucnEHikZjNAxv8eJslKBEhcK5dhMwKF0BkayeXzVzuWe5Cnqi/vPFAo0d7zgDAU2G
         k+Uvy1AU2YFKXTx366RZ9TAPd8WslVSzYafhHg4QvCH1ea3yWgQDzPMm5d09HwybsQud
         nC2LqxzpBxZb/0ockgDrLBZSGpBuOAA8HPG/+Nz3TePRbudQjb8FGV79kbdCwE7gHofY
         +Qk6Hykjfb5jEkr94fYWfvT25smf+5SXnfYju7CMJnIU5Rnjx2IAuUDL+i5ulT5JJy8B
         itEw==
X-Forwarded-Encrypted: i=1; AJvYcCUrGmiBI1ApsOPvaSzYFKyVPeAPjG2Ge7qeukPIRO4/j1w8u9Il73tgmYJ8scOyhsYXM0xK5sVTe6Bse9+R@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwpmzZy0EovkQV+A8AVP9GRd0fH9GbcJc1d5n/xNn5lpNv+Qj
	CCPSZ8MG24pHR8E3M1ZNHF08KmeF/k09itFRh1k4rV4FPiDWZ73GORbNYdQKu8ahHKoSZpIt/Ud
	ehQ40WzhBTuxrQRGaa2xInd6ZXi+bNdJiisFB7q2F5meFnU1N7WpgGmzggItzJ0Pn
X-Gm-Gg: ASbGncu2gionpHnv8MdSHrbE94O7eja8zwf7yuAGBDIqHw8Ti4Gy/ITiW1C2IDSteGQ
	n8deAEpM8pHuH8EcfKbe/av9ZAfyLRJV1MxS8edzSfgM1d3qRstsGxoSM1wFFrPZfHxwkjMvvtN
	TX6uYyIC1jBbAgQDYHdr1stFY/nc7Rp/IpztcMa7fmksJxh4KJO1S2x4jtAJqZMrdNCB3+woso0
	62T5kUoqbIcnW/F0NKYG1KcciQMmFf3ZnvPnAPWd5hw/wEfaBfcenlJeJREN0YdtgNbGT/5gev2
	aBACzx+VZygRTldG/I0fa+MwHQHIsOj6QG8nqVnivBeW0yabsisqhFHRomTGBoCTHg==
X-Received: by 2002:a05:620a:40cc:b0:7c0:a1ca:93cb with SMTP id af79cd13be357-7c79dd9a8b1mr382563185a.1.1744303281074;
        Thu, 10 Apr 2025 09:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKyHlrNq2qLH05ohY7PXUtOJFZJXokcW+KLyTTZ5H9Yjn47IJOlgaBBW+DUuMj07LVZzxX8Q==
X-Received: by 2002:a05:620a:40cc:b0:7c0:a1ca:93cb with SMTP id af79cd13be357-7c79dd9a8b1mr382560885a.1.1744303280439;
        Thu, 10 Apr 2025 09:41:20 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbd17646sm2618786a12.56.2025.04.10.09.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:41:19 -0700 (PDT)
Message-ID: <9db38911-4bb3-42c9-90be-51cbd6e523fc@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:41:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q:
 DT for HP EliteBook Ultra G1q
To: Maud Spierings <maud_spierings@hotmail.com>, juerg.haefliger@canonical.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <20250408145252.581060-4-juerg.haefliger@canonical.com>
 <AM7P189MB100977CCFD602396E8F01FCBE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <AM7P189MB100977CCFD602396E8F01FCBE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9EUYTMILx1Ijt9mpNXwFsaaRXW4145to
X-Proofpoint-ORIG-GUID: 9EUYTMILx1Ijt9mpNXwFsaaRXW4145to
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7f4b2 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=g0goBy0-_zJ6c0Nzw48A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=560 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100122

On 4/10/25 7:34 AM, Maud Spierings wrote:
> Sorry I messed up and replied to the wrong patch somehow, this comment was meant for this patch.
> 
>> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
>> seems to be using the same baseboard as the HP OmniBook X 14 so just use
>> that for now.

https://lore.kernel.org/lkml/20230510183423.never.877-kees@kernel.org/

Konrad

