Return-Path: <linux-arm-msm+bounces-100386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePRRAIS9xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:25:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF693484AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 509413012A9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF5F23E330;
	Fri, 27 Mar 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I11pTHtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BK5V6jdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6F634DB6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631203; cv=none; b=GKI/Zm4yiEzuxPyFZwyjbRoYlZ7PjjlqZyQDQW0tb8gZ33tqb5nz7nUSk01Sm1ez5U/mvgkLa4oh83Zb0sYjwtOqi2jaI3BS4zCAGA9rAvvav1D8Dr7C/KbRcVdAL5iL+BX4wMQgurNE4INwl8mrI7Erri5ICGmC0TpU07oOkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631203; c=relaxed/simple;
	bh=NVFCRsGMlcCFic5XYuHGuBUmHFBMy+lLkiAYaBlsWxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnevmmQMcU9Mx7nYdv5bg2cW+r3Hqsi0g9y1UalH+W9zyWU8nZ/dxAMeTPqarSGFAdOLHQPyouF+UcLK3NB7LT9/cwfBDO5W5ecEKhSliYpPDiBHsa3SN0jEdr0MmxSqVdGaVVUx9SbMidN//IUPSoMJGwHansxgjJFnJ7VOBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I11pTHtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BK5V6jdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFLBxp537120
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GS3LQj3VklJFNld8YXX5bejvQKGlCpBHnctE0eLJaNk=; b=I11pTHtgrwNXubLD
	SSQy9vUKUI1LhTno95dPghfjqs/D9qHmjZIJal923GJrfzmnRtLRn2+qMlJoq8gU
	DwmGRIgi7idDh9uLvyfnvl3mRtE20oRTtKBSEkpUYEztkZoDJube85RhbDG/i8+w
	GG3YBrItEu7t4N3EzHUajoSigJ0KkHiei23rX8DLfWI6UML0rprc2fx0wdK4aW1p
	AqMCvv406aVfJJVbLhUlwjnu9IHmZ1VFLRdpOuIYgKhjvbSslV4Q52as9Nwd4MXQ
	4ju9r7phDp5iJYR1n4qC79fMhB04NO4mzhR/PXSc+JZFQH96N8X67JQ56Gy6s4F/
	xv70AA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rbdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:06:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so578415eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774631200; x=1775236000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GS3LQj3VklJFNld8YXX5bejvQKGlCpBHnctE0eLJaNk=;
        b=BK5V6jdN9rXEz7qZzj6XCfE6Kk7GPWSTXm+QtUtcUt515TtZ3Uih9QL8MJWCzMLjSQ
         D9UJVW9XeCiYh2T4Q1Xt31woaAZcCfT5zp+XbfDZtwzIl15UpPIR/pyiBO9amJxR3VsU
         IFNhxZLqQ754ZgCJoZmJZ85tQptSw0qKHQUZlXTKmp7EqGsUBPoAXdHT+piX32z0ZtfD
         a4k7DsbJR2/U6A/m+gZJe4BxfgG31EwTN7JsFctrkFsYwZn+Zc+Lx8OTMQ0OLiU+/iOf
         4hOEmyEN+W452LazLNtQ5yxWr6OLK14jYWNbs3SWV0IDMJU4tFS2buTSNBYua243eaGW
         mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631200; x=1775236000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GS3LQj3VklJFNld8YXX5bejvQKGlCpBHnctE0eLJaNk=;
        b=GwcSiVr9rE34Fz1XavbcakfbdLfcOrVFEvlAcdRVetQj8yoj338YwuVkbuq8t275aT
         g0Q2YM/TVopaQ5ELkwrHJYt8zew+08JM8t0j/wcRAVtD7HPhVY3FYsvIwjLsIOJnr3D9
         dNLPlKlDBB+I/GpaoGDyqOBQ/5w5rbRk2bZ2atHVGHSpJkXYRxn2nL3hLE3k3C6yzz4d
         x4FfpC8N70rFNrKIAmsXmF6MD/LKFaS0GtWDhzD1z/TJOUE/fbUY+S/0d/B3c2cpo2q7
         CdrB0Dfkxz3DBw+nkmPGGL5LZEbhl6kqsg9JoYmCs/dETc13pp+HLTHj0XE+kVNjX8cs
         BT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFoHQJX8crAMiQ7Jwy1XIEQ1UgUDOfCVRV2jtq3F0eaFLS0LRVP3BYr1KBFtaBeGPrWLIVrDqh+LsS4xXR@vger.kernel.org
