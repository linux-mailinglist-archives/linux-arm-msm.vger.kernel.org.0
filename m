Return-Path: <linux-arm-msm+bounces-113914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jSVTIofDOGr2hgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:09:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C146ACA7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:09:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NdKXbsq2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GlhIQkiL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113914-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113914-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5E4D300CC88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188003546EB;
	Mon, 22 Jun 2026 05:09:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE482342C80
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104965; cv=none; b=BQNQlX0I1Mn3aFnLg3XFHdoV8iehyzbvXrYCffu+tznAs6nV9uHLyAwWYGwZf6SiYgk8Ei18NFmgdr4xWAPDlrcwae4lhmkx0VAa6J35DubqEUh7IjwfizTRRZLKY9G3ytfbbtBy8DNP+M10HKyG+gAY6VXjU3O8E70BSYQrskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104965; c=relaxed/simple;
	bh=/uwt8kgsgK9u5RsDCVx5ENOpZJjs+RoI8FLf2D/hs68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KVGUIL2X4iGgaJBE6A9VNMcLNzRLtBStncuwvkKZuEPVM9WNlqQ7Bb3/9QwMVFoPShSthfv7ZuEsfF/6XFjXzvxqHTudYo+RgCGcRA5Zq7cRriyMYqvExe2K9SA6ADElbUqUIJdlxaPcNTt8eodbcC8JmY0FCfnX6QdfhZQheps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdKXbsq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlhIQkiL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LNvbWN3524327
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4k26TN/DWSZP8LRKvVcEmT
	AWTWEuz42kG0MVOuNnrP8=; b=NdKXbsq2BqjJzLnPAMgdGwv5bPEqDN4L2djiUm
	4uSlWgrw01qycCRavLXqn3HAkXKPvO889nMXPUkcDsBO1LFtUrnbi7SSA0VRrQdm
	i/lN9M7yUwjKHN9A5Dq0LcJlodCSl2vRJrJmJobJ+dKRy9jchmZaKrmoE4K+1KI/
	iTVE9En73zLM4vGvQHoFlzKLVjPprOQK5r+KXSa/0Vw4hG5gM4eM6ravv18gsBUO
	l8voRiqUw1z7y3BcUycCVUpc/lpcI30Ky+ECQWwYysN8zwrItI6DUF7FjbLiOrYo
	7fZ3VNbsNvK5KH1RowigX88jgT6eI7ifmAlcqrjp8+bgRQlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h4vve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f544944so2668548b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104961; x=1782709761; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4k26TN/DWSZP8LRKvVcEmTAWTWEuz42kG0MVOuNnrP8=;
        b=GlhIQkiL3rFgZDGeKUhmlzzA8/WUGg+5vzHbD4+QWqDmXVmDwwcLqHqKOcYLfBKhKU
         CikX52I0YAlEz5lyVUy0pXbMJW9ldg3oH8oAQZR6Z1uBYk8uWqkv63yFNzRw1F2YNJU2
         4K1NHSnjK+MdaIj063uvCQizPwiXkGSOnIVdBvD4UIsGjmB4SfVADV5sUmhNa9w9h3YA
         ZNTBml1gsWy9jwIGQ8E7Q1ELDgmR1HID31Hz2NEBgH3UU7dcSs/cpOEgydcae+tJCv34
         s1LsSP3Udj9cSwQgxbaWrHi93zzWnQqWcCR3rZ65bCPLQiBS7IgT7J2AN3m31+fYAPgS
         ozFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104961; x=1782709761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k26TN/DWSZP8LRKvVcEmTAWTWEuz42kG0MVOuNnrP8=;
        b=YMO4mgDmUS6Kz3Jt5ZDQlt4EzsIbwCALw70wNvNr3bitqxXvrqZ81G/QHTPw5/EDfX
         YvSxK51zJ8RlhzdjbXfWvjfuPuE/W9jMMnKkOJQF2f1Wsh7LEhdIeJ4vJvCSmWgNz2PH
         WSOCoLkbxhrC1cAgU7zqJFspk6+E9VulqAquzCx4DKN1BdCVMG8m9+QODZVSnawSCgXj
         FpvsLW0TfqHubBJFdfvtohzYOX/IWOoQ50QKS+OoVPbhRqzqShJocz/fwkPPYzEFYlOb
         U8ploWiWLd4UcKgUKhiwLMTp4ohXlmh/hjbLv1t/wzmqBd13aAIt3IhilkC+S5mxpphf
         Dxew==
X-Forwarded-Encrypted: i=1; AFNElJ/vE5o9GLHSp5rVN1647rG+524f4k+QK6E4gQwZVZoxkCDNAlzUBu4s3TVcaSTFj0Ec4U0fUIe1M0qipLrW@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEQJ2dwlO6TsfRcqan7BTaffDvguZrgMUwrEKbkDFmV4uGXvA
	uhNNuDuGP39sWL2P9ozEcsetvJoH7c04g++QMmKEAvCYIQnpNggE3WnnKQ/j2U4D+EDz3Tarxm7
	ePI/l150TQElj7PQvo8FMrvZCvpfVylvE44jgK7ovQ6RmpUBPo2hqcTrGZLepyKPqbJzH
