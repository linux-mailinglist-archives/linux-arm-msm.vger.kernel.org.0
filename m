Return-Path: <linux-arm-msm+bounces-93662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLzTGsQ4nGlCBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:23:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F9175719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03349305C8F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D623135CB8F;
	Mon, 23 Feb 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+i+N5+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5UUzfD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765893612D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845649; cv=none; b=OCu6vQPJgdLTvAX2f5a0uhjggHpQi9WbG4sOrJyI710vlX3hIkC9qFO1+kv46+WBegVpOcVHhm9JfsmXAXy/Qu9YkGE57a6pTOh+mqXRQl1rVuMelXl9pBv65Gw0Q16+m314poxkWHGxNu3Az3pfnIuNMYMLequkaeejrH7qD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845649; c=relaxed/simple;
	bh=aUnWFihU3Y3aaf4I60mFWgmBMoso3itjJCRkw9uXtOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlNtpPEXNSQrYtIPGGE+w7bcFYTQ1+2L6Jm8jpkxYs1MBFC2TcVTA9NSYeQspHzKX4d5GiKIU6oDPwocKi/jXh34KVvavYUai5fzXvw2t6QcazZIz4fNWwt3hhBDH/pyks1STlhmqUh+cCC9npdTQAa+8KZmIonryuFC8eMe6RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+i+N5+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5UUzfD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N95bxa1427508
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyb6+L4tlMbV6pYUJLmd6awL6PVi9mww3PT0E/Ez/ec=; b=m+i+N5+7h3vYLA+G
	B7lx60TwPCoaWPCyZkfDR0P9ERdHSGEI4PMw2bIdfbh87FPhEYjAqPEwa+H+jfp4
	y3KIciYSvaKximHf0uoeCYn5QsTxQ3tk8kKQjrh0LgWEDMf5v5Bw87QJc9QkJW0M
	jjyYOr2mIGquYjWK6VWftr6p8d0fPGVtDmNZEorfeQDRlbDGOZ+em9526oPI7eav
	XoDmmiHx56rHp9+xHvUCJ1US+MuAzhMg3O8MU4AvtR+lXfHlGn4ADuv9uTLUPB8L
	8JAzxqxPqeqAEH/kdy2qid95UG4F1Yixkhy35NeL1myu2bYFYkNu6w/mSYngROiq
	+R7Dvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7vh59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:20:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824f75913c4so1899225b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845646; x=1772450446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyb6+L4tlMbV6pYUJLmd6awL6PVi9mww3PT0E/Ez/ec=;
        b=J5UUzfD7Uhz9QGiTPK1RpcEpn9rQ++iMT5ZyUsgcm3w3XHAMr5gl26DiO3C8kMqSIv
         4G14oTcfeSTboyJ284v/iKheXHEXFdLK+7LM8HPRkFiNhE/PwL9Y0wIEXQoV93fwa8Xp
         wZZE14ifEYB8vwKxHLfU6yDgAzGDtlGznfDC0t+8ZkHIng+C7feklO6iIE8j9TUXwGuF
         HVpuZylHOvmqXgY10nBcsC1+BqfFgcizWm/s2aKh6XV3/t0idHr99sFxIKubhPIJaPIY
         VB7IEGZYq7nWfD13LZKsggv6+FPoHF66xeibJtRwxXJZk6CMxCQ5EBwhNgURvwQzcucJ
         lrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845646; x=1772450446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xyb6+L4tlMbV6pYUJLmd6awL6PVi9mww3PT0E/Ez/ec=;
        b=TOJx/NDR2OunrZqjSoewJcVuk+jJlPaLKzThvEvObx6vYXlymu5kTlRbO0LZs4O1dW
         ndRVi8hFDbx+WC9S3jUdKSvCxFk/0f/gj2oKq7yvxPU6ghChFI3GRNhKlPU+9tgrkRFS
         8387HAWuVYm2FXIW3TanwmIHVEHHd3/XOQxBUsbRkIJmBdqrHXfj29HWJmxo/TLR+Emt
         QT9OqWkh8/+vBzS54BOfDulfMTIsDPsZ8Xbe8UD+4hmHdNXh2QfueYNqG2rerwd99ZrB
         gOuEJVrl6B8MVqVEARfBZy1RJtxkXhCLEWanCw2E4Nrg9ii3EnvXMpOZ91i+tFs/8ppD
         dgeg==
X-Forwarded-Encrypted: i=1; AJvYcCXfxwe2CzsO4+Ww4qT4ql3Tcj2Ud/cz13aaFXmTSMnv3+U/YyUPdg+sj3vLHQfNfO6rX/EXeGyiAnaXADYw@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3edUS467Axf9UV4a3i9fAtOMlMsmHSs00vNcv1l3u1EB0pNi
	eBcnCLMa0cVmrEXMUMBdR+y4GhAUczIBoBgTXJUFupI+nO6f4l/SfMc3P02wyI1WRIqIFE1QFeP
	rAtIdilLt7F/g8GqMpr0a6HGp9jA0iXl290CrEHIxxAnrciaSdxB9PAQurgbZnTaTUHL40zWk+F
	fy
