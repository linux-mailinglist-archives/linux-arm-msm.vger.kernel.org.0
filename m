Return-Path: <linux-arm-msm+bounces-96493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDqYKNinr2l2bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:10:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AE24567E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42F2C3083DF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D243CC9F3;
	Tue, 10 Mar 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEeXQcxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9ZZtiUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0373B8BA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773119438; cv=none; b=YYjXjec3xxFNEiKtLnWtyNDc4y00p9gcuDw67rzox6F6SFndOLxYUqqcqrvm6JD8NnhxeEwmOU+vQIIm7uHW7M0r3dbCZrbuq3YvNIv0AMAG5+R47iokrhYVdMVrHPyEJfyjAwYZc72bhbR55FO0GE+qA41qkX5mNj68Aj4Ajrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773119438; c=relaxed/simple;
	bh=3yH4LiQCAVgPW+AtuR7/UJlQyLoqTEiDqSsitVTY540=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5N4fHs9M/6XBhrIvsyGd0bh448NQgYrMyYhoIKvkTb/dp3A2+kvipd+MAmYSRFg4qp8JdELj9Djp2H6f+IJPSZayY001HcAmL1ZpuAoBf+TQLmWu7d+FErcDXbbOh+uHA9xIKBhjtPdEI3JzL/pamGs2DH/QhUL2gwhjdvxPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEeXQcxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9ZZtiUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ENj32020563
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=; b=gEeXQcxKZGjBJr41
	E4yyLFXHfIWuPChq44qLd5pDW0tQMGatkXLsqzpoZHdcsxFDG2Lbc4mOw5dSK6tK
	hIbWjF53Mvm16+g1cKvXWYTfok12KobDZgoFyqYFq/QMhL+Sm9cU3WkH5wpwlyC3
	mY6uvCIFIhEnvvAGHk1tHOvv44QNqMcGF5htCQAmg6PL8vunWaG+LDXlUEKNLZs5
	nUUq4/BopZzmP7zpQC5OKmOPVR6QS2xk2TlqQKgPbJk2qHPuDTMxs/lE/HilocSc
	tVEsjvJH/FJC8U2D2e3lYbcfLSpSiQ1RZ1FLlT1ZEVyVtt+qR5Px2VkERXVwrnbH
	lG8Xdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtnjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:10:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aea7747aeeso708015ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773119434; x=1773724234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=;
        b=P9ZZtiUG3bPTPMWJA+/ENzzkHhu7tvj/SINTiiynNRyjodbEfG1GhUmUbfiof/GTV6
         GhwEaNkioZBNUkVSXB9MZoq3cG3Bswwd8eNV9UR/+MYoQyXR6wu3qPjAxPApimG/PWk2
         4BoEr28s8frf+LC1uwULtEWy8vmIjorZcJ+1AWRdmSprB4wPyPPv3ihYMsP/yL0ooz91
         Ur96GhqsIngrZxkCqydkvMWWccQfo19yFbWxOwTbB+65VvtLKfGpFLNGh71noeYh2klg
         EBuu5ZCX+g6vXu7mltPVrxtLoBdbvF6iJkxpQrVfxB8qwEjFa2GveSytb5hbr/sZMmBr
         Rn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773119434; x=1773724234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xACyr/eCMEz/lpRutUuKELpFSbY3SllWjRNOxMF0vo=;
        b=ZuDKD+Q3HmbdpTxOxk35xQRRUFxwxfijXryV/lM0cwuyT4w9REAzqiVhTTBVg0lsCS
         wuw00Ialdi0MFq8Teq0DcqI36MJxJrbp0UrPM7ALvA+/ZIw/dzrx34K3mHQ5DhGzH6kK
         1UAwnBMDlIUiavJs7BygpFVmsa70aJAqV5F115jr+sjl3dNO0wvoqrCtzgbNZyjZI6yd
         2z+Mdubjcd0VR8hUeGsoGXTljdDlIAS0ZLFYh5RNreSuaXH5ad4oAlgdmt+GaHFZNklY
         0oDgHu/AesDFagsyd0ssM3Q9SoMw8Rp1dHCaPhjH+wAcBNpq79xnUzgInAcPSQzsQYOT
         u/wA==
