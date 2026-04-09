Return-Path: <linux-arm-msm+bounces-102518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMfYNC3j12kVUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89F3CE2A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E391930028CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7196D29D291;
	Thu,  9 Apr 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwAnZbz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA63C8728;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756056; cv=none; b=q3R+FKADF9Mvhz62DPQju+K0jHC3TnaZK9DbtMH+KZI3YO06SegqgUFrrTyDnWoBE4B43oreWlkw1TTmc16ggRcy6eh+KlaKsZPG42e1nM2++GmiVr5eLTDX22ZYLlWgzrAf/9bVx7Kj5hYbvSMpqQAv+vR6Q5IlxYhzyMRGGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756056; c=relaxed/simple;
	bh=Gj136g/kwa38w+/k4mfmIaV2zPHIHZSBmkO4GwE8mh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gWGQPLVb83gRwNp9i7sNaIYDVFcoKlikDRiJlB08HXXytQkN6YJu3E19HAXJ+74pB4XnEP1METriGhpY5DAZVTTRjA4k1C86ZsWNe3Cc3N2eREZ5ErvEZe9YB8Kdsj9Trn2W/9rMYYARph3Pt30/q2vIdvFeCSCJRlRv+M16g5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwAnZbz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7303AC4CEF7;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775756055;
	bh=Gj136g/kwa38w+/k4mfmIaV2zPHIHZSBmkO4GwE8mh0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LwAnZbz7kLjfhAYbCLyIhuPpnoma3Cg8ewiptOI8XjjNfII5XbnopoK5uE1lMjTDQ
	 MwV56q2WIQyZERKL5RC+hllnY0CKnsKbxjKG+Ih4poNyism4K2eZogpS4uFYQWqmW0
	 B43q38CsBBQGPF2ehaeSPWtKfvqIppgCxrc7wDrhAEimUJbovVpI2PEJXvwcKslzXi
	 ggTBXzAi41+fL6RJUXMMH4GAOcsIjxppumSxzV6q7k7o30HCg0z5du76WCacC2c3An
	 Ozoe4URuEuJfqPUl8GZ3Y138IebjGeZSQGmOB/VpuD+E+rYgvWaenYlOMtUaLvTL77
	 ciSy6pIEjIY6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DC8F364A9;
	Thu,  9 Apr 2026 17:34:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/5] net: qrtr: ns: A bunch of fixs
Date: Thu, 09 Apr 2026 23:04:11 +0530
Message-Id: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPj12kC/02OSw6CMBCGr2K6dkiZtqS68h7GRamDVIXqFIjGc
 HeLLnQzyTf5Xy+RiAMlsV29BNMUUoh9BrVeCd+6/kQQjpkFSqykUiXceWBowgNqI9FjRabRlcj
 yG1N+f6L2hy+nsT6THxb/omg4djC0TO4vEjeYc40u0JYGrYYSLmPtdhfinq5F5NNibUMaIj8/M
 ydcKr52LdVv0YQgobHWldqaja/ULqZU3Ed39bHrinzEYZ7nNxs5c970AAAA
X-Change-ID: 20260331-qrtr-fix-b502c26e5f46
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yiming Qian <yimingqian591@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gj136g/kwa38w+/k4mfmIaV2zPHIHZSBmkO4GwE8mh0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp1+MUJAogw19JAzFEh47vDzrMQ1OW1lrxzap1O
 SpdPxnd5bKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCadfjFAAKCRBVnxHm/pHO
 9bAMB/9lerWH44bHX4s2xq30YdjVETr4NMjyYm+h7jlQDLvEUlhGRvDlkkAo/MesNCdkAHmS6n8
 kmnCD+AgovjwjpP9rN23JQ7VH4/qCX/togkVa1lXKFe6Kr5L4zJrn63ns8EaniqsaLUO+pTliI3
 SlhJ+y6+MXOoJfA0zYWf5xBw6FSvAeKic5luupbgYaXdiqJknM40BzmufTzyeaiXuRHVjRB6HQK
 BWW+1wZh8oUFmMZc0fpAtBmmEgGYlC+PWBYZzOSjyK16fNSEm5rguhmwz+yvzaVAe1tKpw0TG2o
 q5Xxpsq0jBj409/ihH6rDYvypeTVF7heOnJL6ao8tODvKMfP
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102518-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,msgid.link:url]
X-Rspamd-Queue-Id: CE89F3CE2A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series fixes a bunch of possible memory exhaustion issues in the QRTR
nameserver.

---
Changes in v3:
- Fixed the issues in remove() callback and other places reported by Sashiko
- Link to v2: https://patch.msgid.link/20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com

---
Manivannan Sadhasivam (5):
      net: qrtr: ns: Limit the maximum server registration per node
      net: qrtr: ns: Limit the maximum number of lookups
      net: qrtr: ns: Free the node during ctrl_cmd_bye()
      net: qrtr: ns: Limit the total number of nodes
      net: qrtr: ns: Fix use-after-free in driver remove()

 net/qrtr/ns.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 10 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-qrtr-fix-b502c26e5f46

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



