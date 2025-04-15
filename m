Return-Path: <linux-arm-msm+bounces-54407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0CA89B1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71DB51899440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4257328F527;
	Tue, 15 Apr 2025 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDjMRYMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FBB28DF1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714083; cv=none; b=faoG1IBXU0CC5u9dds3ALjMzi00KaFHaRuhKtYh8BggMKpFea/6i8GiDov0lvo4TfDUNsK0SW8DnXJZUYaoF30z66bEqNUNbdWfZnJsAAlXdauqq/uoBpOF1HIF63Owv4Q9UFiXa8oQ2hbZ2xQoDK74HBrBAEGYU2gbAoub9ixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714083; c=relaxed/simple;
	bh=0LEnKeuoJmhEiQP1Qg6HuMLQvWZg8sLSX2wfLEdLIDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1TTtXJLDZFYzagWnlQrUzD+KIZk/l6QTiy8teoYeojuxtyvlZ8QOthtHm6gWH5Gb0obU4u8A5vHJeqoGyJjmWCKeIkHKOScIVLhbESkQHEzwi4irACAZJ3A/RcImK3Q3+UQFzqhCevc+C5zz46lJZyG5TspGsUZtxRgCprp7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDjMRYMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tTxG013341
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=; b=KDjMRYMUTZoovRaj
	xfoFjwIF7dZwALA+TOG36VZ5Avw8DXUuI3wvljwX1CiMcyDrIeXprNl1q5nBwZqK
	anscSvvyWu3lXFA5C6/PXHWoWGVnx8kIiOSUyFIOVyD04M7OGFjcsExfhEEcIJlH
	4wR82Q4lQxU2/4i0ChoLv0CWzq+Tkk+l/PULt2xAL5YFhesnOKt8piNliFEk7R5i
	1x+ReBchusqY8KMkfos9stzOeFwHzxEcaP0pEdYsGTerLhUkI7wmub0yjrC54n6O
	D1yO9XbkscKkM7Ln7T/04MUA3GAQpgPIumo2TOUHhQGXMedPgG3MEPi/S8CA4fxD
	+9q8iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fqp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:48:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so66667485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714079; x=1745318879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=;
        b=oh0jbkreBNz/nao6T4IByMdkkXLRo0Ua6s1arYz36DI6yDH9BgQU7LRF6/DyDFBrRs
         xqoWs83bXnmAlscHbrKRyjOmyFD+/iwe0FH2OqL7jbzVmP7AHKYkMRQw9LDRLVxAkkyO
         gutcpEqHxLMbGN34Lhsif8I9hL9v3xXegZdF0a4ATQCDWwz+w3SBHChCnOY6+VcTzKMz
         BP4OygH9Yyh5phGr+8W3pJWa5l/sNDMJ+CkCiZbTyKOrMhB+zTtmLBCGM/GdWKkPVG7B
         MG3lRXLCPvk5WzKmnr9BgD0YXZZGiQsVL+wkKK3CdfvRZjKaG2hunIP4mNXv/KMavJpP
         KAYQ==
X-Gm-Message-State: AOJu0YybaPCwBVuSun1DEPVKgosno+RXHMPeecJrou3dKZ8Fbbi6EZ/n
	jf4elwzjGDNktvY8mdZEdl1JZ4BGpLui+9IsG5NCz1nPuBJ+JLEG35hg3IoArK8Xciiq+lt0hTB
	hbO/iKQwrMZL0BUZgjnfvGgxeDFbZ80+GdFBTkMX2qLfIFEaXUvCPSivjGtyMuk8O+stsZg1k
X-Gm-Gg: ASbGncuEbFe5Q9SQi/pUsiO+9AZcqPfbop+B4BQAjm8nX2FO9cP6/wW56BIpTo5pnNb
	wwGLfIBNq3ybh3y1eux0ZOVHIP+XL+o7yYQcwNwv2Lrcx0BNV19TkgR1vdJh/iMAbmtUG/PTo6O
	XrlL8kO2XaNFjjXIxlH0+tW+LZjiJXrhn4ju9+VfM+9WOHPi5TwjiYioWHlsfKNZ28CFhjPmN6Z
	leVMesX3gsi0HeSG/kg1zOOOcG6SrQ53DQ4jO8WBQ2unfNno0Wza46rsXN1LqSHGaQdfl/b83eU
	+KXu1sfD6Y8fcozSXbykQ54Mi+YZTlo/sESEpX1fUEVHMe3n5Uv2GwsqDNBezablRRs=
X-Received: by 2002:a05:620a:404d:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c7af0c153fmr806651985a.2.1744714079418;
        Tue, 15 Apr 2025 03:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHuwG4dNdI2BSsFDbn0eb8qAYld3w/d/K+CHo95e+es2kHPxuJzChDv3YYN+jjEmQ1kbQJdg==
X-Received: by 2002:a05:620a:404d:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c7af0c153fmr806650685a.2.1744714079068;
        Tue, 15 Apr 2025 03:47:59 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3ef7sm1060539166b.89.2025.04.15.03.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:58 -0700 (PDT)
Message-ID: <069f3555-2321-4276-b0c6-153ec15064d0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] arm64: dts: qcom: sm6125: use correct size for VBIF
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
 <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D35RsjVWmJXTA0z_tlddto8UnDD_rdMl
X-Proofpoint-GUID: D35RsjVWmJXTA0z_tlddto8UnDD_rdMl
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3960 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=642 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150076

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Can't 100% confirm, but holds true on sister socs, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