X-Forwarded-Encrypted: i=1; AJvYcCUz0E9dsjisz6WyElLaSTFCSIA4CGAEQcLkvy6Qe4FJy0ic2DwbCa00ShH3qkt0kn4X3thxplMWbGbqNONO@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDz7OBTmf2QmvvMBYjXaXIV28S2qXmF3sfxnzf1vfPS/HC1Gi
	E0/2L7BKDLt1zMB7Z53qacfNGUWx82N4uGCKfWNFpAOdGg/DwnOocCxmalJd4cvqcw0UQH1azZf
	1mPdwUV9eggWXaUJOaQm3kKb4f27GmewSl9Y58HNIGlgiG+ua05LSoIYf2zo3FHxPRCDW
X-Gm-Gg: ATEYQzz5cZrnS2ezDJDYqB2TIIHxONZQUraBWbABNWOuy1UG/Emdhws6bNJNzJrANW5
	wgxw0x3i6YBjotiz6XxS1zMVAFm6F3mD3sGl34n9BX6OHT8oZ1085fDPZqqLu1pBxNBtK+kdlJY
	qgwasV/EYX4ozLWjQALnUWINvXq/RSJfjjXRs7xZCK3agVHmXX0Bl2rLuCOgJMAN0Bvea1aXHHC
	WXv/pMkgOhc9gmTDXmCT+iaAPUtbysXQuhZNJSIxHz40CF7xm2b7dNBXnO59kcBZTw0S8X7DCvn
	XyRpkzCMHEhi9EjVPq9uRM/RxTVqOyK/owryEz4/UTzC7eKCSl8NaQFvi4zA/4HRZgTbdi710IO
	BzxdPD3kGEJssLu2PiNhziU7NcT7ClHutp1XERY/mD+K8LlT5sf0=
X-Received: by 2002:a17:902:e790:b0:2ae:3afc:eb38 with SMTP id d9443c01a7336-2ae8246be8cmr135644455ad.41.1773119434248;
        Mon, 09 Mar 2026 22:10:34 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ae:3afc:eb38 with SMTP id d9443c01a7336-2ae8246be8cmr135644135ad.41.1773119433756;
        Mon, 09 Mar 2026 22:10:33 -0700 (PDT)
Received: from [172.20.10.3] ([106.216.228.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f6csm178723905ad.23.2026.03.09.22.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 22:10:33 -0700 (PDT)
Message-ID: <65d45dc6-a3f7-4e5f-af53-8f54f1f5502f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:40:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
 <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <6wim6vo626jy627k32nlhxjd5dh7cvvwxraqyv7uujfgbo5p4m@cesxgplycnpm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69afa7cb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=8nKWbjjLc7jCNgWBIcU1Yw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JntA-IUrK3sPUjGN3KYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA0MCBTYWx0ZWRfX84mkOpHIJOzD
 wCJ6MxBXPNDOD5+oFeoQ1hQE3cAfg4nz1yUMNTOcLtaQfGHE+0V0wdm8Nq6EpdKTrNsF+I8+tM4
 ZIm8lAzRs4PKUqeVlip2SjFEB+ZpcIxDWzupmHkoVsH9n/H7SUA5V+Wyc8kCOzTLmQs6aE1Xf0d
 ugSmZtWWbmSjk/l71AJEEKb91fl9EyxXUKKmShFrR1Zt8/nR2aLF41PyGlFlfntxwNZUyBQc0AP
 MJ4OsQHlgcw9GUo1+4i6RORMDuyJhDI5HXZDHq8RFthxPp2boR8sqHJE2vQKRdpMdIJvDrT2H+B
 ujmCjjG0CZeYFACxwHaNlHJLvG6/oWoi5ppyOXD7oRa94e91p8qLwo1FhZpqqzDBiv5VHpu6dAF
 6+9Xn9rbEb3FxzW8kMPzhSqYaOC2a9C5EBPF/X9YNdD1nRtFbFUGPyeHB+WpQGUDpw1muhnzXDV
 xy4Ws7xa7EJGuNE3Epw==
X-Proofpoint-GUID: xC-Ztf3qgDfmzGaExjX80dBzC0GIY7eY
X-Proofpoint-ORIG-GUID: xC-Ztf3qgDfmzGaExjX80dBzC0GIY7eY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100040
X-Rspamd-Queue-Id: 3C4AE24567E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96493-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/10/2026 2:36 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> Looking at the DSDT database at [1], several laptops are using the same
> protocol for the EC. Do we plan to use this driver for other
> Linux-supported laptops too?


It's very likely that the fan control/thermal bits are identical so
re-using this driver would make sense. That said we have no insight
into how the EC firmware is extended on the other laptops, so
adding support to them would still involve a bit of experimentation
and access to those devices.


