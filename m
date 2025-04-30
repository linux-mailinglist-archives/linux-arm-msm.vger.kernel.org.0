Return-Path: <linux-arm-msm+bounces-56308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566ADAA519B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E573A5CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAF5288DA;
	Wed, 30 Apr 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ampATIP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45D262811
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030347; cv=none; b=kaDlMYFCoQO0UsJjNDg2JjOUMLssyfUE1LKBaTBS8Zc6CY3z+5pST/ZlhI2xPZ9igANFJvlfQBW/i3gxbI6a6I50RuGLxqp9CUrERMmmZrDlieZfjpDc0xONDLxsPWU/LiRldFxbpiQ/UtB45ypJHh7GWK2o7Oo/gHeiAwGtTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030347; c=relaxed/simple;
	bh=jQSNGpxbiy5IVl/2fB8ymxWQr7NtfPmh/ce2dT7Ir1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpZPTpxU2QzRYenjF8mMxDNEIoayUX8dWKN7MY5TVLzeAGGB/NnGQJgOcX6pthiN5QRuI/3q8Go1h3zF+j+7lBqpEGa/5FVyAF5UKtneCRkqU1RpJHMtuxQEQWrC9Wxh2l5HxPmMbbe9v3hIKLoRIfTi1kBpxuxDWRxl0xyDWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ampATIP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9PIfq010516
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=; b=ampATIP5DmHRxSg4
	iPiUpHLI5jzJ7/fxepbhbJZcUsMEd6i0GwAfIXQZluBqewvvfU9RM7xeKlcEes1G
	8hXP1aRm15zFAG0c93TFyfxq7g+UKgfR0yz3zgSmFMLpVfscFDFBxHkauEHOsiYp
	Pt70VYRSsdHJ2yqrjBjSb9WTrvxWOOxnlqZQIazV1yEz4B+TnsYWZUbkFQqpeXA/
	H91sOG7BC9t3RVPbEUfkqbbSCS/Bry8mbjnzRV+g6ZAR6Z0Nf8DrnBYrU3qZLSeO
	xjIrLVC8HRXDEQe0CTNNRMMS/YZjrVn0TGgW7znvyqrGA/9ooDHUe42+W434pSgf
	Cy8qLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uatt91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:25:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecf6a05e9dso127236d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030326; x=1746635126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=;
        b=pQGeo1e/t380hqEJfYuMiq5RLF2thWho/no8S05OXVqX5SCDZOZfNR9iTgT6QV2c1w
         n73pK6+H9U9ax63oE7PVS2f5/0K0GXa7J+WkUoIylWBw2oqmhjF2k+Nlvq+vEorJTtpl
         hScQomlIHA7NbVGFe5ulAl56mlUHDTbHgTVX2RUpwo43xzymIH15qyvAvVCezMKZMGae
         a2QQNcoiZvFMo2DtABFoDHUNSW6Y5rkd464L6JhV/3KlopR++QXyDcsRRH71nCq+4GTF
         uzRZkzJx7Fur/wreqKoSocOq/hhiVvDL868lkBTSSNeaZF9Mi+PecPu3z8D21ahcvPn+
         OnkA==
X-Forwarded-Encrypted: i=1; AJvYcCVhHYoIdy167uW3X+0WToErRnb1ZLpfUFCfvrOAhWOFU/U9+BMhWjG5piLM1FEmaH3PASef6TSbLaxqI+Oi@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRlScXden8eY0MDcbdsvufnxfKjfOpZoONdhko61gElf1mr7M
	NTyn+j8HVCo8Sg7KOqzH8h4tBL6K1+8rhRIfzsh+oh8G/KFc5QwqYXmA0LwkP0RiMEqh+Gx9FYt
	r9WOlnEep9GaTRDntpnvTrkYnv6RcWnfML/QkytJSfdJB8q7smPyo9PTqhtr/O6K7
X-Gm-Gg: ASbGncuJkkZ/5Ls2Y1MdRY5WeJaTtNHg/YICyCkPIRkfB40ntuHxBT94FjfFa56GOIB
	a1/Cx3xW4TnbaFh3EXaZRJv3iWaq4/NC6moixsMbFQnnO4r2riPEKhuAh/7A2dHukuW2W9jZlto
	b2rS0eWLRWzYfRKc7rwAkkXpr8XvBg6nDs23BTBIErYtk690oNh+npIHMdg8CbZQa888ck79eSR
	OKvX7LkOkERPf9P+g/O9aWAHyt51Rnxy+BNj7PQNX4cN73y0s5ABCY30DKA4J4md1aCMx2x8KYW
	/GoxYpQGsJdqhBkBPK/v2+y3Og8ouVZ93h45BAFtQeG/ttDjKCzwQnEeaXJoClmUDhg=
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f4ff2d2924mr18869806d6.1.1746030326565;
        Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxD7HkUdqpnN+OfcCIzsrbn5QNU9jNDG0l1/EVlSKXcQll60BAsotjGUkxYzwFZKHAhPp+vQ==
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f4ff2d2924mr18869466d6.1.1746030326152;
        Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354633asm8799526a12.55.2025.04.30.09.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:25:25 -0700 (PDT)
Message-ID: <ee44260b-13cb-4901-a073-2b9bfac2a794@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 18:25:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-1-954ff66061cf@oss.qualcomm.com>
 <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: taOi47mhlEdjBE_7dkMwL7Yd9m9FHau8
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68124f08 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=h3lbVRRyGfeKgUivn1YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: taOi47mhlEdjBE_7dkMwL7Yd9m9FHau8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExOCBTYWx0ZWRfX8LD+3wbvkGBM KbUCYAJqkGkq63oFxVOGA2OWM19s5S1MZO9/0gsqdMUt5ob2VLX1fbCDqRrFWAlZ6tYqmxCNSFC Sqk+0U6q+yHgVwQJM9AIhhOaSzouFkguNiFxv3NC8vhg9jNC01mY8/+UuSWI94ZqWoTabwd5xHz
 4fQ8UoIMOVwrhyP5egit+vOcf519wSrdCsxeIP6lFA3xG5DpOe9palM/8GVpJ4I8n8WKKGBzchr OXGTykYNHCs9J/E9DxQkeuRIhzyKYBsXm8OgiCJtKyYn7AvK7QVbUULyVlq1NPNa6MtcZstTIsC TJqSnnWIHD0QqRkneoVyFbYGt7IQHpMm1cwhPc1ffKbcRHZXeimGi1jAgZAxgC6rWgw1OJmnm/u
 kRpUPOIXu2xwg5F3mDNj1dOnrClfML6R+e4RAKNW3Ps77omc+oBfS1FzsxfRsSV095ymb4Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=795 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300118

On 4/30/25 6:20 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> 
> This should be SM8550

No, this is 8650 to signify that this holds true even later
Looking into it, I can even say 8750 here now

Konrad

