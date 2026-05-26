Return-Path: <linux-arm-msm+bounces-109882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B7vAIrDFWoAagcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:00:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE95D9378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201F03106976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA67F365A11;
	Tue, 26 May 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kulwbRtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqoO/4HL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42630C615
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808945; cv=none; b=TQ2tDda+HIjNGbxygwtkTlKA11c8F1/8C616nRDMnuvtqufFhsS3CNxfWHiRj4L61x4aSwTOqZitt0Rncw7i3E1l3GIuJhBoYJy3zlCaTHwkGurXfzF7zeIR+CJWu7mlCU3vblyR5M/sOOgtWTrmnnqZzXp10qSPQgEZb0MWxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808945; c=relaxed/simple;
	bh=ojCuWf0WdN6cQkJcMSu8UPppNodRoGO1opJyksBkn9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hmwyGH9wfLtdG21M9Cd4GwAgykVMES4S5sTqxC6sbPLQNjqXodRT1eOzjlg8fXiNY+gCNLysM3kxkjAvxHh4hLElpX+svv0KHUMgTBmJYKRsdzmZMnulKnOZUiQQ8DfINxwN4KPoznZqhrd4NBzGABnUE3J9vhW/lTNyoU0kh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kulwbRtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqoO/4HL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNZE2705430
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QZUqtRKZefgtIZPDuDbO3kpXBaUlSk1SO2z
	9HNZI5DM=; b=kulwbRtL3kLvnXK0NQfy/koV/FjjxJ0SgUsQlIUd5z85wNwat62
	5EP9dxspPIdebJclFCyLJ0oR9Kd1KoIoZ0fCdn4wpZHZAHNPvzpzCMH6eH0fJBmt
	z6kkUZ6tUGTHaTYGmZLntfTw3caZ3ZBQBBhoo0y59I6l3HeyAu08bCvvqewiiEU2
	vwaZ26T6cIgYQYWXTgohUXteB7euwDEovP6bRoe6Nw5bZsZJRfEYJm3dXadsv3E1
	M4zairp+Jdl8tCxWJdnPc5Xp5SinxgGERUxX1vfjSJIaO5JVeKnNm2DP4mmvls6w
	aF95CFv8uAnDmzBEwCsW15W7rknv+PnBW1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vgjjkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:22:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so10704675b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779808942; x=1780413742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZUqtRKZefgtIZPDuDbO3kpXBaUlSk1SO2z9HNZI5DM=;
        b=JqoO/4HL7qPa/F+O8fJOulZtHRCcWMui0zF3k2FONrKjyqvhzJ2nvO3AwbjqQQQk1/
         qYm0wkF/K5bc0Gb9TGLhrvQMZW3niG99RhTnQGyqm4e+JDM8UsEqeYuOJA3kkoZE+/20
         VJuqmNqY4npq+q90bl1BTRS7EOrNf34JKDYbOPIN6V2i0E5tedBJqee02tIwFWtGBnas
         +Mzgt4KH4CP+RTvp0knFOKz5BxZDVbPo1Vm5EbG6c+efDYc6OZgBeIaTSeYLBs0rLCvV
         psGB+IN7NLZZMhtAQuIoYP9VSq6Q5wi5GLn1igmiyip7Noveu8P3GxoZkIar8DD0mVdo
         y7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808942; x=1780413742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZUqtRKZefgtIZPDuDbO3kpXBaUlSk1SO2z9HNZI5DM=;
        b=EC35NOAr4W310YoeitU4BH28/51huQr9LV17kM1GBhiHF0ymSLLxjxLZqjyC5gjYL+
         qZCFmUg5GpTzbiIJr8Kj0avLkVfFMCJFPkKMI1ZaFYzwxnPFG3CQx+7E29h3ESATnnXi
         bhDdczvy0udJTIi2h7SQdyucrbSASqX6FOUKnXBMwDUTM/A8jITN9TpVLVkbvytpyO/g
         RratvkSUx9K0XdQ1y5hpkk/2Bl9OjTlmV0Ehaw/QDKvL8YzLgU1m12+AEclR3ygBaFgy
         Zu/Ul/osJuzC1DOFU8QBgdMwtSKUTx1lz82oKAfoiGAxcXyYYAmzJV8kG09c3MVU7Vw8
         AxCQ==
