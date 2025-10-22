Return-Path: <linux-arm-msm+bounces-78395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE9BFD882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 713124F99C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5791128CF5D;
	Wed, 22 Oct 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Thifikf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF91280A20
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153600; cv=none; b=gjn/T6jafX/1kaS3vGSiCr8YRoDHvDeDkFPdfUCDe3HljwihO6MhclAztGj2MZxHGJqRpBf2Nb2qb1y+zTjjyxNZFQM/jlVL41/atQpsuSr4O1ogwjGZZx3hyORO4NqG1uxP3MVevix9rhRYM/aUBu/7hDBWM3gCPl8p+WbOBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153600; c=relaxed/simple;
	bh=p5nAGxvrAUP5cnUmvYosqNhypEEgsoHxE6IFoeIxcbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2p5zKzlxGsRzHvtdFpZUEXSGwRqeNclNiB5DC5WorUVCjqwRHtRMmvZLsgASNG7H+px3nJ94mt8aoE9kels9O04JjmneeRvu8t8aWkfkzWQuzy//STzS/heP4M1u8U+D9GWIavTPGrvyNCGwrbFnTkGNJaH3P8kptKP4d9ZBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Thifikf3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA00C4000307
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SUfkHbNbJjInMBUp59+fC5w+6y+9d0fh7BrDW/sPOT4=; b=Thifikf3LnJuWReu
	Oms09SqNSFn85KENiEgeyFlT7i/h4ffoZl8TTyenEG3/svCbOpuyoAcFS/Z7WjrC
	XkzihHx2j73/oxs/t229GgqgJvRtUsRk7dzOYPrdLcDm2WiwYGxrvNTynD26Mm00
	zOQp3mozMppiiz9p7Oxjy5gDk7fRMY2bra7mwUIoelplbkghJ/okSXMdvDirHh99
	+5bDJqa9yT4ZAkcSHuwVobSMpOSHUvei7uhwXTyxpLZpwyF/vUAXCAdK3+H04A08
	gS5yh0qG1CWv3uO+wcoPY5wMvdjZpR1wwV6dCC/Zks8brZoTLPJPudRK8RixwMbt
	AfHO4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wb4sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8afec1169so4069791cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153596; x=1761758396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUfkHbNbJjInMBUp59+fC5w+6y+9d0fh7BrDW/sPOT4=;
        b=rh2h9aajMGNLaIAJPjMHzumjiu4p6AaoJWnKs218rRgXqML97Md72sRM7HMlvrLnGg
         400ujqq/bcrcHHULoKBrdQ7jjeMqfkmN50AJ4b8Xf0D/B+JUJpiS7dPP13mpxnE7Uevk
         Sge+jlDTtVXk1yZ1TkIp/yXsikalS8rjxGvBSl4ZXtLPc/t+O1LBFZSU6EnsJpme9mRO
         xCkR2H6//mJkfN0eleVEjOl1Cx5IWad7O2eECuI2NE+sfhFlvG6ldezcteFhNNjpmV6b
         NIP/17eKK+zjJN3j1FddL9lO10g9UrfQLtKjufjPM+aOFlU9adpMImvcesHLb4Y1954O
         chvQ==
X-Gm-Message-State: AOJu0Yyb9WIzlCsuzr6G3Swt01esk40PzVwNVpMloQZBbsyIvoHXUlBF
	LfoZDoK0hujfodf2wl/hSDszsfM0CUZ1fFXjC4eKsy8+mdPy9539/6ZSz3hEENov3s7ZmkJwQfM
	14cH4Kov48Hk3xHKKwLGgsJvo2VHhVI37rvzmdACKiWWbLAfKGLYLY/UKS2djOukIEaZ+
X-Gm-Gg: ASbGncsbsqymwmMIFJdT6DYAzbMTsehxWhLMpVbvTGLDS+f37NLFWkFgpP2QsVn3wij
	TWcGUlAjbWRpUXPGvS5krnHQyzua72wFJGctURUzA2W6CirC4X38IlE4VUdAzOCO/OXok3Rpc97
	N4u9qLObdVucCwxsuq9TlCa+RuahNrIZH1hnIuJQ05FFNDA43uLssfytFwEyzwynMwdxW4EQeLH
	Tz6jIIcLQKGmU0b2E3BN2qUiZKV5akN5Ha3YF67okS6kMDN4/ELzSfT1UmVVazU3xZTA4hETfdf
	iaaGttc9IZ2NeXmh2NdMZKZp3pHlbwOHoAQGo2lXfbg/9K+BXGFMbThyPnxmjMmerIS2Fy0H7Hf
	1YWAaRWLAJ5/42HjRZBicz3ZskLloZXrNjWlv8xvQM/uMz/+dRxfgon56
X-Received: by 2002:ac8:7c49:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4ea116abda8mr69679961cf.4.1761153596321;
        Wed, 22 Oct 2025 10:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoDqiu6KupAbR/QDMwKjaiqJhOG1EKNGUxTwxB/cS9oa2UhBHiyfq+I4SkjnmLz6AmKkPWeQ==
X-Received: by 2002:ac8:7c49:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4ea116abda8mr69679481cf.4.1761153595715;
        Wed, 22 Oct 2025 10:19:55 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526490sm1376226466b.65.2025.10.22.10.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:19:55 -0700 (PDT)
Message-ID: <6235f1f0-6ae7-43b5-a881-d5bb7d8bb8b4@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:19:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dts: qcom: qcs615-ride: Enable ice ufs and emmc
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
 <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-5-2a34d8d03c72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-5-2a34d8d03c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vNvh5Tmgijt2HbT8YrE4cUmFQEnjkQum
X-Proofpoint-GUID: vNvh5Tmgijt2HbT8YrE4cUmFQEnjkQum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX0CxfJRquCOxn
 Ydt/g59pq6QWQhkb7xXEGINOwrs5Im5za/Ze9YMqeNDOJNBqPwf3EIWmBND+dP2bKibU0LX4Yj3
 spsyKGyMTgxwTZBHJfn6bejJPznA5cROAroQmivi0d9yJx+oI0jVgUbbSsTnMcMIZqJcyILSJj5
 wcFtmrFki/7adwRnFp6dK91ydfk0zduJDqqInHCXGewRpHkx29mhhyDRo6ITxdY+SpFUKeqwrea
 198II0QAjmXdnTt7+0uJ4z7So8ktW7soAQYjcRgT88waIDpIUS2pV3IKaGFhudaf28Z8KYwJCUs
 dAH1m7f/xRMZAQB/kUNe6x8tsQllTKBeodBmTGwo0gTumy3Ijb+HxNdIm9Vr3n2rYkhXQAZ/kRO
 pfeFbqF8OzNHQGd9a1FRG45XVAKG3A==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9123d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=67M-hd6uxsQcvR6J9HkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/9/25 8:18 AM, Abhinaba Rakshit wrote:
> Enable ICE UFS and eMMC for QCS615-ride platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Is there a reason to disable them in the first place?

Konrad 

