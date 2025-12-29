Return-Path: <linux-arm-msm+bounces-86845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1715CE6C96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1112730206B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF90F315D39;
	Mon, 29 Dec 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7HY5ZZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+4LuN0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A031577B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012464; cv=none; b=HZvaVhMP4YTQ3pPvBnEdpaUOr6BubGm0B3f+xjfUWRf+xrBu+2xZK76EJOQK8q0+Ph682StVPu7tKDHlNe2eF1nUd8k6EX0qO+sdiDKXA2i61ylPaI3MhhEW7AmsQJlMHbiOSEdehg1y571GTfH1y/0Zy/yCDbm+CJmXka1k6XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012464; c=relaxed/simple;
	bh=VlAl5tzPB4LhyV5yyQtofiDM0ZUbfNOBV4VLAcaIUZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2cKGr7RyilvvHA+bhZerhLEhGbxuPhRQl1gDKexU3bBQfbTUCV7Ws9MI5QpBx8MMt19v67BC50rZwZgC9KBX9u2ElxTWP8IxvWKeAHD86Kp9DyCPV+VSl2/MxgYYSXNDYh0Wvblj5HKTWVIIQlLAcjef24dgBQomihN0H9WDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7HY5ZZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+4LuN0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAXNwH3718751
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=; b=i7HY5ZZcTyXTIXKp
	k5rwtPoup9j3d7prC3HZI1RxqebGuUlfHSWPE+DpIrAuEoRvvL9eZs8Azku25N10
	kHIwt59ZYfSz3pldnjYZCgUAiwTMq5NIMQex2NZtqlKzI2n+sjl9VCZZcFy8J5u/
	4ifLZLnQb2hcUeN1zyFhzz9grMJm/BhSb9wYC3YhfJM2YDrGC3WoRndunEQBJIvD
	t38O6ytQhOGyDHKr+JwEoEbqkc+M0CHOdu7DlIdRlyFPxoObTwb/+7M5smj21Gz0
	zGfXjfltypW0kNPJxm87/q2WLA1L3+S9sMdoQd6oxD6Mp5nkeKtKiTb8ush05Zzx
	DMe+Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4crd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:47:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so24701001cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012462; x=1767617262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
        b=X+4LuN0HsFw3AK8xgPc/nKpZ528IhPGo8AfblW/KeKHAFMzNICstF3yZkSEN00456z
         J8vj3Vm3FM2oDZ7ldAHUFI/QDazVz4P70pTzlyMiMBSJNA4ewB/Lrc9OsaFkOzZlsqxU
         IeUL5DaVUyAiVVC1cES6RACIjc7AUqmacWmLRgItTu9vTz3sF9hqbaCmT19QWgbXlGzS
         WGIFT7s2e5dVn/2zXn/aKtSgGuJJr1iVoqV3QLLKuxzUroaRW5nrqRUDx0m32TQCYghV
         7WBoRF7ao8NTsi6CY9SCdO4avf+xaPROO81II4rv0FaKkKIdeoRKgmtvRz82ZuuGqZds
         TKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012462; x=1767617262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
        b=JVIrN27LEzUJ3B0GNg9+xpb1cyDTQhRPhHVgjT7Tm595LwdtrrkoJ+RlDFObFSY7Wu
         39mvD0nrvXBe5I+f2U7Hbhv1UX0WlB6IdFG0R7EVC1KYM+8DJWl3/aAegjlLBQxHDbeY
         zwfVy39+lvOXT/1tg7yJgG999zcILDPVE71EGYqnnXCii6Go4hSntSZ8ZcQGNqeNagoV
         gJCo8GDHzqS84Km6/4Tuc26IU4gZFSio2aK/PigoFe98NvjmJhM36s4sqEWpb9tCNJCI
         UiEtmIw2fuZh3/8wElg/rm4YmqHUVVrO4qE+/utRHC8Z8huXQL9UMSfQWV8+ek5OWTpX
         l9og==
