Return-Path: <linux-arm-msm+bounces-81419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F639C52971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 714084F94ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5F123EA96;
	Wed, 12 Nov 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CugzfM3G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqGMTeul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7F22541C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955503; cv=none; b=CbEc5AuZHa++lNfQ6ec2nHOy8oYTZjrX4Y7rDxpzVxVDNa7rRcfsS+RoEhFLCL1V6dH9MkDoweYFxl3OBhsTROH3ivuNSbfUDUHhZzIt5MDCtx/N8yu1EJmbJ8+09rKVQRF+xNTrA/X63L/p4lYKr7Fan1FNivHz3P8FYwVdRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955503; c=relaxed/simple;
	bh=65/ClbOI1CVgdU0S11r5SwYxThjB/AuSM0S0yIDQDsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1q04PGyiUFsh39XZMZJRQ6W+DCmzmclhlfzw3LivjCAst7ZPahKt1oO1OiwiTYsmZ5Mye91nLoFsXfOLFouRpoSB0DpNT/DXqox4RO/VgwZqYQEB7xcycVLyGkyC74OTxrETvt87ImGyqNUf0Jb/asbRN6VGsF2uZ+mOM1wevs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CugzfM3G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqGMTeul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gggn1109094
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lanilZXsOqoFoASvnE/+cQ6cv+YIockWb3Z71quJ1Y=; b=CugzfM3GfmiVKw6K
	q8PoDQ++WDDCmcWeNPEzQSj/NKZ5g70K116ixZSwPKQdlVg0SHWIZ1ZTxPKnaHoA
	26t+eCR0HH1byu0H9oeoK88ZMdXtD3cnTCgU+d69zkXEPHkbYvQvXD3lDSVR0M53
	I2MJvlP4eWV5n/ww6oPXeUY0diNGTGTpOLXjSfoomyJlel3KQIfmchxk6LfX8atf
	h5Fhp/lbyeNrVDUual2xyDn1PGSTlLuwX9DJ6jXKz5bLwH+A2FuqABns6mXfnNZI
	owzxGZy79F2eVy5uOvG5Gt83K3h0dXD+GCoWKELoF0gXfeuzqeGb3zlb3A+M/AfO
	yIMb1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum0nqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:51:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6317be8cso2680021cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762955499; x=1763560299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lanilZXsOqoFoASvnE/+cQ6cv+YIockWb3Z71quJ1Y=;
        b=MqGMTeul2wS8dn4Zmd8fsVPSjO4ChIW8vICmcxzTRqBQu6gSru80X8+2/5Cxxz7Wdy
         sl800Dpe79p8K0mfYLlknuB9h3okjfgXlPWhrt/MwW9kpRGpvPvCOJ3fFVH1hbJdP8I5
         q5G/0urwDNzYMn2G7KN/sBP0RUZXJvjM6im55qNINHVSdbTIIuPHITwj6ofEjcshGiZF
         BmtdCwmpk70UuHodgWUKNsWS0ohL9WwIQGBOt178Wx4j7Wv04lIHpnzXelz9BMvAPMb/
         dg95vfLq7aVNozXXMlbeE+Y/Al+eMIyP1jIdjg5Q9ccmSfZAtacom/L+IpBbk0mrcqyY
         TeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955499; x=1763560299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lanilZXsOqoFoASvnE/+cQ6cv+YIockWb3Z71quJ1Y=;
        b=FVsdMhRDbJUMiYCe13alJ/3ML9WNmfEBH23dVAwbhIIz1sKDSDJrTQ8iT30sBtpKEn
         v+or8GjacUwRIh7t9eeWpUnLJLmI+UlIDVQpBIXd7h1+n8g5PCw/42colQaNMHWSnejl
         0KQTU0P7LjDqji9dyBIcOvijCf48WS82B7VHHABSYh7h0tpSLnlmhDO+sLvomB1GRBIk
         Xnp00ArVPjOYtSoENTCMsaauzcD4/XOVSM0hphsS7V35zbIvrc/LDq46OwjYXuTc/9ia
         tZVcI/GJvdhDolzB+VqI0eqFyhoxIIU3bHdtIdAupR1mbUDQ+uFDHux5QObKWOPGcyNz
         HZtw==
