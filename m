Return-Path: <linux-arm-msm+bounces-106467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKO6J5uv/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 628964EB0BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C67B3308A862
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344574779BE;
	Thu,  7 May 2026 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBsau1YP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHONmrzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A55E44BCA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167507; cv=none; b=g+9DzI4CBNZ8bjlOTBR5BDfnOUO7YEX3F2IhS2e5awY/7tpdr7KyakuZfL3m7PQAcF6+hwlgtaeEu27crV//PNPZ+m35BawW3ygvyNANf4BDLJ1K8sgEIRKnVlQyMW0O/bMgW1b9MbuW4ULCjhyOeqCk0RkrsbWPujq39+aEC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167507; c=relaxed/simple;
	bh=/5JSpbZRWY5COHZDhN4gNF7Jnw0iPmpuvearF0ixaPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvfJ4UGYHC1KS6O1W1TGvAe3pVm7KSN3a1eNRfHWTzf3M9RVGX/vHjkZbP43RxjCP/3f04QXVaQzV3GyAv3VYBP3bUQsoRkt7VtA7SETrZP+Rtbowv5vSAvUimPB8tQQBcIXhcL838mwIfGRxyjzTo3aOO79QTq9bZxkwu5/lQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBsau1YP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHONmrzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BUnuk3924293
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=; b=OBsau1YP7Yy+Iv0k
	Uq5fle1uCLNF61w2iOsc5BgnzsyKJrCSbaMr3P4ys20u8HSD5tSJmzwaB3UsTu1/
	65eX6tYgK/vJ2IVXY1nORGIG2vRygbP9teOOJffIvXS9DQq/l+CTaCkjAQPuPRXG
	1ScKblMYBSjQFTZjjKwMpQ8ytpsegGBp9EB0LwFrONQgBdA8et8K4uclP2xCXQio
	f6cC/i5TRqDx0gumanbzk9exuVFBX0rmg9+a3QZ6CUuFWfgXkx5gnzYYGO+Aa+co
	KjEk5eF+GrUEiIC+/d3AGbGi+HC8STjRLvTuU8aN+urzheNgt37w6Ospq8pnDa43
	1SueFg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88bs4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:25:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575590529a0so1936342e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167501; x=1778772301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=;
        b=DHONmrznETmLNj+/HA2W9VThA2sxk1CHvggZE5NPbGJ/OWjx0mZcuN7jIXRDZv1u4f
         JbbS71anhoD2uxxG6+D4M2TRl71dW1twRmWC0UJEzBd39A45NN79yvolOeGEAJmo0mta
         7QliufA6Zb8fnAKDPx3jOpUEUPmFooQW1a4YwG3pvgsWCoheqK/BoHVT0Bc7gwed4kSU
         zOHQM7rVvIh6iT3+zhAJ4gPonh0g32ROILXv5WoKG49HL1tEx088By3w717gjm3S8sPo
         QV/D+DgbeMUGP3LTx0xqp6UJBHwV3hkrccMpf0Jt0QJKLFUXJ5YcXWQOEZeWqgGGcTuy
         2uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167501; x=1778772301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=;
        b=LMsSsW8o4QtBXMDnHM0Aqph7xqYZ1WKUzAGaL2WzD5/381iK22ENcdlsoVFCZK9Uqn
         HllDliA7MWvDsPah7lDvozHJbmwP/VSKd5kR3AdGqX3huYh/jwYbE32bM91jd4blG6ie
         h7ZsiAbWu/hZlCHl18TmHt8IWRs4hP1mNrVmfpKOdCJv8EKdOjaisHbzS/spF7YDNkKh
         65hoQjKTPEOX1PHHzSmw/KZc8lIKNRKNWEIWdLftxuKoM5dnHlZsAh+ZupXHHuZX+QpH
         mnGeC2rpvhUPPhgjojNSTKMcF+/KI8eUTWp3qJ79wjX3cPmmLIrD+gXq+CgaEd3+e7Yh
         cLyw==
X-Forwarded-Encrypted: i=1; AFNElJ8VgD/7q/w1OlpOXp0G88jI4CJFe+rNXLy7fderxySJlWAudakRM7g6/iU5sM/Q4+EEGySnA8nC/NtNzW5/@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTdTLboHcQw15VPjkFePLuH1qX+lfuv6jShNdrjP1aMzS3WXz
	zlqLuw+q2bAKdWiSabxBR5Szz0kOEmrZVyPbx/Nmg7uq49VM3HCfVg9IHXOWtgpM7UGw8tqcALp
	O3jxP5SuDMOVgLgu6KxjWOABK3WfN5ctZ3R4Pd3QKUpc6v37lmgBm/u9X0jumJvqBQY1d
X-Gm-Gg: AeBDieug8+QwiOJmwcsR1Othvb/CK3edsqki9P8EGHwTTmD+Dk2CPWQ2QQtavpwsXPo
	BM+ME5LP27yFJYRgLRYrRw2arWA11rJne55lgTJU0bN0MeiTlxo6WHM5xOxEO0lciob+DC4J6v9
	iHN8hgitYWdzIoZqqSkGVFeMeeHL7EpqNHKm0QAgFP80h/ugZ7jlJc1OpMD0Y+QPvETTeTb6p0j
	YvHy2axjKk86bocbKlWGloBtR2gL4g2U7YJaLPDjNkOR1peX/x6jeCMYC1eHDeion/s2tHzUTUo
	s4OePEIq8tu9QlnRpkMarpR3AUjO+IjXrZm8VxwmPketSmVmlVVIvf3EGl4XtVPQVxTlSpfqtsH
	Xw6+qzGgphVhsaVv13FBFCQJ6I8yNRP30mJs7vNpjducnqjmQJOAvGUqTsJ9gIqNTQO5TgVHLLL
	0nciMduzwz1hZ5boINTrYlLq6dWfQ=
