Return-Path: <linux-arm-msm+bounces-60030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C0ACA9AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AEEC178384
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 07:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5FE1A8404;
	Mon,  2 Jun 2025 07:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hisxth/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D16ADD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847806; cv=none; b=GAhsb6g3CnwYNHJTrdjJ5uXyxBCzRpoTFlr6+tb0eJPVZQv9DOiCjZokz4OCBos1mqdhSQvmfTrrUIYz8Fq7SYiF+CzlAc5R/eFafYspSInE+STlnW98kzcIXsfqhEvu7MZg+zf4EratjDzoVlBKB1ZCom1mhUrvVz8F1NPuUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847806; c=relaxed/simple;
	bh=udG4q6F9A81L6itf3ye+DyaFKra7YAZU4N0rhbq+v4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkprrqVyEOv2FbWyMw9FETiM4nQZxN1FOSBpqYBTH4z/t2fSSxgMPcNND3/N3lFnZemHbuh1JR1Ft1h+spNutOS6zumAbxWUdxlMajczBsjsD2T3sMpmsZw0VcTk60LT9xQvl09WfmfyXo5gc/5tpPIAEKbBVHxYdyldrXewGGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hisxth/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551Lvf1X030036
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 07:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E4U4f4O5J6KAQdOygAR9hEwF
	aqUUMdFT1MiR4Ef4GQQ=; b=Hisxth/nhvXQvVSfAtxRMzWHFxqZYfbTWnpEZ7Xg
	2f9soa9a2cekPOu78CUSvKReCYn3JeIFV18hGbKQaQfhVONPnPjVXbzjXcripPv/
	EVoBvTACm/+nLL//8wI3zoPreLydCQ0u1KbDbUC7/J4Qv1SEh5NXRnzamCXxNEI2
	O8WKomH152+osUekrWRF4+IrMDOD+riBFZ+Wg57ahwBt+RKxYzxXVQDmCrJBnJbS
	6mBVevkPMG8WsYX97B65dlLS++XWCrYa2kiCSeihlz5+LlNxYvj/BdxbYeY3Cbz0
	si/yupjvkHWDmdoiKdtnjekRRRJM10FHhsl8l1WZfcwGvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsduktm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 07:03:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee988153so706930185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 00:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748847802; x=1749452602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4U4f4O5J6KAQdOygAR9hEwFaqUUMdFT1MiR4Ef4GQQ=;
        b=Wzmf95VpwNlvSAuJj+HIIjiEHKCVcVXqtRdb7SGzWG+tCxUaQugefahf/LqBKBCBpA
         5BOmvY73cMIFslHS15a/Eb9eBWKtH3avlSmQdthdKzg38yadU9X1rIky2vqOOS6bLUEW
         gk7ZvJYKqUrox9dEIVbJSBAWmB3Fq+mZADnr8fOqKezjR6bjAMplqIfG7M433kEom7cQ
         6eKf6TEWHJbzTkK3qPm8Bs20+GeXRXD76X/jmXUcvFfcZ97dfP6q3V2bODMqUxjSISIV
         a6QHc1bOAtZyqg/FTuB1+KLnuUuanyfTU0zXw4925ymqVzte8qfILMOmDUPJVU+0guuz
         I9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUeyQcqBeTm/mI9v4eBMsIh9t9fPontGmegqCSlnpcK/ObKtNhKMkOtcjL/5lb4ESv5ei9Lb3hKaOrKXtXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bPcrLScV6oSk4szsf0cEWaj31OyXRhCoM4zQoNx1nv3yMRCa
	mWAwtr4/VoKb5L5S2ev7dLAzjWZRBxfDD0uCswkgkEZdsZaMkFRnlac2xJdHgZVekDGohK2nrrG
	qUODUJQdMXv/lvnKyMDwcZzAJLrrbgyWN9Dd2aQe8WaVnS5CGrohNzbfCJdpKpN4wtvyi
