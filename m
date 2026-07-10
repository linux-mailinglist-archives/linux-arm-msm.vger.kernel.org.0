Return-Path: <linux-arm-msm+bounces-118231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X7rYOZbDUGr54gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:04:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413A7396AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:04:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pg88vCAz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="A/5cUMev";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DF8A3040D92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C5B403E8D;
	Fri, 10 Jul 2026 09:57:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE574028CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677474; cv=none; b=qL1XUjBGHOw68h6Je97BwtEC/TkHIMEsSrWhQUQczEcaqKP7kV4dQ2PvJnmbGV0RYoHzf8mOF1MlkopO1ujX0Csm70C7NZGldJozCnsXyswf+Aew+BWfUFOrjDaH1dDHIWPMjP3xME9q1mAum0OiPXFOyjSm4sfWpK8IpGXBYZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677474; c=relaxed/simple;
	bh=3pbAc12Jj3zIRz8oWGZPCYd6KNJWtOhdSqNPzVF1EiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOpLHhHxIYJq6jPHXHOXcdazn8A2EHV1POre+C/b+b8Evn0X2jogp5/T2DPsAja0tpKgpFJmB5XFdHTdmlk/2ORWQVIcfAT1ek5hpLLGawYzFvLx6cu1ct+Dwvy1G3EZ5qeg1KtqkHZUJbvnF51+wVaKrwO69tXcnDGV3Fqh4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pg88vCAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/5cUMev; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7drXZ188285
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7NkL9sW/e578DxWIXV/0BLe24fAF1y1jIyxSoVkA6c=; b=Pg88vCAzPx8z+khj
	GxO7gSx9tGdtK6F29YnF2D1jkJygeRL/iIsIzLLBUvhYINZrs41F4kun2GPF+qyn
	4zE/9vUBLssjPdV1sY7jCNf0Y/xOuwXC6lEZHi+LnuNExDBb41GCAUyWWX83ZtIC
	dvzwfz7B7LSW/kXpFTmSH0OwAnwW7iYemmVy5+gbWzWOy0Nw/V8rhHshg7IIRdnm
	1kpa6+BjIkBu+9YaePq5+xeqmtkteXAzLw7vw/zx04Hv5XU+xhGzSNpYJtpKtG/w
	HcIMPenZLSg4CCPzHuECGJlBCvbIp7RLlz1ZW9HdcPmzYvgLW9QKKLVkBVXt/07g
	9KxdYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesuvsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso12350411cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677466; x=1784282266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7NkL9sW/e578DxWIXV/0BLe24fAF1y1jIyxSoVkA6c=;
        b=A/5cUMevjc2JZp06iCboiLZzNvcgT69m0pTsN3poes1nzooGTe73MN/tnZMAXTjYas
         JG8H7t/K40/AYLnQoTmOj3KGXnCWZIEwpZ6KPCSF6Dk0f0viS+Co8JUlHa2AP8YLEbdK
         l61Yh4gfNmYoyyPAmvyWIwqs7P4CXnhAs2382c8NLS27UdInTKLu1QENJWU68BAliUPK
         a2aJ5Z2KYlYYHZ9mSk0mMx6o5fRjiFyXstSkIhmcreNZ1SzcV3p+uwZKRfz90T18NYBq
         pD1Px4l650Yc/rcOFdLaf/xrt/R+xWydd9oKLTBBo0aruAfU0OCaLDBJyMqBOsmAapcS
         JSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677466; x=1784282266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7NkL9sW/e578DxWIXV/0BLe24fAF1y1jIyxSoVkA6c=;
        b=ruWmAvkpx4bjXCD94BQPdmpiKmRc0CDe0wGFT10ysqFiOD2N0ouaVMqXDj+DEqc2hF
         p3sYfEF70O5/T6YHBM1QA9iB5Su7g2ADyAKwkPIHflJAgTSqTWnJ5cVwtZv6NxMOkX10
         xJabvxF+D8nOFQ4SVVdpYXK+fO4VJMmo3jxVnRm8Edkus+87+5RIWGc2bMYjUWwog0XN
         wnnEDSk/vooefen/J3GVDKFlzVaKD/w12UMQKAlmQ+ElcFHlgJNUSr66y4tPTUxvFM7h
         SmuU+i93ALkQFn03wbI+yHpO6Ja1xXk8RbxOr2L7mA/tyHNdsGYHOutnqrmztkHMXY2N
         qIwg==
