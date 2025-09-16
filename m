Return-Path: <linux-arm-msm+bounces-73701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA5B59550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0293F1890232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B16D2D8DDA;
	Tue, 16 Sep 2025 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnwrSwMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EBC303A3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758022505; cv=none; b=rvruOERz4ul5wKO6uLII5br0+t8wX/sEVguzm8RMxBM5C1pAuRF/3tFiJcks97MGnlO+BVw+R4I4QTE3zfFjhUeCyqbFEq7czE7XTYeKSfDKSnE2qQOv/hHaj71bIl4kfwrwr15rs9ximWjGG1H7XgegDHeAvN4stSYFekquH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758022505; c=relaxed/simple;
	bh=mDUdAClhpngDylpZKamaU8L76ftWrz0ssjp5eVq6BYQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bTTUBBNEoiozL22U82wd7ZVWbj67QEBBOGcBy7oqqWgxkU8eljfK27Vou9O1nJl258XCEnUIgOSLxrcLS1xNqCF3nC0me/kMlmj9f9tu4Sts2xopdtEBsnODMflWM/F0osy/epxS7XjTVNnvasSZq2UYBs+devxnYIPlQyuzv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnwrSwMm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9gcus005281
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmwR9D+tvcvJlEb5/hczlmY/+kQv8mMLdqGi569sPyA=; b=CnwrSwMmSndg1RoR
	psWTN+6pYKUIsJ6Fh1+b9Fd5xz0fYmy727XciC4m9Qgt7Mr3jPdMpMm4IaI+mf2B
	X79Mga39k6pEelDcBoj2Tm6QaKe8JdUITkjbIIFUrvfWdLY7ft1mUge9gtNdy7AE
	c53qAjeGAYzNbCZDIjDycFYa+rZrRadZlOg8VXHqVU5AXdC7B5Lee8FaTJGMlSiB
	vTgWWbibB2j/EZTi9Hqpjdg2PCUU3MPckSgkRXK8HLbELSPcMr2DrdMfv9+rpms2
	5mGvys8Ts2E60ka/w75O9wJ5a1w72r8wULZJvSzCddVhAK4mvnhGJV4nKwtmJMs0
	zcjeQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4c5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:35:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-266f9434db8so4145445ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758022500; x=1758627300;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmwR9D+tvcvJlEb5/hczlmY/+kQv8mMLdqGi569sPyA=;
        b=lNfLIu066h4RjAGflqs/D3GsnWHG0BB8JTbyNsL/ABLcisPqx5MFWzTaCGoEYsgkKT
         AuV94M8ODVtQOzT1hydJeocVkqMEA/9xYSINfLWEjifh99qdT5N5qXuz0QhTUH2+sbwk
         HeOoQdeESfkFcudVABL9X4PyoIGo4avFBK6dYW9HzHsOoX9q3BMeGltKHLurLybM2t0S
         veDeHTne7YA6gjt0OX74XTkU7yE2LxCT0PwMS6xT+z+oAdwyhbmULCBJa4rPc8CcyBTV
         DMJ2OUaL06GfqW8t9CcrakeL5xf/8CufmImdNAw0VX2B45io4PwbkgC2F9lvD56alqwS
         qjew==
X-Forwarded-Encrypted: i=1; AJvYcCUYIAlQ1YE1onooHur9xtnNledGFYLrx3RxJLgM0q3ODXTDJYTOD+gGl7GQvYCuXJkAOvBOmCZn0pPmMAuH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Xqz99x1+KQe4n/mBzcSev2y0KPHn1Sh8UJSTqvzmzQAe3QPN
	RzAGp9pwilaSpXsHORNyoLE36IVYuGp42GgN+QKye5Md1E+aEQ5QJtDOO//aYQ0qPOLU7m0M/a4
	irPX2SdUqupWx56WbVK6xiRlamjuJIlHooA4khR5QXVhSFOCH3B+S/GOyBZgPjlQeKCBq