X-Gm-Message-State: AOJu0Yx2TFa78QGbX9prCS+eznzF4H65XHLp7MsAcznkQTFDfefE7W8x
	0QWmI4T0jQVkpwdmisMi1dEfIXBzhiJBcnVUThvI3OzJB1Mj+lEuF8lBAt0r5Z5Ov/FxW59Z0Gq
	AKPzSw+XiU9CKHk5U1hUsmoGc0tVPt0d8vC4IbdODvVYS3E1CIbjX3AT0jqi8GLdcuZ/d
X-Gm-Gg: ASbGncu6tIbc6Od4SuXuWhm1x2+24ibu+/PLDv5Ru4OpWVj7RIuvNz6LOPcjUXCdnOV
	MClhN0yjmtrg+E2KBrYOuMQiH0Ljc7qu6L/dyyunr8YShtsVLS+wxkRnlmTWY/V3KhPtcuaSJV3
	jeNJCDf/EmLP0RxWddr0X59lHp0sU19XWgetml6K4DYmAC7HF61XV28x9P5WC9UiQdO7fDpF00q
	QBXpRznZ/c8wkRN9QLca3sv/rgpr4sC59BooTEKBl/dLp6hxtT94+U1dyrrZppqwXobiqX6T8nN
	jSaLYhMPj/Fy5ADkcmfcCq2rAD0wkzTHF7N3qWhVT3Xo8oeJad+wL7nVPpEDWYtOdCsnPpGDc8s
	Z3XZE1YcOp38MslJc3o0oCmxO/LHhf0aoujBfEIbhbTp1BSgCFo2wqIYl
X-Received: by 2002:a05:622a:1195:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4eddbc6b690mr27974031cf.3.1762955499032;
        Wed, 12 Nov 2025 05:51:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLERtVCAbAsBFIDkC2l2nbCe7apGB2UyAVJXf++DcUzHj3l0TPdlFo6l2euGgQ30c2D/AZrw==
X-Received: by 2002:a05:622a:1195:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4eddbc6b690mr27973771cf.3.1762955498536;
        Wed, 12 Nov 2025 05:51:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11367sm1583115866b.68.2025.11.12.05.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:51:37 -0800 (PST)
Message-ID: <f8ae7491-cae4-4e47-a1d4-344e57117e7b@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:51:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
 <20251110-qcom-sdm660-cdsp-adsp-dts-v3-1-d1f1c86e2e6d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-1-d1f1c86e2e6d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMiBTYWx0ZWRfX+EgI0UlNn8g4
 cq9hv2UwyRWhrF+Bf+ZNX8DtnlfFsUaiIzo2f9T+pWFcddaQknI/YamUq/dMmwXobQJoMbw7YCJ
 qFjLzvFQ7lNurJonQSya/XDwhj1yIfWRxQZRMoeoFWdatjmYtFTUyUM+7cxjFITtd+YgT7hvRs7
 BFeSTJaMO/HSYrJ9YEjmjGiJ92b1YZDbzyDFSQqePz9TdsjCyA3FMFBwRmtM/J/G74hXgfdD628
 h4EUV6qqEZQcWcJ1oF1DvWZ5qyyHMHynnB+nqXUw2IXmcrd2zThwTu3F/kKn2xQl7Sio0e2DBOP
 +6nxGrmel7WgPtqJYwtXMB3qlIVQesamL0ldGcHD6DSJhNU2rhEpu0/lQWNC0as3skntP0VDjuZ
 l0oWr9K2OO6jtUnHD+iszH8cH5kBdA==
X-Proofpoint-GUID: pztNrCOSWGWHQ6PTWqdZnqrp6iU3hL4O
X-Proofpoint-ORIG-GUID: pztNrCOSWGWHQ6PTWqdZnqrp6iU3hL4O
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=691490ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=7Oru3VZ2rc5tXTzVnmAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120112

On 11/10/25 7:55 PM, Nickolay Goppen wrote:
> In order to enable CDSP support for SDM660 SoC:
>  * add shared memory p2p nodes for CDSP
>  * add CDSP-specific smmu node
>  * add CDSP peripheral image loader node
> 
> Memory region for CDSP in SDM660 occupies the same spot as
> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> cdsp_region, which is also larger in size.
> 
> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> related nodes and add buffer_mem back.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

