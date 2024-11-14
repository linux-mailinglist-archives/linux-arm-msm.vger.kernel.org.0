Return-Path: <linux-arm-msm+bounces-37911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A909C8BB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 14:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 626CAB23AA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AA81FAEE5;
	Thu, 14 Nov 2024 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SM2dCkef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AE1F9EC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731589605; cv=none; b=s3dudkvbUK5JmOfQ70WXCHj167ncA1X/l4aK2JuwW4sNV3qGtoV8UgzLsyvt6xWWfZYyxwQ3ZkejIoXAAOAl8g17I7V+42lJ8NH0fkxoUU4vJF7bX4d7iI4/nw69uhrIGF8cNoqYh9SzrXAgMm5dwb+OuOfYrTKJd8nLfyJGKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731589605; c=relaxed/simple;
	bh=U0GhA3/+aWy9Xn1Tcitpj/Q/54Mwewvjxq/u/nQPg3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQeMc+1RnlyGLSD9VbHcT20lYpUam5sU6uavVQPHxX/fMvZW4+1utVxq+cEMDhZfnXFs4uySSFxu8PpcT/Q0kA/5xBxNxjjrv8QKNIpl+ZEUKk//uPkDd6JO71qbBacAjy4QL1H/h0k847tpYA0vYdmuL7g9OlW0A68xSwCLgZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SM2dCkef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE70XAD027030
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMKapcEu/BDec5OW1UblFViRGaMfwyVFJ5h9OM1dLHs=; b=SM2dCkef5e1pwVvK
	90I6ZzY1CsiUH4u3o6A6XNTiU5U9mRK6RrD2/yap1XtlussRPRfmD3xu9uE3Gu5q
	jAzIAARwYK2sonkeFVv3LpAx1iUEOoLB1cRGf18cjFESDUn7cg88JeyzkYXqSeTA
	CvKuf+FznLX+lCQX/4CCCmIvmQG5a8rW91+YMT4GjunlQlnjtDmH2Mt5b4UmqrWe
	lSyQELuVYLyPjMI8QgH421AzlrUHJbIsNpoOw/zueMkGsWADawDsjkIOpX/EQrKN
	Yr37/UAohP38R9nnTZgazhc3gtK7v9aDamdXWHJ6iZ6lysn9In0sA6VJ6iIfFILN
	BBm2rQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jups3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:06:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4609b352aa9so1334771cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 05:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731589602; x=1732194402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMKapcEu/BDec5OW1UblFViRGaMfwyVFJ5h9OM1dLHs=;
        b=jyH2fb93Y+Zb66CUL3d+QH9iWnn8y75XgQ+gnpxywmVLVo4ZkjTiqEjn1xj8PAwnbF
         AqgVHfPCcErE6SngeAMeuTiU16pUshdCU3lbHKVnBk8kBrmsNm+z07yMHmkwNIpAUOpz
         456YjBft+xusZRtVWZtiDy9YhYZVEcdMm3mu33KSOsxwnaAdfS6ZybUWzd1VvFXI66Eq
         S0xn2ojlDsGY6esxwhdfEzeEB+srs3B8xXrY6DodemkUVcMAcWliUmETVqHryaGb0VKP
         afwYtF2AGITfIVmFAlisij0LFv1ZsgxxL+eNY9bmI5atMSZtmzFRze+nIjyjoRqc/pYg
         PAYw==
X-Forwarded-Encrypted: i=1; AJvYcCUMPbbWSEUXGnfIRBxjlQhLR9EtX6/V5IXM588uYM5cutYighf3UD6aFPYPA09CyUCUlvet4s3EYS6kkgsd@vger.kernel.org
X-Gm-Message-State: AOJu0YzaApbwleQQcKtZN3B3XnIPxTbgUZ7vE15wdmZXa/lWNfTDlgcf
	Lw3P4b43oJlIQz2V4h3DX1q32JBzWcaQdTJeD72BrNxt3tC31ZAPdKVJeBLZ7OucPxxHcvwubuw
	qHZNjJzUyVtdmxL+SkUHhMEyzHgX71O39Bx61y+KH4UHtiYWklSNvb2pC7MLwkTK2
X-Received: by 2002:a05:622a:1a1e:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-46309428d16mr146342661cf.14.1731589601677;
        Thu, 14 Nov 2024 05:06:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8BOxCDzfhiRn2Gz53nrznJn+QmhXe+672DgqS/U6htSiQxQfJEIG0thXCkJW1n2w3CatbDw==
X-Received: by 2002:a05:622a:1a1e:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-46309428d16mr146342521cf.14.1731589601372;
        Thu, 14 Nov 2024 05:06:41 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df2664csm61675766b.7.2024.11.14.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:06:40 -0800 (PST)
Message-ID: <ef598219-9114-4c9b-8a57-5384ee0747d4@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:06:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin
 controller
To: Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        a39.skl@gmail.com, konrad.dybcio@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
 <20241112025306.712122-3-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112025306.712122-3-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Co2BF6vy6PHSCqiIoRpJUNo6geWcyAuR
X-Proofpoint-GUID: Co2BF6vy6PHSCqiIoRpJUNo6geWcyAuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=804
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140103

On 12.11.2024 3:53 AM, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB4210 RB2.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

