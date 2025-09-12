Return-Path: <linux-arm-msm+bounces-73308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC9B54A26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6D207A5007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668FD2EA73B;
	Fri, 12 Sep 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpZLhtJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5A2ED872
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673845; cv=none; b=eO4axgpEXS0IL9fJGOTH5euSI9E7JT480qnwY3xtNUZrTwJPQUdOUAtxEiBGBuD4tYsXp3ldkyzEc5ZOMNgwd396xKvAE+gRtXMzU770v2JTczKXJWE7vx58cOQMS1y/XL3OJdDe9MqSKQ34JtzKG6Fli8SOd1HQxrq5WmFbSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673845; c=relaxed/simple;
	bh=1RhAAhWL14KKCCwjLjtFQQnHEgSFzReQkw1xUr24XvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nc/GOocNTTHo2n3xj8mccV5M9tuFNPf0hNmMCR3s24n8Z/17Iis/ew1V88P6ZU4tkabb7KYdaHcWpJ0443zyTrm2FMo0ZojXIr9pdZq9kiFY+qqfcaGm2KhmNNP8HHH9YoWaTVcJvRLqgGBoFRysnjwUb2brozfz3GGNilJJh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpZLhtJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fiPh023969
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6ixdakbQ5kVuK1Oh9RTq+mbKIlEiLNdgoJFQouUhYY=; b=FpZLhtJEUzFZSGt7
	q43V341L7ZfsFjv4qk3jaCT6k/npPf4Us9JafjejZCvcBHGsi/kWmN9w41ixpi9F
	7bdorMaHGnv5v9PQMNvLsUcnsMqk8Zljp5lPFOg06pt8m5rXWlIHS+KWsgbTv1om
	g14V8fF5F7G9w50drTe+jQtTcdRsZ4n1GNiWWW1urhPe5KuJtB9pWRrR1D2qU0Rq
	aw+nnCSYjrN9xvmrIxXGNKlaFlnvIAvPlf+EICRlcELOzDGr6t8EVWMpG9EzkkQf
	c8129BIdf4u7Funx7B6aUvIPasQ1v4Q02UyVruLSVBRrvduBw8drgQrq75Phpfb1
	0JlVxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fab6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:44:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8186ffbcd7cso55221485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673842; x=1758278642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6ixdakbQ5kVuK1Oh9RTq+mbKIlEiLNdgoJFQouUhYY=;
        b=rkmOxNqHyxfCzFd029P7mqVDG/NvUktyTIoQKM+qLoBoG+1Ogngg/Z1f8ga/ciWmvX
         MhM7JDILnK8UsjQDZwiBfuJWYylkiEEMqzuhNCYG/dmsyYHmVSZnXa6VFSCno66uNqIG
         T/2Efx2ZrR9G2YKvT/e5rrZ64iOnP/X+8Y3CdLPb7WjqBvGtcSiqfs6+l05g9xhONPSK
         Eq6ZnlzMBCeIJ0ZgKTrHdJ/kJLnIRxdBWCgjVx63g7+9oncamcBp+UYusb+ETEYP6qbq
         S5ZOWQqw7qc/U+aJ49FpJ0I8jDlibCLB8y/hP6xCwiuXQFdBb3Yjw+80yhvl4Qw8oCJY
         8jNQ==
X-Gm-Message-State: AOJu0YzxeJk8JDadmTVlvEOboBy66Ut/QucpjdtbxFU/mdsbKrS02pf3
	0k1bjMCSz6BmYZ09v7Seb4ymf1mVVbamLiw/4odSii08EcGo/WzVpwX2Jo0P8qM1qnOEUyhxin8
	x+DhGJVBjW9VXoEXEm7NNHUjtkv5PnZsmGn4vNAKPyHQgSotEO7RPJEyE7+JrC2/Q+msc
