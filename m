Return-Path: <linux-arm-msm+bounces-48975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14806A3FEFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEDC2422A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729BC2512C3;
	Fri, 21 Feb 2025 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBEIv2Nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E924CEEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163359; cv=none; b=WrE521Miggr7sqtnRHKsRtYLM74DQN88KwMOI6zPiJfex1b9FCTcP5WCEx6xb1Ic067LzGgRil/yWFwudX9wocShawX73IYtukn48AeJmkEjpdJt7zy+uCdjr5MNFHIc+eZ4f+/1rEqy3axukYD8wiSyi4AJDf697bGASoMUa3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163359; c=relaxed/simple;
	bh=ml87yc+oEQwidI90pZpvSRbXJ38fJSHzzmwQu1zkdq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Guqc50nUf/Xj3SIE3gR6+ii6TFNN2wim6UbZKDRo6qW0Fe0DUEyuokB3RVSiKRwgGr6fLLPGz+Xs4ouB63nnxR7gJn6D2F1Jf5P6eDbRC79/8d2ReUZxCBfD7kR8nRsh5MypSNzgumFpa+QO0ICBPuUMdKlGKHl4mKHB+Q08/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBEIv2Nd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDIlSa012548
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfqC/9ybbk2kbQEzusiSVYCA4Lqx83IJ7N4o2KXaKQc=; b=DBEIv2Nd7LoqOWSb
	WDBbXwDAl5HI6A+g120w+fQ0fPM3BOvBD04rbneYLB1Wxyr2r3dEKNE8+VMD8zjf
	liBaeoj/i6mHS8eP9X2LSUavhmN3NoIInM0k4MYYRvrHSpu8jv12lQTzIVDAD81k
	uqtOxPThKYxdUirJMHA6dXQOPJTdLQFRl20NXDfWwthXAGqdpECDVmPxR3I914Lt
	GDoEHQWj25UJokVOK2ZFDHRKCUnsH6gOAs5/2hfrQqsrZfxFmdKE//RE8rHH6Tca
	TwORWg/B0HxGZMngA3f95leKSYwomAPk4KUxuwODrnjn+R93rfuQL84qQwGbsyZE
	mUN3qA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1u0h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471fe623430so3588911cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740163355; x=1740768155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfqC/9ybbk2kbQEzusiSVYCA4Lqx83IJ7N4o2KXaKQc=;
        b=xM9jLhsu2maroCSVhXNCFunEHFgd5j+TnFGDKWfJKjfmnsi6fX5WjLyVDbbmOfCXYo
         jdzxxkTBQzF6Dv7r5L3pxgXa2Idpll1nGUu3s6xolxGgks8eoS+qoVLC/NgccyJcMIEg
         eXV78mmGMXM5NqANfKvpP+pPdHbttCmh+LQLv/hdQasfivUOqz90wlK2NSjV7aSl/rSe
         5GYq1Dt+paBSLqvXlXabfYHGT4Z1PGsxLgNYG+gbz1xPHTtqP2/nUFkwohT5G2+OK2oG
         MFqJm4pgQuBgIdUo90ycobE97SwENhjNODeW81GLZ1mnm8EUvVJ5VTHsCGXrfo3e3iDn
         4/RQ==
X-Gm-Message-State: AOJu0YxOOiz6lTRNKP0rqjNLHW45Z3GhRsuqjOzDHIgmVjqySlXIs2iv
	wCXHq6EYnclqYA6cQCmYNTLgHGyxrWhsFI0cjR9+TxDmNEw1TtW4ZuornfwD8cGZFJqs8Pki8dd
	E7FUIVlpQnGIjhpVJEn7SXcm+e6HPUm0ya1QcbdR3m7+LEL1kALoAAWyJnYCdfg+BzVaXSuPd
X-Gm-Gg: ASbGncuuwtv0Lb7hJLuHb/vdzHDfH6qoA18iOdxSF8t4KNHHtBfDAJh4OmJq8jgpT8/
	CWiXWovHLyN44olTQ1NJ7+D8rL3uNnVBlpBtAkLSJSQ3RarYKqT/goXATFZRuRUs+UOImmWFuyJ
	UbvlOHLNg0Lbr7jlfNOQGTipAD9ZyjlcB02XMULpLEaOahL4ISjOzMVnxKYW1pcyNr2GlP4GBXy
	2IAGDo6764RLNHeXZkQQ5FH2BMIJNqMCHnzOJOAzw87gCBGwqaqYqUuxmBNcMUaOwVB/D9SGaXU
	+tqJPH1UXnk11eAoXUUrhQElHB6eb//pTQqAQFn60DOHsJ9X6kr5ShfXNJwMR0lYHG7Rdg==
X-Received: by 2002:ac8:7fc6:0:b0:472:c7f:a978 with SMTP id d75a77b69052e-472229762c7mr18987261cf.12.1740163355478;
        Fri, 21 Feb 2025 10:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa9JkzhhxrAEDrtNExVlkWqPFhGS/srsaa8aG/dA/r1UYKvzuNzF1vzSoqXYWzINp8gvyN2Q==
X-Received: by 2002:ac8:7fc6:0:b0:472:c7f:a978 with SMTP id d75a77b69052e-472229762c7mr18986461cf.12.1740163353654;
        Fri, 21 Feb 2025 10:42:33 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7c76b0cfsm1244422966b.28.2025.02.21.10.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:42:33 -0800 (PST)
Message-ID: <b30d046b-1221-46e4-8535-40d06b9e379f@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 19:42:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: sm8750: Add Modem / MPSS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
 <20250221-b4-sm8750-modem-v3-1-462dae7303c7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221-b4-sm8750-modem-v3-1-462dae7303c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dfEZj6v-wrMfWylsFa1SRpAvSgKQEmJp
X-Proofpoint-ORIG-GUID: dfEZj6v-wrMfWylsFa1SRpAvSgKQEmJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=783 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210129

On 21.02.2025 5:33 PM, Krzysztof Kozlowski wrote:
> Add nodes for the MPSS and its SMP2P.  These are compatible with earlier
> SM8650 with difference in lack of fifth memory region for Qlink Logging.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

