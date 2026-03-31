Return-Path: <linux-arm-msm+bounces-100923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOU/OtYZy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA96362D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4A5F3080D60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4503D299959;
	Tue, 31 Mar 2026 00:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1ahBajX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItTDOnko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A632741C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917635; cv=none; b=mc6Icg2ZJYEx2Dc3zG0fpldVhXGYEzw4fJHqCbU4YLiqNrPvThnDX1RbVCUPS+grz7QpXKdWatlBo0USnrNLk50pRq6oUmsxf7d3DPCzl/CaF1R2HT5gfDoAcasgAFKrWEGrVyCdg2L62agNChGCEentU1MvJzPv9hHRrn4PQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917635; c=relaxed/simple;
	bh=LfqcOZfZvhcwZNbwczyCORllU/SVkunTmXAiwRXBkjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DJ2qZCKUVBOrT1ouiIoDddFf5U3qpgqPRCQemTX9chiOkQ+GN+dro2isAKEhzl6i0E/idp3D7zYZrfamJxlDdf+py/Nk9wCb1btotBqME14fNbXKcRgbw7m5Utc/DT2+997gZuOfdSEHFajfJoKJwo19d5I9uOn+aPOL/vgtmuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1ahBajX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItTDOnko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UL45Op1841971
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yGlqzkun2mmYZWtqvl1ev6
	vbHU8gWKSr0vNUZcrj+RE=; b=O1ahBajXtfwbeABd4Ha9DEiNuVlD0+t1N7oWRn
	KlsZrp3Ohka/u6sprFpQGUavLFUBeG+t23lYkYtE4j+2ndyI74SoqkwxrzrFSlpW
	hH6GoAhVnlDmFKpPIxx2oZIjJZVRSrIFHcsnfzUS2HEob4Yr8sGS8a53J8k1qgXf
	0P6vYt+fTqdRgip++O1v5vPNuzj4NHNyViA2drXU1iY1mMhfgG7m7Qqwd3gFbLfQ
	9AttlE3wnM0grN1FPAVHLJMDT2BwJXyctxXVx1HK4LQiXumTQN7bh1YDWPCwXcpY
	2WWH+y8pUgjTAksJdod3FAIhgZ4c5fKCJcMmrP9ypw4KIQJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsgjkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c72849f648so2617100eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917632; x=1775522432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGlqzkun2mmYZWtqvl1ev6vbHU8gWKSr0vNUZcrj+RE=;
        b=ItTDOnkoEXbTlLWxPaJpJLRDRRuw0AGSCcWCgu/CyziAzjNo9aX8vT0aa4N6ZmG2Cu
         L5ecyd0LwJUBXeDo0fwmp7LtHQs7CpiHXm11cy/MNMOzeNEI98gyJKZ8v3Aad0Tw84CF
         H1fcypQ4dGkIpvUnR5fr0JZTbe+4j4Nmoz/EiyehJKSGGUs8l82InOMCPur87BT2zZDR
         Cy/gG2la0F9m6Z3uunQ8uKAz2mP1qIPQJ8W/eq9F+Z91Bafu0vlpc/I23A0gRAd/gHY3
         d3WsBi9HrlQOUfTYVmnrCmnh0zuj+fD2pVWQkPEnOm8xhQVOPMtgZ3RzdGjMpZcLWiy0
         FLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917632; x=1775522432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGlqzkun2mmYZWtqvl1ev6vbHU8gWKSr0vNUZcrj+RE=;
        b=CFr3JELv8BfxVGCp5NUI5aoKBUXeHuS+xWiYi49gxTp7ENmUnsITNSZdHhq5gPhRTV
         kUuLAEcblcJrIfGyuDZWnM8DJVt2N0Izye6KfX6Lk0kO+LLnPeiSab+sHVWZIY4B4me3
         aUpRWbQWQsoNiucSW9U6Y78hAoJ9SbTN88VIAbXpw3goOZBnr7NkMbGNz8xbIwFMsjhG
         pJQZ7mi3ANnDHkuy1Xz6sqtleCUYg2IY4PVXUyBg68BogOr5ujWVZYKjhzx4rMCXf1Uk
         MS1D6rleud3SRj5pq4oGcXvhaakvGAh5Ne3ehacADAPwiDnuzM7hWyXIrBeYWHjpTBTL
         68Uw==
