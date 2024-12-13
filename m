Return-Path: <linux-arm-msm+bounces-42203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 369039F1B32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5B8188E80F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A6A1B4F1A;
	Fri, 13 Dec 2024 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFR9NtIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4B01F2C2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134283; cv=none; b=Y7IwbS6fGIUflRDIDybt2vbONEs2rf80X2EPqMCSaXs1ph9toLAbOlfwjVL5s1vMMsNYv/mnzyxI2sucsl9ldg8ZBgAU8CmQB0pHsIkeSc2tqu+EuIZxY9SMtzKKM3e+q6DRQ5zzaIXUE1tm6ltcJKwAvXdcQS85CAKQF5anfwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134283; c=relaxed/simple;
	bh=pDRIr3V4Ke+1ZHSEkU0Oe5jdjCVIe9x38Ah/rOfZMZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzsEfQBPT6kBmPtdE4SN9sckM2w3hBz9fFbGlhPOFUgCcOxG9A40zw1SkFN2YY34aP3aiZtSmNst4UfGP/tJv0wSYeB3jVpdnM+Q05JFENxtlY3FKOqtHwPS7xAQdY6IcR6/3wmFehUjmb5YHv5NyamtWaeMjtAiMSlKrFrtQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFR9NtIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDMolRn024294
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgJEpjhUpjinZzXlipmWXNty3sU1HuvMHZaSJG8B6Fw=; b=PFR9NtIEoxfANhHk
	tfYO6r/pVLkvkT73l8ANCIrlgBFzY2R/A21ZXmsP/LXk4rF5Bo3qnJXwkL1kthpf
	DOlUQ9WWquEHIfdFJMwnCjTWOqOgfhRSXT7ZS/bd6HDxOB1KXlHo2E7fzSqqcpTk
	TerEjNrU865ISQ63rPxAdSRPLwyLOSHxZcVtQAb7y1yRvFr+LEv7lW0boFMUDt7t
	GivRtqnRRo7GfEGj+ytpfYlC+dorZGC8XFZw43PBC5mT10GsL4G4l2it5c5x2pf9
	UH6rLSv3y8Iz6H87tih0UwfGSJEr4oy28iC3w8yW02oLh7AydJFhs+fdOejTPO6D
	ITq0pw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gm3s1m3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:58:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a0d7fb9fso3466631cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134280; x=1734739080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgJEpjhUpjinZzXlipmWXNty3sU1HuvMHZaSJG8B6Fw=;
        b=Ptl5CVxNYBTo/kUbsVW5mMV51d92kKlFP/tAQP4wpe4eEskHZAj7Xnjiy3ARBOkmUR
         F+Qyxb9Hi02fdrb+gaOJPey4QSsGj3UV3TdEsKhSlNtZ4rpXLt6XK7N9KV1mXaCvG1fC
         96OrWIOXpZJTCh56jN0AdwXMdQnYlT/c6p66e2uWgFDWMMx45JS0a0viJU2y0vt7LHNV
         pY8e7Lk63uJzHE2CRfr82IRtRhk+xbuaWu+Rft9Wbx/P58r6QUNTGsiTwfyUlgDcFOoc
         d5g6Hn/3SSMvPrMKl+p9M0LkHP2ebwDFE1o6vxrBcy8qm+8grEgiAncA41ilRW45ZtiW
         Hz7Q==
X-Gm-Message-State: AOJu0Yzm/cO1+H2Akw59O0nFaa5H4/BSjWiLA4KIWeXRgUiecBOeVQyK
	1J9e6yu+lJlbk8O+YEJHjXh8/KmUG3k+HoXQjQGtni3hMRUphQMMbWXtRR/X1hHll0RQ7Eu6GBI
	8AlH8EGbXb3ptwrVM0wlq/m/a1ZopelR2v5sANJZ/1g/VyljoC5HyDCq/70cB1Z7i
X-Gm-Gg: ASbGncuZDJv5E7iNg8POYEfAYf0Q2QXYQmr9LlIoQtrB04bneolyivibzOJjRZD+UvR
	zUFxoqxdONe4oqKnPzAgCT0Ma9BGsfV7BEizr5dkIiUIFlbRrBusqFsM/zgXztPRTSIHz0YzGj/
	9dc1e5Ye3nV4L4z3s0h7TUu1DebVbHTlUmewJry8b5aauiOQF0E2OZAHqY0XPP6lzgZIv3T3r94
	ofR/5+p28sBy+AJtZNr/8fh1nlFHt+3uLsVXWEh7ZKRPVSDH9eJp/ef/L4/Za4UPK9w/+w4tC9f
	rf/3IfFsWqSpfG97lTvyRqmmU2WVHjQeCWs=
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr33495521cf.6.1734134279948;
        Fri, 13 Dec 2024 15:57:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcInsrM80zY2XXRjWCmn/lWTNWUgTvmx+vLeVynOrPi+3UZMdf494lm9kqjgSOZLAPl8XB7w==
X-Received: by 2002:a05:622a:48f:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-467a575541bmr33495301cf.6.1734134279626;
        Fri, 13 Dec 2024 15:57:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f17sm26656566b.17.2024.12.13.15.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:57:58 -0800 (PST)
Message-ID: <abda0d4c-9094-43ee-a6f3-7eb4659d734f@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:57:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-13-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-13-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _YBQWyHSYDugsmi6hUnjlBY4ZdTOM7lQ
X-Proofpoint-GUID: _YBQWyHSYDugsmi6hUnjlBY4ZdTOM7lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=821 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130171

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for gpu and panel.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

