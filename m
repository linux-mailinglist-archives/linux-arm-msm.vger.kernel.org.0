Return-Path: <linux-arm-msm+bounces-109610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOqBG3gYFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:38:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520E5C8BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F08B300B9B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B942314B77;
	Mon, 25 May 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRUCaEyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvBC/bZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CF3E5A2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701846; cv=none; b=fpjBSxtrb1Jf0iG1LbrF3AcaEtw+8QcKlmYBlbHysS+TubwF4EeFxTIWU59YlxNXnnquIC6r+UdjobR1506bNV4Mn2spXWFkENqQT4RcCSqTe6f2yOunrmoqRe6E9kHdt4ZAAaUCbX912HpzBBDH2FVVzz+Og12rCUMKXJON7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701846; c=relaxed/simple;
	bh=2sSrX1lHUIbklYcy6/GSgH+cadQVBFenAtgQ7eJROpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DeBG1QzYRPUKBsaVXM0ya4Pd4IPn9eotMN4/Ck2GSO/77BSoJukr4Z+/dLPnAjt0OJ+JpijDSkB9w4aJ1arOj2AbEEpPU3h+rDhnH2hvcP6nXveXnhKwLWv6EF5GNawEUio4SU4D1HEsVlZowkninOGtgtrN3MqxwsEfKbD0XNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRUCaEyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvBC/bZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7POW61518829
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=04OH1Ihi9gMbP7KdGAKPOj
	d1WVtj0BRKf+FMYmummD0=; b=DRUCaEyQ2E8kIPcVMeUZ2DsIleIfnFQ5KGbWry
	DQMtAm4vmSCftX3/CBaJd7I9k3IpUUtHxFhErJqM8n0Up/7k9kM4oxjwm8a9OvIJ
	mllFyHAEzSBhA8ekytSSmSaGs5u4xfy1ItfkuG5GVP4gq51VZcBd4W661YxsdmL2
	y+hWZhpAgoyM6pHBUdAqbcPtJereePS5vAF0rbb4gHCsSMr1QJQlSEClBWceRIAt
	pjyqlhMJTEI+pcRpxhU/omArJcZeezizJdzbhedgj1Cyl/AKqTJxaFstG5DzbJ4G
	421OSxT/cFGmwZUcNMKEsasxk2FqYtiIg/5UnlSIhfKTc3pQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txp2sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso8316801a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701843; x=1780306643; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04OH1Ihi9gMbP7KdGAKPOjd1WVtj0BRKf+FMYmummD0=;
        b=CvBC/bZbNNcMjKyvumOE2KA4U9wcfTe6U9iEfCxYnEyzJMLvUSCzEUlp6togi2wcgN
         +JdYx6BLnOvTvJAzbsP2LmE7w7fRoIRa4GL0iMW54XvlY6+6uLdpzkKogKDhaMEj97NA
         kVu4pnXBAuA08Y/FWk5eJqsbOuzWPiIq8n8VudMSH78N+N2oxjcLWGiWQxv9FsU+nMP2
         CCm42M2WEcnv3vknDs89qj951d/6lz/ix+PpBHlL2e5Z4SKFOGLpJ+TmduPVgb7SbwSQ
         BbQ0tocbz5mq+LMQaEaAbKMCd3tV92Q5fk9jruRgYtC4FpGzMICsZZW3/QGmYP5vGMZb
         Zrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701843; x=1780306643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04OH1Ihi9gMbP7KdGAKPOjd1WVtj0BRKf+FMYmummD0=;
        b=DM69WTDVmSgVQVCOxA7rjEwUh3VzcAg0omwsHQalruQ7QlTLVIpIj1g89/KcE6/FWB
         QPHmFoFFPmhnLLzccbHPZ6NvfqIUpwHmNU6UNpqTxVLI+gltqCcEn/chXIAfHS0g0JqK
         jntxW39cYxLr/8Jo2I5uR90IW7kP5yb1r5Pf8vdv8LoWQdh3CoBJ6yRohAlnxa+c5g2e
         RXbSwvtT+RIqf1VqqoAIDA39TQNzy6cWS+5NDtsMILGWgHY1wEZX6Rk/2phGSQztXdqQ
         RLus/YDrj4zJk6B0q8CCM+o6WJQPUacPi175xNDnVyWvcmCwIfby7amUCAdNVozVYOFv
         SBYQ==
