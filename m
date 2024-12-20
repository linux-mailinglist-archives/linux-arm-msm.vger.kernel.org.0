Return-Path: <linux-arm-msm+bounces-42961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CC9F900D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DDF189848F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE181C07E6;
	Fri, 20 Dec 2024 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHlnk6EH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E501BD9C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689813; cv=none; b=plCVxZ8ICc9WuDLMgXDeelZZX7QSytV+Sz0Ctzi3WCBJUY+1TdAtycae64e1Glq583QehWxE4nIWeVKuKyyFZfjTxMPat1lmugleioZK3iE0EfPqqk9gNyKv92ZEgt4woQWSP4dF7WCFb/wgIh+yBHOJW7Ki8izijwppNXuIZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689813; c=relaxed/simple;
	bh=5R7CB7AFTdIVrbPPSKsfjLemVrbLO8eYcwPqosVDzUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+lEaw9b/OtGckhVz8i+ZVuuQRH0AGqa6vN3J39TghPA1A2mSVKOJZD+DXCN5ddChov40mxzc1s2qoAJUXsNcqLDxE95wcRzD+oLAQPINzogXkchn4K0ws6BoA1rowhYWJ6jhLzMYB7FaMgXuQS4GSOr6KEyOyY+NLqGSupX6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHlnk6EH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5fA7Y005358
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2plerijmrwjFfyc03fiI+ZOSqEAbdDcNmapb7eS9TvY=; b=IHlnk6EHMnrBcZ74
	IKAC2zADG9qYQgtXmozR0PEucoOftxMRiS9YvXMXIDmbLM4/UMAXuChrYmjqnURF
	TKT2UaBxJjHDrP/oh3PhyRNPbgd/zFJb4pt1iLe1Ij9AsZBAhLeVZxz7jKrn9fCl
	XOy5PssEaTOkYgkhwJHtaFtBoUk2JaIwx7ZvzDut3/teNLvfhvpD4WOJ4DHAdM+s
	dzIzTwtYvr+RPvc+AEeYL4J5BzTUyulRsKKaNGvquvrm0cND5UZQVyPIY8n4bIv1
	Aqyf2N7G/yWuQZu20YV4eUoyemF8abyU6/fq/swgfHpEwR9K8i+OZY0diiCXjOss
	Z452Jg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5rqvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:16:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e7016630so4069216d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689810; x=1735294610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2plerijmrwjFfyc03fiI+ZOSqEAbdDcNmapb7eS9TvY=;
        b=XT60iH5KjZYHaN8sZHx65wwX1KfThCx6m2eENz9m1MDWs3MPVy0rbKGQYdXw/xjK6S
         DP83XUstZh0JDyYw16OJPMpTh6JEawxzd1r8qruIbeoojTiXes2+zklifB8YkKzDlsbL
         ubRZVf38O3Nn0GS07Jrv3SZCvJ+bHw3eXJtnQ0/pjR/zyvX1YaPF+4tjtr5WMms+96Kt
         /prLtNpOIGRm98JRgXJ+VYjkE7cqUIylLu2taWfu/Afpg4zE5qXPNfAgjz57bAZPE8qF
         aRKUPFQtZOWoULvh6W4cXS7yS0A8WHyl1aHZo+tOtQEutb833bguGPYU0pClJNIedEDt
         tdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/YmLHg6n38Iqz28P5qX89t+fgI02pEkUSVr/ReMRjhUcFMUE/bc4a1snQiwq1x97oDd51BodPINnxsD6R@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGzZBrt+Vr/pfT5yTXnTVSVcrryLJCCb7tx6lWgYcNIcw1YIQ
	3ARzfVoISmOUR2Sh6kbcOr6DWgkaV8zb3+mPpiaAzYKtTn8gztvTWMgHDqYEnU/JSuhs5MxXhED
	kI7OutZc3JF4JeGTCdkPOFxD80RjafZ9QrNDOCW7fwgYYeXttihOup4fPlYyjEFyL
X-Gm-Gg: ASbGncufRKdxIGwU9+OaVh+EZ9qBQBQE11rAjI7mbhub2+pC2qzmd50tEyJT2/KXlxl
	EFAo59s4KpepwlsUIl66m+wjrZFS1pXP/l/v3pF7kgsJFebxNdnhIn7qV1c4tk8I1UePq2pT25H
	5aPwZMOT55vOVfEcDj/qAWb3s34/wkJRqVvxASWJN0Af4EK78hPs4TAzPeSyAgOOo/L6OgP/JRq
	UGJiqx+7ANImWPPTUDCkec0olToIe4Y+PbOy2pfWqs1bwTgf/EQRfbs7+tnavohJujixAshgZD2
	nhRRqTU8huFT/ygAyd6O5j7ZFfhgY9JIeQU=
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id d75a77b69052e-46a4a9a34c7mr15453721cf.14.1734689810021;
        Fri, 20 Dec 2024 02:16:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbTjysDU3iJ2soFkGdUfDu2M048DzuQYp6VI5Z0UlAKsD+pGIOi2Js+UX7PhFTnlIclh6ePQ==
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id d75a77b69052e-46a4a9a34c7mr15453461cf.14.1734689809515;
        Fri, 20 Dec 2024 02:16:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f11dsm1569766a12.46.2024.12.20.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:16:49 -0800 (PST)
Message-ID: <19fa7f66-ab50-4cd0-8fb7-4f126736ebc3@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: qcs8300: enable pcie0 for
 qcs8300 soc
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
        bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20241220055239.2744024-1-quic_ziyuzhan@quicinc.com>
 <20241220055239.2744024-6-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220055239.2744024-6-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F2G1WDGU8t4Slg76lNYkrhLiHHFrnOQl
X-Proofpoint-GUID: F2G1WDGU8t4Slg76lNYkrhLiHHFrnOQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=578 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200085

On 20.12.2024 6:52 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

