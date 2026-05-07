Return-Path: <linux-arm-msm+bounces-106468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGLhL66v/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207D4EB0E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBFF6308FCFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EFA478849;
	Thu,  7 May 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNRuu/6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAlW2kYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EC472766
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167510; cv=none; b=ljBoN/EYrgeCEUJQ3zU0uNJiuP3XAYqkcD1PMvzvctqCSzPrh2C3LtJYc40PvBoFbk0JB0aL6aALvy97KVqstDKl5zN8b9TWWNOGXoJYC7s+PJqsx/qywpvoQP9xXpF2zhCliKKM5xQdWCNHyq2jbcwlUgq7wR9sXe5iyZOS6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167510; c=relaxed/simple;
	bh=cLdgwybwmVheaxNq3A4ptASzy5fGo7sa3nM19lVmCQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtRisTtM07FxGGzy4XzrKdObV9QDjOTP7p3qRD4hd+W1ZPjdqrDiZki6bBvIXkOtSlqCOB6sM4+iRAPsJqNg3AnzTkhn0wIo0xcvYwJ5fjEW91pB1cIFXIIDX5o9vZUWeCncbrtFVT8Y5gxO164MqrWhmD2gl0fXeTK3iu+ejd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNRuu/6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAlW2kYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BtGhZ3157859
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=JNRuu/6tQg8Iq2yd
	efyuW8NpXjne8LakeYYrmxE2IXd0811URgteAZuuZe7hSFzFIjLDs4geR7VhamFG
	n83UxzHDzPwQY0bf2pDm74l1Dbpi+19LuNU2e8Iozs8RmX3DhPdqyCEXe9F58AMu
	8VrFY4AoYHnLwTjLpcLSAYm7/UY4JMH+8frEp7SibnG5+D/O78QB0nBkVdm1mpO8
	TYSdd5vt7KWPhF+nOUX3+HPbeX0X8iooViDwgbzYKKlaHtpQU+ybcnyGr9XHY6wG
	ikXlCr+7RoRcCJ5Tl11QBu+mpsMILrxsHNJNLdBXZoQUHPyBKpG/LJw4k/Phl2WZ
	rI3n2Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf28gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:25:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56eeff9a41bso2276352e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167503; x=1778772303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=FAlW2kYbEFbSRezWYKrHriJT1nLtx00Hme0Ybkk+Wq/NiOaZ/Y/JcLJn+mnHNNS9cA
         Qz3fZOVCJc0CZn/RhXTbWqKaXvK66YfCSDnKZdOBLVUzhqJ9WpjyebFW07P4HucUe7q9
         iC9p8DZiM09iujRtRkcp2hE2RZdIX1KXEgJ+LzjYmH5gpOcWq3tVtOsjLp/GLb3Dd/Z+
         hSK+wAZyvLkBXBSEKJciEKr/Af4kcl2AEyxgR0BLIjMo6rDNUCdGQoMXyCV8XpNRD26q
         Zm3AWKTJjwBp7cyoNjDtgKs5TZhgY5EX2t/yqgZOJJD3fqT7cdrfWN7wjugMNFK3Eq+P
         083A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167503; x=1778772303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=FLgO1k0r/NHCn8qX+/RjW/mGpPmfyrktcOc/8SRm7MtyGJsBHhGtB/HDGoP6Td4hk4
         JEfuORuBm0pZBUmYf4iy+UXGLtL0F5WltdnDU9LsMSPvizEgTZmJjZlEbJwitU5Umub8
         zQ5SMDHO6MnX6iS7edeFdnc4LjAic8kaO0XrtCCdqaw3YwjQLcHWuT8zzLerrxgaXKz7
         qGEsKNlCEsa6z3BDLJefHXNn4VQNA/gzUYrVa+h9BSw6ZcsMHBXC9MKywb9ZjYjttrgg
         Raup6xv92PEjVxVvM6LFDSa+RVtriNyuTaGUecHGN93MetpWljA68385XKmEfuKFS5TK
         X1DA==
