Return-Path: <linux-arm-msm+bounces-75250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E6BA29FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123431BC2AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2EF285042;
	Fri, 26 Sep 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8+gxCT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813470823
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870446; cv=none; b=hcv7UkWwuzpmR1tQiNP8btQZSfhTNLz+1RbhGWiCUBcJa28oWJBVd7jZhk5iexf7VonRG1ti16cN1g9aUjFkviiyWjDChqBY77HC4LMofhu64TZoPBqNxwUpFy0DcVzFFxLs7MsQaB2KMtM0ysvpaHWPUcKdajKjbkFqO/t1nwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870446; c=relaxed/simple;
	bh=AxaZdK8R1No79fE6Qy5I9BNl3aGBjCXFKR8l7peMY8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArhmFtR4RIXhQC4TjmbL28RTrxRUyR/ILxEqDi2GRYJB3sRUMGknbis4LT1yTyZTPdepMlQrpAiVXdR1YA8oNmvLYBe8rEi4O8dQ+pfzV8Sk9OtQjWL71TUW9FoG6u26HHQTxuzm5fpubqlzkINWuQcN3mGbfq3UD9UU6VjWB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8+gxCT7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6ltHm011411
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nazwzXapRFhXWyirBrA7SaFITLf8VA7VA3yOttfzeV8=; b=P8+gxCT7BT+NRCvi
	v+0eEBmZ7jN4+TVgBAJQ19YHKI0Sa1ENMhlSOh9GXoEjyYXf0jyVjBRztSmhj3Os
	ogYYGX3GouNkIp2IAdiiGKYmzYBd4Svtodg5HG0wnjjJXmTTsHlGw8vQx0wVX3Fb
	mgcv1fCUkB67hvvNHzgzixsXUCueX8tExY4/5xht7FYNGnA/Yv6vmtylt2zuf2CJ
	2hKoPO2piPi1xhNGnUa3IxSutm9vcJ7QVDh53ZwKLoUPJQc2z+qG1oW2rc9gpnRy
	uYDukiFMzoJNiQG1+VgsbBSbBlX+2k6/99VLwCRb6rxeDtjqbeAIxVn1OsevSaPr
	VBsJfw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1swk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:07:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso1397783b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870444; x=1759475244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nazwzXapRFhXWyirBrA7SaFITLf8VA7VA3yOttfzeV8=;
        b=EsBHUm9Ck46zJ2PZGTRIC2HWyHbHxysXc/apby1+oaB2Q14jG1V0DuBJeC/mRMx7Hj
         EJbuUBwKVQ1jxwnSm99hqxckGrrX5P85IkJd+BZRcOiQHEYJ+yNG5CuOFI3S1dMiCkPD
         qq7qF5K49JhWh49JYYu03/+r2fkVFtEH4bbIQHxqc9NeroumCIvYiIceqB8CeIMq0Fij
         LXK2t7SwJYxvpu4yofN4C7Xkf15vhgELU0DzmM4/9+gls10do9WJLOmpq6AH7ENRFse1
         GdksPMO+UQJhjB1ZCPYYYojHFF/ob3mwiN3FKdmW+L1a0O+4SFJ1H8OVW4nWqNiYiuNS
         C61g==
X-Forwarded-Encrypted: i=1; AJvYcCWNecSSlWZmCNMoikEyxnIxu2OvvQGhWpzZTuAEP/PUPDiSv0/WeqwE9FQFqgPF4XKMElYDKbaU/hqEqdol@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9HkkDs2MTpika+101/mV1QAsRVK5Wpagbvs4SS/u6DBXe9eB
	XGMqeWAMB+D7ZOOHCH69kfi8i76c01gxLiqKRq5ur5Gn23gXdmXjVzKk64ZFQ6XFgDxFfOJGDRA
	xsRpi1Z4Dnrxx/pyx3Cs3RYF4FDf9bsGjlOVqHHywk9UG1NQ+ZQjJvUXBbm+nYU52KkTS
