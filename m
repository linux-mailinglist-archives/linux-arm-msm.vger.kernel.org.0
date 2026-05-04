Return-Path: <linux-arm-msm+bounces-105784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JtSL7PS+Gm41AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0124C1C57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EBC73042019
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57024282F10;
	Mon,  4 May 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1CT7o9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCOhXcay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66DA3E4C72
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914458; cv=none; b=KigdJnxsTaNm4rGfMTqtpC/l+DEPLl2BEMBcwbWij+/goNJlC/7eraUdYTlNhiYTAuDLjo/xo03BpUjH3NS2glwCV3iavnZTluU/H3mExYHBzo19agsNU98xFQkGK69wE8wQhS3aAufr1G/ZGChhsNR/QfH2dgy/2ySdRsBuVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914458; c=relaxed/simple;
	bh=yxHmbdqK6WosmDlIEl5iYYf9WS8+dTPFUUD0mndZ3hU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rAPtlrfiOCJYyQyQ/AbzpwMoh6f7evPVr9OUVfUIEz2hm0SO+mU3sMQfuYtOHRVnH7AjfPWUBepf6tbFJNs8zf0MTcILIGQeZSxWj3Ef2V83R/Ga39wTD5YH5CVE0aqtCGouhyiHCd5KNGpCWRyAUfvoC0zu+JLOyh+z441kRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1CT7o9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCOhXcay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4Oek636956
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p7kKiQDi7BN
	iaDBqw45od1LCjR64md1hECtCsCF+nm8=; b=D1CT7o9aglKqFyuFwXuMjIEz7K7
	VOuq4iuN80hIiJ01mHV8rSdOvjAzqfYTj1Y/3fMOpdHDlkQfcCVjcfS9Zv/TJED2
	OpJd7SSuUxy9BWMNJVg91z6sxOSKNQ60SlTZOROO1cIf1gGHnIkNaO5YPCQNBLjM
	XaWguC3Bbh34xu5/BERjgS4P6IFbQPyPozkuxxzlOFUkTQt+evZphtslXdBdE+CI
	xwjkQRacO0dKTokEBGPIADC8oh9O8A8DImUjZiw+ye2an8Yf31o/wA2iwhFLOj0N
	/B+JmXnDMEj+5o8Csgy1YUgbJYP48jdQvX9URJ9nKjRhOsY5FJpfzFmSmSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx499ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:07:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7948640854so1801342a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914455; x=1778519255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7kKiQDi7BNiaDBqw45od1LCjR64md1hECtCsCF+nm8=;
        b=iCOhXcay2k6INhCfSp3tIUGmBle7ejEHgFVqnpP0DVnWnDTTCAqVWCkfMsOpdhBC5x
         UC5EvMVF22fsAiHDWwea8ADDypHmIkOVi+Cced6iWPt9R1NlxquHQWbobxZyyCkKTzGQ
         Gw18j01UaLuEBwz+c77XKjGdvHFMlntV509F7t+u9A0Y+l3azV5Q5Yp4yqsvZ+qk9itF
         YMMlz3UpDdXAQvaxr9strvd3DYOcrOtUl6M5CW49UA4GqOl69JFUC0MkmDGiTUwOPEBJ
         +GI1cIDGXAMRrr/mcV7nlBZaSqnz5En9ozfeMOoiizz7O+Inh2mI6CIll2LT4ot0ZoT2
         XPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914455; x=1778519255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7kKiQDi7BNiaDBqw45od1LCjR64md1hECtCsCF+nm8=;
        b=IaIzJNMK4gvy/BMhTgr98E88CpEC92mTAezful/o+/7Xfa29V2+2Z4aYzUo/T17p5+
         J1TBNSGsXI6tnUVTwBKTP4lk18JljSIgUVQNPQLtAOFr6fldM6x7HfvAPVpDhgUdJJzB
         7uojvWyHRg30JgFSYSXWj5vu3dPhyKehG+GDcPiXfY0oVTuNyuOAAOTrblP0ngF25KjU
         07Ir7eDn/X8CBCPhTcG8m4YX7xstIIaJqeIze9EI5dEMI7PIxpO0/z7iVlLsI7Xx5HTc
         EvpHp/xR8DFkJnHbaChpE8YhwTzMuzsf++dSvEMGwA2LZZriuBR5xamMoJHZz7bYsR7U
         L6dw==
