Return-Path: <linux-arm-msm+bounces-96784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL2VO0yjsGnQlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE4259228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A382731AFF65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C5372672;
	Tue, 10 Mar 2026 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BINbA6O2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtGm4vyC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3936F414
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773183788; cv=none; b=U4kUGqUUBKio8+pX2EfqfJyqCQ4vU+LMGIfc1Gg5VEafruR1DBw196Ix5NMgRlTWr+pbAkLiIL7y+OgIDHwTaCU/MrEgeA9OscQ7xAMGNJ4B0XJyrCRdk0Rtq32FuCZypduIUXqrhvaqJk3JXRUOa5vl62x9CVcOw4vAhqTtUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773183788; c=relaxed/simple;
	bh=pu7bkfU0sTJw0PsVFgK898M90i1JnWUjS/nDJwQDnEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CL3MqB2/cgToAbBynLfOQZuRYGsBjVNotmk5h65qQ6Y/GHGCt387x4nvaXpFJTubrhdgXzAvgms2bR/TsF/tMXuLrU/0ETZzujNTopdasDUdQtAcKqowB38J10gZWnxuyNxZyk+R+EU+5XKff+Zm1WI0hRA+/XJTgfoY7Y31CAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BINbA6O2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtGm4vyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH0na508387
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTtVziy0BmhY8iETUxB30NLkUuDxGGFEQ8sdwaw/rtk=; b=BINbA6O2RKFVHWfJ
	+RA7eFapoXl03B2dwzpKVNARmWkMj/fHX90r/qGlSuYGKVlMFo/46RAgfTXggfUv
	ubtJFK9LWqu4Fh4SmjQecEU6WKkNO5+ZHPXNPUERUYJyQ4RvzV+PpEvhrpEFm4UW
	ntMOY31yR4vAsLFuNZggipdfCuEAWmJ8OlQ+NfvzJPBtx7zp0Gsuob3xHWmXPNH3
	fhwj+jg4jqRWQoHkI7GS3C214kO9jksZTb4peVSZ90KZIarP24PC98zY8ZDEkwPM
	3P3VmvJsx2pYdJKTO0iEmisyR50B0nLRNz+vuEV1nxLTSgKuvZoIjreHzVmVsM1S
	34dzDA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppahck9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94e4b6c8cd5so12023267241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773183785; x=1773788585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTtVziy0BmhY8iETUxB30NLkUuDxGGFEQ8sdwaw/rtk=;
        b=EtGm4vyC4TlcnKyivZNC3i8s3rXCXEVmG9nxWe03j0tlzjZigE8zLzyMkqiIQRsXdY
         f7CjermUN8uCWG+TqtZJOoC1WTPLwxLRq5szhM75GHIMUPatarvzPd/Gygwfwl/PCHe/
         NBndiSdgCobOzu0JT9YQQ96O3WiV1XJwO8ob+zvJvDyJBIxGeiFnMm5i0jXia9dAorQ8
         t8bemjyoegRxIdRaexjtGZ53dDog5XdqklvRuAUpopYXvS72VGLSYWL0yAYiTGSLelxA
         JctQAGGvfKZrnwjpQnILNlTvO7AKlibr7DkO1YuuJDnHiRTeXCpbUx8wkdzwfnDuuH6g
         85Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773183785; x=1773788585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTtVziy0BmhY8iETUxB30NLkUuDxGGFEQ8sdwaw/rtk=;
        b=Gj9tY2uTiBjs7w/UvPw/jg7XEyjvyaECVTiPyGyyQrRCwK4Rad8jPC3kI0Sv34lnZ/
         6A4oGuicVhYq1fQWgZqgGAa6RLrNPbdK1v+SMhLZqWDdW89AQwSOoITYg22g419JiutV
         bD4y/VcrByE2BNqgbk1tHYG2u6+FSXZm3v3EHIMxsGr32IRA4CAIptTcZW0hBJmEg708
         DM7VMICaZTButm3C9UgYnphG/IaO0cgoX9R+vPm8OWTZXfkjS3hEiuxnS7dKYM4eaeKY
         SiPg6wJpRtDhA1VVxLTqwuJ5ScF97w4XF0JtdklusfYkxag7g4fc7yEcgceTZLDQq6KQ
         h/0A==
X-Gm-Message-State: AOJu0Yz8BCC2Mjod4bsc4BZor+zqMZ+YPt35Bdvdre++ifsZLNRAbPFN
	ycDybiJq8Cjl4l4S7P2K+WKwaz1rJzqJqykl2bWvCWteKiyJ8b9hulTe1oIzI245HF+nG3sYzjf
	oWtvKR5+u4Omm9Y++O8ttjK4pba9B2Y4kPK3k0Fh5k5djvhTV/Gf1eF1MWrnkY2Rg2gOG
