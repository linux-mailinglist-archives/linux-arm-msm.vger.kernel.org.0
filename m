Return-Path: <linux-arm-msm+bounces-77682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C93BE6645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F232D5E2698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5522E33F9;
	Fri, 17 Oct 2025 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkHBEjPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB982AD11
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760678211; cv=none; b=oRbOH+U2XFR9p7eiO/IjJHWUmQV8K0u2Hl9kbk2VGQbrehWTZZqts3UKQW3/JIA6K3Jx5M+pdMzL2+5xbV5MpTDvr1BYFQ8pahalHv+HNiStgBC5aSPbyzHgdB8T2rRZ9bOGJQTadb9dK12/bQ/OVkbIxsMJP6hd/MeItxxNLZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760678211; c=relaxed/simple;
	bh=8CsWUb+Zq/G7HJ8BD18g+VNAJUOF6SIm3BWqUKXNUqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3F24sUcqVPUA4ZMTOoLMKW66C+G1Vrdgsqi6H5brewyK6HbDUPE94MjRex9O5Exr5m6iLIhC+wmuwNxtuyA5Jun7fBMRg1l6A0Mro5qcrRk2dqzx4Qyj754iAePEDWWHtyWgNCQqrlqwONcxcNi20RYjLLuoEew65x0dRAgck4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkHBEjPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLOvH008890
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i3SzamJL4AYPJyTX0D+tVvBeIVOXOGLPmwZ6XLXzAw=; b=dkHBEjPMHL9wAjE0
	5upjym3ARatCxOz2kNM/uOm+afi35HA2Ma5DEdQuPpRhvUC6OKX8VNdPlIDk45YU
	RJ0ZfAyYmAVgRSbAAaJjpK3lNY/TrvW2V3J+efAGycFTDDuhBy9Lx1sqg6a1imIs
	dLGlbV4577mcwWSs55mU6/cXVbM8WtILML3laAVORCLApOvoOtRTwnBM1dbwtE8a
	2L8gjzTGxHwRAz6mEY4L5xzEKJf9R0qhlQPVTZrh3okG0uHomhBFq44pMc6rkrdA
	Eb4SUNk+PmjPLFVDAPs80bBQqlUE5IWIdBdA4fqtIiJ6gWI+9DLD8vHPUsvcCaF9
	6Y7RpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aq5xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:16:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b650a3e0efcso1406185a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678208; x=1761283008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i3SzamJL4AYPJyTX0D+tVvBeIVOXOGLPmwZ6XLXzAw=;
        b=I0K9YVFYOHITHwf3AarmUfVNq9AN1CEa+EkDrrX81vJI3xLreC4AhzI+lIVD/dym+x
         xFmUkgqSgAf+yxl45eH4G8G48yIHwI9PH7/p3CwFb60hUE0XNS+dLTaq20xk8Nh2J2wS
         AbDOKW/cG7CFBVg6eyLrtciUZvaTrreXLeZEUU8nCuCns7yNMH5XHRoeF/70RIKHnqsm
         XxPEVVO2Fc2rO+vUJYwyzxCLv3agsSXb26pHGCr0jDZa1so82gARUI86y7n4LtAvD2PQ
         2yev+gWmnxFIzpEDrlNCdVyEAWLcTuoizhEFNaapdgjoZoLzyjsCSKV3cHSYiHXVrgEn
         xtLA==
X-Forwarded-Encrypted: i=1; AJvYcCVLqRqsOqc/2QjNuL7bmk6oCgZ4XKM2jB1Y0HoJrinmyPUhdPP3X6NcNemnWmLQnvifT/4lvdLBS4TajiFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+CWOSY3G/Drvxl2f1ptbygWQDJNWVdFqT8jF2xwdj8CG//d9
	TBqoyMqdi7b09j/uw1W9dvu350upXAvnbsspFG7yXs6CScV2V1hPgmvzmdBfo4UjM+Wz2aEmVH4
	DAyFmGlFDNs42h8vjVvO5oXAIPjpGrifhAnajVu4LRDkDsAqs1dyEQ+KdXrYQdOfd5sJM
