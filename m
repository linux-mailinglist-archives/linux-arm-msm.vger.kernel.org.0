Return-Path: <linux-arm-msm+bounces-108917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YnvPCg+cDmqZAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:45:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A325959F2E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D39A300B051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374711D432D;
	Thu, 21 May 2026 05:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXEe49/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSVeerY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9332F75B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342348; cv=none; b=rJh0syDQEYkGKj7/m+Ph6Ur49tALCJxGhlnwDfRXM5jhnMF+rpQLarAzgTiCGXgErG7pHsMAwY45dUF/rYnliNcU8DwXSYzyyjlhFWsiFIu+iQHPJKWGiJQpeIOzDAl7YfrpCPxQn7Pbh0CQUtSM2+5WOl63lVcVzbbxqK3AB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342348; c=relaxed/simple;
	bh=Y6TnmMYMljBqTx5vDanaa4hfeRMPaVNY4bySG6tGIpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVvDdI0/KMcnzWTmsTMa0yw8D0jZqGfz/O761EBTug6jatH/u0D8xeCI85vU4FNP+N0x7KEDHyTiEGN57nXuBxidpyD038hh7lwwOSKX22vqXzwr4dzNtZ0AjqsGlzHOjxyHYjh86OGXdcacyBkhlhyhpShzmpqpvgn9PwX3DGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXEe49/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSVeerY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0elha748668
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BqqubzpdbdtQfA/IGavwMW5/BByOyO7liDh
	sovCQsGI=; b=OXEe49/6MlCPmsETZ3xUsFLCNgzTkjBHG4on5TfbEB0set4pPTD
	nZpez+zgIB8rLyPCM75GC6I8b759vFOTDuKLySUo7YdmIXoRSEjlolmgS4w4Xh9D
	ryiWJfA2jmWEHkqS87NAfsyVGlg0kzWeecNj6IEOxXs0tlPFIx2Gu9o9xg7NRxVW
	wiweW+ZVKsxx4RiIvYlt6/ZwUMUgC6Fdrl/3ebZ0wwWgl2AoGQe/3y7M/jiAOoqU
	Ry5bWxtRI55TboRDTBY2FBiSLjPm3u2B+tUr19kxtr0wxFN9XyyQH4Tzba4xv+ME
	xr5UqZerbzYWbSamR0xT0v8WJCk8gmEDElw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6jvs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso4849108a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342345; x=1779947145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqqubzpdbdtQfA/IGavwMW5/BByOyO7liDhsovCQsGI=;
        b=kSVeerY3j24F6E1xZN3IyrCzM1VHHfnUK2d9yyAps+n5XUDdFnRVfY38QLym08cnk0
         nqFpUWqaMd8uZvqow2CrGvNT2byBItPnsSNGmuDs6n+HiaLO69q6/NC1rrB/1XoopWyB
         Ht66aLcxA1GVgWIrTZFfEJe/Bg4stSkbxTaPf6NSzcVi8hHCyhnUTPzGbN7d4Uuf36Si
         1UhCOQuCuKT2w2A5/LErkP7IrLhzow/MSfCH7U4L4A8PoYTG6NuY1BkJIc23qH3isaLs
         q6Gepq1YrnEMkpl2iruND0AroaOiKhr57YuCd9cjrRLE9q2BDyv6xs5WLrR061/9D59c
         sWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342345; x=1779947145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqqubzpdbdtQfA/IGavwMW5/BByOyO7liDhsovCQsGI=;
        b=P0BII3PKT5OF3sQB08QASOqrn9F6ihlkaR/xYP0crajMKfyXn5Re1p/UObblGvi423
         4X1vP8QslKb3WT7yxQVkwicF5/kNliUTSkrZHvFIkQ3Nh0B1R6TPJwZYquFsnREaN/Rt
         Rse0I2XaBjIXgMQMQp4u96asK5/7Y97uMXqzxEMcP1YuypcKwTr22l5h5lqdJFiFH8Nx
         NNVuCdsbvg6bcoICh3NekAhhOLI5JD6E8cFEAdMhNDk9+sGAv8JFgWEJGA6mRFYmfOjy
         +ugoJ87D4JfjPXzN/gfaDISpA4xrZWnM83+9rjSSOS+1TqG7PqMXgdr6WkwoReBAIRXE
         5xhw==
