Return-Path: <linux-arm-msm+bounces-111670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kEhoCulPJmrgUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:15:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F24652C19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bo+9GAkH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ViWwmzBX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111670-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111670-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949E73027974
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9904366567;
	Mon,  8 Jun 2026 05:14:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8735F189
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:14:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895681; cv=none; b=etF6LGpYpcQ7ZveNbvrXnpAMwnKfgkX1ya/vJgjAufQrWB04NQ0oWLxWSCfmsCgcVw2mfAf9MwN/XM3s+K1lWomC6fwjkU/GbBV16K45gHcoLC0O6J37CPjRU10qHMjZZ9lF8999DgEMphvhAyxWv856Hv03wsNAy7AkfUT7Kys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895681; c=relaxed/simple;
	bh=eqTMgek8olZX6BTssVvsPxd40M1iYrM7I1ZtIjCzb4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaG6t58T7CLRKJFsLfmKcvWrZHgKeV1Om68CbZlRTDLpjKnOpZILXEPIscLJjQWW758nKW15J2xBgwAh96PB/JokUaDVKeTD5OYmQ2Y0UP+f+5CvJa7FX//ScaCo4VLcrFcrW+lZDzZwy0kg1AJ8IPH3wNxw8XEM693pBrKKcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bo+9GAkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViWwmzBX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EMGW1572307
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=; b=Bo+9GAkH3R1PpgxK
	saJ2dHX62iPorEkfzfK4XOBg/Mg3Pwr/8C/EG9G4QXVHmf8kB967RpcnR/3yCTp0
	fXMST16hMyZrpH/XvN270nmSWNqYapUK4NK/KEwlcnabNN4tKFY5l89LGpC+ky1P
	nLYoadq0uWNQPSw5PMvJoigxQhh/R86vzD6gn+f2zDnyK9VlIkoppZUmKs/NtQbx
	tMbRK75T+AM6nw0YVZe2TsrwcF2ddjOiQIjoTQq8AhOTHLA5NJzJ3ktIfSw9ajPt
	IVlTQVWeqvlyYDSZ34nhGodkPDc3JH2srN3Q1eEW0OaZDBPPa0qxHXUjSxAqsUrM
	RCAMDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wp7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:14:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c331eda3so42025835ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895678; x=1781500478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=;
        b=ViWwmzBXn9GdjkZxA8d95cIpE4731digwSQIpoGy1h3OLBhZwkqNVbD9RbHyV7drpE
         VGNm+Un04L1n63lr/g7w9I6ItgylHwTCX9JxJnr2ZGrHpMg8IedC3tsGXHPOH0sqExBi
         +YCn3A2v+JlsSDMSve0DvYU2BrFNoJKuQAdlTUP49jcn/bNyl8uk6W/KpYUY5+/qHwpO
         GDpfgRFOW9vvwYruSFoQVnyaHWfAMUIp49eM3Wib3cdscwGJYmqO0BuMitgMnUDuu/CD
         pycAvYhp5EWVEnK6CIFZpjCLiTcmh8wCzqE/9Gpv+YrnU46GKtmB2mVFPYQytL1EM6Zn
         O6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895678; x=1781500478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=;
        b=Q0p12PbNTEvu1EzGmlynbqeXHGU35LL2kYiJcvyBSSiEIiSQEKb6pnw/qm00tOn89f
         LpBv6uEXfovEugyjeh1GYNE3iJxKbfrV3/QDSavCPS91ZfLxpgjBQMgHhh+goAdDKWKC
         4Sq9ftNvB+Q/02T54fv2pdkWqJyGDGdAEjSLE/eBy7yJqvCFWAllJFZaYu9Qrs39KSws
         +EU4P7mVJ5gTOSvIbqCL0MEZrDduqzzLOPkSoXC33b1kqAQOVeKIA/mVZzXB9w6Me3ux
         bjBtwCWEKZTTYAdAWq9/Cprr/Aed2/MIbp6Tfc1XAU07q77Ykh+VGkB3Y0w+Bbx4zdlh
         WoIw==
X-Forwarded-Encrypted: i=1; AFNElJ+M8hXsABz+YH0StvK95pc0oVpZ7hgCHZiTQUp8GNMlaTqWj5pWpIs4ZYGfyVdiivsOvuz/Hhrl6+Qf2PMx@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrhA7EE6RV2jLzhsBIHUIV+GyMzGVKPzVvSSNBwpsVPSZhVqp
	pgf0H73GJzBFFPeQ3N1+Q3DCERx+sNld5oYJsc3yxrbio+zjF3MLWGopRzxmZudQbXnIb/MFpGV
	CKV+EG87j42LcyMSoPON02A3UdSe269lQx2cky40BKt7gewOfWlo322gSvDmY/2VycJRm
