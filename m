Return-Path: <linux-arm-msm+bounces-89192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A965D23A9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 428AB3027E71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5706335A94F;
	Thu, 15 Jan 2026 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIzrw52w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j861FNu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD8B35B12F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470094; cv=none; b=hWu6glNM432NKk6SqkxpnjBJQeVFalFs861Q0fgy/+eQROhMptxXE9L4/nMoBjPA7B3GPOXWFDUXKbxT0XGcv0hQMZWN5cTUeSQMccs8cRMTfUeoclhHxAYWKv04aeg5RCrwEXesZ3kidNfLT7Ijgg3yjQnaWFXRZIWMWR3dzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470094; c=relaxed/simple;
	bh=f77NOdZ0IdfnK0VA9o9QSCuajN1JF0LqBfkgIn5uBZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1rE2ILfzjsTsJiZFEhMoW/7wwok2DXtPej7tmFHm2CR8q1Z2E1uaz7fJIOSprbMHDV7R/tUvucPTZKtcaY3wd2SswmGBA2MxvInFXgdzbGoS5pIxQ48rmQQjYNyXoay/In8SevgQ0cLMHKTNJfjPY+j9nZOzYJ6jHiZnlRFg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIzrw52w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j861FNu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fw0I1991673
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=; b=BIzrw52wb284a3RZ
	ueDn6nL/2Yb8dg2oJuqBVDzBL6UHUPm0g3GmwUNP4HR0aHfe8jGK6ym9vD/m3J+C
	Dbm1M2QPulN+FLFgWlzlCB+w3QbbX6HluvfSq5+x4DIxuUlVRe1nYmi+SiLRMWli
	05w21tPq1bcKc6s8NP6y1d4tUkxAHG4r9bpu0kQrd+ZqISmydPCrtlAxC5YluTY4
	NY1//bGkqDingIxv7cjGAOl6RLsPx0Z948k5GKwA5SVuVGaa9w7laUiQzsIPZDm5
	i9nCJgn5FD97M4NZ5a8zXse9Txg2cwyyfxcaUVihxuh92PRtwtS+tLpY/MQjIp6r
	qYEGyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbueht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bedacab1e0so25701785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768470091; x=1769074891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
        b=j861FNu8pbmj9HYL9rFJQASobwwzdnx1yDnlJbOVy5UwZ3+PU37E9bwKwRnMPh+9Yk
         tQigL8pH+D7ztKbRKgARDuSPcKi+72DQ+Cg9in2MlL3xA2iiaGDSQ1aXc7mSn9ryLEmu
         5/GZvGivhRzmIYTLEQW2f2Ezudd0N5hhfTj0bV/FGlTXr3O8w+a/cEBAGg8xhP8bn2dZ
         h3l259QlCFqVwXPtUxXvPdyZTz/nY96kLiv70rQuNAHWR+IDvB9xEy/Z1zksoZhVoeyc
         /V6FtYcWol3D3548GJCWYUeY7sfYQvUwJbBjNb6jTyY0mIRJ/7hzSmVUSzjHgF3IMFCB
         Pp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470091; x=1769074891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
        b=NBKQMFt7jdHM4CtwnG6evWcaGxfGrICXALVAgefIvL89ipPj3s8RGMG/xayn4xt1cz
         4ByYFrnSM4q8YhL4q04mn1KWvQeU99MmP6E0q25z9yBdHhjNPdJfuDl6AwCkAYIxhC6o
         xOYPQGmW8pr++3g3Kp5Wo0ml8UZoAaHlrFD5M6Pqk4ZHCUiC0bMc8qWtpucg6E6Fx7Q2
         0ptKUpJWijwF95/d/RpPSvNgkicY41CrPzdAbtlmjtDf1h43OxFSwJgdIJXyQhL7kE9d
         ELokoEDfsLWGwshcSToKr8U+KGArUp3tOPaHsCvmk3p6IuejURe9KIVPdajQNQVqVXtv
         pQPg==
X-Gm-Message-State: AOJu0YyrusQjnYhDRaCGJm+nc1PpmlTVe2+bsrpJdRkJuQ7/1A3HHfrB
	5tApppHunFUqibEP6LDoIwaWdOQlbSKS8xhHMczZNk24AJAFMIV0wyNih9YSPhC3fMUGzfmYpe1
	uK8HoxnzWGcdWlqqYplhBvXNe+RQE1pwHvICBXvhBHipYLynr7lQ65OhxXbmq1OUTzcbW
X-Gm-Gg: AY/fxX7dgMkzTTfZbnVh65wROZCtrQXr8X75rZwjWD3HoJYbqlsXcO+rtvbY7nwfJur
	fCofaelvA1SuDLZgfe+eWorB5h7DjZLuNjLjSyrtn89/eLxte71Grmz5Zc74h2NtZP6/B8YB+iL
	FMmTsXz0Xq06znebt3jm5DZ5Q7OKEtt3VTWSH3etANOIhRBZdzAdcB9EbCRrR7zXpS57FhgNLXt
	eYpwZPYARaTD6jlz+7dWoJ21UE/6bJ6lc5azrVcydI7K7Sj699KuP75tBOMRGm7v3chypJgwEKv
	PjCSsMBfIEInAo2XLrMqvZE7+lXYZ+XEnljKpbhvMLEpVPlZ1g81lmBivzCjYi7tRQfQFBDxVYO
	c+XWf84zlYeSAPZGXFs47EfKGsKxVclsA6eGnObq2biDHPyGKaTuLAl4nKdVq3SxsMwE=
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c53892a5b2mr244248985a.3.1768470091256;
        Thu, 15 Jan 2026 01:41:31 -0800 (PST)
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c53892a5b2mr244247585a.3.1768470090813;
        Thu, 15 Jan 2026 01:41:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b464fsm58436331fa.20.2026.01.15.01.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:41:28 -0800 (PST)
Message-ID: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b64b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3MV8EbEsz5KNaQE0Ot4RqaVOwTwWZ6Im
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NiBTYWx0ZWRfX4EXekTp6gTXM
 UJHMxlw6u9pr1NleqrKLabHfcnrrCy6Ic1ySmVbQWB4iImyNS2KxWk//YmAEwFqdKYH0L4Dhh24
 zr3QjEZKviG836eZvEv8cq1TN3PV1zYaBt7HF9UI2DOjvs4/w2kcxQ/ZxcTHA8+ol4CGYw8RsMh
 p63tjTm/Im1BB4YeTfxtjXmn+IJHLiEvwhQBcsPmwZ06nUeoHNPlK7p+tXr0+GXUHaJIiv4HwS2
 HbIhhSxXAkGn69lIvFuknGUhrRtR/4zTQR03a5fz6eOg2L/9DybN9EI8e7f8o3HVUMN++X3vMNn
 YXAv1XMrBIi3bUi1PAyVCFmOq2pxTOSs+gZG/MtjnLY9WKyu8ZoXtcOxCTJlcGY7rWoGgjf5lzM
 7VwlbjufNBSFWIvfz3CfqG2m1UlLV1RjJdqDZD4/nsmHCATJgfkXy8gUrRmCdelZ+GcD//sxyrV
 k/SdKJ7GSpXJHzA8msw==
X-Proofpoint-GUID: 3MV8EbEsz5KNaQE0Ot4RqaVOwTwWZ6Im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150066

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.

IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
also prevents us from checking *all* connectors if we get *any* HPD?

Konrad


