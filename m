Return-Path: <linux-arm-msm+bounces-102101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFRvMuXW1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EC3AC825
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2207D30154B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E190F3A6F0C;
	Tue,  7 Apr 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAW9Jdns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVVadJ6s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0213A3817
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556323; cv=none; b=UeCPACCMK9wp2hYen975CYB4bqrXHUo7IGmRJBZKFjm9Jz+a+pLZFPmmvh5ZHvpzwXtEbCDFs8ykTvW2NCt/qjSPI1UBf7jNa67rtFgWYwfypzHrioBwy/lOVjgGjp48tTvzGbBNs4KXMTYBIGmx39Cm+QtcjBjHLuRSc3vCqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556323; c=relaxed/simple;
	bh=FjAiT5EfT2IuOb3K+Pty499OGRI/ikRMlJtPIYoV5qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G5LrJIpZA2PUb6r4R1gYsRO2VNIj6FXum/8nyo2EvvgmCRBOHsUE3YUrh61YWEyuxhgz43uZjOogJ2rXdVTjlAy+eg0hznjn89dSp5MCA3jTd4zREin2YPL9DRNE22AMjrhpwtx87Z2KXZSe5VaZO1Pq1ZFg/4tnjO7Apgs+gJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAW9Jdns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVVadJ6s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nn832550321
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wFzA2omutyD
	gArQT4+qbnS5naimicpEKr+NS8iMhMfo=; b=BAW9JdnsVr4xnjRCj6O0rxVWpe4
	cpTBZ6JpOHKTvjULfuMLEmGOJE/5INe4kEMCZAHHvuVYEf1FS1MsxSBR1zrThmUM
	sacCCuugrU4zffIcN9FTNhQvfllV+tqmCg2x4r6XIEfz6TU1Rahu7Bhg1UrDWizx
	ejrmMbHDLAqSJgpYS6THeVlPibqiKRYP34BM6vLSufiY7zFK6JRPo+KTK1m+z92E
	go77ztadradJmpLFhJXSqgHfAodkzXOqtz7A+/bI0L/KQ4FBm1AdP70P2Bx8eOru
	9pCPQ4BHWbyfD75IBdeNg4PYzAageFQXLgUS2gLa3BVnuBoXRzzG+vx+cmQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea6ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a6906e35fso5149926b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556321; x=1776161121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFzA2omutyDgArQT4+qbnS5naimicpEKr+NS8iMhMfo=;
        b=ZVVadJ6sMqmVu/MweIEUXvEzvN3XmTkgS+LSx4pxKaE6kMJCB7C2uyfT/W+iZ4p6z5
         UQCO/YNVbyAzfKORA7Fcag18a38DdwT9Nfnz6FZY9KRBg9p2oZtJ0fPmTkOh7zMnfgT8
         wjQGiuroDmqZKVoSVcDGchQkpCDJl74V+N+1kIyWE4sL4BwIKfEAHLy59jEn93Tm1pVQ
         y6STc9JbcTehi5LIq8us8qDZQwkBLN4i+5aaNW+Y8CZpqWrLXwYoMpcDWJ3nggd5zEvE
         3WnL3UOzLXHFuw23Ais0zaS+uo7psURlulRiVf3tdg/DWF/Oa+i6t/ASFtDublN+a6HP
         P6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556321; x=1776161121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFzA2omutyDgArQT4+qbnS5naimicpEKr+NS8iMhMfo=;
        b=WwU/4EfOhKMgf909AExnuwBFWKagwrxu64ROrJA26Ch4GhYRbNEyQxUtFjMI/LWQYy
         LWsf/mn6RM4IAEER13XAlns3v+UGKe65pSiek1R20Pze1Yc6hgwj+cQhWqfk+oWb+PoW
         usQCo4fY1EtXgxuzuslvuWG8YqyZf3AWNKvxSGm70YZ6s9oxditerMvHbD1WPqZcC6/y
         V/5AKNfklj8yp9rDcdhtxc70aYbkJh2exPt24K0rbS2pUPRH/S59xE3YxfqOC3kDa6ov
         fZf/OrI1YsqpR0H+ADZw+ZrDoPfgshC6CSZkiegYOBdpUYlgU8la4zeHtM+mMZUSqmjY
         uz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSMtgfcAbYd7IAyU/t1cjbrN8xmTRCRVUWo1vrRzqaoqP8gM8ZDy8T7xQlCBdn6wYtKjVl+AXl0uSp8/ti@vger.kernel.org
