Return-Path: <linux-arm-msm+bounces-112785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TrT/L47yKmp6zwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:38:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25C6740DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:38:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hrddo0Wq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cJyxavEF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A67B3449B83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA164C040F;
	Thu, 11 Jun 2026 17:22:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576554963D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:22:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198567; cv=none; b=l2+JYmIuac9HRl0Qe/c6MDecIW/Q16pgrJ7c2xid9JyAjkoT5u0RajbMMqp5v3kyqYt5drj8suae6uMtMoIBbGgvccnh5sWbrN3qLy1WkToyVE5SC4FT8RyEV8Le9Z/WvReEHhakwwH5k+eYbt1HQ8yeCkmGcK54v3K7a5l5d68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198567; c=relaxed/simple;
	bh=yipdGphOrevxPq0KLdZW3q1vHNXbFb37fLJbJWlUpi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JnffMZ0qzu8b/ta9u00GPR2Cc3f2hg/tueO5ibvly7cAwJhyAU/ptndV/OQApaTExcjymyLfhBjNBdc6Q7Xl1f5pLGVLM0Bbr+d+GMrvvy5qB1XjsIxKEUx0Ahadbyrw3kjJefU6PqzSQMWPR+ImiXLJFZRn0OMG3h6g64XYb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrddo0Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJyxavEF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BH9hhd1140982
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B7xjYsLOUO8Usx4vVc7C1O
	PAJvdk6UM+PBS+993KvaY=; b=hrddo0Wq7GZ1Xa2BL5upOYw4E0aYn9L8R3pEpa
	LiQcPwKXCkHC+7ETVX/f/Z8ehFc+wjEyzM3HfGAYsuyKHNgP7k9MdCnWHhsjyQix
	a+2vsTQEQic/zIj3/4NvKGAPYSvVRYwtlTKD0LjK8sLPVIBqyvCQ5bExdbvGFClS
	8QimcfU3af3loD1wKt21B0/4ddBCRCFtQn7Neo9lBAFFVjjCd7W0q8+d1hlUlbQH
	i88XIWzx4Rosw2YmMUmP+WfZHninChLnPUzRgWZv+iwy+Q3j8XvAXklM978KJSKh
	kS6YQ8OZHEk9aq9QuJxd3vOoRgvQESTdbjDLNabr0Dg+HGFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er16581sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:22:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304df51ff3eso255609eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198560; x=1781803360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7xjYsLOUO8Usx4vVc7C1OPAJvdk6UM+PBS+993KvaY=;
        b=cJyxavEFtEyySVEESaX0ZB+2Y3AZk0A1sinsZsXyNXlhr9DBbp2oMD1bDvNJ7laOjC
         Ly4FYr2mXPfzPEeKsSCeBmXf8YG+ib+fIDchgELNnLFo/WgSs3lHLbMk7CRE2hFRFsWP
         spwIDcGcRh3v9623kQrl5Uuij92qmQOL1qYC73kaK+CJWNVvR6d5Buei5xSLtfte0c73
         c/tQ1ynu7en0VlvX7EdtPzDNnpnOd3R+UaM9Wqp4gUzIZ6baU/TOHSWB5pvannWv+7j0
         9XZOMnkwbzgk+aVdNpxxOgvNuDBkDuofOO5zcHiabjtk2tS+6Zumg3DmZsj681WJqaE3
         /qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198560; x=1781803360;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7xjYsLOUO8Usx4vVc7C1OPAJvdk6UM+PBS+993KvaY=;
        b=V2LhJtO12Jd2lwH9fM/Tz+SXUt6fyw5iJUg60x26SbqElXPjBHNcPse7zEyeP51tA1
         R5iX0s621aR9qIotsU7gIEw4WCJivu3sNFRCYS/gZxzMJ2kWRCGuKAX8rkgBLkKTduiV
         eEEaPmKM/jASnxeK16O/f5bNTRfQbKlLc/RKlBEJY4Fy2oN+69tGGNaY6OQKflThBI00
         bvVqyztuJG0hhn77imaWCt80yTj3VxYm5rT/pdxr7bt+0e4GEfFc96vMJ6CHOUeB7MF0
         1C28/s38PrtrRIO9Uiio4CivamJzAhK4L3CYu77LVp3AlOKMcyDPn8tVSrke+zi1Kz08
         a2Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9v4t+CIA9c90R9wfO9DRATAez29yoQ6gPFCzqQTGHE1ATJHCdIb/t9BwpWpzas7hsWXZ+ogWcwMut9o5ou@vger.kernel.org
X-Gm-Message-State: AOJu0YwdO9vMYXbEb8e/7fwlHnEBySRHzN6vjY2G5LOa4ZGvu+GFSSNZ
	NXl6xqnXHoTuBvIjLyRrZSxBGew2pRCB/xCmr0txTDfHD7UOLWz52YE2qq3p/75W9kDvjgh4vyP
	6IO0FuIGbDjjUMr+Fgh4+JU0zB9zXvElHzvfKRS6tZGHzd3UY2NFTJ5Hng6OwRpvnwHRSGzJkJr
	M6
