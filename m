Return-Path: <linux-arm-msm+bounces-78394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909EBFD90C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6EE23AB207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCD127A123;
	Wed, 22 Oct 2025 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVWQCw0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB2528489B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153581; cv=none; b=XHToprccMd6ceMciG/oBdX7sxsqnfiiTuItO76mjQEjjzhXPyari7qkrmGTkvq+UxqMvBE5QmSM8CMGJn29jm6+1EXg/YkvWcdNLKjE1EY2XVJ7QWF/CpgD9IMAv039xaNEkuysc6F/2i7902c6jOIt9Hkl4aooXQl/rgJV+HIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153581; c=relaxed/simple;
	bh=gOQwJElKrLlL+KczaQjBEU0WOC+y5P4gVQMiGU5ncQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVT14/MnaOkyT8H1dS70npvoQPNUdzkw5fmZvYdVQj740WaY3Ldwyd5yjVEToHc9b2cUZCUugonqOm+1VkpF5tpOzXiNBUPpywoUxQZ0YynsBIAZpUMDK8ZUgurG7iYv+S7gr3oPMz+Y8ZhtDn8lv78eK2z0ZjjH5vD2FC5OvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVWQCw0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB0JBV004439
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ObhDx2qKilPXrpU/ecszP1sikcNLUfUe5WUKxrKas0=; b=EVWQCw0r6O7WujXl
	Q7FsvceaN/p+YMzjCUZ4WD3SMhwUnWNjLavMDJ3l1HEdHNImw46Lpo7YhZKWXwiK
	Lu82CGQH94Jqkjr7o/2FhaU6kNo2EoZHdxgW/bBNdHUaTlTX2U5Vpiodr5iYZs2q
	EXPAXYvoOek5eCLpZRicIbRByJEvSGhdCyUSfBT406E1TG/oQOGRH6wwiRiR874j
	5njdBEGx2LmXDej1Tw/mpNx8s9fA2px2uPk4uh5RiAe+B94TU8W2RxsxMJwdokkx
	JtAiH1W7GYHoi2W/g3qz4lPTdvoUHyTkb7o0ATLTSKQ0pIpKO1oIHBTizVYyiMGL
	0SjH8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfnfva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:19:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8934ae68aso5841791cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153577; x=1761758377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ObhDx2qKilPXrpU/ecszP1sikcNLUfUe5WUKxrKas0=;
        b=p4Ufb75X6uzJggTUy+qIfklfo1XspMEMWK4aWEFwxzPT3yXxWmIzoy33MoAjSzss0R
         ISDg6Kzy2gxURLlDyJHT7WznW9MuL6n+CQ0QZylkVh6sCNVibdumgYxHSzF9sLCOrKIB
         M1my3qLXbOphbWV+t4bn7KK06xMUQ5Eua4nXvc1l2AauVIVY7xEWH06Ujq4ECI3wAZN3
         AgUhI8lenDvNew8+TlETDPdam4A8qTcxvalGitZgAo5dhM72Tvv5ay+9l8G+smWxhwdm
         gnFhvIwnN/wr/0hOtUEqo93beD9j9r1zBU7Pie8WjhP/nIra9Sq60D5JX8cdFKjSobyp
         tpIg==
X-Gm-Message-State: AOJu0YzvS0noTfE+2M/9ExEWWg/bulYI83tE45//K9R0InV6aLntPJ+b
	nNaQzH2vLqazMqT0AJHXT8cAspo4LceVUbWpn9UJRzqOebTYRsgBBjXUYj5bKXYkgcDQrHG1e5j
	l9JixFu75nTssDg+uHySAnGpWAMUww58EXEelBhmBRV2fnwzbu2nX/6f4yRJZR6ZyOMhI
X-Gm-Gg: ASbGnctpOloBgV+vCNA524fGjhGONbu36EahHm+Xl85nzeZ55AisSekpevMxjaXwnzo
	mDJ6OqrJ9rEclGrZ2X2jnHdRQv49CDprtuRpyES903pNol6mTlxGgCDgaqUf2xyJu9vkAhFjAhA
	zN6/7PVTR43oCY3i16MbEHyJYqwn0gYqlJP8oJ6fPHFn2ykisx/TOGQVzU8IM4iqBNuwkt34sqm
	driOh5ZmQCoGpj2ynEbL0Bat5uaXRI4A+QD68GHz1Zwn0VO7ZFBLs59+tmYu4m9fKAvCxczj/tA
	pUDSxVkUnZ4DJfE+9mbg9JSmaVXH6H9laLBmcibL1+fSzheSXPDBUserA+8GUXcl9kvAmZqUTLz
	2oy74sdnnG9EPlV/FsdQ/XLRS8IEj0WuZKQZqMfmydxqSTwKWU5r4FGls
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr132575311cf.10.1761153577564;
        Wed, 22 Oct 2025 10:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1reHXf9fw3+r5fcINDoVpcwTbqNCUu/7wsWRAFjR33coa1mmho1pVdqG0TLpKriqCc6KFvQ==
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr132575051cf.10.1761153577093;
        Wed, 22 Oct 2025 10:19:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebe4a5ecsm1389504466b.81.2025.10.22.10.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:19:36 -0700 (PDT)
Message-ID: <32702920-19d6-45dc-bf1e-8a90b1b8c9d3@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:19:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs615: add ufs and emmc inline
 crypto engine nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
 <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-4-2a34d8d03c72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-4-2a34d8d03c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1tjZHJLUQBM33kpNuge7WvDTHLxnYkWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXw9FPdbtIPTQn
 2/OHfyAmCOakkhcdB6W/xLmYyv++mMzXW3t1Kb7d4KNIhRLGKRHL0eof0oXvPMvpqFI7FEaieeo
 RwD7gOXApDn3alDMzMzkjzI/v2kGrh3h9v5P3p3ZEShe73t1Cj5Qe//HenCGyVej5O8o30Z/9X2
 rUXbdX7Xm8flUzxfXjgvdmkj95KlhvGZmTHG2Rw63fea0XjiEit2HNN15B9uZYiy4Eh5FXbB7vJ
 /z3pU6oIBj1f1I6+qVGlDZD3fW3/IDs+h9k9GE4Paky5H0Rzq99OGOfebqLr+ML9eBOcz+pjNYG
 zfcs5j3jR2CXLVrr5VFXpNAsZY4HW4SfWQn4uo8fjTo+9ndswHjG0rwRNCoDV5O1q/71dUhIhME
 g2HIVjSMeNORUDuwvfC08jdFJj1qZw==
X-Proofpoint-GUID: 1tjZHJLUQBM33kpNuge7WvDTHLxnYkWI
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f9122a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FCLlhkshBCn6XtExdV0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/9/25 8:18 AM, Abhinaba Rakshit wrote:
> Add separate ICE nodes for eMMC and UFS for QCS615 platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

The commit message lacks a problem statement

Konrad

