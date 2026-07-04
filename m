Return-Path: <linux-arm-msm+bounces-116486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lXzXCNDDSGpitgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:26:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4A70715D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:26:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZemKFxjO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GsbSTZ+Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54C433009997
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 08:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8991F38F25C;
	Sat,  4 Jul 2026 08:26:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2939A4A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 08:26:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153611; cv=none; b=ErTc4rBzM0N5oxtZ7wD7j2e63h7NrFWM38kFmgNCoCBJ2dx8wKIl7oc3O114HCTczAnQekNzt+A1kIFtU1/+35xHB/SrVT2/gxtfhSy7r3Rgf4mnl2iEgdCsfpbOFLe9VjizboLLOy+eUpOF/07ZUMD57qdFr81S16PTA8R1PsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153611; c=relaxed/simple;
	bh=5pBxfx6NGzONIJ90pATmj6WKIeItmpcQu0YbmPEzucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn4JrT6pxN83ltfxAFlBdAwFhz5WfFwdE+Cw0M5ztdd5ZfQNIBUMxMYQaWSxkjNYJxnZjIpiFZSnj3sTyK5AaYM0sJksncLD1NP7JMnMcqxn/MkTeBGQ3RW9dteJFIx0PS5bPd+HJOyG33ab/sadaO3O5rw5pevBnyCWFJHpOFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZemKFxjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsbSTZ+Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hsHL2128180
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 08:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=; b=ZemKFxjO6AcQKlK0
	SCLwmrUnKICDVi4LvF863+RK7x0XoghxqaAI+vd2UKkMfM9GjsDYhEANFCMJqxX+
	5oMN+94676A8gao4D90SiC+WYIVk89xLAjPVeS5Mm8xHd2bqvcRqjw5mX6H8FnFq
	C42TDsuFiT0ZkYYskPs1QdAhaqIh1ZDvPye+EbsB7C6yRGTT4xs3PeU2phxTapSh
	eNdsY7dbeU+C6yQwcCBXuagTTOszxPEVr1fcfbnnnvUgwUF1IF64iS67VDN2YqdE
	prxG8NZrZQvPmzrD+a8Ii9XmJnS58IfJzdX//+AWlJ4Z0a/wkAxtEnCeOQO90dUm
	muosbg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8gfau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 08:26:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe2607511so1990896a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783153606; x=1783758406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=GsbSTZ+QuGrbBwJmdXFAMLrSvMdYwIJ5vjJEFo56YV5o0m2/TKEPcfo8H+6qIN41PW
         uMnC/Ql8LHxGVg+8/VoTjb5rQHYXr7rQrM1dNF2wrkzQNgYEBq2KFhk0q4fRfvHpjjab
         tJM2EHnkWFZpm9fM6xE4qNvWXoLdO45HiD39IYU9bw+brVFATrMZUgV0LTxGQNGNV5fv
         CzjDc6NcQ3Q+QpJAAWfKtWcfmMiq5qGG41Gc9/H/tBlsp+LiAy8F6w2Otkv6YjE4BX0X
         VivbgD/bfJAEtRmHHxe08GWa+uojfQbqTUpm/UwnqZ/8zkbWrwXaS+1vguyDA5fP3gVh
         7SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153606; x=1783758406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=iUa/Qvx+/DFvjwmVUOnVAs6b9UbcrTo8/OaI1ayyJwbFX7VrefEW6G3aedLE6aqvbQ
         E0SEIegDJ23k2tk32NbRYDluWiYnDc2It0XnhCXtklMqoZF1Bfm2/ZDgdcgihfoyloGr
         +WUo4AEsWBwzsdfPReLWT9yvLxT6w1WerB7sRcVkBnny1mCJ+1MqAKjzxW6VcE6AJQfT
         jtsDbM6wd0577bmbenX+VYG8POCRkypwz56CnzqqOVpDBoCdurotvknu4L3cxM7mhGl5
         d+yRtCNU3DZ2/Ccnyem+JEEwBz65N4YlN5QQYlRBjLZMTS1THQjiBbESLlcegPbDW471
         6UMw==
