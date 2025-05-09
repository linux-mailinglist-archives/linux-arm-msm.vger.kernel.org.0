Return-Path: <linux-arm-msm+bounces-57437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368ADAB14F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43AC5188D149
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B546295DAA;
	Fri,  9 May 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWHmYOaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB2296169
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796671; cv=none; b=ZCMGG6nGJHQdaZSpamBKdZrF+XZ1j3RRSlwq8c7Q99IGrjcAT9DN9/evdiwBuruwjRrrlB3qSb3jCvVykqqvrOiEHM3l6SVy1tp+Nrd9/7eQKvQ5LdCFMXdc/kmftExct2DBRz4Oz2yPazIVGJxwSGUHsAVwTCqrcIW0rUkN9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796671; c=relaxed/simple;
	bh=26bgPGM+XWHNh3zKWLPJuWSdDtdYX/ImWKydHaNQSZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rP42WuAIrgtD0PJTGZwRyfQMu7OxAFGTG5hE7UMDSanJhLagSjNXi7O/MjCSF7etFHMM2AUrZ3/WlEp8BssIuOpyV8+IaBJxLx3UC7feRWKz3pbUCocmehVQtNxLJDi+sHSB0ccQbIDrM09kZl+xsDczMaXzILnAKrZ/JQPqw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWHmYOaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BmAew010670
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=; b=lWHmYOaDVOS64iQx
	gAimpzphqGRZjeVZBWY4fj/6W2tWL3efI9HtoYbq1lVhmARYW/pB1HLANoqVpYnn
	AtCEvEQnViELvI1v7t3y/astKCB2e+3OO6fSjgs8SDIrHx3S+yVC4iJGLWMp9Uuw
	647S1BnuCRvVuBAHlb3Wo5ElUmdxM5xvOsFxt4HcJhTnHN6OhK3OR2vBFfH5ZlAt
	nun+a2aOBAhFd05k3wvSNsq/u9ylOrkC0bm8ck/Rswd6sucP7oojzFG6XsXInOhq
	BdTM+3SzEf3u4sn6q3slL0T8a3Ly2czqt5C8ZPj5JE0CK6UNJlnBgGoLigmUQw/S
	EZ+Jew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmms1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 13:17:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae9ed8511so4628381cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 06:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796667; x=1747401467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=;
        b=DScFO9XVD12lg+ZSJnk4E5JFPMRfjI4V6ibLnsAzdJbbqYaMRKlvzvOjUzm830vt9Y
         OEl2rDnD0kKAyfCl6LDkLUFahBM+nFcyre/jSRwfx9/vbvftrW5v9EF8psfjFaUexYlF
         iyceUjTjPo1HMvwOnNo1TSYNz7kcbGdpfdVn3qrjDpnSkiGG4WPH+A3mx82uH6fRLaDW
         hHgxGThxNvfa8zTgWOcj85qQRNXue5KbfX/awkKavyrFYpn2ajbdtkMTTutbv+PyjOTf
         p0rYxfiT5vMg/hBR2t4R/mADG0mknP2Zs2+ipQ9VJS9Djzw/Cvp8trHSsnmvp1/BKUCq
         pNrg==
X-Forwarded-Encrypted: i=1; AJvYcCVuVZwsash9P9lPm0IGF+dR1hEglKqujL0R2hS/Vh7+vFBrgubCTWyMaaymSgrdQziCVfSvpcvy2CYhNJaa@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNG79nMBNwB0WHPCjVY8CaXFI6rbuA8Js69a8kqtJU868AD8O
	eOKGtyLoHUVd8kpzkG7iaUDdqobpoL0oDffZgU9sgqmrg3yg4UlbdMAuDV42LPLmyecEhyhA1VB
	sGhBYmM8V07OFJ9KvzORd9dM1mgfioMv941PP5jyuh5rySYNKE57NTYnJ/p2JOSKQ
X-Gm-Gg: ASbGnct0pkiQvsWUXb89HhhmBLx0U/eNsrSFFqyhHvOfUap4b/NTkcC4ts2KlE/I72Y
	FPgXf4MfE2D3O4d/SBtNYXAr/FOn2H0ZDrVwL29SDUp6RexJD4FYEKuzGk0bANE/K/OwnSR/yTZ
	YDIyhu69nnr7eQAk/ATJx/feBobQQ3iDz1I6fe0CMb2YnFDmgbWMZsm/OOcYT7Igr6qnRN09snT
	VHErvnHtKSiqejRP6C/l6aMTO7ajfNJUng2Ewf5nNeoUOvpPVDxc356XkfnSEO/06P6Te8M6tj8
	Ioaz8hsbrzGHlFxLdrwSd1bJQ7jYrzYD77CyBxRF3P3n3lXHiNieLbCLVTjHSLKFAmY=
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd010d4ea3mr193943085a.3.1746796667396;
        Fri, 09 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+qsfdtZ6DmZdlZShEv27vJFf9u9wNMnx8fyO0XHAbQLPHn8efyDQhYxt7i9+0FpxG4WsvJA==
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd010d4ea3mr193940885a.3.1746796666870;
        Fri, 09 May 2025 06:17:46 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4c83sm1414304a12.8.2025.05.09.06.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:17:46 -0700 (PDT)
Message-ID: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:17:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e007c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Olu6NZbg64VfH8RIhVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GiWbNozccIyBzeOUM7PbR3hq57MDE11C
X-Proofpoint-GUID: GiWbNozccIyBzeOUM7PbR3hq57MDE11C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMCBTYWx0ZWRfXwYx6R3q9Kyth
 ybif6+Z6aLjcwEMLk7ly9d1hF3Grtk5AjhTrHGMdinc5w/s+W7fH14fVd6cOR24l/EDuWwtZJrJ
 9nd+nvdes5BDrfgp/m1prJLDKpwEWb1Ba9+V83TxjJpfvoY3Gn+VpZPxP2+8yHOhWAi65z8Yc3h
 CWhLvgdsbqhEKbqdWVA6X/PcmzZ1YU8G5uphtDTwYDJSrPNB8ye07D/3b3ryFGpIHORhUOz/OdN
 BLP0yVpMLn3JPLe44kt5XwNrYNfvhAY7M42Y3DhHcgz4edfBCWaGheLI88GSf1Zvx+VHxUdoQGF
 SLLEpJzmSQKICqJ7Tqvp1Fb46YK/a0aD0Q9REKqG3IzbMIrEp90WRhgskIeuTWOputiJ4AZlVGe
 mC/I6pAotISPfsSuiEFFhmgofTtfcO825r6jc9cz82TqrY9U3Qd6+oTylEgZQ4muEYwU1X2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=899 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090130

On 5/8/25 9:26 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> This is definitely going to break userspace, because the kernel
> doesn't expose the UBWC version, instead exposing just the swizzle and
> userspace expects that it sets the right value for older UBWC versions
> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> It looks like the data for SM6125 is just wrong.

Oh that's sad.. I'll drop this commit

Konrad

