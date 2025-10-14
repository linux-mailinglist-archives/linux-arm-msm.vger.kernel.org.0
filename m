Return-Path: <linux-arm-msm+bounces-77112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A874BBD82C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50E34024CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169D230F937;
	Tue, 14 Oct 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9OR36hs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345A1EEA5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430427; cv=none; b=VGvAowHvi6L7/0vzipGzJGMyGglNqhICUIFWNtyvn4AViF4CL2VjlvzRbWBJdhwnVO5vXH45Q7qpa/hynO+EK81C9EESzpA5Wd0rsrQk9po6tXqktE51B0hy8LjsPj5rd2TmlwdYQb1Cvb2nyCUJSe5bEzcedDnQDQgJWpcQ3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430427; c=relaxed/simple;
	bh=zhENmhH3oy7RShG9QBZrzQNtTLxA/XmZK49J+bjpgTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9LI57cPVriurc24gmLvpCMLBsnOtMoyJ6UONZEZ3V9cy2W9NIYfHFeDAhN02HZJnzqmK/mqEC4DF0Qj5n9KDJvBLSoTey7e9raVKy2Mt2m/XjV8iZm4cloXOrw6jssvKZEBGDcuEDtDCE67HzcuYvQzGIsFykrlA6gA/a1co4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9OR36hs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87OX8021163
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qa3kMVrA3jwHDRk9FAb36hjIZ7uv03YTpTJqYiDTaS0=; b=m9OR36hsRo1U6nAY
	vkOtdwzv+w1hhFUAEgBXdYmAJgzVQeOhvFysq3qlDmLY1gQI+egzWeU8VJtOsyjr
	4bTj7BI+BUu29ToFyb9ErTg97W0me9hBBjlXpsGIT0yBFFa1L8gYDY2r9hHL/FTw
	kO/9IRMWwHSbZul1tUBoo6BZpw5mHmxmTl7HB2tD0Bh6tSWZJfAQLxXSl7XNOCC+
	z4SQXMR8jrB1pHUhMW5apbGCh0p7pWQV44033i3bO3r+n8oUSepsDjCr/TDCD6+0
	srDDxbNE07oIOHj6J06HMOIKmn3Twa1B7CDCDpgsOugjD+Kux4DJMUlIs4Yc3m93
	gxRqjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwj10v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4114so6799288a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430424; x=1761035224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qa3kMVrA3jwHDRk9FAb36hjIZ7uv03YTpTJqYiDTaS0=;
        b=mrNm4k6vmPk34we4/SjdGAfKy8xkN6DnEKZ8/C2eNYgHYmYMS+bHWKPBiPjY8b/k6D
         JQ5t0sHtDhhBBEzXyV/1Iq6kIrRYyEmu+31KMvMboeaANAit2CO5WNzfXRASBLPsNrR3
         Va2OrHDqXxVcsu0U3Esd+0OLNIs3hhfq6o5aUCeyyteySVrXGjQBDle9/BLhnHWLdsyt
         gU2siPiH7sotiniXygiTNBuKokEkszITJ9rnXVJBQShqmw9qIhzsGy9brBGTvMgdQOPU
         6ff7OEVLfjTufMQd8manKUVJZEpHIz2zHRf7qMkLwrIeqaOa+dxH/RY8/tWsnzmFl7SC
         NQug==
X-Forwarded-Encrypted: i=1; AJvYcCWDbGXTwGuQl7VdWEe2xgHpOCVYV39jJkMWTJbcD1JFXjHhBch401OGmtsTxTPyLRWgkGql+2Au6X/q52Ur@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrYqF6mEYiWP8Vk0N+4vsiMpDa51YItKNYU0prUvER6vU/Vh8
	TdA20vFqp6Y2/QhKiKdyPyA1FBpIy6zEsZ0YiiU7VGiSuVpW2bSXd+LT9+1bwwaBsz6NA5gSp1v
	GZ3MPDUkGqJnfYYlvJqEr0mZuofRTKxluDbT0FymIrfhrevol6Qavx8IcGA/keKvbgGxw
X-Gm-Gg: ASbGncvkPZcCjlb+ag/wEalVYZ5YGS0RrnB4YgjB/iX1FMyH+ZASGYa3Hg/s3Dah6bq
	FUmPkMq0FRwQx4P/YIMuSYl5GMB3r3LRh4rsCsn9j9xx3IyGzK55ilaPyVzRgB+uILQ6bzzTpdg
	vqnn8pqp0eZVdUPRZ1JvMU9E11OPql0s3RPM8VpojanZ+jEsChGzCOxwk5CInKYHDFj5opEfYiu
	9BoE/OINZl4yZyhFBMnLRT28GCD5HV2VFBIHFjELXZktojtMgaWkouoFX02f3i/Yn5PH4CX4W/q
	cRElylHJTOFjU8a+ldCYKefPUkttFjE3kGTyJ4zI+g3Cz2TNOVT36nbbT1kjzDuJXxtUZ590
X-Received: by 2002:a17:903:1a06:b0:283:c950:a783 with SMTP id d9443c01a7336-2902741e42amr304903195ad.56.1760430423992;
        Tue, 14 Oct 2025 01:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4KymEWCSSL1ak5fq4W5DDDtZLlkwKkmzNqt1us62ZLuLQRemec+bHRpZJs5pwhQbNJYVfgQ==
X-Received: by 2002:a17:903:1a06:b0:283:c950:a783 with SMTP id d9443c01a7336-2902741e42amr304902915ad.56.1760430423564;
        Tue, 14 Oct 2025 01:27:03 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08d0fsm157151475ad.63.2025.10.14.01.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:27:02 -0700 (PDT)
Message-ID: <e68e3ef4-548b-f487-2f6c-6976b56ff4f6@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:56:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/8] media: iris: turn platform caps into constants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-1-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-1-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxs44Gt7/E2Dk
 WiUwSI7WKY0v3FJtQSQdLXZFRugQwoMyjNw4R0p7f/Z11+P5fSt1TX0Sctu8sO6MLwL5RL9URco
 76KVEkKiuhpighXyPG01GX6nKLPy3tF7W3OoMWfktpSyLuNDnKTDdZV3Nhr3nwxBI7reWYVxWDr
 wLPpbAMPnozjym56bV13ggmlb2Huok2VwieeqtOzINyqKSnCGRKzgZ8p3rTbgzWL7rX9AtQppjL
 VJweWm4dmu0VGodiTTVQQPvIN8/EHugPS6ZYVt53SCesUMK9tBO8KJSTxyjCn3G3NGcFSfamHKG
 8WOzSmQHohWQcydS8GOU/7HtnpW1F9BcfVkab8J8eEqbZNB4vVl0z+VuOEUp3aiAV6JfezH/prB
 13EMpCzJBPHhNUjZHHe3ObtLU+sbGA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee0958 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5Kv_vQZlazJxXpBqwIAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zdx5DAmrusZl0xmdGWmZzjd3TYyjgikr
X-Proofpoint-ORIG-GUID: zdx5DAmrusZl0xmdGWmZzjd3TYyjgikr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Make all struct platform_inst_fw_cap instances constant, they are not
> modified at runtime.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h  | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

