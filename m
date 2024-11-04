Return-Path: <linux-arm-msm+bounces-36922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 545619BB31F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868891C21E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0DC1AF0A7;
	Mon,  4 Nov 2024 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA1POmll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EC1B2186
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718931; cv=none; b=gs4wksFiTB8m2CWFCOT8Ye0V9fMinZbS/8JVSFd4A60IgvDy+1qhEkIN8sN2FQUJINgG/RtoPjSHKupXfflsd7Zv1P8j/2ScZ9Q3/cI7SqWt2FtDAa9KLFbkWU8Do5CA4mBEUWIBdzIYvayTSflDwl7X5oVVOUPaAQd1yoLDnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718931; c=relaxed/simple;
	bh=d6QO4QYGlvPGTr3r5FY1HMjPPe70qv93K1mDlNdwVkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3z5jvR8RypwuYRXbhmcucGPNCeLBcgClWvkdQ/RtVkjt8vEsixpJ48UcrTrHjbzhlde5QuGFOLdOGLQLbVrS51r9pB9+AxFC2tf3QAwB1FD2DS6ftrSbu6G4SZ3CZO+T9HehVPX5hYIiX0OHiI6AVP39/Cq+nSQ+WI+WUyub/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA1POmll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Noxlb032391
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 11:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPm7hWUkTfuXs3mmy+IMG+HxOet17xzog7upRSLJQWI=; b=oA1POmll81HyLt/k
	S79/7kfcPtAq4IAVwPIC3XFeTx6gut752f9caP4jI7qZObi9tyeBIvAkCE8oDPFy
	jDfSSZR+zjYTaZVc2jX8RGRN4mGkOl6JROGsIGk2DrVhhOjD+ET514NDsnlyOmug
	fnfWLRc/LfEd8QV8wY5tswsqv9j3rE4uefLiaqEni2duOvIQO1WRFiUul2J3hGKP
	hKBh6shaBsauPoUdK8RdXF4Hv8xxdcg5lAAuYGS+qhO7iwMUQCT00bFXs5PvQo5u
	fJ67c7cKTNktDtTlPDlndwpqiF3vvqg3Nhgm15E4DWQJYw5L0qnq4EA43etMOZt4
	LkS9FQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxuy2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:15:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so12741396d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718927; x=1731323727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPm7hWUkTfuXs3mmy+IMG+HxOet17xzog7upRSLJQWI=;
        b=kfA0nC05XrB7bYs9JuZGbHIPCySEVZ9T7oV/bDVEYmRH6CUmRi9U4wk2SjvvtZy281
         0QDxGKOAlgvTdmTxrgjlk0YxChCEzHbgRJftkWB5OH2XoWEdQWSIRWdu2wUbhxZzIBCI
         Xoez6ZXdcyMHAWYT/fWYsMQ4OT74cdRF7LR8mJUF4RHUrda43eh+mZJZh0GBYPcbNzRF
         pRuVkLfGp2eoULLfrSQK/eJTHuYYZDyiF6PSRuPq1YqnYtFOYmXcwZV/i2m24znEpv5E
         HU18DjLWBWasElj7z0Cb7TY/CAHiXZd+areKuhCOz/7BYK1iD5k4luDAuVU1RVjN0ai9
         nnlA==
X-Forwarded-Encrypted: i=1; AJvYcCWQrCTdxZ5JtwB9K484oscG3iyPXzmFIR8G16vDyNWzMW5iZWwCEpJLG0owiVdEQqSl0tf/jvaOtC4EUD02@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqOgP7+VXCJhnFmNA+kYFdiEeTQ6FAgVOnFW3qwKVCb2hCn62
	RFQrr4F3ZNfbuQ6P8v3N1P7Al/bcnGgPLsD+HiXBs+lMeqjf9aHy2Fpi5z/q8OAzQBxMnFpP5VZ
	1f2UFafvjhLlbaWmXXBZrth88tHjeIi7xSrgMTFsqek0m4hHISfdck8VMEoYFoOPD
X-Received: by 2002:a05:620a:1a02:b0:7af:cdd7:d6d8 with SMTP id af79cd13be357-7b193edb1aamr2141058985a.2.1730718927570;
        Mon, 04 Nov 2024 03:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEEocoupBY994SVKYmDQBEraVYB+dHfuiTwu9QnqVdzOdt1qQkKGFmvRV/Wq0sw8U7MpaTMA==
X-Received: by 2002:a05:620a:1a02:b0:7af:cdd7:d6d8 with SMTP id af79cd13be357-7b193edb1aamr2141056885a.2.1730718927195;
        Mon, 04 Nov 2024 03:15:27 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56494470sm537633666b.2.2024.11.04.03.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:15:26 -0800 (PST)
Message-ID: <731413b1-b660-47d5-96e0-719afb786865@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        linux-kernel@vger.kernel.org, a39.skl@gmail.com
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-6-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101005925.186696-6-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 87IPgFYrNXL20AS_7S8eGnJLZm33zsCR
X-Proofpoint-GUID: 87IPgFYrNXL20AS_7S8eGnJLZm33zsCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=934
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040099

On 1.11.2024 1:59 AM, Alexey Klimov wrote:
> Add sound node and dsp-related piece to enable HDMI audio
> playback support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.
> 
> The audio playback is verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

