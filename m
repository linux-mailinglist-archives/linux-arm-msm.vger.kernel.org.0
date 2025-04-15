Return-Path: <linux-arm-msm+bounces-54399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECBA89AF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C2FA7A2A91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E362951B3;
	Tue, 15 Apr 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH7jPc4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F4F2951A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713957; cv=none; b=fMjIkTrgcSfqjpKxOhbeiXel9OBusV0XTsrMyCWykXwKfeooR14H8b3i8KbaEINsBlprUQ2oxAsloNlJVN5oCHK6nt2qS+ovrIXMb40NLvSOP8y7YC978/rw04fW/drAfbO8NIHALEJmVxy+SMtemXDjAW3IrT8mSbBx83c0rqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713957; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrPnEkKQPT/5ckxD2F8OCc61CCK3NOxnkVrV1c1fcMgHh830rOK+E56N0SUrgq9KJIWaC8mFT94yw47uT/sjiGEpYpfIzvfhJ4GBPcwVVO6byMmx3yfX9Jwa2CjrxtSuZn2GV0gOLbEQJr1uc0ty0IwHhGbtmScU/FlLS+EONl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH7jPc4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u9vo025916
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=XH7jPc4vp4gfmDwK
	TO8BHVOtTMuLmN4CAgqxHAh9SX/p7J1t/O5/yI8Q6MhUdL9hrhMKuxbCVWKDAh5V
	Q/64NRw/WV1NmaTJmMogfsoQK1yzqzp8GCgCZeryI/TqHoEL4DHj9QVviKau8sCE
	xUvocpYO3cuXeGl/Oi7Jp899emI6rb0K1u8ey9v8pIN8jy0dh2UnFZUU/PmzVaYP
	e/Nvo/kLLWZXXlxCdcuPMY9NVThUoGY1MoPlJuXjmuKPIQ6nNLZjaBEuXiLRhVeO
	XU6MlZjr38AvkxZJM6NEibwreREoF8uJG8zDNIxcM4g4kmv+RLmMr1xXa/NJg5k5
	2sZHCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qs29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476783cbdb8so13736801cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713953; x=1745318753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=h7sN+JS3aLaOCI10kyIBcEo0D+G8I2iageJRiPbwQ927Tzyx20T0xgzReeJVVBmsKW
         nN6kGvcdPSGgrsImjjdc85gBVuLr+nbTT5XkmxchR2Qsfr82Q/ovebHx40hVu+0mIWOR
         911Yb6X0IvABtwb0iH97Hlj/4hXuCVJBhliwoCZjhPr1rWh4TipFpQAiA7VnWXMPj7Ee
         HDWIASjfwyET27juaNbJRgsCGGWdAnOZwAQ9FH3ok5evnS8vF81EOtA09ADKYaDHrTJ6
         oOecfi4Bpi6CHWuOFGwCIWriAbTf8P8Z8T48C587lgDM2lbtJzlUKinjz7ewJGssh1tD
         7xLg==
X-Gm-Message-State: AOJu0Yxy6BSdDV2NcrFDi+WLgjuNQCSKJJ4y7aB2M5egSJbKA+/5HxXG
	jUCbDGgFxN4oVFThncKBpxAkS2OC8PVBVddhA9TNiQXyKj3Hhg/912wf9fWkXt7o8VgNOrP4iZ/
	y3zLhMAu5GICgUgX+ae0aPXiNGTcLs+0WjBo2iWTF3+eRNo2B3ZjMbn9N1qtz7dYL
X-Gm-Gg: ASbGncuSWiG2mVSaOvAt5qtNXXdZUTOwGm1hWY8yLePYUi7FH1NhFiuTNsEPfgGj8Wl
	mQh+hg9i/b4QJjan4D7VdaGWvlQuoe0txOBBQbfkt4fysP0W59cE1HO4Y8+gGqWfpaLmSVnXvns
	MbS9OQYKaukW6E5htmFVPS9j/gv1zkyba/N9HHMY+ob4+5PxBVEyaeqVjAmskc0SUuoyHQjFgfp
	PLJfUSwpOjeuqWFc0m9LdFsyv20M76SHSE4qtx53T+XRBLq80V9O6GYsLL68iLjGq7U/NyDneUF
	y+fnwXmauASO6SXRIEfzS3feVZqJ2ZfRSiBVgjWYo9gJz4EcVQwMI5I09jtgqk5VUDQ=
X-Received: by 2002:ac8:7d44:0:b0:476:652f:4dbc with SMTP id d75a77b69052e-47977556f6amr87907311cf.7.1744713953556;
        Tue, 15 Apr 2025 03:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtG97jq0AmVKUUXev0OOoGju9Bnj1ExWktEy3WliFCLHfb+OHz2kffKsEme7E+MqNNoVnA1w==
X-Received: by 2002:ac8:7d44:0:b0:476:652f:4dbc with SMTP id d75a77b69052e-47977556f6amr87907111cf.7.1744713953192;
        Tue, 15 Apr 2025 03:45:53 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f5056easm6660326a12.63.2025.04.15.03.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:45:52 -0700 (PDT)
Message-ID: <b8b61f72-5b06-4395-8f37-b0036370e0b8@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:45:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: sm6350: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-14-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-14-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NIjl2kv4XBhRDAAeZAU7JsD5Z47qxlMG
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe38e2 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NIjl2kv4XBhRDAAeZAU7JsD5Z47qxlMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=630 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

