Return-Path: <linux-arm-msm+bounces-72605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0087B49450
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C2C175FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450743054ED;
	Mon,  8 Sep 2025 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtmoeSZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A52E8E12
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346872; cv=none; b=e4oHTUMK4mYeHrMt0HcPWT/VPcIIOUz1gGzUYAT4GdEL7L1WXWMuZtVuB4PI7dAVKPfjGvPPEfOl/1uEsi4HVOFL6dW3a4TBZrdLemdmb41FSuCjf9VQR7ypAECsGsatlPhYny7WEBfL708FjQiDrl3tJpqKZyOBjX4s0uDHa4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346872; c=relaxed/simple;
	bh=I98L7wVl2WaiGNwfnBzveMZ8tRbwqAhF8X/Pp9rmIF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kz+ISNtGcPdMHVAGRZTM6us9PriPDmB8EuIZKPLMfR6tuN0Qo6ACD/DjNqHbOYfzta4rE9sU4+JeOgIFAenMSGnSRCjxrFj28bnGsD6slLQ6UImny2ETMaRrL6wKZ9l8jkM+E61HrswkwmfBOSAREpmc/sW/y1oaxjA+sXogwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtmoeSZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58892tOi008905
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZVyFRJMgNXCoEzFRk37j1p5sKIJje8nIrgLumMu8yU=; b=jtmoeSZWhFE6gdOK
	qO9tzHqRQtL89IX12UOsmkbd+MG9E5yEARYlV6iWmPkcVRWbHeRi3dKGrRd+0crZ
	TOv0c7c1TPqZ4MPjsbsDAvp50RBP1QKrdzbvNhUdwVE9iSl5kh2ycVcdVjh3BShZ
	xji30gA9AQM7AqNtBzzOByEi++k7cawsNp+it+Em61eiJ316Lqh7W1QwUJfjx1Yb
	8Fx543+0sDDwxk+rIj0qmQqArO2nh5o6wxQ6N4m8wTao8cZstHUf+/iUQv/Dnqjq
	5DyGR/YYICGdt+iiTGBfUim6pN54dOMRx2suHpF17U7O/JjD8x/e48RC9UfIIzRw
	4lapwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8w5v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:54:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f92a6936so10077591cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346869; x=1757951669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZVyFRJMgNXCoEzFRk37j1p5sKIJje8nIrgLumMu8yU=;
        b=sLML22lELHbclWC+6hEYbPingK9aGpU/UaNlwoZrXhdHWGiErq3P8lAu3zn87gOpeT
         mDXqPPogzewd+3PESbsH9w1SO0/5Sa2nHgyfYfvKL+mU9EM3y2GNiPjEhD1w7m4AFA+n
         JketOMv2/ZkNBWXlJu7XCY2d//yRnzD1yDeXTsC5sAXVPj0XKFq9s6GW9vFIvK/+JmkE
         kMbOMejh+Yp32kpOQXk2RbTOlS57HVgWwqR0B5gqZNyMZYGn9XjPpJubnB27ZxPQ9K8G
         0W2LqwSe5cX+l+69Sa2HuivSAF1O4WSyFaoHsIomo70yyipU2fCU/WiV/XExZGOXy/jW
         NKWg==
X-Gm-Message-State: AOJu0YxB1S0SqjUXk4jQJSv+bQ6NWcZ38ChxYUm8kgheXIWadOkgSp5/
	n2+SvAMD4U0B2g6IKFY5ra3WZS5l1gwwN+dgV7x/5sS90Oxi2Sb1QaSAvZ/B8yGv2LxzNMnBVcd
	X+pPzjULuovE3fkN90DQTe/BsPiAuVvsuiWECoV6HL43yEbPlftNnjCqbRDLvn+YEhhfG
X-Gm-Gg: ASbGnct9cxqwnGHvOJRdraXS3KC+DwpL6vXDuJNKp3Cv5RxcxFa4cfr2ZNQkInLLY9W
	TDDevifes8lHDaGnxemh8KqpgnLhUUY0Dqf+mAoZ3GYT9bS3LzoZXMCvJZUy5fO4ZmaIyt7dSxc
	+YGOzSPhLMEA07NckTDT3ZMV/z1YpFS1lKUMJChKc3HUNGttYB1M035vHMc6dy/EQY0mFRXDK4q
	FGte37RIqu6XAdUPOQrpjWjrwu6rVWInoZduRDj5wOQy68I1QO5P019kFGRj17iBif12xVLOYql
	t5tdgd6vVdr87lwVSlaE8ecHKW7r1hYcCnih29MWZyXIVc7FpfS2nz0ihORBpJTeoOYj24G9QJf
	O2UBZ1aVh/t07Enm5rNc+6w==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64007151cf.2.1757346868476;
        Mon, 08 Sep 2025 08:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmj+R2u4FLhqzfyki/3z/8FBeF6ho/daOftyM/uI5DeD4o//Or/s9QM8aLr6Cq2JdI0BWMFw==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64006971cf.2.1757346867969;
        Mon, 08 Sep 2025 08:54:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040d44c9adsm2200245966b.9.2025.09.08.08.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:54:27 -0700 (PDT)
Message-ID: <66e99113-6a53-48da-b775-9044e4269344@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: qcs8300: Add gpr node
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <20250905192350.1223812-4-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905192350.1223812-4-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68befc35 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0KPPPQ53LOdx7guq9hsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: G-SbW28TpPnbvd_JBKr-4H_mSiuWlSWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9r5neN4qL/M6
 E6e7cspNDOItXNQiTQ4b3rxJY5HBUIUCx1xcA+kqD0iSyWZwKkTdY3Nq7bqLGPow/FP3cpf3wvq
 dAlmN35M9Jxy1d7PH5/xwk+DZunBxFtSxm76IlwNFAaUZvHhfHE2evLqIrslD/ya+kShA5Lz/cC
 ul4C5FTcu961Gblx5BU0TRuulDPDxu4RX2RB6EoIMCWCmRI8FzvKcr3TWQZYlUrKiAyOr5c9Rt0
 QQPPRGSUg9rnqGUtMMNPfmsqJscJSRK55wrN4VIOdFMWicvE7GBOO8HUlxp0PjTDvgaiua/HqMh
 Imf01mFYd+7gt9c4HBkLsGkrUxIwhLyR0mT19PVB9ACvLKBQDByNxVPIrUzlrHXuc4oHxFdYq4y
 WnTmhABs
X-Proofpoint-ORIG-GUID: G-SbW28TpPnbvd_JBKr-4H_mSiuWlSWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/5/25 9:23 PM, Umang Chheda wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add GPR(Generic Pack router) node along with

Packet*

> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

