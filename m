Return-Path: <linux-arm-msm+bounces-116253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OFGyOZB/R2plZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEE700961
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JXm0VbVG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dD283ZQd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116253-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116253-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8DCA30010E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E06B3B14D2;
	Fri,  3 Jul 2026 09:23:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131B3B14AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070605; cv=none; b=kO9Yy29DiOeawlND7aZD4YzV0J+RqVS66tdw4MD837cGnVP5QohIsu/8I66mBdLPvaY1no64olBJTVBVea2srkSRmoSML9fH/slnTBb+E1I1uR1wTMnZTzUtBznwNR93UmLQ5J7mcDK0nyUCyeAR8qseLRlBHbQxF2DyzwHYOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070605; c=relaxed/simple;
	bh=D6FyfstTISzH9+nCkYuJjjuigMmR9dmkecqosBg370g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnJ9MY0hfk0OnWbNHs5qWpDtgugA4aDfSZwtuJnGDbXaQv6X+x0+xcdKHCP9aTduFyH8/AVlKD2cCL82Ewvi0lUgkNrImIrzTjhwQpKcztZ1N5UwNa74Aef7UmYmHxsy7W9ggJdLh852SoNnukkqcXN6nwl67U+HYW8tauW6DL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXm0VbVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dD283ZQd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ri542994900
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=; b=JXm0VbVGUgl1DN4v
	Aocpo2T7qOQBSC+5Dm7ZAjfcEVQEHjJysI4lzG5vHRl8gWBXW0SMBRLjabn+gzp1
	LmM2ZecDViXL9GOw51Up0vWPGMQZ+xesNb9YVItRlH0RlOxbEdJMI56p7jW3xbxL
	j9qmhgWsdArGlvMC2tq/pviwt23W5T9IH2u7ukReIIEoe/o/9YDhWnvocMpcxkm3
	H4LAv3SyQBDE+u8Y+4ayG1/Vw1kDaNj34nmnSCTBxe3TMDrL/QEtFZbRjPF9K1A8
	HNTL4grsDMXDOyXpSvjXSOSoIF5DRpI4mYJ2B3jlnDh1PwxqHEHewegGljBFN1Rm
	NrBtIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1ngj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:23:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c804e38c65so7814765ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070601; x=1783675401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=dD283ZQde6aLx88b4VKiU+EwnBglsqulwBa1v2fmIU8LU6vnBKPoXBxKZEH8+fB1+V
         pNauq/oV60SgDJV1fmZUpY39DDTu4Q4Fki8gUWt0cSRATI9O/u105CwxXfl3QDwMLZMY
         22qGze+45UQPmEdz/1LuHly1O1VygUnrPwS49ZyOL2pBEAdR1LJDSBGB+xM4baxXmI9I
         ODINp0FVbO/2Bz3JxiB0ijqeIf4uBFYUm5KUUn/jTZHXDeLIb4s6jNb5tDvOp8M8Dwx+
         BIRJVSbDIMKo8iOf0/ZUHS9kew0QRKVwjo08RXHvY3txwRkl0vO6glTaWmxr86wP6W+0
         MmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070601; x=1783675401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=Nn7asxSn/B5NboQ2KSYFez/LZM33fRpYgGR+pFxZTX0l5Yt+N4+VagLYA0lyPMXWH4
         xNGUyULsUrwmsJAV5dvBvI6uOugmzZXYl/y0VgA52KMEsjBAbj/ucQgEXnhO6vs+XoNS
         QbfEDhhGjGLe5ej9B74fmWKdhUkxJYKtaNSo38z8qWme+Eb0Mi8Va16p6xrH+KY/xdXm
         PZAxD9ZN4CZOFk8GpuWtVfH4sSrgUa75GmEYCweUvNuMT+uMBuV3PGDbn6WsxDBiXDUT
         6ZiWbfWkR/LUsjefw097f+qAiyRbhB/72NUMEnezU/P+IrhkqaATgh7JpfLAurBt3qWY
         zIog==
