Return-Path: <linux-arm-msm+bounces-74584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF2B99D70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB4C3A3C23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C3E301039;
	Wed, 24 Sep 2025 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVkSjI6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039FD301473
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716991; cv=none; b=lIIkEmudB9UQgyCrS13xc8jcSCQWpSO7zwGz0pPUeIw97EhAVgMh224A13u9q5v2rO7MWLqQDfWtwwufq0ouMDTURtJGA7v1i2kIo2SYs+HAO19ORwtNHf6H0iv/dqamNL0asJPav+S/3UAFASqDIgKGGPbyMlVYKtrCslfRiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716991; c=relaxed/simple;
	bh=t3drptoKNYlq2Q/50sivhAAKP11SXqHJ11HtzDJEeRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYda/+0ntveV3SM87aBzfGrrzMVIFRCnxeBzAnvAgO0RmkfeIw7DrV3eDhdchTeC92BA0qcMwZXKPKHIV5Ojbzp9CJKUO6+JsS2nRSi4y2tQ+JDwkIi1CYLHo+1fBOB6maWfFknl/rU/3xSYzjG8gii/7H5cVV/N4qmz+/rOs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVkSjI6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iISm019931
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8aA9JgF8Hv2S8BUGxHOb1PonqGo7410kj0eXnO5iPdA=; b=SVkSjI6IFow8tbGG
	HM8yXr2ZmjEMkPU+mtubXzfP390JE9dvfnddyqiOzURahdrNzLClEYQi+5tXbzE9
	UZso+Fo70RLvQNdKmibs1zFGXzVtyEJ+q+mIjkCeilVTnU5jDqrdETJN4qvN5W8l
	zd3O1cEk5AHYPf2LlWRBXR9Odahs1pcynLkkldvpj0YRJap5YUtydI0YFXMlJzYP
	1R1bi+vFt2QOPpvC5oCRpGOESZ4EsLzww4xEwy/cA6L0S5Nnoy0UIOCgR5pUVZfy
	IJeCJ9h2/2ZQ28c5aKbxrEv7k8QKP41OEbnffNR8hnLOBzltJ3cZOrpDCowaaben
	NlqbMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdwf63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:29:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-798447d6dd6so11750176d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 05:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716988; x=1759321788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aA9JgF8Hv2S8BUGxHOb1PonqGo7410kj0eXnO5iPdA=;
        b=TK5ZC74/aJRTqMHlTQ6ttKxmQSO6OrRSUkW3Bg6HZAHzrmCigLpk9ELkEvmpnz+L7Q
         tr7uV3XlL2n1ASpSodjfp5apo/QAQ20Ythbv1go5/Tn1Ju1qzwkEZHodRDnjJU6/gzRx
         23rC/dnQEnOaH385dGb508uWtRvgiXgIM31iIsOr/GJflgW628mNkB/fQ+v3unmxmzJd
         5f8kzwZgAoBlMvIbNhEIBRcfZboaGjsmgT7vYJhrWmCYpPP1JDRArV+AfAXMYb5VAX0C
         7zuYYjrLq1+LL0hay8F7vtsl4S9WBJN67UHyhWxTRKnNMWpihx+krgSKFzg163XR5TYY
         xZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWReZA/ZOlK1f6JCew8gN6yONS9cAguSfu0AZOAv0AdyL4BIi0ZaVzhx8OkPV8mcLDbff5+WYGtEajaxgbm@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqe8frI84FFqedx3yEyYHBc8lpq3Lg4Ljmyft99yTLtmiaCt1
	14LoNzf42EcXWMzUQRrv9agxVJ90+6gc4Pe6cazJgZFkGryr3FigrVEw/29kLyCT7OpAhzuR6LE
	HaA2fm+JyrMOh0BW2dszHPH2FkTynh4nZ1KQDfRuH8RIdYUT+pNghiLQ/ADXuFo7vfYmC
X-Gm-Gg: ASbGncu0LsTjLRoBqNEmk1TEGTzo2l+oDc+uECEp/a7EYXgrWTLzsNVCt41rGS2wGmp
	sRJXhcRgcfyTGWXQfOhMkUgkoinUe8yAstISaWnz7DxateIudPpEyWuL68D/H9ta5NC1NEmvG9t
	RbvZw7wcQGdEAbeAQZ7bcOCNeO2cYlPEifYtU/NKZgsWnSgkQyn+tPvsUMmCdSDeY0wEp/pI2rW
	KZPUhdmFT991HMuwY6qjKENrCyMP3vD7hCnJmp7YrUThVdR8wnNUwqzGeAKpRCLAIzeL7hjzqWt
	FMCcTzcBETQE7UA2HBuBNaTBo5jaNQta7Eh2XT2lGhaHsVv25JsT7pS4aKsxHc6c1qo4rqKn8Ak
	ICTNyZKf+BJYJdeVe9XzZyw==
X-Received: by 2002:a05:622a:7590:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4d88b47addfmr13290541cf.3.1758716987621;
        Wed, 24 Sep 2025 05:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXyhiZk9RtpDFaAkBAtfbIkuND4lxlU3ru+FowFhi3tTYNqscVvbnQrXr8FhTrnGzDmwkh8Q==
X-Received: by 2002:a05:622a:7590:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4d88b47addfmr13290221cf.3.1758716986932;
        Wed, 24 Sep 2025 05:29:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b32859673b4sm159051066b.30.2025.09.24.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:29:46 -0700 (PDT)
Message-ID: <23e2d458-1ef2-483b-b87e-7e8b52d90eb0@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 14:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board
 dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org, christopher.obbard@linaro.org,
        loic.minier@oss.qualcomm.com, andersson@kernel.org,
        Roger Shimizu <rosh@debian.org>
References: <20250923064330.518784-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250923064330.518784-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _B4U-13YFit5hu30jTHlHNaMsWlBPv18
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d3e43d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Wdb1h0LgAAAA:8 a=R_oj8q8ptHxJV_HUbZoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: _B4U-13YFit5hu30jTHlHNaMsWlBPv18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXxjADGhODVZh0
 AY6bgN7VGFNcYMjO0XuxyuwjBd2Cx5dWo18zcXlPWgD6Zvz3cwGZ9SAMQoitB/sxIYboSOI4ZPp
 bk8F2a0IVfnhBnN7nhtlN6v5HfcLen9iulokgOQOusp/vSyfcl1eh25k9JM88K5dl6mrPJisfeD
 LpFIy5qMoO/p8MI8aGe0ugOFuJ366+DyGVjVBBFlQJ+CdJ28rIRbjUWsFQMGjPSGQJ2EINqqlrD
 ooMNHBPFb4HMmo4a9rLPHVXAhsfaXWWgwAvyRdec72Dw0+iQlf1+SUXhOiRl78TuUOmcLgKr55T
 ZBN/MAu4aiFgIaWvpwWgyFwIuHwD+Zu2PsQnnSHGZ2ii9JRYQRdWfZgmgYtJTSBbpZ3/Jyn+egE
 cQhxtuAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/23/25 8:43 AM, Hongyang Zhao wrote:
> From: hongyang-rp <hongyang.zhao@thundersoft.com>
> 
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> This will add support for debug uart, usb-typec, wifi,
> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> and some voltage regulators to the board.
> 
> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>

Please fix your git config, so that it presumably matches your
name found in the sender field

Konrad