X-Gm-Gg: ASbGncugb98CxtSzr4ICxTj2d8cTj3y6EgdHxGRlJ6m8ZW+ih5t8Jmt2ZLmFldfV4ab
	UHvYaSryk1hunjvPomi9V6d0mvsHVTZa4TvdAWEHybHHNaFF4Aw9T/CrNVHNvAmCAxcdDjFJdgL
	rl3lqXJNl8wIYcOZ3Q6ASNNiS2EN40O68oHpf3K4Qn6tr5cXKUAhPy5as8izNIpjjZDC5Y25Otz
	RDtqaUPMnpFpW1bT3paBnM62O85Ioyxm7CHQ6jjf3N5lIFU7vm8gQgFkUgIEzxdus9fd803bIPF
	yAl/aDuTTZlJP2qNlyKtCv+Lm2TbC9QZ+ahb2x0jobbI13BEXGoSWlg8y45FZEuGZWYdArPbhTr
	hP5lkXEARzn5+3UC2OtZCjZaH9ok=
X-Received: by 2002:a05:6a20:1611:b0:334:84f7:564b with SMTP id adf61e73a8af0-334a8536f64mr3070535637.23.1760678208039;
        Thu, 16 Oct 2025 22:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/y/lA99xt+x1uOg5ljZ5MzeXPQPV2BT5QU7TifJtGK4mBkRRMuRFx49x342nAHdOiJhOUaQ==
X-Received: by 2002:a05:6a20:1611:b0:334:84f7:564b with SMTP id adf61e73a8af0-334a8536f64mr3070510637.23.1760678207531;
        Thu, 16 Oct 2025 22:16:47 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm24387908b3a.38.2025.10.16.22.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:16:47 -0700 (PDT)
Message-ID: <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:46:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f1d141 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=eFfWDuD68qI0Rqvue3IA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UKVHtHTaIPDphl8429aXzKlTtRKyb4Au
X-Proofpoint-ORIG-GUID: UKVHtHTaIPDphl8429aXzKlTtRKyb4Au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX8BSVdWpOZQLK
 wvzEmUWgKHQt2AMe4YA1ti0lba4ok+BNzBUrcDOukdqX1Jnp9NbwmchZSUiqOhZ4bgdKl8Gvu2I
 R+mUQHuQzWCvShJO5ECQe1eKRH8diwmZozSgxQqVRNvgdbWtYuYrehBDtrsMWcH+cKHxBLXYHKj
 Vk24m+OOHqdRkXqky8d5rETi8HzrcSGIeaeq4KvBVCYruhOku3tPjI2oIX/iPRfE54HDcGpp1qp
 lt2qnvJZGJt/hsVGLMDrxUv+faetyL/RQNOs1bPEavS2na0dHUfB8C9sTobAxRlyLI3paC8T0vS
 j36E3P4zHrF+VKhbNGHb4p9pdIhb1pM5Roke/wA8HACPX6Xi5ac9oakPl3PrZ+z0QQWyn14v0kd
 186goPpB3DPHSXQXpd9D3dEL+Erfyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035



On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> On 16/10/2025 20:53, Taniya Das wrote:
>> The TCSR clock controller is required  during boot to provide the ref
>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>> the UFS driver successfully probe and initialize the device.
>>
>> Without this change, the UFS subsystem fails to mount as a usable file
>> system during boot.
> 
> 
> That's not what I observed. UFS works fine, especially that it is a
> module, so no, this is not a desired change and explanation is not only
> insufficient but actually incorrect.
> 

Krzysztof, on Pakala MTP we are observing the below issue and it
requires the module of tscrcc to be loaded explicitly. This patch also
aligns to how it is on all other targets.

/soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
[   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
[   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vdd-hba-supply regulator, assuming enabled
[   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vccq2-supply regulator, assuming enabled
[   10.565955] platform 1d80000.phy: deferred probe pending: (reason
unknown)
[   10.573078] platform 1d84000.ufs: deferred probe pending:
ufshcd-qcom: ufshcd_pltfrm_init() failed

-- 
Thanks,
Taniya Das