X-Forwarded-Encrypted: i=1; AHgh+RoRq7ln4rCxxjZnxwFb5kY9X2GdD3CTMbCktPv71OQO/h/eDatud3LxwztH+MmgpV2XDzxERimt6eJKACYC@vger.kernel.org
X-Gm-Message-State: AOJu0YwNBFGj2FHmhNXe0KactC9hy7bHWdmfdMUUMAiA0AvMZVXqTJTq
	0hVO08cMfmctu7eBMLB2wRTV824jZAY/7NPwYxXp8kNLInNdIe099QIRl6HLTrZvWaQ/88dRm/Y
	APN3r6vVisxYAfJtnfQ7F8w6UtYQBeMH/cmFeR/f1kF4BZ0oW2pr7Rga3Zyje37bRlO63
X-Gm-Gg: AfdE7cnCwi109GUDu+C7g5alJHoaRBnotOb6DQtycIt/qKC6Ixlo04ABY8EhTSS3k7I
	sLX74DeEeNRT3vb3DfB7uhs2LrFM5o5Ul8VojyakYevUCmgr7M+7EvLoDr9+cwps7O+hzrcJU5q
	iYdFae87WTj4TZSGvtRLW9ofhplM/yCqwg7VZlyRNiV0xJ1s5b3eUkuXZgYrFCLtHxwkaKL5hlC
	SeuCcK+szDeOldnN6SkuHVMw2nCdIHhvQaF+ZOu6uIpcw7UN4pVPSc/aqUeLxRR7vnvIQu0dTst
	9hmj98NCRliqrY8Iu/vOVZCTL96XkIBRc2oHR0Zy79XG+spTvvGEPxVDZ+YG1GfdrEcBWlo5Zlw
	JG2wMB/VMVV+YvFDxAziiehzHEt6TFQDoyxdmkwQOaXPsq8q7OqxTRLT8bHoXMPcWIEKiKijhyf
	H2oH/JU5n/Nsiew/QfAPVDZM2zwRcAaPUah2BxDKVI7s30Kx4E25MzrHg3JxYKO3jrK/vznYXdK
	N9MonZp3N/25MB7BYEc
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr117003081cf.16.1783677466354;
        Fri, 10 Jul 2026 02:57:46 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr117002821cf.16.1783677465981;
        Fri, 10 Jul 2026 02:57:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:34 +0200
Subject: [PATCH v3 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-8-46253587af64@oss.qualcomm.com>
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
X-Proofpoint-GUID: D3ROL0kpFHrSR9NySOOxK3N3XB82_slZ
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50c21a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXyWihmMbF2F37
 z7qpE3Wx4Wf7Dq+6zgiyeQNe0Lqi73x5NLjh6i8GIObB3RoTKFYsADJsiAD4OVmXNFEKKvUwzrC
 WtFRYq/LwRggJDAwxcGcIIM3U5LqsVU=
X-Proofpoint-ORIG-GUID: D3ROL0kpFHrSR9NySOOxK3N3XB82_slZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXxgZvv2lcyre/
 QOT/9tBsvV8LEdEEKX4wFOb712eqiS8W3MEr17GjT4s60d2XudcVcVhMgPCqJM8e5HKeGbO25O3
 XrTNu+j3pjdOffrlCTafu79eSWSmeS5UD1NPgBjwRGEeJypivWV4utNNxmd1Zci4C8gdX8rPYXk
 7YAvXlX/x8ZhVKWASdMBp2nL6Eod3qz1XDpqrfOvMT9n8sAUrCGMrzE6ywjs9c4ozciNBOWyMS3
 qUoJw0s3ONCNvT5vrughIA+ki/JACN6/wDkCjIF1wABhKBpLdCCO9axVzehmeCQn/S7WpvjvW9N
 zvj5cvmVYhmi3VG5ELXMSYnwdeQgmr9ChsN+eJDgs6UdTJim03CGwAYnl1XAezhGReyVyreFKF6
 a4xKaXwBNdd7KCBl5/Cr9K5dBff4gtADuZbxIV5Xrg/Yf1ptajhUXk9ARI52iVNqP/GOil2pVpU
 hGwJaITh6g6DiGapMEA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118231-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3413A7396AF

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 24dc5bf6d192be7e1d500df6bdf36e6184f9eaf7..f6529d359ffbd97f8a3c4c0593680ab200215b36 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2387,6 +2390,20 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(qcadev->bt_power.pwrseq))
+		return PTR_ERR(qcadev->bt_power.pwrseq);
+
+	return 0;
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2417,6 +2434,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2426,17 +2447,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								  "uart");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
@@ -2528,7 +2541,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
 	if (qcadev->bt_power.pwrseq) {
 		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {

-- 
2.34.1