X-Gm-Gg: ATEYQzztolvYnjgrgtD+8kebX+0RKh/59aa8G2zZuZsxjN/Z0gpd8i++s9hPgfn3wK5
	elDG7II4ymb3+MrmuQ6NT3sAKevZ6jE28ghEN/nDwNN3Hfgv0qfF6NsKMqqvibnH9Y+OmXcRtRu
	Fs0/nn0MJfM34HviDK4A8yOxYl9c274DJQ+/r8wYw8U0ZfjLj5BQTAPA2M7Q5idiWiBZCeGdSpI
	mNdEJYnQl0ze3gUt4vjEyTJWlu9iEkSWGuVf3BsMAp/XNB7LJWkSXLk0/CBUpcpyt+LJ7Xixt6A
	WAPd2+RQZxltgQiTVMMI5aYYc7s3Z2mphrWAOd9LnF1Os4tCzQWS8FL3TaZKrcC+yF/licoSVVT
	t74ovFTSR94ROG8tVlxNXIGEKiwVIn/k/dzNPAJeDCHzAoSv5t3E7O5ThOyuApJj1vOqCJtZmYz
	9jabTBYW7nlHKTho7SzL1A9hFqdLcjpB3kfb0=
X-Received: by 2002:a05:6102:c0d:b0:5ff:f84d:eedd with SMTP id ada2fe7eead31-601def892d2mr184602137.32.1773183785201;
        Tue, 10 Mar 2026 16:03:05 -0700 (PDT)
X-Received: by 2002:a05:6102:c0d:b0:5ff:f84d:eedd with SMTP id ada2fe7eead31-601def892d2mr184592137.32.1773183784724;
        Tue, 10 Mar 2026 16:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a74sm80743e87.75.2026.03.10.16.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:03:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:02:57 +0200
Subject: [PATCH v4 1/2] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-wcn3990-pwrctl-v4-1-70e571a18e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pu7bkfU0sTJw0PsVFgK898M90i1JnWUjS/nDJwQDnEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsKMjkalcIOg8DTrI+DqMKYEzOUUE1rjn2vhYg
 A64j7wts7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabCjIwAKCRCLPIo+Aiko
 1W+CB/4zY+8UcBQpLwaFzqkP46mU2l1Pbpd2+NId95nedB1Sf0k+iuUty4txEaWnI5czWIfCX3V
 4yRT3/1IC4cJuaSvCbJt4ZjTZVf95IFu/y7m5vWJQPnHS74xzAJO5tDiYUV7GvULkHzduqKan9Y
 riaYYV2bmCnKP1SkbX+1D9i1MtEWeEYAWQ/admntR6ctNd2Ley1fSsSVTmu01NXeUEWfTSPSohT
 lBvVeUwdttK1C2ta4a0OhipfVxra+cCCS9ffMhIKYn23DN85nRoKgxrRtinVFMbbCatfpQIuI4o
 vVYyaMywUOk6X2SxlCA+IJP61QpSew3OfyANwvSBJ/A7MTHX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4jAHh5BviuRVSDlaiUawa7NTvFNm5TVn
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b0a32a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TaVSYX7Pq2PjI-6xwy8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5NyBTYWx0ZWRfX+CBM+yt3o4Wu
 Z3prhdiLCw4naCZxtMMr1nzryMPgAxD5HXSnZfLDDrhXG+i+quDep2fF+fgWMYrEpDHQi/g/lex
 I8oL9M3EBylozsgMbA4REvipFpPtmTbKLhxZtseCC+3Bcz8Q1SnniYvu1U6E07z/rN6gUc9AClU
 6dDomTZHlbu8prM2Tqn7V4hSL4LG66P4HvHlyEAJfPi72297gDQjLvXVMrLb0KRqFejqMz4Dp13
 8FQixNCW1JxNOlP0x9QgO+LLkxPiRth2RgmDmDUd0Y17XsZu+muj/x/Otf7tsCkfAwC4AkwbW64
 LUjBcFtdfrwm83wSLOlOM72BZ1IAPRSdbxOIm4ROoQPzUHRQ1u3EakkN2rNAu/MxWYWt4Sra18u
 5qfEfXN5rYxHIgitfiSTfCxuSP0hJG96JBIt8K+N2KYKskJ8GczvzYfvRvUZqPN4bCjTrPb6vHG
 urzl8FhoEkbleFzh57Q==
X-Proofpoint-ORIG-GUID: 4jAHh5BviuRVSDlaiUawa7NTvFNm5TVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100197
X-Rspamd-Queue-Id: 56FE4259228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96784-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,chromium.org,quicinc.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

WCN3998 uses a bit different format for rom version:

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 9f7e13fcb20e..dda76365726f 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -787,6 +787,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	 */
 	if (soc_type == QCA_WCN3988)
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
+	else if (soc_type == QCA_WCN3998)
+		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
 	else
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 

-- 
2.47.3


