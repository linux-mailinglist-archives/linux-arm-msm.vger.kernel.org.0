Return-Path: <linux-arm-msm+bounces-111152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DotkLMQzIWr+AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:13:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC963DE81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:13:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gn/DOa6l";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dvkD1gMy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 615C13055EAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEB7386C10;
	Thu,  4 Jun 2026 08:00:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3337DAA4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:00:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560052; cv=none; b=C2pCcYtZFxiN95Z5YyvapKL61W0P8f+/XsQcVqxFdUc0LqBKiQM46PzUTEGeF/7euYLDG7fq8v28WC+ot7R50ncQ+NtZHPqZIDdaY4+jiE5WyfEKwcioyq5Bijs73+6ikfxXDyC/aBV+qrrHMyxiJS+xax2ATw/uAQo7miJGcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560052; c=relaxed/simple;
	bh=SzeLABb6avPmxnwdiZxjcIQRHpyuZ3zU/em6a5dKzkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjCLonv4nZlHWXDej9+0Tzh7XHAYTNW7NZlS5LJuK2O/+pe2dnXo50wN08YMfw9ufa8DCZHVAnYEUI1iZrA40iSA9uSvYSGd+HNZe8+ueK3GabW1WBCg85GbzRj6uKuiwHstsSNaqht+JjIc3tbHD+KIi/q2UA5OUtObMWNXmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gn/DOa6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvkD1gMy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65476Wot1477935
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=; b=gn/DOa6ltO/0E2Er
	8QPItmJprmlL7iwKzhkZxvTbxpQVLduGK6YCb20OMAoUGolKnqg4t6reuTUSbaij
	MeIetPTdCrghA1IWFAL06YkVE689J+criCEc6j9YyrJB9QHbGkFMbg1kkDJfU90V
	Ou7N07qMnRiJvvjuoZudOTk1jCQWKtg4baypm0Je3u2vqQVMdhUlic6HcATr+WPi
	t7eNip+lT55jlmgSpPLbQhjj19xciRe7IxFX2ypK0qMU9L9MP131JuCDkOBHgcLI
	EzLaU8MMWFn/tdrKCUNnb6H38gC5ZIY6t2PJs7vAfYhezjH0Za3qe+J3KKgwy1y1
	w/8fJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nunw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:00:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so4042015ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560050; x=1781164850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=;
        b=dvkD1gMylvsD3zfXVJ1Ae1Nk+qgAok2CDweHZ46hl5JAu0m+12U+ePOOiJywj4maje
         jiPnim/E+7Pj18SsGXoVK9T4EMZa+iBZsgSb+d0jb9v/N30CAg1illBzzsNAppogr5Uz
         AKNvh8DSd/WQir6b6BRP+cHe/dB6teg+1398MhKV/wskvqH0HS8V8YQuH+31XLw/G4Gv
         1e6M0lD/pYWwxdwMW9H45WmXfkEAxuToZE+Rue7BPsJLjOsNPVB21gbQZ4UltWo3yOG1
         Le/rV86eyLy4wNFTIodLhZzShBCZxtiipu8Uu04y4rYlIHbR9p2gOgcnZZ81eYggpgDq
         TaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560050; x=1781164850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=;
        b=sjL3ErhCwRJ3S+IjDVg8GaSZFFfPGqf+SxLFnfUXEcOodpqxm40FgjsQySnEmxKlWN
         TvWqXoDSDDC8Y3dox9stutXhJh8cCc14hgPYh32lAC/2tvRgEvGU40JoyT/7p5E6sF6K
         HbzzWt1x6x9bsKsWjMMU4X4m+Z2B3RyS+HF22UZKvdsJXzgjI6WtGYLUo1HQ7m2TtaHh
         YG0qWcmRQz4sw5j+oooEcaDB70MmRGuUUWQuANRxGOjlp+Uv+ksNDBN61aF6YkADzPZS
         EbEnAKj9YJpCVzHastL2wU2TRiq9S4EFUg7O2Dp2f7EWGlTUdXqJXCgpREWkWV+bclqF
         9CKg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ifi+HPOlvxWq3kdYMFklP9TM1VuEqKpSmPVFbgptsZcRauuDl2n6PPIPXkOXJP/eHHdkxZ1yYhLNg5oC8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqjhmab+kFibqwcPEqr6lZX0ipR/AJe2KqnRaEuzk48l8tNv+V
	QlbjiPCnNz2VytM4PAzEvQRsI4H9CSM7IVjXJwgCX5dqSQggKfGbguxTpmm4xfq0uweI5krY/zo
	16gJ5GC+NN5FZThAYRueG3k2e24crzMMdfY/tXCrFP8K3ApvdgDXIv6CWjgWQKEScWxZ6
