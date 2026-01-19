Return-Path: <linux-arm-msm+bounces-89597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83865D3A3DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B567330024D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57ED309EF7;
	Mon, 19 Jan 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiGq8ksg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAykO6oj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B473382FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816654; cv=none; b=N/mlk1owtO9IH3F/+gVWKT5fGNL6ma9FRhKPMmyA6HHk+pf/Bch0UWf9KJ4dRspq8jYfJ920D/yjCZDzeYp2gsoDvAoTGXKGY6ZoXsLRgGxL0hhcER2IggCgMYtnFhUixSWgJT54hopQ71dHcRyzjUJlb3QEOmop1SdsM4xE0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816654; c=relaxed/simple;
	bh=qQZxuTzO9NdKSIJriCBxfd6jZZCsb5NGS5Zh8uoWpWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNMgMpASW6ji8uMeS44WWVH+HFXCuH94dogwv3D769PsRL5B/e0751JeP1nrbJeB8vsS79UDJROJ/tBWTS35uSqaMLqThqX/4HPlKVPWBdIyKpibpXIKTK5v+DAIxmtv0qJ4aSSUI7npyUrhvWVIQkzX/Re0uohmy/2/Op4UsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiGq8ksg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAykO6oj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91HJg1561985
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=; b=NiGq8ksg12v0mUEK
	ics7v1gD3TA/XcNAUhvKiKrUIpmqFswKYJD50rJi0pPaD6fXnmsyx5JxnR4BuMY6
	Fc1kQ7i5FnJYIoE4oZERN7FX2ioNELNAfgNxycbN3Hxg0CnPQYb7SYrR+KCsN43+
	ALXQihdhm624CZkt5pbxLv+QCb8NQnN9uZ5Yu56I/p5Ci5jVrgiw02PieO+aPNN+
	xyJiaARtTw0NUvwURQ1rynPgB8VeKkCl5x/g9pv9mIAZoan6MZWxnJUnq4d+IN4/
	se5jTbHUf565mODZsg0wurJVCVXzL+TuwF2ocZOZYvYREhPDrBTnSJKSxa3ZSJj9
	+mvwSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcke7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so93965385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816652; x=1769421452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
        b=aAykO6oj3EnEJzm5DrvvKAdKvBacqSwvpt8vZqBc+/iO4/VIuK9xK5vErPXEKphhBe
         7+jSb/29ImzIhIiSQ2CK0ycocQwN8JAzjRPOHZ09dWcw9Wu6u/5cGt5yAiyEzHOHSqC4
         KTgBTw+gsYFnhY2kDao4k4oyUDyTGpyxdbFo3/I+lNNN/4TjIXODDrgUwJrxMJ2cs5IY
         E9gee3zE/Drn334gpZ9lJYgmR288RYrmZOSc6ozVmDRFJz3Kcc1zTlDBraQ5kRc7RobI
         kjlQ7MwSFAaYl3hW2/b+ttItl3/HFcexTVUFWhx6i1ADj4IXg0XtROJxACyB35u/r5Ji
         F7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816652; x=1769421452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
        b=KaRT7o9b6CYhyjQZMo4LBTDfByxo5hOuemKYFVoyWFM+fEHFUoIfuXYGBnYh95ENSx
         O0s1HKuwKpFLvO2E7I+sS0+kZWX8M7cPTrMiH8HLMwNeAO+txcNlhub98aOVQnGkEJGL
         XpJC5Oioy3MaVSek2aU584IuI2DAVEnTLzOyDJZMuF5uISVFUV/pm217fM1/NSjofr3S
         6D5lpIeIcfQTDJknHKpJwwKhHhRy6uryReCCQ1mHsicLQ4l9cl8w9W3PT5jSFAe5geZe
         vHAolIZMTCes0CaNan6kQbpM2u60m3cD+UW890qiRSsKO2PZWZsEcfROivLNyzwfjVWO
         yIyg==
X-Gm-Message-State: AOJu0YwKUDcvcr+ypwrumHZXRMBTH6GY1i5IEZGHRETepDM4r5hwZ1xt
	9fXjAnbvLA3gokdUsQwJYIvOaEih41Z08c5s43anRSlQN7dkSS9VbxlUkfODCdXC3dh8IgKWA/U
	gYNAyYwhsTiueSSYnQmeBJOQ6ImcUfYtevYySRd0Y7vXWlmggCYy3GOkJkVdyWvQhHv9O
X-Gm-Gg: AY/fxX4RFzx3TOlaVt/M/7gvI8UrvHcMDNxhtnQFmoajwwDX4fASuaecjBG5g6XIF2X
	JYiGBlDZrhYo7NWKZ3Cr3RPjpIARo4ifGU9f831gm61Hiswp3+UPfPcduQXci3lzaR7xDa5iFuz
	AOeoTshwu5k8A1vEyFOFqRnrkt+YRVUTQOka/CKO4VpoAj1eSqm6HHuHU98dIGngme35QGiJTv1
	6zX/BFyuXZkwoWTz8uwHEjEIP4AyaevTQUUZM5vHtxha1nbWxKGuO8nUdSU74dXfZeUPsTCX/Jj
	x25jQ8YqdI/8JNzBQUJfS6f3xTADG+qPfMXcjCT96nrk3wZigx3+8F+w5CuBQ6g8uQ3YBLnZKgI
	PEtPfkzxDHWT9HT7N98w4u0debef6CI8zud9IIYvpp4PpKXl3rpYA0TSHOicGNXqXpxs=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1121537685a.7.1768816651683;
        Mon, 19 Jan 2026 01:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1121537085a.7.1768816651168;
        Mon, 19 Jan 2026 01:57:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9763sm1003138566b.35.2026.01.19.01.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:57:30 -0800 (PST)
Message-ID: <051f401a-a3e0-4d09-8a21-e6e323aecece@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:57:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4MSBTYWx0ZWRfX2nZZ7Qw//6jl
 7a7wx8pjo2wMijvr9G0iUOIJtCXaadaWh5QKouAOzSTNmP3kU6AawkM7+bW7L3fOy4gucFBF3v9
 m2wfuga7Nxq3F7pUURfTKCqH5bzdALdQo5kD9jDV2+Ib/rNZiT5Gdty4zuUj/78RvJM1VnxWgDq
 7k0N1OWJsXVzbSY4IdHpyG70quLxPAGhN4Y4fb/Pz50+7U5b6WOw+Nq9LwoUtTnh8cXI9COPhZZ
 Gbq3OVmdvVZo4CLiei/QL2FqOowl5Dq5S1ULn4yrLFXuOn0jHGTag3z/7gMyTviqVNxenC5MlKT
 7FB+2BOzZ6Zy3jfgZP/+ldmsU/sEU8AdEbxQRnlcRQLVNDD0ggU1SrTJhznZ46u1I9oyQ3Vz0PY
 CFe07XrqdYrmslrHDXK1aNl2WmX3Cx+L8URMjDMuMbX3y9H0aFXTF+4VrbiAmdiRdwk4oHsQWt9
 7tzbqZhdnnt+Y5SStzQ==
X-Proofpoint-GUID: 9yHn3Kx91KXC4t6-rj0Lz-l3NL3jy3vF
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e000c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9yHn3Kx91KXC4t6-rj0Lz-l3NL3jy3vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190081

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