X-Gm-Gg: Acq92OECwO8TP7bYc0ZzYl1BbFSkHEhzbhBrCcVpfyw2basSTb9HG+Ku3s9hThl1tEM
	cDT9M/tmsjYN9TTfHb/iI8m7SfKlq1gV+RPGaAbK/bpJ3GGYuwnqODH6Gc3J8gxfq4qruvKr88O
	q/apG4pfLNX5zPkJZdbsc7gO0geuBLutXf2tV2cf1UyVnzjK7mDwIt9SfNaCzogsjIPpaefpkFG
	nfzQmVsCW7DzAwfa0iLmea/bzuIUkUTSl9tlKu1vKAF+MIZLcw+A7HZLLYl8CrwnDe9zxygDn3v
	gMeNHZmglitknGtkD+ltXaeeWBDqZPLzb2XmSuABdj1yjkBRTLB9cht3S7l1RhNEGI+y+8VRhqL
	gaxWeoYgt9BxhLVyMLtPHGc63CHrRoeGOOk/F2pBpBwo4R1sy0SSNNRnHaV1Dfw==
X-Received: by 2002:a05:7022:f40e:b0:137:8bc2:f501 with SMTP id a92af1059eb24-1384214fa5emr2093613c88.7.1781198559595;
        Thu, 11 Jun 2026 10:22:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f40e:b0:137:8bc2:f501 with SMTP id a92af1059eb24-1384214fa5emr2093587c88.7.1781198558886;
        Thu, 11 Jun 2026 10:22:38 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13843025028sm2418237c88.11.2026.06.11.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:22:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:22:37 +0000
Subject: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANzuKmoC/yXMQQ6CQAxA0auQrm3CDEkJXsW4QChDCY7aCoEQ7
 s6gy7f4fwNjFTa4Zhsoz2LyignukkHT1zEwSpsMPveUk3MYxvU5KQaOgqIfQ9eVFRUl1eRbSNl
 buZPlt7zd/7bpMXDzPT+w7wfL+FiSdAAAAA==
X-Change-ID: 20260611-glymur-geni-irqs-1f796376a62d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781198558; l=6517;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=yipdGphOrevxPq0KLdZW3q1vHNXbFb37fLJbJWlUpi8=;
 b=Z9WrPOWBrTQkwf53RLEveluZCOy9z8YApBraqNhbP8cQMyT39DDlVreGLDrgHpLPBon1zy3Op
 qHW2cEZq8VXCyubE+ietaRqjdLYBjQ0JcV0kmoWI1LmY19X/UdB9x5r
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX8xBhoXzZ3GIY
 x6pZ6FUUgb6x8oWll2XHyGUkXOQxjXVaHMZI3fiRSHZtAhr8ur/Jpvfj+tWEaX9k2NcHhAyXXWJ
 ECRrKT9/BIqpn363Ee77aT2U+wiBzO46ED1UQsxm+LRCf2yQIQZv9cDjdJ89Bhv/4NxfYOpXdpf
 apKQmgi9d7StJAv0NemUqNCKJ1nF4eA3XzCQPxTfuwxabcsml80fHDZ0QrHo/29y7IOHCll4raW
 31468QjoGTsXRPDubi0IR8HsJxJhHUAJCPQP1IG4JYI+fFx2rsDlGnJO2XFqUFC/NfH53q5aS1g
 Cq5eIz61q4q9Qp6hmpCGvYEGL2r4sdl9MOTz7XM6H+6Sb2DWG5eg2zbumzhcP3z/Nm9sxMO9NRu
 90deeQoPhy4hF3/dCBQVre2PGtm0TX/9zRI/pJx5a1ikktPLDupH0NIJU/Cw7ouQt6ucmeC7XZV
 ge1dj6G9Ay/mZLel9uw==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2aeee0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rhu6p_SW_4Lw01-mBO8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 1rfcJ_4xj-TLVKt3wV_mvAqUN9GnLwso
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX5VmdlYO8TVS7
 5B9XFXyOheu1jP4VtsQ8Gi6vIaUInstRjSx8x60npfB4ch8FulMAmLqxf1X2TUW3tudZPckD0Ow
 xhi87bbu0MTFBSdL7dbdJV2wl1B54dg=
X-Proofpoint-GUID: 1rfcJ_4xj-TLVKt3wV_mvAqUN9GnLwso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112785-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B25C6740DB

The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
INTIDs space. While some of the i2c instances has gotten their
interrupt specifiers corrected, even the other functions on the same
serial-engines are wrong.

Ensure that all the serial engine interrupts for QUP wrapper 0 matches
the datasheet.

Assisted-by: Codex:GPT-5.5
Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..2271ac080ccb 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -1876,7 +1876,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi0: spi@b80000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b80000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1052 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1903,7 +1903,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c1: i2c@b84000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b84000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1930,7 +1930,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi1: spi@b84000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b84000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1957,7 +1957,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c2: i2c@b88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1984,7 +1984,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi2: spi@b88000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2011,7 +2011,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			uart2: serial@b88000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2056,7 +2056,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi3: spi@b8c000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b8c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1055 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2110,7 +2110,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi4: spi@b90000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b90000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1056 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2164,7 +2164,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi5: spi@b94000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b94000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1057 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2191,7 +2191,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c6: i2c@b98000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b98000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2218,7 +2218,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi6: spi@b98000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b98000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2245,7 +2245,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c7: i2c@b9c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b9c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2272,7 +2272,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi7: spi@b9c000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b9c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-glymur-geni-irqs-1f796376a62d

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


