Return-Path: <linux-arm-msm+bounces-34973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A39A412A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 16:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBE52828AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4E616B391;
	Fri, 18 Oct 2024 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMod9Wqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83A2A1DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261824; cv=none; b=cZTp8TMsJmTVc4DxauTleSlcYT36E5PZ3QChB2Yxyzkhsg0SorxWIT7n/xR4DQBDXXy5zMLugMmrkP0fcVQHg35u93tQfYXC39QJsE+vjbYy3GTsU01yjDnRDw48yT+XqV2DGE3Hxf55GRK/ZrKFKaO4ALBym6i4/gW3nhcJE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261824; c=relaxed/simple;
	bh=JhBL13wN5rk00sjZETSrp2nMS8AMe941erB/0y1LdPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUQc3GspzCwc8sFSOMIaFrzmQGgtBF10vNcxj/0YYlLQ8jKi51j336JPF1wfVYheIvoWQhOFeY7h84DMun9+OHoFrIf+IsL9LSY5hPQxfyBcPMtgD5DYVj9PrYSD/IdOgfPOgF/n8j+JRMRtea+ZTDyOIO7uJ27RMeeZ7tPqBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMod9Wqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IBIlZq022169
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VvuhDIzuJLJhCOTrAgsaIOBthvsCZAWilnAuSiJiwc=; b=eMod9WqamnYaO+vf
	2g7S1xQ8pq7sgsnXns4GSW4NkYz0bjCzjskTePpba6Ab7y8ScFt2KA1hQ8EdCr0N
	ywmq8ys+46CF17M7iXLBKOju3LG0LmAwshM9rVYlva+DkYEPZ+ilRWAQ3cQcl7QM
	7oskDcViTcSGqhApcqrXREksbIpIvLBKFtdycIntidEtUZCRuH+omPfa1jUkrzSf
	XIxC6+u1R3sJ3HOiyV9DdohvTSLOyKb6D9vQomGrl9+4dCYJLELWOkXCmorIIdVX
	C9M/4jkBh8DtbVpwciTuhO/tBJrb4he0pA9wS0+hpR36/TI9B4i6ioFPzAMKcAEY
	cqBXnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8ca17w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:30:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e2cd4fc678so491798a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 07:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261821; x=1729866621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VvuhDIzuJLJhCOTrAgsaIOBthvsCZAWilnAuSiJiwc=;
        b=GrFA6xM3vv663QcfhLvV16Nv81N5BjnkTZ9OQTY1V7aEEQOk4a8Rvwghnnz2CBH38F
         xixySvlaZwAsV77GItgcIuvQewKX0n4ZtmG7xbcLxnD6JfGh73j38cHkJYXptwfBtc57
         OwCo/Jp/lKiuqIzo15resPx1fkYD8I5ulCNyrUSIGVZwjlleB6Xtsm01FSOyYZtcpDc8
         OqjIlbTlFjCtyrmk9SIwvwDwH23dxAHzj/7nkFn+ErSNke8SvivfxCXgMEaY/Cu6SAgI
         CTJ04H2hYetUq6vbaod1WvBjytfblvCgGaToAIBnbQf0xrOHG4NOKAgzyCLnwFFXrDpc
         DcFQ==
X-Gm-Message-State: AOJu0Yw5BcX6onznJH6c8B6Nd5TPOcZTODxcjOrI560UeILdy1s/U5k5
	acQ3utECwR4lUF4/LjWq/ITS6ikVv/YYUlALT+XNfG5ut/zi1mhHC5Zc6DSIPZ3lQ8Yjdh1pc/h
	ivS+k27wGTHCc9PCV1vS1LFaVZJQyqiRf1st2DXJB0a4RpM3t7AWeFXwj3rBVoZKG
X-Received: by 2002:a17:903:41cf:b0:20c:a7d8:e419 with SMTP id d9443c01a7336-20e5a7601d2mr16633895ad.4.1729261820814;
        Fri, 18 Oct 2024 07:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzuVE1gDkndKfH+eLn8ouj6S2dAtkyzzqktuZQRq4LGzxbQKo7rVEUVxmoWxPmlBZnDsj70w==
X-Received: by 2002:a17:903:41cf:b0:20c:a7d8:e419 with SMTP id d9443c01a7336-20e5a7601d2mr16633525ad.4.1729261820439;
        Fri, 18 Oct 2024 07:30:20 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ae545esm104632266b.67.2024.10.18.07.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 07:30:20 -0700 (PDT)
Message-ID: <fee25ac2-14b8-412b-b093-1526443498e7@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 16:30:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] power: sequencing: qcom-wcn: improve support for
 wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
 <20241018-sc8280xp-pwrseq-v6-2-8da8310d9564@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241018-sc8280xp-pwrseq-v6-2-8da8310d9564@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QgwnVXiGWQnwd2Do4URF3gtZ0h2pjt_j
X-Proofpoint-ORIG-GUID: QgwnVXiGWQnwd2Do4URF3gtZ0h2pjt_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=407 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180092

On 18.10.2024 2:49 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> WCN6855 (also known as QCA6490) is similar to the already supported
> QCA6390 but takes in two more supplies so add a new vregs list for it.
> 
> On sm8450-hdk it also requires a short assert of the xo-clk pin so add
> handling for it in a dedicated unit.

Any chance this fits into what

Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml

describes?

Konrad

