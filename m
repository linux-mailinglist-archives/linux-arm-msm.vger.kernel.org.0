Return-Path: <linux-arm-msm+bounces-116871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z2gSE1W3S2prZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:10:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDE711C25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DXl9SE9z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S3y1wI7Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116871-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116871-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B93E309D2B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2013033E3;
	Mon,  6 Jul 2026 13:53:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF4292B4B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:53:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346005; cv=none; b=a0sG4ZOA7Rj/IhHiuzeVI85ZMiQRTrNuhTyBScs2Pxg9WOt125KZZX7mLmZSQXYJ+8lLeeK1YoGTSpVl1G4wiZJBphMuA3Dgkt3xukw5IOA+0Gd2ryiktpZV6/N6lHXnytXsoOK9g4ks+fAh7V6NH+GXoktSqCdwL7ksC1qCddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346005; c=relaxed/simple;
	bh=DQ9tdQg71CEhScbdrlvlDz6O5dyiEfY/OFqLJIXLap0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gm+0jCa6MHX2/InWHkzhd1XERSRP+olyys5n4fCZJteqir5BtEvHNvkDDUz6YIxlJWy8L+8NoyhQHvDDhX8oKp8OfHVllf9tZV7/WymdkOKsSZ7IMRKS9f9/oUqTOR4iXmsCsCYZVq7a2TS4XOW4C/o4AlFzCRVqInHdmp0EPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXl9SE9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3y1wI7Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxNJK402136
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=00D9UxEKhvn7M0h0JLLCeW
	xotg46sBowMcnHLIfg5Vo=; b=DXl9SE9zWP2E9/UFGgCs36sR58nFcPzounSJsA
	gM9sAxUedO1LGjgzTTfqBaJM9oC/CIl0NX8SJt7m0ZB1po1Pjg4etr9k9isdl05Z
	nY8o0AJliRelTP+JkAnwpprZl/UFSqUVHErBQOol5xZacplOyTiulmgceyBsK0/U
	Ev7oAtoHG/G8yedLOLcqndjoryzGAvJPHpo1hBqLesH/ISB1ZOAsUPu/KbGf1ESs
	C5oQZ7L/2v3rkXMaG70iAStdqofU189RuCX29E41TvEgZp/IG8LBLe4bwX/F6cpB
	0xKvc3WSL0ybsl4WM6oCJAxVGhfPYbXPIIAVkyfur/LBT18g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grwuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:53:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0693d194so1217172e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346001; x=1783950801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00D9UxEKhvn7M0h0JLLCeWxotg46sBowMcnHLIfg5Vo=;
        b=S3y1wI7Qj/xP/PNHo2cfMt+MMxyF0ar62fooUIxWZBLrNEZKF6K2ckCbQi3vMXAomj
         P6EMYMRHk1lStPFIbr+VUVVtBhvOf5vqV1UZ0HEMLVktX2fbFpCWpP4o2ECnlhw1gcbp
         STunMn51UZDr5SIFVL0D23tHHe3XJJNOvcjjid7nMUGDLivvAVjzNoaH8L0HAvA7mZ2P
         sWVDlIiOAuOYb4xDRoLJXcmucDXULbD8BZ29VUd6dQD340/l1cGLwMb1beVzopeRf4Fo
         Gd0FnPEQlVvrh99Sa4tO6QaxSvpzhekDaw93rvf20QmN4ER/L4PjCuGUh5cHEugvVykI
         2z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346001; x=1783950801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00D9UxEKhvn7M0h0JLLCeWxotg46sBowMcnHLIfg5Vo=;
        b=KJzjq15HQM19H09b6bO9wWFPYb6NL5TLD+BZOcNzfhP7gpzeTKvD5JpxAwqGvYfIkg
         0feJn+bt1Kz1haTMEQn67L4ncpHB4/PpnnQeknphHU0V/a3XbRS4wRjGscqNQStFTOWw
         8YjV6ffzBKdc7kJX2MANSKWTWPUo1ApXVmCRQ+PNcBPIVSzzwQWzAs6L/nD3LFvc+5pR
         0acYa0VyWouUSUCW2usnQ2heaa6zfnJTvIcMoEsj13cF4TWDM9VWlYgHWaedvOkfIiy6
         iYCJ8rdHCksFpXlTBZuqFP0kV4/8UbYpOxArKwNXd6f0LhC128AaTVhX0hIh/u3cT1UI
         BqNA==
X-Gm-Message-State: AOJu0YxSpqK74/pOVjdlFzYKymqhFFatg7JAj8KVg2GCSA3bOG49iksI
	x0AtNDgXXtfwyVO1jRNV0wmtZYz8injnnU7nANHsQ/4tTItW4D5sXrm8+FK6qJWVADtoe3eaKbk
	wj+iWzwadT2M3hiT7KgLTwhd7HEhjLpBTmzxYmGCpaNHGveo4FLBFISPLLPmn0jNQRzjX
X-Gm-Gg: AfdE7cmyKU9wCHmlsKx+tv06Xw2hUmkwc372vPeUxKHFgg9mk73ml+KciUZd6SZ2o27
	upJsffoZWARL28T1OKgPYw4vbsW3en9UNSKCaa+tV16LTzknRBnCoZ27tsQEIOBtmHWIz8KcKSU
	LGZLg2VaCQwew2Qnj0P+MFbu9ZkHLvOp18PivrWdSCfOvyfB8Db628W9NoZTdsoDxe2qmHwR2m3
	Q5V8AH9DnLt5jHl0zJXC5dD5Ek4yMC6clIXBv1G8aZYI1ZbFysNyJB03eUj+nyQq2cS0w/+1WfF
	SjiT4/hK5KsMUmaR+hekuOiPMgGko4XaNsHWx2cyk/GI8mLgoO2I17OLSrsoCgj3z1JyVBOBVZK
	OzUWIA9bI2Fgil/KmuIEC54XOLrShDs1pmk+3VxNsRBNwR3n5hluzYeDyhHVY9zCAmd0+I1lA2C
	bv/6C1OmHMv0I6vj9t5Ymsj045
