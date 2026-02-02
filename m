Return-Path: <linux-arm-msm+bounces-91510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LBzKgS8gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:00:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C257ECDC47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC883046B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 14:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB1B371070;
	Mon,  2 Feb 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayZwiRhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFywxFOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE5374725
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044171; cv=none; b=EOj92QjTR0Smq8KG2BEpivk5MVSjK9jJQJwjfiFJsXeCo/K3YIl7qbMBg6eMH8SDGf3PwszalPN1s2vDpHCCK/SeqUQbT13e3ZfoRqsdIH6d16Fr2ADOmkoZY4o/UdtRhesg07VXNfuL3d45Pn6DkzKyMd2dfCP0MScVk4wK3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044171; c=relaxed/simple;
	bh=3/cqO9OMokQVS4x8Fzsyg9WfENVC9u5j9YNFmCdy79g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXYrJ3RE8UiDvdogt4vqRr/qk+goq5foTu2cjDDEPkCrnT28F11RRVpLMUB5v+HhngKTn15mswhaTZUYJRPte2X7s2uO2gRjrdBS1KbkHRmTJSupFstDrmDSmSfZpsBaSal0S+SEzEg1pZbscOv6p2s5XMrFIPfQQ5v/I3MzgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayZwiRhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFywxFOy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVIR52356965
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 14:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1ENs0RNFl5woIm9hpBCekunPYy12y6svzujAoLx5Fs=; b=ayZwiRhkd1Phi1yX
	LqAWNwoyJmk4WH8O2dONfJXScbfHSzEe2Vu+qftlQXA8eLcG6KxKXLnt4dXbLsGt
	YsaDkbWqBsKTgwZrCBXAcoZXPZOF3FAaib0jtVYMcSZYYUtcohx8aLmWm7LT4nUO
	YDYYRZrmyrxqGKsob7wimdqFureiQ7wkD5v4I0HxRhUa3cuuk2tIpcgykKks6RSf
	4RLwOR6YaizR8kbvZJ0fbWWRbrMIiem7gJZvMPQwNUvkeCtM9hfMiBr1rIgbPzlW
	6dF772GMsz2KiZdIk5mnJkyLCceyFQYiSY6KL+7to4QM9oEaYAUC/t/1gh3r6KZU
	DT8WIg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m8cn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 14:56:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c63597a63a6so2791274a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770044168; x=1770648968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1ENs0RNFl5woIm9hpBCekunPYy12y6svzujAoLx5Fs=;
        b=DFywxFOyxW83KgZYqs69l94k8ukdcPPQ0l8YQe8OvNeSqF7hJmycfPleacgInnnZFD
         2AFwog9Wal4sWgAVv9LNT7v5+LWL35Uq72itwTVi8prUDv05mgCXEFOjD6LcbEc5iHy3
         fxUPGEPIP0lM7/tJ+H+piF9OM4M6gcJq81mE+LJ7vyV4+MJlcYGzlkQREACet0b3mrDS
         i/0ukurLvH24YdIMwu6ukhyzEo1zGamTqMU0bVGoSQbdyyVkjYJy/JDTT9vnH++1EfDC
         ZAZdZaIju5XWDFrLlWOKgcpeYtFQblVWYytHnNnRaRU94b2fNF1/Uir2k+ikTTCqloMk
         /O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044168; x=1770648968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1ENs0RNFl5woIm9hpBCekunPYy12y6svzujAoLx5Fs=;
        b=C0U5wJ2wSRU7olx8poZWQC8eLcf7Nyz/+d9IrFu78JapIlnLP2Dwr32OGy5aTHviZE
         a/sZdWvEfEdZmeC+UBIv0WBrN/KqPeQZ6RRVMjRU0VzvRmSsapG57Tvwb7ruXfI160al
         Cyh64BGO3jUeTZfc/7N0Sht2kzXsEAcOqdyo+aM6dX2Ey/bF1hOPE8prK/2a2IjN2Rsw
         uQTUwQuQzHxaTo0auYzGs84Qvy54KlFeqPqISqPQcdf4ojiLQqXHDljQ6ZMVZ56/E9V6
         892bwHsa3LhfK/kUW3JFbOWY4EmikUEB90IRzhd1Bmn2eZdDQ4hYuhrFDWGXyvhim6RB
         bHoA==
