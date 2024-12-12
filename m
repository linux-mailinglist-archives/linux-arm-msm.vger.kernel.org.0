Return-Path: <linux-arm-msm+bounces-41868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AED9F0099
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74ED9285906
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEED11DEFD0;
	Thu, 12 Dec 2024 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtxJPCZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DB1DEFC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734047818; cv=none; b=fYd6h8LCSZVrTKo1SwwUbdakRvB3H6bIN7ZASGQUp78g5ZRCfnDN0RXbktKF8VQV2xaBx6lxX0rLi/yHPrtLMs5Ucc2HG7Q4wiV2qB/CWdimdQk6L5TajT3fJojv1XPmWPW5Z5OO64+hQrlHZ/dOUG3dboG8MzSuJlRGo50TEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734047818; c=relaxed/simple;
	bh=aypqBEDo7cxiaQTVJnF2pXmioUjFcR+5fj45JQdYhgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrRONvyk9Jkmx1bDFF/SKCVxBY/IjwnqM7TwOW3HsALNyVQpyLVFKpFb8XUV1wMEktRgfwjYWeRc+OTBWPO7lJgkAoOUVKRXTqJ8pWR5F0eMBPksV9G1fptPA9MCuRKbf6fxinswokgp8bJamMI8ntqgZC52o6tsA/+dJboFJLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtxJPCZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGktfj032358
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igkze4eNvMlgvzpqcEPf2X9VDFsvbmDI+1YMKHbfq4A=; b=BtxJPCZq328LwSdu
	+HOEKW+BHMKvUkpMRZu4bo0yu0dUqfHn6m5Z9hWE6GZtKgZ1YG9TnYSKfOAaJZUQ
	jQcZ/2rhDxTT12cJ55KIT0LoHjyUHcxk7cXehZbWul8+mOS6ij42bZTDKc9Hr+nz
	+PWX/kRFdMOGVbYjMsezxNB5THPdLh+28+ezZi8xOWkGjR8kqk3EjcxvofPxtq02
	OuAko0+T1AI6A4gvdh5+rmgGleg4r5wrUCKIXlMUFRkSCHj0auXsn2Cwuqlglk5j
	LOSrXQaY6YHnvb9duE5e3myaZfVgRaGC44rjrylI4Oy8RWOxMP4bMIxjztAVOa5L
	vny8Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfdskf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:56:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46792962c90so1804051cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734047815; x=1734652615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igkze4eNvMlgvzpqcEPf2X9VDFsvbmDI+1YMKHbfq4A=;
        b=Pgn6AYGq7PKgphJcTUMdebK36q5/+4irP6UIVZYpeobNI8Ez7qiSm57w91gMfNi5pm
         o8+YbA50pXubfW4oMQZJ14AswT7u2XY5tt5cL5elZFYawHJ9ytJZCx0mh0LuUOYzuUO3
         NAFVN1hSZAFw7bv6aS8VXLfuztsMzGIo3myCsu7L6tiLSRhrOwHnaoN3meb7SQE2u0jx
         /5ksgZ3Ot2pSEOCIs8VWNw0Dicid+JQO/dAYKtFyU1PZc4HHiDi8E4oQyDk0P/0TKXIz
         vvXXNtVby1lYOPCSM8ONYWaHBarcsOpVOCDHXlkPbjl8Ws60bS9cG0pN6Vxh2hdH0Yyr
         GoPg==
X-Forwarded-Encrypted: i=1; AJvYcCUT9pTrFBujqplVPaZGTdapTg6au9DBoojLnCaZHXbqWxV9yDyiFiI3ZxnkiVrFJW1HRF97sO9GAItQmD9F@vger.kernel.org
X-Gm-Message-State: AOJu0YybbzxYRQaTo9gEUpBhzM2Mkts7XN4Uss8wU33VwQ51M+5WcFcZ
	3rSnjvOQqBwxjpRry4hCZ+j346rGvqlfQj2Bed+Pvl2BdZngSQOyLHz8Bra0IWEgahS8qksyzeA
	ZR/Q4m582dDvJj2qf1Ry5mEOuj6gmQ3e0y90QAS2qOr4iQXXF1bdcUnv9NrdTDzfB
X-Gm-Gg: ASbGnctu0y37/5u4tbLqa2U74dBbDBawnPvG1uRuc10Fv6GypcYyGfdo6Oh4/cvhFtQ
	W2jklqJQ57RLivYsVp+H6HsCgELHENX9h2Vo/xWTxAeFmO/90g+KthQ6LC48D5ur/wNxSu9ed11
	Tf9nC+3+YFG0s8NXMFnl12KrdlhKqLpBndA1eQdXDdgd0LKcn/9HhHJZHF1aboxSkasOrz5oWwB
	Ot7fCWAds/6j5IFwD+MwoKNUtY9KlP7s8npqmXW0hK1xIZasOBkeCUmKBU0DaFD+1rV1jN0Mhez
	7bICrdygJPqPE+dxUgsvmKKmnVaClJf9ykaQ
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr4033651cf.6.1734047815114;
        Thu, 12 Dec 2024 15:56:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVdy+xBxzqm0XQW/NYiBLzG2Pc2PWxSKMVl5eSX5gu4+DsOJ6TJe0k3mLn1vWEbfRN0MJg9w==
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr4033481cf.6.1734047814774;
        Thu, 12 Dec 2024 15:56:54 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d00a0370sm9142689a12.6.2024.12.12.15.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 15:56:54 -0800 (PST)
Message-ID: <553d1727-18bd-4e8f-8e05-80818dc50284@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 00:56:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq5424: Add TRNG node
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
 <20241206072057.1508459-2-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206072057.1508459-2-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MWGKahd4Su7TQbL8lqoD9TRdzaparApO
X-Proofpoint-ORIG-GUID: MWGKahd4Su7TQbL8lqoD9TRdzaparApO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=764 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120173

On 6.12.2024 8:20 AM, Md Sadre Alam wrote:
> add TRNG (Truly Random Number Generator) node for ipq5424
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

