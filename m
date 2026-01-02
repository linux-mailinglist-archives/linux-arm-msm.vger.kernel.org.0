Return-Path: <linux-arm-msm+bounces-87166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B2CEDA30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 04:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E3D23004C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 03:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2392882AF;
	Fri,  2 Jan 2026 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKxYLh31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyz8O2Uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728FE571
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767326295; cv=none; b=XjMuSkgf00124WfKSipDS4sAvvczIYpME4u41Sk7FX7RJAOe2zI/qnUGMd5M5jvDr8WFabpr63sEyPjfs8FJquFBASWQ7l5m15Brbow2cuPv40ZQlB8hqGog/SYwB2GTj4yel09N/EQ+Nq86CslvKFV7heNTwMFvS0UD+0KGlXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767326295; c=relaxed/simple;
	bh=ycHUc8IVCavpeEdwZ69V4ALFa93QrcZWk2Ez82dIN4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akEWgLRNgkXxVT85nr1qS+FMaOInCIuDJCaMI7maiQ1VoPCQdiZ06AZGPHlzGZ+Lflq4pvbscLxi5Na284PFNrQ1i+MxVP5QAB06HYsVnd0P3posY8mBqSvxCQwyTCd3Ew/1OL6UN7jGoRyGdwV5KZ+Y5x8xq9l45GeYSwDkiAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKxYLh31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyz8O2Uu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601Np07F3168119
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 03:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evTK+OpHi5sVHTem6I4c/tAXyRfo+U86rrd4OT7ugW4=; b=OKxYLh31g8FbgFi1
	14rysVFl0BCPEkWlZPCZw1yEI23fY7N5ZUQVbMvjPtPc1hD8JAfyRmc0EVWN8Z9R
	TV9ENAvYvWRL28JecttcOzzd9FqlIuxsFJbN36C0OiM+S36GBahjqGe0EJaZRWiG
	gJOPdP1pstyQRzVRwKiLSoXDH2V3yJ2CfL/bIzzhS8XkNkxWblNrs04SJBkialCm
	GMiWhM4gEAUi6dt3lL79vjwZ1c9zLYJdkGbCc6qTBZ9Loi8T7czZliF6/T0wrMoG
	FBrWMSkq+ox0PvW41KmkO103g5J4vjgrx6Vn7e/WLedmDPV4m6WmIySlHiEhdXUS
	j1Otvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8tvw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:58:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso10952596a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 19:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767326291; x=1767931091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evTK+OpHi5sVHTem6I4c/tAXyRfo+U86rrd4OT7ugW4=;
        b=gyz8O2Uu07jbE5KGbkQxTMJUUtaEMdSuG15lfcG2mG436HrSrH3uyBzKkShqPKaMpi
         vI5y7wU2lh3gUR9sKDBwSfmqhXJ8lWj9ZB+18TIIe0hsaA9JCGTo1sAmu9r2PRilOUAR
         L1G7bLrT2fxfB8IMyqipIFEGJ/eSs/X228Qp3ovB1P+bdluIJ3c0dDf4sLVWZNXVYQiy
         mIudhlvghJYltgAcwnOr6xAWc2gTMDW6cOEp6+k4V6qMsNi5wLbVPYBqzdaS7MjY2/41
         Xz15d//ww0MTGyobvfTM+jR+vKCl649B2R5cI9f3IYx2+mJ0tIzDYv2RzTytehRSzADh
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767326291; x=1767931091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evTK+OpHi5sVHTem6I4c/tAXyRfo+U86rrd4OT7ugW4=;
        b=LXgZlUoDNSDYthCKP7kDXrisQFRglQdYd4CuVNAgFdBVkL+osf8DiOmBp0gd9+XoH1
         6xUdLYviXCuMT3eqfjSwoDWtyYVQS/xFzqUhJlqYalHx74yRC3oIcISD411PBJgVm2I4
         FwVudT4pjRtxyuk+0PzqmBi+qIghbim2NnYekRAgX/lkZgsAWZKaYj0j7hAA1axz2uiW
         Dg3b9pdirGCHOAHUhyUBDIx09uZ2+m8HuwLo1HgpJSCDSL9nIvkeWCwBuwU4h2h8vuwk
         YG1CY9AVJWLscRgkW5L9eY2GbiiaSH03lK1NnCFDOK3fZfGyP6GDSRizRMuGRfH06V+j
         DyEQ==
