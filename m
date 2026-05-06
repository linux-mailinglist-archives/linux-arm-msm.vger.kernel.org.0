Return-Path: <linux-arm-msm+bounces-106065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KQ1ME3t+mn3UQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5DE4D7350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA84D300B069
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C384285C8B;
	Wed,  6 May 2026 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZODMjYTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSALvkcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D336AB5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052247; cv=none; b=YCOsFYZA7LyQIMuRybiO2P3LFUB6ocYwsuC998ugA27INRa7xjJ8fubIDlV5jndBS03PWO3NHFVcKNYg7FTkEzAZs83TLTnpT9z/gP0rhBioJnpiOYEQtMXRDFMsFa+VycD/5Fqua51C0/j5BvRoUzq4uZoejmHIf9DvHbVAD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052247; c=relaxed/simple;
	bh=9Txn1bCLhaBrW9GSBvOIK6rfzG5OCHasTAFNQG+D6CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psek90ww+9uunYF65JkqqRXNr940B9O13H9TkLhOfg0+EREP+geRHJ/FlBPwiwGIbi9XzNaursQ5paqZNX/e93hizzZPFkeRdDl/HHWR2HwYWXIRnQyoXiE0SGy4t9kFF1xMYhS0yyX3C727drWcvhVM38qNnSoIVW3RRrYEOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZODMjYTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSALvkcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6460hsp52445713
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 07:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4ZIoRP2u1e5bW324pFhv4+9GD5DTAsNOUVtYctmqkc=; b=ZODMjYTXggS8Mgdw
	zOZKwGLY4CP67fsA0s/2K8pQGqHbRKJ9epkVSWF0i1ribUhuf3PfZ0wDNsnOl+uo
	0Btvi2bcW/8nvu5G2nrs2PQ3rEiYkNQFCZ0+e+PxKfBpwpeyhFJA3sOJt/orxsij
	g9fJCBbpns9PTqr0LuGRm+dAwhbIqfVrScfw8laOiF+7pYjIXmaklxCq95ZHXni3
	T62lTt6vtCr1ztwKjZw38sGoYQBwVleeqaI1IpFLcXrlmRarqDBXjH4WxYsKDHwC
	9XhSrD7DRvIr/Tqfxnq8F3B6u67S3nGUVTMB8pP3euKf2cC6MWHy2oi9LLceH+y2
	0mcHDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dykmhu202-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 07:24:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so72535905ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778052244; x=1778657044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4ZIoRP2u1e5bW324pFhv4+9GD5DTAsNOUVtYctmqkc=;
        b=bSALvkcwskconrVZggX/saqR44yayvb75kvYQo+D1Hq9GP9ibJC+Gq3b3n/NuNQKCP
         9TAX8h6CyXLDOLHICFOfrnCfo6XYfei2oks7/4GPTBS/BmrkF7nYZmQ9W8t2Eb2rX57X
         od3b1lyLpawa6ONBd3aeQJde/huc4MVxv14WEjEhqE7JSws5X8KvwEfE2xHr3rxG9pso
         osjRRjZ5kDdMuEgEG2Jro5BnnrwXjxeXOao5tQgf1+fTe7YkWgSQCuHbt/gsCio3sflQ
         60Qy4ueUiYHkppfKoN2jTKauXjQsVXh8T3BmpfZ0HIkshIpr1m6tFUevvyJrzFQCG/zZ
         vWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778052244; x=1778657044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4ZIoRP2u1e5bW324pFhv4+9GD5DTAsNOUVtYctmqkc=;
        b=GFJk/XFkZe6J/DV2V41bJR8UW87OV84wkCIFgaxEdg2VvGbEhnevFtKqx7Kn9qJt5g
         XVgwRVazxPyq+H5YlAWtB9R0kZU5F0ZVq7wuzk6fjq+pHmCIFdcgQcezLoRxcAe0aiNh
         7yqLfP0UvXhMLCdowxmi9BTxHclLGCogdaKSKotLa/OYYKXeYovwSFXlBh8IkASRaUQG
         8zXoRtfw3lokrJCbjDuK7CnSlxOv2s6+hNYeUABQHnQIw5q5g+Kl0Ky/V7GP45qXkGFB
         k7iMzSSIb4nkOZQZHgkkCzBuX6rfCz1EeFyQWjBOl2UJKStAzbjTbcipF0xf3lOzbcjn
         C4XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MdKXT5k09Lff8bwY7CqWjndjxxFNjVoaAbr0KER1MU3GT0yz79pViSGWX9FDOwbpAcZlnvS80xrHNiAMc@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOuelNyK1CJ+WTWfivFUoGaGgu8RtqIuiZhzePZSkSvQPtsWM
	z036wyQyVWOR8CR2jLEzfxHbqUV7G6XrR6VaXWcf0g9tEMGH9u0qYW27ZzP6lI8If+i9oaIYI0h
	HtivnNNOyK5BXKYyE3fBJiu9mmDQxWjNvUbzWe8txEOvnPxGVHAO8hg5cVwVG/0vTuMHD