X-Gm-Message-State: AOJu0YwAARMAOHwFInb7ANUj3JVtEy1+uiOMm7VymL/1Yw/IZ0Igkosj
	AAiDiZ1Pd4CKE0up5nm7GPCXNH9YhEnPKKJX5PdT7g/OjCpEf4R2y/nmx3LPy75HsfnQdcpjzqT
	ZAJol5/wu3JrSR3aB6sRmgqBn02djbm9XqP7BWlpMY4pl54Bw3B+/kUW+4hzLRtX7nU4kBYs8qR
	FC
X-Gm-Gg: Acq92OFWztaoX5n4e2L9fRXUQEqcF/8n9ymvTTeuM/vfJ7fHcGx22F1tE8la1jwNXt2
	w4C9oxdYV/3Y0mOv7FAUNs0tR33KMMGFyNYilAFxL/j05cp6u9vCpYbT68IIwjIpv066qTVkU+T
	9KbGnhSZzKQLmLzpHDl7V8Z9PgU/AGQQg6YT95lAJkSmIsq3iyMXUX1p8L7DYCLAQejOz8qplyF
	BtJcAEOusAMtNUYluqtUPZJxP4k3DLEaiDMjopr1QgfElOGd55u11m4G3U0k0XfxdkoTX6KJ70j
	yU4T0XzhukueVVo/SA+ReftHeqwKHM9sKr5QDzRPhTT4ii0XVLmzORW9ct5LEdqErRtyN2LuxG5
	zTc+mk99cUTbitfQtvpotRfJP9/DdESYlYtO1vZNZL+9YMpfq
X-Received: by 2002:a05:6a21:32a9:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3b307ebd935mr20176989637.22.1779808941398;
        Tue, 26 May 2026 08:22:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a9:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3b307ebd935mr20176961637.22.1779808940753;
        Tue, 26 May 2026 08:22:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056dfb1sm10077066a12.28.2026.05.26.08.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:22:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Add sdhci-msm.yaml to ARM/QUALCOMM mailing list
Date: Tue, 26 May 2026 20:52:09 +0530
Message-ID: <20260526152209.618075-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15baaf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=YL6Xjd1eAAAA:8 a=-m-Fgot-FDDHAZpgp2EA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-ORIG-GUID: lbShnNQrgjwTQIDtmsbNMl_A2eycP_H5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEzMiBTYWx0ZWRfX+WEuoC0IqoNg
 ii8mZUkzMh25XnlmF9qIL264eaDKc9VudVCibpQcwTL3lEQtJ34/jjCDEUpDgsluV6SZE+QAm+s
 U0crHOi9SJqfEgExJM1VAROLa8hE0Y4ToDlfP1QHLUS6McupoZdGCtlmEQ5PmMTUALUMK1OZ6ak
 Gy4shDJZKL3eUnJ/oE4+X/+nR6A3StIhk1qNt4KZOsXcw1oA5O7KJ6o/1xEctDYDPA6Ihhe/i3u
 jt5ZOwiDldy/igY6uT/gMeE58bUpfLWzSpQP2bek5Jqpm+BN8E63DKLdlDFKmwB8Kh7yI3cAzmI
 stnOuKNhnrlVDJFWC4FgURBnk5w3rI06MdCtK5Xba5DakhdL0j5ItLbd6ywoNxJ9KAMVJoTcEgc
 OyXec6MmXg2sy2yIkj9Fam9cJggCa5S89DmnQVdiAApdFWvkqgQ66NCiuurR7tXkepuvDwz+5I3
 CRF5yMaKW+OHQilA1YQ==
X-Proofpoint-GUID: lbShnNQrgjwTQIDtmsbNMl_A2eycP_H5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260132
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109882-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,get_maintainer.pl:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ECE95D9378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The file Documentation/devicetree/bindings/mmc/sdhci-msm.yaml was not
being picked up by get_maintainer.pl for the linux-arm-msm mailing list
because the existing glob pattern 'Documentation/devicetree/bindings/*/qcom*'
only matches filenames containing "qcom". Add an explicit entry for
sdhci-msm.yaml so patches touching it are correctly routed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..d75cb6e5a9cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3343,6 +3343,7 @@ ARM/QUALCOMM MAILING LIST
 L:	linux-arm-msm@vger.kernel.org
 C:	irc://irc.oftc.net/linux-msm
 F:	Documentation/devicetree/bindings/*/qcom*
+F:	Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
 F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom/
 F:	arch/arm/configs/qcom_defconfig
-- 
2.53.0