X-Gm-Gg: ATEYQzw3avI8f9jybLDEC4Y0sPDxUN/PJjx1bjmEIWzFHcVO6L0QVUJvxtjIqJUUK2K
	UKZ1PJ7aZl82N0YTu4pjn0fa9KTth6AdCvcUkon8VHkKkH9cgHhsFrTU/VwRRAxpQ0mzI+taznZ
	5SRfM0n5Q87KGBUueV5lpJKU/uPwAHt48ztMFySCZE6Kpn8poCbC8LAWzW8HorLzPb6IcPbToMJ
	5hujdmoQoXAUGUqgIwQxE3mMm1O2ObU8NuXPdHQJSQb4BjdEw0Yk/nw76kKISuRH4NXm90aVQTm
	vSegVMH+kc9AXFspjhmTIUyKJVlqmjTc8eLyxKEzyWYIJU4gfo0rimnz4dROGUFuUcFIEa2KKoU
	ow3HOUMTJx7W/8nCV343gXBetQfoAJwiF2N3he8AawPneGySiCmZEKMvk
X-Received: by 2002:a05:6a00:22c8:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-826da912406mr7327135b3a.28.1771845646114;
        Mon, 23 Feb 2026 03:20:46 -0800 (PST)
X-Received: by 2002:a05:6a00:22c8:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-826da912406mr7327112b3a.28.1771845645586;
        Mon, 23 Feb 2026 03:20:45 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd899386sm6744057b3a.43.2026.02.23.03.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:20:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:43:30 +0530
Subject: [PATCH v2 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-t_power_on_fux-v2-1-20c921262709@oss.qualcomm.com>
References: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
In-Reply-To: <20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845636; l=3597;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=aUnWFihU3Y3aaf4I60mFWgmBMoso3itjJCRkw9uXtOI=;
 b=2EOfI/bdhsjDYI3Gbxqc7xIt1wgjIgDQVQ/h4vS+GkKXHCa6G+Xe2zQPRnzHm2BSI64/OW7Xm
 WXzRJxCC54pAlvK3KtJQ/Q4uKJmk7yMLgtffJodpuWa9LBaFyf/5qfL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX07eCGImNAY6S
 DqWQKF5A4d+sjNAqiCWF0+ThTRZ8sr500u/TKtsZJ2DwPG4v9qnnEo/Gxq0+MNvxNqq/XEJhqhn
 C9qqB8mgN/tTaAe2ehwGpNffL0U1RHe+CIKUX1TcNGo1O0CtYp9P9VJeACRZ4O0NBBHoaDGxWlD
 YL+3T0cupPXXMx7o2mMHn2+S+xF9ZnKBGMTmpvigGMhYUfbnP74aNgKBx7W9VkFj+XGWG2uok8P
 bySVy/Q97H+c5tp4jsbpck8+JNAoP/3JsbXYHfzKxZSiV4ZAZvJTe+nq7iWu+z8EP9EJXk+u5Gu
 KxB5cchQBXKhbq1Io3jLOLGDNTaZ8ruNLYTNZtiC2GeBSgVTVsWb8GY3534Exl6YcyqnaL3zvAG
 ZQN/WShxAmTkhFHvYtuTTqo8UsR7YdWk2nhLY3J70XYpw6ym4lrPk55cytZcXHPxLdL45Uw35RR
 Zk2eU4kBnIzkUqT+Lfg==
X-Proofpoint-GUID: USXGu4dTtV4280Bq8f3Tt6SmfGkysffA
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c380f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j3416i00YO8nPnzCGbIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: USXGu4dTtV4280Bq8f3Tt6SmfGkysffA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E07F9175719
X-Rspamd-Action: no action

Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.

This helper can be used by the controller drivers to change the
default/wrong value of T_POWER_ON in L1ss capability register to
avoid incorrect calculation of LTR_L1.2_THRESHOLD value.

The helper converts a T_POWER_ON time specified in microseconds into
the appropriate scale/value encoding defined by the PCIe spec r7.0,
sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
to the largest representable encoding.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h     |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
 	return 0;
 }
 
+/**
+ * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
+ * @t_power_on_us: T_POWER_ON time in microseconds
+ * @scale: Encoded T_POWER_ON_Scale (0..2)
+ * @value: Encoded T_POWER_ON_Value
+ *
+ * T_POWER_ON is encoded as:
+ *   T_POWER_ON(us) = scale_unit(us) * value
+ *
+ * where scale_unit is selected by @scale:
+ *   0: 2us
+ *   1: 10us
+ *   2: 100us
+ *
+ * If @t_power_on_us exceeds the maximum representable value, the result
+ * is clamped to the largest encodable T_POWER_ON.
+ *
+ * See PCIe r7.0, sec 7.8.3.2.
+ */
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
+{
+	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);
+
+	/*
+	 * T_POWER_ON_Value ("value") is a 5-bit field with max
+	 * value of 31.
+	 */
+	if (t_power_on_us <= 2 * maxv) {
+		*scale = 0; /* Value times 2us */
+		*value = DIV_ROUND_UP(t_power_on_us, 2);
+	} else if (t_power_on_us <= 10 * maxv) {
+		*scale = 1; /* Value times 10us */
+		*value = DIV_ROUND_UP(t_power_on_us, 10);
+	} else if (t_power_on_us <= 100 * maxv) {
+		*scale = 2; /* value times 100us */
+		*value = DIV_ROUND_UP(t_power_on_us, 100);
+	} else {
+		*scale = 2;
+		*value = maxv;
+	}
+}
+EXPORT_SYMBOL(pcie_encode_t_power_on);
+
 /*
  * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
  * register.  Ports enter L1.2 when the most recent LTR value is greater
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..eec16fdcb9996ab0f663f4587a2367a676a49ce6 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1911,6 +1911,7 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
 bool pcie_aspm_enabled(struct pci_dev *pdev);
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1923,6 +1924,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
 static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
 #endif
 
 #ifdef CONFIG_HOTPLUG_PCI

-- 
2.34.1


