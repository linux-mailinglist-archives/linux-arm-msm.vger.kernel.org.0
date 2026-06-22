Return-Path: <linux-arm-msm+bounces-113915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /iuFCp7DOGr9hgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:09:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 686006ACA89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:09:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FSfhJYyM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xb7MsoT7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113915-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113915-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD2B7302A53C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D62356744;
	Mon, 22 Jun 2026 05:09:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE2335674D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104968; cv=none; b=nBCTm51BBxNtGb1vNH0nfRRMYpUrgBjUyrJhHzSbyRdRLh1ouVnQoo3/DbCQ/o6iFoO5fnTmW9MxEejF2XbqVxDcuwJjTVS5fBgRlPzLRbOJHQdFT81T0HGU6/IjBo8NCV9LFh80YW+iWJkbUY7bpTyf1TSOcoF8EuNdvJtEjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104968; c=relaxed/simple;
	bh=BdTN6n1LHqnGXFJg35aSQS7P/2dFr0YrfLiu5hnpr10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdQJobHKWxtmw1JOYDw5ssPPz4eM6/caZvlSLonm49BVGGOD0pmzTEvEEr9An3y67vyZsmipRptkR+YSJnnAXg2/WCezBKA047gk5xdgaDeITez/XTn1lj6XOVn5VBoKBjq9EEOz09qu25fb+4wMyT2NKlTYW1PJUoP24KVw3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSfhJYyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb7MsoT7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LFmYdV2784713
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tm04REIlapwuSniGf9i7oLt52QuGZ4tIkTb9qieRbGk=; b=FSfhJYyMf63lnyE6
	EOi/vjMMf8xcoA8K5XGfTIBtkv1Wx0AgWn/xUEUEJiy11GHOsph8bUBX2v86YLHa
	nW/2UdliCjkxNCylfYja1o55zxhzcNN8U40kANLPzFJL54bv3YL+ofBtpISH0+QZ
	WijKYHpPkswUd40+FuaY3KFhdgwpdeJqbvSuAVFLEAsDizxawtl885JhwTSFAz8e
	ajX0bFxc4u7KTZHDeYNHK6B2p/PDFvOST2+s03PbRklMOM/aiEPfilMSiC4KysRV
	sSrv0euySl0CwjWg61uZBcmFmD246L7uTuQ4RSZe3cLGydk4nI2Kh2xzbLW7zvwN
	fpK3ZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjxucr09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842446a3851so2006842b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104964; x=1782709764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm04REIlapwuSniGf9i7oLt52QuGZ4tIkTb9qieRbGk=;
        b=Xb7MsoT7zqaK+AT66VheKhdYDu2gIbuG9IljYPN86MUJT+jD6+B0nb8I8FQJhl82UF
         avdl5n8trrjvmV5OxYSEUqXmDVh8vRwI+aAZL6bIgfcpiWqATrqTeUlzUtfAf3j1+qOe
         JrIFB8M8wbkYG2Mklxg5ynEVR0C7pIqIgxf6ZL8jA1jvw3oAxm7k00A+sPPRZZU14sVD
         yiVjf/4//cycyHSsikSxOJCRWzx0ahEfSeY5nvUmAOkA9ORgfIeiPMGpPvEoCvr84aD/
         1SkVZPDiX+Y6VsFGddd79I7yfu4vuqBlaOOX7dkf3tKouEFfvzXafwvWROo0uSqt9nZa
         f0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104964; x=1782709764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm04REIlapwuSniGf9i7oLt52QuGZ4tIkTb9qieRbGk=;
        b=snEoSw298woMBJs9ykqmGYKKO4Y0iQxnfn2oIX50V1NdINiso17eNb1hTkjNMdtA62
         atOXOCXWREmtnQsJM9x5TajJDUFxyv4NQcxDeutKxDs2kD42G3fhfmDTfVt+qmnR7UU6
         VXJH26P9I2aQn/529hN3BHlZn+jziVhHyfFzjNgXU8ogV4ENHyGWp7r0evniBzqId4Zh
         VcFvrrfZ4PkixiGEvJNnescNSiZEsUmq/q0PZHFLsRBaS9BUUQ0FdryqR3WUyLpeQWWx
         qFfLX63j8jn5pRl1Ji6TPo3T2DaM2lfsw+i0qIGQtxSHP6HuEWO5wKAuAjt79Q09wRlb
         1Hcg==
