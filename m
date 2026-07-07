Return-Path: <linux-arm-msm+bounces-117200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2wxN7W8TGrRowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:45:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F447194B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I2h4gFwU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SYhYRcfl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15F013059788
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD42D3264FC;
	Tue,  7 Jul 2026 08:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C332B11D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:41:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413673; cv=none; b=WvkFRJ2TEQNZdDax+8nooTvnfDazbahDCnfGQ2BaMi6U2G+vU1hXLdSm3xZsQJwGC/ZoRA+e/F6mQNAHrZnzxq+Dl9zFNwa2LJ/N3tPmvaqyvHSqlkooXrsnKFKbVF05+E65IFWIbQ8rWsRaDZBFw3b2lE2nvpWR1IVEGKUw0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413673; c=relaxed/simple;
	bh=hsE1R7ng6TipGkRqwppICugWHMfDvmkiKuhrFirCYII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLcAflb2B09wdifikRraA5wJwOmoWnz2C9tOzoMrNzOqjHHaY6CeACUXY5fGRdgNQUwOHuy8x4ZHOiJFMdGSzJwyqQOk+1g7QOz0yHO1I1jwORLK7EzsPDu+SOv/44/qIFTp/CUadaH+A8DN7S6v/QBhLXDgsSsN6I/morsQ1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2h4gFwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYhYRcfl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DoIt3205898
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=; b=I2h4gFwU+DniJ4AS
	I91DXHqeGqDegN3b98/ME1S4lHUcHux6a+mV81sSLsHSjLylYglx2/w/5qDHd+ol
	HF0zsqAyi7+hb/q69X8Jpg00yWpQJmFWn2xYqWrnnb4jQ/caRQdTo2sBdnEvBOJx
	shzzooXfsKpgIZ3W7kYt7Qtg2YQ3tVOtVCSLNO7WTi0ogZqh1ZL0njIPq2Ekx28r
	tdo9WfgNDu94+IU3vy6pzlKrPRI+1NJd2NI7xOACyRDnXoZrO/Yn8LPq5xXfOkKq
	ISh1NjzAp8nhQsFyyHOMM+uajbYVla7wxSJNH+zLr8BfwxKHghtfp2CcT3wQ3Lrt
	CYw5eA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3dy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:41:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso57907825ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413665; x=1784018465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=SYhYRcflbPGkDCuwko7tn8VeENSyFI5dKiRrLeAJsDvNodYV/1nFRQzvGJdayfuU4S
         P6ONEYtVVIRP15MlzJZ4nzC5coq/aPUeV5p62spAU7h1ql6vuDVzr3QtJFQzPRo1Vn4d
         mXpH7Ux0MN203Qe5lnn3lhQI7FPbK+DU3Ru6dgiuhBuZTmLdHoMCvpFWZ/28aiUJ1Bxe
         AhX8xls5cxZopp4uTu5ueA6F+7BM2QbzTYUEskwrmlnanuwW7wZnDz4S/menucdYORY6
         1mP/ZwP+gum0MNQOtKJwOGdFRHlERHXLphY+y1tXXZH2lRKrOMvwjFw1rhbUXph4YdQz
         OASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413665; x=1784018465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=RsukDXCGHDPIi4j/BA4UIzF9kiiz6Ikqui0SwWTgzgWBalCm7DqIaYEocIDuc/JpN0
         Ikv02ah61w1xh8RUUYWFPc93EwpyuvNFhETVntxKhr3/PuUhVChjGw+rit253o5k3vMB
         vZ+NDPRV2B8LWf+wcmzMlkQVZ7wxAKnt51nq3FaVTvKhlrGT5m5drgxborm1wKb0YvQm
         pLkJ1ud8UNlFxN/62AYBoXJm4dskMJVHb7TauKE3c/WpLR5KWCvlvn/xknOQhsF3md9Y
         VRnAlZJyaqpCSFNm9vuhjvY21dphsm+z8SZGbyZl7qIOwMcHirOy5sAIJK//PeW2QR/U
         RkIA==
