Return-Path: <linux-arm-msm+bounces-95704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEkwNY9HqmlkOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:18:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D421AFCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99901302F728
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 03:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70609248873;
	Fri,  6 Mar 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TC9qfCtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko5a8CTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335DA1C84A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766942; cv=none; b=FcQ4l9g/1U3YCf/gi9sIF6z/Qsgs/bM22lUURb11+oXAXiCsqazXJDKvlNTyjXGe4X4XvI2ms4MIJK95zA98LcDFwyuz4xlfm4EpFJAz0a9tuHac18OKLcKCXq/7UtZsW4o6xaFcJBabYHbPWOS7yVINyfE+y3E3yD8VvpXIC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766942; c=relaxed/simple;
	bh=5yyPCjXeALENnru/vLLkjQAw8XJRXA6irB3WZpFENk8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NHAeOHJGdZWYyCfV+uQiDYGEM8n/oeFpFFTLDWbRnXAwEgRmjC5mcYO4sEKcMkerCYGX1LbcNgmXu2uKuWcDyhGWVcUS83B2xSEI3eFVGAB9od6eCJj8BpZrCAvdtaMj4mTQUxqXfEnrDOs/407GzWC+t1d+QLvjrGVL2hNEHZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TC9qfCtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ko5a8CTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmto02267457
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 03:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EpiNNTXiiGQjKHvs+KNiTW
	jaystmsHApMEyELwmAA1Y=; b=TC9qfCtLGI5lv4FIwJR4jGXs7PSmgcQYVL+Ytu
	cMuIIdot338/cP7w5LyAatmDLS3dP3HUCaLi/nYCNGovB6MPGNDkbqaNYQ/MYED0
	LGA19n9xEAkgK//26IVk9LXMPDqnmhm3Oj2JTaZI7VyY61sl2ONUIZxfn+qT7Lfb
	2Ih7A/htvVJPfRACmSiKjFYSqFWcBfZVHPBZeBqX+ysax/9P1KQOpBUQWQ0xfrO6
	jhlZbf+H4HrugrQ+mwEvOzUhO0yLGL2KaX3GVvHY4lVtBz0/+SOLx6FL+oGPN9PJ
	njQUqpIxTd1NNOb93cW+KieZwT/z7+honJv3MNrbOsfdJQag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380v20e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 03:15:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be191ce356so5100703eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772766855; x=1773371655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpiNNTXiiGQjKHvs+KNiTWjaystmsHApMEyELwmAA1Y=;
        b=Ko5a8CTr9b0z9bufmgy8fIaurYyfTqQIgb47SO4toiO9trWHdiikj6nyX4dLl3vnSK
         GUhbdl7IpVzkJqWq/KKy/CfKiYddQeuEPmyza8XIEG/ShDvgWIF03mNyoXmxPwjOZ0G/
         B3OxxryY2sLLmzbpTvHvk+fnhntiwzjkUx7TJQPWFMpXYIHhtWk3jt8DyLePItsSkeJY
         VohafdmlVl3KX2yG61S7XFLzQZbflJo3xZ4UFGF31u7BfSQFA78fxjorLvyK+2Ut/4iI
         2enAv/ZpaHsODiDlS1N3Hy1daElrQkrJcR30TpNADbSJFdbMo7tZKD5VIDSs12igmL00
         4cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766855; x=1773371655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpiNNTXiiGQjKHvs+KNiTWjaystmsHApMEyELwmAA1Y=;
        b=tdtWMi4/vw6KTZ+kIWgZ42wr81q2Q05xdcqQSk9MArUVtNcMEfTrVCItK2bd+btWkg
         EpdwxbP75pcir6PRF37/XIVR8eMPeaB8nJH9nSCbqGbH6D/B59geyHu1XfLoUVZPpQwL
         b8mDNXjQ6wdHRkPfnUBv6Fx61tB4AUPRfiEr21dlyHFlOPpspecjDHdNV+F24CGEXuO5
         UnyvUoJyWEtQbA2QV+YCiipz5LK8yejRPsVhGl5DV/MKBpt/Qfylg5RQ4ajzZTmzFK0L
         2HtafaKVosbRrMR5DrFqrc6/+DZQuzlfOOFNo4hDN8VXQ/TZtt+neg02aMyqNh5N33hE
         pFOA==
X-Gm-Message-State: AOJu0Yz9bP4JLB3QXKOIXg+FKQTakhmFtkkprBag78rvDkraBtDCqVag
	WeRqpnZlv8GJpGwa/Rcn9rStNVqxYx704txJyy7vXMcmqUTUkdO5LX6Y1Xo1vLgzciCe/guCDNF
	kiqxclk61hNQa5iwBBCqjX5idVw8RmYQrdmLQ/+ISF6BD+vjKWo8qlOYxhmuGD9x8/gs=
