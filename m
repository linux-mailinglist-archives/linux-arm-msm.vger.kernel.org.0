Return-Path: <linux-arm-msm+bounces-82085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C510EC63E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D225F3433AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC66832AACC;
	Mon, 17 Nov 2025 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfzT/H4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kxg8PJSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227DF32AAC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379556; cv=none; b=Cvso41olck6vDXf1wYIIvLejCOPg5CiaTd3vCB7rEiTo/tTVuILXj8t1CAaz1wS+jGkc/F1bWXPzujhDB0FBXDfXJ/hDK11oE7p7gPBS+4Fw7DN7TrV3Q93tQlnfq1cbDQ9PAF+kVWREj6GCd2b9qUwPWI2HkOFt/homq8bnivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379556; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3sP9bMJhKy8aIox3c94WgCsbiXbPkEDPQUbTZoLuDdx202pmo3Dr37pJofhk2Jbw5ahMRTmC4QH0OET49aCWwno/TVhBc1WnroS9hA6aHsGLLOCVOPHafU7ge+gz7JwECCLz81onSOTbsZY30qLcdV2HkRzyZ7Bwli86++VxgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfzT/H4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kxg8PJSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3aDH3517236
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=pfzT/H4zyy429N+d
	UrxPLiuJyCElYUsX5x56au0Gl2xgpkvctFqVP/c4ALfvjQEKEDG0c5B+u/wk0R8o
	/kXnPAQOTc8Zx41T2VevY3fcjZVRsTh67uWavTibRfBW0t8FjVqYtumlvbsLCr99
	p29k0wPyXNZ2sJTCJVXAACIIENv6xXR+q0yvXkHGqcMIf/Z6+Knxh4l6x899ItYn
	LNAps9shuTyEouW74r+qT5EUnPPd73WlHUDgqVJhpGRRkHYe09IZ7m/tzyWgQMLY
	q/tjik+N5vsm8R5J9VTp4JIVKLRD4/KCC3QGdd3HaAEWd6s8DYupsJDeLKzn3UA/
	xQ0sXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8327-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:39:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823e9c63c6so16019886d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379553; x=1763984353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=Kxg8PJSZokK55llXM/5PCTK4psS1YcsNBQGPdYJ09wiEU6xdZH6zkLGIwY5Q1LKt/7
         sXaRJtcjQeeifbXHRp5BjNWjRcaGL22RBREaLu7ARZjUyUCRf3vtkd6jIc8ebBeBgW0P
         hhQE/VSYNjdFMtr3S/SmLEEDX4J1vKrM1xI6DgqPWY0jRq9QQtEYevDYJPzjwnGIZI7T
         YXy6tBsjTEmD8azEBTsY8ynMmeZ91R4Q8UbUrt4L6yETS6CIRJRZ7RicGq2YRIhunk6s
         TxYOFlCPwLSR+HcloEbHM2qCkwIODeR0Bveyh3/T7CVLpzb+H/qJygf1It9F5ME0XDhF
         T6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379553; x=1763984353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=Xhgqdiymyh2N23xDJzSpl6rjcqErjfPJ1mUNP4Rj4XsCpOianOI0cLDr7jLyMqSimo
         K7v34io935vHfgyFbWQoFI2sKcPAeZaUp0nQ2GsdoagkQ1NmONN5OmChtMS13GV7IXNV
         4XzVwD30cIdfcqVAgO4jNiEVD+QfuJ6vGTnT0LO9dMkPxj1Nbio+WP39/YLsF5Jevkml
         ozYKddl/ocskh0wMLNPByEclhBb298m5AAD/j6N0dYCRDrrS5ZUiQSDJ+RiLp+p71aam
         dYXZwgMeWpsjTQ2S4Nn/az3Wm+i/6Sbb0ifB0x9XPa0zp/K54zQxRvD8FB9OySc27/Os
         1dqQ==
X-Gm-Message-State: AOJu0YymUCxVD32E3M0AY7XHjGhrDiYyJP8Y1+zE+kNARXQ/lkB4s3Z2
	hUiVyyTlo/p6p+AN6OtZEO/96EWoQfiJLaDxcuDSui2UIfmCFRrhpDGkyoNOTJYyalA3QbsmFAQ
	dBn8cR+zZj7TVoF1YW7qs2Ur9Whdihw57pS9di1FpB8OwlprmVFsQIF/ZSnv+bH1ItNQP
X-Gm-Gg: ASbGncvOMljO3qtntAyx0xF770XvTnrbhpS4bUxpy3Eir0RuTY0Ys03BxtO9ERz5m4U
	y0pVyeVjCpi5qe3bKjqmvAKG9Gv8LWAUQdQe4BsThecNxNd6lX8sxpjq5OyKIc2O75h2NO79gmj
	sqxW8tTXTwDbgAhGf58gcjbWIo1dLp+ctJPvEd7Ohu027E7GZm7khfeV4BMRAL4MM6IZFfnSqLb
	sBiHWkvyNgRylTj7w+l2OWo5zwCtLL8boXzlReUJwG3xYzZ7cfpGgi2FCMoCZZsMd5t9rZiS234
	Pt9+x+HNdHiImQ+sP+V8FZuLtElx93jqpDFpyVrSGv9U8mi56Ik0MA1k93IbMVKGOuv3R2FNxOH
	e9EbU6PFqCpeE/RGST5RTxtZ90vnjCBRzgCLTk2ZXKKA46fxblkeyQDP+
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee1db1b80cmr34049231cf.3.1763379553328;
        Mon, 17 Nov 2025 03:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjfxtN8ZFDAWpSDn+DOvnF3aFoad3jQxyA1ROxHtezWqleQdf5kqOkS5v+NMukAiWCq2eyOQ==
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee1db1b80cmr34049091cf.3.1763379552934;
        Mon, 17 Nov 2025 03:39:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2eesm1054637566b.68.2025.11.17.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:39:12 -0800 (PST)
Message-ID: <02549404-3f68-405c-bd33-6ace31f29f29@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:39:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] soc: qcom: ubwc: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-10-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-10-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZnC1ryRKvPFSdAhGlYiPmAY9X6CgCsFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX8BoAzTK2RbMj
 Wkj4lGjHCsJk+a73PLWvpF1Hl0ZAYpq4ReB3KzecXRWdN+qxOOaOcxO2uJUC5knYLxiEVud2rM8
 48FfwM80+EdK0XLllKF+cEgL9HqrvEcJdWmIwgZQjq/ePmqTC4VlhN5yjH6C74SOcLYG2P9yuvc
 r1T1+bc3zJKyyKPy704mZSZdf9nGP4y6KnqG1hZJgQkuQF57FYUKgYeNb7AC7fsRkNRDdjkh9hr
 WyRBnQ4zh/uPI600nU/FL6xiuNW+cIAVM8vvKEI05a5t5QjhB4doLs9feVniBYqiDowezbpRnaD
 jiOPsFyewIubxvFJQ4pgB/YoH/LMNwQWHWS9qniqtDQWQyUEc6ZOKYgQmYDFFuooLyTLx/3ZJuV
 +i3DGpo8N5fU6uN8dUm9MMLZH4YMqw==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b0962 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ZnC1ryRKvPFSdAhGlYiPmAY9X6CgCsFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