X-Gm-Message-State: AOJu0YyI2pWGqQ+AsQCsi+o0glpz1t4c5OW/+Ya1G27yHHvh1op+4lPn
	pBgbvd6rrYP20WTDtJ6D/4vpRtGe1bVM9pE4AWtuHUL0mbd7fVqYKvZgzIEYq4JMaDyTk7Lnd/C
	IjLcIYilRHv41E5Pw1gFpDdhviOEKM1BgVVJhIZWxpS3+W2uCO25zqh3PL2ZmCIdpMqJV
X-Gm-Gg: ATEYQzxlALSfEYj7MfgBbaAo6IoRVRKxNCpZqVHs7tX3hEgCE2gnCps2ltA19GpPNdk
	btHja7hp281HPPki9aYJiqHQGT+orlov12AYtcnKbg85mNWAOrRLnC2XcSEFGjlRS29GKS2q4e6
	Wd/i9plPA4An3aUAJmZod8ts+Ghg9CPQ6KygafoPu13NzGw8i8pWxLHp12enCEKot4b50clh0SJ
	ShP4YXSNTTF99Lg3/eRO60dSz5d7bQxqCfEgWuQpn5hcnZ/tIDQ3Ks9fnF6A4Kc1ADleLinKJyM
	W3/frJyiPLfNpAADUlAV4nxz1QKEpGLbkXtgDf19tlFDBSf4RKIyKNJ6SDry2ACtiwVwQ9VXh31
	azUy6TIbVsTL5jsmdCyKG+MJT/HfI91prlzal/peN/y6DNKixCQbZRrgBlnQVdgeNLyCpnjnn+R
	4=
X-Received: by 2002:a05:7300:6d22:b0:2c0:c775:a46b with SMTP id 5a478bee46e88-2c185dd2556mr2172477eec.8.1774631200312;
        Fri, 27 Mar 2026 10:06:40 -0700 (PDT)
X-Received: by 2002:a05:7300:6d22:b0:2c0:c775:a46b with SMTP id 5a478bee46e88-2c185dd2556mr2172452eec.8.1774631199783;
        Fri, 27 Mar 2026 10:06:39 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec26651sm5879753eec.2.2026.03.27.10.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:06:39 -0700 (PDT)
Message-ID: <157a2052-2a1f-4fe6-a079-4b764438d0e9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:06:38 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Update copyright headers to yearless format
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6b921 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IWQDTU_h8YkQ2KHlyqYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LuYwHmv1TaSdMT_tP6cWQtuIKaQBBUwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExOCBTYWx0ZWRfXw1PLE5mZMA20
 b7rzGKifHEBeiR/B9Noo5/pxYp8OR+xihG/3r4pKDovF8b5ttUcgBP8bfLQGhoILMEeyxBTgGIO
 919pRmAw/HremO7A3gh949Afk4YBRdPC/sPOUjjIxnzjXwwuCzqBlckgs1tev1sR0JF5t/w5XkD
 pJHzeNaeiMBJ1T2vRuebyZgWqOQPUNcTkQAeq4FrytWzX9YpVX6zPDB8X7uq21p4IR6W+GkRrf0
 Q9orPEgvv+XRo7c01EliAJ3inJ4zrLSPLik2FJMHszLNFCp32jzJ6CgjBuuq84Jl/1gINfrIM1q
 Hb0Ky7p+Al9N+w39jDLecMWcQ49RRlX9QyiQm44f4rI99aqAN3K8+r85fEDfWlLtSyjnmXa27Y3
 FezdaPtH2u/4tXKRYAU7xrY7Xl7wod6Lm1pRFDrsXUmYno1e7Vz34huPAvKWBiLbWq0l1j8Qztn
 4DsAlMjHfuQgsY0JsfA==
X-Proofpoint-GUID: LuYwHmv1TaSdMT_tP6cWQtuIKaQBBUwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100386-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFF693484AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:24 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Update copyright headers in accordance with Qualcomm's current
> legal policy.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