X-Gm-Gg: AeBDieubJwiuO1ZvX76IpQKrYOB/E1HPvEQvyKwqELdvQYYyfUtY2OOJABFnEzeUife
	EKYS821+/z/0em/uJ3SgX/v4wcSc0bOgD9RQ47+u0d2IbCsIunaNY8FCpWOGiHTJDEV9kEb+1Tu
	b1QGC6YsQZTRND3FTmBAh+Onn++w/4FofkY90jSiFdyNR2mixQIwvrLT2QjahKbMMcTI+SedlCJ
	vV2BOoW1i/YSRTqLfH+f+Li6UPK2wB50VG/tYOOv/1+jgAebfSeiAXsvi0lpFQBokPcet5XJRHZ
	ZFin+YNI4S7x3usuYV0JIDxUvr2O43NZ3pCtjyCnNyMh+a200qAcZTfYf7y3NY5PSqaFwqSMtdg
	djTEUNmlDDOkiwnfseAWiC6lMj4kKkpS73jX56zjlgRku3DaXiQy6FDltENpszCGKH0I=
X-Received: by 2002:a17:903:22d1:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2ba78f799cemr23714575ad.18.1778052243807;
        Wed, 06 May 2026 00:24:03 -0700 (PDT)
X-Received: by 2002:a17:903:22d1:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2ba78f799cemr23714045ad.18.1778052243138;
        Wed, 06 May 2026 00:24:03 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca37db8sm18508275ad.82.2026.05.06.00.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 00:24:02 -0700 (PDT)
Message-ID: <ad51ff85-354d-4d90-98df-9970d5688995@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:53:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X6Zi7mTe c=1 sm=1 tr=0 ts=69faec94 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M4aftBSd0jw2qhfeuUkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: zvR8706cE6MGmYUbHPIq8NS5DxK79YJc
X-Proofpoint-GUID: zvR8706cE6MGmYUbHPIq8NS5DxK79YJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3MCBTYWx0ZWRfX4YrQAehSI9Kh
 q7aVf4dH9pokJjPIBn4S7lyKqgxzue4CGeoAVqOtaRcZV0eToArui4EKYz7Tsrqliwd7oEtidaK
 0EGKzHq/xvWDspRRQ383vCn3XtjNj8OseEhdSAmb8iE2zA1dwE1ypIJUWgEnuydJl34W0J+zCSL
 tngGUKl9tiIXacchv1iKlPKDjXIUOaFdR9XClcp8UZ+vhVu2WGm+btVkWIsik2JKVeJuFu9JcSj
 EA0+ojPS2gSlDaLQIGN+6RiyRa4srSwb90ahTVf+3l0tZ54ZrYr1QiY937lrzi4DGoxE2Ifivhm
 k5b7ADwdukNLiQCH8n9CW/JBtuNHeuJ0tjTBxqCnAeJvDtH6CngbL+lInQQ7WgmiavwpMNcQxVC
 1Upjf85sBXBJN0dUbYFeyN9Wf2IFDL7buvtiwSSKG6WNCPnDCRLG6VLKkrDeCRwZBCwcYgUevUI
 eCDezLou7ELOq9v4XtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060070
X-Rspamd-Queue-Id: 1E5DE4D7350
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106065-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/6/2026 11:42 AM, Vishnu Reddy wrote:
> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
> num_comv count unconditionally when calculating the co-located motion
> vector (COMV) buffer size. This resulted in an oversized COMV buffer
> allocation throughout decode session, wasting memory regardless of
> actual number of buffers required.
> 
> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
> replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
> uses inst->fw_min_count once the firmware has reported its buffer
> requirements, and fallback to output count during initialization before
> firmware has communicated its requirements. This aligns the COMV buffer
> size to the actual count needed rather than always allocating with fixed
> VIDEO_MAX_FRAME value.
> 
> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
> COMV size calculation to use MIN_BUFFERS even before firmware had reported
> its actual requirements. Fix this by initializing fw_min_count to 0.
> 
> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
> to 6.16MB per decode session, significantly reducing memory consumption.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