X-Gm-Gg: ATEYQzy8u/eqnr+aANO66zAhzIiSH+yoyS9qBQr3QHENm9tBx++4W3cJ1IOcG0QZ0YW
	JLbVq0AzTn9DGt/SdSfywNhvpsEMdc/vymxFhqk/5Ue3OxW9HdqCkVzzYAFqi3HjW8kG1RKHla3
	sD0jKLW9C81K0IKQA8u2oCPRZXVSF7QesW3Jj9wTLT3ycoGjPDKPgwWeTgMBlxQnrLOPX1xRvzj
	JJjJ4vplvNJflStDyrP0DwLylirGRYsllfzEVacqHhf1N8CXzIYmoWpLUD3A+uoPyHLFfbzsZHN
	1+igDJk9e+oT6u32GmpE0mJAyXBlZqa9osDE2s9k4ru5izDNkhKx1ukoPZrGWkJN3qSmB312+0J
	PyUi2OeH9o7FPTfFH8JwInj49v39CavgwbKdOQDnP3TCAem4j7ky6ib//KZxTogLRzV183DCLsw
	==
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id 5a478bee46e88-2be4deaee17mr328258eec.13.1772766854875;
        Thu, 05 Mar 2026 19:14:14 -0800 (PST)
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id 5a478bee46e88-2be4deaee17mr328243eec.13.1772766854082;
        Thu, 05 Mar 2026 19:14:14 -0800 (PST)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82b1d3sm197839eec.11.2026.03.05.19.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:14:13 -0800 (PST)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix slice accounting and simplify descriptor and
 locking logic
Date: Thu, 05 Mar 2026 19:12:04 -0800
Message-Id: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARGqmkC/yWM0QoCIRQFf0Xuc4K6VLS/ssRieqoL4i5eCWHx3
 5N6HJiZgwSFITSrgwo+LLzlAfakKLx9fkFzHEzOuIuZzFmjVZTs05pSCOvfESuo+uFhcLUh3ux
 Eo98Lntx+7+Xe+xfILtxWawAAAA==
X-Change-ID: 20260305-external_llcc_changes1set-bae0e71cd913
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772766853; l=1936;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=5yyPCjXeALENnru/vLLkjQAw8XJRXA6irB3WZpFENk8=;
 b=gCZId9Xaon7Rlsem7cGihiGL4kMdmTcKSdOUClpm2CXSIvYXOj8eIWTKdVi653uxKTJ/cJf2Q
 LJLH3Opz8UeAuAArWTlC7pssd5W6jqc+tRkSIiAAQI7D7KJr5MppGn8
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69aa46db cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A5hwTvu5O6tIpGgoCuUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Id-ry6ffroRQ9i1R6sIj-JP1-zS9CVCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAyOSBTYWx0ZWRfX7MmEtBZbB8c1
 8SMW564Djk19DEV1KK8WHa7HrXJZNK9w//Ne9Q6NAtUmZQs2j4kltN4XtA/sMYHGcj2EUTAryGM
 2QBmBm7/PZBjHvBlzxc4+9TOXcyIWDbowBjU8YbcpMGW4gCPLxZPgRMEPHJwyHhlq+XpISM3YB2
 /5Xg5gQXwXVb+SmvCJC+IzxNz4wFIFRQcS22ARUt+vTcI4E/m9Vh2DH0E9FXSoNUbV8rmz4JtZi
 NyVj+Yape5m2Wd4Ejbj9F61RVsljOFsa3Afy+TPEYTC6fDPIqEnuxjPQ+EJLxXtrrgywakQLn9D
 yOweXiAqLICkn+OwVi+UlkwiyxxkYxvMmoeOSbwZjNy+hpyINXLKrdmAK0sWFas+5ckdk4EtmBl
 4tHZW4L50C1AojG0iK8Bdc/hQHCZ8pceF9KKsXpXOjVqr/IM1bLofy/p/1VQIQ7o0ej+NaYTVeo
 QQOYEPSCRRYt65inMfQ==
X-Proofpoint-GUID: Id-ry6ffroRQ9i1R6sIj-JP1-zS9CVCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060029
X-Rspamd-Queue-Id: 3B2D421AFCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95704-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi all,

This series addresses correctness issues in the LLCC slice
activation logic and simplifies both descriptor management and
locking within the driver.

Patch 1 fixes incorrect slice activation and deactivation
accounting. The current bitmap-based scheme fails when multiple
client drivers vote for the same slice or when
llcc_slice_getd() is called multiple times. This can lead to
mismatched activation and deactivation pairs and incorrect slice
state.

To address this, the patch replaces the bitmap with per-slice
atomic reference counters. This ensures that activation and
deactivation always match, regardless of how many users share a
slice or how often a client requests it. The patch also removes
dynamic allocation from the slice descriptor path. Instead,
llcc_slice_getd() now returns a pointer to a preallocated
descriptor, ensuring consistent lifetime and eliminating repeated
allocation and free cycles.

Patch 2 replaces manual lock and unlock pairs with the guard()
pattern. This removes the need for explicit unlock handling and
ensures the lock is always released, even on early returns. The
control flow becomes simpler and less error-prone.

Together, these changes make LLCC slice management more robust,
simpler, and easier to maintain.

Thanks,
Francisco

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
---
Unnathi Chalicheemala (2):
      soc: qcom: llcc: Add per-slice counter and common llcc slice descriptor
      soc: qcom: llcc: Use guards for mutex handling

 drivers/soc/qcom/llcc-qcom.c       | 81 ++++++++++++++++----------------------
 include/linux/soc/qcom/llcc-qcom.h |  8 ++--
 2 files changed, 38 insertions(+), 51 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260305-external_llcc_changes1set-bae0e71cd913

Best regards,
-- 
Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>


