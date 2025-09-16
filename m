Return-Path: <linux-arm-msm+bounces-73622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA87B58BE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4F53AC9DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 02:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F09194A73;
	Tue, 16 Sep 2025 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1n1VC/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCFD27E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990117; cv=none; b=DXoMhCG2jEvrbEztFj3kEQdy4QnbtGXgQyrXCZmvvVZDM/wuwCrbxEyBKJ6A17FnpOHJw3AoRo9NsFl2hcHgIRITXnEsayB2ovc5JTrJ+/uIs4hVSuFCxp0QSbH2pnVrsiNVc5O5jIEjzMcJozwI4FMwJOdoDNF77+DZw2DasJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990117; c=relaxed/simple;
	bh=BuIkzkW9SurkzhD9X+x4Ym4NDCdNu94IfsZgoDxRdV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msmwBHqBlVjzMmfi8OjBlCr03wApLVwxu/8XHA0hn5PT4FE8IORmUoNJmOvqLD6wrQrmfURfmr39L4UB2/2oimh+BzpITez07wQNbzc9haxs87pmeoAiVG/kiqqygF2SCMV/Jen9suDgXCxjce839fY/cJZWI9Te4x34MPpdVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1n1VC/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FGZ2gE021984
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JASlTDQ+qZuxm/AEyyWjcH2QxjTgQBqcBlxVgn/e+JM=; b=U1n1VC/ugsjMH+FR
	TRa/Zp81NWeoR+8v4fb76LnrDsQy/5gxZFzFcEb3X8yySbtfh4JUGpO3UodDKUYc
	Nsrjrl2upDyLuKONmqHtWzZURcUKU+L0CK+npEflmcnDTnAN8a1OlC78KKbBxR5T
	lWasq+r2dJ0gFuskpky3DF0jdCon0FWQeznM9qs2VJJ6jtZCfROyrheNAU0SPqJ3
	l+YLqv+OM5LwIqO1H7lFoUEh3x1HfbeM6lx7Orre+OcSJsa5xVBLTSmBYxq2of/i
	XLjPKBzV5be20h/eOcy69hAr0cztLeyxsyWBRs16vLgDqU0nu5q/NVyP/XDWUrqk
	2+0miA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n2qg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:35:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77265551c77so8372491b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 19:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757990115; x=1758594915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JASlTDQ+qZuxm/AEyyWjcH2QxjTgQBqcBlxVgn/e+JM=;
        b=RtrCEv8LsUc5RqlQ0zwlJE15XjDoLo1fB8VgtCPKNlkYKih6o5H7icRwlIcFHW3/Ej
         r0oM6SSOB5GP3yz41a4epV3l7U6RUBRGxhpdL3fXb5ALu0I2/d4dAEV9TfK8udp5hImb
         e2GFxUnE/z10IqGX9gqagxmSgIg6tbYChDXAyonbswzHwCD5OPYoYwDzYhN8AHUDol6/
         rtJw08cOMk9hmbbwqg6blnB48uogiWm15E961Al4qjXqi8UkBIBaydroGFg6FQffVVpE
         0ojvm+GlChDCIi4Z5/xo0LwtUJ3NWeqK5WgshZPywUqg5EKNDh3XvKeKIO0DpJ8tluzv
         hFxw==
X-Forwarded-Encrypted: i=1; AJvYcCWY4wVbDzKzeITUaUE54eORx6fGG//9555yRm2mq9DPThfYlgoaQlZfyVa3JPhrxw+GpCYrBL5keSHJr2Bk@vger.kernel.org
X-Gm-Message-State: AOJu0YzakntNE81SrN2BQudX8aPg11p7AGFsmIplnIvsI/dB/AqgeAEn
	0Xz8cqI7fy65GJuBhR62fnzXsfxb9WZFkQxLs34LZi1DmFyAwzM7wZ+x89UPQIIfbvh0Sb7V7SP
	InLOO0bGizXYW2pUK1Zv5zL2/BZV058tFfCXIO0zknDVsoaw3QmR0d0Uy1eyc7/cZv41W
