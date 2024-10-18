Return-Path: <linux-arm-msm+bounces-34832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6369A31AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED411C219D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37C047A5C;
	Fri, 18 Oct 2024 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhWo4RH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532C3FBB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729211589; cv=none; b=HxGK0I8aGNktWUcnmLwqs2QNA88yG74MGcEmWO0T55E8lxRGkoFoCkTuhrRlji0QHqs8pB09KD8hDIWOx+yGQkQvzLqdyX2iEKZ0wlY2+g3Nb1cmutSy0NlitzrY49Ke2Pif4GybqmiUlenJJyYjmcAuyIhR22ZBEUcDXpR3TF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729211589; c=relaxed/simple;
	bh=cE3xjhiiZaeaV7oJafobR9KWApU8cMk2n2Fjoanwaag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxDn3S8EeitfgDpRQlZxEUJ8oCBcKvOQKMOJT9TKfaMpeHf6trTaZ5j6ul5TDRQLnMf2Y8D0cpO1dzO0ge2VC8hpe7VaoVKT0SAjME8J8aeTw/81Jb8DTCFqLljBmVFJndi35oRUt5pPmjs6WHFsxYgOmvFMOjGD5FZ6MCZ4bC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhWo4RH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HHj6ro004780
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 00:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhWA5ZBIRh/44GpNuOcCNtLkp+17J7refo/uW82cU2M=; b=KhWo4RH7Ff/ZKJM4
	hbiU4a89jLwyn4ZxRDGBjdwN057mzmWZxeQHWzgmWOunFDOQFnam5RSXgxMYG5IT
	xVr8SO/tGLtBAP2r2XZjT4bsAHmL6mBYDGi+s13CBZ0smZkg0MUqBpoWVbbjj12s
	ZIWgloRNoZYJtksZgZlbRzvi64JPMFLMiTaae/fGENRlQ9n8JyyzmT+yE+l3y6+3
	Dch9HhUCTWz2I8W6izSpi+YbfmiuM/d2H+GrTObn5Od3ExgC72tairAvPduONjhD
	wFXTfO1/6IeqLkEuTXkWFaNkDxABBFVRHjro+p1210Adjp42i8fZpEWfoKL30nJd
	Kv5cxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5cbu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 00:33:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbf3f7273cso3090756d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 17:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729211586; x=1729816386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhWA5ZBIRh/44GpNuOcCNtLkp+17J7refo/uW82cU2M=;
        b=sreia0M4yvb29so7c331r4m3fVFuQAqBLKaaqxGYkwadfdqsbQ/a277whNYKoSg9Hg
         1aaCEVxGEQ6jBHnmFcC3+dhdcPabrVQnJA2SR8jS2JmO5TO9uvgqiwTMJgrlMPn8BRbE
         Z+FRUH3wS7cqAhpQDXSWln+HhGWODbCWv0hxE4HfedNNsxKThFdtufj38EQV59PY5xPH
         BH08xXmElFed30jGvJ7Rw51+e+JN9phyoCYYJAO3FFJMstHz9FaRHOK0seZakqfxGwhS
         VWeBBJhdARGnaqMnmbqX+lF6HcH4LouNqiXumiKriJIpK0x84Ew9OgfNT7+XivK1jWsJ
         krlA==
X-Forwarded-Encrypted: i=1; AJvYcCXC7foCQjiA0HDSNPaNYQ+2Bq/n6j6MZwQmczl4s4vc/tYLI3uQIQtYO6Huq8v0Pd/X3XMBNvbrhgc8euDy@vger.kernel.org
X-Gm-Message-State: AOJu0YxRdxtruoWqBuMsAC4nBMy3Ka+mh4EEVQPNh7rozPo7UstdHjS1
	U4hDnOD2YSemUcr6jJxbNuOK1iXQrAKrJG0XTthIrbywdo888MDRdgjC3fbgS/VJ8ew1Gzo3hIn
	i4tHCE892InZLTFifx2Ob/Te9VKM9JcypeR8hMESQQzloIHXDpJLFYXJvRAmil+rvrIBjExkb
X-Received: by 2002:ad4:5bcc:0:b0:6c3:662f:8e09 with SMTP id 6a1803df08f44-6cde1601fd3mr4324976d6.9.1729211586017;
        Thu, 17 Oct 2024 17:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuIivDn0b6wSNMmBKFBt1Bi69aZZBQA9CrJqqcY0tWSd6fueoLaV368qiR1qoOK9Kt5ZiLOg==
X-Received: by 2002:ad4:5bcc:0:b0:6c3:662f:8e09 with SMTP id 6a1803df08f44-6cde1601fd3mr4324756d6.9.1729211585676;
        Thu, 17 Oct 2024 17:33:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf6ef0sm25901166b.179.2024.10.17.17.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 17:33:05 -0700 (PDT)
Message-ID: <0db45f6e-54c0-49f4-a9bb-51f703084a3d@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 02:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1e80100: fix nvme regulator boot
 glitch
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241016145112.24785-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241016145112.24785-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TbceBLN6knv740tSG8UgzTVY4rb-fI7Y
X-Proofpoint-ORIG-GUID: TbceBLN6knv740tSG8UgzTVY4rb-fI7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=829
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180002

On 16.10.2024 4:51 PM, Johan Hovold wrote:
> The NVMe regulator has been left enabled by the boot firmware. Mark it
> as such to avoid disabling the regulator temporarily during boot.
> 
> Johan

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

