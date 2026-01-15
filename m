Return-Path: <linux-arm-msm+bounces-89199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A356CD23DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 378EC301EFD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EBA30E828;
	Thu, 15 Jan 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPzvQv0t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCiAjFON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E732ABC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471929; cv=none; b=OCcNT+NoCGdebDepAkPpDcIQoVyHF0U4uabGDzXhmx5bLp8pXqvFdh9ANIKfwac0Nr7rEBsfm62MZEpF+uXcWgYsOYlgH5byVHicgQWJpcc1NbUbuNEyy9Snzr+Cs/dAC0xE2lgafKEuo20ebFwvrUEyF+Y4LiPHpnUUn8fJ8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471929; c=relaxed/simple;
	bh=Ioyby51phpi4eaikEpZD5c+OaWoJeqM9JphRDlF/oo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OT+3P7OkzyEcpCyX9/JgDH5G+VOsQFjWziDRb8DNwEmKuoziU9XmalW7Llqn0PK8uxtzRJEy292PiEuxdYI7tKkiQdqYn54ikjCiL5Pp3lk6A9NXyanGjelaR3dwCzjFYoP44W+IXfigpQVfQciZLIHNNlk51Nio7If0NBgJU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPzvQv0t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCiAjFON; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foDi1170721
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=; b=CPzvQv0t+5jnexkT
	oncy2Dbo1565GT+hNtQto9snPQEMr9aGXSogDWnSmLM0rvXtqjlcj4d0P/Z/Ll23
	Ipu4g6vGVDgmG2Y4Yb5iSF2c+JoI6CwccJM4MCiMLQ//wBdV0f0Jwa9SCcYwMRjw
	b0Y/3nXzcI/O0L/Z+l7uhJKy1MPqXk8AeomlRxG2RXUUUfMmIc2I1uoluqxt0KeD
	3NClpsRLn3DRfEfVEvNfi6mWT6kE9d66PC8aToyA8JwqNXLXA8QRKps/W/Ksgao4
	scn9KUBEUpSES9Za7PTZCv/fVf4XliY/U6KQxeibei6uQ8mzf+fYHlzZB3TWi4wI
	Pa7Rww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ah09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:12:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f77be4f283so1822661cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471927; x=1769076727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
        b=jCiAjFONvRBAnGGhi9qdU90CkPhfC8V1ZL2be240obEZ2xo4e9HC2py2v8oWQohe2Q
         OJYb43yCKBzSGJwSNhrBJX+6dqhxdURAr3mwMNuumpZN9AsMpn02UAQRM/Kcl43drhzt
         dqm3zBc+aotIrZIZzarzo51KP+I2DAN/QBTakhUOeb6PJFgoUc2RiDLt+i8HZl/Eiujp
         xVyq8/3X0n+G7NrdKnUW1MBasROjgV5sJAM+5z/LmldDAFR+BmsSDSwLa7FRkOFxKwEZ
         YQSYWpdysYTPyyaj6VXLLA80wpGWrPNHT5EMorNW/cjBP+p1+AAAA8fTMPBcktIVhxoh
         qYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471927; x=1769076727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
        b=AiIZAqIyyd3xDgaI+EUvTplvntqBK10a0XVN0ZlqLspAzIvz7yN69s4NAV0kguNu6B
         jhgaBj4VA53xpUoOfCbtZKfkG5j3QSfyfZbg4rtuTegAI+uGeGuGMNQ7sFddPmn9aqgP
         QFFLb6AGWed8TSDd/YzKLyo8+MocHMfB6PpOdtX2px8ThovYdndHja2X6BeTekJA8Lt1
         TN0buFx+NjtDF5gjtofsUcRNQFDXJinAP9EjEjFXU1Ta9Oc+LEVyo6sdjn3uv1CbkT9r
         VokLg8U9dfTC7v7kbt8HTmGR4sKICf4OViXQuEJhfqx8SzuvrDclEQwdKlGVtSQOoC5P
         VRzg==
