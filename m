Return-Path: <linux-arm-msm+bounces-108626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH9eCSJaDWpuwQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:52:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B23588703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AB2F30269D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF6A364EB6;
	Wed, 20 May 2026 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+eFaVkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMIz/Qe5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630DA1E51E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259859; cv=none; b=A6tkA3ZUuNFWqp98ZG5IE56maBwEjy+/Y2twY1HlBMUUy+PX6KAYFfqOXeTw43Qj0GBs4IGY0TyZxzk+bvlldmVyFJd4TPpQtbfy4WMm55TB7pZwclQfm9vg3R5ZSRYOHojExO0NxPxUKMZSrOG/QioXqQc++W6Boqhog8bUOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259859; c=relaxed/simple;
	bh=yHFXw6rHo+KkRLN1LFdXaGvQmgb3W2PQGqq6aDaC6Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V9eLBud1I3gGCLfk/uN/XudcFZscsQ4WIbyrRVfl3t/lXKG731JdVRr4F4ddmM7NU/l/uVYy+xeV7qZas8f4Vzie69A79iiyB57S4VMR1oXB7IBzBtgNSsYn/dFpW1i4IOrZIfJfC//HRUBI8NLlWRsuya315HzRoZBLnFV0WNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+eFaVkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMIz/Qe5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMU2b11739353
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yxNka9h0X4XMJU9qmetE4w7520NEDL25/rq
	/Xg3a2dM=; b=V+eFaVkLPujpyKxpSBCRGwpaMV0la+sBCNRU7xrLkAGS96CXVOf
	FcRzAxRP+Yaz9DNSBd5W+NicwU/7VrmXjq1JdBOBEzt7sS5Q40Z7Lna391geM3U5
	hrPCuAxNEY7Dm45jdPa7rNrI0tt9MTrdNGevCr8uTHtHi5V0miSbIX/JqDe1RepE
	La6NM0sIzxmsVi2lYfBp807cLhalQsbviv0ofsJFOXYbUfhXwp4WsH+IvlWuYGXW
	6lQWk/TU8xbOFUNl8ICNR/yEs+CqvO0C2uGJjPHs8HXHmJD8HjdRgFw1uGIazX/N
	ubRrkdsPY0qr6SF06woi3zwvGzel3k6YlWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbb9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:50:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so67180045ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779259854; x=1779864654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yxNka9h0X4XMJU9qmetE4w7520NEDL25/rq/Xg3a2dM=;
        b=XMIz/Qe51minwNvXZuW7pbt16HqKY6ttON2dr1J9D83M51ytWUBTGo7DB0wglTtByT
         NV9Tga3e+MhAe3JXK1w2yAYGAgLvXBnAhgJndM1oI/UIRBtPs9kdVDXEthYuvG2AZYly
         1QYhy+HE1zvRRy3FIEtbMwWZeVyX9uRiKBKTAGRniL1ZQdxaYBYQZkfoyfyLvdxu6L0q
         6f9hex4PnAG/yFZDmPRK3Wu3vjQclKCcQiox/RMXnWF2Pt9O4GorHl6gCZYFxtxEX+If
         KCoTWSDwVgNReL14z0ffBS5WEyLSKZPazIKEsbOVLA6S8Qt8mRwAZmlDzlKg9fWQJ8uX
         jjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259854; x=1779864654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxNka9h0X4XMJU9qmetE4w7520NEDL25/rq/Xg3a2dM=;
        b=pMFs4s3Z5B9vG0bhfUtDhxQVihVucPRgVOsBFSy0FWQOtpP+z/6AJUOadALrQ0ld+M
         5vU5q0XFa4mmydOk0GtwfRnQTDdS7Z9wBEUcUt4IOY5OPOFNvm7nQt5piNjtwZQ98dgQ
         GjEtT/dppfoQzPe0vg3w3/BW95M90qMSPXuMJRn/Kr9F8PDjNxGypkq3pC4IX8KMbng6
         6nmGUdufoBbExOFTYXdOQRHPpZhVACDjXqW7ddKgSXPC5dXehLzmA7r1icVoLC7YW26P
         977dTVjioU5cZbUdbfe/LufER4wPtV/hc8+edXL3q11e68dhO9ZRCWsKyPk8VYJTXEPx
         3ThA==
