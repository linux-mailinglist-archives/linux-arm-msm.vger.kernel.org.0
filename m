Return-Path: <linux-arm-msm+bounces-50714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFFA57C77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D655188F3D1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5527B1E8359;
	Sat,  8 Mar 2025 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr8zAAT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41C1E520C
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741455883; cv=none; b=HdprLeqpioxjjQ/TLtgaPJCsK0Redof8qE0EjX6ooPGdPdLy1XueY9eXJWZ6Wqqu/wGQ+Z2hTPt/5LpaKdcSwGmGwUiM31aN/xZ+/Mq5AxuQ7ilZ/pSKoWEXdahjOEMpFVW8gSYcDfPwLOXBMUrPa6hX0j/EVfFWVqhfoMpIsKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741455883; c=relaxed/simple;
	bh=q5uR06cY+jAnDp/h7Pi7MuljuNi05KT1CKa+bgbKDWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYJhPlfxPZDl3rMS3WSasFhWZNm7X42/JUPkJqKg/tOlFDfstH4oM3GTcSkK2OALwm7Y6udLW3cFftmbyX6BtXJexHfLOyGEcLFFzWdv7A/y0JNvO85iCgt+D7/yH+yUY2Pls0q/UeFfEz4n64FLIL66k7Z6S1zIrPm3FA1z6XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr8zAAT7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528GCtGs018285
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLWsJUYVMSW/2p1uHoMFxNSZXw/knEpq6SZxmuPMxgk=; b=hr8zAAT7JxWPuumA
	0dsejk28swJhxG9us4KApZ3HAH0vnZ+JaaKCMdX5DQOKTv/SbirUDTXP0W9Tr2zr
	HI6sBMBkcylxyr1b10qwAegmq5KnXUUAvfyEmLiZrH2GUhbyGv31bAL4HmuPSOXN
	6i9qzqbXKTeLdM/J2rpzG05uSsdY7D0FOHy0BrjV7SNO5rytaH9Wzpa2bzFN5bTQ
	5aXvtt1gM0VsYs+qPqCFlIjyrMpMoFJiD9wotMAc5LOxPu4yamIW9JC4nNueiYUr
	rIhmttB/tUQJVu8lqnLoi5JDSGyBNmDDZNGiNNHYgP317bj97ddZhGR5Fkvesk/V
	Aq/+UA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rwrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 17:44:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso6185136d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 09:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741455879; x=1742060679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLWsJUYVMSW/2p1uHoMFxNSZXw/knEpq6SZxmuPMxgk=;
        b=AiMMzKxY83wCuVk3aMw+CgGj3nxW13n9swk+F3zhv0xiEOfsjSs2Pq6uAfnlHif1d0
         56d2U0viXNZR6aAAZ1zOxrCJGQSLORUzdt6+70mMLWDk90II1CeZ6oP9oJUxB5IRf1UB
         xRgcfPCsIaq63cilLSDGLoLH1B5v5HLhZi+YJ+/NepLIDdxLHZ2mG3aFAozwPHWIi4nP
         5ZEb8tSu3qporYoPrKvTHL8jWjX7iJa6gK5BXebElyIiI4hhs1T2d12WFkbjSkXlXg3W
         ZffPzNdct9gIvTR2UWZHHJKy+wrifjEEt/HJaiJAzjdf+gkjQXHJnUvzjTMIBwWNRRvh
         hmzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/aj/qE1tR0bU1GIsU7VeMfgLvVbYlxnsrUXDWsuht8n+wdf4meSbBszKLpRFpCl5rS6IGAtGZwcVTk12d@vger.kernel.org
X-Gm-Message-State: AOJu0YwHS4QurEkQ+wjbUB2RVmbnk7CfQ/j1pEkiFj6Yx5Q4Mi9a+Wve
	hh/Uw58NjXlkEFA28c2L0csM3NAs1f7bYLTtzq0gY3GEi0hbuTO2NHV7JTyf6HPBwZaHPLi35/2
	CplKVADUk4xyjcosepcBNOcLTW0Io5daafBQaxLdPItOv+IkZ+/x9k+mJA51QHz7c
X-Gm-Gg: ASbGncummFQnKGOuFX10YQjFdGKyyECvwmGlvxTCfMZIN2Uj8TJqq7t455gzdhY8ohf
	bMxt5HLISjnD9xfyaW0SplpYxHjtT2b823Qx4gM/mmdq3LnZ+7h19fYGu0E9DBF74lAUsF+r4UL
	9k5Z0MKOB5EtLW5YKEjUX/aGStffxxCh+jB/1IpHxO5PSSWQIkUWQoQTqj00hUVz3A8IEOM2sqt
	OPELQ1yXdK1Fu35Bxpe8GJvCfX7B+jy/F47nwFWwY7YQ9bZyhQXVFcJSJ9olWBkbpLvYHD9bnPz
	usxKDvOZ4LPgT55AL2k9sX8IKehPPSq3tsBwMNUN3dmfbIT75zjzdiTHICHJwuiuB/XfVA==
X-Received: by 2002:a05:6214:2b0f:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e908d5c1e8mr18056486d6.7.1741455878785;
        Sat, 08 Mar 2025 09:44:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLalPszjzFHr1vq7EvScP5oSkuDVHvvjG4hrxJmmcS9aB7d9TRhg4dfW47CYFQsaxmjCd1ng==
X-Received: by 2002:a05:6214:2b0f:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e908d5c1e8mr18056276d6.7.1741455878331;
        Sat, 08 Mar 2025 09:44:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973a74bsm455697666b.123.2025.03.08.09.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 09:44:37 -0800 (PST)
Message-ID: <028cb159-badd-4dfc-8a67-35f12cb1a720@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 18:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: platform: venus: Add optional LLCC path
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-4-279c7ea55493@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-4-279c7ea55493@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc8208 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=lSgUl_dL9m1uDwSaNSYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 07fBcGimof5kX6uMswpc-66vKCMZZdsM
X-Proofpoint-ORIG-GUID: 07fBcGimof5kX6uMswpc-66vKCMZZdsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080136

On 4.03.2025 2:07 PM, Bryan O'Donoghue wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Some newer SoCs (such as SM8350) have a third interconnect path. Add
> it and make it optional.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-4-8c8bbe1983a5@linaro.org
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

I'm not sure this is any useful without additional code after all,
as the LLCC path is a subset of the DDR path, the downstream driver
likely just increases the bw to LLC itself which then may be
a bit more slowly

Konrad