X-Forwarded-Encrypted: i=1; AFNElJ9F4rn4IMRLAzzhvQOM6LRwyTBlOfExjDJ1ZJEals9yDM4CCazhu0UbQrE/tNoybXhA46H0bd/HQkuSRNXB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnr2BOIDfr/FnusdnRlTGrdW6wSIv8oGFy4ZU/WALx0UE7N7Qm
	Jy/zNuZomW8r8jgj1cIcaNjtPH5aSIHQEnfcFufd3/TIWrwIPnhktmFZO09YPzaMLG6wwjwb5DE
	vEQdOpO1NbUoD9c2uG9AKuXlgzN2LSmsPk3czZz3Qb2vIr2p2es8NOHY4B42/E0744VMG
X-Gm-Gg: AeBDietr6xn9z1s7vPIAhCN0Ft8oP3WFXAgCm9N9iXdiiEILhRPCJFRtwugYd1LUMuh
	LHadORCojm4rymSWEkNj7NrvmQ7LcboRa/y7sQVM8NS3Plq5F4CrOpminX/mCTyr4sarG1AV4cm
	+rTiDtbBDqwLxqWYeRrKx58qmwQjh+HTBd0s+numxILXTDEmMeXzyt6uVLouBRG4GkW0jBIQbUK
	AJaT5+C7e4RAmo1BuTi0ap+q47sWKAFYm/3/HWwhyaKtif4vleHfWKgNespYcprS6Lfbhfrncql
	wCBVTgREh5RbVypwzLGdSHvn1qEms5ErqwSRbosArqhEGzsR7sgXgu+zHU514moPUotWuFQDFh1
	6luFOz90bOnHuXqP3zuA4fl1+Hy8GKXhJ4Dh/sFr4r/4DrLNM0klm9BihS+hiyXMU/C2T0QO/Af
	OJF4sonxUBR5dGVZVRfOPnHw7csuteie1gTUrfBw==
X-Received: by 2002:a05:6122:e14b:b0:575:37ed:f787 with SMTP id 71dfb90a1353d-5755968ada9mr5305819e0c.13.1778167503451;
        Thu, 07 May 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:575:37ed:f787 with SMTP id 71dfb90a1353d-5755968ada9mr5305758e0c.13.1778167503042;
        Thu, 07 May 2026 08:25:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:25:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:42 +0200
Subject: [PATCH v2 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-7-bf17edd5134e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX0xcW7k6wNIOc
 Hy2xn/7R0f/0rq194HU2yrX8D1Dm6Vxg1BspPcoGU0ICLnc82cMCmsanWXiqhh4Ulq2uogzpsbM
 E0DzI7VdjBOMJJr51Mhm7RW2SjxNnhYy4EqjIJrxISrIWeBmfrrJwKrJpGvWrZsOKeV00lz7rQl
 pAkaxQ44L2Y43CqrPyhU/LpJ1CG+EuL8YQn/mt2xEyz+rMkzKMrYHRLzosJ1YMyyCYpyV0rqc4I
 fxU47D3ivQOfzNaZXR3u3/z6wWcc8i5gwIvOW/kMUWMN1eg1fAjUXePyMqqraJ69SqYHGNuRlSS
 kiPHaGNlZDQGYH2bgwF9de93N5SggLxxHw+YnYf1ADXvQGdwktyWVJ6V96XQkhNBfYpd1XIT5YE
 pcEe4JCocQVZzbzAI/hZiK7ByzY0G8G/Zng5QSBtcUyqXI2Nwhl9XJSHC8ZMdcCcz41uaD1hgIC
 cmdwQVGD+XVt9BK91Kg==
X-Proofpoint-ORIG-GUID: WjhQS5YrumQs0ipJ6w3VVXZjnTkCYyQg
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fcaed0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: WjhQS5YrumQs0ipJ6w3VVXZjnTkCYyQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-Rspamd-Queue-Id: 5207D4EB0E2
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
	TAGGED_FROM(0.00)[bounces-106468-lists,linux-arm-msm=lfdr.de];
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


