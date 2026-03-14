Return-Path: <linux-arm-msm+bounces-97677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOdqDuHutGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:15:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB528BBDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54BA5307C278
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFC9230270;
	Sat, 14 Mar 2026 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFshEK9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPJ5aT/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018887082D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465262; cv=none; b=tagDpJUeIxGPK97rAo51SwEv4ChqdYYIo8v4WQ23I9F1HIB7Dy0qI18nWwaNKFe/q96GUGGo3JlA25eJsVRvHZLWzWiDKchxFAOd9mr1FGVcJEVYJ4zNsLhvGsqYwikQmWQiLA3tvqA+3GLxRT2gd6L1DQEadujVa9QYkmr3MAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465262; c=relaxed/simple;
	bh=848Fj/Z/lmHBoZR+AcJYjpxEVi4YqJ4VjO29BRbWLoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZTBai3Xy/7uTCD+5qYgG51e/VJPgGBFnCCv05anZYd6rw+ZUassVxihQDzUen0pVi66Ulc5O4fo5ebEFnKpzQAmi+jDU7Fck5jMujPa9fo/5MHUQRtU9t1wvdracPpy8vVQRfuwdBFWE/Pz79shkjhm4YyFNsGrUSKgXShiUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFshEK9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPJ5aT/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3gUut2920788
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQ7UbaX2oRU/+Phhq2OeYcWf31wYO1Qf4Sd
	1/DK17RA=; b=PFshEK9iIDLsMk+ZvQp8GtsWdg0cd9JHC0QTtRcpW1IefUaHLKa
	CfKPgitn8hayYA/YtnYF/vE1asUzqxtCj7DXDa66Aha4xSaMN74HquouNbp2fZ2y
	/8oOnXYTsF/g1NoNMJZh330bzbj+2Oswynhs+Ea84kRVM2LVcjoWneH1OFYAT8FC
	KnKrLx4iR6W+Zbu0/5eNegqmjaSIk7/2ag0uqDBnuqgStlpXKt6dbg/ttbPJ84u7
	m0wbFkVAzfc2GEtgTDhzFQWSa9zFO2PfHHCsW1+xNc08xDW4DzLtjeAjri07vgdR
	f9n0VlvYacDWG8xxcU3n1gtr7Yox2gghT4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00b84qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso3265207eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465258; x=1774070058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ7UbaX2oRU/+Phhq2OeYcWf31wYO1Qf4Sd1/DK17RA=;
        b=DPJ5aT/eJMLw8EYANEHwY/D+96M9ajX5YjFYaw0RpqeC7tdNjV/hBJoXmk33rNZtI/
         m+89ASVL6/I5uj/A0SDDl2nwx5WPhjKWb+tpalrcczjdoxxxbB1hfqMLoTTcqANEzs60
         /D3RubzWEu7t3qGacrmYl/zwufKE9lVfftnjjOqHzLEoM626JoZA9ajJlX1lNym3ZKKQ
         1oxxzKp4gA9WRoghlshfs2O3U+AtoQaczEq5WWztTHBs0MakhMsr6huQdLZH4+Cp7Db+
         Y3Ishz2ViFB9WlCfGrmdau29R1LaNmnRV5ZHEAktiUGD1iGdVfQGkRcpr+FkTfLZHa8u
         rToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465258; x=1774070058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ7UbaX2oRU/+Phhq2OeYcWf31wYO1Qf4Sd1/DK17RA=;
        b=HPcD/pzMBx4J3bW5xmO4Yhfdaor3moQdy56VAQsLKw87XXe0WTNApSQTJ0gnjvXHMS
         Jxl/j83mUQk7HIysiitprZ2xoQaV4K5rn730wBugWaWUbIui+wcOidlwwv81zibKqZ+v
         7A2VXZI7Mxm5dUw466HtBGKcCVdrghrR3b9IOp+ZJw+yzVdZUvM8U/ys3cMSRsaGWw8P
         k7DCCbMzbJxNayX/iHtjT/kgdyHo/MmX4XvQxn1BEhLWKsoKLTLxS8h+XpSk5xgttdhe
         x46IympVsmePtCRZmmbebjzCYIvccCRe9nzsCRkfQF2pdfPx+gscwM1CqjD2BBc8FtQX
         Ze/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbgblEKtraeVG8q9RlS7qq1C7JaWou45jAAwxeTp272iu5tFfKOoJSrwEGZFF1AdTg4Jh3qLXzYkE5JcGl@vger.kernel.org
