Return-Path: <linux-arm-msm+bounces-115941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xjX0Gn1ERmrZNAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:59:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A62926F64FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:59:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bJfkgl4M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZxjkZVxq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115941-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115941-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2089531A5EB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D873ACA5B;
	Thu,  2 Jul 2026 10:46:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25803C4B68
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:46:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989199; cv=none; b=uO4j4fU2yts1nNkWBusIoDmcXGxeWvSUhp2lZ9F3D2lcMYQ8eigTCizQzx8PmtutSmnyVGsnKxgggMoY9xba6dPrLlXmJxnDp9Wy04V5HMqEW4CaEtrAgoSe7UFHWgpKQyj2fJsRIX8myqOZGbQ/4XVuCXM4wtKIE/oOiFvkFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989199; c=relaxed/simple;
	bh=d07rwEK7oQJoMCbcs1syF/OQ7vSvilkVUT1OidwjI6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXeewK4ju7UCmVgRl7gjTMaqkdihrxTlfE2rMKMCo5S2z/T/W2KuYdiUbpcheMwZFgje3Dnxg7Dcmy/UADif4kxYnKCFk8N4E3xRfBzpPXg5lEHkP3QvALMTnCx1NhCTmNQzcPkhL8F1YtnKOUd7DGMq8g9tcGhjwIGnKyWuBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJfkgl4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxjkZVxq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Kql44117049
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=; b=bJfkgl4M2QDakoT0
	XRsvV2+I7igkZ2PK/BBbrHCGfeXemJxB9WcQVw2vZdxrfpKvQIMlni2NBiBBirXU
	bz7OqjPi+jNXuJEnd4OUYwYyqqxwvmZ8EYSOkNqDbpwPLJok0qUiIpLFiwD52MGI
	OSstWGI3+kYSFzljg5SbO1St07D6nRFJZWJF4uHTZGpnc6Fqne3ntWiwK8UUQlzk
	LY0JmZPNKEo9WZE6dzT2dwnGTz4yfD54dj4g14Nyd4r27GLzhQlRrH5uGTXQEsks
	pFJESnrZ15Uhea/h3aoiRmMpw/ANO5UEE6+74CzS4VtWvBPBfldtx40shDZCW/n+
	4qWeHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgage-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:46:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so58604185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989195; x=1783593995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=;
        b=ZxjkZVxqYKVocXysIoeXo0Qh5dl/WnrjunFTaOOv2DIDp0ZXeplG9B5jq61TvWM0lF
         W3sLzC3p42ok3nXRmPOXs2SYlrPAWzCrdXRB3bzbJMMkFYspr29XuDFTs/XrF6+mZ1qd
         5L1j1fokatTfyyzVH4BONDwO8J0VB3mJ9xZua4OkIk9bX1vWRHh2T0mLSAkKxsiT4dhz
         BqxzsQQgeb26xhjdMMn5EsG7E3hVB9bsdx1e3oxpQJsMkLXa01Tk9vOAel5/m+i0Zf2n
         IkgAzd8++epAiwVG/jBgU4+Qgzr0k+v4NSnFl6lLFkkK7oGQAmJCAHi0b+TdnwsXbPxd
         ujAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989195; x=1783593995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=;
        b=XAoRZziiMBK3mRgBBZ8esXv025xs1vMkjZCN/1sajfdRqTGB///KbxiXNOvoMKqMJJ
         7byYGedOjGCFnE9AOLciPrYuYnwIpy+4q1l61QM1Biyc05zUnLefSj5k+g7Kenkt/x0P
         Ldo1f6K5IZPM1DUgAJuxaKnWbQGqKcSqX27M4rvSkdcOab/dLIW396jZt1B/6c2xscqB
         uho/PAUVevt08PNjkSnXaFxH+n9FVyox/VL7zTiyncO/aM7nVMInzb6wZ+zXLHOqK5iR
         Rn19mpEI1F58Lz/fFP2CYzHtiyFNO15IvfojqWBgvUdYtmBCZPLusu5rUrwfPtRDrQxR
         D/bg==
X-Forwarded-Encrypted: i=1; AFNElJ8ifPJzcxI+qlvl/iVDgJi0MdgPbMUpEhI6fJiRN5wavwqfbReQczdztbfqXi6RdPnee5NfvaxMj1A3zg5r@vger.kernel.org
X-Gm-Message-State: AOJu0YysC91jV4Vpl0bmnrr6pHuPRco9WEkIs++o8yRe0xTs+mlCEZG7
	ndr0ILLr41uh+X0XaVZ1GD1zeshPhEzi11VGU9UFoz8nYfl3uASBPIEIIVl5S9NZfh6cFvFv6HY
	8i13Vs9gXnKVzsO4Ww6F57xB7vVbAmDmQJICT1Q5gDtCFYzJtQulHEh+qIpTu/lnPgbMm
