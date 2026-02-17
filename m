Return-Path: <linux-arm-msm+bounces-93225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJpJNcLLlGluHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:12:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18314FE1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D2C0305BB80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 20:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FE837881A;
	Tue, 17 Feb 2026 20:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke6sBSXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFdVvGuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1253783BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359095; cv=none; b=szkInEkgWYuJaGEKUvcSfvQ8VBNHY2Sz0j9d4JjBv03MMJzBrg2jR/rS7jEXbkZNuEenwaH62T8gtZ3tkY9juQfB5DQCaXkzLtdJCJEOI2uSy62NFlyi0dj7MncfZ+XmejVXF5qDkSRetUkh9vd8FIxirjx1qLiAEHCHnbhSN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359095; c=relaxed/simple;
	bh=cWegLftV7m7YffD98Ot4PCvsUEdERcIm2QMBl5ekQzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nkk0ymhYiekN+iMnuxYKJ6EmU1wpwz7FGWay33FuY7z0crsxmd2xFEj7DALTbCLWhtFO7zS2IyGs4zgT0w7OfTA07awtATn2ZWTEYexKWOHsZATbtgeDyh+6Kv6XDCAYRUepDlev9XCwMuM4V8+ut4vNlUOdH5sxslU/iXmBZfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ke6sBSXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFdVvGuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HH7n0j1545005
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 20:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U4LWRwUn9sJIHa3iVPT1Ps
	amgzgdpUokfwkXUCeFWss=; b=Ke6sBSXqqtggbM8ASzIxNDJuDgvuGkB2x9O9s8
	9wqw7oz8ttfPUBIc6b/WU4J0TixYtte9jK9dLwPuYuFAlF0Cd1NDmYvrGlZrUjea
	jLroC4Elb7zXE+Vd0Q1fYY7Ax6ueqKC0ZgAsglpETV9H8ifVgbynP4jxRLkITsjl
	72HhA2y8lbUIzrRv1AZCxpLCW2cRi9rYo597b72z+TWKs8fBRWj9iyIKbQlXTWVN
	VGBOLp3Bum5+q5S7OwglHO3FRT28A5AHtrREk+s0UlypPuaksPy0SxLDjvNad1tO
	xosOx1dLYKw9aeR7d6XD8cpECDIPg6VfFJigvSeS916a1XsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajunnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 20:11:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba728aa1f9so17066832eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771359092; x=1771963892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4LWRwUn9sJIHa3iVPT1PsamgzgdpUokfwkXUCeFWss=;
        b=QFdVvGuWWrdVCTI8AoHPVI8kH6gBIkk/2jK+JKMigtqFkEqB53VkrWTiAnhfNl1w0i
         67chQwlXgeonbncCdEXBRT5QLE3BqHl/5tuHM2BZiMLBdzIDIuAHHMyRtBG9nzY7bJGc
         wKw7imjHeKdGiYUiczIk6qLMaTHJV8TqvNR7qB957z802HWleWkM0h5pCmNixonhZMwj
         tei3Vs+KvobUo/flPAWsAi3i09ZUA6VHcJZUZSRl84FQwCjAWe9HvUg6BX3p/7j/wPao
         nJugNkhxWjHxbW/3Xo7VENovpHotOQYvjl1cLw5m1xU7oFharGRDtsSZIOg/+fRnaFtr
         3wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359092; x=1771963892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4LWRwUn9sJIHa3iVPT1PsamgzgdpUokfwkXUCeFWss=;
        b=qhk1K2MQxIbo4CdJC5UxZRDdwr+3TEprquhjywBhpIO4mVjyeqLAO/dTq4egDq/HP1
         1SsVE4vV7gad8+W+8YzLgHqCta1QcfKmq0QxobHLIm8nTUQKyNBtxrscA7bTnn457tfU
         G/EB7DHmDNePBsOswwneNQE9s+ZZ3Aq/ilMJJzTX55CnIlhmmKHdaCrL3z5mdm4Fwukp
         qohXa0v2VSTcimpgX25gzyTQcPD6bkOkH5X7wESBQ5COHoB18ALLEu9TrvVvVe6gbAvN
         cSzW3ipTdlTT09fb+9fB+v9SNwIoIhHspT5escIZ472EssZpIRHQDKuO1q64PjfRziIO
         8Fuw==
