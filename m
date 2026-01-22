Return-Path: <linux-arm-msm+bounces-90229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HAjIhg+cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:11:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0D68745
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33CB13000721
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE8935CB66;
	Thu, 22 Jan 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZWEKDkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXxvHEmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED20831771B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094637; cv=none; b=RAfe9GyOcvioYfJ6z5rYvxzpS+PusRSqnP1kWfZKK75XHznUgod9eiThL5CxKKlBI37FuFCpgmqPCnjMfwbnpznLxSe5fZ0Qa/PEK+ydCDkdeBYDqrIkvN1EMu6qL9YzFh3hyg1AKCBl41KqARB9fFdB9dms5bpwhzUNGAWP2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094637; c=relaxed/simple;
	bh=qakuhgJFOhsktXcKuLG1qi8pNW3vyIf3X/6YJamV62M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MG1iafV7/PpnJ+NxMiqRWeK1lRU4aQOBSIlFPzcq0PjXCZTUVGVfmTJx6KJ8xALBFQcfS4W3ClQAZeD1CmM5rmMUoX0qFtkeAFz8VD2fnquqlyd5bWnp5Y+qVPL+NpnATuqeYNZZLTwtNqu5PAqzEtBIT0A9AhL06SPLLwfZikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZWEKDkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXxvHEmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7iwwq4058081
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVo87sxbS+T
	GdNMbO32QbS2nchEhayLU5oXeqbFF+GU=; b=dZWEKDkNTPg3g6rr+c7QOjAxx/L
	47F6UEnYyJT/5DJHqYrYy7AqGqZ4SBWOUVUAPU1a0VvtVaSrVeota8826qB9HgWM
	3JRU9UjseRi41sGffDQb7wl0ytODMdi4HD4BXVeiKRPnuu+VwJm6aZ2ODu0K/ejA
	8Sd1CWqA/q8z9IcH81rHkDoLNe1I5RqDWygxi7SmnFDtGdCqHz936A/v4oD+0+8+
	o6wnl1TlAw6eMThTw3lhjTJklgu7W/agiy855BIvS4L8VJfrsdWAXVeXrIsjMYAJ
	IcZ/xyhV7ZNhDbg7hL8Ol2xWxz63VMBiSlo9Q6j3s9xWlteinaScC759y+g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbtqck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so1920480b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094633; x=1769699433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVo87sxbS+TGdNMbO32QbS2nchEhayLU5oXeqbFF+GU=;
        b=DXxvHEmrvt8Ibf/7lY8QmyQWZeXE2kTYErIQLJVZZEG22x+8lo1tWruPBoFqJiIt5p
         yt3s+060qApY7WihKrFC26tBn6EIumPAXi1tTj8qmjF0WRPLr3MlCKPjrjWAo+7oQZva
         /3vfk0k+70UkQvcwmDAsg4O+4VNoq6xMmS8p7pjSFW9vyELcY/cZ/U4jbohAob7PqeSF
         XewUwJ07voWNnJLph1wEMNz4yk9GHvMZ5F3qd2an55ql4urIXzurFOgycEBtAgC8kW/2
         hIuU8gvD2qeSfFSS+x5UYmPd4J4OdaH93Euho8N6mrBDBpBcv0Kxyuo5F5KOKL1vy9hW
         J14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094633; x=1769699433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVo87sxbS+TGdNMbO32QbS2nchEhayLU5oXeqbFF+GU=;
        b=nBNNwr+eMfFfHr6YxQUtnRFjQ8BFJ1MinF3QciN3F8Bskqv5HagbB2OhtgC/R53lrM
         zovvaaQK6OrtZWfgRpD/576/KXwhJC3Ley810iIwQV1y8+oIZigPweb5c6hwDNnUhvfa
         IPYu/FntjHmPCHczkZ5EbUo5qPqaP+SohXWYyaFd+pCbqZ7Qp46WVw/5yKjk+q+L2YcA
         qJGpPB6om2Ns7vYoJcbWotynzYSFL599gzh5jEBArLkESxc4uKMiQIARrEwIJMbNKgea
         Sj6TNo7elHB0+DGmAkq6MtXS3S41VMIBzZQlBzDAwqclAvcDF+rQ8UpUAFe+7HZNsI0p
         PDtA==
