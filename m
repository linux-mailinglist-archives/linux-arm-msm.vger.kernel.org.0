Return-Path: <linux-arm-msm+bounces-69866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1887B2D3D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 493321BA6BDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ADF255F52;
	Wed, 20 Aug 2025 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pORbeOdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144062367B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755669983; cv=none; b=roqUBTz4kVDtae1IRk08c1k+CGAzZoTI2EikqCG0t4PmyuWpMR9D2pYShUHBWbsgCKADEnOq0GhUcvmCKY6irP2KfXCbzXkEDF1aQgpeL53AFOu1kL5Sk0DLHtUC6TyBs77zDnbaB9mwfCW6o50gSau62afpty3xK6aozBfKazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755669983; c=relaxed/simple;
	bh=OAYi4ydQnL8gJ7D3NaAl3MOZsDT1GK3ec/6XjP4fSxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRCuFJTNn/kRu3v7/QD4TTtIhwy4wQz9sv8fMMDZrUtKlpclCbO6s3HLrZjwwlansyRLtcMrGLdSF+V9mq5lPElqmFGHFEe+49aeJ5cVNdAtbhkdhrszgm/YS/JV7yaIZVdcsfQuZCDsquAiOomyUSpOpiGVrXPOlEidasPQAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pORbeOdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2BL027095
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59SyR1NERy3Y1jC5JNhL4yeE7jcVGgkH9O11kosKuSk=; b=pORbeOdjKuCWzxmP
	Xj310mNvt6KzKO3evFW+U8qvLljVoOPgxbF5zC1UpP8TjN/0bRjQnc0kaIgcbl4O
	YVltmMNJIdmUKGQ9IOve9iA4D5rCB7wyqa/R9q8RaYcJJ3qIKy+YdkwYoRF5xjE+
	y2o1E8QbyXwb0sOid/GPtQd0aM5byxkH4DZLUKtxjiHRtQbenl3nU7OIA1vd1m7u
	tRL0LjrKdt6WDSz+jZr9gJH9CqSxHM7h+JlXnsiuDjwjUSoAUo7X9iuq1VhJj+Ho
	vPAGBvKwMHavRkBKyyqdRvIW+VEREZ4UX08uTs5Sphci2GpmB2Z3BfcLcf3JuEs2
	CQ7HmA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8k4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:06:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806dc88so153641415ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755669980; x=1756274780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59SyR1NERy3Y1jC5JNhL4yeE7jcVGgkH9O11kosKuSk=;
        b=p2NCCrpUMhHvHfCnuz56IsU3tOjXz6JO5gn612q9Tryn+7OvU9vQip4qwmazji02n9
         ocDYtVDXJ9/CCXVKppN8HwrAxRlG0r3iVHtc4nN8MpA/aR01pmKNgMD+dLMLEK7PXaeE
         8MLHZ2cwodXQilNiz7n0Rg1YYXnJK401uQbvO7QsBunlq3X6Bs8pxvY+kPIiF3fevw3E
         6QGKqMT+0D3ML3qn0avJn/3YculsbEjIMGCTJjy8JJZ67h80DpOELLmlK1XVPsO7qRkB
         yOZCu31+c3Nc4vWKuwnTeEXUYoZTOdHL+cXu/H9RZCFgUGrwIcYA2w1r+Hd8MgG4XO/x
         QmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxsznAgR2M3JQluFSvqWJH0lxwsoNNct4Fzbu0280FGt90IiREl1wQYDEyr3fd0jJDeprBqtYsRn2QqTwE@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8MIMsEtOcnOzOoSpWdprLrm36v67ZY6PMjmgLf3Dog10xDsj
	V4KP0snx32jaBCVXAsZ12Zxr+9W59FhmugEYvWOxCaATDOSDUSPs7eMCHuL0PNeUtK/I69CSGCA
	9rtB29HA7pgWzVjfvtZyRGzlY7X0A0QNxnipwS1VsLEbQFZ4fxTRK+Vt4P/XBZjBOiSbt
