Return-Path: <linux-arm-msm+bounces-91474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OL/D4x+gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:38:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A6CB134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1695830168B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6594235A945;
	Mon,  2 Feb 2026 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUNPVmvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IF3tgnQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EA35B638
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028625; cv=none; b=E8imlyaPal+Zxv6IHHdHp4wmiY+Ur+SnXpV5dNOLzPL3FZOmmUNyORLkaKkikQCRNK1QUZBK9kmwtNdiPDoDT+9LrpH5VYJkxtYA0EAmkKtemBn6blPl+hzdvaRSv45GWAYb11eHvf4A4hFtil3RUfxxUxE7SxbUZiTf7nV+Wok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028625; c=relaxed/simple;
	bh=erqBIFuYSIdjukGBaeGl/Cm2xbumvLFAHxWuKNHGZ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMjrdm1Ka9Bp2XA6opxaRVc3zKLqz2UfJJkUk4aM2xfDOO893Q5+Clqr+PKBjebLJVQ1egxMP8ul/yL+wkccE3lpPTIfZf0Vi8kGU95lrt36+HRyCjx+q3e58sW6DqELQsbnx3ALKcuWVdoCnXHDFf6+c3UZvZI4euF1tEUFdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUNPVmvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IF3tgnQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127tWmk720453
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OcC7m/MbWT6
	eoBPZbwJt1gNumOZ4T0HvfoB5CGCDuDw=; b=LUNPVmvouAiUt4atGh5naSw8a24
	Xffua5sIWMBS+g1NqQ5qRffgyE8g+aiYDoYzZUq0Dh5TDqwTwpTWViJYrgbV3wjt
	o/8j9/mtQFIO2JM/OeL63bQFV1sbm1OwCWJXymW3h4mXX1oHlAePUj3mVl1aCnFI
	1JivFYoWnpUA9T1GS7IeP6JbXf9K1aUNE2mkvwkUzZ1dte14MUZ/00iTTVTDt6Sy
	i0j484BoRsEPVucva8nNEGb4eE34GayvH933ZLannGsTpzBYlBr01gpQ94J2VI9Q
	vfKftIcrKCzkWwR0n4cjzr/e6yklJkA+dW9iaijKuQnl5pOtQQbI4+hST5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw4n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:37:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso11693587a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770028622; x=1770633422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcC7m/MbWT6eoBPZbwJt1gNumOZ4T0HvfoB5CGCDuDw=;
        b=IF3tgnQn/4Yz/ECpEwMlH2O8YcBPYXmjJVzkbuuChbR64tSQjkuhgh6ZUCvLvx95z4
         JUMyTLu/z7w+t1wYc93mBq1cU5CUWcPz6zfLsKNP/ZcGUk6VO/l2eDdbs833JKw6OOaT
         A/o0/BKeBDWtV3LFAxr2pOq+wFJ8N14DLB7wVXqwcAWHmU4sQwomkGlapF1em2UwBDHP
         7srYLAv6obDlZIy269Hq+uopzitAibbn+vbtNvq08I+KZ9qmVeRQxKPq706Mm148IZCX
         5iXn3HDQEGZTXgb9sJlmzLpaipioF9xk9hEeR3P47wM8znDqRD/a9wht9tvNkgQZDfjC
         GVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028622; x=1770633422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcC7m/MbWT6eoBPZbwJt1gNumOZ4T0HvfoB5CGCDuDw=;
        b=ksaNQmOELBh7ykUemWYdC9ZqHNXC7rGa1t8jFSZHG8mRHVcMEwcc2xT4XLebnO7ssY
         u/y8KSMyfB/qe3INrCQZAzCXYLCycXm+yLssaOgVIUb5O8wv+FTU+5iQRDHMOggjDmMk
         uSf9t/135ZDO4t9I9FLIqzpBobmktVsnRLbQ/samnZ7B2GkdUuWLDSSjwh7e7523a6JJ
         ByKOTRWSzXk0Rhd1UDytF0xj6RFRGRUINaEI4Fj3KtFInDrFI9CViIeyQjMoMk29eEvq
         X5XdxKvm0duxIyQEYRwupBmwd4mNWak4fNyz+t/ySEAlSjTbrlbIXTnCqRHWdrRtpilb
         P9PA==
X-Gm-Message-State: AOJu0Yw9Ngv3sKWdku6TrKRB1F2Sny4F7cTDeRfs4K7a09ifEeeKkxE6
	i649HxO5DflGCMVLTzjuEBYl+teOw3S2g1sgLlkZL9hOhuWyyyJ2eVaCJyrrlhtalp/09CRT2CG
	WznjjdGPMhVn1r8UmBDId7FOJeSdBiAKu2pYfUrKCb8t/gFGPDHQVBLAW7vTvE9IkE9Uy
