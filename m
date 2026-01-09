Return-Path: <linux-arm-msm+bounces-88271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA7D097C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 13:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13A8A306FCBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6E135A956;
	Fri,  9 Jan 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnOB57Ap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkMfMgrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7D2EAD10
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960616; cv=none; b=ROdtC2gcDHvxXiTpsIp49ZbROYJWSjMw7tBzhF75FkjaDwYiLWFfeXyr4HBM/DidJHPNA2C+/2x3X1ZAaT3vOMicDDdKq6Emlzm3XZSGVK4mwz51AjMJZnh2J7BvxKXASg+8+lmCRmej+ne7y65tQf42mQQBu3HzPhdVKVlLpOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960616; c=relaxed/simple;
	bh=ZZoWXRgF9gJMvbt2/h2zqIG9Vj1NvUTMAQPFvO2cW6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/L+1u02MQ7XOp7xvOYJ67sh3vzpVNCYqVMcepMMZKcPUlWnDMwTDQPorRtGPKCXxHv8Ao8HboDS81/P0Yl99KjIPzO4EyTGJ4dH/f5TbqgLatrslG53C+/eR9gIYWjwLK7QXA5VWf65Q5ggLAqnTJcV5ro2yixtCAhw77SuJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnOB57Ap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkMfMgrn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098PiP02328162
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlY7jvSrSzvid+WkgmcTx0Nn5OMdwVjnZBoKXniodvU=; b=pnOB57ApRV3fHD8e
	T2DnmnB5yLsnRFm4hGIMaum0JbLWVMxbqOhJDPOunr/f4fwMJczeNZX0sZvZ9pfi
	zEqYm5ZT9uuTUbuba+D8vR1NI2ULa2PTJeUKVVabIOZ5K835gucFN/gx4tGf2F2j
	33PLxnnvWmN3Vg0aTd5tEN1+kNStYuvo0DNq97G+8q0iY7VWP3UsP8IPKtvl0lGw
	bCu+x6fRqlZUlnQO1QmrSkRmeeCB7YB+buHa5Ilw3KEvplPtVDaF3FyLD2Hk1Qvb
	e/w7UcRxgODOOfMu7esmNZw3nivLZsozlkELVX8NPCSg4MPcxMLB9ZxietR3HB5E
	3By91g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdab8dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:10:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1044243985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767960613; x=1768565413; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlY7jvSrSzvid+WkgmcTx0Nn5OMdwVjnZBoKXniodvU=;
        b=kkMfMgrn58JkLuahNQqisWf6zYVbso0ei4+UOaVF8TzU7kiCcQVc7bF9xzU3eQI8zF
         77rpvNJ5E8Et+G47N3XMkyaRtHjV/OsI9HAQdKYtYTRlN8ggL2Ug/jnE4X+gFLUoCftl
         qOSpZx58ar4H+c94T/HhL8UqJDbNdXKwEsvtlnhWkfl+eUag+gUV2SidZhBxlVd8sUSw
         LB9mfdCUK2Y3NXsImgNKjv3haPRs9K5Wn3d8OoNpCe7yuiMZVkfDL8XMOnfzT4C7Na6i
         tBYyVIjDKEEeGrFT5WN9jPaGMCvpUhpzT1ytZMg63bh1pFADyWfvR0L2+C7vmpxiusFD
         nS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767960613; x=1768565413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlY7jvSrSzvid+WkgmcTx0Nn5OMdwVjnZBoKXniodvU=;
        b=oA2CvRdVwuQvq0hwdpyj6BqvDOMGv1xUYbmjyS4mc56D5MCpYSGAlhq/isGmskIizq
         oDrUt3+cb+ZUs1JulAhQqWQi2mIOD6l/eOONIi95GJhowX08YSRSUZd/ynmSMgMUBOby
         nbeW2jxPrr76uR/XabPR6u3UTIJsjnOu5OjORxQSyfNN99i6x7udJVCFO0J5ki7wZ7jS
         0HeUXDrL7yhU3qzM7xuX4FarNLUVTAJYRYHWjTw+/FS+va8ci7XzayJ3D4vlFBPA2J42
         Setxl5ops3SCo7+PRTLV/Qm1I2CjdzhmdLVRqqLRfQqvsMx4d2Fhd/PfWrdGHjGKT06S
         ag2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXh5eJ2W9EHSwnKZ/9BfztpdI7cgpag07p7Ft4NxK8/dvPaI+1Ab12MSIk2bbO6sN061iP/SwkovsMMqRLm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1GkHzvs3YDqhDGifALD/6X2LyMsvTsd0i3kcF6yC5UGIAme+A
	9i1oIiaAeg17j5wYh6rXYMfeaPEzKmhuVPxwooa67WgVyZHOiRqNYBSDAAYkzlqtzQxFKkCEWES
	bNrAhk+zg1P0gWQtx52B11ldl9s+RDd7bZUbFqX0JGmQecy2pWsr7o9fUuNeW/fsHchXf
