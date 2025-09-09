Return-Path: <linux-arm-msm+bounces-72710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD5B4A6F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802473ACF5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D276D287241;
	Tue,  9 Sep 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLKhNHL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E00286438
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408984; cv=none; b=qx9DFCPNLsUcYOe4jQ1FqDIez5aBxW6ur6yXTnBg0bcqVqKHwORHbTY/Xpoya6Unhsf2PQDrXT1R1wZ+BzqYxYALJ3sQMKivw4WO7UDZYn+4lPSDA109gnR5oFvL9xMeRJpJYvVCZWg0lWH3U22bO7G+uoTKQxC0liPE40aCGwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408984; c=relaxed/simple;
	bh=+iRk3GZBaP2PL9IMjGaAxI8oj1q+MIx1QCjF6rwLYrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEp3v37bucFriC2rby9vBH6yZ8/DvTeIQ+pRH7Ymf2HsEewQYxciCzK+EkMjeGAtEGvWA+ji6+8pg4hRpGcgAXETJBmB6x0Yhp7XgMGHhLNtttpejawaIWxJbaRgt3h20tPbYz6Iflx/6Cp/5zbHYH7wINXxNtO1c6A5ZRCT/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLKhNHL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SknX007724
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 09:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=; b=nLKhNHL2ewzJOPud
	lZhZtHzpkeoIViVIMcU7VaJf1n28xgKVWSCY74A8qqc8NAsyDfDPdgpNfqKqs5S8
	DALDhvWpu1iOU0eZEeKh014H+CYEOpDICzIvxMlPWJus7mG+vTUN4h6bt3qfUMDH
	raoRK5dImM2TjFOePAWN8g4xZcgx3keguaBxIibSZNzQUrGaAqjJB4XakATEAHqz
	JYk9zbodMs8kWnhZUhgKP0OcE/rqc57I3sDRiyfNHOd2O3K62rq1rgRdydDLUNIZ
	2BHXMxLQ3EPK9L+UizGxe8aL00oltypYg3Hx3Rps+iaVKr/LafMXbKmeKswA7izl
	xOaggQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0qmhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 09:09:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72d3778ba04so10010536d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 02:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757408981; x=1758013781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=;
        b=aOlzJqT01g3ZhOz/0sjvttWNWQG3hN/Y1Xto/XKu/NCjj9fX1CzJJfriD2SuKQlKMa
         YpaekhmT/aioE4mV/BqCZONw49retM4Baz/pkPa3PltSJnoX8fy+BHTeRtb1CUOPncyf
         Wu4iL7FZWPVCKHRuVPrhQZB1rj5EG6gK89JNbOHWq2LOzh6dFnNRVGMzhLjpGieDeLzU
         pXJw1fjzfAA8PQwUHzBQVaayjoHMN92Xql340IYUtDZNVDdmevA714yjOfm8BUvk46VS
         FSaYLkVFr7TAwhMc55RLCPwtVKq/b/17G9O4LXfSTnf31er6F7D2TnK/mfDX+SLzLroo
         7HWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnuBq1bM1YJOdA/7eVYIi6Erh6FFO7kaXfpxmPjpHRu5TIG4hia4dCS6XayJSo8zl/xcs1SSW/gPX00eu4@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVfhSsTsgm2yKEFHtfgxsqrPxwwUTgTKFnC8OZ+TQQ09F3cTD
	yM+gskA2Ny6HSeHMczrP14Sgj2if2bRhzckpzT/4vzzqNFWMYmiWfeMV7f+aAKe2bEwIWXeaupu
	Tqik2O8h65fD6adosp12NcqRoYC0UyA5WopqrtvIJjjY4/W7WA0loZlzMWF5esGLD+MUc
X-Gm-Gg: ASbGncuhxVY+j7QBKQVFqb6MrXNAYuojb2lTwmpHx1qZ1k+vjLcDnu/ZRH26+2whqBX
	ovRba47ZXUsz3823UvnrwUDykEkenqyOr1PTi2fiQxHu2djOYENC0gg7sebzq91lLcUU+mooJSz
	wMf+dRxG6qcZ6OTqlxd54J4tWyNJ9kDd0ydYfDB+mxG18grP6WtjMKRyf98JiBafIF4HQJFCB0r
	wvnJ9M9LebRJmrLw1+t5yJYFNM2zXGaIJ4v5QNK09Doz38mX8ZyrvE695nTb3Ok5Y9+ihc8Jw1u
	aiF+CtpK8U06Kr5rFZLPEYts32R9C/IgfA5pr5y92dc3sRKehpfWkbd0EXlhbMpWItN20iFaooO
	DC5/VwOQHkUv7+9UcxiP4LQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr75858881cf.8.1757408980782;
        Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElaS7VsMyAK4sn1lpqAU55/RUqGD6nhMUESe+uEL6+M2kFs4PMy1dM3B8kVdWzzm0FbO3i4Q==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr75858671cf.8.1757408980330;
        Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0d9b1b53sm2545589166b.96.2025.09.09.02.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:09:39 -0700 (PDT)
Message-ID: <b879cf3f-4216-4fe8-94a8-48244efbffd4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZNj5Q5RC8VKRfDyf8Jix1T-N6RaMJ_a0
X-Proofpoint-GUID: ZNj5Q5RC8VKRfDyf8Jix1T-N6RaMJ_a0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX27Pidg9mz2hZ
 apzaQyn8FPg2elBJtMqaKWa6RI0WzAeyiwUKno2y2UbsXyrGJTvosqU87cAPpgwEdMed4tcDWX2
 LX80AxPzZ5suzQiCFPbXur01xXOOjBWiadR9j9kWO93LFX8nmZu2uj4EVr40fQ7yI+2vQq0U9Py
 IVEeaPy/5PJASRvsqA64wbedgbib8tA5Rp/V5Lifnv/IqjXsN6/Ypx8OdAQzVFqTt1ygM2XVSZ6
 I+Ntocx9qh7vCjgap/kuM5dn+gD3Ltl0rcT1iG0jqEFw7Vw9HUxActZ+PCoF+TDsx9JrwBwZLAP
 hu2uRrMLrEozTMxQIr4+IHfqZcYXR69q33gwY/YO1WNxI31xS8nCZ8i1qyJ/aOaetuGjT0VG0F5
 LbwdMTZn
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bfeed5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7IyadIS-_L4Ux7daf1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

you'll probably want to turn the 115 trip point into 'critical'
(which is fine to do in a separate patch)

Konrad

