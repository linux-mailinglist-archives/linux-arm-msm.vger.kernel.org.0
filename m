Return-Path: <linux-arm-msm+bounces-58089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723AAB8B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857323A423A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B4214A8B;
	Thu, 15 May 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lrxfj1VC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8792744D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324359; cv=none; b=cobMRutX/BDi+OMYv65Ku6gmsn1fRNeBH3iq0UsIYA47fIlcy+D0J5gAGdGaE5bmNJEqBmvRdxFdObCxzu7iOumxGfbUotyXlbOBSkZr5Yv8TCCnV2kGulEKouxM7AaTYXLSCNN5M29NICmYlh7cJodoFxCeTyVOrHSZUmgAmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324359; c=relaxed/simple;
	bh=lGeDorq0qICcLt/slCL+UOnehjwhsYWEa4SRdbqgYRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFXJT3Z2vC2QNBDdjH0yQ77AVdcFSlzTmOiDlPqpfKLnZE6l3LsCntkruYgObudkHiLTVUGl7DQmDtNGeo+HTHmQ5KSqhrc+5InmZWNFFwAZe6Ni3uz3wNrftadpO+of9aehO0ZzcmlNv8vzq0Be5H/7P9zJMWU3AmBau1phXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lrxfj1VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWkf014970
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=; b=Lrxfj1VCnnKJH6aB
	LQGvZdV0KHsUgasZWpTn7gqQwlr2iEZ2lQ6Wn3SKdE2Ffmnf0t3voK4DOXDjzbmW
	/G4EcgS6MYXs9xZWLY+Uu+SBzNgolAILHYuO2F9QkH0ZUYxP2PP77ZiLgy6wbrpl
	2DzLo7aWfWIuFnJoD5eUXUQUhTq9x1rN6gmrVBeoovEqLV5elpQmp2PpE20eWru0
	xgE/ItC1QDhn4MvwMlFeMDSMQR/w+4dzXaW7tYT+Kb97dkznYYnnDvgEYsY0YnzQ
	PyFjYiT2SJE/2lbo0HbOUWODfIw3SXofdDDYwRIJ2hgGMKLFefCyvekAIJiQgHHj
	4DEV/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpett4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:52:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c547ab8273so21391185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324356; x=1747929156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=;
        b=rIRCk9rD34nbtx1dlArYbTJSruahF1mz0+flfzJGoMSHie6E59iqQ9YNcgEDwRxr0R
         toEFVt8E2CsKDIwOXeeB6YDWXOYp2aY6YCPc5cGFP10c93WgJXSK5DsEyzBOy0YPIQXF
         lZgxA2h6cOJEEHmcKhSbVZmjAPZYdb5H6O1Dc0iUHMJ8iwyaShs26S/i7zjwtmGU9u+P
         WHzyMTKBn4Er+VSaYlCUOCNR8yeRvvTgshQVBJXm84t836f0U1M4eHKrapuz/+Q6I/cO
         RYF1luhzdQYj0MbriI7Ol2pnxQtWq1jw+fn+MYQSSzJJLes5cYfP+yy5c6tgFIPQzq1i
         raSA==
X-Forwarded-Encrypted: i=1; AJvYcCU4p26xgudZAP4kcOHLTDY6n6pNVzorE3NCCtwzpbJu1XinjTnPh6vhQqggk1Ej/5HhbCcIZl8tbzkxX2bE@vger.kernel.org
X-Gm-Message-State: AOJu0YztuZH80FZSSScxEKB58XjTmKWMhAMp7nePGcju5DkWkW1eYmmJ
	HD54PMKDwjVI1UpIJvVeMBZFaEtgReM4zACgvqhNMAy+LOowObqdjbdvQy3wCMkHWL5n5qo7QpU
	JEn274VJeDYTzBB6rPaf3BMuqYc5BmuGslCnCiVLm1IqV5lMD72m+BEpn2mFD2xYfFE3a
X-Gm-Gg: ASbGnctmgESdywT6OCEvvz/CMxPHF9nIQNc47P0iJkwo9twPyJ6lPCV9eE7MBi+fY9S
	ehuuK+3WrUa9MZZqA10ae62anpBhtQ3QdOdSy+2EEiolbj5ys93hJ+BxX0KdDXwIXxYjke8wfx1
	GY47eIY/LCoB5GQz+D16KF4wLhyB0fvgfmUmIK6fAQalWpA8ommdnYNCO18bg3BEVptoJTi7Y4/
	0eSgMmHtMMRiv2Rrxnn8uroqD23DT6cjIPNuTkcLgtZBmgB3Fppv9gDXT+SEhc9vNr8dFe0j58a
	LwuRGmhWsqq0SEYee0neQnlyygi94Ssm9NP7Gqn1nfCgQ3CQ1fRpU7MUxCg/GcndNQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cd4673b3f0mr1353085a.4.1747324356118;
        Thu, 15 May 2025 08:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrFV/2EQXmPxJircJAV7XiXDHBdvEj6UPYt6UTWF/ixiBBQlETA2RLAhwfWdEO68zo3VBYbQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cd4673b3f0mr1351285a.4.1747324355750;
        Thu, 15 May 2025 08:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm27454a12.43.2025.05.15.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:52:35 -0700 (PDT)
Message-ID: <a068ae00-fca0-4c53-9b59-a855caca12a9@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:52:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle
 override
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
 <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CY-e-PEUNORKH_dgFnFG9efWNVcH_fr2
X-Proofpoint-ORIG-GUID: CY-e-PEUNORKH_dgFnFG9efWNVcH_fr2
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68260dc5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jslb4AC7pnrZMK7c9NUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1OCBTYWx0ZWRfX9RgVpse7lDIE
 rGR4Z3YIxHO0DPiJZXiLNMuXFytYnRKGUC06vHkfQY5CXBxFJva7xc4rgRz1EO4JA19yOUFpPWO
 GBHrlbC42MpE5QfdctDq47JaEsrb/5BOvgzFRcQCLpt378ETTMNUqz8KndUlNGyyYIIQJf+/S2z
 rxL3BH8nJsU8H2hvUk2rzIUR57lgtfi+tyBl35sDswRxKIxLQ6MacIca8HIntpGsSu1MY9gRcDw
 olbil9p/dtZuDfgb+WiV0/eRDunmIVHe3qujgqnQFKhA785WRB1icm600J0Aa9ggaJUW8h0FIsc
 11N/E0s8bwSCQ+EdN8+T2/Ulay1HWNdb8x4aAIAudzexuoVxp8PGjApKZTJZ5Q+QQ6GX9IdzeYA
 CzpS3xL5t4IfJ9e9hu5c4MNocXpi4WWn8fxKXQlN/fvL021a+SCdyvZTuGeLlUyOUhQIdXox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=735 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150158

On 5/14/25 10:32 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
> programming those). Should we fix all of them to use 6 by default? Or 7?

I don't think any default value is a good idea - this is the sort of
programming error you track down 4 years after you go bald looking
for it

Konrad