X-Forwarded-Encrypted: i=1; AFNElJ+yT5N3ejWmoS9Htb4IFd45rF+ZfNZz6+grFdMMOOw2UTqNFqD0dbWSl2sACaUPtdwEfmONK0gr5vWVMWEH@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGv4/wihryG7V0eSh6nWJI+yEstEGWsboFpTk+gwL+r9OGP/w
	aAZ0qjDdjjYUtrCgaudg5aZdbFSHIizRLkpG4ZIRIc6ys8xow7lh0R6zuIGK04MV1uygbjko/IT
	x6raa7qL/W0Zxo2yWXKZWYE+M/R4hZry5G0ugU/MUM5catfXLwaJobgCfaFQSZBOILPf8AXiOy6
	N7
X-Gm-Gg: Acq92OFAVBaqTolup6LhDdFtes4s0Lhqv5kQ3ycyf/zGzR1d7JSiW2SgWadmm6I3LRc
	lTqnBd+yEOaDIu1fOstPsBP7CYQhwts2dhEdpNzl8o0j3qp2yGyu0JDjhLZ2Doy4ahf6qyCJeNX
	XIx4HNoE98SlUxSwHsnKaYOurRhv/i59iA4nXBuNL2xsUBKMWcpl4XdFpep2OahpBuDxaIVjyES
	SLzpvbOjub7fkVKHkn68yUKCo0inTQRC6g3m+JUQANuJ4XZnP5QFEhixI05OcnRF2VHpL1YtPZt
	qzMOgwaTgUL/owTKaRRkHpFV7AtdsMVRIB/80CgVaATMMIP2h/Kz+qAvAVoiZPx5KNJhsSLZzy8
	srvfVDSF2E17KStCoAxBqWcQFn6MwloJtynoxONccs7rxhMbK9Hen0vYZl72+nQbw
X-Received: by 2002:a17:90b:3811:b0:36a:2a9b:3fb5 with SMTP id 98e67ed59e1d1-36a455f8dd7mr1388603a91.18.1779342345196;
        Wed, 20 May 2026 22:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:36a:2a9b:3fb5 with SMTP id 98e67ed59e1d1-36a455f8dd7mr1388571a91.18.1779342344735;
        Wed, 20 May 2026 22:45:44 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb323e3sm1474847a91.4.2026.05.20.22.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:45:44 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v12 0/4] misc: fastrpc: Add polling mode support
Date: Thu, 21 May 2026 11:15:35 +0530
Message-Id: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e9c09 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1zxCjv9jKUaie6bXh5iJrutKFoRTClpd
X-Proofpoint-GUID: 1zxCjv9jKUaie6bXh5iJrutKFoRTClpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX876DeVdLHNkv
 ikjfAduHGEs5oS+h1GAGEnsnL9GZLQnBhInqbKX6u4bqhIdbwk/HhbRnZ/H7YjNikuLC+NgPPAJ
 5yV/T03wuV0cVTFNAfLbocJX3wIUqIF9/x8XUCpcbnFIvE60F+HmV6q1OKUxRw3WrPUuE1ylgJm
 pD8bm5UT1SEJMESU4iOnNILhhRaRkBBwNI8YTXghZa92SpMrhCxEnRqIhas9hKZEoANgWEUJ1dR
 glHYbLT9N9V/R305+F54saYAbgwH0OEAfKBlplujl0b4Rqm8E7KWDJcnqrQqDsSfnPhWDPMpQv4
 2vVjEOXeO64d2y/UVdvhFTXWFsvAuRAEQeKrhYJJcHK3uyx7DGZolKBHHtAx+g10f13bZoaKG3I
 LqFddjhtEtqQYSWgweH4Dr4be3XCyYYB+/j63cVdI97Wja7g1Is3fW+uEmwhTEpBD6t9a/BtFvX
 jVHAHwtpt/AS1Mjf5YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108917-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: A325959F2E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v11]: https://lore.kernel.org/all/20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com/

Changes in v12:
  - Fixed poll_mode_supported check.

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