X-Gm-Message-State: AOJu0YyqNRqSQJGWzUb+u/GIR1w5emPp6WrypX+zMFT+lruzlmkhMq+n
	aHhtKS1yEHBQv+u03ZCUxWWKhFYPdLBaTJKMUZb3+jGIIatrWHzZxshH8Qv/a+X+y5qqetY5mE6
	KQl4VbYsc00DQ7NTuzRExM2+Lae9dYK1kyuJNWXfyIeJWLg+axcAoCc1UZjipF6JQTjGV
X-Gm-Gg: AY/fxX5JLlgkclnkw3DExBjvBeb/Vkqwk+VCU/W6twPrLhqzQcxw1ukD+xS2uGG7MUo
	EO1dJ/7tp1qJ9TY+7QvSoSodmQVR9RGy0+LGbBbwwtMyv5fP5iqhmXc3Chb8vcCtRvHQcoLmgCy
	LWU8GesVQ1TmcBVDqbMTdV7nFKo8BgBfIFkOMojpy45nFMltTXA/rhgdEThgWZr/F5R22ZyGalY
	ZiaY5MLDIDwbcD3ZbkjIQP74CHdnQeFtFVRv4OZsTebhGQ8A2c3Vt1JyYiqDkpVqKNBz1hF6jHs
	HJqerQy93+p679g2x+UYvYydUr9dU7QOx9q7WZzU8RfW7hfCK+PAUyUVbrAePOV1wUSj24WPJNF
	4mWDtvM81o3C1n+sy9ZF8zWGExGHj4ppAogbCD4jh765o+4uFAny6oD3oxINb0zsL0ZM=
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-501481e98a2mr65006221cf.1.1768471927103;
        Thu, 15 Jan 2026 02:12:07 -0800 (PST)
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-501481e98a2mr65005841cf.1.1768471926686;
        Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f0esm2816455266b.60.2026.01.15.02.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Message-ID: <d98339f8-7296-4daa-b625-0908ecd3e65c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
 <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX0wtwmDxu04L7
 9FXmF8OfjuS/z8TfRqilgLpgEbVEbpPYlaPgk+pis2s+dPus7u+5oJf8EfAxlG808lRPlvnTy3Z
 RUcKnkfxf9F0KSLSN/lJtHBf/Xj1yAEBVH2TJKPSnMF9USaK3iBTp6Z9cSyynxB3pe/4mojnwZV
 gJfxG/huRinalClfU+jSfDoNhgaBLYWXgLGcdaZD+MXw1Fx7VbzcEP0zON14Mj1EGbS/WDkYiAi
 wAvSsM3dL22e6EqpmyhGEKG9mMKuggUumWPK+CdhK9MGl4AEM1lzTm7h3H/up3BQDC1xSfXKFqJ
 4d5thBuAjgSaKscUNWDUKjsgmQ3Bv960zONZxUovn78zZbtu3fmaSqi8xCTERX989VmE/2w4Kmi
 msTt9Xr5gWjoZZrmyP6TCGHJG9lhApZEWNphzjVRvHbOSkoqZz54+X/lAN3iyovfR759iQeSMuv
 AJ7KnGWd5IsLWuBA1yA==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968bd78 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_hlmpyr-2oR44aeFeVMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uXfAYCbhREEEYLHMJ6nFZ5Cw_gq5wOeW
X-Proofpoint-ORIG-GUID: uXfAYCbhREEEYLHMJ6nFZ5Cw_gq5wOeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

On 1/15/26 10:42 AM, Dmitry Baryshkov wrote:
> 
> 
> On 15/01/2026 11:41, Konrad Dybcio wrote:
>> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> Currently, we queue an event for signalling HPD connect/disconnect. This
>>> can mean a delay in plug/unplug handling and notifying DRM core when a
>>> hotplug happens.
>>>
>>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>>> handling.
>>
>> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
>> also prevents us from checking *all* connectors if we get *any* HPD?
> 
> _unnecessarily_ checking all connectors if we know that HPD was here.

Yeah that's what I had in mind

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


