Return-Path: <linux-arm-msm+bounces-114935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TwVaOME7QmqY2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E676D840F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JtUI/vMT";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jod1ktDJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6945230580AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DC13DA5B2;
	Mon, 29 Jun 2026 09:27:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976ED3BBFDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:27:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725234; cv=none; b=XFVg7w4NUbLB530UypSHqX/8WHnfN4qELbpDOZN/id4O6hdOYnYcDkM8RtKLtNLY+RyZvoTL2ZRpQCYZQkvX3Arlb2zzuRrd/xlASMyJDiLmlgMMUqK4xn2GLNhxBSQJb+quyawdSOV+8c9UISNVlky8/9Fuv6Q9xHH3z+SXn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725234; c=relaxed/simple;
	bh=XaSVnKAnendPV6GPMJWkve2jJU5XwwwLUFD5CfyFpPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCcvOfoabhPrV+IJx/5H7P5W1SxGm/1/V4nQHKr/4E8m7LNDHdyi8xdhtR6x8Zvf2CSrkvbrcm+bREA7+Ih422arl+i6T95yozXzN1Z2lLmwtf9QxeRmztsOIOXQUT1V+hMuHEN+hFGW4qtWaAqHcprCPte/XpTPi9HNvJMk0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtUI/vMT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jod1ktDJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wYCa2391272
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=; b=JtUI/vMTp1/XzfGR
	2n4t2+a9or/JNF8Sp7keVp/VXFDOQD+PRk1I5VuUNfZgbfNGRSHlTUJh4ylBAiky
	jy9hjkEy8udk+SzKxht/xSQsdQtSbE9qASif5FZoOyK0SXbbwcOF8hTbVw2P8R0D
	sS74mzeZIAohC+eoX+7DBqgjAc2PNC9tK1j12WAiX+XPKD5Ts9Hytxxf/BJl5wo+
	kqwbYPdPY2muE8IxGHKRxFhF3mz3y8tA8PzTjxOGLi4p+Pryn0w+Z0vQOmzyZr+z
	hLb0EgyfekKJMdwJEmfylx1iOx6OKRv9Ivh1J3rNAvppBea1rn/HspZ8kYTaE6MF
	zPDZcQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw84d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:27:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738a934c5daso22387137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725232; x=1783330032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=;
        b=Jod1ktDJmTxdRAJycQqZeNkDJcm7dKdz6568KfRvCNjvz1NPgYi75nXMkmk+Jb/iqc
         8qkLfh+PSZdVj+1Nx05K8VHtw+VTBTFJ9T2uEgWFG5fnLy1coRdvAhABsEa88Ux0AU1S
         O/jn1liBnRP2nKasuhUYFF+3ziBPihTVVWTDf9kzfkCkP+1fiIcmeygOW9Ur3GpU8f8x
         TVLVqKVPxiCPGcCMsTUhnAbdBbrEyxsWoylPoTTYn1qC37B3Z97rzOaQLugPoFcA04gP
         Twzt1KZp19Md2pARTNS8CKb3XPasapVsdVywwIw7vek6eCX9JLySTaxoK/1BnX5O0LZj
         OQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725232; x=1783330032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=;
        b=pwsYor/ifQ6XdUsrWUrBSVColD44HML2yu79Y7mpBSbFWBnj5sqVzarcHH78WMeIYB
         238B/eGr8gdu1FrpuWsury5nu4KPsgMvUXHpi4UFm2cOvZobIsBsjUwb9uwy1H9WJrZ1
         Fmv6sjWBgrrEo6Q2O/Jys3kTSDFKUHwmgzArjP6e0D2marlDFUCjCkbwORYZMETCViRE
         VJTniyTUzNYOninwTKgXgVW3b4rUyQ8tBF7sx7esxGLXOc8vVhuI8ObXTe9ZweAR56yB
         hwYSIUWKv5mjt7yHg/nu6H6JM+3/PlyZt7G7m7RSmlOWQtizL1vcOfeS68iWZpwXF3mx
         lNVg==
X-Forwarded-Encrypted: i=1; AHgh+RpU7EVYRk12t9Np11GPJKhRBJyL866ku359eGJyCceZD6AeYSF31B9YNvMdtmq6b3iZyVr7bfEaTf5YwCYD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnJ88zBaI2Htm4DY2pptWrffccbGHMkvpvr7WGbOAUGwpzCPz
	JvEcD2YeYVyO5ZjynqmTdiS5CWJjlY91TFoHzxxjIbBB/xJdaY8lpmcgwWRwCZTZvnfCmzSbDHG
	vQZkGsm4zT0cY+9RdyfuE0ASEDU0M8vg135zRUlWez6eaQYCS8DJUONzCB948MaMzrdf5