X-Gm-Gg: ASbGnctESGOr5bZ0PogeexE6Aq85Lua1W06jiARoicUvHcL2fJ3T6oLDql6AvRgrWGo
	gfbwiCRgMfsCq1+7d86Cev46w2YO+b257XL3RwqM/7CNUWev7+qLMuqJzw8pn3YFjYg2XzoE5mf
	/jTqVcnEVBDX0KzZ//uguLxLcsuXUSUUoId4L+vGsm7HM/dgzYrPCv34SxSC43VKbs06BdTxhfA
	RFvnXfgdUTFhshWKSSFg4ILbHdHtPkg+nrg03QtI4EQyUI6aXeKhF6MVR2+1y3mSd/6IdV3cd5R
	IEmLLPJQzF5IGpDqcFRiyNmPQVJBz7LxnXCsWahchyKWKzGbS9Xrh1LJcKivG2w9x1dGLVe97ec
	/6Ae485o4MdgWZwlz46mY1ayg7IUcv2jpFkw=
X-Received: by 2002:a17:902:ea03:b0:267:8b4f:df10 with SMTP id d9443c01a7336-2678b4fe1eamr38673825ad.0.1758022500164;
        Tue, 16 Sep 2025 04:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUGBkOmp8SbmqyPrB/ux8BIh6J3rY072mZrg1gtge/X1eT2SGo/MRJMekisexbLCC9g2Zk5g==
X-Received: by 2002:a17:902:ea03:b0:267:8b4f:df10 with SMTP id d9443c01a7336-2678b4fe1eamr38673655ad.0.1758022499633;
        Tue, 16 Sep 2025 04:34:59 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267e9372e86sm7196355ad.136.2025.09.16.04.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:34:59 -0700 (PDT)
Message-ID: <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:34:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
In-Reply-To: <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i0nKqH0I6Z2pwwhHNTlfYXfsPlP_6vFP
X-Proofpoint-ORIG-GUID: i0nKqH0I6Z2pwwhHNTlfYXfsPlP_6vFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX6dHNIfJx++Yi
 lgChFogAhmJNyuecG1dUBWTwI1f3yaa/XocBr1bIyQJ09PwpImsUphAY/hQxgbGnNuygFz93WtB
 LYQ6llyycXT7xq3Is+Aq1LPKBkbeU8pdEBN+HJTLVU/vdJrnMwsruo1Rp8DQi/bel5I5/WNTrX5
 1wzt41y0WpkEb6NgVyJlcoE8C7ASuhphqwWMIaiRMqpdv1luiPtimgIoc0+1oSH/2E/YU+VLpks
 drNE9acrO/WEycDie1IUipZTebCclUwA2BM2uErEXRy4CWbq5Ow1Y3b8jY1PWDDLtYlo9DEbbTb
 Qf5InNKREQqdAQqx1XiZucR62WSPVuh9JXf4SlGinjqBuK8MkhaEq5pCSyJAYUBE8llSBM3qqI8
 ID+3725c
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c94b65 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ODrqbaRasvCVI81-ReQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087


On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
> On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
>> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
>>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
>>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
>>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
>>> for consistency with existing bindings and to ensure correct matching and
>>> future clarity.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>> This series splits the SM6150 dp-controller definition from the
>>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
>>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
>>>
>>> The devicetree modification for DisplayPort on SM6150 will be provided
>>> in a future patch.
>>> ---
>>> Changes in v2:
>>> - Update commit message and binding with fallback configuration. [Dmitry]
>>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
>>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
>>> ---
>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -46,6 +46,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - qcom,sar2130p-dp
>>> +              - qcom,sm6150-dp
>> In the review to the previos iteration I think I was a bit explicit:
>> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
>> agree to it. Now you didn't implemet that. Why?
>
> Sorry, I misunderstood your previous comment.
> I thought the recommendation was only about the commit message, not the
> binding structure.
>
> Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> fallback to "qcom,sm8350-dp"?
>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8350-dp
>
> Do you mean modifying it as below?
>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp
>

Or this?

    - items:
        - enum:
            - qcom,sm6150-dp
        - const: qcom,sm8150-dp
        - const: qcom,sm8350-dp


>>>                - qcom,sm7150-dp
>>>                - qcom,sm8150-dp
>>>                - qcom,sm8250-dp
>>>
>>> ---
>>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
>>>
>>> Best regards,
>>> -- 
>>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>

