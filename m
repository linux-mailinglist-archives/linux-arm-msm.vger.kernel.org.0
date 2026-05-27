Return-Path: <linux-arm-msm+bounces-109977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDWhLjm+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A65E21C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BE9C3050BC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DEA3F39E9;
	Wed, 27 May 2026 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ic5CbiQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmiIiM+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEB3F39C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875117; cv=none; b=btiiz+I95HQRxb2IMk1v/jQyTgSicWrgzOaZrHx9F9JzVOdW+db/nKYQuW9YvvwS9FpwPgobQKFmrsDOXQSouNTMMqEx6YaISfJmJmItyDhnQAdo7paJp8DbGJfwYS0U5ldUjJBXWO4ETrlUmth4DD/RHf3G8Kj2fnTx2xxE2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875117; c=relaxed/simple;
	bh=OROsnhPNTOborFjuY73HT43dNiZE4n5sr8wW6GzvJdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2bnKafZTdd2uPHfy0hSAzg/da/D9ULwhvaBpcjk41Ya/upQmbJorNHgV646bRHdmEE057ouCWyov85lOC8FSAeczT3GjHKlzRvtDZSbE0n19zdO3oU7NOURGhrBbVNlL52XHiJgh056BCXdKL2ZoMYfs9zT3pA2zwLy+Hl21to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ic5CbiQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmiIiM+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mgcj4109057
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VUofCzJNTQV
	8qRBR4ci23lFkcf90NmgcqONAWYitlLY=; b=Ic5CbiQJTB/lqKrS7vqxsFbQf4k
	0b+Yt6aSXBDWsLPL4n/5RAuuwR0FQLNxdZ57F8lX3o5Zajz7M6B7qKASmngHKWwr
	kvjYQ/vrOjL/VELwG+s2ZICSNYuGX1BMFKKbtZrt+CXwgtLpi46ccaOs277rFXrz
	AWkISILO0yDOrBn5qxowqGzljxkulLeBu3D+icWstDO+jlMmtDafm3G1g7DjEpzQ
	ymNxldn6W0/GNdUajg1LQuustiyqQ8grtGi8oB0nR09xZVtTCJDlCYdpgKU65oem
	uNNRGaSgRGtcBEXnpvAXkYFSVMwa+IJuUnINeQtiQN7DeZWxzfqpsDn9dKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefukka1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc977e6aedso124210835ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875114; x=1780479914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUofCzJNTQV8qRBR4ci23lFkcf90NmgcqONAWYitlLY=;
        b=AmiIiM+iwwFJuKEepnkjkhjUUNZ3Oxx0gFJq3NzbIgUnMhRAKrEjfgOxhWlSmBJHO6
         rDWQp0yvsH1QC/PnqOYyrevYXM8iVvl8KgMcGRLjJpL2faDbyiagv61R6vBN4edS+wky
         Rnu1+O3HucsPZYGrcnUlATBxZu5acOw3T/Kgq6bn9bY7YGGZ01q9EpR7U/8Cc9tACnAv
         0VBjpUknIaOpkn3b7y9vY+BbhtgyvcYX59o+YzcLnmppLrug10Y2gzNzRLfR73Nh39Fk
         j+uKuvC26sHVRFVtGmUz/OfOu9mXWZqEJ+MIFH0t/Vb1TWKp/Qbt8ATN6qXypqeB7+LG
         wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875114; x=1780479914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUofCzJNTQV8qRBR4ci23lFkcf90NmgcqONAWYitlLY=;
        b=d1g1vC63lCnR3A25kgaKsD798y4BP34tDv7KEetHU4mhdzmyghP7QbMnjX8/wbYRlO
         y9aL9l0Tp8RperfVH3EVir+eWQZCkyigBS0K5OM2M0cF79GMopYHJT5Cdf+r6GB5nipq
         VsyVvvxl8DSCT9lLXjnl2vhdp6NkrxLsRzMAOE/ZFT/QUsc6MkE++pZOYXLYfM2ISmia
         zb/FhrM/AqiCTa8ZuKQndyIhexd5OZw11Lp3Qn16xs1ym2pEt/2PTTmd9Wx1apuE1J5i
         dfSORN847Spsxz/K38Uahe9TtYIEpq2ti8qu56nLw2I0tJ3UULdZqpUsMAWmLrpNjyp2
         nZMg==