X-Gm-Gg: AZuq6aK83Ohj+jwhtIdJl6W1CN6AOoISVl5JGeHMnZxOVeQIInOnBxe9ejBuQTyV5D4
	CZz/gThlfZuVos5qARRlPXMKdnDKD8g0wFZph5U3CC/IWk9Ejx1LK/u+Nl60m1C/kG7ops7S8FQ
	ZLeZ19caspjn0jvk8x6UOlYwl+N4JzfSObN02OY1kEa6QLEZCCkcRyIkl/gqE/OYKhhZQfifLfJ
	M2/k29ugusTESBxWPjKeMDRoBdFO08uM8jHNtxp8dmBUOHBvmOn8XBRetkfHMnLwwsd2temrerw
	7LMezw530g6RfVp3JD5JBRAihi/CD9Lu7qSVj3Q7W/KStAL5ZvDXUoS8D/UAJaKaXh+0anRUXzE
	vBUernLFrkvDU+9o4ZYOkbwRSF8l65U4gxba5
X-Received: by 2002:a17:90b:2e47:b0:34a:b8fc:f1d8 with SMTP id 98e67ed59e1d1-3543b3e3a6amr10994104a91.37.1770028621583;
        Mon, 02 Feb 2026 02:37:01 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:34a:b8fc:f1d8 with SMTP id 98e67ed59e1d1-3543b3e3a6amr10994090a91.37.1770028621084;
        Mon, 02 Feb 2026 02:37:01 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d4fc332sm4907106a91.3.2026.02.02.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:37:00 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/2] soc: qcom: qmi: Print error codes in failure paths
Date: Mon,  2 Feb 2026 16:06:41 +0530
Message-ID: <20260202103641.3003867-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com>
References: <20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69807e4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dDuzJLjRrGaJ8GpUzEcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RcVeHMa_D0DMe7zSK6FxC6VSg837TCt_
X-Proofpoint-ORIG-GUID: RcVeHMa_D0DMe7zSK6FxC6VSg837TCt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX7+Xm2fc7WV4A
 y6+7QvgqZ4hEYs+dkYv1GhqIXHRFbKQWUIcjIwMbxveQVm2+IGedKKroKBJMZQNZEb8HJsV6mFN
 ijM/9N2y1x9GNIHhLqaNSVnRsoIrcBH1frCsVZSLOZPWHUBTaLj/KhCJrQq7OeeI+8c1/Upt6T5
 9ORtLTT8XOywUilIgM/nwNwSmjsoMcVm6zKJg6AyNl/XbRyc/TqZrRgGbxdz9tyINv6rGoq65MZ
 x9a0e5kEuv80yporjnDl2IJ7GpDM3UENvd0QvTrohxGOq7KTc/e2KQvAwF4kaCcgkkutge83c6+
 RA6EDhRmyfI8cfWNSAbjFVwamojlmVJiwECWdxaPeJ2sOpCU2qNR9BEixpCISvksTXIZXx3mHpV
 6QCECi78Zpn9yGFiwc9qk3KqSUph2yGFES7SlFeiMpuXRaMJxk6tv+tYmtuX8mMUu3VTAAXkWm/
 vppxEwnzZK4D0FZX0dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020087
X-Rspamd-Server: lfdr
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
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91474-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF4A6CB134
X-Rspamd-Action: no action

Few error paths in the qmi_interface module log a failure message but
do not include the actual error code. Include the error value in the log
so debugging failures becomes easier.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 -  Rebased it and added R-b tag.

 drivers/soc/qcom/qmi_interface.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 6500f863aae5..941612b1bd2e 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -321,7 +321,7 @@ int qmi_txn_init(struct qmi_handle *qmi, struct qmi_txn *txn,
 	mutex_lock(&qmi->txn_lock);
 	ret = idr_alloc_cyclic(&qmi->txns, txn, 0, U16_MAX, GFP_KERNEL);
 	if (ret < 0)
-		pr_err("failed to allocate transaction id\n");
+		pr_err("failed to allocate transaction id: %d\n", ret);
 
 	txn->id = ret;
 	mutex_unlock(&qmi->txn_lock);
@@ -413,7 +413,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
 
 	ret = qmi_decode_message(buf, len, handler->ei, dest);
 	if (ret < 0)
-		pr_err("failed to decode incoming message\n");
+		pr_err("failed to decode incoming message: %d\n", ret);
 	else
 		handler->fn(qmi, sq, txn, dest);
 
@@ -502,7 +502,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 		if (txn->dest && txn->ei) {
 			ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
 			if (ret < 0)
-				pr_err("failed to decode incoming message\n");
+				pr_err("failed to decode incoming message: %d\n", ret);
 
 			txn->result = ret;
 			complete(&txn->completion);
@@ -661,8 +661,8 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
 		if (PTR_ERR(qmi->sock) == -EAFNOSUPPORT) {
 			ret = -EPROBE_DEFER;
 		} else {
-			pr_err("failed to create QMI socket\n");
 			ret = PTR_ERR(qmi->sock);
+			pr_err("failed to create QMI socket: %d\n", ret);
 		}
 		goto err_destroy_wq;
 	}
@@ -766,7 +766,7 @@ static ssize_t qmi_send_message(struct qmi_handle *qmi,
 	if (qmi->sock) {
 		ret = kernel_sendmsg(qmi->sock, &msghdr, &iv, 1, len);
 		if (ret < 0)
-			pr_err("failed to send QMI message\n");
+			pr_err("failed to send QMI message: %d\n", ret);
 	} else {
 		ret = -EPIPE;
 	}
-- 
2.50.1


