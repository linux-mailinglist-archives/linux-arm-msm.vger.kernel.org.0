Return-Path: <linux-arm-msm+bounces-72540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B005CB488F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050C116653C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E32F60B5;
	Mon,  8 Sep 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPTyTe8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0AA2E1F04
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324788; cv=none; b=eSHthm8Dt2bZsN5C1P8rBm3r/m7IVi92fAn8j9cbZCkVM2YWj1MulOGL0iZowjLgfMqm+upLfd4sUYq4hffh4aQa2Crt57X4iK/x7JNnJIu0WeMJgI2wM9FJykTky6/GweFOMiKZ56mAFTx08IlE1iG9HBSh/Dbmfaw2Efa/SIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324788; c=relaxed/simple;
	bh=/TxGWDVEy8QiPgBzZKzfuccKC3DyL8/fzDvnMll5xLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tagNq26n7Q/VZMmkhAoj3ScaObd7O83VFCrUEAWmBVh1j8eFaJffgDfbj6IhAJoTgBRz13jSLLRI8vJsxZbBMqp+hCyP3Z4nYbVTiGfLJlES+awuH4H9xxONtzFcKOaoXsFOBqsOtICHNUm5H/2cve6I69T7Cusp6YBEtQlr0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPTyTe8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889G3NV021982
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 09:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=; b=ZPTyTe8JDjkGsm8R
	qG7L0NMJauUOwQ/EbeNfLsXeLv66semrXDvJCoOKmTvzTZt9jlYBGGWdmV/57CKp
	UdCc48t54mAVqMHGUuQG79m0Hn9ru6N0x8RDuFW9drNecY/O9G4zLqrm2RtD2MKf
	/4eHqxibxhGgZEeb2S4Osa+p0b8hcQtgCA++5s3+z8ZSDo93/JtZ5eip2k+DaWmn
	X64VXaSutZqbVjuNcJaoCcSlPdz4YFYbvbWh05k8Y67j/WATUTqjfkboPeALyilT
	odAno1gs4Bq0ZE4pZ+t0/mCxXleguFimcxHiwTN/jzVJ9Q7/hwzTwA5dm/34wSkR
	70pQnQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc202ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:46:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7723d779674so3824977b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324784; x=1757929584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=;
        b=vRKDwLoUXAW2JAe3/l6EQf//JHAi4+oFqyP3IdCFjFzZb8GHn1NXYgft8yLDsuKIuL
         2T3o56jvBhe54J+J8fkn0XM17bwOqeaWZrjFKebd004mR2tU3evTOLnxFbNVhaqOKhmQ
         ezWIol3y3MOA9VNdrl01ME0ird0GMEyHxacXlL0D9KzasKPkhM/w4vueY+or6mZR2CmM
         Wj4a6Z3xKRzsgORtQ4UBmms16vmcG3t6BS4j1O+AS1WYwWC2eDS15MsHllSAFIAA+3Pz
         1wacSooRACfZAt3YGqS7yeOrx4wxFhwPOuDhpxq9nMulbd1lb3NqcqJDsx/j2zkjxsUe
         +qAw==
X-Forwarded-Encrypted: i=1; AJvYcCWwOa4GYC9nQ81wxAkMMGtL6U1RYXkWnWDNYnzaYJkzBcEBBXjlAnLvSHMPVqe21A694CykB2+C9elfliVy@vger.kernel.org
X-Gm-Message-State: AOJu0YzPPVvT1zCSQQFE/9kgB/5yuyfR7OvFhsnKY1D61iZk7hDA1U+j
	iUq9nb6R+OMypFGKNyy5kofDhyNAJc7JIEjBTczV9SsrhsdHqkfUmYIlXvwQDw48MJm/HBXpStH
	mw8jwG+T+mA/R8qQUcqFG4dHD8MUguqhRmaCcdBYZUEfPjt/fYbeJR6gXMXpM5FJ2YeSe
X-Gm-Gg: ASbGncsb+h/dLH8PQQ35R+04OlIqxo3ijCJ1xin8/O+kpb0bqGW+OZEQQGww0dbMFhy
	JUXpsRYoxs3D3pN8f9SsTIV7+pY7kPHXVQsTeAZ/iUe25PYZZcCMB8qmE2lCXQpVwXzxm4QbEXY
	x5N73fAl9kcQ2tC3gRp+SpHq3Kw2dfc3SH+YHvRXWxFcnBlkUIct59jkSxF9ht3MrvBdv92hI2x
	afOVa9sSyejQaTP/VVHAjN7Zx8minX3OmIx8wJSBrTraue5oMQUEtMQiU0+fCm+0hJctedOW8ac
	DHSaRpKt+UC00y3SbpXX2Sq40lUyaC9t/uyiDdKMMwCTnTGr6h0CcCLBc/knqR1YEjCoowK7Pea
	al+Z93cVe3l+ycSodo/AyOx3hfe/u5vg=
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id d2e1a72fcca58-7742de9bd71mr7192786b3a.27.1757324784053;
        Mon, 08 Sep 2025 02:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFev82Yp9Kr5wVOJJhoMHp/yvgqYrcjDrrgXkQ6IJGt4YT9zimh23alxUGwv5gPyVFAtpkruw==
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id d2e1a72fcca58-7742de9bd71mr7192730b3a.27.1757324783398;
        Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b65a2sm29336054b3a.34.2025.09.08.02.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Message-ID: <4a475efc-7da6-4456-ba6a-ef3320fea3d2@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:46:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bea5f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6QMyuPo7PgMWPuL3cUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GsHK0WX8Un_o9ybZ7oJWFCaaT5btcdsX
X-Proofpoint-GUID: GsHK0WX8Un_o9ybZ7oJWFCaaT5btcdsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXy88AaIbPp/tO
 AQd9hqCIJTSOYpwVY104rLFCn8HNk7SivBKNfVjpHqZuWdV4KAtQFWWMwdc4Z8rqnl4dJwL5zTe
 PxpDRjg6nsRsXe5WEwIIYPqbMRQl34OrAFbTbVxhrCJLmv1xz19osdBU++tusdY/88Q1HwoAZ/0
 n7Mb5eqYUo9FOMt+3scLeMrRIrApNwWqYlPB+r4q8+h9XL8bJpg79+9rE6oP+xObdFIhNwivrYF
 wWj0Flqk1CYWwS/p5XXNVPbwHyeSfWV+rw5hvshSDj3Rj5NnHHGcLmft2SxFecG6KD7NN+kQSRJ
 mYQRngpKKn37CQ3edXB8QDWhyzlgdBFHvhUeq9Xyn09C3mrO+FepCi5k4xGGE5/ZLn4ly4n8zJs
 dlcFNxQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094



On 9/5/2025 4:25 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> that supports 4 MST streams.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>
>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>> new one?
>>>
>> I think we can not use fallback to sa8775p, since we don't have DP1
>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>> really used). So in the hardware, i think it is different with SA8775P and
>> we need a new one.>>             - qcom,sa8775p-dp
> 
> I don't understand how this rationale explains what Dmitry asked.
> 
> Why number of IP blocks (and this is DPx, right?) matter? Are you sure
> you understand what compatibility means? Please read the slides from
> OSSE25 or just read writing bindings.
> 
> Best regards,
> Krzysztof
> 
Sure.. I’ll discuss this further here to make sure I fully understand 
these comments.