X-Gm-Message-State: AOJu0YzWk20LYJc7zq0z4tE12icpoLw0y4kPY9pBXrBNKTW3809zrL+5
	PXWN+AL8v2cpLtOUJO+ceAG2ZC5U0CNULh/uvL16tzqXZnGmS+FCWD2tjqcWvYGrohTcUAsmy9T
	IY6b7JnVLDGP2Zb6Dc3HKBnud8xvz5TcdyDoKBZt6yMgCNsT8QA6xSFH8Xqrl5DpkRW3z
X-Gm-Gg: ATEYQzzawYp2ysp40je6miI9d/21hzvRkV9RTnuFGsea1aSQQjv2DlL/r5VU+Bk2tpt
	zUP8MutsYHbnsfT5Cq18W7GC1RdwYZrivqIOp/BNmLnwNnKtJMXHW21EVe4H/8esb5Oq0L+wmum
	b3yD+qng9moG+EggIQo8GXuWZDfJIQneuY6iJiMjh4gqBqouMfQ7cqbxVcc02Ahu9leIDr/b/tb
	rCIPYsCJAd/1DX+2++YdnQkCK6oy7B28FEAeTsbn1jYR/31kg9geChOKdHIwI/4JQw4Z5pyLY0a
	xw3A/zS3DR7u6JTrvwDjjTGfOK3rmi186++Qg/cf4IZ+A9Sp/Ivz16m6eq+q6gSpKg7ZLNi8f0u
	FqZ9XfRkSs+PuhaizUuJ3aN+CDdQGaePAIb33f0fyh3jdhg5HMwvX/3ujw85qapfhsCCo3VKOsq
	dL36PkTg==
X-Received: by 2002:a05:693c:2c93:b0:2be:8216:57e5 with SMTP id 5a478bee46e88-2bea53ec7c3mr2056067eec.9.1773465257812;
        Fri, 13 Mar 2026 22:14:17 -0700 (PDT)
X-Received: by 2002:a05:693c:2c93:b0:2be:8216:57e5 with SMTP id 5a478bee46e88-2bea53ec7c3mr2056059eec.9.1773465257245;
        Fri, 13 Mar 2026 22:14:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/6] phy: qcom-qmp: Clean up QSERDES COM and TXRX register headers
Date: Sat, 14 Mar 2026 13:13:19 +0800
Message-ID: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b4eeaa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hJKCr7oTaIRBbX3R76MA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfXyFYIn+Jrhdvn
 lY62MHzdN7rXlOinKj+CocL7fiml2Z5fUd9E2BB2hbNEzro9O95vl6waXlUBCQ81iUON8fMzyVl
 Dk8K7ZcRmsgaeYD2AT4CVchSvs4lk/8eIv8AH+4zhn7BjWaieJ0jV/dQYlmaohMdAQSyolmpLw5
 J98ATs7HoEV8EJHdx3W9XByyXEobVTHkvOF6pdKfZSDV1VjCu1M47KAyK9KB3P/2H8+SPyjCNY9
 6/i2wm6spwteCbL3ojHSl0/assFM2wiSW9WYuz9arL+bLv9vUFV90UGbgb1vW07lWStqzDG5BwG
 Wgyt2qfDVTVPn/wU/vkQ84CEihS0wfB7pOP2KyyMIj4LQLD353FcFyg4uX+qb4osmO53DzurrB3
 VtprVHe0SvQt1XZc5bjY88n9NaqLYF7VTh4PQsz5ZuI0o2pfXJZSBIb0yd8TyLHnW5NswMsops/
 BfzNlFzd/w6U41BCJGQ==
X-Proofpoint-GUID: zSbjfUlYlDeseKb5SzH0mMF97d2iyGTw
X-Proofpoint-ORIG-GUID: zSbjfUlYlDeseKb5SzH0mMF97d2iyGTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFCB528BBDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are some duplications around QSERDES COM and TXRX v2/v3 register
definitions.  The series tries to clean them up, and also rename
v2 registers/headers to make the version explicit, just like all other
versions of the QSERDES registers.

No functional changes is expected.

Shawn Guo (6):
  phy: qcom-qmp: Add missing QSERDES COM v2 registers
  phy: qcom-qmp: Use explicit QSERDES COM v2 register definitions
  phy: qcom-qmp-usbc: Use register definitions in qserdes-txrx-v3
  phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables and functions
  phy: qcom-qmp: Drop unused register headers
  phy: qcom-qmp: Make QSERDES TXRX v2 registers explicit

 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 110 +++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 212 ++++++------
 .../qualcomm/phy-qcom-qmp-qserdes-com-v2.h    |   3 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   | 140 --------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   | 247 ++++++++++----
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  | 205 ------------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 254 +++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 262 +++++++--------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 310 +++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   3 -
 10 files changed, 769 insertions(+), 977 deletions(-)
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h

-- 
2.43.0


