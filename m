Return-Path: <linux-arm-msm+bounces-74420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E31B91145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 14:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA4E18944C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71222306B06;
	Mon, 22 Sep 2025 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICQHhCOJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C55303CB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758543329; cv=none; b=N187v6WxNKH7ymqtDrLuIMqUwj02wP4Y/fIO9BsuxzFyR6JZ6F43apNCiBD2r3CGYKXwfiCP9DFDket7IZ50z+GTvOkQ0Ep/zDcQqgQBfjfXaFfzlTrFjz3lZFhJv6y4wGuQvk/uHFrzf/c9aijHkgp7jYJpSKms2uTXU1bL1s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758543329; c=relaxed/simple;
	bh=G3F0xMEE+TMsLruePptbFERK2DWVWwzzsLhy11bsxDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9h6GpFneNsSSjUS6VDLO8FbnBYd9FpWmCsJXN1TAKLQuKUm2+o62T20BfkHCxdmRAagUZUNMhJVxW6OZfk6J1jogX7iTiZ9w++ZcLlxFxJpEwgKabquE4yU98fcrYIzjkvI5nVENl8+VQi1Lwc4x+5gXTTZrNRL5VQ+2OewdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICQHhCOJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8ufR4030265
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 12:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SOcElaA9ELOUb5vvWlHmIL1+0Xp49z4i8jOou1NK2U=; b=ICQHhCOJDviz6wjG
	VQYHLnyag2O9oFXDHa6uFvZ79hCsn8n6yzpFtrncVlK49rpzkZBKkULl9Su6lOAN
	CEr7KbchXfhXaXYjiQ3lp3vPSiVcLSEGIbYrCzxvGRkd+aCxAfsmMhsgA0DgvIWj
	/FySuvB/oBq0SX2jN9n5HxNwpfPKiaWkWzg/h3MQususUtJlhfYiwx/OwYg6snvW
	JBdRj2GUDoDz7QhejmgrhuIPPciUwGpk3ezVmpGj/VporvYy1JJxcVNlZcAATRvH
	RuRtXWnQEyAGMFHUpNLhTp7nyyuQfEfKc/FA57tRhp1Ny7VlGxHqytDieH/ph3A+
	uoFUAw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98cq6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 12:15:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54b37ba2d9so4031456a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 05:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758543314; x=1759148114;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SOcElaA9ELOUb5vvWlHmIL1+0Xp49z4i8jOou1NK2U=;
        b=rKu8bs/iVUPD3zC0EtCQVgzfferjXYEYkg8cc9hZSlO3UYOVaLpB6E2pp8EE4bfGhJ
         5GvZzUK0TWHPrdz0+YyJFXvtpDlK4UwhBT408AeKEDqZC6sjOerqfTQtrkGoO1Om5/y6
         pXMDefmLT6iA96ql3EKsqGKbnE+ZYR+4tiwcR22ejcj/VxrDw30QMBvDFkSCZm5++rWt
         ++fH4fkY1H2G/sZmOB07YiDFWvD2Ibsk8S5nf1VG0yZ9ek8rHgF7ujzakMEcjEMND429
         wj2MzYxNH+lOsl3QvMFLm4RSFqWuPPxLp9OXFzBGv4LhFq13UAdLCWxQ916/pPwDFjU3
         Hmpw==
X-Forwarded-Encrypted: i=1; AJvYcCWtMckyAYZXOFcUlZEpgDZWN/Lu/ows7DrpBC/Qgz0UH+lncRmUamI9279989OdPY9MiMAMATtyyHhSy5Ez@vger.kernel.org
X-Gm-Message-State: AOJu0YxO23VbWxdjuHvkeJgAwbT8OqC5wncVFtTDhDGdNFD9CowtlpWW
	SE+NHVz8WvOifmq7eKHow8IxAONHXhOeXjbcx3sio5JIXdWEVZi8jom3ecu0R+ckzE7CXnIy/eG
	oAxoctThmrgYQuyunz5FKQ8ipTMdSAqZXtlw0g4W4rHb2R4FoCKRh2+79/obKCAaMrogj
X-Gm-Gg: ASbGncsYMlPlCg9/l8Zf1I8d8hK7aDBHwBiDiUnFAQ1m+JDFXJVv4tjlAGPNTJ0ID35
	ixYBTlazZQdDVqNqUs0KK2r3tA1DUxjCA35J6PSoWaXCUMq8GYT5ygEy26OyPjuHXCXRgn8zUEh
	7MlJaxbk8zzkF37XdVSmEzuQLXRwf/89yuqn6SoaTNuJncpMZ3BOaOD+rNbF48v4Vqd7OxOOun4
	hHLdvB5zDycYUXMdrqgLt6Dp8FmK+JsFlUPvs60jxMTzvOvUAMAJTmvVts1KmeCpAek+GXxyKZV
	4Tjce7tstCLk58HDJyl3wWXkt9md9dXt/MYEZEbzGKQxS61boNCOImTEryEKZQM=
