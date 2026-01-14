Return-Path: <linux-arm-msm+bounces-88977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5BD1D98C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B55AF301F022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98743389451;
	Wed, 14 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIR3aNnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYLEoJ6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E42D5923
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383481; cv=none; b=l5vniNLO3Y6w/abuFw/hKTTD9pDv92XX4qURFyr8XHC62ufvA5slFew4dREK5hzpddnweP/naRLkrZVQmIfldwSktt5MVb5CyEMDWXTW8PfQ/INqqbUbfSzFJm5v6lQC69np+3JKEja805Sj9LrN1rNDskKEy0XDs9aQa4nSECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383481; c=relaxed/simple;
	bh=Q3JGsxGqTxa+quR/k2suvxodmwTgProYPmNagDneJYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMAvHJ9hTvfuTdPCpvXQtncL81khubixcDFBxrhJL6xM2Qi8HT5TR0jJyb4zWbY7wrbk9FJIlZ1kEkr15WSBliPgPRgVt7tyjyJvSK27ZwVk/ZCQTt+m041GJQpB8ymW29AQ/xmxasOU7CwYzPQssVUWKJGQ+lYoPU8DH35mTZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIR3aNnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYLEoJ6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j4NW3270888
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=; b=ZIR3aNnGGldnQyYj
	UhaMs10N5GTIacsoOSvFIWOeLuRRwZ5lobaveKIaeJqCzbLnTbjlFbEnlU2937KW
	0YqvSPUNXI9VDRqIFskq+hODjYuz/Pg79uq6nLJae8XoAxJmyBo84agJAN+fZSEv
	Jg4J27UNoujc8JxEC0JkAOnJXhnBqMnXG5sGh0khnD5AUy6AEAnXFSJBpjJqpNxH
	IE8I5ccvOt4NcHW7BNECeGDM9cUwz8PEEKi6QL/X7ypTLNF6fVQNDpe1B72KbrQG
	ZDTojSWdrqhF3TEmt2bw/W+4FQb47Bm8usqHOPq/sWjccDAxe0Nvwx+LaqrHU0Xm
	U3uedQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v3741-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:37:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a262380deso19469506d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383478; x=1768988278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
        b=LYLEoJ6W1Zga9eDRzkzQFVws0A0D89mZZb7FNR8UFvv03ZnQM4DhSuGyRFQJQGiReG
         389fy5MdYiFc794pzu/N2q5JJH8Ztlls+h9c/l1/5gL2jMJBHj/yG++3QhiWB81dVAg7
         qBJDs+tPdjfnvaO7t7aarHeV/orBTRGeHVoRtsx8A1xsDBVLEoa5eQ1sAYkEQvYIAlLY
         Llt/Yl1mP0eC1tf49iQ5/kcAHJekvS0CjlROIVNHvgKeU6bvmi8D43QszZqi2VG8zGtT
         /RqPmioXI55xpPKhnnvaPKIkOE1A3M0/QB+SY8x7YTBs8ZlIqsEl4/GyYdFbYD2xQKsk
         XuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383478; x=1768988278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
        b=VVWDQCjG6UTDc4SeDOB9emAFln107Rywps50GsMGtzdd7e+8ueGHita0iCSbwO8P7E
         iK+hbYSyzSls4WhnE+IBZc2BuO09s2EO3uvpLDzzoidXhxMMFJ5FON4lbDtRJKaTQnCI
         N/QAW8vrCWo8QkLLJvA9lS/t0KNVaq2ISBwqi6oB5ki+rtvjN6w1U6x7grqRVxpdBu2e
         bA7PU9tBRadnKokpNp45yrNM2o61t1azLoJARlQpb4kkODVBRpyE6LRzkfVWsLJVdiLi
         Zuh6tE8/wUuwvcrV3CR3QGMZAHWySnRRJIVMh3StTb4N7PkKbe7Gi9hiWRCIh/VGCBGC
         dP9A==
X-Gm-Message-State: AOJu0Yxm89NZ3e0QzhbFxD2Hwz+qvlaKtKnfUr1+gZWNIvbUuWTXE5nE
	9QF3dWdbznPJWd+T0YAhAoISLgn8qenrgBtMlEB6WcF1c3mNDE+KEWE2gmViE6UVn16nNas5Sa+
	IeJB5Ebjf879kOK+KSzUJohRCVQ5OJZe5McGjvzAlu15DNoFzaDmdy71YunYWbLJ9oyso
X-Gm-Gg: AY/fxX4+yZPVL4sAwYtBFNemsS1yv+xmq4iakBaritK9OXBqLQKqlJfpU/DdJiScmjc
	k3hrbRdAJ0L1MWDmgwIwubUoab2weQtAJ4NcpJOKxfpR9WViS2UNBv3TNtnLtwupW5ng2f7pO8P
	+TdBqSbLgja+07H+1zqiVW5eIyVUdZEXYpZKU+UAJ9oQVKMSQcDKc0Om5yr8E+JUrZl/G4yAZx2
	6Nzb2LIYpd8mYCDsXkHEqsq4TdDDjftMPNNXxPWYDojl79zPlITTlEeXqtrFjgkNkijHMgC7VLa
	fpAphPqR7jF7iOs5taLFbFCQ61jy4a2CrU2RDRO8rD94NDvmbEH8yZVjiP6LPTK6Zm9431NUckE
	TWkTv8yGNEARFvVfz9aZFZIi05vdFQacNQSAnMZLfThCPpBkMY1JNy+q0m6OoMmHw6Ws=
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-5014816e52emr21627211cf.0.1768383478304;
        Wed, 14 Jan 2026 01:37:58 -0800 (PST)
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-5014816e52emr21626971cf.0.1768383477873;
        Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm22240499a12.5.2026.01.14.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Message-ID: <44d2ba08-e760-4f7d-bd87-6ef3a5415ebb@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:37:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc
 length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=696763f6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4J1ihs_Kgnsqm2W37X4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xppL-qLNKeZ29BYDEAUPY3QVnQnxS3fD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX5RVGIR/SsHlg
 jUmEwtkHQOtfXJ4AYkxeqG8DkGi6oKbEYhnDw8FZfaqq9xqB0PLfwMQ9EP6kXO5U2/hpYSMSUHV
 cdphFPffVEVJmCDVBE0pdyC7vSXWRIWJW5sJXo5ZIBCYrIUy36ZbL+7JurOHIZmkFW2Q36ud7fd
 2S4I41U6h+0a04yTpW+0vHE+ai2LEuOLqorgJ6PMYBI5W7fmiQrD736r2oXJlYVp7sm4M5SI6gu
 3IgUqbYornIkUEA8grnKyMRsvNqRActiAc0H0PWB7z78EbdR27+Mn8Ut2yh4KBkhK1IB/gJ5pmU
 oNhtjyNkwktNSVKWKmdtktJgfpkBXW4dE2DfWLyIoR0/r3gRV8anwYB3zfjfJ0J7rWj41Z5pZed
 WYi2g8rl3o11V0ZkXPHwA1m7hnPjCa+GSLVnXFQGqXsSemY76Xg8e84CFb/sHJTuzMeybZVQUJt
 0G9PpQoHSZ3gaC/5yWg==
X-Proofpoint-GUID: xppL-qLNKeZ29BYDEAUPY3QVnQnxS3fD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