X-Gm-Gg: Acq92OEUY2Ie9Xb1FSPNylAB+we78lq+CQTsXg6Nz8kTlquphvmdKRCZk4PSQ9PN5pS
	eD/6Iz9ZxtT1mwe5abqNA3m3jCUhkuiawtoVNGS0iDSWgnRwnnYuA03cin2pL8JG++d2DUfQw9q
	deJRnul2eqXSsh09//KFxoB9NHyyu6qPmuP7omRc49zDPnYjECMG4zN6xPowi1DDnjmGkm/hTa9
	ZYIudWdCgUL48keEDEPpi+cPJItyW1lhPIak4jaf3FFuzIy/QsOEYiEBMwip9fvV8Ly2qgAS0/v
	zBC7iqJ480rCQHqvyaHPhm4J2YsZ3lRDFbRolr3QatFg3VOrOmWFw01E2Tds7TtyDAIPTxNdiDS
	kl+UbwrB6x5eQmRex7u6QBGPV2UUA5uaZqa3FyouQKjVvlc7xD2HnuvGgULtmXw==
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr152930855ad.27.1780895678307;
        Sun, 07 Jun 2026 22:14:38 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr152930605ad.27.1780895677843;
        Sun, 07 Jun 2026 22:14:37 -0700 (PDT)
Received: from [10.204.79.117] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm169055115ad.80.2026.06.07.22.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:14:37 -0700 (PDT)
Message-ID: <dd014e3b-96fa-4019-a1b7-5826a877b87e@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:44:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] accel/qda: Add PRIME DMA-BUF import support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
 <3dddb7e8-5837-4038-9823-ce419cb49ec2@amd.com>
 <e465ed15-1568-467b-ac6b-94f903b46776@oss.qualcomm.com>
 <0feaad40-8bde-46c4-a251-07a1bd6ac79d@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <0feaad40-8bde-46c4-a251-07a1bd6ac79d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OZGEkjsVM4BGUpitE8A-T_1t0ObjPjkB
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a264fbf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h427B1VOWG0w3MIzYIMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfX4iaoByyhEecg
 48IwTuFWysCZiPrdX5cDQa3KU6xL4AFeXrDzTGmlAjcs3u+sRL+zE5AeThtxebukgUxqBZcj/ct
 521/iGDAk2WvwIwaP+tvQPcEMiwJH2DXZ1BQ/BtqF2KNhhiexHApwLlC2YgOjodIY0pVJ/RcpD9
 rGPdWgHPMunDkkkyHjg0EYjLKynJIPMiPR6w8hgRaSHK/r3kIoDchyA+EG6dnupZe4qLqFdsXl7
 R/1F8gjI+cjJVQUtxxv8yFJa5nhVMvd5VPbwgrpkLBVqRiTySXOBJBP6ZxAvHhPDbHzavIFsn7l
 IZhO83XML6a4y0Fhep6yfLUmH9zH8jYl5lAwHpQtdMTLewK1pUFzIRkTFkDo1avBv0q/l4tfTSN
 9tzi3dfaaTea7mwrcqDO437elu8yfgn+MvVcwGk/NwfxJ77QN9nK9wCJc5V3iNLrRxjYaVESpAy
 VCt4lLVUUv6Gr7qMhvw==
X-Proofpoint-GUID: OZGEkjsVM4BGUpitE8A-T_1t0ObjPjkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111670-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40F24652C19

On 03-06-2026 19:10, Christian König wrote:
> On 6/3/26 08:11, Ekansh Gupta wrote:
>> On 19-05-2026 12:25, Christian König wrote:
>>> On 5/19/26 08:16, Ekansh Gupta via B4 Relay wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ...
>>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>>> +                                          struct qda_gem_obj *gem_obj,
>>>> +                                          struct qda_iommu_device *iommu_dev)
>>>> +{
>>>> +       struct scatterlist *sg;
>>>> +       dma_addr_t dma_addr;
>>>> +
>>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>>> +               drm_err(gem_obj->base.dev, "Invalid parameters for imported buffer mapping\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       sg = gem_obj->sgt->sgl;
>>>> +       if (!sg) {
>>>> +               drm_err(gem_obj->base.dev, "Invalid scatter-gather list for imported buffer\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       gem_obj->iommu_dev = iommu_dev;
>>>> +
>>>> +       /*
>>>> +        * After dma_buf_map_attachment_unlocked(), sg_dma_address() returns the
>>>> +        * IOMMU virtual address, not the physical address. The IOMMU maps the
>>>> +        * entire buffer as a contiguous range in the IOMMU address space even if
>>>> +        * the underlying physical memory is non-contiguous. Therefore the first
>>>> +        * sg entry's DMA address is the start of the complete contiguous
>>>> +        * IOMMU-mapped range and is sufficient to describe the buffer to the DSP.
>>>> +        */
>>>> +       dma_addr = sg_dma_address(sg);
>>>> +       dma_addr += ((u64)iommu_dev->sid << 32);
>>>> +       gem_obj->dma_addr = dma_addr;
>>>
>>> That handling here is completely broken since it assumes that the exporter maps the buffer as contigious range.
>>>
>>> But that's in no way guaranteed.
>> I'll collect more details and will try to implement this in the right
>> way, maybe by iterating the full sg_table.>
> 
> You could also document explicitly that you can only import contiguous buffers (e.g. DMA-buf heap CMA etc....) and then cleanly reject non contiguous buffers here.
> 
> We have quite a number of drivers/HW with that limitation, so only accepting contiguous buffers is perfectly ok.
> 
> You just can't silently assume that IOMMU would always map the entire buffer as one contiguous range, cause that is certainly not true.
I understand your point Christian, thanks for the suggestion!>
> Regards,
> Christian.
> 
> 
>>> Regards,
>>> Christian.