X-Gm-Message-State: AOJu0YzAJ3A2S1aqZNObSj+9Fv99ZkS18YueaP090W4Q31GRyor+bDkc
	h3JAzrL4zZBixFafurXBaa48BpOwIFPvYNN7EKQwoRkKcZpgJrrs1DvcHaTWLv5uRcz+ZnEVgYn
	Dxs+MZ7qb4LMJEInHbVuKK+wKsp87JNtEKjWxZHu6H00w4ixUZrcPrxg82cd1CqdpKvaU
X-Gm-Gg: Acq92OFXU7Pdw06+0HsrrmH/S+2APkeyMsQuvzo8tRjxElW6DoyoIDFDwCHCcnPkhYy
	PfLAeBCPao9VnLbg5VRm0Uo6NRvVqnlu8/k+VBuZylFhHTCDtCRlchdxzaf+BiOS4aL98lG6U15
	FVwLjlM8LneHWZirTVTuQKRLnG53g5Xem8k+5I2f6dbMmbNpURTIPvJ2FPMJVNTrJYugfT+0xAH
	77nwgMKuSG4DbUU6yZbFEKncK2Kcp20KvF6+UA9EX1kj7lhPDZcMR7eBqcb8Y2BzxKpgJyH3TRA
	E1ab14wJ7XG9kr+6SLktiKCBb5Ey+fjFO2UR95BNwu9SE5XtZiMP5OVKkyBbD/+9zsk7gNfs2qq
	6VH7wFbH333A9kleHeoKOzZwwjlLEQC/xTIS1tM7jOSMlbKkjjIhoXw/s5D3CXuPTxUOSqMCuu/
	O7Cq3BSxTb9ekNlW7gR+1Ok/fTuiznsUBmRDEOg3kFjkLSyS7k1KD2/D5T
X-Received: by 2002:a05:6a00:e11:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8415f6da19fmr11742335b3a.43.1779701843362;
        Mon, 25 May 2026 02:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:e11:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8415f6da19fmr11742312b3a.43.1779701842884;
        Mon, 25 May 2026 02:37:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac99b0sm8873842b3a.4.2026.05.25.02.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:37:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:07:17 +0530
Subject: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEwYFGoC/yXNTQ7CIBBA4as0s5YEKdSfqzSGtDCtowZwENOk6
 d1FXX6b91bIyIQZzs0KjG/KFEPFfteAuw5hRkG+GpRUnTTKCEpPo5W2nmOy7nG3NIfIaEsoGb0
 4yXHSx0Pbug6hRhLjRMtv0F/+zmW8oXt9q7BtH8Ctsz+CAAAA
X-Change-ID: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OCBTYWx0ZWRfX6KNWlN2cba8n
 g+ikuZx3bL6flIt0hT3qrWTFGbNFfGwoz9plfXbLca0qftTE+YFsqTlMTmx0GlpzptiEDqZgySG
 N0hHF3K3515uurR4lFae/w3knoo+Ra01ql5Old+CFkHQgW3dphJgFR/uitDvgldU7P+7ViMNio8
 SntRlWKujQeXV2CobwNCO/kxb8CZGIcY3W3cTh6n+RfssY8k49u6QDR75UHOKOsGmwP5LvWgIMV
 4k7rH+0z7YnKiA95SqjZ2aXY+DcBh+NYSmdPZ1sXLkyK2XcLT0agkFl4UziUB9A57XTGpRI2rIe
 6pbWHIoIsfqJD4ezWFW3ne3F7hLasyF8M451wJwYyLhOcOEFL6bfCopS9DnPM5DdsGueAnTrgDR
 xkRG9/I13zQ9bqLDXnhM3RU3HUPP1heFcQtCUpwaDKAj9S+JwRDvw0zHpOm8rbpA879z8RafknL
 5oBoZQOVnoMPMVa+O4w==
X-Proofpoint-GUID: rHQskx6Hbb7ySJRN7eXPAjHLVe2m6XbI
X-Proofpoint-ORIG-GUID: rHQskx6Hbb7ySJRN7eXPAjHLVe2m6XbI
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a141854 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xjaQWaglaTHDcvof_gYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109610-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1520E5C8BB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that Linux has the consumer for the GPLL4, drop the
CLK_INGORE_UNUSED flag.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..3ddd4b3aedea 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
 			.parent_data = &gcc_parent_data_xo,
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
-			/*
-			 * There are no consumers for this GPLL in kernel yet,
-			 * (will be added soon), so the clock framework
-			 * disables this source. But some of the clocks
-			 * initialized by boot loaders uses this source. So we
-			 * need to keep this clock ON. Add the
-			 * CLK_IGNORE_UNUSED flag so the clock will not be
-			 * disabled. Once the consumer in kernel is added, we
-			 * can get rid of this flag.
-			 */
-			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


