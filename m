Return-Path: <linux-arm-msm+bounces-71967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA0B4327D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315E21888044
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 06:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E3C2750E1;
	Thu,  4 Sep 2025 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUBraTIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3962750E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967761; cv=none; b=K5NIPDqnQl3fBu/QQSXvu49msL/kqSdvhYDVMKsOznNINOPQUggv7WASATSyuM9/Gqj00v/aL1814QcmsSu8Mj8LZ1r6SKekMV6hR8TqtN38dEL3bB94jg1gQQm51CWz4NRz+GKucJnMibu82Jlcpe7b/EFj6FFfmtENfrWOLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967761; c=relaxed/simple;
	bh=UJ0KZK1xnQRZT7iijdpjHkkIB/eIpt+SFyHW2s2cSnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhlJNJab+3w2FRun4/KXVzmYZHMNDXPLo7PNFLF13zmZd22OIsKpStnnRWvH9ucYr4mywriU9fqDswL5uUPgYTXzNqKdx0qj9UbYznjfACh/fe9W4nC5EqN/wi0hcU157lXV3TXwPHVAKRI+IGbZYP4mGhuzwDl6v/Q3/EsLgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUBraTIi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840qqQc021581
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 06:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=; b=UUBraTIiFcKJ6O5N
	918tFPm4wsDxLklKZtmyxTos6whJ1M2uIltlFrYEOlQKn9p+tYRzNJ4Qy5LKIYUQ
	OOwaMHJIH2+ZEqTVRJtydZy8ifR/h+dRWXcIZ2bW8dshnckSC2gf6aAfvoRfpZnZ
	OLkVucATNaBNeSRfan/+aY8UUJSSWabrf6WOtHoxqAWYMSkzhobJ+E7lv+uXKih3
	Y6GGHc2l6bGbDwT7PhNO6ribX19Nq3teOnAhwWK/ilIdYiC0P8XeJqK9veAPeOcl
	eKfr6HcHe0DAGxARIgmhYFahTMTkiIGU8pDQtLoeHkQC2TizaCZNfHl4RM7TzKny
	9tjN5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0epkjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:35:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329e0a8337bso829424a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756967758; x=1757572558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=;
        b=fVcHuaxY0FOMiVkqGrI/vfHBeCSrnJIi1EHr16IEwNH/Ij3JzdmcVdZU6AH4kKRtbl
         Qggh7o6ST0ff8z997pNkM9DgedYBuRhmjGrtiwMia42+3q4/p+A4ya2dfHMtC6J4Y0Xm
         YRi2vxbFLxLQdjLMzMx5jk9KbI6Xl4hOaJGepnGiNZagz+V4Gxklkpc2cxpyL2h/N760
         Y6Cj2an2IaeKu+4qaxiP9d2O/hi2HYe0zPYX+daK6g3XGtnxG8XstEFYJKOAgcDYdVej
         D0qmLRBfLb1cZiegDkpoekhgAq7zzfeGDqqwFLTkwUp0GgMm97NVZA01LoVYWk4C04AE
         3QBg==
X-Forwarded-Encrypted: i=1; AJvYcCU6ENyDTfXiFPlSQH+DoxrlRDQi4fzKc0ZKTN2D5/XWmOZFlH5IEu5StGJl42rjPGc7oIvQTx4cVRdsPY03@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLIU23VNSdY/s/M1EQiY7Ex39HCWrDuY/M1KBbT7wE05eIBY8
	t1Rs3NIt1byy1iXqNNKvdgod3uE52IeLjlA7BCHmojxXBzKJ6iEZdxJ8vR58VgGPQ9z53i7iBYL
	Z5jVCQQIx9GynT/J+FTA/c+OfR+vZ+rjGbz/FdlcVsbj0iTTGuyb2wxiUu+L9wmAtwtXX
X-Gm-Gg: ASbGncs6Y5KC9KX6Y85M3UFLIo8440EQiWSYD+baViuHNZoBDzlHlHpZ5Ikv55vVsJe
	46EHk5fCA4haSwnzmiOG/XOcaPH6urnWlVct4Zi/fa3K0pRyuNqRS+14tyU13NH5GcHlo6YfDiH
	2i5jTu0utJSmEsnLN+Tohj7fbmek4+9AbufakUkkpaUSW1mMzG4l7ICUbvARi+h3+V+Dhj3iegv
	hFQojXSqH7rqB6ItOusSa8/pxduP76ZhXHfJ5hWz2kS8p0/z51b1YA26dkS8WPcjEbHmMk+eMns
	SRikfmiIaF+sH/1bzxfABHXElFa59M6pZ32xAJCMYpoWxF5sSIsBdFtdNOVFsq2SY3LkvZfM/q3
	euAJFVEIqe5RdYeXtYZGzv4kPTgkZyA==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id 98e67ed59e1d1-32b90a5f1f2mr2536813a91.20.1756967757717;
        Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0AZclcAiAIE/RLioDWTNitUCYKwiFoqEf+Fx+HDf/RA/CibTj/rrt4B/KuNcWo8T1gpG/rw==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id 98e67ed59e1d1-32b90a5f1f2mr2536773a91.20.1756967757183;
        Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fa1f21415sm4007673a12.18.2025.09.03.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 23:35:56 -0700 (PDT)
Message-ID: <25379ac1-4559-4803-b03c-bd24355d3b4a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VcqwAkF-yR4rrK9h2FY_k5vSFa8dlq44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX8jzQc3tw46p+
 jQLElc4oS3xdUQhOI5IGR6vaZABoTK0PDKJb4hYPXrJC5lcBr1Oh15+fP9fu/qcgZPwHhQb84cO
 WjSWituEsVpHFiLoy4fX8e1HTQTcJ+QmGY9blWpl2Zg2UN0RvMzE6g1vEOeEkKSPxo66bTsHXH4
 ZGIctzVIImMoPTVSQ7XVRcE00vajDg3aux1xlYRHVfE/uM7qXCEP2Z25cKoXvj/rt1yDO3YXlAv
 KJRTINXsMjfUJI86qIzy6M8/g0xe30tQ2jNCx/aqRjYkXm13we457TwWjZCTiQybY6CBeomP5IX
 Q8OqcaUP7PL/1KJsNsLqXifJfHR4Y4/KHLN25dhkvjPHGETl0lVvOCg4ogejTrJuGewrbXRwZwe
 /7WUTrm2
X-Proofpoint-ORIG-GUID: VcqwAkF-yR4rrK9h2FY_k5vSFa8dlq44
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9334e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ik-895_utKsnK2WA_CQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004



On 9/4/2025 7:45 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> that supports 4 MST streams.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
> 
> I've picked up the last version of the DP MST patchset. Could you please
> rebase this patchset on top of it, hopefully making it finally
> mergeable.
> 
> 
Sure. will update it.


