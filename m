Return-Path: <linux-arm-msm+bounces-106057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gICxNALM+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:05:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78C4D63CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB574308FDC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885C42C1595;
	Wed,  6 May 2026 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OddCglJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0qDy72p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88111301486
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043696; cv=none; b=lAeK1/FceLIKhwdy+8ytiKJjnIKZczkcTMPYpsJ3mklAe33JmnOWWuBoKPFvMOmCljFLjd2SmWIcEXX9ip5R3BIlhiV/mTq7uE2M9HdWBSbUrcDJOoV0pob2rsrVC2dMnVSdA+rXhG5I7BqJfHIyVJyICGqIvpsJcI6zZkeO938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043696; c=relaxed/simple;
	bh=M5rRC01HPhlQM6fuxNgD03mFH22vVcDQpyAjh2XtkPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4jga155fnGzutvdhL2sM7FKVBpYqeq/l6SqS6cbVAJSrPtjSNKVY5lxKz4Gjyo3UM9MXzzIRxx4rY5oDovaholIx2Dkte8jFt3Zwyi44EKhQzUW6wFSZFst1EPrA9E8/x+0s3aFL7IUDgb6rl/ZLXHZD8iPMofhgV/gEQK6K80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OddCglJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0qDy72p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645MWGCH912368
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/UkEw7Yq3iZ
	ri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=; b=OddCglJ/bbcCSJv+p8v9qfHWT21
	swToN4ZwwNGjRo9RjGSUTFJmSES+uIKQCRtGYfZVKEw+6XHk4/DQL/Xhc023CAtU
	eiBo5HTd1rjS/rfkVj6nEAbUN3UAXEU4tlnp65w5QkYGphwTMc8H5wYXAf14tBSJ
	xy9n1dUL1CJBJAI5DpeGvUVtQv1A7e05qo93bu5eIVNL2RFRLcvWPK23zhRNu+8y
	ihlTCceyalzWFyPHdKc3M4xnFZsEgoUCP7IjZiw65vJAQ77wz5+WWNODjFT92Zul
	Xkvygb9Cm6YJgDGK24AAak0nTS/iuolX6/jVg7pp46JKeEiYRRPHFrFh1mA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jjxkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353b042152so3496303b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043689; x=1778648489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UkEw7Yq3iZri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=;
        b=Y0qDy72pifYOXSSokXjDu5shbESIlWOOR/Ci0PCTyNu/rXTwNfduMzmfmyXd9w2psb
         gXMgGGH/Eh3CygzIHgVcTUK0sN78EBhQpnNUJWvJ5ibe9Sb88oHc553lUWiWl/NXHmiK
         zPAErIpOhsvkZ0MH5UVHYP1KzD8dVSy8i+la5vRurvoi1PU2Vx3y0RANmRQ0u8Ne6zja
         W/OFUhYr1Wd2SYlgpsuBzHnj5laFcQOti+tktdcm1anw1HNWiUoPaeBi9G7/2EWH+hsQ
         6THustwtrRiAvB65Tzww3V0lAZtBVJ5speNnDkAnYqBQWXoXNXQUrPDl+rfSuTIDK2uD
         SFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043689; x=1778648489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UkEw7Yq3iZri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=;
        b=ZW3s7z1/8TxXeNkm9QoUvk9hd4VqcX69sNuLf2/pL2DHr7NANVByu8+ZMJOaatwDEw
         P7KUdZgo8K/rE0LsEBGcCvLIDILEd2bmFy4aRpKCVk42VI6wtcKypvXgeH7ezAwPiF6u
         mp7pBLzrYjFBB1yxQNbCz0vMtDyyZ24qY09Pj79gzUJ/k2dLNy5uEscB1t0my6peeIx6
         1+4A2nPTTLLkdsSUMieDWdX5ddxRfabb55G6+PXYIFy2ZjzmBBrWEovxT2LEzRR5xMin
         I2iodqRkjVRZvEMiXfecc6DvliJMjl07wDJrzBxwJAs0gGlQfChbugFQRBWP4NDWc8x3
         LqOw==