X-Gm-Message-State: AOJu0YzmPjBdJuk1o+nyxHxnZ/yxJJo5Q3SEv6gHIUNhk0wavu29m/Cb
	bVGIdZHWGcOrPwyJJ/12z1PEUAZVwLGEhSjry6g/1fPU/D6vjLezJyGPI8yu38AqrEPBzocs1Sy
	nuSq/Ed5SA8CMIbfm8iIqaz+2s+WXmjUVf2HTnea7wu7d0oKWiJh+iLRjlx5YDmcKKwER
X-Gm-Gg: AfdE7cnBhU/YrT8t6p+8EhbJ/uRVUravh1tsT4YujgmnRMkbvYH7IqGZdp4hhHgjOQK
	4alaRef6iHGErI66eF0oQBD/SpU6wgtKjincUNDTRpHhcNRVdOz/nRLk3VKMaPY0e5U2kOl/EN1
	WyUqNJWVMjCXNoKLfw9vazh1fC4c7n8jYJWtTfT7EU7R0ZSsI3Z7H+jJL2UJ/AIm/AfagcNKN4W
	Iw5uhaLVzNoAyco2vgTGCpAOsZ7/JlscTwyEjwoNF+N2yEbKLhUq7x8slhUvGJY1JUdGD+cwfrA
	mP8P6wcUB0rHT5SLMV8XdOFLC7JfiUBRTlVn5ZDm9cjSbPu49WWre0N/iFeuZ5D7rsqG7k3Qkx/
	YAiLzWfEkjWeZOfiPkVKTmsWqqmbzO26Mfv3p2SM=
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103764105ad.23.1783070600764;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103763625ad.23.1783070600307;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad789237bsm6382845ad.71.2026.07.03.02.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:23:19 -0700 (PDT)
Message-ID: <c72d2ac6-b1c8-4c96-a0c6-eafe18147ac0@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:53:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
 <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX1hP8E2kul5T8
 2f3DdW8RYoAbo5YZfM0sqfuQCutTKUy5b6QbMzzQ1wiKicsUfRzkmJkIqmEAHgE8sfGj8eOnT8W
 OSKsGZxBPPun6eaGCW6SsJBX0wAD2jc=
X-Proofpoint-ORIG-GUID: q0WJuTODfEiRxTN890U1e-eSBN74olE-
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a477f89 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=TT0SokwCUCox7tJrE_AA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: q0WJuTODfEiRxTN890U1e-eSBN74olE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX6KwDzOZe1CRw
 7LfRqEvze7nEu4P/o+8zdcgAs8p+IWfHmqgJCZqZNcpsJ00EBrdbn40ZRh1N2fXSUxAOsRZQvBs
 fCMnZdqQPJJTzkVG5Ha8SSjglX+aNPEEA8sue4g79SZSMRdjDJegtf+LE0X4/H762ipb8c8M7hN
 tVi/9b5uMRZpXOGcPGP44Qc3QcFOEUf5DMCNPXvpIXbCPSsU8q/ah4rP1DjlqB1lvXGogsLQ911
 BxxGhA50vvCST7v6kschcsQ5z38P+Et4ipye9Q7nmtPZTxEocRnQFxuwbiAs0aWJQp5+Mn5WqYM
 2woHhk8oig8E0CCucovH6PHy9nZ/ixaB/7qT9Mam0SVLnMO1GRL1XruAIRJm1kz8HpvMuI+ufcg
 nR9qI0A9uOnvcB6X+OUH5jiTr2HP0HSb7nbMO7iTgdHzj+TcRrGE/eQ7Cv9aHjOp9YifrxzSAKa
 SOv5O3NhkVV8lwqQS3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116253-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89AEE700961


On 6/4/2026 6:23 PM, Krzysztof Kozlowski wrote:
> On 04/06/2026 14:30, Nabige Aala wrote:
>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>> used on the Shikra CQM EVK board.
>
> Does Samsung Shikra CQM EVK have it? I guess no.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

I checked internally and found that there is no Samsung specific Shikra 
board. Shikra (CQS and CQM) boards have this panel and i am upstreaming 
for the same boards.

I hope this clarifies the concern. Please let me know if you have any 
further questions.


Thanks,
Nabige