X-Gm-Message-State: AOJu0YxNgRdVB6t9IM36o6g4qtSyUS0w5DPJJ+emEUTWgg/IoaP0Wuik
	cjWtgIRUBhcT/m+5Z9IYlTXtF7GtkVxCFODcxMDlDn173gd1IV13QC0zSF3aqyKjIW/YY2uWERk
	Dsll02kvcHYS7gbFxNaZxvLJzxRxlTBciDbnz3ngszj+aVD4myuW4DtmYidk0r32lwzxBhNOqgb
	f4
X-Gm-Gg: AY/fxX6wO2qIQcYV38UNGSiFTCQnfRjel/aFh6tKtf9PM0MkLNKPT9vsgRe/xFtdRzJ
	s9+rmMoTFI3lEeuxhx7yf5QfARced4RR21E3xzRULR2qgOpFYREiNwrsLxbAyaCkcV74bq220R7
	avVXODlNn57qMWlxcFoMjxAErF8LjYtFjjmraIbfsfR20oaWDjya1dfJRCFeQZm/pjQDVDFv+Ij
	yt0pS5UmmmudWmyG9wfd3UbF2h8auXoPl+KqXQoJ7SZkusP+vWnYSqK6XL26ksCYtMjjSuIQMXQ
	aHuZvv+5JGy03qnepjd/zLaCpOGT0nU2hhgvM8gUETsbOKAYY4D8RRq1aurL5LbBEmAZR8wV68b
	WztTv4kH0jAsZNzRL0hi5r4C1LYTsd5BOoOK4mGQ=
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-34e71d6961amr36944761a91.3.1767326291333;
        Thu, 01 Jan 2026 19:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3UL40tULbA7Xdju+V+G6g4Lz3IYvez9H/jQUQHY40RD4jLaYv7E3JXep8qKMd/Cp/pozMEQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-34e71d6961amr36944741a91.3.1767326290854;
        Thu, 01 Jan 2026 19:58:10 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7c8sm39340592a91.15.2026.01.01.19.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 19:58:10 -0800 (PST)
Message-ID: <0786c6da-5ada-46a7-9c78-276b5e13c9e4@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 09:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-2-2b4979dd88ad@oss.qualcomm.com>
 <cdec91b1-e455-452e-a9d6-47912d0b3aaa@kernel.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <cdec91b1-e455-452e-a9d6-47912d0b3aaa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDAzNCBTYWx0ZWRfX3E56GE7uvBrw
 rFXPCiaQV3TkPzRfa3m0K6sTnlYuvCa4fj1fsPD2TdIxxDNr0lYrsJDBu1eoyeNNTJQed14bzie
 XyclsbZ1avhHvI+8W4nGVPS0oVJDrMQ9I8NVWNRWJr3RPFmTnU+wWyLoErQWIATz52TRzchfgSg
 lxFnOm/aOBxKCHfD6RmU6nmOF+3EYgW3bJ3qqIDEeMNHOs6sT4mp7iSgryJsYonrCPikLXUdpgX
 GfzY2GgmjsSigyRvKTjy4NmQhMa83ebplPK0QUhxPzQDzSr9+XZOQATq0YLtDM3dVjzkf9ginNq
 61MBpUn5xVOCz18G93uJmaxe078Za1ipzE9fcL1G4QkdEmOi8+I5Uz2Cc+pzElyHyZzFOH3FHOF
 ZGcSEZy7RbALIX5rmzHItFc7FKH4sW106w1W3ULbPBLfly/lgq/xR9atOiuZiXGuba8WAsjDtGz
 WNrJXiIRM+MsxJAzdUQ==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=69574254 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PWh8vqcTduwrkuILrrUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: QCUq8YyYR_ludHSzLjOi5t7TyZw0ti_J
X-Proofpoint-ORIG-GUID: QCUq8YyYR_ludHSzLjOi5t7TyZw0ti_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020034



On 12/31/2025 4:17 PM, Krzysztof Kozlowski wrote:
> On 31/12/2025 11:18, Maulik Shah wrote:
>> Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
>> bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
>> hardware register bug on X1E80100") is already fixed in Purwa silicon.
>>
>> Hamoa compatible forces the software workaround. Use the Purwa specific
> 
> There is no Hamoa compatible, there is no such name in upstream (except
> dtsi), so don't use that name at all. Neither here nor in commit msg.
> 
> 
Okay. I will not use hamoa/purwa, will use X1E80100/X1P42100 everywhere in v2.

>> compatible string for the PDC node to remove the workaround from Purwa.
>>
>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> 
> Explain the bug being fixed here.

I will add explanation of bug in v2.

Thanks,
Maulik


