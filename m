Return-Path: <linux-arm-msm+bounces-57439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95EAB155F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F29A166821
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B930228F528;
	Fri,  9 May 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXmS5b2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513DF280A21
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797843; cv=none; b=iNv+S64bqz3wI39S5HCn62VXIY4QwP9wT3fCCluF5Ra2vHerBk1K36E27IAjI0j1I1nuKCojrcmFMlv/4Fx6QSgRgJPPaxwGc+Ns32OXQ460Eu9HvbKRj0mPmdfz/qZOVTn6gtkOXKGT8FeenZPw3i2bG8a/gAvGGJCCSHXQm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797843; c=relaxed/simple;
	bh=qb+XEUmhlx3kw8QCiQxtMMbGJ5P0bCkJDO2IKyTgjpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrJ/Y/6pIgn2PgnDPQDmTnXEW2KetWtt9nJd5XdKKLcnVPpLJAdL2qSzkUt6FTpC/3G5j/HrU5RWbwiR+AJxv++dQ3fAhwGJNUhtTB8SDOy0DyANlEPNrQgCHiJrnDcbaxX4hUzp0e+oLLCzCQPpK3mU05COWn9HdviDye3Zh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXmS5b2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BhwIK022870
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 13:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=; b=EXmS5b2n/lmS2bQ4
	CW2Vr9rM/WGS5/AkIlhPpJWUy0r1vsBGPIco4kOoiAKRUcJt3Xuuogh9cSa03eBk
	jkoSun1dkKF94Y893RF9AX/sDMbhjToeY1r1EgLQU93dMeCYihv0wk+8dD06HooW
	BEkL4P4spVMQtYwGdVETFGPNtMMTmkl8hXaI5uZruaH9rhmoT6dgsjvCh1MxCWmJ
	13I+duS7m5+nslS5MJAvGx1volYuoG3PW6TUrecMMYqAXIPHcPOF/fc9DmDRBfX+
	tyPiUl/68csQvb2Z6kFb1lZBbVdF5s31Sl0Z4TKP1a97Ewys3tFgxgsWaXBCRZNu
	2w3BlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp84v73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 13:37:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so38435585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797840; x=1747402640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=;
        b=hJyDB/nhWhXFf5IojznjG2OY/fiVf2uQLCvvIlZY/Oo1wL3gF3uqmcFEFF+Sb4uQWx
         KQb+fvgYLYi9TUDF2r4FlP80ydnM5q4aRQO7S+jfdU1uAXVmu+1R/QTSNp4WjKDXXqkc
         eZoj3VwXOpiAJcJ9c17fnc3JkikRGPO8WGFWrYGyo9sQ4xWXobJGh24ML02W6RIUGsTQ
         ZhyIldBtNT+kg9GBLVEWQhExj4OakzTCk1ij3JBaRBqKac1hMbMGbRw3oprPM2KSE5Fm
         urpw7kBoX30Uo45uSmbWwhiYAOJgbyPc/8FBXqvqSgcGhpwQ4zKLUDvUQcGl5IHJEwp/
         yg6A==
X-Forwarded-Encrypted: i=1; AJvYcCU6iYbL0rv9J0JNyoQR9xqMGJC9GpACpx7etyJSRr4BuO/Jy6bfvZHiDkvh+f9jLrNjpT5WAQIp5XOuGC6U@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGa2cOQGovgZisZaemwRQ+c1/Eveoq7K4lXz1NNjkaFLbFIjp
	2PUKtKu2J7D2MQ6Ju1wEJY9AxbbjqpJq4zzKk9HcQbvTfNpVQFr7FWhuzHYmAICmW/P48tg/oKj
	OM/fNnc9m+jINHvEQGFu/zEcrbLrq6RFhorqzTtZHZVCeR/UZPSrAdhwsuK8SZWrx
X-Gm-Gg: ASbGnctzNgdqSYFiZua0ZJgM5Qkwws8shRIPyJcvfKxy3Bn3XLNHV8PWQJXOpyaXLnZ
	Ll6dGwgPw28IoOJKfonPN1ywvMyvNF2ysa1JkSMJ+P+MswoX09rypGjjKS9a+pIm+LzSxPG60rh
	BsLPNXgjmfv5lITnlnGRF7sea9zTijZ0ys6EzlM1Ijj0QJIUSM2RTBuDtdwm6jl49fJ1ol+z5Zs
	sBea8EjayqeWH8XCjZuGpmez9HiudAwWcQYWYCaOWchi9Zb/Q7gRs27meeEHsUK35jvlnPBupkf
	GeGDFOQoXp1jzLLIcBQN6TgTJkD4y3z+2Elt2F7B6cdwKiF2fKBlPlahITfCSTfqPkY=
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7cd011520edmr199007985a.15.1746797840076;
        Fri, 09 May 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuHC/kx6/TH6m3sFD70X3TGhAwdHUaPhxaRjn4iosPvYhb5stgDjoSjqTnyk/F9Gh1p1qG5g==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7cd011520edmr199005285a.15.1746797839676;
        Fri, 09 May 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197c5b9csm150979366b.159.2025.05.09.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:37:19 -0700 (PDT)
Message-ID: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:37:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e0511 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: txxhfxw7GoobPog-u6tmu6CR12c44PFZ
X-Proofpoint-GUID: txxhfxw7GoobPog-u6tmu6CR12c44PFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMyBTYWx0ZWRfXySZyj0Uf05NV
 0ihCy5L6uQE0f9C6mpcGJ9a8qim56OuJwV0o2+i+V3u6LV+MhZBDbEvSk2Rfr9GZQYZ6V3tWMr1
 lAeckj0lkxB2U8Wh16WBDcYl/zY8xhtN8Z2XCEzhTZb7gMbGsWi8d94v40XrkXK2vOpjIXSuulC
 JWHyOhLezzimYJF77fkVuQAb+rS4yZz8lGjvMrPTaomHoCsPd/2tZV96FsApSn+hYTYDs2Wx3AH
 G1qIcKVwopuhwjsegoh2dw2FHOILe2ZSGApCsl5o7+eyKUODMKgT+NJIfOQOzTdnrCOZqq/+Ic0
 pLMoPIuF1SeWGZisOdCCSHJ1C0afF9lm4SOIN2mPfYA8X5fnPDmxhGkpxWQ1f00MmJSzAVZoXSa
 WV3gLnJpdtILdpBMTTFcYPrisnal4djOViK1BMpdvSUkQM1tEvUwjAB6hvowLoobxjrg9jnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=895 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090133

On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> On 5/8/25 9:26 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> On A663 (SA8775P) the value matches exactly.
>>>
>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>> turns out not to be a problem, as the bits that differ aren't even
>>> interpreted.
>>
>> This is definitely going to break userspace, because the kernel
>> doesn't expose the UBWC version, instead exposing just the swizzle and
>> userspace expects that it sets the right value for older UBWC versions
>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>> It looks like the data for SM6125 is just wrong.
> 
> Oh that's sad.. I'll drop this commit

Wait uh, we have this data in the common config.. why would it break
userspace?

Konrad

