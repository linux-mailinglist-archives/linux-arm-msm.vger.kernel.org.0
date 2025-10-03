Return-Path: <linux-arm-msm+bounces-75863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09998BB5BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 03:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADB854203A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 01:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFCF280A4B;
	Fri,  3 Oct 2025 01:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU60i7k4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566D72550A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 01:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759455084; cv=none; b=O0qEbouI5eFUptBPHeguO7OnnqGpjjIrOhKXFBXtgjBoXoQuSVGUraDIe/qVaNcW/ikYUHwerL3U+r48wn/4jK2PsYZPaaeozG7LaKHqB8574yZK7tXOlnflMO/ZYCvI5KjTeFCi00I3Tm/CQERQRwHcEcVzwA2CIzVpMYVLjq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759455084; c=relaxed/simple;
	bh=a9FkrWyOH5WfgbO8iL/H4O75+4Iab83fXgGTDnad02U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FL672uen+WK72J2IbKDh+U9gvwoHzWBsUis4uL4WjV5uv74qbfqPitSd8IbUj8VEa8ECwQ9vJ3zrsDzPA1yYyqZZ4wm4apAB5MQYYd9EFNEGClXIQNeXD74iDGVz4rIpLaBUEZ2Ws++FnomchKCJdJHOLMxcJb1t+iAEBPsbWx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU60i7k4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592Lq67T022669
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 01:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUor1GGEeb/RyaDdlp7uKfdhC1u50vkNwD9/2IV9XEY=; b=SU60i7k4P4K+3P6A
	5Gl+1FnQf51S9cNmaOZndeBtnzfFASHWYUfm63imI3LLrwAAekOiini0OIRvYuI+
	Yv2Zsqbfq+MUTLEVPIJlcq5MMOIruLpLl8n3Id/7akROVi9qOWW0VQO0oKt/fJp0
	DikaEnn/iLCBjQE/nTGVXu3X/xbAfT0kAp3TVmkJDKQExi7aMNUXAo+a17rxUNkM
	HB2+k9Qd2kqDSS7eUIykaoaFC9+fqpHYSZUI/JDjjfurzuVjfJGi6mTDmE5Zx566
	W4E+761yca4tsDEnR/TfM7OYY8Y0nK4cov+X9aMBBHRAbcSaE5TH99573+Fz1iJD
	FiV8ww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n9ujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 01:31:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d7f90350f3so35856751cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 18:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759455077; x=1760059877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUor1GGEeb/RyaDdlp7uKfdhC1u50vkNwD9/2IV9XEY=;
        b=dxtBuf5LkkMTrVnD65OaXk5yqHdCNg1hwxfY22x1/ySfkb/2NnLxzKdOXO1N9iYX6G
         Ty78oIXmdhgkcYqOmdpcyrfnP3tOoKvsCr/GHlabEXpkBOGM+4Tpr5ZvG3BlV0ek4NRg
         ZhjPX0pOW3eB+ews+JOLg+97Rwh3AMGJOBb9GtbsDF7RW7l+7DtlPrgRORIBLY35gevJ
         +3h/NZnioBb8etwommlQoj3ho1soat2XpAcJTeGJO23QN3B/4JJ3hGCeUul/HU1GcA/e
         nbM+Ar48g9ygldgP9O/8JwaSUe3WnaenG6cASXaEhNQkSdLIYz3YtvuItqRK2CHcLiK5
         8dPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2rieSt5yuwl04AeGx/t0hD0kBOPKkt4GjYhSAgPTh7FJ6yGjeV56XwbJL9PbxN7NZzEYG+aXddJ1FKnzC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFBXFEaYtycwKE3809TefZCk3tpRs8F0MtDvx04YgjMPXiDTd
	qhkojDA+ucvVrc4dqReJfliY89oVvZ+/Wp43gcLLNFc2LpLOSYFjgcEMHP6H8pVBP3bol6pD6O0
	vUyh1bc6VqlVwygPNUZPfBNGziAJpg84Nug4IEUqc289PjCaqM34QqjK2zvXoHZ5NzL7p
X-Gm-Gg: ASbGncvKC2i1fb9j4+0tGCoKljlcUg5ptKygAvJVxtBETJ6+tcAFdCCqL0VSiQwe0Do
	2dMWl/lMSOYF8QtEZL9uS2GhzW39/2pV1wReTPzW7lVIAVbsBou2NQBDgnNqvuw/ckgSAt+2+GN
	avUwPrpXd/i3FvxPMj1qbDrE9r3q/hqc30r+Y9i92vZVdEjc3s4grLpgg34r3ltDW5ThEXiQI11
	kDoN2ftixxqpixTsVJZE39tZz5kd5iOLOQZkiFX3+lQJbfl8s7CIIP26iK+y5zjyGWDe93JeqL7
	zR3+TU7sEjyTRWYQB9PX5p9xCvwpu9luapW5LU4nb0lAZmXbla/tdzD2hQzYHajO5Cet/TC7mt9
	d3Ge3nwMyh6t+qkN13xT8weWyRtp4hu+/qsD67SKfd6FOg+uvk4z6SbjQdQ==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr56727131cf.3.1759455077125;
        Thu, 02 Oct 2025 18:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe+bomof5ILxDfg2K8tXvUmU+StpWFDgcoN3h5HBzXv4s84eHcidVP/7kQ2fVYyiZVmTXOLQ==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr56726761cf.3.1759455076552;
        Thu, 02 Oct 2025 18:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f1b4sm1323179e87.47.2025.10.02.18.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:31:14 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:31:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
Message-ID: <ksuinz6djsj6t4r26rpmrybw2cwqkqyv5kec7yvs3hvz4kq2qb@cker3eya22op>
References: <20251002184459.15742-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002184459.15742-1-ghatto404@gmail.com>
X-Proofpoint-GUID: zxHMA87_Zw4IVbAaHZkhCi3dKA7popk8
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68df2766 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=18LQLPnI8caj5Q-2E3kA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zxHMA87_Zw4IVbAaHZkhCi3dKA7popk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX3eqtgPOz4vIZ
 x1sJqRgLxasm+wICZb4UPRkgNKsKRjvmbkgRdg2LfDNJa5S8N7OH5EkeifXsvK9FHR3wBUhEM7T
 0JwKOqvzMtxmyT7J/yH/e2vdMjEvpv7H1mH4jRQSfvfwDhvaVvV9mzO/RVXqM5gX3q3YRhihXKB
 lOSTMkmfsw8VeXY8AUMS0UXZiYxfzCYdl9DVEq9k8ecPkjk6EhcE0X6B2grkw2vf80bfORMEedX
 7v9q8SJLtRIPEXOeflG0p4YJ57LW68GyRm5acx5Bbrz4+wcnWmEUS70w4Gxyixv9t6daexzUH3d
 /f3SO77UjGmIR6FhtfpDuRnz164kuPjW+tEyQ22U98aQb8gHpK5E41wRWmTRKp0XEfMFGIDiWLB
 GxoIPURvUhN0gse3vzvGUokCQwZQtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Thu, Oct 02, 2025 at 06:44:59PM +0000, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

