Return-Path: <linux-arm-msm+bounces-102710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKu8NY8u2Wl+nAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:08:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A943DAE2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2AA030063BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B193E2748;
	Fri, 10 Apr 2026 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrPr5XbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+Tvlpa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78F3E274A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840894; cv=none; b=VIVOwvcoeVbkwIf32huHy6UXAWwke+ZdtpHauwu7bllgL+YsfbCeiPpZ2b9py6eaHdZgzMYsNZczb+zMH4Fwtb4tBReNAfx5EbV/KnVAfDOw6M48BDAoSjTj39QrdoazCkIJ2qsP9O4LZ3YPQKBfr7nEJiQ3x/Bx99LLImDVmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840894; c=relaxed/simple;
	bh=SSw6uo7wQYRFUP/Y1wiTkctP3k+hXzw1+IVpWEt9h3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k35v13oQMeIutDpdLzed+BArDZAgJ71BD5c4QzhF1BDkpoAtbkNY8/c9tKxG/4HpDZQ4OpdlPbZRX3+mrjz5zT8wii96sOEHGfLlXw5l5Qq1GV6cOqce4MRdLBKb2Lqv3dfhPF178cwvJUVGH3Hy0AsJpX7aB8KZxuIo28nXYwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrPr5XbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+Tvlpa3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJPOB3118621
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSw6uo7wQYRFUP/Y1wiTkctP3k+hXzw1+IVpWEt9h3c=; b=ZrPr5XbPN/A5E/Zf
	+FqrSJToxNlTn12UJhwww91gASUw4GeapYqdC1ztSZzneu8+iW10tUbQv6Dg7Ioh
	yXBEHtqlN+FVg4Inh2NfEJGJ7XZsWXS2/FeVGFLs4vQjzovawH7RjVZVIiSqFYjM
	6Pmo1jic4wmlt7Cd8AUu+QTmThYDWe0beGYuMvVkceFsV1CCWVdiD5a8wPJTtUCE
	ikBUIsgiyjB/v4KijX+Yg+F6mf5mpwYKRnB1E6tbXLWhL6hOEG+2iRc+2zC72MDa
	B8ee+q+/Okrm/tj+3hM1iZ3r/PUowgXAig22zViRzem1+o4VBc65QyqzcZhFD8h8
	RauIVg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3raran0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:08:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so3153113eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775840890; x=1776445690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSw6uo7wQYRFUP/Y1wiTkctP3k+hXzw1+IVpWEt9h3c=;
        b=A+Tvlpa36W/iWzRPKSgmYta5/UDVHVzh8Fo2f5lILcG2Y+BKzKB/38+YPdvUp+yWxx
         wFbglqoo9mayrCyO3boiozoihx3PmTr17yw0IzX0ZL2qwOZvuVzyayuDpD4a7+VF9gYW
         +KM74r/a0cqZqxx/L5veRmp6iBSRj6c2fEaFVL9XEvxVvryeA84fIGjVfGPooQ4ba8Ec
         yDDpRXfkSMu4Ohd5JIFVHV6N1mbf7KfTTskeWkf+G8A+SO4sqNiVLC3wIPJPZ1AKykz0
         uGorRxsLZmw7PZSGQOy3DX8wY8SnKmhMMs4nS6LhsUUmxXwyzO4pSscd7eA+BRtJnN9A
         W/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840890; x=1776445690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSw6uo7wQYRFUP/Y1wiTkctP3k+hXzw1+IVpWEt9h3c=;
        b=cPdRgYUhV0nLeFMzdxgCQDlwlrFm5UQ33ferZdO+Gd7PKXf0sE/lNJf/7MdKUXAeMx
         d40JClGW9UYRThR135cmDZJJguNtHeG0U1Vh5svjCb5pvfnxdTXmmCnc8yU/GcgAMeIA
         WIjlKGqXWL7KvDpHwzz60N2Q50Yk2X1Lp/95lhxd1FCBPZeLyMRwl0b4SMcAjX+WHakS
         YWKXjiY3RNW1FFGXPi4IrfC+2FqXUb2hCjJXgem4dm7F8skWM/zeuSjkCXtSurzu8ypz
         2F5NOcDa2y0LfOPRqt+oGyLkNEFaReE9CI/rrVdf1sbB3ylNbPf13YVpccdKFmMQ+bd2
         RPZA==