X-Gm-Message-State: AOJu0YzipH6DlqcY0kMMRLXqfUAp6i7+FM/vNGGtnGSet+GT+Z2QcgG4
	MdSqXS8XkobZZAV6RmWmNlMPzN11WUxnxrG3pyLi4sf45Lr33Ha0FwxnqX/qptAcsLBdqh871K4
	cu81V9E4lBib1NHFGVLIKwrIFnb1Qm18DIfmDeDU4TQd6fSBnQ36ZTMe3Q07Gmuc9o4o3
X-Gm-Gg: AeBDievJMPBew9u7beyBe7UM72pW8MUEtw51YvnifWCWWwEEXQinV04b0Pe9rTvxp95
	/hFg+sO68oeff/U4r0QjzNGGH1r4rnYhHx4OP/fQ7N5YOj7geFvF6VeVplVndXmmte2j/NFpfWT
	v7n2BaXWbcPh++JNOJZ43JmRo46OcBftPBaAiNpv5pvBmYWFbVaEMtrY2miy80WKB//A5vLv/rz
	rSm8E4WLPXH/QD1bDO2y69bEycpv42u76bNmwlM12aQxu+TVSzQ13EPr2c+dUxAQ6SOj2ZHUP1Y
	+WwF9fvL2SKTuvyL60ehGhHm3p4py1xRCx/IfTMKqk64xuYnYCMBdz0cvQjMC99R5Ob4b3WGqIm
	mqrIb6vhbBdDxBobcj4Mj5diDToqqTUjZYVYfJSerHbT4a+jtl7KExzDKxRinWDEbeomdxcC/fr
	Ha2buXvubvB9yqL7PB1g==
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr12972031b3a.22.1775556321168;
        Tue, 07 Apr 2026 03:05:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr12971989b3a.22.1775556320620;
        Tue, 07 Apr 2026 03:05:20 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm17844323b3a.12.2026.04.07.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:05:20 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v3 1/4] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Tue,  7 Apr 2026 18:05:05 +0800
Message-Id: <20260407100508.1027-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4d6e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 0rbp6yX7tZ3ACrB1StgevfGJ9VyCfuXR
X-Proofpoint-ORIG-GUID: 0rbp6yX7tZ3ACrB1StgevfGJ9VyCfuXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfX7J/g3Qqm+ce6
 NKo1YGdP9rl6kkVtD0dJ+M71xEBmCMv7sggcNvmxCkSz2lr81xmfrLv6maAhc3EuWub33NrwmbF
 l2cHnme53fvInc3OAr+wH9MlAqRiXC2Ovp9vYYkDhxLlOT/hVlEjy2Xqwg4T0VF2i11x0fuTOjA
 0x31WQSgjLtnTVmm2mS6j2xXwaCtLYhmGfsq9APwsbMmmeoH85k0t6iWiYXVYvQicdHfOrydnOC
 fErevE3twp/ueQiOyWSjhajcHERrys3BfVBFPvXvDjDj/OWskZc1oEUM8Y0N0t2tK4RRmRyxwKC
 yCMOIUq7z81SuOAxmxK2XjGHGHjIxgOJFwv3Y0rrzZypzjtL+jM2UVROowBcwBD94uViQLiO5nA
 WtQX4htOwNj2g826qiy4g4kkCbKLTzWqw4KwTihFztCNvCh/GhPelC8fnzsmc43Y+efSirgy5O5
 k9pUJtbL2YjyAJ13tHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102101-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E4EC3AC825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initial buffer allocated for the Audio PD memory pool is never added
to the pool because pageslen is set to 0. As a result, the buffer is not
registered with Audio PD and is never used, causing a memory leak. Audio
PD immediately falls back to allocating memory from the remote heap since
the pool starts out empty.

Fix this by setting pageslen to 1 so that the initially allocated buffer
is correctly registered and becomes part of the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..b87a5f97c96f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1324,7 +1324,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		err = PTR_ERR(name);
 		goto err;
 	}
-
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1347,12 +1349,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				goto err_map;
 			}
 			scm_done = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.43.0


