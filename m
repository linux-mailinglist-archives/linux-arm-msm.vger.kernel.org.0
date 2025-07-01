Return-Path: <linux-arm-msm+bounces-63194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28296AEF5B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84A967B0117
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595C4270EB2;
	Tue,  1 Jul 2025 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgbOhlfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FA26B740
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367401; cv=none; b=RpCN+W9azvVyS4pE4EXY3lYghKgdQDi0B14hnilSFNUHj5ZhYMmJtV6ny56T3Fahpmfr5RIp1DS4Vqni2Go3Yjf16HYZDCNrLCLPzEDCSIiUzxV8e50iB+iTJJq9VhXuiM5Nuq4sttHvSokn70trVz2Ad+aA2UnUNlqoo1wRNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367401; c=relaxed/simple;
	bh=AaZIOW8LFl/s3flg9giqywN4wwU5/9+iLNi1F0u5tus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE0oSidWJ8tGrAIQCHcxABJQWasKFH6K6Ob7yZtzqgc/XzLMCR8bpdddM9t5kE52oThsC1Jpv3L9g0/sE4iFaQ31WtF9wkYUkSfzvDOoGgHEm9g2u106lA3OHVlaQjqeSBxK4ZCCbGL32NezFSgQlqvTtW4tr4hJuojQgheF+7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgbOhlfF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619t071029524
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 10:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeKgcaFWYCzmdQ+v/KUY/g3rynYYApSLvY5HT0tokvM=; b=LgbOhlfFRo334foW
	RTjZZp2R1NKV6mfuHcefXeTLKUqcbjRAp3yAAWAJ3yNEdy4WPu8S6wCyoPLDxeyh
	csL2M8s1vJdKKr0uEIx4LbB00DSim+EYA8AhzQLyqvryxxXT2SaSakjWmOJZ/VjY
	wQmZplnARt3M08DLBBVWj5CtY//bfDOZ6FEjEu5JQSa++DYfRfDAw3bARdG4Toab
	4lNvMch2Xss8xi+RMTguqMDbk/WW3+AOCg5RQW9jBsPAhZE85OdvrE9BeARPJ8tU
	d3EcwBGrB0DOFMvsBfKVGscym3i05QA3ZiQ5uSdVnFS257+46CBpIaB92Nn/JJFL
	AJ+NjA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j0cp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:56:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd5e07066eso8459476d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367398; x=1751972198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeKgcaFWYCzmdQ+v/KUY/g3rynYYApSLvY5HT0tokvM=;
        b=j4VB9sbRm/HzsEwQBelwACJJW0Xk00Ygw3SIRH0Ci1uhzjefmzJVsJKQhqHj6xjK9r
         AsRIT5a1qYVDLPZcy8tH2ikWJN/zhGsYS/Ya0CtcVn7+DPyZntQ33TB1FoRDgwxZeXFs
         WVAcFa0PozwsStGHD+2ymaJlbfffp8cBHZ4GCbim4rZqrs7g2uZerCzrRat69rwI/0Wb
         0n42/OYJMgBomLmQbXixLg72/OxMKP4JZj54XdZ6XPnWquvn7QAepPaNtqmdsh5BkejC
         UaGpDZBpHevPW9DyoRfxyCH8RDPMYJqaDF75/BCRhnuH1H83oplQ0iZWEMRZTx33dGoj
         z11w==
X-Forwarded-Encrypted: i=1; AJvYcCWhhR8OaD4e0mETJTUQgUzrSz6LU93iqJD6p/RWUO8Xii3tkcgYMq9kE/AY76+ptnBspDi58OoyG+4duXPt@vger.kernel.org
X-Gm-Message-State: AOJu0YyyegQj1uRsX3s4oYvizgxmCgFSzLVMXgO7EecYqKa62MvP56Fv
	hF3VJJ7ISXyWvqmPn4ljBQmpmfxTJ8ABq+VYRs6/yQDx9TmQeKXzezU7K4fsQHih2IH3vr2FECC
	f1GCcZJ1oTKZEepV2X6dFLEHiblNKEZYX6M7BPlzFJaj+w4gSUeXsWusHS/4ZbLuwBVDk
X-Gm-Gg: ASbGnctFp+wVStWzpr+5TP75yspNPuFCcENZn8Vq9hIh8wB/jIpews2GAf4Si4xMywt
	bIpGoJ6ZXOSzj2+CnuSq2UhOFDzVDW5w135h4PWyPKg92N9n1dWod/Du3GxyeFFITpGMERj9hs7
	EY5iKbwqKEMrmMBq58iOuUxr7HLm84o1iCzZEPhxaZlvY7rLJFl9ZXdBzsg2ErW7u6J5ZNftPGo
	uTz/c3MZDnu2chDB5OhFsgPm+ennxUCwMBlTDSO8lrkkMbgEOuOCzs2YXMBx2ybFCkxmwKVEfKf
	kYL8Xaua33ZOB4m8mCtyA6yu50NS/Y009Invd740yquWe9lC+c0OMSO/ssnFv315JoOciPt+BMr
	lNsbh1dNX
X-Received: by 2002:a05:622a:199a:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a82fc19646mr16622071cf.11.1751367397386;
        Tue, 01 Jul 2025 03:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH4VxQeg0CaFvYhEgN2Q+i8n3PEWF+B4AevBlG/ryxBThRmsxoQPl8MVI0QdsxgKfm6CDLeQ==
X-Received: by 2002:a05:622a:199a:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a82fc19646mr16621861cf.11.1751367396770;
        Tue, 01 Jul 2025 03:56:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e3b49sm7398797a12.22.2025.07.01.03.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:56:36 -0700 (PDT)
Message-ID: <bb433897-f061-481b-8b35-114e9334eaf1@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:56:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] X1E HBR3 fixes
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfX7knNxcr26f+s
 5+jbAZrwIC21G+AWfoS/W9DbQlj16+pcI5uj4cpeEsL6GuLj9SHQX4y+oGV5yI3BfnmIXjNNHt3
 SvTdhHdgyLgVtto5Wav97wDsBIjfGGs/apRJ7o8dxM30WRFT/1kjxKnpLQf/ehYUpoQEqTPf5U7
 M5b1v0RuvvrpLdNqBlkgwy4BfHcKupiD26/wOtsDk6dV5/WhPjABlNCSjYqITjnJoNzOdhpXO62
 Yz41lRJCZfL5AbYeaCPVNlCqBBptlNnCsMsAi9SZggcXEfMSPs4ILEK5f78jfRSatPlJHfQp48w
 JFhFW8IfmRv72eYiJAH9xKGTgo3nW3pHAeMJ7/iEu3Y9q/ZoLKo2Y8bEFyOxvSTjDd0+KKdd7no
 PFzUQbw5e2qlf0Yo6dshNZLPDvFqR/jFELSP8wrEW6I0H8cox2kzC7Y4zwAO0+UbwFGL65ho
X-Proofpoint-ORIG-GUID: my0DFtIzxVWkK7BwHRHrcYSGrq6RqyJz
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863bee7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=92s0zTvQtuwzI3XGIlUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: my0DFtIzxVWkK7BwHRHrcYSGrq6RqyJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=680 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066



On 30-Jun-25 22:54, Aleksandrs Vinarskis wrote:
> It appears during initial series to enable HBR3 earlier this year [1]
> few devices were left out, add them.
> 
> [1] https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

