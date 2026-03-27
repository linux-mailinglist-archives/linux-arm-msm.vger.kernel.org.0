Return-Path: <linux-arm-msm+bounces-100388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L6jJMW9xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:26:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E834851F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 718F8304B5CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7C937883C;
	Fri, 27 Mar 2026 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebSdERS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfpnsUL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2003361DB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631581; cv=none; b=Ys00yRno1tyaNUS2bEeK5oj0MPAUHtnJ6YAvRd/ULkO9+3+eGssgbg8GEU3pBjKa/SwCJoa2KoIaaehb0Sj5oonDVM38MpTV1PfyAz/6TUTvFtRchqvicibxSqcgvMj9cAEQ5Et4TkIHkPX4ED3KXaSyt5kbQcK+XpkiS5ab4tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631581; c=relaxed/simple;
	bh=/88q1mBjtIUH3ikMUjzzgHW29LsNAOlut+Hvt3btdUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFa/0euMkm4obJmmHGPZFZ/y3LR4AvMzcNRAdE2CUGztHgo72scLaE4VpJDKG0ynFyJUy0FvL1bm5EMRk63hHVMHnjhxtan85IV7pZh7EUGw/CzN9TINx4fczibPGRAI74h01qjzVaiNuiXU/8XyV6cs9yDa0X/h57nFvqCY/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebSdERS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfpnsUL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhRff3701396
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0T
	UDeYx3Yw=; b=ebSdERS9w8kS+m1wOE7PgtzgJ1NqC5xoC6JeufhDbRWIcoVzVWQ
	ZhY3xYMiXmZG4rI+ETnxPE3lmSVX2pk2V0Qet1CNzpqQTgw/g6HYdalyjRxWSSML
	Vm75MS9QGlPY1jBj6GTiPlMgOKxTBDR3c+XwYp7xVd+kMxNBSuo/jGnRYBSJZoGF
	GX6OA9WwJYyEpOi43jzI/QPVO5P/QYCyZE6NIp5sVrMZD0qt1MQ8QSYUkErEvYQO
	eJMwSd2+9jQ6s5tCYFob5zqwUUBOSWdmUUZ+WrjnBzEreFVpgXM/5JTY2OhOXx0h
	ViLmvjTBaPJj5oo+gKnidVAP6jvDdJr0BAg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx2tem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:12:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1618126a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774631579; x=1775236379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0TUDeYx3Yw=;
        b=EfpnsUL9ETzeJ+yaD6bFVP1CegfbBqDQBBM57bMKXpqUj+MPo099xMjIXaxxDo9R9F
         sH7XXVKiwIR5thgAjqElDluo8aFMBfmmvqgT1KXL1MjfyucEsQmmiQgSWjyqysRVPbEk
         UZElRQv0EmLJRKqFtdjDpyHfxVrYitUm+t8J3BsKYR+qcmAyJaQINbBgwDBhbOuq/Ykz
         Fn/WCmS0/xRCexS72Au74+ARnw4Qpu7y+9a4vMljbWANjJlb70op8nblvPOau50XiPdU
         twYdJ2nt9m/jlQlW7rLiQ9o5GWrknV8F++KDC0ZBHqlAV10FM+Cy6EHQ0NhMe1jwGsok
         Bm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631579; x=1775236379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0TUDeYx3Yw=;
        b=D4Tu5tMtlYUtuhCqhLQxSjjCsNGMg3EDejlJPOTEIqfJYXl/PT82/uSYhb4IPph4MY
         PzfIFk6P0JEZPfLeez7VRHJKNnwDbcR1zBpycsvhmykEtB3q2cauhKOYx8bwMXH9AQ0H
         eNa+TcN9xSQMl5iPkw6cJXNG07qf9Iw0In2ROVAVK0aIUYrHK2Wzj17dSylnfzdqd3yt
         bxZhbS1hGaZUeYcpklf48GHQDLPkXJAovLx2ihRngK4I4+1L1ruV63w5sA15ERi7t7lD
         ZXSCr1XA/O2DtHW3qIQutI/oa9zJ6Rk5UXEGRx/No36v7VPe61BnePMrG1HiNCnKGKJL
         u9gA==