X-Gm-Gg: AY/fxX6CUNp49YmuoVeBhDXpZ97DaL3/cfVaBjSaVmllm0q5cuXSZ2uraZ5CRWPxl7d
	CXRm9b0iXYyw6etQIgJGR6ppeBeqLUecdRSdv1u5w0tw2odqG1b3mym6SOEbylp15WeDuQBR7Ra
	rJxQI2awtiFpEvatH7Ak5hyJkhYRZySvGh73/ntwH3Z/PABuXhpO6lCOtW8rlYKH2zBNfBhq5Kd
	QAH7lcjzzAbxZ5JMebs3Dwk6fQoo0Drz5dbuppKODuXhKdJk7bfQT8b2M+xdqrCoCG1gr82RWiW
	+AbEsbBDp+BQ3xzkRLY/XVB5nr32/lYPio9Bhsy0wzBWHd4CIWjyNkFC0e08NJceud9siRdTmat
	xK5nuHiSWfER/qMvR52IiC8iYbmqDfvpQD+Wm93s4ow3qSt47oDg/AGOWuCPta+HxrOCfiQ8wmX
	BDoCfflf/OC2J0Z1tsEWYHbo0=
X-Received: by 2002:a05:620a:2550:b0:8a1:ca96:5d39 with SMTP id af79cd13be357-8c38940143cmr1432757885a.59.1767960613175;
        Fri, 09 Jan 2026 04:10:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuVfIu8gE+8QvjxtuSOow1WtemISlN7v0f/MewIG5yDsiHu3GFtV47MZwqGMh8+u074Z+Wtw==
X-Received: by 2002:a05:620a:2550:b0:8a1:ca96:5d39 with SMTP id af79cd13be357-8c38940143cmr1432753585a.59.1767960612685;
        Fri, 09 Jan 2026 04:10:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8f146bsm22596801fa.36.2026.01.09.04.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:10:11 -0800 (PST)
Date: Fri, 9 Jan 2026 14:10:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Message-ID: <wkv4sl6hsv3dvqteh5ccliet46l7br5yzsgg27qsopgnldufly@r5vkvk4dyrn3>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-3-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109080000.606603-3-yijie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960f025 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PhgHo22kut4TJJxNvVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wwmNXfx2uyy39fR5RFZAcvI22_eIpEWQ
X-Proofpoint-GUID: wwmNXfx2uyy39fR5RFZAcvI22_eIpEWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4OSBTYWx0ZWRfX7kSTBeZgpJG4
 iOn/AEb9OImOb1jpt4McshCsP4Oo8lko8r6FvGLrtO0W1mZF4wJA1J5q5xRL+xMryd6gP72kTOG
 65FT/A7blsrlh8CYXNwzryu4/c9nzKmH6MCIF6PHFl0KkXpox58p1u7bUIYXnz+t5Ao/tqAMJcT
 LzLMv4Wn3ri0dqbaFlZuRdHK9sXjdBaNEW9EAqUTEDchn/l6YUpGYxGBAYXK3Evt/BwL4V5acde
 ZXjeYjlaeT6oEuAsuFBfzpcDpQFRkr2a8yKuTbjJYXnwQCiapEJ0rEvmQR4HY+zTZAPdmBU9ZkA
 CZyFPuJ14ouJN0/SwNpKDekElmVVElkbaORyX00p1NIaRVADGEhcSo+QqFmBhb9rJupkuNl7VQy
 mTNyp+UiuHD576htb5SqYVrNugdLhciNBfLehny4fGkMdbFFwS7be8UwH8/G4BiaiTxb9rllZL4
 0QnYSeYY1YxvhXk3yxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090089

On Fri, Jan 09, 2026 at 03:59:53PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1p42100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> Make the following peripherals on the SOM enabled:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - Graphic
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  .../dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> similarity index 99%
> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> index 4a69852e9176..16f11a81163e 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi

I remember, we were told that there are PMIC differences too. Where are
they handled?

> @@ -3,7 +3,7 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> -#include "hamoa.dtsi"
> +#include "purwa.dtsi"
>  #include "hamoa-pmics.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-- 
With best wishes
Dmitry

