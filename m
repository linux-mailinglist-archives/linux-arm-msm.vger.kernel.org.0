Return-Path: <linux-arm-msm+bounces-87634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37399CF6EFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 07:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5BF304A103
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 06:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EAE1A83F9;
	Tue,  6 Jan 2026 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlO1LUbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFxA6PCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E72D97B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 06:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767682432; cv=none; b=mKoVb7vQr61eHx0G+cZJu9Uo2gkPyOu7h+XCxbP9elJHWkJcLowZXfBGaFsuePwNj42TgxrioYq9KYU0Cfc0dhTOqXMGQ4/DyhN1ThDATAHC8LYbBUdysDmLEi38llLnYQBpt7/5gGNE8BBnl0XYMN13Shdk34iuwOtqCqbOAA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767682432; c=relaxed/simple;
	bh=fUzLVoJ3PNLfDCzPyzxQRWJzCeckHkk/wGd3+uGz7Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7EBWf76BRTPZ3snoz5dSYy81uW/v6wOvG8GhV3bXtqA5ivwLRe4PTpx/zB2IFvkDxckwwj6zhgGFTlu24Vtd8uFQGs9jORFKjRlAKyWwxW5rYC1OhxrKjmsLHI8Dt48yy7SZp+2iYut2s3eZy2ws8bkKsqMJzhcMi3yiYQTbew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlO1LUbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFxA6PCa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063wO5h2684152
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 06:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=; b=dlO1LUbPxmsaRAuu
	FL+r6cFGVvagauwL1+pAXA4LGvyyHuxsyW8b25kOSjdJ+Ct4scqIWy8+EPW8QkoJ
	jAXDsfE6ZbtOOL0umemoCFTizArEbOoRq1sLFhWDcY95LLDo51bF2ziKpnu31EKD
	LMOOP48jdAJ9KV32Zdh7xWx/Xc3kb1c0AR1yGKMu4uy9w/Lo9Yhkhq4oBgvRolJS
	zppLxWRnEIwYmy0GDFUbLqs8iSx7k27OJDBng8ncGHmmKMHdA1lC0ArV1YUtawzw
	dRxankVGSevc/y613wq5KwdM7/R/dBI3i0IPun77L5XNz3wZrFxhz2eH2Qtd0i/W
	SLyXYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5ge0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 06:53:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d058fc56so13752425ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 22:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767682428; x=1768287228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=;
        b=AFxA6PCawmYNCsnlyl944icHeEpdusqahEMyi/+TW3rrLQp4fsx/Z7l9DXxy6Y5VKc
         r4ct4fnylmWHeCrjKq052jG9AqldHAPCikiOuYb7NjQs53c2Neh3TiFvQrs0YrnOKnHi
         bHVl1qBb3eQzJos9g4LKuK+YdCa+zBtjd86A8SiXjbpQKYLVH1Gly9mWucTPoe2KhLcT
         CFmG52GXmUPAHxzP3NFwMwQe+r0TGo8uy6pf9MytQqRpddZPwiIr7g2jqgXx4nvvL0Bb
         3voUDvr1OOmmSQpl4kUqpE2qMIqxeZ5sy6h7OvnrsPhbjUf0t2yMLjhsBDEPh/gxbGb/
         Xk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767682428; x=1768287228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLbCEbKIRhT+RxKdyGeil4oxCz86wtu8d9/eyjeWKmw=;
        b=gF0MjlIlSsL47dbUM8VBYyxRAQcSzVfnv9dVEs1Ubcb/JdGySwi8efKl+TdYbYAPWG
         /ubm2SoW8KBFzeoui4uKkAiXyPQ/7eAI3qOKWJ7fhwUTH4SxLBK734qNUjzluN85sk70
         fMNQqAuaKjLuuO8OC6lf3He4elboS3GozH+LrCbiZDsbj3Nz6AHd0/0WNBYUoMg6fDLg
         Z/pSnA6iAuUxXJaHnRaPxv24flpTN1tqC6aVrbnjqRWU6A0neaw4La596No8GajJeq7R
         cfND12qS0k1pE7P4BMCpeh7hk2OV2llMMg0EX28cahnJ/VEuqPT1O/u8E4/vBPf/+NkC
         kKJw==