X-Gm-Message-State: AOJu0YyvPlEhXN0ep2C08UbfjA3d2Y7Nedj8GC/PU4LEIIvgv3r1S/fg
	qgwuBA1cdKnxRJn1gvB/QPpnC2NIRDYHXgeaaKmlQEu7rmc4yQnyDY28lUCRyh/8QzoIMr9Lcn6
	3I7GCkaYs58dc+mm8yb3ln54Jd0Y2OK3PSvaFPHA+iuKRtM/WLdZ6UQmY2nhQ82mX2zMP
X-Gm-Gg: ATEYQzw/XdRYfPuG7YaBbN0G0MC//Ne6XfZnUsVSwhpnR/IBwNiTOivF+plpXzJ9eM3
	+78cEEB4G0Akp7WktnjNJgawoXozbulDQ4+8joYopN7FRtuz5ZuhzlehvZt9Dq9wF9upeuJ8nfr
	4OJBhHIPLsUdPgM4VIWw0AvVoF2eBJrT4T1X2MdtVohVL5vDV1skwQfaLeRhqyOEJxHR0bEW5CP
	k9t7g0Smh1i1WNw2qg1nHcjPdUHL/XiGZ5+Uza0ZgX5DlKTsAL0Iecl9RouEo7fEYyLD8kM+dhX
	c3Rd+1smmYkgjLR01KPibc9KK1OXDoD1QYpjphG2oKiZ4mdgjtPPgPfTqOUB27htqiGdd8WtHKc
	9gSVLJd2TGz6hm6hu5xYELMxUdCImarfxik+kySTDcfHOyVgx/r0t2B8GA64yvipMdNSAGWVdBR
	xo
X-Received: by 2002:a05:693c:3008:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2c185d0165dmr8811674eec.14.1774917631785;
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2c185d0165dmr8811667eec.14.1774917631217;
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c10361e7sm8959988eec.0.2026.03.30.17.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:40:30 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
Date: Mon, 30 Mar 2026 17:39:59 -0700
Message-Id: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8Xy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3czkZN2MxPJM3RSzlGRDM9M0C0tjUyWg8oKi1LTMCrBR0bG1tQB
 VxmfeWgAAAA==
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917630; l=904;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=LfqcOZfZvhcwZNbwczyCORllU/SVkunTmXAiwRXBkjI=;
 b=MDpvj5aQAAeoHrotKVnzuHgYx7Ia2rbhJRMSzG9xSHXHql/O0gmqanoOu6XVPjU5Lp+2eQBVC
 4FHloYIuq0qB7LMlR+EFr1fJWJEiiESmmok2FiTJtemQdsIZP+IzEKj
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: D19WjpgK0zsj6AR4_kh3axGSAVP-uPvc
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb1800 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QtE5Bt5ectBoWJzr9z0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: D19WjpgK0zsj6AR4_kh3axGSAVP-uPvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX/uRbJn67swYP
 JDMliicmwzmuN1ecmm4hvNl7axEw8H+dSbaYYmZBTG+tLVKRd6rBCB3fBDpzVUKMDCgAPXqEeLL
 Uy4+1xuBlRmBVHKB28rAy+VCRJ5jXSWTCTW/be/u8p6Zz39SVw9vnvfBijB7DYDzFk1Vb0KmHB5
 5BTFRMS7DcDpAJ590joLpuOfOW2jzPdq5moUBhCWxttR+wUNbnBvJNTcYCE4YGUXiv0R1eXfZ20
 GTKF2QsCyi9hyR8o/mGRS8/UIOeH+z2+pVXhVxlXnvyT01KXLy0u532f0W/bR2hxFcffI2HZsJM
 6RYlxryLTfGQdGz1tuLii6eJPnrsg04SIWFe2SwOqJZoZE0AJCqEWPZ/gYbsw1jrZA/I6Ot9599
 WPxa5eCyd66OL+FFJlZrc6QOwHbrLTMO/VIfFUzv8eFfoW8SAgQDh3FunYxMF2ot/SiRxn5hQ1A
 573IyE1myrbUHuqlfMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100923-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FA96362D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  126 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2322 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