X-Forwarded-Encrypted: i=1; AJvYcCWvNQdqlOgrH/L+7DZCqVRJsA7UjePceIB1OMH+IUPBBaLFwxDJ4+HEFMlMEUTiJThGUE2E6cVCJ4X0fXPf@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSloirlhD57qo7Ypfzvu8M1l1rnSW/jHIKmLOy3cFpB3x1ErX
	lHq5TBQxJ9FeyJCaUONNLkEqx9vhO8xz8D7K92JxwoU1+emYeAxkhuJ4KXNGHVvSrH9Pb+ZMqnW
	sZcbvUMRsk9R7/mIlP1ebbkulmFL4JmSzjiGw4AWV3XVtcU1qhk9zIYGPg2MEpnWqpZZ1
X-Gm-Gg: AY/fxX6rF8B1hbjY5CBIuZr9SY4E5kn6KpCGiT9GxiE/6pZ4qxxE6vmBkF9IR9g5w2L
	WpTdZjhawwse65mbpr6wfySmI8M8PTJjDW76VIKVLQQwVVOe4wzvEoCXvVNBF3dWOzALzhgs7s6
	JxzfP4hVB94iC71NwEkjfuzd9T38KfxLMVt5RhMRhpsvk3kcLonVccnKB0sokBbT/gNXmwxMLcn
	8xgEcoNr+pXwrm4vzjeJq1Adr0YH3N0P1mX4WJWUGXixrsW+pseosIUAgOr5RkxEUrx5LaytzdQ
	n0Y4u2cv+xGQ+/14i2INyeQAOd64h9MlvDQk42D/bPBPw58uUhBZvVkHCTndMJRmJzom8jHEnSj
	wivgD0LUc+8hy1EpPGv5iEMSF8XcAHI8Ly/FzAK+qsYXqKcrM3M6udvpeGCYvG0tsjQ==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f4b43e96d2mr289064431cf.6.1767012461678;
        Mon, 29 Dec 2025 04:47:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7fDCqvroWd8Ztt8XruIl7fotzA85y+lW2vZ/2NRrAM1IGqRpECNpULXx3B51GqsYodvmMpg==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f4b43e96d2mr289064191cf.6.1767012461223;
        Mon, 29 Dec 2025 04:47:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3309954166b.24.2025.12.29.04.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:47:40 -0800 (PST)
Message-ID: <05f47e46-eee2-43e4-bc9b-4e3b3268dfb0@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:47:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lmyIXd6pYkznXeIxQzV0ihoteGyAHjJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfXysTOrKHZk0Gn
 5sPsl7umDw2xf83SynEI6CzKZhTigYAWFm6w5rVLhzO+YQoBIwF9azKBcKmtBzKADo1ATfldYZB
 gWAqF9eNL7eifomCtLtkLx17ZYbFMU07fNI1EeH/682TxwvweoK4zSXf9JdZJGcDUWAtq3GpzU5
 LImclWWNIXdzyOfBnpAmkPiP0NAn9SkUSlDg4gn48GLzKXiH2Rv+qcqRI/JTEnevxGjbKDv3vuF
 Pfb+eEnq+UPRQPfGxWSD3rXp1U7cO9X1I4+4hiypFhTqvyVZbk3SLvxeVekUCQVLtVkOh4TLXkH
 kfN5SEcVPvEgh7bRgPclKXp+2Gv5CfL0z6E7+D7OP5jMYu/pYjrLs50WOHu/OstpOVTscedxa5P
 I00VLvE7Pbb0c5JSfiFIiS5rFmG0eENJBGjYPvAe2dsTSxqJZX860JJ/SKqxI6pxjUdREmsjHWv
 bm1Y8JCLQFDwq2TaLNg==
X-Proofpoint-ORIG-GUID: lmyIXd6pYkznXeIxQzV0ihoteGyAHjJJ
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6952786e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JdhzuzQUjDh6MeSUppIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290119

On 12/26/25 7:29 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for Talos chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