X-Gm-Message-State: AOJu0YwiSRLP42bb0ZqTqRl4tdg2IHz6MlnEluHJhSiQxJXeB/TBFj46
	m95dfun73oT/Ds6b7fyllTR/jg7eFlr+NMkpoFfABWFfSx+wkb+zf8AQp2lven36W5HwGiGaqru
	o2+Aj1VSJtdnma7O25SmxeDtjrWPZAI+pfL1JAtdHtbnooiXAn0vZRf7P5ko4RwamnOIH
X-Gm-Gg: AZuq6aK3V+yaGo34SbT5jtTTVIsC1YjBWOi+u+M9dXpVhaQbAoD904puo7QzRFJND9b
	Zt7v3Qj9QXeeSUCjnmvi1/12CStduKLmIu4RLzu7df1wO9AJYXJO977YgcR6bXyNZpv41YxDgRY
	Fe9EufG3A4gSd8TM9pBLDxOeB7Jm8NiMHzEFvnsPgj8VRe8FXxdEOCFd/WR5ZEzw/Y2DjDvvoi8
	CPDYcLHxvc1K2aeYjHEBMgCEcFpv7pNwIs0FREmFS8TBewvFoJxguwEC6k+92TRJQv24PRQ8XOm
	UvCqrmsFGpGAp3UbwqCxYNZ59ijunjc9qPMwaWxTdp16jeDleAc5gGLce7ZZ79gpEPLmxVG9qtN
	qqD82wDZoChrYus5yWT5R+lH7VLXyMUPhlEkuj/CS/oRFdQAHT4ikDwOj9tC/DvbWdfnG5Tv1Xe
	M=
X-Received: by 2002:a05:7301:1e4a:b0:2b7:f44a:a688 with SMTP id 5a478bee46e88-2bac97d96b7mr5221000eec.38.1771359092065;
        Tue, 17 Feb 2026 12:11:32 -0800 (PST)
X-Received: by 2002:a05:7301:1e4a:b0:2b7:f44a:a688 with SMTP id 5a478bee46e88-2bac97d96b7mr5220983eec.38.1771359091526;
        Tue, 17 Feb 2026 12:11:31 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658531sm17319194eec.18.2026.02.17.12.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 12:11:31 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] phy: qcom: m31-eusb2: clear PLL_EN during init
Date: Tue, 17 Feb 2026 12:11:30 -0800
Message-Id: <20260217201130.2804550-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE2NSBTYWx0ZWRfXx23ixVuHPokl
 HHtsf86ekAeLlCoKW6AL9VjY+5vZSP2vttHxkJqYyp8hrAb/+NpwPQEeHZRwsjBv+K79Ab3Ukxq
 cppU+3BVamWMk2OhLnkS7nBgQj1fti1F9cRGcUJ/JxTFHnHEZoobQVloIBXBg0uwcuWcNWsmtr/
 Y6Zt2FwNmRsvxo01faYZFGFPKP+ELO1VRtaiRdaPRkj7w1b5H9GzBUoSv/y+x+GfhHjY/3boI12
 OUYtSevq9wmvpc2g2v7BD8r7L+tBF61dgpRBgvC7SIPGXYKzxgBp2N4Q9MufEttv64JYAw8NaNi
 xYnk2L1fyNRjW4byBDGcqmzDEhLZZ8enXOCAxa7mkprnuiljbZs018m1hHNwdm87Bhhb3ytkHnN
 FxhUpZnjIMGGR96Fp3ehHTyvyZR6oPb5+Ronf/fNzW8y9gdYK33++kPdqSqgLIcLpUD2UEZqSmy
 cSJXVJFODUCE42V1AbQ==
X-Proofpoint-ORIG-GUID: HT1_IShcl4oQ61EVz-T6DtncOKQw7NdM
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994cb74 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=49oE3CkF4HoBucdVWpUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: HT1_IShcl4oQ61EVz-T6DtncOKQw7NdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F18314FE1A
X-Rspamd-Action: no action

The driver currently sets bit 0 of USB_PHY_CFG1 (PLL_EN) during PHY
initialization. According to the M31 EUSB2 PHY hardware documentation,
this bit is intended only for test/debug scenarios and does not control
mission mode operation. Keeping PLL_EN asserted causes the PHY to draw
additional current during USB bus suspend. Clearing this bit results in
lower suspend power consumption without affecting normal operation.

Update the driver to leave PLL_EN cleared as recommended by the hardware
documentation.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..68f1ba8fec4a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -83,7 +83,7 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, PHY_ENABLE, 1),
-	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
 };
 
-- 
2.34.1


