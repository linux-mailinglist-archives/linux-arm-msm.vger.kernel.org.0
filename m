Return-Path: <linux-arm-msm+bounces-107314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNtsKQCHBGr8LAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:13:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA2534C71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DED1314DED7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601AA427A1A;
	Wed, 13 May 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIHXbmdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZWUE6rO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F8A3E8C7D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677796; cv=none; b=dwfEsB6sim0/4WVqK4ReYvHRKhEqOgJ1oJIER2J5TakiiqQ1VA/zOB9LGLtXJam7MZEaAfP9fASJiDsI86sW6Xi6A3HsZ+hcjaAmhp6wQ0rV/3S+vLFM8r5Q2l/ZRVTo6AfoHhqZ0v7vakzMBGGcOhDgFkf4S+yMCLEJITXlWpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677796; c=relaxed/simple;
	bh=pPhZN7nfhtHHRw6dhJOnhfHiyh5eQfG5r3IROqjHaUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kC2WyQO07FIBqjGxb4DtWnapdRuqUMICf9736gSlVimaOy0hlhvP3EZw4K80EJ1wmyPuslpE+iFo+MEIl/Ex9M35YuG2pWYwYkYh9Y8X7d9UEKeWFyfGSvTTbRjBlAC38qXkKwXP94iDH2goFZMlHsoaFgNaEhgpdCBQ7WRcY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIHXbmdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZWUE6rO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVKmS3430137
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=; b=lIHXbmdryhAAdCL/
	HfbH5KgK0BohO3ARBAdjZHiUBA0hBdx/x3+IXo7NGxGPRtUrdxEWhE8jX7tSqslj
	FKkwMUezvxpmTSKUuUldw9iF4Vg4hk98A0M5RwAowegqejjQGylUj1sv1xbNHCn+
	2uWWbvJiJBYX8XiPRCtVQ6O9jnCCErdIseRLb5xrhO74OpCHxlNqpQy83AlUhbDI
	J4mueiqhd9sqtDcsAkezYjTVX4n84BkTvvJYwzkQp6mmqjldFo2/lDJ7uKLiK7kp
	94eQXYVtJaV3aOuvrj0uVvRvzjbVQ6/oJGwuTedS/LrfUGedIomGFaP5jIVO7DVC
	akOk5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcghjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:09:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so88025115ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778677793; x=1779282593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=YZWUE6rOAwmrjSAkZz317QFUMWuWF3IfV1VCxRWwW60WI+Et49M+pbEpewpksR++7k
         moqABE6edxK4cKHl+N0H6yrZWIUZoiHSbaBP+ntuAEasHOQ1KJZr3xS7fRgj3eA7sOrY
         qpOrq68sBctZhrl0KML1OpocP+96SpW0hSWkxkd23SkyHq/Jm0BjW31dPoIk8XI6vuQl
         qYOreBVn6WoTJqHm3ZZ4109xmmxVl6X8g71FnktWmbZA7DW0THZfrlSa6X+5haIHITxS
         0Z65uL7Osu8aiNASY20m5myeBqHXwyYnV1dbX54JrvOhPVcRaTBYXiMxjbzTJ4ZIurVa
         KfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677793; x=1779282593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=bRB9AFeOa675N6VoPd/G2YfJTija0ugluAuMITYB2fzb5dcb/myVXipbp9C6p2McPe
         /F3F9A/a2w5Fd4Gwn2pQyx0y+4jayZkRnS6T7hE7OLRFa2AqYcXbatP5vLZ/qN2nST16
         t5vWqCGFjpvBAswtRzNXhTkHco6FyKrPgI55s1ezCWaDxsoaiPJlApEMjzWR9UJKle7e
         kVTkdp1KVVhcoy7w12mmdDFMqryhJYP1xRnBjCQBSVoH3QpoVDd3ND3wQ3XfG0yT4nqh
         7ExGPtVL/ofBi+Dvp7yfET83u5qykfEckd31splBWhYbDvGuGGVyAmAU0AKR+4CH+4h6
         X2Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9ey2LpXhJtBCbnTUTzDWT1okOD7scYaaayl7T4ZMvMOHQr5SbK8475dhVGm20MC9StIojmcWBq+MLZ35Ma@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu21WlsS+OkKNyYfJT0IyHqRNzD+i+GT4FIV+UcXicAgDVg9OS
	8WN8+AIQmElXraLn3ayLBcw/WXVdqR6ISIPE/kV8c9ANKu/OZcr8ksaJ1lRHN1LbcINJk3Ud/in
	Lz8NnzBY8V1YDZ8tOodlsuYHa9s21vi6ASazBiJ2NIseQkaZwIiFEXp8QAtbmtwTnDDyj