X-Forwarded-Encrypted: i=1; AFNElJ8XmqswvIPiU+oxm8/h0sf5qCPhiXqGCBFxChAtQf54FMpepKCPvhV14oxbHNWE7leIjE8tNrrg/EouNrsX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RPd9XFfp4OSG0xGChpTM+MA3Q+2zUq15rdfMpGpB3FPuE89l
	BDarT+A5sZuvOOamtICbH49GgxPwLa2PyDw5CLqXOwmVdWc1gqz4nCfg8k4XK1x1/kqBfDAmswx
	ldU3AtBFLincKstmZBZg2q/4rC3uZGhP86gkh2BW3BkHatfXendhp4mdEUmdtjObcm5ZI
X-Gm-Gg: AeBDietydyQSMJQfStqU1xCx8M4UoV5Id6vMXYKeD5iuclFnvDziRnjQJhMcmH+tqX3
	YBZTIFMOAXwpySD6OQhRUpChpStvxnbYaOFt4wvWwMUv+7XFvqCQY5vF2ZWceKLOGudBmfOIXDD
	S8f46q69EWenSgvux+RxosgtnzsWk2fSuOvXC2k5oK0NG/ZfUJ9Mhh7s7eyBKOwddQVAiqp4t27
	cwgLqZsLm3CCIcK4Zda5pbP2+dvGWbeosmp8ZF/bEAlMc0hUMvIENcxydVUh0ydqVEbVX+LlsZ5
	Ryg+LczSefl/pIxaQe5+2HC5+gxeSXJAdx6jmdiTKOICl0Vcumt6dzpo4so6a7qDQB1dqZ4UWus
	2+PwPTtgL+96k9COj00MUuUQu0DjNjGJ2E/kSBd3pe7CfdP0nqo/qmOEob+M=
X-Received: by 2002:a05:6a00:4293:b0:833:22e9:2cd6 with SMTP id d2e1a72fcca58-83a5bfc4ae9mr1704100b3a.16.1778043688858;
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4293:b0:833:22e9:2cd6 with SMTP id d2e1a72fcca58-83a5bfc4ae9mr1704057b3a.16.1778043688264;
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/5] MAINTAINERS: add rsc_table.h to remoteproc entry
Date: Wed,  6 May 2026 10:31:07 +0530
Message-ID: <20260506050107.1985033-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX6VpxiJv4O8b3
 eWvXXCtecJBPVdcbKRiXPgmIVy+OtiB+CmFwbsvboi6vhkLq1AxNMJ+ImPKfN+abyCXXhz+Ju+3
 RfUrZd+jEmigmtdZIjl8015AnKxzCVN156WtI1ztB3oeOkFbE7XPv8E3UmZ8BYQJT445ex6dqaw
 peGz7+iMVabsHfBqr6ZPvARt7YqGyqd9AIkKaztWkolUOYDYPSyD9iY8hQraHALMNHaX+mFVF+B
 RPx6V1iI8rlW2S0tWS662hP7/Nem0xU4DPLEX/lsHwkm6X0514X0kpKLyw38WexercPaAIOZwXf
 H7pisXrtvrMRHBb+QpbN74+B4wkVHXreM1zj11/ExqyZb5zjDuiLa1bCW8d3Au/+MUbAuSEdQqr
 LIOeAP/G70FCavHbfzzCAMVTh8P21whH2YS6Pld8YbmHyG9tLBFRyr6ejDc4Yb7T1PA8PvTnQhc
 HkH29in5z5rjvIzswjQ==
X-Proofpoint-GUID: A-_BmIQJ-_l9PW7_B-1LRHjYpWoe8IxI
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69facb29 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ob-EK7KtVxQGSle2nTEA:9 a=ZXulRonScM0A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: A-_BmIQJ-_l9PW7_B-1LRHjYpWoe8IxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046
X-Rspamd-Queue-Id: 3D78C4D63CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106057-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

include/linux/rsc_table.h was split out from include/linux/remoteproc.h
to hold the resource table wire-format definitions. Add it to the
REMOTEPROC entry so it is covered by the same maintainers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179c..b2a6d108c662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22507,6 +22507,7 @@ F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/rsc_table.h
 F:	include/linux/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-- 
2.53.0