X-Gm-Gg: ASbGncvzCE0d9Q+foYNvbHsEsWT7O8BrqUieZv/mWpIeGYhPx91thsA0XVYGF8APxFA
	v7OcdnEPZLb7itANLJI1mWS79I08SGPdWqp4VVdwgyJ30rvdYeMpX1Y2KcAKJ7Kl34f09OgVvnz
	jJHbnp004pw6B5/kTAHcY2mEINLbjSpQYERKQvlY/YROva6fuRwqGC729kHdm1f0Mskq7JiGDWB
	ka3UWojQ5XHzjGPQEjly1jPaAWa0/mAJD8B+Ti4cLpU5U6IMILZqkAyR9mAF9Icjq/uJA3fLBL8
	RC+SVv0Jxkn+AyslHZoQ5aRrDkAUm2/uO02uHsHFW80AG80PWKnfeuCAboS6vvVagbXJPiqgCtZ
	L3ntN8QVT/3aKij/Nm9NmTARqYk8k75gyJQqJY40=
X-Received: by 2002:a05:6a20:7343:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2602a28e319mr18346435637.8.1757990114775;
        Mon, 15 Sep 2025 19:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOLGzO215Y1vQ0GPjMPr4AcmObjX2DF8YFcM9ZtdXs0aLfAHkLZ+r8Bv6nCk8Gdo2y2Iny5Q==
X-Received: by 2002:a05:6a20:7343:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2602a28e319mr18346398637.8.1757990114293;
        Mon, 15 Sep 2025 19:35:14 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b5568a82sm9180276a12.34.2025.09.15.19.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 19:35:13 -0700 (PDT)
Message-ID: <f9d3b3ec-dcf1-42ce-b925-70e5543771ed@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 10:35:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@arm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fmbeXfcMPAy8dXQyxFiYSYPThuAICKYB
X-Proofpoint-ORIG-GUID: fmbeXfcMPAy8dXQyxFiYSYPThuAICKYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfXxQ15cX0HWKba
 rM/oUa4dJg3Nn7irey3bCzPSaxan5DS01vgtiY7xhTgsD79HCazEvYiy5TrZ9JaCgCA5EJmQHDt
 15/r2CXl+P6n4S30vfubNgAkLU8qtU/masxAOWelpMSr+gMqcfl3YZ8XaG/fEKyUz0A7k4N13AL
 yZ1C8ydcn+pR5zm/afe0fcQm6JfbEAdAqXPPh9mLDBYI8Dbqo2huAIp85GA/6fM/A2sh3G1DWSd
 60Las1jEzQMUgHbymhqv9YKZ/5zCBl2xXd1QXaPo/PazEGJ6zJyohXlg8i5lHY6zVtibfVFkcpP
 T8rEm8/kA5mdQnctu8y/s8WSfsFAhv+9aUVkpK9gv76awJ0qMqVPjPjb667/rgX6ah+1Xk7A7LF
 kHQA5Eag
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c8cce3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

Hi Suzuki,

Could this patch series be applied? Is there anything I need to update?

thanks,
yuanfang.

On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Changes in v4:
> - Fix unintended blank line removals in trace_noc_enable_hw.
> - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
> 
> Changes in v3:
> - Add detail for changes in V2.
> - Remove '#address-cells' and '#size-cells' properties from in-ports field.
> - Fix comment indentation for packet description.
> - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
> 
> Changes in v2:
> - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
> - Dropped the 'select' section from the YAML file.
> - Updated node name to use a more generic naming convention.
> - Removed the 'items' property from the compatible field.
> - Deleted the description for the reg property.
> - Dropped clock-names and adjusted the order of clock-names and clocks.
> - Moved additionalProperties to follow the $ref of out-ports.
> - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
> - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
> 
> ---
> Yuanfang Zhang (3):
>       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
>       coresight-tnoc: add platform driver to support Interconnect TNOC
>       coresight-tnoc: Add runtime PM support for Interconnect TNOC
> 
>  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
>  2 files changed, 215 insertions(+), 11 deletions(-)
> ---
> base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
> change-id: 20250815-itnoc-460273d1b80c
> 
> Best regards,


