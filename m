Return-Path: <linux-arm-msm+bounces-79408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D6C198EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 598CF4EF15E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E7F2F6596;
	Wed, 29 Oct 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPcOsO4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaYIfF+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7692DCC01
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731997; cv=none; b=XYGsQZvIvmsHvAigirRgWWGMe6D8G7Exf/bxPIu6AisVCALkIb2notoPpBmlVHVWpCvh8rFNWoM1y5xh/HP4Mz3UiQfm4aYdp0I8mK345NNb1654/YD+wl5UYJ2GXKvUJQR5RBSMHgtkhL6nv0xXuRHzTgCCEVODEkltxJgwTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731997; c=relaxed/simple;
	bh=uRU+W5tm9ZeihGOSXH5XGdcCxMKq9ZF5PCIreGS/pso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrvZlZheI/0XmIjGbpoFStFCuYjaGJe/kch9Ze7rxtufdSI+dpIiSZEfrQM3BPoG41UHSsvw5ySBoKwyMJq3pZcMMeTmF9D1P/2qh9XjDNxsiyMVuecqRJoZtoh/p9m0W67pG+jZ7Nd+bo91IMsJ/xBL1UkOfBgDZhn+CS3RY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPcOsO4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaYIfF+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uqiX3764235
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=; b=lPcOsO4r3SX6Ym/V
	XyPlofVFzvTrGI2l0UP5NsYv4j28pOhXcDNyo+1K9h4pcDMI8F/eaA0IrYvwiyyH
	ju/qnQ9MAPGJnMTXHV+I/tFOs7/EDWeklEj5SQqnvCn75dAmpeNCchuAdibM9iMJ
	kntrb2Ym0p+c3KKy1TDAqcNw4C5FUNycUxeN0/Th55oUEGSrcM8QjRLNz/io8uJ5
	AF9LsxT1iG2g7SAD1DGviacyfguXDCzx2vIMqLO4Kf3oG3JKehZA7QPJB8H3Wf8Y
	L3Q2ufs7iQDOsjrsnJnunM1jhwXVerjc6Zzba09+Src16zAcPIUKa/0d4eSQ6nmM
	Nm3+kw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a123hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:59:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-293058097c4so25237515ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761731994; x=1762336794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
        b=MaYIfF+kvDP8KSSPukHn6J+AA2+Ttvok00Qza1bbiKrP/AaMucMRpy336uLjopMNXL
         zJa8sXhY8wB7349H6E0cKFnObk074AmxZEJ26YlhxiYsrH9Zei8BXHXpLGFds2rahJYR
         hHfrUZDtJvslYdkB6eOVw4yQTFwMixCnPCrNutT5tqcU6QUHd86xGWo+IYh/hOo8JvKK
         40AA1/S2X9M9TrWmIUy03SFTqqeX2L/KLSyuo0fncF485IfRpo/uIgMuj8ZUW22telcC
         9kt1qN2JQM4KQk1r5+gSt4o+6oM2s5i50295na4U2UN67DqQhg5jBMSlYWqGe/rUEBQY
         A6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731994; x=1762336794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
        b=WDdhPvmLgsAyShuaaPfikupTC1ifuVnqJdgPZAn4+Rv+GOWANDGgArdzqfAO/KwgwX
         Pl90ZosPOipPdgldd+dTGmq1dA5fK69fimaXkFq4uyVfw0wHMdCLsNNRU/0SJAjDRtFd
         nphQhpWg8+q58V37LWBJgBLBiXx+itLSBdGAns7Xi2JGgQqDjn/LDne5x7wXr37wS2Az
         oJSTYGTB/oSDHjAp3wjg+yS1IZ5tB095eRjv4uI55d8Y7ZOAlPgHTfgDTe4m4H+X0VzP
         EE3cuu4WtD9PlVxh8IJMRTiu2b/uhxWPEi/2IH/sXNKNv+rXEZng3j96wKh+IW7kJuZl
         zZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCU+QQXOzAVfS5BKLjr8auycf4bPj8+zXOE5sTnS8syfIw8QhCKWCCcCNyd8NfPQK3ZUhUnHYjCT3+zPC85d@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfWrqwR0iUsIURLJqc8CcEdmGuozZWgC7ACh0wH6fVeF90ZCD
	vFEx00ji2fdq9LaSgJyMMyzCmzN1zv5T2oqxsEh16vwLu8H4HR6DpAHPCcbiiwpc8mjn43H4TpX
	T8Dt4WJGZ9Gc1Z1Ts5WxVIHySBWg85bghvO26iYnLLltFMudjtf+UzwcOrFTLvTr6pn09