X-Forwarded-Encrypted: i=1; AJvYcCW3icbIXOGV2hNkCcy2vSqm2Pm/ANyyjjZJUZeNGyiCJvAYLgS+84hsMYz4pcWuAtkxVy60LRc/5rbQssZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/8YVfINFfSvtGwclziB94ZbmRVTkBJojLkyrazcOiDmJsQPT
	fFBG0NmNybfXrXfKQLDj6JnAmM127sQ9Jy5BBijK0COpnOV85TyOI6GW3tFGZToD2mSXfY+BgAi
	3eR1rfgn3aMOggs5egi7fZEG1SYBbxR8n4hzDhfaPAMTcvcvbggC+SAve2eyUoMkogw6G
X-Gm-Gg: AY/fxX54j0DDFhjV0qPuVd/TjOMu8pHWI5eMhzbNaWgi49TViQQxjiz5JheylRVZvFW
	NUpTTgKy1gYhHBx1QH4fPIqMRbLnPvaazzGCJ2CjEoUiJB3hgHh7PyYMK+9CNCvSGsDOfd4ogWb
	aSJxAYXnqo6S0ewm3Qf4rJSJv/k6qBb014GjEoRXKlpb3//z5y8TXv0LGZVNoyTZDii9CxRVqHs
	VCb/3h2N3yEOwEeG16owpbfwKymGgb5eSd11c2hOLZdvrRiImFylp2oiuY9TpipI0kk2rVhiKtY
	c/eI+nJuBvRaXI1xArzmo8Mi5amVharCIfOl0WJulVUkoyYtGLbY1dOZxkusiNiFFRqOAOKac6r
	LI0rHjRAlrH1Fd57CTCpXw2Z4X+58pihUaGNE999LESN5P3prF5stxPJaY5mryFQtLCvMTGzT4D
	xZ55oCY6JF
X-Received: by 2002:a17:902:e784:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3e2e0a9f9mr23473525ad.47.1767682428500;
        Mon, 05 Jan 2026 22:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxkOoXJaSScdNY/v/x1jUmLWmfL4JRhrDppDdxUMNHNMa3JnGa8Jd7THWX6J1mTgz5q5j4iw==
X-Received: by 2002:a17:902:e784:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a3e2e0a9f9mr23473245ad.47.1767682427967;
        Mon, 05 Jan 2026 22:53:47 -0800 (PST)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm11886175ad.14.2026.01.05.22.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 22:53:47 -0800 (PST)
Message-ID: <369eb42b-22ef-42ad-8530-a7bf2e594a99@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 14:53:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for
 Interconnect TNOC
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
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1NyBTYWx0ZWRfXwoo+qYg58UYn
 86s+5rcumyk8HKIMJ9AooBgESKYYxmwQRNoqrkValgCZ7wLeyQI82unkF9q7E9pULRbjDCXCu2d
 29YfF0YpS4053aTpe37zJM9ajlJSg9NDyJXOe8vH+TYu2UDFAFgzGwBfzOF6PnpG2QlBzg0BAUu
 80PwBaP/1qVEGuyZd8KpL4m+KEHG3eU9RIA8fNPvkat4AM/t7+aBO9B5iqP8FTYeZim62P1IX8K
 TRa+SnWPYh6RbRSN5s+g46lxzomEgFbMzb83wwxPshf4SGNdsZLZSgQfMq2YDFlm/56k3KjYjsw
 7fy1rWMUOg/xi92cHDjSdQ2H+lUtwWUxe+1IRkOjlp5YRtroGzXx/Who0Ktgb3p5GLFB0CGgpHp
 flEeF76NazMQNvq6t75fvjKQWVHBimowDjMkCxWCp9cJ5YvzmYtsYcHO9GEiGDJiBnlWbHj3Uf8
 5t44kV8O1gm4Mv8IUHQ==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695cb17d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: u0VTf9foZmAJhHE4IwyTneY8Df4ZxdxX
X-Proofpoint-ORIG-GUID: u0VTf9foZmAJhHE4IwyTneY8Df4ZxdxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060057



On 12/4/2025 12:43 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Gentle reminder.

thanks,
yuanfang.

> ---
> Changes in v5:
> - Add the missing review-by tag for patch 3.
> - Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com
> 
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