X-Forwarded-Encrypted: i=1; AJvYcCWSH6Xeel5Ix4OvBWplY52seQoHH3WBK3hFex8mDyTLw5QZRzzdoG/na3FzG4MXadkj0VDfDZID4r/Br3lK@vger.kernel.org
X-Gm-Message-State: AOJu0YyC7iHaVth1UgONbjILOkERNKCumvC7h6VPfj/tx5W+OYz+Yqyh
	pOZ4Wr3FJYx75KcqtGYYSvvwBl9nkZyG/H38MpB8jnoPIvspzNeeXIgqGiVzYi5axy9uONuTup0
	5qAdPKZ4nGmgbAf0wmEsiu3iP9dmC+2HWdSnvRdpOBLdKc3Jxab5r9KkdEM96/w2G8O36
X-Gm-Gg: AeBDieuJN6wbj3ebzgXJIK0UwA35CWv7P+owjbihwtphxrJAYHOjwdkGyPcx4/IXEoE
	4lGXtvqbbhlqwsPjyzYHuByT7ou8lFFf3B6TPpke+h7dtakfrTMamg5gh1p6BbxDPvLZWFeoM/s
	9B8ZHT28U8TD6v+taF8ifCLgunbzDVotMFKWN1AD4G6iqhhm3rFUGbFZ17C559wROKu6B52nb9g
	hdDZASfGbXapwfLJsNozF73FJelSE38JF3nWRV93pky/2f64Rk1pNWBvt+2GiK71VggZrS8xzL4
	GG1jMn0pYDGh/vMYQrFGVo0gM1VEptAGaOdOWKaNXkOTfXQO72fg6wg+dYCa7K3KNoqtFpzB0JO
	jLvjLt3K7afKTyuShQjkJ7NtrtmqM6HluCJrVl+XWuukF7gcQwZx2nnCh8c04kYofGA95WNIEUQ
	Q=
X-Received: by 2002:a05:7301:1014:b0:2d2:d7b7:5c6e with SMTP id 5a478bee46e88-2d5876a0692mr2102063eec.8.1775840889549;
        Fri, 10 Apr 2026 10:08:09 -0700 (PDT)
X-Received: by 2002:a05:7301:1014:b0:2d2:d7b7:5c6e with SMTP id 5a478bee46e88-2d5876a0692mr2102040eec.8.1775840888986;
        Fri, 10 Apr 2026 10:08:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm6239376eec.18.2026.04.10.10.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:08:08 -0700 (PDT)
Message-ID: <7755ccdb-54de-478f-8f12-98c6dac03e8d@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: fix incorrect counter check in RAS message
 decode
To: Alok Tiwari <alok.a.tiwari@oracle.com>, maciej.falkowski@linux.intel.com,
        jacek.lawrynowicz@linux.intel.com, quic_thanson@quicinc.com,
        carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d92e7a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NFNAc6_Cs8KxrqNOKKQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MCBTYWx0ZWRfX4Imepm7ggpRj
 Ev5Fra9jzobW2s4ttr065zswQ/DcheZJ5+uEyrSx7cXid46BZozXDT2QxBJmONVBq1p9w3dfr1z
 9mf09p+bwYlgNWcNfYWMIngiwnEtVsqVNnn+jOVb4DN1LNJIaBov20xroJ3eQbRGpfPsQgQ1ksH
 hc4/8EliQ0rjBaBqnCPB6M1A+S4oaev/sRmLCpTjB/0RRkeNoxmXTwoH+HJ9ufflVTWLsfmejVt
 OEXBNvSi7KlOu8RlbH7Wk8cmzEfX+BZWQ4quYcrwhrVMuM2c3yEqgEyjPOGkh0q29sJ8wOuMMH3
 +KicTSc5BB7FlVnO83faxePsRx0EGWHhswzHo/k6YCM8HKuqrc0wNADaWcLIFASiB/zjBAVGX9T
 t01AIE/oiZHCNDfBe5e5XSV5FyLbf3bmmPCvqATRyL3+U8So+bfBD1xPYBpofu4QBTbu0Ie7tmX
 6fDGu4fyjF1REsUvxLg==
X-Proofpoint-ORIG-GUID: sasFrCKeOISSdCugOfCFBRVEczGsgCTu
X-Proofpoint-GUID: sasFrCKeOISSdCugOfCFBRVEczGsgCTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102710-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39A943DAE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/2026 5:20 AM, Alok Tiwari wrote:
> The UE and UE_NF cases check ce_count against UINT_MAX before incrementing
> their respective counters. This is logically incorrect and prevents
> ue_count and ue_nf_count from incrementing when ce_count reaches UINT_MAX.

Nice catch. I'm curious, how did you find this?

-Jeff