X-Gm-Message-State: AOJu0Yw7mCof2UQOJTcKx+gqIjocWYStD/clX2wXXTQydWwRxhyYd5/Q
	hLZRJEAobAIaUXN1RGIul+g3V691NDT/c8DdGsW3SLxnpy5Mg2c23Cmmd7/10+9IuU2dT6snxW8
	tdSNUkW0AU9nCTkfhdgYkW0CTARyFZDuSoRl4gFbinaZCfdUW3Je203fX7lgl2Z2PtVcN
X-Gm-Gg: AeBDietSv1WlNXaDzXsFcLEdFEDbhe99RvSxgQg9BlBLi7lHZ6DCA6ZVdl30dO28wZ9
	wY8QTgx4g+Uwb2dJq3lNNN01ik7sjV/eAFLTSGVXOxCyO9Q/X6DBJrPvAphjYvwR7ytfP/5W9q5
	qwOf34aADCfEFCaWNqu7S94Qyyd/7u3udxVzJCgIv1S5PrRymbWmLvoVD1EapUD5oUYdA6ZxvPN
	PepbVw/B01vgqbOJbijws3Bky2rYBValWPRkyb/nSmrzNGidDm3zSCtwEndaAh4C6gfBJPi0Jxs
	pJx1xsOyR4rQtwVq504K7tsb3pv+EoTwq+MvmxfPizKO/b9B61mKQFmRACq6hehpTRnG0/ZB9RR
	JBJ8vKfDKrpk3WagWCqzzbDuzJA7uf6wLvJXx+x0lW1WUs7ihYr6xs6v7GWNZUZRrU70c7SXvdm
	GMVxeWRRTvT10lb/Jj9NmTgspnrg==
X-Received: by 2002:a17:90b:510b:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3650cd08149mr11462695a91.6.1777914454991;
        Mon, 04 May 2026 10:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3650cd08149mr11462665a91.6.1777914454469;
        Mon, 04 May 2026 10:07:34 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Date: Mon,  4 May 2026 22:36:59 +0530
Message-Id: <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX/Fw/btd/amYu
 tN8giQ0WaS49QnQoWx9uhk/JmE3eezj4QRaezJa1RCL4JJ+LsQPGW9fa+OhUXNpBdLZ9x5/dC2i
 WCvOVAH/Mna799ANvHTsGMvx9wPtRLVZNmWEr3hGGvVlG5pc7YSgN1K8xZ7JoV56UPiV3TgMy3X
 2qXdMcaeyjFia1sqsTEDifdnutxfhal9nYn5gcfLHBTgI5k0aAX2bA5S6pHZS7VEkbIeR48XDx6
 JekuABXWOfBcpe6nMzrjhT3trTO+nUc++AmZ/gQYlnVZQNVqkwjyNmtJu1wDI6438PqTA2SPjuD
 TxkF7faSjr+Nou/JO6U1ibnVoI0DL7hDQlKPCgj9ERlsTZwiLmMvbBx/33UjBQaGre/uCxB70Fa
 DvKBGxsArtECL1GjWMfdZp3HZifOzcj5it/FZFW0njGR6OBjL5e0fwqKD+26UE2aZLP6yn643N9
 4QeWIWpg15p7KHIZfIA==
X-Proofpoint-ORIG-GUID: EDXDEC7-JyMO_skAb7GBx08S-entPoKy
X-Proofpoint-GUID: EDXDEC7-JyMO_skAb7GBx08S-entPoKy
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8d258 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=K8LLhCEcKGHaonpVBxsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156
X-Rspamd-Queue-Id: 2D0124C1C57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105784-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add init sequence and phy configuration for the Super Speed port
on Shikra SoC.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..400dcebf8222 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-phy",
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-- 
2.34.1


