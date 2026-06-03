Return-Path: <linux-arm-msm+bounces-110929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCKgKgT/H2oOtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:16:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413686367A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:16:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KTiAZyRf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kSfqtsAj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3586308010C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BE2453498;
	Wed,  3 Jun 2026 10:14:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FA43D504
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481694; cv=none; b=Zy5YiADIDoJPc3mslm/D0ieUjGGL9l54QYF/VdxMeDOYWyLprld+rOVwLAyzT7zLnxPRXmS/ZevaU6qLBO09Y8t8O0vkivDEc+W75L2aFOmIX76/uz+zk68XO2XootGBfExq63SRQPmJO4bBmaEXwncx9FpbR66luYHJ2YZNPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481694; c=relaxed/simple;
	bh=OU4D6VlRdhjfTz2yiRjWGJXP0ElAyKuAC2J0p8/GCyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EiflZEu1t3aF/D7nygrhxx4aoWKlmFbL/8sQmrZ6nsuoHdTcvJZyt3K5gKSswDULz6SfNNUqSPczxSy6Nz4c7pEA8EstUPdAlFMBl9Q0GzyGNAGIjQQTGlDSIgNteaepe+oO+cD9RHJlzuwKA9xB+ubVNSR8dqxveshitbYJd3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTiAZyRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSfqtsAj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJ6E380230
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=; b=KTiAZyRfpUnB++l9
	LzgLfI/6TSw03aQNyl6h6MaKHkXOMsLzcvqfSFAbInMYFeVR5DHLyf6bXEGPvUqX
	pQyKYZzHGqI83N3arPTn2ZgR4Vi46fWGQEStRmThnv/ziDdK8MxdPzD5lbNri082
	jiRevfSW5UnD6giXj4K/BEtppK/hgLHM4fQ0tQw6K9SueHpw8I+i0NCMMUm/A3pA
	SuYs1VSPUlShr0au+HbPSW+hX7dY4rxVBCvrHrBmwxAXx84eQT5ojc8ILjLkTIdF
	zgEcFLlZA8oEpN5oiwnQ9LvbAF4551r6s0o6D/dJC2bAoUwWpNOjE8yuaXCIdD1j
	TH+QYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhrygb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-841ef4bf8cfso4536367b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481692; x=1781086492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=;
        b=kSfqtsAj2h1p93BYwYqsivMnNflA95gwKGMnL90NA7hQqT/f+CZ7WZCpKgyVTTWiRQ
         vk2lz9ELnJsZx0RQ1e/2ogQXZCFigEfXVNBNtkxXQUWhl6ljbanCLwm4YuZnAj/S6aAi
         hOGS/8rA4yroaLQoAZ4cgsggXKgCrOFDJEJUJZvBR3Fsyg0t/vsW2qzuz3FP1oOn59XC
         /rwrBbVQ343aQH+e/qJwFchicvY/7c9CFMXpx66JCzD4GMRWVpxhfmvf6n3e9uaCk7c7
         gH7Vl/khHyN+bRHB6oVPLJAhjnaKz7C7r0OFRVtytXxR/uJw6/XSvf9PrJisjny3ThQb
         feLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481692; x=1781086492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=;
        b=JlWnpGYQ4UXWXGoodPqzGlvi2KYQNktktnNq2w5qgldzOaD7E63/Na/SnFLwfKsHGW
         g0UvdIQeUJlt1vbVKISocJMNrAJXmKv9ZcYglE22aSigtMKWl3U99D7CtycWrX+yH88Y
         OqHkUQ2ospb1blpXc/TgRu5PgzF+QQwZiJ5+/+KZ294ulAVsk0wmcZTPs2CCHidGPXtY
         oC6HAweDicZ+yY8RIE90kFd3h1ipT+dFxpjvRITOZErOuPrrAZa+R+MsfV61SUH4EFEh
         C94U2HQNLOnhlEsdLFSNiqtaMTy2oyKn/3Juti24klQtXMuvKyzp6slTxbLdDEHS6/+R
         Jxng==
X-Gm-Message-State: AOJu0YxG7aOg/Qe1dOzIFkH4gx25ggnNLeaOBShMaihL6DdqyUMrK8vR
	ZopoM07Pa7NPUHkjlpv4PaTOMWpJaQk5hKin3tun0DryoMgLhIXMFo8iRlSKiEVtPKTAE5vDLg+
	JQ8mW0eBU2gFlLYvuoEEVtS4PGHF1LgRQ59ToDJ3GYho4M2Uo83vLePNuO2hQAAAvQINy
