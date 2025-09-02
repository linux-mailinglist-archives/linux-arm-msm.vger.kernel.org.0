Return-Path: <linux-arm-msm+bounces-71587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1005B3FFCA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 191F018866FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24502FF14A;
	Tue,  2 Sep 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wzt2ivyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314202E7BD5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815078; cv=none; b=VnFC3bKCZYc/IfOfjV0/wsw7de+GADxgGuL/Z/w7mwLQIYb8Q4kA2haRFUtXd+rjJrvtFQqrVjqoXSMAlbTyXV8PYd0U7CFlwy1+UfwJliX3e1fV507gntB5IaFwWkPxkvxfLeQr3trGOQkIfiKr/iT0Vo7xhgXzIGNWbRrExj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815078; c=relaxed/simple;
	bh=Q9xhz7InacewkR2sL7hxMKTtf5/Apj8ua9YctrXUMkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnPNKOJPCMJovaOrZh7HHa4K8qFvxL78hW9OZo9XNWi44hT43twKZn8t+hIjalBoW1iKTU4ViaTr24OXAg+xZ4toc0Fcupm/rvRoMoUdG3riRicalddbdNj1Ux7sD6Jm5SAylMp/HQ1dhuzjmJfaNN56Cv5j7+RKXNqO6SUFPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wzt2ivyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AU8kU030065
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=; b=Wzt2ivygiUPCUSwo
	BJAREK+B3YS73ADn7xyrkA3+Yid4oH+u/ktvtdOE2h2Aqx7mOQvkPPDlD6icrrBG
	8S9OW/8/QvXUjbtHgz39CKUw0RxZSjXRqA5DAMW9zUkdmOR4kMSEu4CQVKMcDxQL
	YNw2ENT48z1OpYcLawqx/abCCZksctaQ/99bSs7lkAqi+RDh7ajNPQ4E/st5RjgD
	RcKslF1kElgGzipF2lbQaJ5EUcMdEehlpngPrqnctql7iLR2r0oVhQF+QbHBQowl
	cD12I5MpBTvQbz0xvmgi8fcKmPSvYaqak+HBgFOtdKQwOhENbIiWtavOo1N/T5UT
	ett0MA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3hrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:11:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b307e1bef2so14332591cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815074; x=1757419874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=;
        b=vUYg19cOe3q4c4VzpvnsaAU2Zp7682c9ZSevP1QO9TqwPEJMMaP5ObHB0tNFpww71Z
         WweHPR3MRW9liJl9gFHHDMzRGn0Oc/9B7VLSLn3N6MovghGwqr5y7/4Aoqtr7eMv5WIa
         c56xxpQd7RzI3oXfeixKNTDV9LSG1KJETZDIJy2E9oUEwt/4AYVxEagVhVorGH0j9CUc
         J3umOt33sL2vr3g0aIKlbVGy/AssHPPY8T3Zc+OiRrFNjCvb1DJ9pPmEKkWIAzUukfvj
         e9e0Pgm+0SRrEaQlP/PEbzQYpsfkwLqg/MT0Wh7afHGgQQOtqusAaJTZpO9WrmK8Xg3R
         ++5Q==
X-Gm-Message-State: AOJu0YykTXXoivtA5+OD3iV6JYdGuGEU9oTTo+a3PZgiqysbixlxeLV9
	hVOD97XHYemxTujfGblJJoB+OvAOf5DPQmp+6KFgPLsGVLQsxrcyp+uOtMm7v66G0RIBCEcNFj1
	vm+/X47g7MTt/jI8ffezhl0LmCQuTlVZeBYLGaQVtvIESUO79GoTkW5UEfkpZfIUaY9YW
X-Gm-Gg: ASbGncvj4EgVMzZsd92GYKEeV0w8bxNC+62Y8izP8EoxUvuBFSniaVNepzw53H65ZW+
	Vd27f0dp1JB6W/XhNsKcNHH2Da17Q2BIJwu7MUlCeX9Vynii4mdIg29J45L8qLvmsgJ/6oQksHi
	X5+fhII9L0x0VWnL7htbrwjZehX5+XCGSwlA6LmvLcIYsbGKNR1MIleyeN0hhXvRX4gy2eLyr5b
	zEL3Ux1bYsP5KStd5p2cusAgNMelfvci1Yd/EkdoGXgCywAwZIfnFHjOLQSqWs7GPL6G70En2Hr
	gbYLU46zBZdvzRyiQEbzK9E3Q1FZaryHwJ7SytuDTh+4VcOkhtWzZdaTlI/TgrBUZRcEwkfGKJs
	qAFCcvzZYRwk/hvaEKeU+Hg==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114514481cf.5.1756815073741;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3KfpCYj++Nh+x6sT1ov8IcNZd1mz0M6lJHlQz2dAizYJPZViCf3FEA46K+1XVLTY1Q97W+A==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114513821cf.5.1756815073082;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm698003666b.29.2025.09.02.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:12 -0700 (PDT)
Message-ID: <b2838f7b-8da9-434b-83aa-fa117bdb715a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to
 use icc-clk
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6dee3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DdE-_dUAR9VioeaCo_UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yXlCIYGnohtgIE8j4vxIjUCyTLRkCwPA
X-Proofpoint-ORIG-GUID: yXlCIYGnohtgIE8j4vxIjUCyTLRkCwPA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX0vnlwSelkllt
 qI7nezZl2sh+nus7XmdQmTdQ/1x9lWK3nu3ZuxmANk8UX3q8VuoSWCGAUn/ixdUe26Xoq9Hcced
 lMJCy+oVZhFrEtTwtoLkasjuIy+TEIEF8ddjluho1cL/Ii2BGvy75qas/+ys96F4mle76KDo70e
 Sn4sgFhyMJrNciaHaonUIQgiaeVUYxuSJXP2oIUTPLCa8Sn0rklhbJwcJyoxTQBXnj191iSWppe
 p4de6ZLSZSgocShjy+nG0wI6I8h23xgGl8bPODl3Dfxm7XUx22IJdDB+ZNvNB9C7QGIRPAHUNjU
 MbXqKfHoaVdd0022Q9YNiQVcKS9gspokIFlMNBoR79bHABqHfpOYPRa1RjHvpYGtNFKEGc31m9M
 rmC32fUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 8/28/25 12:32 PM, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.
> 
> Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
> interconnect path.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