X-Forwarded-Encrypted: i=1; AJvYcCWf1ZHK/anIjeCrk3rDf9n5eCiOshzyLemK+EtVLqxf2NQ+d8jzfGMELt3/oR3WbRujfKMccEzdiBAhfsbt@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkX4PLwTh0aW+TdCsJKRbSfwOngyNQVbypYzqBzD7INTvemKe
	Fffltj3AOHptLblsN1pUJN3T4p4wp+1sQ7mmgEz4h6++AMJYQzCaGwXj32n1WI56ICqyByg//Ev
	UOavOEDxTJissuwd6y5LkD+RWg4mJoLFz43X6Oo9JaZU+VsdwugIc0iPlmNEpt85N/Xps
X-Gm-Gg: AZuq6aIfdpFRXydMJo/6cLNa7kUG6QD6kvJ2IQC91EXRTMmskIZzr34ugcVGjT3Pey0
	h+ixYPv5qJbQTxp9Y8M6EN2dNSbEmFrcXfM0DvjtHCUf9qe0GNDOquKbXxF3AIaB6EaGgyjj2qS
	9j2TbMGCfvkmD5f51OiNfIwx1egX+dOcbbsuqXVfgHk7FcSa7Efrxwy1pwHCrK8D8s6uKeWI+Z8
	AFB2Wt3SATrMtwpgWDt6Ja6v/+7lFiJ0RlXsqDNtP5TQeu04e4oM+H7diMs1ZE/nuwV5bsmfR3C
	2BU0kJFlTWsyXY0jt7GoGg+eMkV/GpnQ+DsGkDinMAKp5geYer2kglV9Zu5IsBWdcLr34OSPgmX
	xUsEtBtd9D6VDDgHTo+F2dOSvLbNes01lMtxDbApIV0E=
X-Received: by 2002:a05:6a00:3cc5:b0:823:1679:49cc with SMTP id d2e1a72fcca58-82316794e67mr1629b3a.66.1769094632618;
        Thu, 22 Jan 2026 07:10:32 -0800 (PST)
X-Received: by 2002:a05:6a00:3cc5:b0:823:1679:49cc with SMTP id d2e1a72fcca58-82316794e67mr1604b3a.66.1769094632056;
        Thu, 22 Jan 2026 07:10:32 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8217c258fa7sm4328182b3a.17.2026.01.22.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:10:31 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 3/3] spi: geni-qcom: Add target abort support
Date: Thu, 22 Jan 2026 20:40:08 +0530
Message-Id: <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oJYMkTquvKBUPfHcwx8MruLXHomWeLXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNiBTYWx0ZWRfX4Uubm/qO8JR+
 MyDLDNNCXswUiG0dyLVci7KsaI6gw3UcHmUX3dPt5xmI6Ig8EL28NIGFUcB7i3upD5bYWhwn0ak
 iHegtL9zL11qZP8BxcmmSJ4Sb4cCheVQfhHnwAMEgj7NISV7r/FiZJO1HYpwDAKxmK+jM/upA1o
 +us5imknlzyfLtClWEwieU3TbOk07jsmE24fJOpsf9tH6CzXbujokGAkeYzcaIGkveUEUrO734L
 A02g1z4HZGfNo6pDhprSqlqdq7DkdyL0f08RvRSImf+WotQkcQQ1AU4DQwpU4BoiPwCv8W4pIv1
 sSsPQn0j4P3r314zyxsiKQajcbM+0X9cWmurnua+URdIDvyLE7UMfZQKenynYx1hPBMv1PEq2Xo
 jK5euYutV4awE+d7lG+Zsvxj6YGP6Lek9NMjaGK/azQoekearI81iM1AfNeNi0UwlYwPHhlscOk
 yEWXL87QkJofh9buuFQ==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=69723de9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZHV-9eCtjRHb1jRugp0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: oJYMkTquvKBUPfHcwx8MruLXHomWeLXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-90229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46D0D68745
X-Rspamd-Action: no action

SPI target mode currently lacks a mechanism to gracefully abort ongoing
transfers when the client or core needs to cancel active transactions.

Implement spi_geni_target_abort() to handle aborting SPI target
operations when the client and core want to cancel ongoing transfers.
This provides a mechanism for graceful termination of active SPI
transactions in target mode.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index e5320e2fb834..231fd31de048 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1009,6 +1009,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int spi_geni_target_abort(struct spi_controller *spi)
+{
+	if (!spi->cur_msg)
+		return 0;
+
+	handle_se_timeout(spi, spi->cur_msg);
+	spi_finalize_current_transfer(spi);
+
+	return 0;
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1082,6 +1093,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
+	if (spi->target)
+		spi->target_abort = spi_geni_target_abort;
+
 	ret = geni_icc_get(&mas->se, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1