X-Gm-Gg: ASbGncvGTfi27eR2RRdENkoJpG4qXySwmhzgXwr2jh16DQqSVdFDfD+gqdwBSogO1Rz
	vf8yt3WLCePKAHQftAiBfZ1fS6196EZ5H5Rnf6O7vX5Jc+hYDgPvYzLcNCFMWwSrw9ZBpZao1Ib
	bwlXuQ+ylJ9y9jhaIjKJZLyC9iutuZWhKrO/DW2ayDlsuZ8NmxovEt492xj0LgymE8eBo/K5dIR
	L/ll/L496HcwqG1+bqw7z+E3QleyAq8IN1Wb2vSpeVpYrYs97i32WIyTYhLejqMIoIBS/h/+iIS
	XYzx1SUfzJyfsWtjvUMqsvxJX2WuOZV3SFk05kXeLzrAEyPAs8N75puZP78ZgHIUir2yOHdIYmt
	lS0DmBPOgluK98hGC8uvxjEzr9SN76wCXekow30ZWQSmlt5H2MUlzdWVPog==
X-Received: by 2002:a05:6a00:2b1:b0:781:eaa:9801 with SMTP id d2e1a72fcca58-7810eaa998emr2582707b3a.24.1758870443798;
        Fri, 26 Sep 2025 00:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyg10xK9jYOsHHo0lMszH8thVw+Soa7Y719quhlAlIVZ3yhfSr4Ayhi+M2wkiXmukMqkITHQ==
X-Received: by 2002:a05:6a00:2b1:b0:781:eaa:9801 with SMTP id d2e1a72fcca58-7810eaa998emr2582690b3a.24.1758870443307;
        Fri, 26 Sep 2025 00:07:23 -0700 (PDT)
Received: from [10.79.195.132] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c8ec7sm3730797b3a.30.2025.09.26.00.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:07:22 -0700 (PDT)
Message-ID: <7eb0af93-7cc6-4b1f-beea-d5663c1bbd59@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:37:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] arm64: dts: qcom: Update pmh0104 dtsi for Glymur
 CRD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-13-8e1533a58d2d@oss.qualcomm.com>
 <CAJKOXPfCFS4UDbN_SejG=zJt1Dt_mtz_p_+MGAaEr5SpK3ydRw@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAJKOXPfCFS4UDbN_SejG=zJt1Dt_mtz_p_+MGAaEr5SpK3ydRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XnvVPkzOHfvE8UnROrT9jWYPjJWc9U5v
X-Proofpoint-GUID: XnvVPkzOHfvE8UnROrT9jWYPjJWc9U5v
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d63bac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JSSV1tAL0pHps8jy9LMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5sxbYZNXUpT6
 pfJvIaIjtNWtH19ch5pHXqzRGlO1QFjFY6a62gohL2KUwvuPkwOK4mcEF/jCHT1xFoKlpSn9Pf0
 MuY0Dt7k26oowIhWFcIQESfFfhG0ItEYDYqPqqhUrl0wtDlNEY+8TrPtzHEQUMxPWthsUKmzaiA
 A195NMVBFiSo0zmcQHHldxrbBAZt/7o0Sn5xeoRCwYxu91EjzryAji27Ow83zzZy9PKo3fmGgm9
 q2JRn3rcbGwXkXt7mSSFgbHFvCAoTkjSPvWIPIpFD8+JXYZwMiKSVfd1i/wAE4YfgHpzGWKpiyd
 xLxL7PIOh8qCPOeROtVlkLNTfR88Y/GUGLyLYQwbJoO5QxJvnQF7AuKfJnalHGTledFjcEAMJJM
 9Nwj2Ah9PLFysUseguXMH49chggXLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/25/2025 1:25 PM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 15:29, Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>
>> Update the pmh0104.dtsi to include multiple instances of PMH0104
>> DT nodes, one for each SID assigned to this PMIC on the spmi_bus0
>> and spmi_bus1 in Glymur CRD board.
>>
>> Take care to avoid compilation issue with the existing nodes by
>> gaurding each PMH0104 nodes with `#ifdef` for its corresponding
>> SID macro. So that only the nodes which have the their SID macro
>> defined are the only ones picked for compilation.
>>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 84 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>> index f5393fdebe957ea0caf4bbc16117374b4759bda3..d3ea7486d842ec813a79268fc1466e1513426d78 100644
>> --- a/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>> @@ -6,7 +6,63 @@
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/spmi/spmi.h>
>>
>> +&spmi_bus0 {
>> +#ifdef PMH0104_I_E0_SID
>
> NAK
>
> I'm surprised you decided to ignore all existing discussions and my
> clear point in this.
>
> This is neither readable, nor maintainable.
>
> Please join community in discussing this, instead of coming with
> another invention which I already said is poor.
>
> Best regards,
> Krzysztof
Please ignore this series, it was sent by mistake as v2 prior to v1.
I've replied to the cover letter mentioning the same.

I'll update the v1 and re-post with all the comments taken care off.

Thanks,
Pankaj