X-Forwarded-Encrypted: i=1; AFNElJ+f1jG6a+tbmDWWiEtrdGelA3u72n/FR9cf/d7Kv3PBgNMmYZh6spvM+oOJeLEBuQwb0tNwNfREvKuOgcBI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ENSCjdsjaS7D2LgC8tb5QLEl7zbw8GOJX4gNqukNfQX/Yg0W
	SxXraLuEdHYI3ZkV8O2m6KEM1JUDmYmhRVjYWmO3Sj0EdYA6/cMSMLtDXcSFr9FzIB3XQdN8anY
	DAlxFYEi1x+ymRofQzqJAS1v5JE2mP3GY2dgyi0DWtiEaBsTignsE3rn8AzVkDnni3Aoa/FWU5U
	L1
X-Gm-Gg: AfdE7cliwnLnxobpX2hRs96eRTm0RlYgs547zs59OzC8UMth+rC/Pdc3TUzAdo8YtrL
	uuyRLjcQYgB33tmiqgxsgo3x6WT7R4v9mRxvDrJUcTAdFdzuh4di/sVz/zx4zVmZPvAyPNkLzFt
	5xTzqvx3nFj+pI487La3jhH2yrpEAyChu2I+QxqCI4yMck2ovM7GUPHKrmQseHENzYIvnZ6Qvo5
	oOkWwK/xNXWG8zHw5fHpgQ23F02N6APOeNsWTnniphyMWec+auwlmHdOtDCd3yhK6PJKfRcMcb7
	TrGMkBaVw6mzRVPFlk6ibeq7jfQuOII8sxGtnhiQWTrmj7rouCRM8xP9n2WEMk2ovNrNmRVOW+E
	cSHdUOJEirNj2IpnGtHFza7AlCz/T7xbPmh7J
X-Received: by 2002:a05:6a00:a257:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-845507bbd87mr13932984b3a.11.1782104964088;
        Sun, 21 Jun 2026 22:09:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:a257:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-845507bbd87mr13932936b3a.11.1782104963441;
        Sun, 21 Jun 2026 22:09:23 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:23 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:39:15 +0530
