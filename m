Return-Path: <linux-arm-msm+bounces-49305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8EA44048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7DB17E27E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343672690ED;
	Tue, 25 Feb 2025 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H65x+jn1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2E268FE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488986; cv=none; b=GNEhHeqannFcO/JZlgMix3gPDk8skrtZL7O4RlzsltDddBZFGUJfg88NTdl3ko/bfF2k9Fi80q8PHiYQ5uPgbNHF5rsQl0N1lmqsU5zwiSWqxL21VGNZcbng5zSjoXMnsxIAGZUgHZ1QX14XyzWz4I3cxxgz9LSlf3qwDU+ZFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488986; c=relaxed/simple;
	bh=s9Gi53PmVOqxw7AnIxREx7dHjZ0HbHTPvpQ+a0nltag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCJgtnhGhWZtjLbftU7sZvj3pfboaNRnPJdlaTlnvAb6uPIDqb5MKsGrKCJMIoOJhNSoQeo0Nr3uubhigtwaZj2/33ct0Czq2W0Ni8DRzZl7VzDOxa2imeN1KBn1/Zxe+r800Yv2b2BCFImi4nImdB9YkJZXF5zF2iW/YOJyiM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H65x+jn1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8ZIxY031164
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=; b=H65x+jn1hBliDPdj
	VMZE5Dh0TVa72wVR+siWa9hQLAeXnZxWpdn51hKjD4fkkGTqWP3V1hjR/ES07liH
	apMwOKugawG1GL59ioQSavLP2OhL+touePl7kqF+kjAERTYEO9qHEiIbnQhYpHqv
	FSnZfTWXuEL0gToLFevA+MYm6iRgsNmuw0gpY0Z9Ohpb3T09CiNa9wPD63q4D3Y3
	1G1q10FzYJDfHNuUYiudBUH+mtrZaWqNBcLlingxk1A9hoq/b0PCENHKJjdf6XDx
	rArHYMT/GCg6bcfeB6OzxTgb98HKxQvOG2CRaZqyBeAOQUvUgFSCIKucLh1Dedek
	R/ur4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu0y4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:09:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0c491f065so129227485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740488979; x=1741093779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=;
        b=AA6cbajBRnjhffcky/Oq40a4CfZktqL/5EvuSrtjZEPmereUaleWEujBV5SQAm4VZd
         K5/xPFp17E5v3hqSlQNqhv2TBmjUSk2wyREecBZvBROE1mqhMcvnO9RRoRaO+NtNpssp
         UoPl/NGEL22PUDVnPHQuntMVR9cLJLIi3l+RqInPH4FldTJnRZm7iBvn7h3u+KLPxgPM
         GFbt7k+snfupCM9Vh3D+cWRacWCUhg+I7/adjhS64exnpsefUfnDLk6YZeJlRnCyEtMm
         pajcVACoDXdRP/hO4qRQztZ9MrJG3ugml5+yre8xLa9qc1c27C6fDgA9Pheu+Dz3ppzB
         bVGA==
X-Forwarded-Encrypted: i=1; AJvYcCUK8Q+XGt5IL0lz9IWOCm1o0w2IYe6WEdbjbik1J3Rvjt6Rax7edo+LYM/HreU//t75PvMap4LQ4LvPRN2d@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZ/+U7TdmPwW8KQPAWKmRuUcRhaN6FX/0DpIM2scxDCAMlZiW
	OF6UAFPsmo43v7psJPsfNUPO3kgsBVI3FtnqmFysJQnlgmP671iGv8U3JweAca667X+JldG1A/K
	FbObBuyYj4ey6198J/hp2VB+uCLu9XY+CB4eNpbEOT6bJjh2IDkIZgUTRbSnNYYHA
X-Gm-Gg: ASbGncuhxpN5b0rjS3LNGs2GZj2S6TMDhnazhAKQtX6Xf5+q1icbSOGfXckUwArKZ2B
	F1/wRwAjeoiIlUpwmkRFvg918Wxh4/Ut74yNkE9s8Fk3s0FH11F+5HysndDNkjHSS2ceNanAOmL
	OvrHah77RJNSbkbckBP32vFEb6WcCX23zQUkyFlw3V06sUFnDyKePhBmPNUqvoVfP7Jj0Yrobjm
	l/GFt3poHkgIMoeFCLSHi0dVS4KeV9DiJ+6IWMTyQw/alA2ceV5xyD844Cfsq98PGSw/SVl53QS
	+YqTsxOHlNAMSQYGetOwVL8nPyGm2G0hKaFczuG8rQgFCm74sJJtvDVnEQbiCgbnGQHgew==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id af79cd13be357-7c0cef00e4bmr741971985a.6.1740488978959;
        Tue, 25 Feb 2025 05:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa0uJOUkscoJFqZcu/UhVHgYJ8ocIz6ucSftAjdSN31RKxhGpmSriOBUPSXTaf+LkELJ1nhg==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id af79cd13be357-7c0cef00e4bmr741968385a.6.1740488978416;
        Tue, 25 Feb 2025 05:09:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e461f3e84bsm1208986a12.76.2025.02.25.05.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:09:37 -0800 (PST)
Message-ID: <7785000b-db32-483f-ba2d-8536e00e10fc@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:09:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vsa6lvW91V3FEGGloVxuU4cK7eg_Y5p1
X-Proofpoint-GUID: vsa6lvW91V3FEGGloVxuU4cK7eg_Y5p1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250091

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy 0>,
> +							 <&mdss0_dsi0_phy 1>;

Please rebase on this patchset:

https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/

Konrad

