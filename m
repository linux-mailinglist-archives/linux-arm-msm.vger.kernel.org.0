Return-Path: <linux-arm-msm+bounces-114220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P4MYHpKdOmrqBggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D26B8070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FMZ32ZuC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jVEuFvyf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72EA2303D800
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BB53C0A12;
	Tue, 23 Jun 2026 14:52:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8C326D51
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:51:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226320; cv=none; b=LhZ9g9SKJFtlnVHcQljISQSTwKFjgxf8TC9acbnm9t7HWgDZkAqVdro04glS2DbApTfY1Y6KQo8+UOobm2hwrmPp9hlfsd5M8VaRGPP4LEY95Qebjp+T8ccznHe2XDE2YrMxZTPtVo+YgLYdaYlOFSvmtJn10/YrCP/yrIOJ4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226320; c=relaxed/simple;
	bh=JEgyj/evZg4/rtg3uPQBQlJTecy8/xf6OfnEyAtAroo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ko3ErjpDHRuWaw3oSwosXRa0P5aBNsm06LRWuMpNXR5HhDCqF8gJuFJRiW10IqoPFWsR0nvCi+Lbc9HOI6zMtPQWUo9SYC9w0Es1tNoDLSdRJfW8XFZnEj14ZqtdQIqUSTuC2nwGUnxWpZGWGz+MCLQU27NU2MEcT2Xuw2tHoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMZ32ZuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVEuFvyf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYjTM113482
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IE
	aybTI8YA=; b=FMZ32ZuCd3F80V0tl+rjM2sFqESCIOQ0A5e0zhki8Zhb+xodnAo
	CECt2HeltlfXnJmBHu+eio8b03k0tQFUp5+/iIEd0tT+bAMeLh5DKN2Aa7y8PZlV
	avhJQ4CfmnF426wQytKWT52PM5+7Xtg0qCIDhHOrxJUi9ED3qShtS1MaD3E34sTR
	C2/ebgumq7SdwdRpS9WdJCf7lh8570IsWMf6ynArZQ0Gf/dgmDwQeAwyaOwXfM35
	uJ9aPRJ/mbLMjx6ec/9MUQEyQMqm/oE8cFYdAOzGYb3Sa58YQ0nAS9uZo4pX2usX
	zAbyABw67gedBfUpEOL5iIhY/T2s36rzqRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvt34r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:51:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c79e5de32cso21731195ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226317; x=1782831117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IEaybTI8YA=;
        b=jVEuFvyfRR2Iydrx0Y3W7as4hQfKZGlGrcNR+CBk5P406A762RqpmGMhQBCBO7wU56
         I7+eH+pXNnkr5z5plfFpN+yHnvBZxgKdPAuMrwjlfpKUBt3TXJiMhRi7DR7BLLD59cY5
         4Id/gnCa5g5fCbIK3SZNSp1IEXoemuVjnxEiV/H31XG0tX05pUNJ/MTSYOweBlU8erYe
         5iwrhOYLnvYhZl+FGQ1401K3II/Wr133EovFqVv/jC3OFZcFrLHQJRrm3iGuJztdjg+g
         DKntd0iK77hLwA4KMGYvFkKP4mgf1oK1JnihIL/7Wxo7ipqlnuMvw6RlPwhDppa1ilxb
         r7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226317; x=1782831117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IEaybTI8YA=;
        b=MqkemG9Q86PhEYekGysY0B9kUEB4ittkXp9CqMnArArc9EwvG+kKyHgbQJ+loJvtry
         4sE5Kkj97IjEab5w1dy1mTR+YMF2WAMI59B1v2HSzCzBpax/XbcuB7aADQKNjF2tgFKL
         /lLJk2fvUONq/hleyrk3MAJ1VTA8qGXY8Ql0DQTEm45Vg16GiBodpGgVB1kQ3KSy15AI
         ta9nSIGTwb/Xv710wjhW2J6L4mxpLKrG2132ODy8MeaJFLShHgZbkL9gGZWW/gp/H/iF
         0rLxWzSuVllnksKxBGfrx1Fo1y/aMBocgosgZ4Xau8nJGuj4zfl8LJZUZNRsiglLLRQo
         gndg==
X-Forwarded-Encrypted: i=1; AHgh+Rovp5MH/lPY8PrMH9dc9j/ZKRYbjcGQMBerK/sRHHVJcQOdgOtMgPSgrDGFWYT+flBTjjiP3sjcM5U5Y0sg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16B1KqL75uIcSwv3lkjFdXayiFkCWTFm2QJC9D8h+fNizDzOK
	/8X8jcohgPWkAQA3wVU6hFMmYQzll2dzQXS/iJEMF2OSUagqGf1fweMD/P5vhupaEZoawpmRe7b
	uabuFE1Mq4n/HVSIkaqAY0cQEdVo+ZWEXvPyXLgCK9/46yyr/BpzetJh+blgOTmcA8sJakJuvZV
	CL
