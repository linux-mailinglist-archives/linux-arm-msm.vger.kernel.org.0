Return-Path: <linux-arm-msm+bounces-83980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097EC97A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A582D3431D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C81253B58;
	Mon,  1 Dec 2025 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2B6F0tF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsvbIgbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D930EF9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596152; cv=none; b=cZ5h1gyZLouWHkOOlvK5EDiVgj8xKFkpPaScIslmT1FPO9mT+5oxwCkhNBb6HZ/xJsYGb7k85SDa/oLaUtcDXQmhJ6Duxm0cN+buN0IzFzGfo384X/HEdGrtBEO4njXoaKzyzMWV17Cl0CY/4BU7QAAASw0ZtT9vVs6mKd4yc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596152; c=relaxed/simple;
	bh=OZdWXq4I/E5WIteXnC1Jkbk3o/gu4E2QWIb40Icnr6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTdlii8W429wVunsdsFh0rs4J3mZA1oQZ4KXE+PqjxT01/2GktEZZZwhuozMo/L78T6m5eRg0niLL5zmw42FsguF8uVOjaE2DwnKw/Pv8kiAlmKi2phh2fqIgeZW1haq9MaxH9jMhzl8u7C/0xAP/SLOmRM3/1OUT8NXVmPTeNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2B6F0tF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsvbIgbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B16ikE33689290
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=; b=c2B6F0tFjcrU9BYT
	a0r1Ayf+l2wd9/lm03szYYU5V46n0Hnurl62hO6470Vec56G0gQq+4bziEN/J0FQ
	QB+Me7IsTSwDgOyUgWbkyTd/QenUfVOc3juvb5OiJdb39Gy+ZxpGXo7c/l5hCwa1
	Qu7AMk/JkF9VPbdsmkqgkqoXU8Hlz6JVtQYBIR1mDYDSiqy1grdgYGiUraL8lXm7
	eh/hAGhJITR4wOtigTrQhadCsXa7xyV0SWMaqPTwYG5cp1+D8HHrtj7qiNFTU2r9
	j1PZoIg/brkw6zGai+wXViJa6R87LAIla+QzDAvcgfkaXBf3PPL6it0DINHN3Jg6
	gBvS6A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as614170k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:35:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfbe140bffso418084137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764596149; x=1765200949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
        b=gsvbIgbhAtm91L5coOnk2LVz8L1qRXnX1bYytDAlh/sHm2iV1ajgkFtGW0/7ibMIyH
         EBdcgBAqzsKtS3SKAYrfAidfeOxMPhi80lTRwZKWJN8twYNqV/yoU6MWnBYMhfouMXLk
         wxUjXEZZjVH7Ml+/XFqTf7YvHV6fcwOeWdUG7hw+RjJ/t2Zbn0r5WzcorEwa7Acn1Aq8
         NLf5aL6C3MgdXxEjrnP/atiCnvvOOl0OHJpw0VEnFqiV+sYDqWQLrzmd+todrsyYA2Ge
         +8ZeSav43Ttl7F8vqQDTErBWaro/64FuKqGMZ7VE+gJbe6VuF2hgsrklD4UF8vpzalNB
         HqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596149; x=1765200949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
        b=i0njJIgarw9U6jEo4UmGt166sg7jUGxa0e7nzJnjY6czYK+EnMahLuM857ayyTwmIw
         lerbyVXPmt9ryuyJRGCJnoGJIVfTKfaS0sg7wPbgwmbHlHG+t/JTcz3mLqaxyIsZMDlX
         QRH3MUkbntbE6k/4nA6rAf79Hx9a5DGg39F7ghGdTTrIVsO9DJrfIuVfpICX9JWaC7Zl
         e3bZIn4Qc/WImxmJIU+b7EfXbwrVNC6KDhGkuM9ZEFyh+9JclCeCpl6tqD5VvVq9yFUO
         pyUeWhBIeOMFlZyVD+8dVmegmf4sSrcLGYSPy2rtoUPrw8aBSNgVH+IR/MxoCR/TZ6//
         3jCQ==
X-Gm-Message-State: AOJu0YzGYAaQKM2//haHHNe+RTiSKTiXL4EkY4D7GX9uOPndiJsrexrE
	oii437AIqcBSGQO9tbGHrYJBXFquTijf97ePRTtW7dMSyZBEX+rmb9apgyT1ntXb9OSLYhcaiJn
	KhHzxujn4DIlw58a0vLwMFMQUVXAWdjyHCdq4jiatyIPG31J4sFPZpa+gm5WpmU8DKmcO
X-Gm-Gg: ASbGnctR4gVjbsFFnQl6lo7ivtp3LouFbmDBipYCEzyOTIzARfWPDGvbjQHok51VL1k
	vfuP9FWZhtsQIDlbsq35X7/t7zACaLcY98BFF5xMS5YHhItLaQbMuIwzt9/53IQLXxGNS8F8hsj
	/Pnasz/28VsLNnq2I0IkVEhUE3W772aE4dbePYnqFgp0vLL8jqOkehwovs6DX+hxuXVPzxX/Tjo
	tyAX+CnK729vX8Z+ycCUCRc9sdxS+jK11mH+1yrMyPlp+SqCkjrzPB2gZirQUHHkZMmcfPk57KF
	gpxS+R/1mioZNah0CDPDG2SxnBYidC81KuXQXiuYqsbVlA6w91cpCgT5jRXra7l8QzhW75M1Lvh
	WdzS5bpyAIC4+5AvppmiC3luYjZ0eTxOwYyOLb0UoY7TPOScoWaKhS+2vn9XZBnUWDTY=
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr7410350137.7.1764596149157;
        Mon, 01 Dec 2025 05:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIEwD4EDN19spY8zdgqRbNhH3BpetN0hw22bq4r1xGtt1Ytiy1Dj8is8Rgsg4LEhNka2bT7g==
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr7410299137.7.1764596148634;
        Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035af1sm12781918a12.16.2025.12.01.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Message-ID: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:35:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d99b6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qKhk4BsYAtMBMWEJztUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LXdlp7ESaOe3XjJAGTWuoGyHsOP74fwk
X-Proofpoint-ORIG-GUID: LXdlp7ESaOe3XjJAGTWuoGyHsOP74fwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfXxR4OcNyOL9co
 RTdZGrPwMgpEC8/CAox2HbAv28LUEActRgf/qXUWmIQKuG0ufkEHslprcdXS/iZJBIDURV0XoTh
 +18TjBrjEdKpMIHVBdqfr4tLxgMmEEljOFxalJY2dveyMJ1pm1MK1ZHH1fC6wVgHH2K29RPKn8v
 ZXcueBFX2nCYnuwvznsqI3rbdijjcwxc7CHc6liAhBpUtP+LTlmY04hXbQub+kAHqFNgWoKLKyG
 lsOtt28IAvP7pTqBKfpBDlXP/jj9chDmESBUd5EpXgOmceMTaxT6ZystgrwYsdrq1fxUjPR7n8q
 LtZ6mgBt5oo9QuVpwZ6m9WaR6FQGOIobKRtx+4h1+2R4d/5MtCdEv4ezMFoc/0wFCr8GZmGlcwY
 NLgo+OxL3Hd4p7XA3YOa05njNy7QGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010111

On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

The last two regions still happen not to exist

https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

Konrad