X-Received: by 2002:a05:6122:a07:b0:56b:8e17:25f5 with SMTP id 71dfb90a1353d-575595c4094mr5143509e0c.11.1778167501318;
        Thu, 07 May 2026 08:25:01 -0700 (PDT)
X-Received: by 2002:a05:6122:a07:b0:56b:8e17:25f5 with SMTP id 71dfb90a1353d-575595c4094mr5143393e0c.11.1778167500580;
        Thu, 07 May 2026 08:25:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:41 +0200
Subject: [PATCH v2 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-6-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 4atKv1yDMIPeLpSDH7CyAXxTBnscE1fV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX/qZQWrgSYzPl
 iYaz6TncXGYs+0Wt3Yb+5/IF0Ip5N/1uYehaEJQW+fP5qB75OSONKSjIuMiOpmHAXw1rDeF6dC6
 CXo2a1wWiydzBvnroQEsWTcU2Rtu9YE7lVtv1fP9EjWWOJGF7zE84yvX6CNkl4zdWUsCGvkvl+o
 yXv3nSiqR/pVygW/Ytcfm+gho+/123fk27ggDl8oNtpsVza3lWGBNrbh/u6oTKJjtNhsR84T6kt
 pv7ZfCnjXmDvHAxfQkuQDr9wx4JqRqIfSNY7j5BuuYTyIsmRi1AoEdltnkUdCHFezSVGKwmyHDI
 Av1Ga433k4romHNOwYOai5cKGHl+xNK9CmijcmSsAEfwFn1ec+gncO9+6bfnUnVNUAkSZ4BwX2k
 U53CLO5yNkkQ6DEqFz2yLoN8GxyBsHgK86bL9Z5Okr4FmOrJLnM3k2OL+s5yevgVQBxHWIGeWbY
 TXn9akIzfQrCMqTuxOQ==
X-Proofpoint-GUID: 4atKv1yDMIPeLpSDH7CyAXxTBnscE1fV
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fcaece cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tQ7bI2BnKgK5Av-YYOwA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: 628964EB0BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106467-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some devices store the Bluetooth BD address in non-volatile
memory, which can be accessed through the NVMEM framework.
Similar to Ethernet or WiFi MAC addresses, add support for
reading the BD address from a 'local-bd-address' NVMEM cell.

As with the device-tree provided BD address, add a quirk to
indicate whether a device or platform should attempt to read
the address from NVMEM when no valid in-chip address is present.
Also add a quirk to indicate if the address is stored in
big-endian byte order.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 18 ++++++++++++++++++
 net/bluetooth/hci_sync.c    | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75edeb5f6a99fb98ce4cc6 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -164,6 +164,24 @@ enum {
 	 */
 	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
 
+	/* When this quirk is set, the public Bluetooth address
+	 * initially reported by HCI Read BD Address command
+	 * is considered invalid. The public BD Address can be
+	 * retrieved via a 'local-bd-address' NVMEM cell.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_USE_BDADDR_NVMEM,
+
+	/* When this quirk is set, the Bluetooth Device Address provided by
+	 * the 'local-bd-address' NVMEM is stored in big-endian order.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_BDADDR_NVMEM_BE,
+
 	/* When this quirk is set, the duplicate filtering during
 	 * scanning is based on Bluetooth devices addresses. To allow
 	 * RSSI based updates, restart scanning if needed.
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index fd3aacdea512a37c22b9a2be90c89ddca4b4d99f..589ccdfa26c1281d6eb979370523fff0d7920302 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3588,6 +3589,37 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/**
+ * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
+ *				    (BD_ADDR) for a HCI device from
+ *				    an NVMEM cell.
+ * @hdev:	The HCI device
+ *
+ * Search for 'local-bd-address' NVMEM cell in the device firmware node.
+ *
+ * All-zero BD addresses are rejected (unprovisioned).
+ */
+static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
+{
+	struct device_node *np = dev_of_node(hdev->dev.parent);
+	u8 ba[sizeof(bdaddr_t)];
+	int err;
+
+	if (!np)
+		return -ENODEV;
+
+	err = of_get_nvmem_eui48(np, "local-bd-address", ba);
+	if (err)
+		return err;
+
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
+		baswap(&hdev->public_addr, (bdaddr_t *)ba);
+	else
+		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
+
+	return 0;
+}
+
 /**
  * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
  *				       (BD_ADDR) for a HCI device from
@@ -5042,12 +5074,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * its setup callback.
 	 */
 	invalid_bdaddr = hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
 	if (!ret) {
 		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
 		    !bacmp(&hdev->public_addr, BDADDR_ANY))
 			hci_dev_get_bd_addr_from_property(hdev);
 
+		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
+		    !bacmp(&hdev->public_addr, BDADDR_ANY))
+			hci_dev_get_bd_addr_from_nvmem(hdev);
+
 		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
 		    hdev->set_bdaddr) {
 			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);

-- 
2.34.1