X-Received: by 2002:a05:6122:3b8d:b0:5bd:c6ff:b6e5 with SMTP id 71dfb90a1353d-5be90517ccfmr372205e0c.1.1783346001209;
        Mon, 06 Jul 2026 06:53:21 -0700 (PDT)
X-Received: by 2002:a05:6122:3b8d:b0:5bd:c6ff:b6e5 with SMTP id 71dfb90a1353d-5be90517ccfmr372186e0c.1.1783346000618;
        Mon, 06 Jul 2026 06:53:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm2932551e87.16.2026.07.06.06.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom-qusb2: sort out register layouts
Date: Mon, 06 Jul 2026 16:53:13 +0300
Message-Id: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqzS2oC/22NQQ6CMBBFr0JmbUkZbU1ceQ/Doq2D1AiFDhAN6
 d0tuHUzyct/ebMCU/TEcClWiLR49qHPgIcCXGv6Bwl/zwwoUcuzRNH4txhntiiOWkqjlW2cIcj
 +ECmPe+tW/5hn+yQ3bYHNaD1PIX72Z0u1ef+6SyWksMo1SmmsFJ6ugbkcZ/NyoevKfKBOKX0B1
 C+tMLsAAAA=
X-Change-ID: 20260702-fix-qusb2-3600a65bfcae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DQ9tdQg71CEhScbdrlvlDz6O5dyiEfY/OFqLJIXLap0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqS7NNiOjSi8y3MNh/Jn7u3BA/nhn8RN6aeLND9
 zfl+iYvfIqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCakuzTQAKCRCLPIo+Aiko
 1WNRB/96XCowCqlZWvWXluPMOCDRxATguU7K5R7qok60qsCWHY4LHr01quDyrUfB9PR4e1gO4NP
 AeEx9JAtIUV6QCaEwDFL+vto8vTRPrOgICsEu/Ubt9jQxX+hI3gt3XYmHBgP4b0i4izhW/DDHWP
 G85rFwNUytfUiftDz88hH+fpNHS86IZVrGwa1c7MCMPnIWF8p7r5r4JyWEQNLvdZkVnl2E6vq8X
 RORW8/7dUTcTORAAtzqRu/8iybN1Ffd1wL4/AAnbQ6D8bD8eUGlVqbx69HIAjdRgKtHIsGI/Ewn
 tzJhXyPxjAxLSh+fx6L+zcld0aAr6xXGJXBz0GkL/imB14Vh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7MMtxTWOSpdAerhQv1C3zZUacOVx1Dh3
X-Proofpoint-ORIG-GUID: 7MMtxTWOSpdAerhQv1C3zZUacOVx1Dh3
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bb352 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=LpQP-O61AAAA:8 a=JfrnYn6hAAAA:8 a=vLZ8uGs2IYTldnpWfJ0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX+qtV91u7DXBW
 gN8eB/E8l8CqeFQ8PSmGQlqShLT4qPAFH+r4p9G0K5KT8Jc4n/56inYXiM8s6RauWbnMHUpXGFK
 0fidRt4QjHXsrj1U9TlOLPllTz9+uXPqNtAbL+3XcmCvld751c7ZZZMHyefUI6If97KLpuMvDUE
 nqQpOnIMEfVF8jQI2Xf1KnQdHQRMRbccEAhszQG02XibC3RlAdfR/Q93hpKTu7XrPz9KWOqyLhb
 MpdqDiXsUw9YhTYdCxmfoksiOxvIC83b4d08e8x3NKcXmb5ro+hVMf8y38wqiy7VYTwkEcuF1SD
 8xyDtur30jrikA/kBRMBMsOF/X8nzhMCvq722TlviwQK6qZQO+Uu61P8yS/0T3ZVkEkKmY73uqU
 cdKo4pk7parUS7eXc65y9De7SvOcvX6gTJgG0+WFT8+iFDU08MP5y4mS/Iu2nhuBUU95K02Rcgx
 a1f6OEkwJ9LcNOnHJuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX0tqzoacCGV6v
 3xfilKGYw98IVM+LoHtz1TKNvDg7o/NPBXBCJ8qNi/g+QRx1ip6fBoJ3QivwY4wkDQWxhxPZU9c
 RP5Fk4Fxz6I75yeu/Dn1Wl4t2McVsZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116871-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7DDE711C25

IPQ6018 and MSM8996 use the same register layout, however for historical
reasons ipq6018_regs_layout ended up correctly definig TEST1 register at
0x98 (because platforms using that layout didn't use autoresume), while
msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1 layout
entry. Fix handling of the autoresume register and definitions of those
regs layouts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reworked the series to enable autoresume on Talos
- Moved autoresume description to the regs layout, it is a property of
  the regs rather than a platform.
- Link to v1: https://patch.msgid.link/20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Kathiravan T <quic_kathirav@quicinc.com>
To: Baruch Siach <baruch@tkos.co.il>
To: Manu Gautam <mgautam@codeaurora.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Baryshkov (3):
      phy: qcom-qusb2: enable autoresume on Talos platforms
      phy: qcom-qusb2: correst PHY description for IPQ6018
      phy: qcom-qusb2: describe autoresume bit

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-fix-qusb2-3600a65bfcae

Best regards,
--  
With best wishes
Dmitry


