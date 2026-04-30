Return-Path: <linux-arm-msm+bounces-105427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJzTBOTK82mL7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:34:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A579D4A8412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8FA53086D12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6147D3C871D;
	Thu, 30 Apr 2026 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKwkiZEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz8B4CRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA32D0617
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584651; cv=none; b=lbdijJ9etHhi3s3fA2K0ydcApjb4jlKcKN6/i3czlKtO1zuHwyuQg6khPksqXdfYZZMty5G5+PdNJG+cHcxBDD+V3rdfqKA3Tic2CInIUA8/rZKp45KzubA7eATEznLPwS/IJQKR119vk9tFq5D3HtkzDwbT1gPyY2I1jYcXc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584651; c=relaxed/simple;
	bh=/pApNrI313opcCNwIVW3kri77G2TnadQlj5I7MaPn+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dkGLMFKQoz0AhcUz7gZQbCDY4pY1d9D1NKAMXReL9nprKQw6u9OhtX3csOk5LBEyfg6ukzU2axyPgYzabIB2Ph1G1ExM8J636i+/sYoj0jCLH/xViLyL/Bgf+COqbSSzpXPBSBx4lP7rFK2RB62zySB4zDkqNDxAziLCsaKRND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKwkiZEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz8B4CRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKIDPS1854107
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=kKwkiZEKvwM7Fm0C
	GYBkEu+VLUWSTWy/8hbRaIhk0M9p9i3OG5XvQBKSIUhSF5t3l5ESPRmIiScdUVZc
	R46F1jY6TaQtVn0RkMjreRJGf/zaNIk9+njZYxeoeD7Ak2cQ/I4gPt5ARnvInVpl
	wt+FnwEwOaHSkcyEjNxvJM3R8LKQhWPfhipOirUJDuYqx5bterrj6cnWqavbRWuZ
	0GxWN5e7tfYWcwMtinUw3vG+uSfQTS272IEyYB8WfWQ0VFSjh2506CuHVYakf7yH
	chO9sLl/4KdwaT1SFgB2iVZ4SI1KHUvI2PY5z/0QzCh/HR5YgTDEHyanvxabNI7v
	N4gleA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g07mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 21:30:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so2955072eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584649; x=1778189449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=Hz8B4CRkSyf10qMtFvow1kPMH3yOKiuYbdl1U/88nSA2/FMM/Eg1mSZGujzReS1z4q
         sHDIjKVcVgU0JGEzc4cL969fx18DNApmCG3RZqHSPI99niydzsZTvYhpDih1sFSm92mk
         K9R/CXf6lUKYDiYh01abOt+PwpbBQoDtWAPsjyleK5acuRuWVpRrKDzwheyL6+i+GoeZ
         OsYa3bbuYspzJUrw40EMWSs8JgUewnm98TF9L9ZaVXBUIjFRN+ye2Udqv+aMXPlbHDSj
         Lv0QzdUgrGZbwpFIPkAVhhkdcX7l0hqyV4j7IApdi6aL2aNEGHGp1baHgyOWhDn+beT/
         +61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584649; x=1778189449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=Kf9ILQ1izgOIxrWHpgkR57YMPqfYy3HwCdaSRwpUjAUo0lh1gIah8DmP395YAgWNfz
         cUUs4ZVaW8L8fgn481PxgC2V8CWKWQMrgJqvPZ8LI5r/ckdqlIm9ikfahQBhcZTYvtoH
         LcVE1wLGq5JjmJO5gFnGJotGl9FpgQ25inYCnJywlTGzXu1HV5uI4v1B/xMgYWJR1aeD
         /+AFnZfGLvs7fGkYKQpqGjOOJdkLTlf/qmqALYR/lo8xAovCLgwz0psUH0duBJVKHRsX
         tTovilLNQy+l6H0FzZ4AHWcvqt2I22+sWy1iMxGMzjugNk1TpKhGZ2OkzquAPfi1U2UP
         tXIw==
X-Forwarded-Encrypted: i=1; AFNElJ9BCFMxWDpdXtbmFtLpyO1DSqfjca/XtCY34gp/DIHyHoo6884863ZPsHI7maNZYVM0msD8pMczXkbkckSa@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWBlSSmVPAXWHLw0KSaGywrskQpb40IDJSq65r3ClrH9afKEa
	8ffixh39Gfr772cdSvc4cOc18LKg+kKpkW9kqejhG7KQVe/9YPaAlXNnMhvelzmlNjpMiAiEzoZ
	9Cx/a9qZLoh2RDJsSkiBypMUURVTNGT9kJi7OXXKy7iqq4zb1iqG+Prs06t1vYky+J3g2
X-Gm-Gg: AeBDiet0XpUDNLbm0K1R/Ep4AjXlNfWDotbtfH5ztz9TbAAX8piml/gOAr3mDM8i5P+
	wrYlwRDVrNUg6DDJTcitAjBGqeWvaNjexkP/nEy3G3p6yRH5wdwWskdXAPEBqbXUyqLqr6u6mWX
	g1FG0ND6sDUXmny4x0MgHsfWghKOiuG4XpQeLBE29m1AxAVhtuL/2nJu4lVUpO626ksWGfGCEHJ
	LVc3evWOnbh2bEq6cHMmmaPl6E8ojICakhMquxOziIbmKTwRvTB2HuoFRiq/wf+bgRSNB1zNmHF
	Emw4sYccOjOYqimLLRl3NqWNXiq7XbaMlGwiJ47g0iZ+SNcOEbhnJP33fPGC7IDu05jG7uIagdt
	4BxQoIdjTQ6HtvYfWziNwVpXRwNtmiZbvH0FsJbiUivLjhtIWwVv13zwaKCcRkDeHkWADkdDrEa
	io5DEB4GvlTWo=
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269190eec.23.1777584648399;
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269158eec.23.1777584647794;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath: Unify user-visible "Qualcomm" name
Message-Id: <177758464704.1848985.17511825714813027637.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f3ca09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=haabeQbpXhb7lDqDI2kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: qNDkoD3mEzMYQFBJ_Dxb_od_tI_anNEd
X-Proofpoint-ORIG-GUID: qNDkoD3mEzMYQFBJ_Dxb_od_tI_anNEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX1V/vPgFRuJim
 A8HgAbRw4VPdwVqcdujvFhSkqeXFRJohTkWuzJVAIXf4xzAmt5aJjzq/HwAmg/mcuRbY38A0KwT
 C9QNLNNUjdJ8R4eAw9RVvDTAPdPuChwmdyoEZPx2V03Q1+A/iwIhoaJ/cTP+gcqpxkJwS2mf8/+
 uW24+rw3oNQaiFShHxPI0Aq7ppjQnaB/ALjZ2dl+VnFwNTQNjrBz8nKgEa46C6O6KscCb78fdb3
 Nw82oiYtBUuCQTsm5qua0Y8Lt3PuP46ktHvG8Ai4piw9hRl9hGf65goT9hC3x6syE/8VTtZRlAz
 EkUDOUen7TNjzWq7XriRxqhEXjPjecupdhfEIyEF3zSDFaLQUBHYsq2WDjTWV/4ObpIDnli6v7Y
 8r/rbTjtUEY3XakS/WZBMhYQr8ZmODMYmqGXzGlJkdUS75DN+61U66ccEdqvHGeXEksARy/W+BN
 AK4H7Ov/am52kboAqMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-Rspamd-Queue-Id: A579D4A8412
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105427-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On Mon, 27 Apr 2026 09:00:41 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] wifi: ath: Unify user-visible "Qualcomm" name
      commit: 2419d92ad387ff34376e7c3afc300cff651038da

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


