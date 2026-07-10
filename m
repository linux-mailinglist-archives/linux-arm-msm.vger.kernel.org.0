Return-Path: <linux-arm-msm+bounces-118229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vp/pCVnDUGra4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCE739661
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KUYNNWBB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V+PbbVCi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07AD2307353A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAFA404BDD;
	Fri, 10 Jul 2026 09:57:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B083FE36C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677471; cv=none; b=F5JX3ADlanFZLglQEV01kTLTdp2SslfJ3J1cr+GQOiSZGYHj4de+6WOgI607/pOb/XG2QedXiAfg+FEDNNZtgvQ0SezihipdEg77+7sJ9HzdTrDyRyfLOQw4wIZTLWrNAPKejwqEKQpbGU5TaI+rWIw8vgQ7R1z5M7BgtTfqr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677471; c=relaxed/simple;
	bh=drfMTyafP5O0WHcutG+g8kfep1FgBIKDYHEt5UAf2t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ3PEMt5HLVve4HpPeQFj9ZQI9l0wEuukSI8iS4FQjVkSvTVD7wq4ygg4JPQZdoGJ1RwbB9rMCXayzdpcuHPFXzNMDwwOCK0+VjcavvPTCfzjOzw0a/cbpfsPKFmSmVgYwTnb6fGStKnTa0IwZHULN7gXLijg+YofxT4bfcMBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUYNNWBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+PbbVCi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7e0Dc188753
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=; b=KUYNNWBBIu1EkpFH
	sc98aZnmd3FGwpsVb3JlSf8DLXQXYQrd631LN26YnCa2tS9qFqzIglrGQ49aZXec
	+ePnCODA1M9s1OAy/Yevh9PrNTjXVzKKsgqt5jsNo2WN+5XVAOhjjOOzwd7Giid1
	i+JyBrX6FkO5Ny5CyDPVWXDJ1U6m98+DPAy3jnSm9pZzRmpmfIQ4p+OcLV4eZu1G
	+kr0F6r2I5tvcdHANh+7PLbS8o87koqOYUXL0whjbT71XIZD7502ueJcVDkAKwTL
	HreYLWKSAD7eWN8vanlwCRFjQtf40F6kAqCoVLK0b1Y28ekbx7uY6YDo3vs1nARn
	J/0QuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesuvsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso22004321cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677463; x=1784282263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=;
        b=V+PbbVCilWBSNFW45+Wvucm0WozUVfvAebh523qBewdhauoh0JFqCyFZEMZAxEx/RK
         G3Pw6HF5q9NZBKDduCoMPGlr8RDhu7VhsPUf1hXIpw2iAdkMhdaNM1TT1Kk5D39WQ4VR
         58ei8eRLhmJDyFBFRtPdAIciVSOGT4VCM0KoQwM4N7h67nlxqByvG523Qfz+geCjfH71
         L64FN9XqSo5hWTYPrpjmf7S8wn4/J6sFgWtszdOkB4S+592kRpE4ZG1Ina6ljRY+A/PU
         S/o/LtZchV9GrZwLdzLNevT9Vf1r5yaTJWyHwZXL3W5r3zOkDte10rkgnK3vYSinl0Q6
         +p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677463; x=1784282263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uq3021KNWN1PDY5vGnxhuGlTpLYyxahRYp1yr2wnYV8=;
        b=pjyHaN/TklBg6SFTfypknQNm+Evw8RjsYYqAJLFp0Us516HeeVG/MhKJygHdimQz+D
         vGUzgl6vAdqNDKUt0HPSWmcLAQxKpzJHo8MjGrpY5h2k8alet+x8KCxZlnHRB5VrMf/Q
         pAHKhMPzgu/fKz7jCQe7oMvK65D+UiImpSvULCdPDaIIUfOeB/vl3tOemTedLY72MiJg
         tP3x+WMlPmCqtJMATdPiPQx8UUyK5z24MKjOyuraKomTe45K7Mdts0Vx3vmzjFriostK
         oylLgGebERggJUL7iP82djjjVINCkNcGBOKRjDuZfGUVYI9ouHzYtJQhsEXzrvzIaQwj
         DAVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8xKNuVtK8rOMgs0f7rBUrRhhXJEMB/pZO+uOI/bi+LXMhtRpU5HiuadA85xGgBLGH3u6xk6R7LuhOWxzW@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfIS0ab5DA8qCr35na1aZMn+Oj9fUFlLZ1NarLH3w7suvGCjp
	oO7xv0SiDI0n3Vc7chEqtUWFOJpxNhUCjKQlxhw9v3lra29JtT2DzwcQ+DQF3sExExhwU7u7JHI
	/jKzSJSpEoVC41nfESrFzTwmdQMGswekFblJv92sOI3v+qe4QlV6yMCZ+0TbywMCE3zI6
