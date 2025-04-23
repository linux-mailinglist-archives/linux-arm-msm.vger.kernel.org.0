Return-Path: <linux-arm-msm+bounces-55091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA7A98526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5487E1B639AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F5020CCDF;
	Wed, 23 Apr 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSEFhe8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451201F2C45
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399870; cv=none; b=P5dHizUv3tJPW4hSA5iHo0DHD9JoIAr1evfDh9KNDRlVRFUZ8v82addxzYvFnelYkzwVJp6eu3qVJ9iCvzZw3ogTwRA4NQb8DTOS1RHhjZ4NdEHFLQhXyI79MVJxHI8p/9eKuY0TjnahZgLCS+/h6KzupeWOuhBRohS5/ejL1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399870; c=relaxed/simple;
	bh=AKzrpDsMNIZcnF/wxqMPUPqqyJ/E6SssR5xz81lU+5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3dmab7gmkJz69hmaWVlowOPnwDR4aF6+ZYvBDEzFsB/aWhYdw6FUpdpZdH5093MjBNBJlTIRFcdeQy8PesuwNXY/yBcgk7YoVfTGWP7YZ/oYS7FfcNTST8FlhnN/gH19d0Qv3zAvm99/ROD2NQB2wUDK4VVrvDdEgltrxgMyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSEFhe8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iD7m016872
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6MpoGAeSY0C+bmLW41QhXHM1g3lmo5Zw3R7rjEWbbU=; b=mSEFhe8OsAnOfBQg
	kiYXwPfTWXDus43nyReBNIFp3lQdfWgRkk0t54Kty2XwtXR55QEKr0RbOY7JXagC
	w53kzmwPbp+kNt31HDuzJ51ig1OmGP8JeJb8kUDoE2HelGIo/tZcflf9xJfXR/sy
	2gQQ7r/Ojf2lH2oWPVahGGP1L5Dh65OzSU2rOd8RL+bKZMjK3WJqn7GTD3krm73B
	KYpdxlOiLpDWHbFris7LRAf4BER1yXAfacQM6tFftwsZg//IY11MbCGIBX4p7iu6
	WZl73k7HF/y99B/FdRW++EdZYUD9joLjFQn3xKeIlazX/hJr7AAjvUy0Rl19nt8K
	7qVsBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh01k63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:17:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so130671285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399867; x=1746004667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6MpoGAeSY0C+bmLW41QhXHM1g3lmo5Zw3R7rjEWbbU=;
        b=ZYY7ea6kU2QJ2NDa8sxJR5gYu2YMqnpx+9LQjQyL5U3NUymy7lDsbQnQUY/xRAPNHr
         1TIxsEVf68j5SQUC80hd4uiX4C3dd7layKtuu2Ybq693uAIO/3cenrtbycVRwc/ytVS+
         OW/yp53P6hGTHta38/NFgMJUf7CIKizwlE9AEg3BTm4zG8OnuFRe7OUbLHNeKynlrEBg
         /JsLQFHf/yBq5bfpij1K2lm88VWtNS8b6jIkd8yDyhSmB+Z6rDzf13ccamHwDDx3DGt4
         UNo9YNyhKykzO0xJlUTyM0jcuO+zP05ZEtNXeC5DuG99QPN743DvxKB/lwMIOrZHsUgm
         Cstw==
X-Forwarded-Encrypted: i=1; AJvYcCX2kb1/dPTT/H3aVquMWGnwC1E+M0dEyPnQ5k55o6fqcLcjhyIkRr34gM5xZOgWLu9SvMnI0Hlr3qegJ9Vb@vger.kernel.org
X-Gm-Message-State: AOJu0YybNym89LaOD/JKDIYvhhEbP1+6UEAv/4w4z5k0OZ29Xu0Zq86i
	1HG+9JZdeKnM2kbuVEDvv8i1IEOW0MFzX66IlUsSaqo4e7N+vVpgYMy0ij5/ylna5VpgLg9a1qq
	W77tfgFTvTJrc3a73Z9TMwaAKFY43W02yO21Az0zlQYRb+F940Gr/6r/WOSNVPbB8
X-Gm-Gg: ASbGnctIyTCtCHXXsSXYalurC2LD+NavZHLNC4KBeLLsK7TywgzJWOfCQqBKTBB0zYI
	4MOZZ0T4JAbwjrJobv7Bb0ClpMmklQbj5ZWb3zovw48wvEvSAjHY0jp/BkTg1DdA8sqI66urFs/
	remUHpLe2mREoMmcXxJSkLU9sMleQUzKhrmx00QuOhBqVmKWulkdHkTYoQOMCKZDL31959CfGyi
	sdVOsWL+qJqwRDQ0kmnvrgBk8k6Hbk46aob3ID5XL/34rwJNqFL1+JBEjwBciukLN+vnwTvVPEi
	OoODm9YRmJ+IMDKUQbi06Ylf72kAPs3q0hHB6igLoQweGzClU5/q9lG2B0VgiuRc1XY=
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr151144685a.2.1745399866838;
        Wed, 23 Apr 2025 02:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEABNHbNld/7AqWPy7sbnIT+bbxyx29iTXjmNRAVaMAKJYmmYH3k5cBsxgVQJj6KzJZiibVZA==
X-Received: by 2002:a05:620a:d8b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c94d243c53mr151142685a.2.1745399866490;
        Wed, 23 Apr 2025 02:17:46 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcfadsm782284366b.102.2025.04.23.02.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:17:46 -0700 (PDT)
Message-ID: <edd258d0-bb70-4cda-88de-7c30b3d3f5a9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MiBTYWx0ZWRfX76RRSpSnbxrW blJpUL3475EsfDVgg9xAuAR22jw+2ksfosvUpD49VjsqdZDLe0bLpq1Up86R+YKvUpaH52qPSRE jIfFSWWatXNz284hKOb38jAP8zyLdiy6P8t0lJBiYIPznOO1cQv5X0xhXW+j5Cq/e1OmKxVk12L
 K90hQrGaz6g13ucXpTazgM3kn1FctEVyq+FKaI4mCDpjtyI53qEySCi+WPYoGN3YjvXTxdwfaSy dcbrptTp9LoxArfbdwqZXZE7wUEkp0rtxhXVcPVIJbLhOR2GFg0dv7n29zjwExft59idETHLzcB 6CO30O9tXqdtFTBCKDp0/fMJnP/e/x+QUgnvdNyeTZ4CqCD6rQnQUgxr2w49q3F90kRH2hNUcbx
 TwGKLADI8PCRtKARUfR4HN9dpEjs7SvlFup7u7+MjZLgyTZ/cRVTXYtw9h3zBaGXUIavM052
X-Proofpoint-GUID: 48FiQCA9afeEpmmlxUbieYne53GAzISa
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808b03b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pZTFxwxGdYtd8Uxr34QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 48FiQCA9afeEpmmlxUbieYne53GAzISa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230062

On 4/23/25 9:30 AM, Stephan Gerhold wrote:
> Several of the Qualcomm X1* device trees upstream specify the wrong voltage
> for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
> configured with 1256000 uV instead of the 1200000 uV. Change all affected
> device trees to use the same for consistency and correctness.
> 
> In the other device trees upstream, the voltage is already correct:
>  - x1e78100-lenovo-thinkpad-t14s.dtsi
>  - x1e80100-dell-xps13-9345.dts
>  - x1e80100-microsoft-romulus.dtsi
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (6):
>       arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage

This goes to some PHYs, so it better match what it's supposed to!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