X-Forwarded-Encrypted: i=1; AFNElJ9lg9oVRbcLwr7ZnORsnQsifVIiKCf78ABi5wMr58ufzPTBy1LGyeTobehThuK1lxFR9xnzXx0R4MqpBbrQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi46LC1WXr5r+la3mPaPcUIP67nr5tjTduXPFY2CPseqn6UT9P
	KyZ4ReKkwXkXgSAlxA0eZwEnPuVg/wYt88/KGcrR4xjF4j/QJkP2LW0EiBOB4+l1MTDC7a6DjL8
	0XsDXXle/ert7BsY4pdBu01up2e34Kr9nVct6QMcZ3wboHv/oOd2lfYA2/C+ddiTK4jHm
X-Gm-Gg: AfdE7ckeOaiuyIm6mWN9Ko9coJiIU2KBkyJwXpjnuFByXmyXL2rLDtP5AEf+9LQbdh9
	+9/JxG3Sp8wSMKw9lAVLgfbSowgTO4CIDZW4u6ymmUxTZCGn5ZyrwgbmBsglqMmw48O8aWDOCA+
	qRQhLY3SSHwTnGdeWFfDv6+hqTTgYLaJDUhfUV3/k62w9vnBpT53FboDzz2JMA4gQlwxGVpV8UI
	xj1jQtDGOjxuZaxPTke+XtGWfKLrqWXDZrGo21sKorsUiQK0Wv0W5YWB8hu78r8XSSPINbtkoVk
	ioqltkCPt+zyFEMNG66/uh1e/+jH9ocg4EmN3jSNjlPJFHMkM18LDHZDqUseSrwSWrn947yk0qb
	uWmJeGeRp3R6N1SXFakE1VBn/EkaN673nfKhEadG8RFs=
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525732637.10.1783153605597;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525713637.10.1783153605147;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
Received: from [192.168.29.91] ([49.43.231.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10035822eec.6.2026.07.04.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:26:44 -0700 (PDT)
Message-ID: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 13:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
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
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfX7KQ/xpcWogwy
 B2XcmMS3XH4cIMvaSJF6UdAV2Ltc1K12ApyqvYUVREugfgINQA9yPyJeMmjF+PK12bPQvh0b4uM
 I7frzAsKWLrTz+GM+grD+EJ5dh4G5nKagZ7/uAyMSMN1s/v3xHq/G/PQdfrB7yki2nkzdgN7ZqG
 mxAQrZJ3tdsFqXhZUPHmWjpLfi1CLJYbzx0Nt2wueHbaXc5RoV2CMDDrducGfsZJ38d1k4Aw2Zx
 yPKZTE1r/veJ4TMe4TDZAEZyKdcj9Q3OItAMaZFxcyHwj6L989baUBIb3InVBPz9x6fh+jj1mXr
 1kYXlNFLBatOSH4ZIi6hfgapmpXCnZn4YScWDJS1me1nI5UtDEKiKIELEFDjGyI7wWD92SZZE/g
 6PruYPq7eEpF/Da4dvgHcb6L0nrVx3rTKV+oDWZfUVz7lYkINJ/AnIxMg6xycYEaSrrqDOILJNG
 ZqhQLMNYb6Vhm8J4cCA==
X-Proofpoint-ORIG-GUID: eXtX4uMddHiWvgy9fXKmommExtUgiahY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfX4FQJeI56LZOn
 xxLuOpxwlxTMaXBkmBihRk2FLFrArNaAhsuPgUr2w+GirF3L+Io5KrjgaNS4O4jX07E4jzSc+hy
 J4Qg6SUBR4m3/48k2PtiIbvm6mIdr2g=
X-Proofpoint-GUID: eXtX4uMddHiWvgy9fXKmommExtUgiahY
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a48c3c6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=lXa6t/u14VstaBBXcWJ8zA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wGVdvqWwsIcFZm6VKzoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-116486-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aastha.pandey@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6EC4A70715D

will update why part in commit message.

On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 115°C.
> 
> Nit: 72 chars. It looks really strange to see two paragraphs with
> different line wrapping.
> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 34261221664b..eeeaa369d3a7 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2510,6 +2510,7 @@ cpuss0-critical {
>>   		};
>>   
>>   		gpuss-thermal {
>> +			polling-delay-passive = <10>;
> 
> Why?
> 
>>   			thermal-sensors = <&tsens0 6>;
>>   
>>   			trips {
> 

-- 
Thanks & Regards,
Aastha Pandey