X-Gm-Gg: AfdE7clOd1fD64ksEg90LRBidXPVN1Xu7jSpTwqJt67YwjS5qxtCEShn1Gc/jMLEKWF
	n8vDXoCgO5VjzUvpxfsXv31EZ4wye+WOYwJrQz2ntntZtyf4Af14qNFA4yFvbg7NVO0o/SOdynS
	u7pzvaGyMKimo6KAW2sB0wClnc+Gvwzaitel3HdQmakeAVKTQmztKN7DPzkLy6ZWCkyCyvJwz2l
	wdW4rhOHjI1g7mEb32AOiWopEDzKOyd90HGjH/e1jb7JdrvRvpESlZNXZthb+1KujTmYR0X93R/
	+/Q1S6DB6euyU7PBOLOANeLlQWFXT3wkF5cN7yGpfX9GNNIcVWBGIyi8NNa2td5gTZ6nckhw1FA
	e3VP/pmRj7lsfzKlSJezDHEoZw0xI3+eaU9n011BAWL9xkv2Hcv/YMNAn/c/u
X-Received: by 2002:a17:902:f552:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c718f6543amr200107805ad.21.1782226317061;
        Tue, 23 Jun 2026 07:51:57 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c718f6543amr200107375ad.21.1782226316463;
        Tue, 23 Jun 2026 07:51:56 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.199.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7de7sm105186215ad.32.2026.06.23.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:51:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, mhi@lists.linux.dev
Cc: jeff.hugo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Alex Williamson <alex@shazbot.org>
Subject: [PATCH] bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
Date: Tue, 23 Jun 2026 16:51:34 +0200
Message-ID: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9d8e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Alb0JCXUjTgUeOUvUsHAUA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=FCqJEZ2iPJghDfvfNp4A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXzkXqXJX3Y+ny
 tKHjufjQlxybhgwQdRxx2jWesDR57wXVynjI30JBUNJ4nukly8f2OENb8Ica7CDp78JlcCF5DGO
 PnIAWXEvFKGb/PQpGofgeIkdbjfcQVA=
X-Proofpoint-ORIG-GUID: yK2Yw0Kzs-80AOR4N0CLQZCAH2rQHH6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX6/bpookSjrQa
 VAPxIaq0IYQdMk2CNUjFkOsvCRuv3y8l4LkL6w5LOKNrKiXT/DA5OQccnp8BYvvOThbMCBxGRki
 4Wj+x8pwylsJXsXnBJ4xtKvUxXru1xx2MHiHUfHnpxsQe/enYEiNKhHFBAYBFCTZiRlboPVPt1f
 HtsCStPjs4iy9SsgRcvzPylne0SMigo86KXtNVV7L3O3E92rS9CQsg8qnOfAPdaA0Qt615atfSc
 CIHsJdQR/eUoeKPuulOIHjq3DRa9BPBU//jKkq0SqmmuCazABij1r/zP0CR7fuSnir0D4DXt/D9
 p8CDXD26OQYYuucvKZiZrtUXkD9a77kFhfJSPAoL/lu8BHyT7hG0QB8sPV12gcu6zE3QS3K/0UW
 7fP1DeoBaiKyaaExDlNtduc2RmQ/JKX2Xrmj9fGvvgJUW7c2jCo3wETnV+gjkIJZI4DSsMOIzvi
 QbvUG7IuU4TQtyOsbQw==
X-Proofpoint-GUID: yK2Yw0Kzs-80AOR4N0CLQZCAH2rQHH6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114220-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:jeff.hugo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:alex@shazbot.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,shazbot.org:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 105D26B8070

mhi_soc_reset() tries to reset the device by writing to the
MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
that the write gets flushed to the device before returning to the caller.

This may lead to the delay (if implemented) on the caller to be
insufficient, if the posted write doesn't reach the device before the
delay.

So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.

Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
Reported-by: Alex Williamson <alex@shazbot.org>
Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..4d458396233a 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
 
 void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
 {
+	int __maybe_unused ret;
+	u32 tmp;
+
 	if (mhi_cntrl->reset) {
 		mhi_cntrl->reset(mhi_cntrl);
 		return;
@@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
 	/* Generic MHI SoC reset */
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
 		      MHI_SOC_RESET_REQ);
+	/* Flush the posted write to the device (ignore return value) */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
+			   &tmp);
 }
 EXPORT_SYMBOL_GPL(mhi_soc_reset);
 
-- 
2.43.0