X-Forwarded-Encrypted: i=1; AHgh+RqniY2nZZfTlWov9wXTit9v9YHVd7vlh8+FAv7Ej9aLRSHxV8iShZTauwhF8TwkKkqXzLy8tcPnkssHCACP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2M3AAVo2lUNX9tCfv/fNiEUoqImUNexgSXn3zUUgIKgQilaQ2
	I5azrwaAk7fyqXSbu6xYqvzWi27wWX+ZAILDGwE5qsQdJde2NoATVGd17r8CTEJw92L9Q6se7RN
	ATy2twPuDNQxbNRyzYC5rLpfV7d+mdQihBVpCA4EbKnWi4M7NZ9uJ73qEWdMLwZ/+wOAn
X-Gm-Gg: AfdE7cn/St1zihFghH1n5yRDMLH7TwCIoJJ0n9qWF3qehH26xEjGQcjLdLER/17xp4X
	4da26HxCxKLjyle4q3sFt3478FdWP0pMP99I2z/0kAmtRkMe9RgYczFgzhfnmzqW9oQA7IuoVon
	RFp1Dqw4bHjWNngn1ZTxz/fJBNnbDrQnZzeVYksn2dM6SrVyk7GfijgMaOddOuo28UbcBcWeNo/
	BPJk0ifS0zPyJgqjrEzxmBi0lyhCmZVjDYWc/5MpPojAV2jFKreIsiLaHTcPhJqhn36IYpQ243J
	59ckUAmNCUVBBr3MjBW3NGY+i+/QFfzXEVnaeS3EGob24AtE4RuqLaA/lkwJ7SeLrSxHnx4GsCA
	VMf0nssehGfhSjgWw7YhIxuiz/fj8V9eaOr9+ocER6g==
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559422a91.24.1783413665180;
        Tue, 07 Jul 2026 01:41:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559398a91.24.1783413664710;
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Received: from [10.218.50.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d1ad7974sm708702a91.12.2026.07.07.01.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Message-ID: <447245d3-4e79-4645-a814-9dfc52fc5bf1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:10:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
 <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX8T7XbuxZmrb1
 iESZOcpDvgnLk6rVajLQOohNKWyw7qb9quEP8VaamU1HaIXi/R9gyVoSlbkiq1p6HRz3h9Z/HR8
 uGYkRZSVtVsJAL15ai69596cj5C5Pl4=
X-Proofpoint-ORIG-GUID: BuBhgGo1iX9zIS_SF2S2U8GymTGoP4dP
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cbba1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=agT521uulj5WE4s-WisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfXxl1fr+C1iddS
 1fJSU/gxBLUYEGH5C3gxeYdia6z+GoScWHlZrxXyyVAVHQqmZiKWSxjylWKIfIkJi2oMwyY8ocI
 wP8MaMnBGdgGfXceIwojcQJZs3YSGoMNJ7yVhIj48VWuzyfZgmlJcmRDws1nUumLspvcMEzK2Pf
 61BiUjmaoaj4Velmix3azbrotzB5L+jJYdxLRUxY7O3gVJxmtLBwBclTnjv1EdJhZXmR63HZnFh
 QJNu+RjHCqFrDKUFs/cSA7keya+O3+v5Le/sz+Wgweqc7nziw1myfeB6TfruEp6LQKrL3idpVzI
 EMSKlKIlClQL8BuhYw0rUuLc/YEXo85ctRla7Yx88K7whU8Fpe53jb8MjyFCBz1MAVMal+/EIJO
 MpyL9HZ9Adzp69G9vBf8QQDW3S93kGdcVWXNF//OXTPRXMo0gsRN86JmUNmC65/kAZmji2VL4mp
 YOnjA2IJJYtYGu/j4cQ==
X-Proofpoint-GUID: BuBhgGo1iX9zIS_SF2S2U8GymTGoP4dP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-117200-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aastha.pandey@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aastha.pandey@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 41F447194B5



On 7/7/2026 2:58 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
>> use a passive polling delay to ensure more than one "passive" thermal
>> point is considered when throttling the GPU thermal zones.
> 
> I'm not sure I can parse this sentence. How does polling delay affect
> number of thermal points to be considered?

Thanks for the review. The commit message was unclear, apologies.
Without passive_delay, the governor fires only on trip crossing interrupts.

Can we use something like below in commit message:
"Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates
no interrupt, so not all cooling levels are applied. Set
passive_delay to enable periodic polling to ensure all cooling
is applied."

> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
> 

-- 
Thanks & Regards,
Aastha Pandey