Subject: [PATCH v4 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-loopback_mhi-v4-1-782b3a0f2eef@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
In-Reply-To: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=15316;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=BdTN6n1LHqnGXFJg35aSQS7P/2dFr0YrfLiu5hnpr10=;
 b=QJFo24XXEE5QiV2oTS/j2hjFZKsjb+haxeahP2zqwi/mI6laPcHH3cZFFgNVhd37Ui9GFGO2k
 1p7qUVjwhPgDvMkXPE9Wh8vV7D0TBqFi8aqCJJYxoM397yBP9OaGm3L
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX3hgG41NrQhvk
 EnThFPIiP9LNmno1kU3gbgTbY4Vgz9fvPs+Ms15KN/zX/8jtfTEl/kDgq4Uak1aI58nJLXUhuLs
 yufH/sJaX951o/CxZHvKDKkfnvO7SqI=
X-Authority-Analysis: v=2.4 cv=G/ws1dk5 c=1 sm=1 tr=0 ts=6a38c385 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fr5qSj5IhElrMRFVs5kA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: x7hEdzd4vtmqRCtvCPUUGYjmQDedAPh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX0cJbGjygDisx
 awFGqhhWRL4NUdu4NzYstW9L6qZ823DzTE5vpAaqIGUUaObpswS4ukecP9nVu2sgTxtmF8rcEU+
 2hAgGyFvZ3oHIFy6T8EpkKGYk/uUukocsqavCG0dILdgpOQYyZ0GT24AgTkbwnkibXSpswhRFFa
 ZID4iEFZzkIy25GvlhMhthFl703zqq4k+y0kEQmeKhTldvh3Qs1tIs3SoRypoGrzljpJOJ76+dR
 gqjxtbZA8D+ygaAFUgAoQZzLrmCy664d3n4HY5YORY61T2CK5i55ClmfG2V8L0EAssX8gVD/K3x
 iPVHgK/KjGIRdaWbmA1hpB2wbC9lIMj1NWpIfCu4AO3DPvisQQ+oVHj9Cycswc3dTMSNCm/SsXD
 77xgbnX3BPv1f2vAQ2VeK+9bnE0A0zF9yflWBKGw6syaZ/njNOQie5MDS9jKV1wEx2qXcI7JJC9
 BGJX8wARFjOAQsc2Dmw==
X-Proofpoint-GUID: x7hEdzd4vtmqRCtvCPUUGYjmQDedAPh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 686006ACA89

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 329 +++++++++++++++++++++
 7 files changed, 402 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..3bd770747799a3341a23903cc1a108e650e915b8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,51 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed TRE size in bytes. Reading this file
+		returns the upper bound for the tre_size attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the channel ring capacity. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/status
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Result of the last loopback test. Returns one of:
+		  "pass"        - last test completed successfully
+		  "fail"        - last test failed
+		  "not started" - no test has been run yet
+
+		Reading this file while a test is in progress will block
+		until the test completes.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..ff12a6da48947ac853bc638359a7046fea85fc21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16441,6 +16441,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
+F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d1463c3e0df0da461c815afaec623ba349b51dda
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_LOOPBACK
+	tristate "MHI LOOPBACK client driver"
+	depends on MHI_BUS
+	help
+	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
+	  as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based devices (modems, WLAN) in the field, where
+	  the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, trigger a loopback test, and read the result.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_loopback.
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
+mhi_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..693691fff26dc8fa0d58931b98ce5f287fbd5c3e
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * The MHI LOOPBACK channel is defined in the MHI specification and is
+ * implemented by MHI-based devices (modems, WLAN) already deployed in the
+ * field. The endpoint firmware echoes back whatever the host sends on this
+ * channel. This driver binds to the LOOPBACK channel and exposes a sysfs
+ * interface for testing MHI data path integrity between host and endpoint.
+ * The sysfs interface is stable ABI because the wire protocol is fixed by
+ * the endpoint firmware and cannot be changed.
+ */
+
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	struct mutex lb_mutex;
+	struct completion comp;
+	atomic_t tres_pending;
+	const char *result;
+	u32 num_tre;
+	u32 tre_size;
+};
+
+static ssize_t tre_size_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	if (!loopback)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%u\n", loopback->tre_size);
+}
+
+static ssize_t tre_size_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+
+	if (!loopback)
+		return -ENODEV;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+	loopback->tre_size = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(tre_size);
+
+static ssize_t max_tre_size_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
+}
+static DEVICE_ATTR_RO(max_tre_size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	if (!loopback)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%u\n", loopback->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (!loopback)
+		return -ENODEV;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	el_num = mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE);
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	loopback->num_tre = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 total_size, tre_count, tre_size;
+	int i;
+
+	if (!loopback)
+		return -ENODEV;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	if (total_size > KMALLOC_MAX_SIZE)
+		return -EINVAL;
+
+	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	get_random_bytes(send_buf, total_size);
+
+	atomic_set(&loopback->tres_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		int ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+					recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
+			loopback->result = "fail";
+			if (atomic_sub_and_test(tre_count - i, &loopback->tres_pending))
+				complete(&loopback->comp);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+					send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
+			loopback->result = "fail";
+			return ret;
+		}
+	}
+
+	int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
+		loopback->result = "fail";
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		loopback->result = "fail";
+		return -ETIMEDOUT;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		loopback->result = "fail";
+		return -EIO;
+	}
+
+	loopback->result = "pass";
+
+	return count;
+}
+static DEVICE_ATTR_WO(start);
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	if (!loopback)
+		return -ENODEV;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	return sysfs_emit(buf, "%s\n", loopback->result);
+}
+static DEVICE_ATTR_RO(status);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!loopback)
+		return;
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tres_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_start.attr,
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int rc;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+	loopback->result = "not started";
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to prepare for transfers\n");
+		return rc;
+	}
+
+	rc = devm_device_add_group(&mhi_dev->dev, &mhi_loopback_group);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to create sysfs attributes\n");
+		mhi_unprepare_from_transfer(mhi_dev);
+	}
+
+	return rc;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	complete(&loopback->comp);
+
+	mutex_lock(&loopback->lb_mutex);
+	mutex_unlock(&loopback->lb_mutex);
+
+	mhi_unprepare_from_transfer(mhi_dev);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