X-Gm-Gg: Acq92OEi/B5pXxmorEIg9T9Sc7J2BSc6hTvEJTpsU6kzOSfnr638cSyT4D6HlrWJlLM
	vnXxJxyliOwgcquOGUqXPEDplaCI7FQugaKrV6tgjgFCV3ylSVJ0slrUgAOZlALk+OKF2gUVKh6
	wS5lF8wA/VpCMFNuE6Dnpm0YK23dbOktUQRzSw2xiEvNap0QGVJ+F/g1umt/oXGQ6WUOXS/yZV3
	UDxNELR6+gNDeUgzClDLlRu62HoZCXYACffmsqYzlMrpw1R6fT+7t47jMJSZTSDh5iJo0NZuq4F
	TRvjuT6m1fi7bLEZCVu18eRFa91qKhld0iS2vaC5JnkKA54EJGZXeEYJo7G+plBhaZmaoK7VcPC
	jZFVLcyGpPvA4AA7eCnT4em91jv1x8FnLg/ho/PEpyAbPgpv+QOE2fTE=
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38165075ad.18.1778677792715;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38164675ad.18.1778677792287;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm207675385ad.36.2026.05.13.06.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:09:51 -0700 (PDT)
Message-ID: <a1a38bf2-84b6-4e51-817b-b85ab6c65f08@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:39:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0K2OU3EBLY3sodBVoT57CvB9oNJW44so
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a047821 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9WNCELPX4ZUnkJ91WYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzNSBTYWx0ZWRfXzxv+KsjGIdAk
 oMDZZnpQ0lA4NDndaLh2IpQSvkxzLjmZqdceRo9QssOHoQLLq0cYxUIIgDBmq2zJcPn+8SZJ9xn
 0qekeNq5a9Lkiij15gr1l1KIO1ALJUmDGnBpH/KqFEmgLijAbME+UFWtvYWVgsVE5krTtimY0BO
 R5uADYDYoLwWqBoEbzN2btBtyZtYILH1j3+ohT2/VEzV+C2Hq+m9RUdsQlATxPsx6RygZY6Cs1k
 66kihGm6xQfiJw224t9lSAx2Bdc7HVxM5Ep4IZIkHeOo3HnSFov5Y1MbaW9zcOqXkcwB4Q9eBlY
 VAgo11aHwvK4D9H7avgRol5Y4r88sG5vRKQZDhmoCGL2uFPmUMQH5D66p4oTakN4C4YHzpW4nOm
 WMiSHowQ69JSt0Wsw4oQkmpwaMKlHlO1Kg+aE2HNaZux/nfjO5FoIkxbDNXO6cYM1CVMzY6GbJr
 mbSh89ace4o7JD372bg==
X-Proofpoint-ORIG-GUID: 0K2OU3EBLY3sodBVoT57CvB9oNJW44so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130135
X-Rspamd-Queue-Id: F0EA2534C71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107314-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Rob, Robin,

On 5/9/2026 12:29 AM, Vishnu Reddy wrote:
> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/iommu/iommu.c | 4 ++++
>   1 file changed, 4 insertions(+)

We have added vpu platform bus as suggested by you earlier. Patches #1 
and #2 in this series adds the same. Please review and suggest if you 
have any comments.

Please provide an immutable tag by applying patch #1 and #2, we can then 
have that in media tree and apply remaining patches in this series.

If you have any other suggestion to land these patches, please suggest.

Regards,
Vikash