X-Gm-Gg: ASbGnctu1GGB4mYhDA/YjogMe4tLqXKLpuVHkqAMYyONilj2mxT/cw6SpQFcfq4LEIu
	AmTfgwIcd3awatfVGrM6GGRzCCxxvDgKnzW6KK5X5OBwrHmlrD+7eOKWZeVKj143sqAzuGD4XvM
	JUBfZMCzftAloNWYifD8eP1DTubRCpX2UiuTB7kw3MSIXio2B9IAD2bPT6aKDF5eI523YpJ2Bah
	x5sDjBWBXbri27UdW11ecQ1/sjpVyBjWskmiRsc/61a9UEFBPILAzg/wZBj3cIEqiXlVe4g09ME
	OeE0ClXHntfwxAihMMJ/siIFOHF9NgstHzx4g0puGHdUnsDAiSEEjsMNG7hq92vN9mST/qpUSsN
	cOdMO
X-Received: by 2002:a17:902:ec88:b0:240:a430:91d with SMTP id d9443c01a7336-245ef0d5915mr18790005ad.10.1755669980384;
        Tue, 19 Aug 2025 23:06:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYNnNUSwyVV4DO93t9r+GVSsYWrJggZoyswSr8zmZ7BeWtlIFh6WiE7AN8ne0wvDrWqtx+YQ==
X-Received: by 2002:a17:902:ec88:b0:240:a430:91d with SMTP id d9443c01a7336-245ef0d5915mr18789745ad.10.1755669979933;
        Tue, 19 Aug 2025 23:06:19 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ebc4esm15327645ad.115.2025.08.19.23.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:06:19 -0700 (PDT)
Message-ID: <73921d66-8258-4f82-95a8-f4e9fe8acc8e@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 11:36:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add interconnect support for Glymur SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mike Tipton <mike.tipton@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
 <7806e54a-4355-4173-91f7-8da98cbfeef2@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <7806e54a-4355-4173-91f7-8da98cbfeef2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TW2NWYBt4YgAMhilaymbJo4raObwnHx2
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a565dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q7FFX_n4-uy2H0W7qW8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TW2NWYBt4YgAMhilaymbJo4raObwnHx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3G2IR294Z3JH
 TjoZrrsYs1MINCf7jSeHdlVLQh9dTCT1uXFH7bNtjbiKJEk6br0HmQ83pQ0dkX/Zbki09OT86G+
 YecaekJCxl61toNk/wT3gGL90u2+OdSIAEWiesfzCMDjnBdBBI3eazjo3XsA5STAbbdgdgRUTVl
 heOQu6Jj4VdN1Z1vUgd/Ef+Yf+hF4bOMgXCiq5dasUSsOBqxteAw2pvZCaV1M3f7wCTksIY+krZ
 y3O3sRoYswO6eTbdCbCnw1GsgUYzpkPa/WUL6wiVlzLuH9e2pwgXHACkZo7sP3AM5wzjtX/6LT8
 VKTLCPK/uCUS5EGLzZqIEnqUBl4i/KEfHEQzu89b4U5H3MeN2ith7wiie9EyVvhtR7ovIS0jCva
 i5H8UBY8xu+x9Z7O6Ld4NeXhCbuEVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/19/2025 7:22 PM, Krzysztof Kozlowski wrote:
> On 14/08/2025 16:54, Raviteja Laggyshetty wrote:
>> Add interconnect dt-bindings and driver support for
>> Qualcomm's next gen compute SoC - Glymur.
>> Device tree changes aren't part of this series and will be posted
>> separately after the official announcement of the Glymur SoC.
> 
> 
> No dependencies explained, so how maintainers can understand that they
> CANNOT apply this patch? :/
> 
> Nice example of throwing the code over the wall, does not matter it does
> not even pass standard checks...
> 

Sorry for the trouble, I have added dependencies using b4 prep
edit-deps option and I tried pulling few older changes using 
shazam command and found that it automatically pulls the dependencies
from prerequisite-patch present in cover letter.

I made sure that dt_binding_checks are passing with dependency picked
into workspace. In future patches, I will make sure to explicitly point 
out the dependency in the cover letter apart from adding it using b4 
options.
Sorry for breaking the dt checker.

Thanks,
Raviteja

> Best regards,
> Krzysztof


