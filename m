Return-Path: <linux-arm-msm+bounces-96785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KzlMzmjsGnQlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FBF259219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B3DB3023D48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B83F37757B;
	Tue, 10 Mar 2026 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3k9xC2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8YhtFCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2642DB780
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773183790; cv=none; b=MzNeywKP4CYR31QOy0tJ2wAfMyhNtp/tsnl0v3U2+5KWuSYCzOZgqGpDsHs6YQksB+1e2uOKOupkEkoD4LdzpnrvrbHX+5m2gHS6Um6knsxHv2RbgtSXT2/6ksSQZbM0DZg3eQJCO1LGryPR3z9ilQpd+LTaXLNxTMgpHB3li6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773183790; c=relaxed/simple;
	bh=NCr7CWtfAODxD26EjaDhYPub6MJelC/d4IOGonNL63Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwuOyEhUxB2AurZKQdO4bwzjRbrVNvp4dnJ4y/T0MtcEhEYMUPub7uDSp+IlxUEPLx+l0p9XMXuZ+jIxsNmfP0pVr5QYQq14BRqnNMcymEZktiMFvwa0e6y5eXBCh5E9xoCORT46xBulEmBVGmhHA9ZAyjbfKOrr2XbcuqubpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3k9xC2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8YhtFCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIreFn3296079
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11UQng+3pfL2wZggMDKPKaPFC6vPCY5zu9oF2jTjjxA=; b=e3k9xC2tPkfrMkBT
	SUM1ORpLnMa5V02VqCYi+ZX9j5MID3z3LDX9VRHLOD1j2fh0eGxjX0QgYv0tyhLW
	ErvS42rI7z485cXDk3PvwwP6hxvVLWkME2cQh00lC7VuH+LkO1eaRJSQa329sKkp
	cw8s/F+9vSjnhimePc+S9AplkofhC4ZbcRSSy5NmBJMcgcYVjlqn4UeqsudUn+Ra
	+8pYxNEvcEd150/l4fcSk9zoex69zJN2yvHjlM+MbRbee2dRfZxXB3kp4tca0QLh
	ehX0rvAYEinRDnPncpDNpDhlq7/SdduvMGvS5dJAD97O3f56K3bzTAVFhvjXL4I+
	xqEXSg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mu54g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffcb3a10f8so35006147137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773183787; x=1773788587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11UQng+3pfL2wZggMDKPKaPFC6vPCY5zu9oF2jTjjxA=;
        b=W8YhtFCx3I9XXN9ZhDAPOmcLAgOnFtAkJBcy2PzJbR/PSruXOKyJUNPSs38iBScZHw
         bWsPctuyc8jEO3E3QGQAIZFcuKeNhdSYNf93B7KM5RZiJOdU1U3RgggHH45Y6+dee8Qd
         45GYvOF/OtwW+TV8eqmsro1hNLHZMsC4ZBqihFYefayaZN4cs/qzCpQJyrIwYMNr4HJM
         qcnLoT8HfGK6UpO2p5Dh7/AH/P2B7xbXaN6eutrjXnWCO7EXTyf1VoyHV90ymJ7I7lNf
         qtsqVrGkMbvELn2BD8w3J4n7x8d6z8zCJQU0/X15NrIXDS9RVmNHuapRA6KhmP0jMUvp
         CxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773183787; x=1773788587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11UQng+3pfL2wZggMDKPKaPFC6vPCY5zu9oF2jTjjxA=;
        b=dfdSiu6HEMLPVr+9KPTVRbQyDtI5bCLQ3RjspNLCtCb/ncPmCbDHIvZxeJB50W+ORE
         4m+fvhoSnQA2amu/od583COpplPvyi0tCDirM1PupoPHbVpUJ2LbGmHAXPRBDFZBHd/n
         hBsZZPycB43YiXxkQ/GQA6ppOTn4x6JxSm0AYrfdgPr+6DrCtog9NC9UUZM163jZHzge
         oR88QWk3JAEIcYVlyaMXnLsDajjRoc//GPWjY3gpzKFsFBCazo9WUn2hl3FiYPqmC0no
         hLy9906iCrgIWzS9KMXn/8+ML9h40REhvbX88lSvXpO5zgwi/evCi16bsphdNY1r6DnU
         tYNg==
X-Gm-Message-State: AOJu0Yz19IbStJ4cS9Oo4itGi1Bd4n/CUlrDBCPWn+WtTn8E5XxMBxmc
	LPTCbxX2SjznP8SclVxHpEHxgymcFdSYOasEt/DRGofAqMMhYnfa0t+RjKX7PTCjxwfaAbkKRf4
	jAs9rtLGKVA9AsqIBxEnS4un0u8kf87naP59Ho1tqnowpZ8nwxCcMVgDBODUyhIqBxSwX