X-Gm-Gg: Acq92OHXJayI+Vey1iDvhUtH5ywqsEhBNeL9CMOROCRpDEd80E1bg+27x06KPOcn5hf
	e4s/2VCysz7X0WlGo03ZOSXuLr5EbzmBRyXieVTKKVp8F8R6uX++yZVFW/a/nIq4bEmoB0hHAOq
	2tnDkrFWBZFwH1aJZPbI3qySkomEagrxVh0LoiMCv6IqP0gSiHFHfhKs7kU7GTtb1H4g+v3tDiK
	TG9VevTuB1CJypTxIvlE4X02zHQyDtVnpF7LPF4XuLYZAnmQHo8TVn1cY2cabMASHLm5HtZEPt3
	P9tPnIxD8kLddWB/wWHdbb3PAXBxD91+N1QHJYw0UrttlbaFiWRGKuHfHKaoA0FHn4ihEqa2m08
	OTLu6m6hBKXdhiN/kHDp+HJIRpKhpC9UuLh2poKeBIJYAJ92yzXdi17Zop5KW7vvOVr85g+g7pG
	1TSwthuM2EuFWL3h71XVOi56OL5aKNfXs=
X-Received: by 2002:a17:903:2350:b0:2c0:cd80:47c5 with SMTP id d9443c01a7336-2c1644cd26amr73083415ad.27.1780560049778;
        Thu, 04 Jun 2026 01:00:49 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2c0:cd80:47c5 with SMTP id d9443c01a7336-2c1644cd26amr73082245ad.27.1780560048423;
        Thu, 04 Jun 2026 01:00:48 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm49374565ad.3.2026.06.04.01.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 16:00:38 +0800
Subject: [PATCH v2 1/2] media: qcom: iris: Add gop size support for gen1
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
In-Reply-To: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560041; l=3190;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=SzeLABb6avPmxnwdiZxjcIQRHpyuZ3zU/em6a5dKzkY=;
 b=6IgiRku9dwXBEvsplda5wv++/ZeONbbq3jzp+GbUTFS80OI80vuTGPQnB1NP6dAYabQXD4f2q
 CDQBDFpERR2DJ5FYxJpcMgJpxNWmbSgtIIUHhv6oG0n0z/8yHF1fek5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: rRfYsWhHuPGWtMB1BnYyOgP5kRyRqvWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NiBTYWx0ZWRfX5fAarwUII33O
 RIW9iqY4mQ15ABmXekKPpCtC79sx9xjfvux++EVpeT41TI4W2N7w4cPO57ooxWcn0ldKXi9LKDH
 Q9g3gOEu9ishmqeNdxxZ7q7E3uq9n4DNUEI0NDX5HAhvWuvdNJ1YNzfA6wPMGk6N3saK9eOpnEO
 r1ZWOLJxZnCf1g79q38zyjz/raTzFi2zRWW7hVgETTGvI45HyTc1L+SYwD5PpMnqx4FqQNnRrzZ
 iv7VSmFcyNElaNzZGNWRjB3oTqLu6tTK3ZcrQR3f8WoAzFZsiYH1EoGVFoj+UDRfuZ6Ne5wJloB
 hCBVo7UTGW2KCtRftA6nO4dGxSmVNHjNUn1abzlhBpAq8Unt9KTWVIRVpB6+rxzClaGDJcQ6Q9G
 G4IUHlurngxRZV78YcvlEw07CP+I91lEa+mQVQwNrFoUqXlrwNkNs6sJD9Jw1rjHTflg/UkfbVx
 APUjYhCje/4Tqv/hZBA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a2130b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGpWkYCgaWylbXxf8R4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rRfYsWhHuPGWtMB1BnYyOgP5kRyRqvWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111152-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AAC963DE81

Add support for gop size configuration on gen1 encoder by enabling

V4L2_CID_MPEG_VIDEO_GOP_SIZE.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = 0,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
-		.flags = CAP_FLAG_OUTPUT_PORT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen1,
 	},
 	{
@@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,

-- 
2.43.0