X-Forwarded-Encrypted: i=1; AFNElJ/sIqcH4SElj9AGKxJOcz3f2JRhn/bZpCWkRaKsRLqOQeatFJaOIHim890Cek9V655viZPqwVuw4leX9JLn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9rLeO67BIcUZGKlM3Uu8oJJWcmThCssqWfL1Bbc/GtIucG7zM
	8e4J9uvE2mYYMSWpyn9rqcxRX1BdmCq1qnGGtOx2Nf6XN04pkrkHwmLClCxtkA/ManJq/Ufx/7b
	XyZyNilhDjQZe7cDPdOpdvtNGT2PJktq5KcvH08UxH07HLrMAow1rloTa2jdtjWQ6uEn9
X-Gm-Gg: Acq92OF3ZGrzxQ4BEuU8RFXtqRonQs4Ek+nhYxUrqQfzf4qWnwybqtonOfmLI0V/jZ1
	LA/0FqDlixN9Gy59chVR3SAnm+BGEhDid6u6oWrkyo1tMyH4oHqMJ+pn7+oH10LUyv3HE5eOK1E
	gLYNTm68dGbCf6r1CcW5wH+DHG57MPzeJQ4SMwdzk43PULfjAFELvG5fnXJpQUyTvqlLNbbgbGT
	cKgjU1mIviR/CFSE6ac9T9T46dwSvY8f0ttkPXqpg80DssXH5j5tnXMnkzWVdaqNE6ePVSfSnyt
	3vl0GUc8OvMbFYgKfSVkcpxR+z/0eBZ3sT4Q4TaWilZvpDAjdY+GQtA/Wh/Jz83bcVP/+j1+//9
	FKNFIdf6BRgvgvaJ2fklGB+AksW6vHHDeySl/5qXn0UZ0/EFs3uGICqJXG0A=
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256230975ad.12.1779875114462;
        Wed, 27 May 2026 02:45:14 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256230585ad.12.1779875113931;
        Wed, 27 May 2026 02:45:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 23/24] arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:28 +0530
Message-ID: <20260527094333.2311731-24-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX2GUlnjb35xNQ
 2pVA72a+NkE+sQsAORGAYzvu17JU/SoVdTzWBJM+MpeE566DlpEPYCzTkOWusSj+0/9uU2t7qeI
 NTahy/W5gJIgMhKErMPmCGD7eJOYTGfJhL7Cz8GLNHe+fkNs3HdYY0xTIkBIug2pmCljEfy8TwL
 LkcFj0tSCQivRcTmNgGyQfvhMAHd++j1GeiDfmCxguwpbM8M861xr8tA4RnVfUGCujV7ABff98U
 qvRlWbgQIHy/A+MxPLhFHTiIiV2wMaL6a86n1e6yHv0E/8NAVY2htwSznx3mHt486wAnleYUOZf
 LPbFDu8g3wqlApGak2JDALfE5dAWzdPU354mg1zbjnznljJgBwMvRZvhH+9CWE/SmBvPQySC9aH
 682UGfe69i4Af09lS4TJx8gtQny0g2azh74AzaipgL31vqNMgMu5ren2UPvDcZHgX7Dnu/gOhLC
 kUFkUKP5AwePFDj2h7A==
X-Proofpoint-GUID: N2G93mmJFWo-zK34vAUz1VQhDBe5w7XO
X-Proofpoint-ORIG-GUID: N2G93mmJFWo-zK34vAUz1VQhDBe5w7XO
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16bd2b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ewtuPFv0Yv8HAGY_YloA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109977-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E3A65E21C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on qdu1000 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..26cc86d12f72 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1054,7 +1054,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qdu1000-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