X-Gm-Message-State: AOJu0YwQp/otY2TlAV1/Thng9fmJxfx/hYrV81d3uhHHwjeG7+zubCBD
	y7wfFCXEXqIwkOVx2781DSRr1MO8zu2V5i3cHhuO+X2hj60CFTKYOnEsrNGE4xSwpV/E9gpCDlq
	8K/4bGflf/GaeeQ9ypF1Bm0jWJ91iTWOP31FFu6RGnEX+xWQXnLWfBotWOklJtiFQVVNt
X-Gm-Gg: ATEYQzz7kG46JIDaKCaiq4y/+QY8AZ1txHc5cAHjeQenwzJpKXj2QWbPO5EbDEz49R0
	9KtvtXSxqtayajD9y8JRsxehhSIe7U+cqB8iD/8RUbs1ZqUvs6lfK7zFmAjxf96tYxOu4d1d2dp
	NgXTMatYezVZaUjbxHmCe6+mlncUdijPY4tgzkdC5gX/0WjgtAzZHvtQMto4AfPztCFg4erxBNe
	hyhn6nTmUlzbBQsfel/zRmyo+86PCldrkhXkevi4MmQMbZpwJ1qd4lN7QyMDJOWR46pJCKaeLBy
	Yqz2Z0Yjwj3ETNPPnSx+MSI9WaY+3Rri5sbg4oRpcQHsMvNcuK/pwrsvm5o9Ns8DgA5COOX5lv1
	X5mY0IoP6QxrNHePj+uCF1s/y1I1w+4JiklHvUxv//bOhfFa/
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr3259545b3a.17.1774631578714;
        Fri, 27 Mar 2026 10:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr3259515b3a.17.1774631578130;
        Fri, 27 Mar 2026 10:12:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c964f9e9bsm2531517b3a.49.2026.03.27.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:12:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: qcom: eliza: Fix interrupt target bit
Date: Fri, 27 Mar 2026 22:42:39 +0530
Message-ID: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6ba9b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_UdXETfmjGnjTIlQpucA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FzjOOzh1CSv4hfWVAifyd2SpUSlhyI_s
X-Proofpoint-ORIG-GUID: FzjOOzh1CSv4hfWVAifyd2SpUSlhyI_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExOSBTYWx0ZWRfXxjQKnUi/dukq
 /V/w0D9z0LDaCOZvvH07knfrrzlsXTtdK9Dojz6zUv8khi3WJ9fQ4isIqwuBcSmyFNSamI8REiH
 ykV4EDpfXLTxJvQk/wCBiySt0n5tLCBKPG8Ly8qQTwi7wPN9N2OlowMJxQhcuCRawt7Li/24Klj
 8Eu6USJNm4i2ow0d3iqh4WGb+mPX03nQeC30FdtAJbcXv/6au1iEDTJuhPM+4qcEmdpxzhy27my
 0sREjeUR+JQq9nKRj6UQ6Uyra1cUtgP8fFXF01PaYgeKz8O2v3q7BBX5N1iG/m01e+yM/aOdosj
 uorzZT8kxAoQiTXgjbynvwpkPYiBpIQH0Od0my5SmV0YbnO5ZHGDP4Zmmo5xJWPDDaQP9YvfUgE
 pEradlW1c9D6mWQJGqTCwCOAVZ3KyfMEHdpgH/ZD6jKoqL1P3L5sid9hpltaCT7CCc5I2KPPI83
 T3s5N+ftJYj9xOQSKlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270119
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100388-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C9E834851F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The intr_target_bit for Eliza was incorrectly set to 5, which is the
value used by older Qualcomm SoCs (e.g. SM8250, MSM8996, X1E80100).
Newer SoCs such as SM8650, SM8750, Milos, and Kaanapali all use
bit 8 for the interrupt target field in the TLMM interrupt configuration
register.

Eliza belongs to the newer generation and should use bit 8 to correctly
route interrupts to the KPSS (Applications Processor). Using the wrong
bit position means the interrupt target routing is silently misconfigured,
which can result in GPIO interrupts not being delivered to the expected
processor.

Fix this by aligning Eliza with the correct value used by its peer SoCs.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 1a2e6461a69b..19c706137f81 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -47,7 +47,7 @@
 		.intr_status_bit = 0,		\
 		.intr_wakeup_present_bit = 6,	\
 		.intr_wakeup_enable_bit = 7,	\
-		.intr_target_bit = 5,		\
+		.intr_target_bit = 8,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\
-- 
2.53.0