X-Gm-Gg: AfdE7cl0Gj2hEU0P5JbdL2OTJ0AUwa+hcVN67zbCpHe9POCYfUbZWfImHy3VQEe8WhE
	JuidToUznddBGikdsCehnICYmC/1L9V5roa8uBg0QTIsb9vTlls7nKTXGpSV6DxwCqldrfCJWW2
	4qjXI4tHwxEAmRUNTe9wafXP5o3tDXDtzk/ChwvAPW4YEZF8p0kUrRglwweXQoZ1mjgc7WyWW/I
	nqOJajS9wc/7UbCElnX76R4Zzk9HpxPtn0LfBfYY3SPVgbwFUW5J6bVxmR13pcMzr9oOCO5GX5H
	AMa8MEjSeZ4M9ozNmntLLlQAUJTYv3vZBeIkq314M+NVKkv2P60pWYbAuE++mkq8pb0S+5XUXWD
	TZR15hso5/xf8N50zmskmW3eUMIrhrpL8N3m9YlXJXrW07k1CRLyTrbW8nl1/CxNl3NhKe8ndS7
	nXlmDAMyStWHJD7nKcXGXUgaOBZKFBxT2t16afn1VzMS9bNKhBBRSJaEjPFHm/IxmAC6lY2+gY+
	HaHBJOBl78Kx9BWmBW1
X-Received: by 2002:a05:622a:1192:b0:516:5019:d27f with SMTP id d75a77b69052e-51caa0b5790mr27855931cf.18.1783677462746;
        Fri, 10 Jul 2026 02:57:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1192:b0:516:5019:d27f with SMTP id d75a77b69052e-51caa0b5790mr27855781cf.18.1783677462351;
        Fri, 10 Jul 2026 02:57:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:32 +0200
Subject: [PATCH v3 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-6-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
X-Proofpoint-GUID: wSjaoPjunxs3IFfRp953DErkcL-hmj4q
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50c217 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kStU6zbECEpzgAoP-VAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX4pfrGZXUADfL
 t3YewBkwnk7HvIMwOZlbLArQF6QfqXlkOJ4SSTOcWGYSQAVsvJg9ZtcrN1Z9J0WfAfl6VfN3nOM
 dld0AFdyCdZIBlqP2o8TkE20hounaxw=
X-Proofpoint-ORIG-GUID: wSjaoPjunxs3IFfRp953DErkcL-hmj4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX+pjB7pid2sOF
 cukSemOopWSthijGzIS6mOiIZ5NK9eDX7N6dpfL0cya/QFs35CNknwYKWzCa/ZZEA4BP8ZjX5eZ
 xKV9ILJ4ITT79W3tAD79Gt17HrKew4FO36WZCJx4lLBI3tD/S5PZxeoyT97VhiDPbkSHfoZ8e/f
 zXyxKANKrbrI3sztgF23y8yEHlv5yDKzLzbi+Fzs8tjw8xmV2yZJBzQffLhtCdovzGI99WTDh7k
 NiKgBf6eeUpTca9jbspzWH7MMIBlJ88A14Egvt2Tn/m66sAeQlySex4Uh9WjEW7X10DBYS/JXdz
 8rdsfqDK243dKFnW/3Fuh2XKi5CzItz3zQimxF/VlKVQuUE9Hvwh26hJCeXj8rR/LA7Q/RlDk/Q
 m4gtJGcihR9nTTwRzQJt35kloqQhfw74Grmu4nQoC3u2dcBJH0okntjuoASLJ7tQihM3SqnWR21
 J95QNkJCLRxoTUy6uGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
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
	TAGGED_FROM(0.00)[bounces-118229-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 65CCE739661

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_power_is_controllable() helper whenever the BT
power comes from a sequencer, regardless of which provider it is (M2,
WCN, ...). If the power is not controllable, clear 'bt_en_available' so
that HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17f436484e1e74d1dd690ada22134315abb767c4..4a1ef316e715f4f1f0c8f7deafa971887af040f3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2549,6 +2549,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 	
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1


