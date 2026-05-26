Return-Path: <linux-arm-msm+bounces-109787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKyYOSeAFWr3WAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF405D4B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A24301C592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B673DEFE6;
	Tue, 26 May 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhXad65q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsUr20xZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319E3DEAC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793916; cv=none; b=lyG/98H8oxRn7p7UlAGmgDAugApq7ohpok6XQXnAijsEtRPiw3yz2RfOkqpNOE/yQOH1UKIulQxjAZVWEkQCLsN6ThIYvEVJocHtJ10vB6UepgM/g/e2U8lu2Y5wJai7BI1nAfnqQONyt39Kiyfa6WwIyuHnvaOOJ5ItBBG+/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793916; c=relaxed/simple;
	bh=JPVQANRPzIydaU0WcpkAVORq1mGKEPTOEIUcCS0y0vU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g8bmXwwtAgKdVKamstBf+sJdKb9bhg1t17b0KFTBtUSnlc24K1khRan4svLpc2z5bpa4LAaLBRsnF9Mz8I1mWASEHBAn52vjRKji4nEUE2p62Qz62jafQ0DMxyGUkrSalgkkfXj1SYb9dVikO4EmGw3xBHkzGMx+pZBP/fDqPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhXad65q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsUr20xZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8VdR34117392
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GExpfkrACNf
	d8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=; b=BhXad65qnuPXa4pCQ3qTvcSghZV
	6Ins+HEiNdbggsV1CBXqoSw21PEY8mu/L4CEXHVnYiGnujqPsa/gvuc5xXIjV8Fx
	UJT9UGh0VW94qVRrmUAGphoK9ndcAYH4hBUG0lEtauXjoSpDplQpu3llj+aMOQNu
	Im6Dyq7SKwTnZ0NMyJFRbXv4cVOGI/tB9hsCNFFK4q7XVGf5siYwf4opu218fUNA
	UjNuv88twTY3CnjhrBEbepNCX9afHh+KIo3KePKnc+d0ItD4X3q3ZvHczamGJ8lk
	MWhizXqWgJguYgsTGSepdbesPvDZoRBgYEHOzmZyZQMDbtsKD4swYh3SOGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbjut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so8703412a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793913; x=1780398713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GExpfkrACNfd8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=;
        b=BsUr20xZwouukmXYrwUkxey0euO3TOIfQaAFkpFWRNrIFi0CuGYDX4SRRhJcvCsSmg
         9ZO5R+oVg8MY+XB6k8XHJsu2FsHLPlPIGbnfvXwdey5b3sqM6LF1PlIMLztSbO5ghm4T
         /4CwMHEgXTuhziT5/MrPilU550vpQ+djEAJfDFbm+EGpC6wsdI0U/b4D4sNQVNZgIZ0w
         pM+kiy84Y+K4aW0F4lHSd4vboMMUwYXityWUI6gZQHM9n5Jm30xgT2z28BpIOnCc05AU
         p6qOXYS4i2Nh+uKj6/AXanbJJRpGB+4Urh58hE2d+qJDUzKod+1LFgyBZn92cadbKUcq
         l0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793913; x=1780398713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GExpfkrACNfd8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=;
        b=QEdOIpUi7mqoIZ64b5+EaYUGWqndss+FQBJ4MsZrbLMJHWzzqXNjaoajFoVgzd/dRf
         EIjgCVtWWoWIw2M2XUh1/ymb/k+NWvKrGoWuFpIUPzxJGoCJrdhPrFo3Jigzi9am8uzI
         b+57s01SxkhgsUx/1aC8gTLP83+9KUcs7fEtfNQcaFjerq35tr8GHr1mbMG/cuxv6wA/
         p9b/FtJ1wm5G1Xa+1f7UKHIPupACezW71jRHMXHCmnr57tlUHfzb2uIoV8IkdubhE4j2
         SvNoPlEUM/bLr8kinqhoeBKfOwH1Uq30MgG7P+/t03WhoDbxvHQmLMav0EOQ4NEBrVEp
         KUCA==
X-Forwarded-Encrypted: i=1; AFNElJ/JuEQqpuqwwRybZuNSjQfHmXOQ3rOVsuFuAU0oEMpJAtFviconyX0WdzNUH5CUxEl9inieV9OgChzpcDyk@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBeGmdOAakSwxRy21+F3O9yNDHCuGRTe4j07QFuXekr4dVpY/
	/xUZWYQNVSveFha/XAbDE5yWgqwH8q80znhMcJe+DhTnWaTEvhS6vd04bvtHKZhw3PUw0ebMHBg
	QjzBKo++bNk6VXgAH0RTgyqN+YJNIXWT84qjBC1H+JZ8VVHzgyIT81T/M3WfvdSi1D+6c