X-Forwarded-Encrypted: i=1; AJvYcCUUGqTFk3CjMxpRaexaZ48oNlyjEBzrIILUAUSttdM7jbGvJ972l0fZ+SVAGIehQfnqAC52DnbTuili8cw9@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAKK5iELWFTfEgogwv3joafbbeO+A+ccJxuIxFUYWi75smf/1
	63w84KLhqe8D1ey9ZS8hPq3MXAbH6+QSFCSDj5mguxCtQ6hXzsdwfjfZdRGr/8rvCd73q0lRRXB
	roHy60Gi8pZiXsan3B0VzHJjKrNNi7DvV1er2fT5D+ifgP8fmKVFKiPNAaK+x/SyReyVo
X-Gm-Gg: AZuq6aKuKV0MgM9f35vsq6DNTcezZ6m0c6982r3osFTQl9O72BtvIf5Xa/ad2uMo9eh
	hA5cGCPZoxYKnXbS7cxuN3QF/1DO28RyD4r+QJ8dcxnaiiS0nfPLwBA9zC3TphIrkbgf0ssH7EY
	UKjdzJPyrBpNii4kH1TnL4t3BmxXCRlE1BOjtPNLYDLAJR4MA+DJEQq+SyYFj5SR3x8omJ5ykZ7
	t/D+S5wfw8A1EGDVXgFRqBYavYApr21X/olt80A3LSYZOvgGLiR6ffoJ2eLPgA/H1NlSuyjU2TQ
	+A+3xepIlcwYThOeByNelwOMgVlmhau7AJlZaNB7DN1O6tikHb03dE5wVMu8/EdozjCtvC40IIi
	aP7MB3oHq5lfTp1wTR6oQ91QxAneGXkwR9r3Rsq+yLYzr+9dFEeIRfYsZbbRKtzX+YOnqVGAHdg
	b7NRPMvxYSU++Nfw57fr0ybgQ1
X-Received: by 2002:a17:90b:3905:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-3543b3b21d6mr11911508a91.17.1770044167854;
        Mon, 02 Feb 2026 06:56:07 -0800 (PST)
X-Received: by 2002:a17:90b:3905:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-3543b3b21d6mr11911476a91.17.1770044167394;
        Mon, 02 Feb 2026 06:56:07 -0800 (PST)
Received: from [10.50.55.93] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6205d3esm18295932a91.13.2026.02.02.06.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:56:07 -0800 (PST)
Message-ID: <51e1b183-4a89-4e99-ba9e-a10da885c710@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 20:26:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Update max interrupt lines
 to 16
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
        sibi.sankar@oss.qualcomm.com
References: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
 <176901261366.3407431.13319294932078987448.robh@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <176901261366.3407431.13319294932078987448.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6980bb08 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=H4P2UnjR5mMMqzSSWFgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Sem_pSSvRfu3c0zZt1sv95i-5HwST-_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExOCBTYWx0ZWRfX7CzZfaK6pVDZ
 MHsfx2ZbHaI8mktA2K01vLu8priRhBE4dvmep3ERdbD3+ZHHup0u/bFNafjdPl3BcLKNXo9GZIC
 HbL0InnvaiGmXSWc0N/fL/CG0qZem1Zep07hBzJ+OLk2cR7jdYk4a1wffe67rnuS/uNVGPmE7yW
 9vyJuJw1Agsnl47/ZvQ7aq+Zkk8PflvgOwztCxMZyxzXyPOUIwSVepDu8Y1zqpzMmMJ1oqBisMn
 8nUv/WZxfBXVIJlu3ARGmIxL0jCRfdhREsOoUO80hl1WXssYp5JKAiULRHMH6QgDBWVRaTIoLfO
 4vlZrjfvI2dwtpE5HZvLdYFvUVZEE7nteIlxia4UiZsIX+S8nt90b0vPvxgIdfMgqo35H0SZaAq
 +o5/o9f8hkA4QtXXo+zpdBvKUEZ1lEul7CVw4DvLlhPsykuO54BOnDqcjsB2NpwurJV/2ii10ee
 pBEolpLYLWA3uJcJGHA==
X-Proofpoint-ORIG-GUID: Sem_pSSvRfu3c0zZt1sv95i-5HwST-_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91510-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C257ECDC47
X-Rspamd-Action: no action

On 1/21/2026 9:53 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 21 Jan 2026 16:38:28 +0530, Pankaj Patil wrote:
>> Update interrupt maxItems to 16 from 13 per GPI instance to support
>> Glymur
>>
>> Fixes: b729eed5b74ee ("dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Kaanapali and Glymur SoCs")
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Added Fixes tag
>> - Link to v1: https://lore.kernel.org/all/20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com/
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

@Vinod, will you pick this up for next merge?