X-Gm-Gg: Acq92OFofpRIUQ5vOkbYXcbNmseeukEguMteZV7doRFHHp5K10DD5QRU9YSmy6bTh60
	9lkraCmNNDu8TNALkkrEOIHrBQkM3zSzlfUlHpouKzZsy4+z7YrnTNlvSIV5DUu+foXrM8Il+by
	9ALnfpU8bWYjgnadNiZe/iezItBomo1syHks8Vgf5p/mAJbUK6PsR0WKDZeLpRfRzfgAAEOUTU8
	zMB2f6X5Ld0dt0JbiD1TeeFYOhxRiI/L7Yrux8nVP2IbQN+A/84GWBINv05vjM3vjN77UHE1c2N
	8YLOEQvvCGaxy6qXAbUwax8Hm9Sy9q3K2dUZr8clfLZfiK8CZeJ5EoY9ufbp5e+kKUa/mDIK4Qp
	tgcMEwY7hnxYzaGV6jr7RvjwZiZbNyIVpF5Th73sM/iRJysKadqHVQ4Ohrkw=
X-Received: by 2002:a05:6a00:1c89:b0:842:2efa:5fac with SMTP id d2e1a72fcca58-84284a85991mr2725749b3a.0.1780481692212;
        Wed, 03 Jun 2026 03:14:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c89:b0:842:2efa:5fac with SMTP id d2e1a72fcca58-84284a85991mr2725720b3a.0.1780481691743;
        Wed, 03 Jun 2026 03:14:51 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:51 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:30 +0800
Subject: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1194;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=OU4D6VlRdhjfTz2yiRjWGJXP0ElAyKuAC2J0p8/GCyk=;
 b=GZnF4XghOPx2VQtWAqPUnarVMZF5a546d0cWm5HkCXIVLFf3ziF1A23aEr6ddnS2hs/gW9Gyd
 PtjBoSpM/71CztWFiBDFNMN0p7ZUIuDhGkHqLqmq8PbC8nBjLmfG5Z1
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXz0PF08Z5NrMC
 2BFbbqqTiEdkxJBbEhYsiMc8HTXLMSgKlgep5KgGmk4V9mwKeAXR1qB8UQfQoPiWxO9xG1j47xW
 0zVU2wlqcVR/iI2YAbUXKUjEjaU7R3iM4wyybyPD4NvuXjUrlQhM3eMxOfWPopgU76aGK4MlsFc
 5Zn7OZDpF0dpcgYB2iTkKSRCfd0vFrnNggJNpDntxItZ0V21xYk6rQHhg5dk6WXhF+IWiFoiETu
 ZIVXuOyP+2M6itmajCCBRbPE5P1KpHbn8D93hQCZ1txUk/r+hn/1H6i8/yaVvhQID+RCozQrDt0
 muQPWPr/u0NY0U0cljUbouLV01CnAx6ZcG40jmUR+13EWdl5jlmEkKql1xkChf1Air3gj/Ftye8
 WbJvTi1zANWFDaHg4HASxCkfHp7nDHaqegh22eg/DOnSjsGCaUKJGNuMtfhbVPOAQdaBsQEsOZt
 8cl+lZOq4eF4WNhBWog==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a1ffe9c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=r6yPUBAwCGnPY4Z8tCIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: gE-ZrDZH2vlvgDfrotRnEklzvUfkAFwA
X-Proofpoint-ORIG-GUID: gE-ZrDZH2vlvgDfrotRnEklzvUfkAFwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110929-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 413686367A0

glink_smem_rx_advance() wraps the tail index with a single subtraction,
which only corrects for one full wrap. The advance count is derived from
remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
if such a count reaches or exceeds pipe->native.length, the tail remains
outside [0, length) after the subtraction and the next FIFO access uses
an out-of-bounds offset.

Use modulo so the tail is always normalised back into [0, length),
keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
checks added to the FIFO helpers.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 42ad315d7910..4f143921b719 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
 
 	tail += count;
 	if (tail >= pipe->native.length)
-		tail -= pipe->native.length;
+		tail %= pipe->native.length;
 
 	*pipe->tail = cpu_to_le32(tail);
 }

-- 
2.34.1