X-Gm-Gg: ASbGnctl0Lp8NfDS45wSFak/oQ4FpIn3DXhzRe3CbRpGC8vIwloZAAmjhFCBAHsrBY+
	rTy73fP5HWWcLxUKrSrLYxPOPrYbHkq97rDBx+/e6j1PIgSMAmaCYQu7GoVNa5RtI+HkI9o1aD8
	yUaDX1chuRd9pzjHrT3AiQARHojtK6CQZDPBz2NB04NE9G/lCDVxJm3W4iA5C0v1z0gaNZ5KReD
	bUda3OBOEIYP/6+JBT+EiM4/JVH/DaGySYTDrd5z8XWCTn5LAIHNzdLieOX/rxv/ph+gLvrXIBE
	bC2Mt8vW0jq/4qXn1OSXutdGAkunJEAGseBS402rFdcVjnFWBHlyniyYwOOkFX4rFd9znvncEtc
	XAoN+eeXjymKsqmxnhmkZjWC4chVEFPep2tMZqGTJXkOrhnLrNec5Q4Zjqu5fyDbvwsnv1w==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id d9443c01a7336-294deeedda7mr15829035ad.7.1761731993558;
        Wed, 29 Oct 2025 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4z4olbHvLZYuxygnDrTvnj3GVSCIDXrQfTkLlCd2lWeeIOL0S3gFqI+0DsjMVOy8PFkbqAA==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id d9443c01a7336-294deeedda7mr15828705ad.7.1761731992999;
        Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2789bsm144130825ad.62.2025.10.29.02.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Message-ID: <7fcbb624-7c92-4043-b5aa-0fbfd3dd125c@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:59:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
 <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z8WrPHCg8NZPTktrplGr2BL9sMCk4teP
X-Proofpoint-ORIG-GUID: z8WrPHCg8NZPTktrplGr2BL9sMCk4teP
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901e59a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v3LxePKqoqSeXojOrL0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfX7dl6f468V4el
 nFSAj8B6TAT9R3mnRo91O8WzpxOaom5K7rl8N2t2TwOaGIeSERLaQQJKjVljXw/XIc14dsGrHtn
 J2sw/7wEelpMnuICIF/q3HK81sSBIO5ekWV/iAet8NQ+ikHADng1xVub30CBk6j3SZ3hUYs9MjZ
 sOul/Vp1v9Q3iUZJORanZ2rc6qM60ForsE6EuW7nNn0fosp0K9uKwSPYTw4H3IWnyCflAj7TerJ
 4jLDmQ1whKUc+RaqASmc94Ntui1lCm2CbJxGMdZ6CVFyBsH99JxeAsaH2eFJm2+qbGyUSU7Nm9G
 aQg6ll2lW/KLQdplxA0sZ8s9oTwwrrDsOcHysNW7iGNzu+TNn/H1qaGPSzrv1olwIJQlUx+I6Aj
 Aqzl6G0WXN3owqoR1V0iPPH7wkQQ9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290074


On 10/29/2025 4:00 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> - Adjusted indentation and added missing blank lines in the example.
>> - Corrected OPP clock values to match actual DTS configuration.
> See Documentation/process/submitting-patches.rst to check how to write
> proper commit messages.


Ok, will refer guide to update commit msg.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>>  1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -140,35 +140,37 @@ examples:
>>                  #size-cells = <0>;
>>  
>>                  port@0 {
>> -                  reg = <0>;
>> -                  dpu_intf0_out: endpoint {
>> -                  };
>> +                    reg = <0>;
>> +
>> +                    dpu_intf0_out: endpoint {
>> +                    };
>>                  };
>>  
>>                  port@1 {
>> -                  reg = <1>;
>> -                  dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> -                  };
>> +                    reg = <1>;
>> +
>> +                    dpu_intf1_out: endpoint {
>> +                        remote-endpoint = <&mdss_dsi0_in>;
>> +                    };
>>                  };
>>              };
>>  
>>              mdp_opp_table: opp-table {
>>                  compatible = "operating-points-v2";
>>  
>> -                opp-19200000 {
>> -                  opp-hz = /bits/ 64 <19200000>;
>> -                  required-opps = <&rpmhpd_opp_low_svs>;
>> +                opp-192000000 {
> This is not necessary. This is just an example, so it doesn't matter,
> which values are actually written here.


Yes, but I think correct value is better?


>> +                    opp-hz = /bits/ 64 <192000000>;
>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>                  };
>>  
>> -                opp-25600000 {
>> -                  opp-hz = /bits/ 64 <25600000>;
>> -                  required-opps = <&rpmhpd_opp_svs>;
>> +                opp-256000000 {
>> +                    opp-hz = /bits/ 64 <256000000>;
>> +                    required-opps = <&rpmhpd_opp_svs>;
>>                  };
>>  
>>                  opp-307200000 {
>> -                  opp-hz = /bits/ 64 <307200000>;
>> -                  required-opps = <&rpmhpd_opp_nom>;
>> +                    opp-hz = /bits/ 64 <307200000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>>                  };
>>              };
>>          };
>>
>> -- 
>> 2.34.1
>>
>>