X-Gm-Gg: AfdE7cnj7Hv+IE0f0OXlu2DbfpN4xEYY2+k6Tbn3adtyWbSeluHAGrPJrWwid8QsG5w
	E59OgqBjQB3YLryS0j4kFHiqmEoMmGZIjfVYCmB8KAMZofEoJTn5ZsYg5FJ7rpc5O3++bqE5A4y
	WsmXAKvsJc0QJZX61OJgbrIvD1Et9SEX90hnBNDp03RFP6vSA1roPyFEfAiWNWckjRd7bvkKPVz
	UEPYXd9TpEGMSYOBxDaTIxL8GnMWyZ5zc5o+tv5genvobcNLGt6/pPxtYLhKFScYkt6C91OcMjX
	FGyiaZYFaSav6N65daUTtXNgRfEhv6L+1jD1yfDqQhu86waqIoCNHVrU5xqpErPsH2tPCp3ReTu
	XVWKn9KnDzsErT2RKiQbdkRMeU466DKFkgWN9Kd4qGjGDpoUkcOQdvV+CPiJRsgb0cJvGOsq9Ig
	VIoAwb/MHxBtwB0Pll7Y1MbNORQR9qu4lxjiZaNl8t+tGuuzWMz1tK3eknZPPaLXU=
X-Received: by 2002:a05:620a:4592:b0:92e:57ea:8c8b with SMTP id af79cd13be357-92e6955cfddmr1240421785a.0.1782989195288;
        Thu, 02 Jul 2026 03:46:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:92e:57ea:8c8b with SMTP id af79cd13be357-92e6955cfddmr1240418385a.0.1782989194692;
        Thu, 02 Jul 2026 03:46:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 12:46:15 +0200
Subject: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
In-Reply-To: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cife5D25R3IZut5EJ7DEy7mhfg-H2loj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX4tGj+AXKEK1J
 2L05XJaI+IzZk2KcZnm3rVjBZO7xysGB5Qb7A+WmJiR1BuR79wdmPT7JpTb9ubOnd1/y2pPN43B
 zXtFAp4zdAPbte6RTThz4/FAwsFCP5A=
X-Proofpoint-GUID: cife5D25R3IZut5EJ7DEy7mhfg-H2loj
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46418c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=l-ki6R0DwxtWVe0rcmEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX9pFrRdO2YA4l
 BnSbj0e28hropcUeiJW7a4mGrTxv64TxdwTmFaiUTPwjIV8aFxrefuhnCfFP51lwiLxVGUV06tM
 VM9w/8tWBfnn0VrV0yBdN3ad4QOjK3lpIQekpnW47pHi7KKj+y4nO0cPDzJ70RM/5ulS3nrLw98
 H1tuGMr8OFrE8j1mS9pRm1av2uTQx5PnSKmdf9VIONrKTiRCywv1/MBI2beeqwAv+HIcQrF9PJi
 bpHD8arh1O1WDbv9exZm1vjGlDawedk01FFOjPSkJgAb5e7i2Vt5YWJoHi/PlKmInGmtOeiJsxq
 iCEVolkuyuVPSyBAGpIexvEe4r5EX8BkzaW40idHpobTrrcuACcGICzDfNTWqdp9eXjXqBxnx4C
 X6RW9Re6IwwLSm/oCjNiGHCKOCh+7jqCzwoL9F1YZ+IYJfQer0aikga1dNWzwVcNfRotQK+L8bq
 Cy0nA900m0qWd4GXVGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115941-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A62926F64FF

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
sequencer rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected
to an M.2 connector), acquire the 'uart' pwrseq target from the
connector's power sequencer and use it to control BT power instead of
the bt-enable GPIO.

Also allocate bt_power unconditionally for all SOC types since the
pwrseq path is independent of the SOC type switch.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e87ae76fa00eda308e81dea25 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power->pwrseq)
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+/*
+ * Acquire the M.2 connector power sequencer.
+ *
+ * An OF graph link on the serdev controller is only present when the BT
+ * device is attached through an M.2 Key E connector. In that case the UART
+ * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
+ * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
+ *
+ * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
+ * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
+ */
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct device *dev;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(qcadev->bt_power->pwrseq))
+		return PTR_ERR(qcadev->bt_power->pwrseq);
+
+	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
+	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
+
+	return 0;
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2417,25 +2449,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
-	switch (qcadev->btsoc_type) {
-	case QCA_QCA6390:
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
+	qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
+	if (!qcadev->bt_power)
+		return -ENOMEM;
+
+	err = qca_serdev_get_m2_pwrseq(qcadev, &bt_en_available);
+	if (err)
+		return err;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
@@ -2446,24 +2466,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			struct device *dev;
-
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								   "uart");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
-
-			dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
-			if (!device_property_present(dev, "w-disable2-gpios"))
-				bt_en_available = false;
-
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power->pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
@@ -2545,7 +2550,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->bt_en);
 		}
 
-		if (!qcadev->bt_en)
+		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
 			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(

-- 
2.34.1