X-Forwarded-Encrypted: i=1; AFNElJ+0gGq2yjurdSQBeRorYawBfEI7S8G7F2FgSpmE0WClqyeLPqXtH6OauggZciy6EHJ3xEidQJdhYfQyuIw2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1hjexoDsBbxWhsX/oLV15g07GPr2aMlXH+AA0+vzed286jvUp
	aC12RzJPoYWGf4yulO/0MzWVFTroymacFccC2bHuXKJ4enYKAS2QfwciawcI5ISxBF/w3BeWffF
	bmpbSVx6IeNP1mtOl80AL6q9Xcms8qAuT0Ew4SuWmdkFs2iPf5vTWdCuHXWjyufCyerzr
X-Gm-Gg: Acq92OHFfN5DMj5ubrAFGfoZv+X2U2+jrXkh84+m7E61HhJERsw3nxL4fi+B/OddVv7
	0TtAh0g71D75//LgqVd8mCwqyeqr67kldL9EnSoepE4Y1U5vTqcAAk20NY/NYx8OkkhHglZmP9O
	nbWfIkeZupbYTVbe4jJf3xiSU5I88nsklqgsbNKirCkzbbGlkwSS9xYre32kvq1dfdskY555C8G
	xZrURYDHgbq0RD7gfQ8EFcLjvSzp9zk13yELsO7G1Mzu1G3r7Sain+dXeb0pCRIGA5PUutqrUSC
	3lAiTAy9Hb/dZCFUtj8e9abT/N6HSwU/6XsyxEwwWsdGFXUiKiFBUtr6qksuE45H+0f3zKp8V5Q
	+sUfbKiBfSEVapLHZ7mKTPv9jgpnsqlyrexfZkASR0533+60WAIflJA==
X-Received: by 2002:a17:902:f78a:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2bd7e8f25f5mr248224345ad.23.1779259854154;
        Tue, 19 May 2026 23:50:54 -0700 (PDT)
X-Received: by 2002:a17:902:f78a:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2bd7e8f25f5mr248224035ad.23.1779259853709;
        Tue, 19 May 2026 23:50:53 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm206410165ad.2.2026.05.19.23.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:50:52 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v11 0/4] misc: fastrpc: Add polling mode support
Date: Wed, 20 May 2026 12:20:43 +0530
Message-Id: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F62xddAtWEGB56t0VfeieQhWqrXAZL1c
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d59cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: F62xddAtWEGB56t0VfeieQhWqrXAZL1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2MyBTYWx0ZWRfX4A7M+wk8jaZh
 to6DrzTFpjfgpdQnCxAlMWyJFKc0G713hDKt/DTCh82yaE+1e9g+XMPmaXJTBcnrE2x1VsimdiF
 TxamM/SuyznmnGs4jCcwUcUzlsRDWc6e/7xyaPQ0yWqM77Q4MbXdtbW1wmyHNUTY8jeZaKmEqAa
 la2pRdJnU+OydTmKmci1ekqznhj4Rinc0ScFSutT2Y4LmBPuiombdarfWsklEtP3Wcty1+wfFSS
 k2OK6asmOLhoxYStahmEZpoT4JF5uW6c3/eQsr280knNzse1SQeCqtSMWzHwofIO02YJKmmjo57
 k8Ro2Dk/eWgnrUnJuhFx3m/sTgtv8orckT+UMTNTamzGXthWwijxDjVjUYzlTTV+V9fjRjkFSaj
 ZSQvnZXB/Wy4druwNGDNQYiHKm0XAGs6ktDSPxmVxf3g0GWTEsfx7gsVvRsytxWw0CFK2eaYDNh
 dbklfggzeOa97WSaQLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200063
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108626-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98B23588703
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v10]: https://lore.kernel.org/all/20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com/

Changes in v11:
  - Moved back to read_poll*.
  - Improved error handling.

Changes in v10:
  - Add milos and sar2130p to fastrpc_poll_supported_machines. 
  - Updated comment for supported platform list.

Changes in v9:
  - Added platform support check.
  - Moved to readl as per Luben's suggestion.
  - Cleaned up fastrpc_wait_for_completion().

Changes in v8:
  - Added more comments.

Changes in v7:
  - Fixed warnings.
  - Fixed commit text.
  - Addressed clean-up comments.

Changes in v6:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 189 ++++++++++++++++++++++++++++++++----
 include/uapi/misc/fastrpc.h |  29 ++++++
 2 files changed, 198 insertions(+), 20 deletions(-)

-- 
2.34.1


