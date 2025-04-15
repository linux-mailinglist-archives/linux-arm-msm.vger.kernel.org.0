Return-Path: <linux-arm-msm+bounces-54403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97300A89B0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA853B8BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8637928F516;
	Tue, 15 Apr 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/72doMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A528F508
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714019; cv=none; b=JVvv0UKqcqa/2ln5x1WRhiF0CKJ+w2BUftnKpfHf4af1ECnQEA5/mnNN5h03fFdT+dDdJpJf3oJx3uTSnDwTExZufJDHMXWdO3ewqqqBjFGD+ssipZI2fR1bkQVr7hXujX73O+lrsI2Oj+5QVkZTh7BCUsVPZnnHPHXOxdPMq+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714019; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4bZzmBV2hjPKe4Y3KXZAp40erQTPM+yNotXywRBTDfSUwL1gzN2m6TK8b5bPzZ6ZgSrvXmQshBr9HKLe9a1wLuNvk7hlrOWlzLo+r4TnP86n4DOJkWafhQimd5Jn1qY0+XTbDK94UKwLJxh8V5Qod4MvrhPdupj2zmifxKO/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/72doMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u9vt025916
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=A/72doMhw5dzq82U
	2ES4MbhkVCE3hN6Inw5l710CFoE8jbr7gfGyUL472bJPWP4lYOicYOAsIfDcg80m
	1abPyUF9Lvfic9cyDbSsDU+42crHIjfui/NiWnpMM/pC6CXRH8m3giPaiWVvOJuk
	Y8zeynbuHq/pmkvdGB0Ucy2lK69bM8Wl+NJyXGiyPHJ46UMoNisjgrFGvxxDtiuI
	palZirP4ZNi/PXJwckW0C05qxXRWYNWLzD/QAOKe3W8VvE3iQScbNrse0Ksa2ihe
	jBwdRQnS0WKD8aFELQXpsQFC1gbMhd0yEAxiXaU9+mnixHpqxvJ9rfc7Jjimv9yT
	X/zb2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qs53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5560e0893so45740885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714016; x=1745318816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=sXTDoFqDH6eC5GWIuGVxSLDP2bWzC2l65g+SlONeaUtcxBduGVX0GU42GWZu5WESfS
         vF9T97ZW+RmN31QHuf8QIvRZgXLKOLzvUr2EJH79koctKN/lM7YpZgwJvq+rcBbYIk4b
         KRm1fx9ZUczxzAKnpYJXeebQZukGsvYuRyVZ8YbhV/HEQkyz2wUzhKYTFZSfFK7qqhBU
         DwsxsOLqTs4KdpZ12yX8pTNHrLCqmdam9YR3PgHX07z1Rzy1FcSUNQ1MtmMQncnd7vI9
         0Zwz2H/nXKZYYCG6OnEg+us8c652mBzQ0bZ4EUOouFIL6yHia2XiXjthFTSs9WISyc2T
         poJQ==
X-Gm-Message-State: AOJu0YwfsrYxDYxRreT42CH1Oh+ic03SdEDAx+ZPeLBNWR3QyRUQOrJF
	ykxERSUstd0Bw4Oij1yV0EVAUkKZQQ12+Wh/B+/5eOv2LS/qJEsFrtdxmjvV/jlxB3lsqBiunGX
	sAbVvkPrFNcZAtL3YZJKcKRpVXNiWgRCQ4C5KermzkVBITHalhvFGJOwwd+3xie/J
X-Gm-Gg: ASbGnctRtVucQ0YiYq2pLIg8YcIW5ZaSrrNO8cSjs98o4E1IOH5hTBs/stflsH7Hz9r
	w6Zgthr4o606FYv4aZ/lZcvhJ6/cjznIV/1jUPzJ5aMcNwXAj1MFagtsJ0FGEoAbeBzenA12vo2
	sDTE1q2kOMcjShLAAX6J7jhAjXkozW8p48OlprcKRwR93VZ0l/7iYljkA5BS9T6Qa5Yzt5XKdHv
	hqcbBU5N1OCI/aDjEGgeY3v52+K038ugykHs4uhgmRkEBKJJZkX9+ingRedpM7RnzOblK0QXVm7
	o8ESk5w7e+vM49sNEPxCJzP8+UJMQmyvQA3zPoKjlds2So7hs1VHYXCk8GuIkBv8qBE=
X-Received: by 2002:a05:622a:44a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4797756280bmr92375051cf.8.1744714016089;
        Tue, 15 Apr 2025 03:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESoQTOWMulfL6+0V94jpxwTqAPIz5aUejR145o/8GiMq760XIP1xvEU4cMt1IgT7sETAMorw==
X-Received: by 2002:a05:622a:44a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4797756280bmr92374901cf.8.1744714015702;
        Tue, 15 Apr 2025 03:46:55 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06a341sm6660860a12.43.2025.04.15.03.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:46:55 -0700 (PDT)
Message-ID: <556b2f51-995b-43de-a737-5750c59a3c89@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: sm8450: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-18-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-18-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0i7tX2R345O52DKavSu2eyHlt0Do8iLL
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe3920 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0i7tX2R345O52DKavSu2eyHlt0Do8iLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=630 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

