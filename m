Return-Path: <linux-arm-msm+bounces-35992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A79B1709
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97DB283B64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF441D1F5B;
	Sat, 26 Oct 2024 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJaQJPxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A01AB536
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938506; cv=none; b=kcqO7I8vRJOcxdDFmRo03G3ZXERBY6e+iuRDTbmu9QxeC9jUkSlXR5ObCaAdbUTBX8mXN0eRy2o/fBGvLdev6THRT/xCjmiCSx7PS2lm3YM7zCXG5djDm8o7JIVfrIntneEbJADnm+/SZ201qtyyhoUHAmpoIQdhT/4TwTzz2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938506; c=relaxed/simple;
	bh=kALfzrGcU5iXj6DYjhOJWkXbX3qSX2ERAzXgH71QS2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iW0Mb1lXeRyBtbu/nSARQG7vFfU3ai3lud4IUHbx19dNmkcurDftTWJ/H195jQ0NsCPxCsJyxrYmVswHas/KRzlhiHO/5aMPHFS5Oq0CN5XjaRQTBNBop3yShODmGzVm0uUtGSQsi11qJLc8JlQ/smiLGidWWGF5sojGOTZre3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJaQJPxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4NlWc015443
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHhpTVNAvX2h99znuRypavZjYZz4zIuXsquECBt1HQ0=; b=SJaQJPxqi7dni+tc
	Bc8ur1oOcmE9vPALlz19l4TmDo2eqkW99z9dV5weL8R0rugrpzjgdsjEVQVptfe8
	cZBZsUryWxlgiFeAHd2q3y0LHczyRW88B8JeP6AZmAjgd+uNDp0TZmLSRdnrnNW9
	UUV4K4devCswU4SiCu+BngRTMdinhqXnnlFmhi+Oe1Bq92pFrchaM1SttERZvZKS
	iV77SO0CMwmasssuUUDRUtyN9wXJqKGDcMlmA6AV3l3Ed9DkXxLpjjvPrNSX+NdS
	yaKX9hRmBMjeJZbtu/ERvOXzRxN8JD113j/Pgm/X5Q3/BLUquuOVsrx0x/meKlj5
	zJUB1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqgtrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so5761376d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729938502; x=1730543302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHhpTVNAvX2h99znuRypavZjYZz4zIuXsquECBt1HQ0=;
        b=jRU1q3eJcDJ4ydgpaYOFx5gYQ9wAroiUiH0lQRBt0GiShlrtUtPctv5gQef98Td+UZ
         RH4WiwXaVDR5iV3auQG0EKZBoXOmoMOgiRPRAj5+yw9GS7ptkWSqLQZEpejzz9HivkfJ
         5qha7KFdMn5xGuRSQ+cQMtM4Qc4StH7JyXwV2qKhR9v8bLt0wN+LmUWpkG3C0iGbNGv7
         5y1vHFbnbOz3veMJGPzVLKFHjUyAKepSg7IdvCCD/wr6pOB4sLhyhI8nnzEVhy2q39Ob
         KEAW94bZ3YtZVuVyE+LUPr61DKIHtpUp4n30enbw+p6Z90/pih45XNIlSavw3RQ1uqDg
         /6tw==
X-Gm-Message-State: AOJu0YzYaUel6Qetdbsr34gx5ig/dnM+P15Z1T3v2JTTo463qyLusUa8
	CT3PlGWHFkDmMFkIDCCbEiKrl6CRObK9HDfBfVu/o7eTFpJUM/AjDq1Kiqi3rIA2bdSJ0ZvX2JH
	2LqIZd0WVlVucIx6C5/vOF5pd7C5VRnTcJfdM+P2i1z8tAbU7/lKXhXNyHUoDbg+/
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id 6a1803df08f44-6d1856943c8mr17847856d6.6.1729938502455;
        Sat, 26 Oct 2024 03:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdV8oCwhXyxPOkAeJY11v3NViqh+g2YeUIWDDpR3q0fcn5ZYE4L48NCSz4/TGDH90wFb7uUA==
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id 6a1803df08f44-6d1856943c8mr17847756d6.6.1729938502204;
        Sat, 26 Oct 2024 03:28:22 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5899csm161638166b.150.2024.10.26.03.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:28:21 -0700 (PDT)
Message-ID: <d69188ea-9d70-4aac-94a3-6406a2f1560b@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce touchscreen support
To: foss@joelselvaraj.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
 <20241007-pocof1-touchscreen-support-v1-3-db31b21818c5@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-3-db31b21818c5@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _V5YvsRAw52HexzRvel4sAy1K9Wr4r8C
X-Proofpoint-GUID: _V5YvsRAw52HexzRvel4sAy1K9Wr4r8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=600 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260087

On 8.10.2024 4:59 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Enable the Focaltech FT8719 touchscreen controller used in the Poco F1
> (EBBG) panel variant.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