X-Gm-Gg: ATEYQzw7BXuJuiGPeiLPIOSsJdJ+JAHwPrshHA51Rxaiqt6TROwHdZoYW3uS1B+loZv
	UyaPHdt6Y7iPkGWKaHDirRleljNaSIiM+sNhDBX/y6CQgyq12bywvumxJNyZ0E8Z9wB8mo1A2vL
	bbL755rnL730MGK6kjqY8KvOcV0/k/8u/3TxNzmujeQ0Yi9dvJD4LIPThPiX9wQuaGE8iaIVKzr
	yaGs84Q47tdINPiefVYYEBYBq+9bjNZKdOx8uv3MNs/r1nZe2BfPp2xyZRyfKcpg+d9pU++aDHk
	S3IbD9zS5qOn6BFQ6I1YNQGNffzPfaDtApHgerjplTp1L8kFJJf6FPFexOOIesT3AV4ABHzeSmj
	U9qFaH4DXMyHv8DvnYOUjxf7jq+tCBa5te2eGszEWZTU4Vnz8AFLZfhVtNbXlbfGtZJR3sUXqJC
	xdr5aDtLw0YedM1vy6o10f2ANbsRf/LNSUojU=
X-Received: by 2002:a05:6102:26cb:b0:5ff:b8d8:b40d with SMTP id ada2fe7eead31-601def30d0dmr216628137.21.1773183786709;
        Tue, 10 Mar 2026 16:03:06 -0700 (PDT)
X-Received: by 2002:a05:6102:26cb:b0:5ff:b8d8:b40d with SMTP id ada2fe7eead31-601def30d0dmr216611137.21.1773183786338;
        Tue, 10 Mar 2026 16:03:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a74sm80743e87.75.2026.03.10.16.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:02:58 +0200
Subject: [PATCH v4 2/2] Bluetooth: qca: enable pwrseq support for WCN39xx
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-wcn3990-pwrctl-v4-2-70e571a18e40@oss.qualcomm.com>
References: <20260311-wcn3990-pwrctl-v4-0-70e571a18e40@oss.qualcomm.com>
In-Reply-To: <20260311-wcn3990-pwrctl-v4-0-70e571a18e40@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Harish Bandi <c-hbandi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NCr7CWtfAODxD26EjaDhYPub6MJelC/d4IOGonNL63Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsKMjTeIHDIuYj4EJzWHo0r9XJi2oSJhP2xur5
 ikqas8iuDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabCjIwAKCRCLPIo+Aiko
 1WayB/9BC25wqOSbwMnpowA25Lvof1XPsWrH0PhtoZwzgc9ikZVapmH2m6k/MeSwVKnTlw/IXXs
 i5iXH03VkT0KQi2c7uu7yBWMmfIN1BYbAgsA21hONjqQHGZYolwoAfUPciWv3DbDH/05JMLs8te
 JOI1KHOX021NHbZ0zdtHqasKVStyr5Cu/kU5prF5uVy4P6F1ZW3cr4L+KQIlVT2l+pPQ0YUqpB+
 6c/sLth+Pln44q2x5QyUHWMYGFsMdFNWT6tg1bLgbifH6srluGefFjDjcxFtw9zqexxelqDOouP
 4r87Bb1tA0zi1Xq1yn/v3TCC2XH59UYFu+Lje+3f5IdkBBAl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0a32b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rVzinPZZyXf-EJmd2kAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: oEPG8phx7twwV-SlQqlRzQtprSnQ-qrW
X-Proofpoint-GUID: oEPG8phx7twwV-SlQqlRzQtprSnQ-qrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5NyBTYWx0ZWRfXzWMQnLw7NFCl
 No1+u4hO0CJCQIMNKHhRxIQXrkqVkKtW9t5zQMnEabml2doJFoZkqtL8gyvmfxcyaM3HTVQIOvQ
 pkopAL2ltoxvFlV22g33W9cAWlOXxv5jIe2HAv0Ee6VRgpwWVaJjrvIYshkFLMz68Ukoi7SYjFg
 0B/8EM+zdDL5c5diAbtXB09Yup7pplMlZ1mt3jGhudncEDcq5arpoDvwN4/+/LJM1TBcTAuhBE0
 ibR0eFGYhOcjieTuYqK+opaP4EIs1EPe8ghyxXOGBKKOT1cjA1PrQ+cee/Ppqj0L5UJWWHrm1jv
 rQM+pv6qRu9y+SnTc5JIWwXGAPyP4omQLWjLkThONU5qfBPo/h4brRtua2n2kHVY6pWFwuapyfG
 ENpDbj5hwyt/lHfsPCPDLTZyOEtch0bGbOXHF/PvEn04m+zXRw6qYSf9f/Zm/5Feutlqc7cqo+b
 FSnTSJ+0x/qEauxV60g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100197
X-Rspamd-Queue-Id: E2FBF259219
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96785-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,chromium.org,quicinc.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of QCA devices in addition to using regulators.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d6e78201a675..c17a462aef55 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2241,6 +2241,18 @@ static void qca_power_off(struct hci_uart *hu)
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 	power = qcadev->bt_power;
 
+	switch (soc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+		host_set_baudrate(hu, 2400);
+		qca_send_power_pulse(hu, false);
+		break;
+	default:
+		break;
+	}
+
 	if (power && power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
@@ -2252,8 +2264,6 @@ static void qca_power_off(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		host_set_baudrate(hu, 2400);
-		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
 		break;
 
@@ -2425,6 +2435,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN3950:
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
@@ -2449,12 +2464,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			else
 				break;
 		}
-		fallthrough;
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
+
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);

-- 
2.47.3


