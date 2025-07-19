Return-Path: <linux-arm-msm+bounces-65747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B159DB0B188
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 21:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052BA17CF1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 19:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8824E2882BF;
	Sat, 19 Jul 2025 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="cFCGztxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330F21CC4F;
	Sat, 19 Jul 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951583; cv=none; b=kTqPNOekRc/aDeOSO4oLsuEUCeFM8gQrSWk6HsaspNtOGCHbKykXalxIss9f6gahyUo63g1X6K/6giL/BRIOqSapg62/IPP15sqaH54Zqmz4z/LwnoP5zsCLUQWRjZcb+phy5c97dXybdjHd/aqajpqo1s/cV0mc136bfS/4fn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951583; c=relaxed/simple;
	bh=ZQQSpeYx6C+JYwaOHhOsSow7r+sdrx3hq4erYJG3nHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPcB8joEXs7D9UIVDquCsZNE8JC5BBMVzBZNSl90Ppn5tDtzhELlAp6XGYdBvDetyS88M+VERUx3BXzNAyKsioGXbAglOjFXK6C3Kcx12vsQE3NVRb79jweZvB4CQGTXhmUqRjJfitWhkbV1aUuAQL38/QlAGK57V4OirGvvyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=cFCGztxM; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951576; bh=ZQQSpeYx6C+JYwaOHhOsSow7r+sdrx3hq4erYJG3nHc=;
	h=From:To:Cc:Subject:Date:From;
	b=cFCGztxMW6iBBrp2gko+o9xu2bJm/SWJySeFwybKwleAf6mMXvFpq4tMQdx7uz6ZS
	 JP5IiFSejq9ye0RilVcB+VyEPWJjoGzRWemukEDyH+kgyIwtsoWcOwlTqywyQQaDx0
	 o2f0t9+xzo/H+1jVCBmMtxPC+traaog9U2uLuhmo=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id BF3AD14871AE;
	Sat, 19 Jul 2025 20:59:36 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 00/10] QRTR Multi-endpoint support
Date: Sat, 19 Jul 2025 20:59:20 +0200
Message-ID: <cover.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am incredibly thankful for Denis's work on this. To get this back on
track and to eventually get it merged, I'm resubmitting his patch set
with issues in the first review round resolved. This feature is a
prerequisite for my work on ath1{1,2}k to allow using multiple devices
in one computer.

The original description follows:

The current implementation of QRTR assumes that each entity on the QRTR
IPC bus is uniquely identifiable by its node/port combination, with
node/port combinations being used to route messages between entities.

However, this assumption of uniqueness is problematic in scenarios
where multiple devices with the same node/port combinations are
connected to the system.  A practical example is a typical consumer PC
with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
each device could potentially have the same node identifier set.  In
such cases, the current QRTR protocol implementation does not provide a
mechanism to differentiate between these devices, making it impossible
to support communication with multiple identical devices.

This patch series addresses this limitation by introducing support for
a concept of an 'endpoint.' Multiple devices with conflicting node/port
combinations can be supported by assigning a unique endpoint identifier
to each one.  Such endpoint identifiers can then be used to distinguish
between devices while sending and receiving messages over QRTR sockets.

The patch series maintains backward compatibility with existing clients:
the endpoint concept is added using auxiliary data that can be added to
recvmsg and sendmsg system calls.  The QRTR socket interface is extended
as follows:

- Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
  generated a particular message.  This auxiliary data is only reported
  if the socket was explicitly opted in using setsockopt, enabling the
  QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
  to facilitate this.  This requires QRTR clients to be updated to use
  recvmsg instead of the more typical recvfrom() or recv() use.

- Similarly, QRTR_ENDPOINT auxiliary data element can be included in
  sendmsg() requests.  This will allow clients to route QRTR messages
  to the desired endpoint, even in cases of node/port conflict between
  multiple endpoints.

- Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
  clients to bind to a particular endpoint (such as a 5G PCIe modem) if
  they're only interested in receiving or sending messages to this
  device.

NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
This follows the existing usage inside net/qrtr/af_qrtr.c in
qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
done deliberately in order to keep the changes as minimal as possible
until it is known whether the approach outlined is generally acceptable.

v2:
  - rebased against current master
  - fixed most issues found in first review round (see individual
    commits), minus the 32-bit long
    unsafe use

Link: https://lore.kernel.org/all/20241018181842.1368394-1-denkenz@gmail.com/

Denis Kenzior (10):
  net: qrtr: ns: validate msglen before ctrl_pkt use
  net: qrtr: allocate and track endpoint ids
  net: qrtr: support identical node ids
  net: qrtr: Report sender endpoint in aux data
  net: qrtr: Report endpoint for locally generated messages
  net: qrtr: Allow sendmsg to target an endpoint
  net: qrtr: allow socket endpoint binding
  net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
  net: qrtr: ns: support multiple endpoints
  net: qrtr: mhi: Report endpoint id in sysfs

 include/linux/socket.h    |   1 +
 include/uapi/linux/qrtr.h |   7 +
 net/qrtr/af_qrtr.c        | 286 ++++++++++++++++++++++++++++++------
 net/qrtr/mhi.c            |  14 ++
 net/qrtr/ns.c             | 299 +++++++++++++++++++++++---------------
 net/qrtr/qrtr.h           |   4 +
 6 files changed, 448 insertions(+), 163 deletions(-)

-- 
2.50.0