X-Gm-Gg: Acq92OGllh1M8RaCkitarKRt3orw7MGZwAXNAEkNLIjaGGvPk27tnk8CmTPVxVON/W8
	EHpM28FqoxHI/VJj4/ZtHftTvrBOVQ9lvXh3XC4pJcxThvV0sW6wkkGmrPcd+83ge/Etcdr4Vy4
	65/n2qf1v9RguDUYqpGxPdsBomBNvdQGxrYbB8En5eZINSFkeLFjkFdIp4TP7oB+9+7zz+rwYYX
	K3EtNvyh6+mopyQnWbcoBmgajTvlj1uffa2GFT8416gxOtN4ze4jHVNvYejBtsrqYPNfsqrHZPM
	C6KXkkXFGXbGGD5bdH8IPxGMWDHpH61ODamtAxpbJ4o4E8DFp6cua8sub8nkxkL/xfnLzdsW3Ok
	LD4ShS/BG4IXXGh/l+4kbTUdpqaeRr/yni4VIgJnPT2E4BE/eevjFyPpU4ugKTzV6iLwEhiWKdq
	DIlYgMTlBF1KIiG1GmJA==
X-Received: by 2002:a17:90b:3f4f:b0:368:1566:1ba5 with SMTP id 98e67ed59e1d1-36a6745c264mr18435947a91.7.1779793913032;
        Tue, 26 May 2026 04:11:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4f:b0:368:1566:1ba5 with SMTP id 98e67ed59e1d1-36a6745c264mr18435910a91.7.1779793912579;
        Tue, 26 May 2026 04:11:52 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm12104253a91.11.2026.05.26.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:11:52 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v6 3/5] misc: fastrpc: Fail Audio PD init when reserved memory is missing
Date: Tue, 26 May 2026 19:11:22 +0800
Message-Id: <20260526111124.515-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
References: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F-OqfoH-e1m_ibhSaPCuAm-UmsAH0VJV
X-Proofpoint-GUID: F-OqfoH-e1m_ibhSaPCuAm-UmsAH0VJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NyBTYWx0ZWRfX3sfw7RPdLkbk
 4+EgLR9VvpoRR9EPFxZDSC4b1C79HY1Mw8CQPae5Wk0QIN390S2UwTlJ/LNvOQs80fgdox4Nxv9
 HzHTSR38j2JAiW3+PRSZbCzDda0CZKDSP7bbCTlmuTl4HkfWdrWXfrxfjXTxBogvxkojTtcT1Il
 VJH9pKtfsSP/w34Bx1O75mNyQSl2fJHjM6s3Lg42wA0G17ED1TSQYrl320HpZAws90yR1vc7UJV
 Nhv71MXkMoLl+9FnINmwLcLiAh/2N/nz7ia57nSwaD5+jKIYN1NV3jIJRKzwXpQyd/cVhpqW3NF
 RLJHgiZPlK6PKkZSdPCxJVSe9Xc+gWSTjje7bCckCG7UOvlrjiIcA1bNYKNP2RYC2hlwavVVzv4
 QGwRUVOnV0q8+Y3z4/Lh/JMG0Oybdd8hscN7B+2ne3akhuFCNEN2VX+hSBpyCIYj2SzioRgxeHn
 L0IddF4BBLNUVwaKbmg==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a157ffa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cwMOb1EeFLyGxYfGK4oA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DF405D4B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Audio PD static process creation assumes that a reserved-memory
region is defined in DT and exposed via cctx->remote_heap.

If reserved-memory is missing or incomplete, the driver may pass
invalid address/size information to the DSP, leading to undefined
behavior or crashes.

Add explicit validation for remote_heap presence and size before
sending the memory to DSP, and fail early if the configuration is
invalid.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a8a58f889d07..f46a8f53970d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	if (!fl->cctx->remote_heap ||
+	    !fl->cctx->remote_heap->dma_addr ||
+	    !fl->cctx->remote_heap->size) {
+		err = -ENOMEM;
+		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
+		return err;
+	}
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
 		return -ENOMEM;
-- 
2.43.0