X-Gm-Gg: ASbGncs12Y6TFjhktS+LChW25hCZt9eR90UzbKHiTg2S6gg62guq2fezB7XZN/jgiJN
	LFUWPgUZVDSJMXsU6pVLypre0KSyTB3sYKykD8S/BW590F7xqzwHzu4zaOavV1EYKFJXCGI79OM
	noElN4H4f/vYfASK7KqNOL1nx1UujDkMMIFUKauLpbfdpLcZfjp+NUeixPPvN3+Aglb1+eC+lRo
	YP/FiaIGgKrNTgilXgfzgd+o37JYjPGqTnnwhF7+vRK2u4Icucpz8YJKE6zDNBRcbJemBf5NrAq
	hNNoRyRsjW3jjS6+mpucYLtu/CeaXL6K34RWLyUO0oYKrL3v7Fpc5zMT6tosTutC6c3WySlEof4
	=
X-Received: by 2002:a05:620a:3954:b0:7d0:977f:87bb with SMTP id af79cd13be357-7d0a1fb84f7mr1978951785a.13.1748847802641;
        Mon, 02 Jun 2025 00:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9QNRKeZV7l3+mfqh3HvENyTNKiR7c7uxdJkAcOqOyIiQ+GwHxrARPwuZ9lJj98gEv9omoBw==
X-Received: by 2002:a05:620a:3954:b0:7d0:977f:87bb with SMTP id af79cd13be357-7d0a1fb84f7mr1978949985a.13.1748847802289;
        Mon, 02 Jun 2025 00:03:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910dedsm1471314e87.135.2025.06.02.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:03:21 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
Message-ID: <kz7rdu643iw7y2x7t2kmaewfdhzlk53hylivybw7om53dseakf@g5a64rjnup5f>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-4-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530092850.631831-4-quic_wasimn@quicinc.com>
X-Proofpoint-ORIG-GUID: 6lCwMvpJzVvfnSIbixKSn7fo9vVLHh2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1OCBTYWx0ZWRfX61+LTZZD/mRN
 6d8+MOdoLS5YkYCN4N1thu6fJksk041v+tPnZmCCpdCFSDRF7YYF6+wwWDEdXI8oXnVTYWXutaX
 NZ1kDPeqQ4fvSbMqho/tnehtjURZTNFvUzVSCYbrJsjAPlGqf4xBGuoHCYiO4mmIM12OzPphMN6
 xXy/k520hqUHzj0Bcl0dmQhFnPL3C0aFL7bsBnN4SueS8C23JpuYaVaMA0IhqXCHXnU90u6ZeBl
 /qj9kOBrUb68jMrOlQfZYBkaJ/grIYWSDzBZBSXjraaHaQwC0Oboe1cz8EjosCMM6A8mO+6PUvs
 GCu/0dMp4i7d51OmNRHo+g8y2m8Tiz+pBtJvjuDhLusee5JKBTQCDV/65ne5Bv2Xa7uBGzv/aqS
 e7vGrGXn1AW4BVZgPftrWwKteKSFSWNjO60Km1zimmjp/2UXpnH0U1yCstaEBzYLc1rTxUHy
X-Proofpoint-GUID: 6lCwMvpJzVvfnSIbixKSn7fo9vVLHh2m
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683d4cbb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=6fdEIRIoRG1b1JM1YUIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=802 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020058

On Fri, May 30, 2025 at 02:58:46PM +0530, Wasim Nazir wrote:
> QCS9075 is an IoT variant of SA8775P SOC, most notably without
> safety monitoring feature of Safety Island(SAIL) subsystem.
> Add qcs9075-som.dtsi to specifies QCS9075 based SOM having SOC,
> PMICs, Memory-map updates.
> Use this SOM for qcs9075-iq-9075-evk board.

No, you are not using the newly added SoM, you are just adding it. If
you really want to use it for the EVK board, squash this commit into the
next one.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs9075-som.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> new file mode 100644
> index 000000000000..552e40c95e06
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sa8775p.dtsi"
> +#include "iq9-reserved-memory.dtsi"
> +#include "sa8775p-pmics.dtsi"
> --
> 2.49.0
> 

-- 
With best wishes
Dmitry

