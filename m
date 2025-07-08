Return-Path: <linux-arm-msm+bounces-64052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3AAFCD65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8307C7A7921
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1F32BEC28;
	Tue,  8 Jul 2025 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdRP6Hui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3C2DAFD8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984349; cv=none; b=SuxgT+mIHTGxuPX448gb4qNOOuAI3LRDdG9Q6GcX8EhqI1QjwqdzxeyZEjh8v64++W8Zcj2UtOjg1/bA4i/JHU0kGymBaAj39g339+YINoQ0gzA58WeDPVPYxXQMYLuTZvNusPi72BGdOfQdjFm5Mc+HFaa0XwSqZFTQSYK/eJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984349; c=relaxed/simple;
	bh=ZtrrtzG8CBKD7GY7+soKg4RhDNkLV26sXMNQPor5OB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4vAlBpEK90tfMBzean+ryBv1KnIfbzIIW9mz+D41NpjEtAFSIN9+erRfP/2L1+X6N3okwL2p5AmTXtpiGnqdcXt1vLB2TP9pkJfN8uOM5+njWmG6qu2+NfzCQo/VK3q3ZOdaEcuATR0ize6yWYfGlT1qYUclbNLMTjvwL38Tlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdRP6Hui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAYSw029304
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCN+ZM0WDYfEPfbtoKj8b1vYzeDnrGa8gkgH54G6yIw=; b=CdRP6HuiYwLg9Vk9
	AeVfvHTLmPR+V0N0INtC9KamNorbzYFjmSbc3FdoIuHJIT9aypuTUhdxhkUS5i5Q
	GKnjbK6H+Dk2eLLCY1zHXb2+IWNfA9QFO7MENMZvUijOIKZsBU9pusb4fNyETDYa
	35N2MOCU0KLqoU09PNhWKZPspjW1dqapjTgTe4KufOOmL+eDiExAOusRxss/rXuk
	EE6IIMvGVSP3HsNjOK148rfsqQKwGEPPe1EcJqDhKmcW4s/w8+Tkd4r2FX/EritA
	wSh4d42TD3JYMn3Qx4N5q5sXH7kUhx9TEMm/08IZ3EJEQu02jUqULTkkagWxN35d
	/eU0Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b6gsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:19:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso39868085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984346; x=1752589146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCN+ZM0WDYfEPfbtoKj8b1vYzeDnrGa8gkgH54G6yIw=;
        b=jFjMgah6OdJIDNPOzmaFZyqVh7Zdkw8VcIMDy9pjTZlFlectE9Y5CvZGjoo+WZiUgS
         z92Q+ggH6XIF1MlbJFoCwt/g/+N6OKtqF/LmMjQBKpClum7CKi9ZgUyhlSTlhWH4DnpP
         VhFdWUUJ/UKZ7TbFq9x086HkSMVSQfEiqR+ai1O5J9ecHX+TzZf3yeZrDvhmP6AmFrIv
         feCRqNMczz1JZu3wAVgBTyi8eNTW776OqV66zjCpTdbRxtKJynS0WN7uAeURQXzdT23I
         WGp1YA085kS498mJbLhrnG3I7WohiTDgGpUVggwbMK40NRtaSGterJlCdnyXiGWeoyUT
         Kmfg==
X-Gm-Message-State: AOJu0YyRR96FenUVqrVrAH/xA6lP8Geu94fXf1chXTB2l4aPWJB/uCbV
	IXszb50C+rI3SD/nJHwdkha7Nogc0iZt485GL+rzMcsJt+2gmw7QpFrA8aHw1RYiONZTW3gI/hr
	2Ok12o3IAv9Wy8Ay5x/zu+SPBpAmvg33MsYyN4SJbZoHyb7AN5+28BIiS6CMywDUaOWsN
X-Gm-Gg: ASbGncuHeKLV+oPXXI0s5brz/9dqbChsonK0J7nJ40brci8fwtkmacqtJ9pB2zJ4/py
	87Z0divh9zul8IzezaLUGKxBb3iEdVtObAnBkPCSn12TUjcpH5SQAu4wTl30ZfPUBLkyAqwrkUC
	e11HWcwjfaeuvLQWwqf6W8Q/eiOIGxXZr1AFJhwB97gUJS7JUY6gHkzOsS/nqi8TGx6PLLGnSnG
	R6YSC7HStHhjizeFsVuJf1gUJD0U4y1QB1zi7tKcsazBlgUNiKxMjcUkiQ5TRES5Si3HequK8UC
	oTXnlhkAbSH6NdoSsKcN2wNiTsKwaXoftbM56szag9UoWAb5KO7u+ljnTUkUDSiK654NqtVnMoU
	wvQY=
X-Received: by 2002:a05:620a:4707:b0:7d4:6286:c7b5 with SMTP id af79cd13be357-7d5ddc69c3emr930837585a.10.1751984346175;
        Tue, 08 Jul 2025 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGToZ7bX8sdPXYqo2EckDoDatolatmGiV3VIUcLArEf8GV6va65uu0OaC+oWZpqVwYJHsZ0cA==
X-Received: by 2002:a05:620a:4707:b0:7d4:6286:c7b5 with SMTP id af79cd13be357-7d5ddc69c3emr930832785a.10.1751984345114;
        Tue, 08 Jul 2025 07:19:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b64ebfsm893538766b.168.2025.07.08.07.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:19:04 -0700 (PDT)
Message-ID: <f4a74a00-a860-4410-a4db-b946c6211e68@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: ipq8074: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-2-692eb92b228e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-2-692eb92b228e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExOSBTYWx0ZWRfXw0/idErLhQyY
 Z/8s/8OjUkqP3zJj/kHvoMvcJC4hqjQinsdpbe13AwVAz6hEOFZnmB/0wmwyLFsuE/K6QG8Tcwv
 3PCI+ugoj3nOXOZemIUBIFqsfCeXrSXTXttdreZr8U9ZxVJReu8UqaAJMQ6ZAx+2eEcXWYi46jz
 zvvUYq26c3pGVs+gaKRkgMPbnnq0z729E0TYBA80xura/wq9MoO7H53C2t+Q9yVobaY30mZXT2s
 UHxF3XlQUm0gTA0oX+WFK8hJK3AY2Mav3fh/ib+XrDUr/yZr8DGkQnIrmISbe1JmG7cYITXi36J
 R5W+9Hs3fCHdMT+9rsIxGm9AT+tWcLq8SHiB7y2yFYQz7Yjuyt79KE9FFeXkTgPjzWJzqHP34u1
 17d7Jvdm/TGSUAaW38ctqNMlY4tsiWBYG2zXHBmKSkGMAvQTwFitKgWbdGQctb6JrFmoIRgN
X-Proofpoint-ORIG-GUID: 9y_xFEhA-3gdlJ-SREOFoPcN1HEoyhhy
X-Proofpoint-GUID: 9y_xFEhA-3gdlJ-SREOFoPcN1HEoyhhy
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d28db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kR6MMDqDNadd9sbrY20A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=816 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080119

On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 24KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rounded off the size to 0x6000 (Konrad)
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