X-Gm-Gg: AfdE7ckHxTSYXjymZ85v5RDeu4lFUzi4+VVii9xMR9B+4Jpmcv/Al34c+aTgpmi5lIW
	kXQksCVc7pHjh+ny5De9rwwNl0+m3yqmwAwdelag0kxZ6I/JHZA9YAx82HZf8BUPqRIyHqWdi9y
	PbuQW0eNf7AJZGAKsSXIndAcP5WlMS2p82WTvc1PTe9B08DvJ1u9xL4wivosd+3xL8M7Wh+v85m
	y/f+zG/J7Y/w0kbrTpU7F7ID3fIDYCHv74tVuk7eAZoLxX7sz5+z2VlhZZqJywOXvchk3FbHxsz
	eO5fVmPrFl5Ru4sVkf7T/V2Hy/WKZezZaVEe/ujq+9FYXwcPog80xTehAHIxDpVOF9EnWTI7nWE
	NlLDJ8vYWHOUlAYM+FTW+cSpviLKfJdEW2zFo
X-Received: by 2002:a05:6a00:bb8f:b0:845:3fea:976 with SMTP id d2e1a72fcca58-84550878020mr13574479b3a.29.1782104961237;
        Sun, 21 Jun 2026 22:09:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb8f:b0:845:3fea:976 with SMTP id d2e1a72fcca58-84550878020mr13574436b3a.29.1782104960565;
        Sun, 21 Jun 2026 22:09:20 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:20 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v4 0/3] bus: mhi: Add loopback driver
Date: Mon, 22 Jun 2026 10:39:14 +0530
Message-Id: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrDOGoC/32P0U7DMAxFf2XKM5niOE3TPfEfCKGQODRiXUYDF
 Wjqv+MODQlWeLF0LZ3j65OoNGaqYrc5iZGmXHM5cDA3GxF6f3gimSNnoZVuVKdQ7ks5Pvrw/DD
 0WUaipklJRWO1YOQ4UsrvZ93dPec+19cyfpztEyzbi8j8FE0glbQmhuCMS4DNbal1+/Lm96EMw
 5bHov9iQa+wwVLnmCTv239YjSuss+ASQjLG+2t2+WPS390BrrprdrS69Zhix+fNHw68OKyyoH4
 5kB2+RQwqULKw1mOe50/+yHiarwEAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=5359;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=/uwt8kgsgK9u5RsDCVx5ENOpZJjs+RoI8FLf2D/hs68=;
 b=YxYLzOdhL/dadhFmAEOJNpOEPS2orexyVZIs2OTyZa3CnM3sFf3ORdhbgSANf54GuQhmn+Jh0
 FWo9MshRpZeAJ10sWzew8iA9eKLi6SKNq7Zcdub/3pLAFgyiRhh5v1H
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX9hQWxwT98vS8
 g0ZMxzfYFm14Ss/N4cFkQF/U5E9M0Ph4QvWwsS/BYbDQ7f4p2gk65fPdIWQ+IHQ26Qt1SCDzgE4
 ddJI7qxmKQbnlb5pdUUmyx7rL0HUMhZ1lzIfV7cYl/EkB9f/DTqYE9Rug+0TDC0sl1p2VmTf+We
 VkNPwJ51Vfa2ieilvaYSbBaXbyQoPpx9KHR5JCc1yBOXLwyqT9NuqQOYR6N5vu6QZRTgIu3468c
 LvF8sJ34mjY6PTPLJPrR7Dupw88ImprL0XrzyrvCSzq4BTVvspMWzSKLIMj8/fSk+d3H5DqMRsN
 4e2NTqMWs23vjhqoJAuEx95UEjY9ZbOLuwCP1j62WzTHTWn/U2tTbwb3NxvolS7wQWi+dhjKosj
 ml6MUDxWGwKZHGbESWQzkIZd6fH7qEyGsbJC2vjkc5SZPYInz7eAeqIr2DOHJYNoIvvCx80Zk9X
 i3sr6iJvWYinvBTIq2w==
X-Proofpoint-ORIG-GUID: SHtx8kLHfpi0h65z7_AW0ch1B1vqRHCT
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38c382 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C3iqeZzp22duqOMSZkcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX+d0S+rzA5nZn
 SlqmTb4M9VlvGlbTYzu5aUf6KyabFN6Sn2qhPnQMn4QSptVba/GdPKhu7UAuIOvDTGRNlYD0jro
 Rc/8CIj6yA5MGEIe3N2At94BVa8h1W0=
X-Proofpoint-GUID: SHtx8kLHfpi0h65z7_AW0ch1B1vqRHCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E6C146ACA7B

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v4:
- Fix MHI_LOOPBACK_MAX_TRE_SIZE: change SZ_64K to (SZ_64K - 1) since the TRE
  length field is 16 bits and cannot encode 65536 (sashiko)
- Move mhi_prepare_for_transfer() to probe() so ring->el_size is initialized
  before num_tre_store() calls mhi_get_free_desc_count() (sashiko)
- Add mhi_unprepare_from_transfer() in mhi_loopback_remove() (sashiko)
- Add NULL guard in all sysfs show/store callbacks against post-remove drvdata
  race with devres teardown (sashiko)
- Add KMALLOC_MAX_SIZE check before kzalloc() to prevent page allocator WARN
  on large tre_count * tre_size values (sashiko)
- Fix start_store() to use __free(kfree) locals instead of goto-based cleanup
  to comply with cleanup.h guard+goto mixing rule (sashiko)
- Change buf_left and read_offset from u32 to size_t in mhi_ep_queue() to
  avoid truncation of size_t len parameter (sashiko)
- Add zero-length guard in mhi_ep_loopback_ul_callback() before kmemdup() to
  handle 0-byte transfers returning ZERO_SIZE_PTR (sashiko)
- Add NULL guard in mhi_ep_loopback_ul_callback() against post-remove drvdata
  race (sashiko)
- Link to v3: https://lore.kernel.org/r/20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com

Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 +
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 128 ++++++++
 drivers/bus/mhi/ep/main.c                          |  29 +-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 329 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  15 +
 14 files changed, 586 insertions(+), 9 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