X-Gm-Gg: AfdE7cliVhBD3eICPMhdiPdfmDp7MsFUNaBlxVM3+po6BZmdam9HpiUv89QBewergub
	a0M5x9sJuWuPZT+z9MtdI4ZDe+dfjITjpQJEGUjWlLDuCTIbPnLeDce+7wh+fx1KJ6bdfZ1V2Ya
	kfUx+RFiOal2l9TTI1HntKRB2PJkd4SA7RdoH/ofQRFfSIa5/x7t77SWfbjg75VavpszDNPQ5/F
	IwTSyXHbrDhEwcxgSLzDwwNn4FqGHmTPhIvporQKYybsF9fLAg3bmW60cDWk6Z+3wg3ahAfrThP
	OA5gEK2u0uHln90bVVAKRoPX4e1CVuGndSC9VNsftdI1GNj3OGpATc1BT5GmR13E+owEzmCjWxA
	9E7EKflmxqM+r7sP9WBl0kP08vgHWW9KDpYU=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr2389416137.4.1782725231913;
        Mon, 29 Jun 2026 02:27:11 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr2389408137.4.1782725231519;
        Mon, 29 Jun 2026 02:27:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e15besm6673651a12.15.2026.06.29.02.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:27:10 -0700 (PDT)
Message-ID: <1b578c56-14b0-450a-a8a4-64204254dda6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
 <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NSBTYWx0ZWRfX0yqnug1Ooo6P
 fjbcoj1fw5ndjLrGFcCCplqiuKPCVmMwS8+rI82NA7iscWIV/2Lw2JG7aQPl089erCXRCURta2R
 vkxHbxedPWk0WBVP5g4yBDIMRMWKAYM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NSBTYWx0ZWRfX6plZ3z8Ca1wv
 U4BGiUdYLxjiQQ11Xd5iWLg71dy77c0WYou84I53TPtAtC8UR3aN0CDxQhPKuEVr9plw3kvAIEA
 YAMOYxC4NehYW4ihb0OqN85Yj13MCex4YWGc7TyPiuR4iF299j4NG1FNfuXGhwP1IBt/iS7q+Sb
 GeoX9fIq+KbgexBPwm6kklAMD1di2upvPy1+eCQegsTHfhJWyHr/7lcQ+cQ5YussDl65lnskJY/
 JLUSYkW5W4a4w+aq/vl/mXehwiJ+bNGpJBEn/Jx3eBvbq4LBu8oT+R+R14Z4J1lUvvG+2vDVkYS
 F6JZDPo0gbbpr8Qgv6picLpmPRk0BW3PmItuv+AARKDq/wK4xXJ3GckZqBkPAc7jgae3OIFH2yc
 NDOfGdH3MjuJcuKVTJPvAoqTXUsYhfWyReOLqzEoGD//vl3wvH7dFTCplzD2o9/naGG0Tk/Ogbf
 yvplSQTh8dZLBQ6qfUQ==
X-Proofpoint-GUID: HvbgfdywZKYFGLPezgJKFUes5cHKbr7U
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a423a70 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JTD8sfKJ8PrD1sga13wA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: HvbgfdywZKYFGLPezgJKFUes5cHKbr7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114935-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43E676D840F

On 6/27/26 9:06 PM, Jason Pettit wrote:
> On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
>> I would assume it's simply not present (as every SMB2370 is a separate
>> physical chip) - perhaps we should just add status = "disabled" in the
>> DTSI file and enable the nodes on an as-needed basis
> 
> Apologies for the duplicate. My earlier copy of this reply went out with a
> misconfigured sender identity from a local mail setup issue. Resending it
> cleanly.
> 
> I'm not sure if the chip is populated, but I tested whether it enumerates.
> With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
> fails to probe:
> 
>   spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
>   pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5
> 
> The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
> can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
> pmic@a come up). I keep it disabled.
> 
> Defaulting that in smb2370.dtsi would touch the shared file instead of just
> this board,

That's preferred, and in our favor, since there's only two boards
upstream today (Glymur CRD and Mahua CRD) that include this, so there's
not a lot to fixup manually

Konrad

> so I've left the override here for now. The comment in v3 will
> be updated to read:
> 
> 	/*
> 	 * smb2370.dtsi enables all three repeaters by default; SID-11
> 	 * (smb2370_l) does not enumerate on this board, so override it back
> 	 * to disabled.
> 	 */
> 
> Thanks,
> Jason

