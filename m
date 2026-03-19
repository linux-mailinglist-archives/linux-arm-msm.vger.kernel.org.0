Return-Path: <linux-arm-msm+bounces-98653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKX9KhCru2ngmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:51:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C482C780B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA1573025172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A815A274FD0;
	Thu, 19 Mar 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/G85/1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340523A544D;
	Thu, 19 Mar 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906697; cv=none; b=IBjkWxUTttSybI3rFeMYksinZi8B9oBbLQcRmjVDkaw31Qdef8rZQYZbcclHrtQhfnRYkeoU9F1V+UdXnMGKmI/FTsHgQtF3iML/1owVk0XK8Q8mhoteNlBu58ucciAtLZvzP9/ETKk9gr+hsKl0sNzFg7v4fxBOwhtM7X1uXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906697; c=relaxed/simple;
	bh=HsPdkT/XxhPt2VDoyrS8fpbKJmxojiJUL/W4AMxMOwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Opr9sKQdIQQShYqjOv2N9/QKiU3KeU+RM+nt/SFsEQfRHnyjdtnuDaEcFuGoTejlQDT5YAVCoPT7bg0gyxPIgZEQA7ytFyIBa4bmIgxWJ2MyYuXr3Ie7aunCgpB5uxRbkH0jrLNSSmOJ+hwijAsG/5qf5kYHMoVsIs6AT0lXnQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/G85/1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uLJ1567072;
	Thu, 19 Mar 2026 07:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6uRAxO15aqXnWqxtlHhVjXIUeXwMhFjInoq
	+KSuY+jY=; b=H/G85/1aOuNilS1xhAK/RhxQGdiIhm71g8r973nokIovXjoqv/Y
	ZVE1ieXuolTxhFNFHa37Y8XazCI0rrp1O7LT080NQ48U1GjQSEB/YevGj8PibJmd
	Ao6TcDWrDFjGLwEzoBF2Ad2jlvFaAil/VLZmqEBXCXUlZOTz5tuqPduo1wq6Rhi7
	ZkcqpD9XtAnYo63f2IY9cXfpKbar9TCLbbsJV7S20VbmxNTAbBi3kZLc5MWxRsaA
	0u2+yFuFdUlut6MI2LN3DhJtVQgEgOE6WTvb+1pjbFqPIIZ83WV63ORanVKKYNOq
	vi6iMAW4x3IX5YQmDgXnPtzVpP0xf8JypBA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxgfud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 07:51:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62J7pSva019596;
	Thu, 19 Mar 2026 07:51:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4cw0rmqaky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 07:51:28 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62J7pSfg019590;
	Thu, 19 Mar 2026 07:51:28 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62J7pRh3019588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 07:51:28 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 04BC05DA; Thu, 19 Mar 2026 15:51:26 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v2] Bluetooth: hci_qca: disable power control for WCN7850 when bt_en is not defined
Date: Thu, 19 Mar 2026 15:51:25 +0800
Message-Id: <20260319075125.76539-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA2MSBTYWx0ZWRfX8UC+spDCqBZt
 w2GVOJKK3YbXWOat4EwV7H2gTdLBTnt36hzPUF5P9hDnqsmBa4KLIWb6Qi8TxpeYkC2Yb21f8Z9
 aCD22ZpCeFpb422EzW5FHfNLQy+xxf5G/xnXEDgtQCl310DZUHQq7OwNaaoPdO1KdfYoLRF8eLq
 6NLRIBtcU8llHD1CJDd6VHI8dPwCTOHFYldlr5zJUdWUgrc98phvyJeQzCpNtaCyD7ShwQHmCdo
 fuCSt1DR2CGxDycponGH9wIuSAWTrDSuIg+vs2y5PL+cgXWj9YHkQCZICxQ253Ny6sy6OZhJVBa
 ZFwOCHH0jRUDpJwOwSjoNNVs1Qj4plx5FSzRCxhipHWT3Z17Gn3DwwdOc8MuyBx5w+b5vnu3aSB
 fobhA44cjEx6LbYSC28yFlVQKAlqk1knAH2DzGK3k/06rocIXNxX6ffm4tB7nmUFZ7w+MPWqcMl
 UDdokfhr0x+VZihqGhA==
X-Proofpoint-GUID: uLd1zScK1VOKf4-CmcV14c33SUYaTr-E
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bbab02 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=98nF6S5uk-b2QhZ6SZYA:9
X-Proofpoint-ORIG-GUID: uLd1zScK1VOKf4-CmcV14c33SUYaTr-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190061
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98653-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 28C482C780B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On platforms using an M.2 slot with both UART and USB support, bt_en is
pulled high by hardware. In this case, software-based power control
should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.

Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
cleared when bt_en is not software-controlled (or absent), aligning its
behavior with WCN6750 and WCN6855

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c17a462aef55..4512ff7cd0c0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
-		     data->soc_type == QCA_WCN6855))
+		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-- 
2.34.1


