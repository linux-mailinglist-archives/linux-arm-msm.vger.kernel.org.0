Return-Path: <linux-arm-msm+bounces-39896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0659E0643
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9F516DB8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1FB205E1C;
	Mon,  2 Dec 2024 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1MTDluf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3782036FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150350; cv=none; b=hkACQZ7v0CltQEGUQ8HKyEH5/KImTw8AhlJ4B4YETh8DADw1GRnIN8BmYmgDIZRL3SbAumCviEYhmS9gLYGeXYZupYANm2mKX5Py4BmXBJRuiOTy43FsO6QosSWn02r8aLVu+iWV0iXTJZpJUCLnjnwt3BL3D3UU3S8XJy2Fi3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150350; c=relaxed/simple;
	bh=+NEcIZJgE7LLyCMgGbIR/QVszr+XGpIZ7fL//kOnjnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpdhkERE/orHj/b9Jjwddv8LxKGYhJqg1eP1uUoCoructgky4FLisI6jTKVDYq/Xfp8A8I1C/t2zqn4IFWzaLjdgd/GEyfHd3O+BCLf8VVTXmIbFriPU7nSw433/fsKY/s6W+Bk9DLJbJoyvtOgTE1Sbibolc0oUn7/vELbOU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1MTDluf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B295ofC027880
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6AHa+2hrNPXyHkYqMwv/F89CPs7fpLf/SFfF1BRFFI=; b=K1MTDlufvtvpJQmr
	OimYmvMcwTVI4zv5B+SND0p/IMTank1OPXf498JGJbQBrQ7Gne8DOSz0P4u39mCy
	Pv9tWOjALOS1a76F6HrM/7AJvOGrcOTcy7Jthl5qYlcVUshUyYcTzK2ZddmKnKt3
	Sbk5zWfCRDAS4RdDLXYPfNkIq7v1CwjObQluZIPrbo1JhjjNB2vNdxC8Gdur5n2J
	i7jts3cbkgEo9f2WmjP7+v9Pm9KYFgZZFRAur8dQ6yZrURcjhIP4ZB7MQmXFjUyM
	MlJS+1xS0U+x3U/5nwiNDpWTvfgIv6v584s1TeZ54vHAl4dDLxmfKeJpHw8u+mQx
	ZL7JlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstd3nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 14:39:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668f2d0e50so6425331cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150347; x=1733755147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6AHa+2hrNPXyHkYqMwv/F89CPs7fpLf/SFfF1BRFFI=;
        b=KnZTU/hU9jmU8CpfuLLUZhmg96/ocBSbZlMz6S7AIEvLGSV48muQY3TeY8c24jJrwN
         dKJ6XByvxg5H+a89EUrawfmRtd1SW7t8awHwTxtc79L4zY/A/6mP6InS+9csi+tqblEi
         7OCZL+oaLMoC2gYyt4sp513OUh3hjNtHFUmO3N7m/t6v8w8TZ1+krPZhgPvaHj+HB4FS
         8zPOqICKy9gjGx/+umLyZ8rg+qjNOXbz0+8IanN5o7MR/qjwfg6jU++xWFZX/Xr0OT2q
         VaaZ0D5Lc24leoRGQJiqe8nRJ/rHQN3Jp9TohVqzCnDeWsShcHdOTPhd7YSVsJNp3UVS
         yXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZkHX9Ej2ZyDLBCc5vC6o5cDMMw8W06ecvlYFHTLAD/e2bMOCdytWN+uW3rXmEEuI9ABVggcn/nyfymiX@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkT2rHQTq25h2g4zXcOWdzaa3OuTexYh0tpN67ENB2TcG2JZ4
	HWIvlCzsGhwjXyRxR7MMo806wf0erh5XKpU3acGkwl1b4ZrXKZpapQS5ZxMNfz4nL5uGMQXxTyz
	uCtO7QI/q76fexelAmrZ41aVQrumxR2VFkqWcMogbUWOUiGBYIxtalV8O/vdg0Ahv
X-Gm-Gg: ASbGncuQu0+TMeHG/EHslaT8n4vOpDyp29MN35tVzTbQLmwgVzCSHZH+X5Of5iH0zoi
	u60PVkO+p7F04lbbBVE71WVt/KlbnGOHC5r4lc0+oZxxFu4oJ7ZtPF57oOsCKzPXmsiEsLUzY42
	Isc4IKZtDTk6bvdreF5ooFBRSo3dZBQgVth9UB6lIMt6TC8OQPZM8ukAgrVBmBhRd0GRUa9LhGL
	oBDYssgdgD47Lp56Nrd1fBtCJlSHgYtqvzSwpWt9PY4EnVTI7qlZheU0aMMq/Uy8cxXYo1ZvRR9
	TZllT3J/HBVZpAnztnUbhff848i18zE=
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id d75a77b69052e-466b365e8d0mr166007341cf.15.1733150347059;
        Mon, 02 Dec 2024 06:39:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRWwFbKz7t/fucB4yBe2bX2YgC+0oLMQnDi8dNTq6P8UMCq+YzXzq+ExBumA4HfzOz/BTPFQ==
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id d75a77b69052e-466b365e8d0mr166007091cf.15.1733150346436;
        Mon, 02 Dec 2024 06:39:06 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996de7fdsm514344466b.54.2024.12.02.06.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:39:06 -0800 (PST)
Message-ID: <d8e1c1d0-a375-4944-aada-2bbd6a4739ff@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8550: correct MDSS
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        stable@kernel.org
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
 <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6WqqmjtpUpvTPaPe4FYVeUb4vGzHGkbU
X-Proofpoint-GUID: 6WqqmjtpUpvTPaPe4FYVeUb4vGzHGkbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=751 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020126

On 26.10.2024 7:59 PM, Dmitry Baryshkov wrote:
> SM8550 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> Drop the second path and use direct MDP-EBI path for mdp0-mem until we
> support separate MDP-LLCC and LLCC-EBI paths.
> 
> Fixes: d7da51db5b81 ("arm64: dts: qcom: sm8550: add display hardware devices")
> Cc: stable@kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Feel free to use QCOM_ICC_TAG_ALWAYS, for both patches:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