X-Received: by 2002:a17:902:f68e:b0:262:f975:fcba with SMTP id d9443c01a7336-269b7952ec0mr164439965ad.9.1758543313680;
        Mon, 22 Sep 2025 05:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETp5+7x0LZwwUg6TPsnjfrGzvqeKvEn0RwiiAxqp/8tCtsL27SgsBFX8tYALlFBBn3b0Z/+A==
X-Received: by 2002:a17:902:f68e:b0:262:f975:fcba with SMTP id d9443c01a7336-269b7952ec0mr164439345ad.9.1758543312965;
        Mon, 22 Sep 2025 05:15:12 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dfcbesm131950355ad.88.2025.09.22.05.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 05:15:12 -0700 (PDT)
Message-ID: <134a9c5e-3933-4e53-bfb8-5d1de0111fcb@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 17:45:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
 <aNEHJv92i8NlaSO3@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aNEHJv92i8NlaSO3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UGoh3IbBIYs2zznahHYWbFbXIgKSKuTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2pJSx0XRFXdT
 kVIBYdqrKP0OYuqHgeYZ5BlsfD9uH94PgVw6t4wNar5US++ZoTHnBC5Xsi8dDESSu7N4G5D9Q44
 te/41YmzkYwlXyaETPE3tZPF2NpJqxnFtxsnpue2A3V8u48QrpGtDaHDgA3bfH6yS3ZCopLgcBH
 otSe6jjJlQHib+WAk0CJD8P0kAzrLM3zF+5zr6eMGHlakIOxf1DLceS6tI8P+DOevh2winSK2fr
 TcRa1xsOvZaLIaQQgBlpEw3ASNqvOLFh63nqlCDZLeV5gmPErxE93pDwpwgGl30g0ImQT19yiHt
 lBfr5f2X+1+11TYtL0nv+YzI8GAQHzQtF/qLSU2B+EqxMZxT0PRZFl0AxzLiS4X4t0NkScIeje5
 YrpX03bw
X-Proofpoint-ORIG-GUID: UGoh3IbBIYs2zznahHYWbFbXIgKSKuTn
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d13dd9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=b-_fF0JyYpgD-z2UGBkA:9 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/22/2025 1:51 PM, Stephan Gerhold wrote:
> On Sun, Sep 21, 2025 at 01:11:10AM +0530, Mukesh Ojha wrote:
>> All the Lemans IOT variants boards are using Gunyah hypervisor which
>> means that, so far, Linux-based OS could only boot in EL1 on those
>> devices.  However, it is possible for us to boot Linux at EL2 on these
>> devices [1].
>>
>> When running under Gunyah, remote processor firmware IOMMU streams is
>> controlled by the Gunyah however when Linux take ownership of it in EL2,
>> It need to configure it properly to use remote processor.
>>
>> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
>> devices to create -el2.dtb for each of them alongside "normal" dtb.
>>
>> [1]
>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile        |  7 ++++++-
>>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 296688f7cb26..e2eb6c4f8e25 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
>>  
>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>> +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>> @@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>> +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
>> +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
>> new file mode 100644
>> index 000000000000..55a2a9e2b10d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
>> @@ -0,0 +1,28 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/*
>> + * Lemans specific modifications required to boot in EL2.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/*
>> + * When running under Gunyah, remote processor firmware IOMMU streams is
>> + * controlled by the Gunyah however when we take ownership of it in EL2,
>> + * we need to configure it properly to use remote processor.
>> + */
>> +&remoteproc_adsp {
>> +	iommus = <&apps_smmu 0x3000 0x0>;
>> +};
>> +
>> +&remoteproc_cdsp0 {
>> +	iommus = <&apps_smmu 0x21c0 0x0400>;
>> +};
>> +
>> +&remoteproc_cdsp1 {
>> +	iommus = <&apps_smmu 0x29c0 0x0400>;
>> +};
>>
> 
> Would be good to disable &iris here for now similar to
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=c0f045e303e014cec5d883edf82fe5de74769944
> (I'm assuming it is broken without specifying the iommus?)
> 
> What about GPU? You can load the GPU zap shader in EL2 without further
> changes in the drm/msm driver?

Lemans GPU DT patches are still in the mailing lists. Hopefully, they
will be picked up for v6.19.

-Akhil.

> 
> What about &remoteproc_gpdsp0 and &remoteproc_gpdsp1?
> 
> Please make the changes in a way that they result in a properly
> functional boot without errors. Disable functionality that needs
> more work before it can be enabled in EL2.
> 
> Thanks,
> Stephan
> 


