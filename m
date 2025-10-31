Return-Path: <linux-arm-msm+bounces-79856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC167C247B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4654078DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E63D32B99E;
	Fri, 31 Oct 2025 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hRSaomr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE692690D9;
	Fri, 31 Oct 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906912; cv=none; b=u8FMMGuARzfjZ9Y9U+zvKcjLkU5Pl0P7WhiuUBeAcvcwbQVogAWl9cDX7ofx8cR2hS3KcZ7/CLwQa5N1ErFnPKnny8KGdF3U2jWIdHRUBAtgUpCqUHud3mCJPfbo8QwlIT2XbZ+ITh2J8UhpBiHi8nr5Gw+O4k5tCCimh+bGPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906912; c=relaxed/simple;
	bh=FxherFwh5Pm0koccKZg5lK6dMO0spByFj3QLIWLaPo8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=W2fSb2ak4qXUHUq+lkCfcRVQbVfAoWnMhjE/qva3MTutgi1pRn1wpFapnp+ehNvzuJT2TZ7YKQsrqBunDe2qVmjieohEGMuj2XIVrOb11gN+muSDIbvcXZ6VUbc+AhuLqz/zWoUXod+H7An56lRWoOKmA4dhC+KjmDBUKZioTNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hRSaomr6; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761906896; x=1762511696; i=markus.elfring@web.de;
	bh=oFx6XJksggUg16W1s+jVFqjmiEorlTHQrV24vlNqe6o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hRSaomr6sci/WJpUEj3CgYmEA9bnBYxYwTrnrbz/lloHqgf2XyBfXYgSBrpOwTC+
	 agD8VQKVcwr4ob7THf+O32FM83tBo3xMPbfU7sTv1ZezT2MHvfjpHTNoraMlg5339
	 Qrwnjl5z7t3OWoV2Uz1x3+v9tE1CLPXcub9RUzWrHTu4laSalaMniHq0/+iSZWKp+
	 Ksy0N0v6fJyAmDmTfkO224Nm5MsyajX9AtTg9P8S5LDPB0EhkOwQVLWrgigJtUtcT
	 Q9xHVnJjRdCmfgzcokFKrFPG2maaRiV1WfvyvLt7TBjdhdmlqotDtBUpKgMtqK2Kq
	 Z/Cm7ir6EZtyLiR1Nw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQgpA-1vaHrS2Pvq-00YlOW; Fri, 31
 Oct 2025 11:34:56 +0100
Message-ID: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Date: Fri, 31 Oct 2025 11:34:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment in
 copy_partial_exec_reqs()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NfRtVan5498ZivDyGFWJwH743+N/6vdXytH3TdaLvTWLt5VYL+W
 DK4aQNkKFPNe4EwUC+wDg9AMPxIi8dYBQgZLTL+cdieHf6pheXtIaJhUwhY3wf0WbQfkhC7
 sNyPsetkDolgCZRa+yBLEd/kQociTdkDF2ZTahOF9XPPUjDoXsC/4FdwC/ZV7n6jiDLJFK2
 s6bByFiz4NRLGrAG0eZvw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mIfDsisP1fc=;/yrmD4e8xKKgNZXTMo3G/l6Jsj5
 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
 5QCNrAc4IhMnuPxfw=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 31 Oct 2025 11:26:33 +0100

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/accel/qaic/qaic_data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data=
.c
index fa723a2bdfa9..c1b315d1689c 100644
=2D-- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1171,8 +1171,8 @@ static inline int copy_partial_exec_reqs(struct qaic=
_device *qdev, struct bo_sli
 	 * Copy over the last entry. Here we need to adjust len to the left over
 	 * size, and set src and dst to the entry it is copied to.
 	 */
-	last_req =3D fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
-	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
+	last_req =3D memcpy(fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nel=
em),
+			  reqs + slice->nents - 1, sizeof(*reqs));
=20
 	/*
 	 * last_bytes holds size of a DMA segment, maximum DMA segment size is
=2D-=20
2.51.1


