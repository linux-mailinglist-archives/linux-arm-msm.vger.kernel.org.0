Return-Path: <linux-arm-msm+bounces-62484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB9AE8669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECB26A194A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9769F17B425;
	Wed, 25 Jun 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gvz0OY/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDF266EEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861520; cv=none; b=G3YtHwmi71jG6gY0nSmnEfJrPy4VV3x45YARtk1Fd5/kqO9XaoswskxYxwOQNDbIp0h+cJzZ2aorxuxYjzp0b97wdVHeG+jKOSq2LMlz62PUu3POLrCLICjhm9oCet0NpEaEYJNJ6A41ONVShVWVCjwtJmwq1/yXCQD8L7Z/xzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861520; c=relaxed/simple;
	bh=SMDUPPCgoy4irnfRcvFwYNWDljy6PoXj9dVonnDd2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK9BWulnKoPC3rusA+mrW1qbXovh6clEkjCVOVn2cNuNHEw0Nq/RjP05l4ng1FY9sQS4+kzFTyi5pWRUcB1FeLRO4PjePN8MKIXMlqSEyhPb5YNpIeGsE1Mlf3K8sdVvD32rjwGRsxpwTe5QkJ5G5K3paZI8i5YPis5I1qLJMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gvz0OY/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9ca6O032292
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/9WVv1gsWDZO+apIRm8Vr06
	XSYUUadHkZ0D69bY6lU=; b=Gvz0OY/N0xL/7O+DlYt7P2YEtVRVSdbfx0RBJSjx
	17Ohq2EXTTAvcWyu38mbExIYiktaU1ZTWT5uDeA5D5Uwosi67mre6F6PpCKIJvyE
	K6yk0Sj9JZv4gEU8o13YHSETc1uiDrL5j6Z8EIwuXVDR7lfnkbdKp8fH2KqMZEB4
	04DQI43IrYPyzb4nqrY2jGjxX6ptgYUxhggfpbTa3lb/GPZhLrYllrKL51i8umk6
	iZo34Db3ZpycjeMaZczcVDPrMMi2wJNMvfVjPygBePBwoQVHYXLZO4S3csBr36y+
	rjMtd5FvLdYzR8YMGnzUO/mL2VL6IyEWkEO/sUwX7B0VUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xrk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d400a4d4f2so308526785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861505; x=1751466305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/9WVv1gsWDZO+apIRm8Vr06XSYUUadHkZ0D69bY6lU=;
        b=blxudtWDN2uzJzFDpHD9gU3dVnUtcvNXspoZcHebX1fEppdWQt1k7XMn9SRmsGzHmx
         KFdN025GH3GaWMXYtYHxfnDUQqeGFa1FgcPdAFm715VRhIWJHOnHpsygE5HVDRuq50gq
         PBm/zEPUKqA7FhAVRrOWg7oJybSjs/b6S2x9Oean6SHlEtdB4cBv6hMIGg5h/F91/kQG
         b/OB6h2DAT8Q9sJfKOljaFfIUeaIgcqOjO4e8qVPi614yaETpavrxbPaD71ITzO1XFSy
         3idOHzGmrLpTkYuRdRqvpXcdn9n4DL2uuT77a6j3p0PC8fYxmCr/Za2e6MlRd0JHiBOL
         cHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKU0Cxt6jzfuYGNlwqbQqUs0xbZqhcrNHhp9zJAkF28dLp4kedXlhriFfCaOMVlY9qgEVZl5E7ISpK+1W0@vger.kernel.org
X-Gm-Message-State: AOJu0YxQp5An4n2KE6D9XZr2L4P0VWCmiBce3r5B+MfGPBO/6f8fkAWo
	hWuLQP+SYTkeDcay78i4MWVvHJSikrrudbFBoiwWitqOWeS1SEjQysbrOL/Xwl6Pb6fOWtV8qNQ
	gR4DbOJ5c1dq2OssamQjJgxXIHwU9ipAIr7NyL4+hKaVgX4Br3BjYEQRCUZyfoFEl9kOA
X-Gm-Gg: ASbGncsOWhMVBmofTyJ6EsbzEpELQqrppcpBFrc0sKtZsFIjjleyzc8dHbQNpsdBN1k
	EOsIEmpHE/wZKjUxVBaQM2+ECst8fbYohZR4jPoK6VFq4ArSCuZQymhNXUESc1tpz9z3wjIikYx
	D/az+dEs11zIRK5NSMM3ssmJRuZkNFXesX26skUhH3gn/wkiLQuuurHZvOb9cxSjWBDWCsU37xi
	w610Cd1nizja7/Zec+pjxFcDGljY/jarMRQxvnKwVNUaY7oOagk3e/sY8HOwzPqY0vNdXvE/7xH
	MHsktIHQ1VI8kGoqLbCakzaGB6LLzOgAtqMH7ejy9Un9bLJYEH8Blv/LPDfj+tBpafRPRWFqVPl
	FdJZHq7O4d1M5qiGwGkD0Wj84I/cXPQY+B8M=
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390999485a.12.1750861505070;
        Wed, 25 Jun 2025 07:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEgmUYzG5q66jyh65Mm7bfSX8TgdMQuftg7DpsTSuzDtL/tJHOo29ywzX65LlAhePFJPlSw==
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390992985a.12.1750861504345;
        Wed, 25 Jun 2025 07:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f10desm18964771fa.111.2025.06.25.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:25:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:25:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c06cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ACp3OnxLZ-M-vqTyPYQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: qPP3gpx6Dd6B79YEmNsPW9fVlJzAg2F3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNSBTYWx0ZWRfX+PLu/vOOsLSk
 2Oq3aocdVxeqVKgeM0+w6mXat+o6TA6OQX35KdefDW0E97vByyKuv8xa7B953jBlDRR0gOSed/X
 BDty65HcGIjkHxDJeai3P+JrS7UNEI1ZpW+gCKVvJyuvyW6qtvFl3wB3ETmMVw63Tiy5m4SYcEY
 ufflquEZ2NtYjk+P+Q3Bf+/PX3w1bTdrrs+b+6zWx5fX0D3LSucWSuaQFpV3g7dKH7d1ZleawgC
 yV5IWauxeVD9Kis9xtFoaqmX9U2DOwfd0D73uozZisjrFEMbK5GCbsydVek3GrSa1hOMoYBcEKS
 wkjGzOoZBx+HrGLHrESc46A71vZOHKdU/Ch2cCGVjo1GE2XqjgF3lHOPeVRiZif8D0xuadTjc+0
 3xZKlGJTvpnPTlbGuSa9BlFBHaF2869fXDwk44Mfa1lia167m7f8f204FBAWMyYMwKZTy05i
X-Proofpoint-ORIG-GUID: qPP3gpx6Dd6B79YEmNsPW9fVlJzAg2F3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=887
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250105

On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> and the devicetree description for it.


Please use PM7550 instead.

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>       arm64: dts: qcom: Add PMXR2230 PMIC
> 
>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

