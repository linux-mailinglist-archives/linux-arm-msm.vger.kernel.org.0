Return-Path: <linux-arm-msm+bounces-82908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BBDC7B8E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3074F34C1A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 19:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829730102F;
	Fri, 21 Nov 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbgTHNzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfLNN3HL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254C2FF15F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753836; cv=none; b=eKOCygOMvYXfzUUhvBCCy2Tp0B7JkmYB5Jau6fb0cXOcWmi4XnwucS7sHwoZ4bocQ7zKWJLFU0duicoOH55aOS5s0Zw5n93cfrozu55SIuB6mE7qXhoxVS+EmtnhKOz1FOWrj5rSMJqeDX8yDuirz18cZiyVInRv2pI4yKZH0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753836; c=relaxed/simple;
	bh=OXlWhUpZh5kU/fksqwkFT/LIqilAGQCTEUqR6SR1t04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6w8q3mzU5k/KXVLESsZ9t83OvHpHl42rzwCAb8tiCGo7ufcRsOfPn0ArO/4/CyFviaVNeaaLvHImkSUUpA2/fGvy5WWpfTaEFIx/EP87U7hVsJ1aCkCYmOynQF4DlnzH/1mZKydKH3LgvfQcaQWEKpvemNm7BDYIudfSy27UDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbgTHNzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfLNN3HL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALJVcoT3911236
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=; b=GbgTHNzJxiwG60iv
	HD8Gv99UTBNl69R4AODx+UGk6mt+6wpw2haFRQ6B/Iy2Azv8g+1Dd/2vI+k2yfm2
	HK6ahk4COUcOSugalgcpu4tVnjc1uuz9CRRCWf/Vne2GtHxEekthmW/UCg8jAPPP
	9A7KmqHkBDjmAT4H9wgH2DRMNb9UAEd40a754DnAH6yzIBbGHoTZG3FXeY7dazkd
	aB22WCqJxmcDtD9LEpvB1MhnJDnzSbLBnhzMVv2r6wA6oGItQ4NwGI2XGYs8Ue14
	EiPP30qKK51ZCZnnHOV8r6+b0ZNCEhNOOMPKvF/yxi//lHBV3F1jVAlS4uC68qK2
	2kn1/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvshjuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:37:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6a906c52so5797841cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763753833; x=1764358633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
        b=CfLNN3HL806lur09IUlFAknn6g090Wz6jfSybp30CzhTXA8f66OvR/glCHZ9LTEk+t
         Uy4wFbeM3m7ZyP29b/v1vmuv7gBFDxbQEd6oJvU9Y90alYX56PEc6lH+HoJSwyn353Kr
         0NY9sfNC5iWHI/U+TKw7YioJT59DvNCM39Jx77Stmxs0fNepPCblRPIk4bnOkXV5k5B1
         5Yknf9qkJgGAfNgcmkEWXGkAssMvpar4fAiVrs84f3QDGqXLwAEa78ggoSIrG5Rbq8qL
         VG8g39IGzubNpBhwemv8D6zZrAhiWRJC0o34B62P1IQwn3sWqYpAhoyNt+/XywEtUSqx
         gDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753833; x=1764358633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
        b=CzhWg9nwHpbYAuGV7JCYZoQuSRTBO/3ZRnX7dKWoD9xW9VfnF182N5kj5XnBKp6YW0
         7Jkr9r8SzqSoPYu86P2DmyniO5veXt1sH8v6GKhOJmLNCyCoHCDAZwYseaifcq1+j9My
         JqO+dKFbxUyZ3/M0ItDHKfQW/dsqhmAmF6qLTUkP1zlJ3onfZtAxqnPgof9WWyRJfCn8
         SRBzme/1OpFO1R2KvEjbzX3kclTn1kw1O4AgaZhYKMpaAchNezKUy1vKyAUHLEhCmDdN
         ThOiGlDhcrkrrBDZqRZu/T0299f9uEQ4QgOaRS6vEun3VNEsNgkfUClGrh99U7LfbzFM
         22eA==
X-Gm-Message-State: AOJu0YxcBesItNNJ9hH/VSLaQNm6qjupEJKF7Or0mWM3el3V3YmQqr19
	AEyZx14Ltd2zC8q8Xyt4aQvrjKXKUMxmcSxbIRzNjRspKR1hDQik6yX2ekUrpFedY/MybJlZ4se
	4yCDeh1if8/m2Eof/GUwayu4LVmY/Li7EjG9bTo4C2Je1+KcKYOcCG7eEwL8ZXLmMD+yP
X-Gm-Gg: ASbGncvzg/ZrEtzqf7UOh0QGnuoCSi2rYhyoD+fLXmfY8TnBO9v+R2hmTnM1NS/U4yQ
	WXDTFLBdDVYSuIY/bSZJAjtjA3iz/Cy9gfzZhEKwGUiIw7cnmKK60CMdwfiCbkekU+sWTL//+1D
	DOHKSvMkXXuAgobzr2WfANOj6i6X7XMFAzPPylnY4sDWVrPyEgJq+xqEvt4cxxzKW2Mjcwa2EXG
	LcMtG+bqkEHNFH+g+DXr/3vGZQaXgG2U3IVQAMkv5uF+EPKmNY1dmBylamtfP/xsLcYAO+i2vWP
	vXzXP+40wkQaD7DwlRuXfrEiCsffCfFmT/rWkG7mJ7QT/I2Oh3WZL3lskh0t2la4Rm+sBSyqMKU
	H1AczDu/jQcDvmMqpX6jo104ZR/81hpU7mGiaswBLxELBgQqM7JE6mXBPf70uLIR0xlo=
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee5b768c8dmr26806801cf.8.1763753832665;
        Fri, 21 Nov 2025 11:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFASboIZYJmm1OIOATNZpv9Q582GAZ36afE2oDGOITF9wMwkr/HHLieiHtkGicM6auQB02NRw==
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee5b768c8dmr26806481cf.8.1763753832074;
        Fri, 21 Nov 2025 11:37:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d3e1sm5088292a12.18.2025.11.21.11.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 11:37:11 -0800 (PST)
Message-ID: <5984c06a-6914-4e76-ac15-e28b6928b593@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:37:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DnV4nToFcaBifS-yF91zulUER9dVoc1I
X-Proofpoint-ORIG-GUID: DnV4nToFcaBifS-yF91zulUER9dVoc1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfXzRpouvIRNJCc
 GPZHmirBHxYE8zmIngQZgIYJWRRmRtbe72pfyRPcrg8WzmdETY95eOhAxzb8BjhvLIB9uO2oT23
 akCSkQN6a1XLc24rRbTCOMcB2jVkchv+M93J6TlPuvW2VYiMdOkOd0A3x/cF3ieM0JM+pBIW1AA
 YCSmMchin9oV3Oz7Jjm8QVoRbHT9RitR3kVXYUF0wxtYa5jVcoGI0jZdlV8H6lJ09MWB3qGBFsK
 7xV6lWmemXf6xWfylASAc9mbFwYW38uj8cTsO4oPbns99B4HUyiRmawMjcLALxa4r2VRqOhg7+2
 cxOQmndDJU4lWm+d4mhHdKBpaq92U5i4WXZyTOiCXbTWmIQOPRONjyJMzdEZ2jXlMVxMC2yZ6ro
 oqcXzpmc+gMC7HAMYl7mdFBdqV5+hQ==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=6920bf69 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5GMbN-XtZ7FmluJEMAwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210149

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
> pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
> ("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
> GPU entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

