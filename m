Return-Path: <linux-arm-msm+bounces-69693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6858DB2BD44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13CA31892885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C63C31AF1B;
	Tue, 19 Aug 2025 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVq0ZZhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DE320399
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595309; cv=none; b=BqqjQ2b8+qjEAvtqe9RRK8YmSF3vrRSqQo1MdxTaGyr9eDGffFjBieup22q42YurTZQCquac9h62Ff0Z/NKIiDaQLrM/x1Qz9UbF8vx3OoluB7+WI2kPPtc5z+oQquDtkxyE2nEcv/JGbWxWEkFejO7r2k5tVjL3hs4bN1K7mgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595309; c=relaxed/simple;
	bh=MaJ5CtbzYcmSzaHub09dWgREZi9K9yHAnOoD4ZSx1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeIBvhjTr1djRc/2Dpl97JW2ytT/X/SnZLPiWk6jVMWWCki1Ue3T1uksMn19fKpyzs1/qEpCi3J/ysWTj4BXMXsMuxvw0LVZiuqxGAkEcNbwitaBNO+oDZW3f/4OIGHquM4juXO216SMmrlp2/Vep57mFNC9gYOQSX9nOWC0Mek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVq0ZZhM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90dBw030474
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=; b=dVq0ZZhMETwhqEnt
	s9EfemQb6XzcugD0fg40sr83pH+2k2K+UZgvgtAqw3++2bTs7uSCmU71SU/ZjD0B
	AfsOk8hvc8Q7Kr81MndamSUWR2bF7md+pIjAgPxSGlFjYjbfFSsrlTJT7NXtddY+
	rnMEi8lGjgX8pt4zPAnjAZ1fTfPV29jlnqbA2zrbTwLMrtYmAQxQFTsTNV4fehh7
	nNOJVdCMl5T2Rcq6ZyCN407NxCXsuYu4QK37AVfeLuyZNIoxOvTb3xO98iOGtoLv
	DzynLzO1RjTNZMNMCSZhfThoyRcF0sJJh2RxMM0amncpykOcsHo0PJqKMTtdaD6H
	pJ5tAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunv6jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:21:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806dc88so128975085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595306; x=1756200106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=;
        b=t9ub9/wH1zlYnL8ElhHudyMT8BouQ+9Sf5saHNy1E96YKBsHBVNo2Pzzxr8mCCn6rs
         SsmeCWFEoYR8eCE8gcLtf7YXEbxIqdvU7iwbMeA+SV2MVOi60CFEvYjsYLqChgtgcRiV
         LAqGyh8LhYWK4asmmpIBr7tkIPU8kR9thc/ByQn3RwNlj2yVOrA0yybED8511AUNl18a
         sj26YwIf64LVrnkmK3zBkHqNF1BX8ldhfArAABu0fMtmLo2cqHbDqt5GOGdvNJkX5sul
         iYqY4t5GZaRwHPihSjYWYRuwLcfPblojxzMktA7nHLgls7mfaiDV82pBQEZNfFVQG3D/
         NH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3wqoiBhQJmJ9oJmNaWN9bOAXAbpVsLA7RsEWdJa2hjdeKn1yJ5fADb4CMlMSSS3Lr0WO3a/VAi5jAzUBR@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCG9g335e8n74JQAQi7KrtOmYKRsmyrmN3x+SVB7Pvb0qJ5p6
	tma+Qz/w+cKk80/Hk6WnXC2BTi0ufW8sozIt+NyBUlt0ojnQso7djG5RXe3YQC1VDAXXphe029+
	8iP+QSd7F24cgd14kXEXP9nYbuHT+TLRvd3chlY6TPS4L/gXY7Ibt/gLlbAGzYNq4zdmq
X-Gm-Gg: ASbGnctMAyMenaUwOUF1+SqPVzyYn3nBS58y3WKK3Aibz8aaBZR6rQIKiwKj2q6tL5Q
	iL4Zfku84kKM7Zq3AipxnzLZM+e8N2MVV/dOqeRcWbSIS/IzU0ZKboqQK9taZsynk0vOfnLa0u1
	F+QCbQZRd9gIcDVndZCw9dSphrFYJhIxa8C8AkLJvEatyAffySbzwlS+KndGnot4Pp60pYDJokG
	8UwYA7AnSHTHMqbYgJu55UeJWn9pRbRDYhvFYoneBUJ6hDzEbe9CwazEPfyd6linO9lFqF1V7sI
	N6Mk4og9FvJUkcjxo9yS8x1UdhHRYfgC6wRFaVI91/jUAezwWMOn5+RbySCGsi8A/C16QjjG7qv
	KcPz1wdZ+Aif7yPv2ZcBNl+r2+Z0rfQ==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id d9443c01a7336-245e04926b5mr26682845ad.34.1755595305591;
        Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpiiFaPA8kQRfNSDplxINgiGA8HlGb5Wu8T7SwEDTnoUTiI6Noo4c+zpUmfz128LX8UgJLAw==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id d9443c01a7336-245e04926b5mr26682375ad.34.1755595305122;
        Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446caa3806sm103046795ad.28.2025.08.19.02.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:21:44 -0700 (PDT)
Message-ID: <76ff9434-eeaf-4ee0-a8fa-aec566c46c2a@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:21:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
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
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
 <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7ZgP93pVTTqg7s3hfmtz0QD3VIZ3_YWx
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4422a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=b6vJvH-rrpbGiSTQa0AA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX1DVgTurlgGYV
 g6hBjVOqlmqKU7CL7nB1nkG4mb6d6xyKI52MlY120f2r+mJ3So+51b2hWEIEV2hMCebs5v/pgbf
 +xB7lSyJUkjcHWLRgB+hlp2TQktZ0oh7zciLWc47Hczug5eoASK6hYseBgnxdPVgZtItGaTNcSn
 cE0QlcuGqN4hZbJXz/ni1fFzcHwm2Oc6uaDgdd8N4TVhj54uvpzuVGZfn68HXy/VcKlj6TLMDL6
 8WO9pyZx5CaUs+g35HnG1f2LrM3zzZm6HZwu2+p3xLioxQm1sdkchbnb/A7KNOZ6WBz1tktSLHG
 rz1n8eAb2LwsAwhqbVduwKPRQD+hsF221cw+opFr+Ful0jFkzcUalMRcK5dih4AfMSA/eWHtJw8
 WA6CYhT5
X-Proofpoint-ORIG-GUID: 7ZgP93pVTTqg7s3hfmtz0QD3VIZ3_YWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071



On 2025/8/19 15:58, Krzysztof Kozlowski wrote:
> On Tue, Aug 19, 2025 at 11:33:29AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. But it requires new compatible string
>> because QCS8300 controller supports 4 MST streams. 4 MST streams will
>> be enabled as part of MST feature support. Currently, using SM8650 as
>> fallback to enable SST on QCS8300.
> 
> I don't think last sentence is true. Where in current code SM8650 is
> used as fallback?
> 
Sorry, this more like a description error. As Dmitry pointed out, we are 
not using SM8650 as a fallback; we are only using SM8650's data 
structure in the driver. I will correct the commit message in the next 
version. Thanks.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
> 
> ...here not.
> Emm, if we need new compatable, can we add qcom,qcs8300-dp here? 
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
> 
> Best regards,
> Krzysztof
> 