X-Gm-Gg: ASbGncuA0Nkf4yTA8Bnh72TPoQHZ4O4+BLT0iqsOo6UI6PkcwZ/FKOkDDm2Ndn9EkiJ
	X1CEb36EpWDBSrVnPBEHXqHT/PpuCcO7Yv47c3Yb89lu6rK+2h8v1EkvyMFUpcwGhuo+/IfGrXh
	4B+pwkewFyBXopi6rBdLv9ruGG0VECZZ9ySl/CzXcsGIjBhLqYTl1+Hx4rjbgGOmVGrgFlS07G3
	vryoED3eerHyfmiWx9XTwQ1QMw1v/5sU+y+lwoVmGAXZ8C+5J69xPlKdyL/7z+G71sDSfo1kPNc
	FLb4jVLfEj01IYTCmSg7KHdX8faRcCUJ/rZy4l348tO5APmKG1i10+z97sF3EGmsCUd+/RtrghZ
	s9oMVolKH/XhFsT7Fpt88EA==
X-Received: by 2002:a05:622a:1455:b0:4b5:e9b6:c9f with SMTP id d75a77b69052e-4b77cfb686dmr20878171cf.2.1757673841873;
        Fri, 12 Sep 2025 03:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZWNrezfUYTvVB+lGnpKpkT5LYRuL7bmjPVtk+17xLrpknyf/SfpAgAUionq66fQygxAEbJQ==
X-Received: by 2002:a05:622a:1455:b0:4b5:e9b6:c9f with SMTP id d75a77b69052e-4b77cfb686dmr20878001cf.2.1757673841419;
        Fri, 12 Sep 2025 03:44:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33f3c01sm3111408a12.34.2025.09.12.03.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:44:00 -0700 (PDT)
Message-ID: <e54daa39-ffb1-4f0e-82c6-42e45efe5044@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 12:43:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook A14's
 displays
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
 <20250908-zenbook-improvements-v1-2-43ecbbf39c60@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-zenbook-improvements-v1-2-43ecbbf39c60@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3f972 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=gxl3bz0cAAAA:8
 a=bDNgJRMZ7ET8QJXj1coA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=vUPM0Wvl0xcrLs4nqPIT:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: JTHhZJ5z1-DBZIPHICZ_wBjkab20_GZ8
X-Proofpoint-GUID: JTHhZJ5z1-DBZIPHICZ_wBjkab20_GZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXwjxHjaeLlPlK
 gHdIZe2kbY6PDgAuJ/LHwYj89MW4kB1EUUrspXTrS8mfT/arejcDyI8wkq+Mi2hkRLoGQErPjco
 hQSeVcAUiKU7t85S2ksq2dfGUrcycZcLcbeVQGiuWyo4XlbzlAVCzilEK5A+gvYB295JvqW2vI1
 jED7wxOdFjvEshfkLUPv2GwaPzJFE99hbLV6J5zQ/EcUni0KVSgZZY4HYVA9D3a5WHlG1u+hsLo
 ebKG+vkTfGQER4Nkus6ZkWiEYSDkM4LafqZbOC9KGU4bUZ5k9WPtz3dcjeNLMt7rGxLF0Ioqwu+
 NITnDjUkzG0br8odKuG0WRm2jIl9QbVmej0+UqKCUKOiqEjv4HrOKIX6M9pmkcdRdJSlytUlq3H
 hNhrAZQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/8/25 8:45 PM, Aleksandrs Vinarskis wrote:
> The laptop comes in two variants:
> 
> * UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
> * UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels
> 
> Even though all three panels work with "edp-panel", unfortunately the
> brightness adjustmenet of LCD panel is PWM based, requiring a dedicated
> device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
> allow for this split, introduce new LCD variant. Leave current variant
> without postfix and with the unchanged model name, as some distros
> (eg. Ubuntu) rely on this for automatic device-tree detection during
> kernel installation/upgrade.
> 
> As dedicated device-tree is required, update compatibles of OLED
> variants to correct ones. Keep "edp-panel" as fallback, since it is
> enough to make the panels work.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> Co-developed-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

[...]

> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Aleksandrs Vinarskis <alex@vinarskis.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "x1p42100.dtsi"
> +#include "x1-asus-zenbook-a14.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "ASUS Zenbook A14 (UX3407QA)";

'model' in .dtsi is 'eeeeh'

[...]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> +

are both of the aforementioned variants' firmwares the same?

Konrad

