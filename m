Return-Path: <linux-arm-msm+bounces-97678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE1rMrbutGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:14:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE628BBB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 544B430152DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED64A230270;
	Sat, 14 Mar 2026 05:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtBL9SHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydf9EirL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D7329E47
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465263; cv=none; b=Zb+SXoAcjLdcNbEDQyVKfOUnwLDwn7hvaR0Sve5otYO7ApEj/QBzOK3MU4hIIFRsdPid5OD5+UpK1rrwMu2R//0Ndp8Mr5wh+zp3thynBqIp2VkFlUT8H0n8Awj73JktRGGwfC3XID6vm4K5nWLTEdnwLAu3UGh/vpLS/NxE72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465263; c=relaxed/simple;
	bh=iNKXcv/Bitky7a894OZyYFgsdXNqSD1yGcudvXE66mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=It0nPahb0IywzrU2MshxWOWy+svaGpXtYKknHPSanfcM87RtP/gh6kvvHGCUTjcWJ68jVZLsbAkPwfFKy1Uh0BMRA0NKGXJchbYKb+3DAVvk0vsEapUldGHGuNcDiUmJOEFe/keU6ugml/tmme+/mtpzQgzJeP/OTUUgE8e0LqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtBL9SHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydf9EirL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4lcNQ2007431
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oRJW5ApLate
	O5UNHV8BBxzIXxI15m4V4u2/xEsvjSOA=; b=AtBL9SHIhVudkKDU8sUK8dt4b3v
	stlM13iB4ZecH6zunOHcPJ8B8eAswoaRBljn3mcsG0B/idzFn9ZT7Eq8qEnWGSSs
	JE7lLno0N/RNtNO39DDzOiqI2EF+i2KG70JfWZAWnQ9sunKvqa86vvvZM/6B6Z2e
	uvaGIcwkfLLVYeytmlsVlmssj+9G6jej8REFQw1Ngo5wDbXSotQpJM3/zrnRaTrJ
	7DSySgN9yrbloAa04tp6qhuROJKUcgW/oL+RUcg2RbrRawvxUadK5uFrb1kMfleK
	3D3FxgdpNEsz5KxPjQFQOKgwq651Q7ecmU6ZJKobsIXTDoG5xIZRnx0TI7g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7r1aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bea80a5849so29765852eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465261; x=1774070061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRJW5ApLateO5UNHV8BBxzIXxI15m4V4u2/xEsvjSOA=;
        b=Ydf9EirLntPLrso42Mc4nkai9xZZM6bj5YxkIEfNeiN8AKxnVjXGdJsSs7IdpGN1qW
         5oW7O4Z3oGxKHJTWGN16IUDXw5WT2FFXP8ans499rnrDFoqbGqTeqmgEJ/x94DsavUxT
         Ql8szK7s+pF93oUa0GV5rvCg9a1AtbCADzu0JUHW7dR0BAQdet3pjB3YD8Yp6BD4Cy39
         Ta70c3GnXfOxQO2sixiqbsSLnvhAsjZoA5NMIm44Li6LgC4f/pPf/S762iP+tb/6pmbv
         pcnWjBkstc/c5UO1vuOqP7wZdQSPHs4FCjkS8Sz6jCYw2kUMmmAig/IZfRHitlAOYP+7
         2V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465261; x=1774070061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRJW5ApLateO5UNHV8BBxzIXxI15m4V4u2/xEsvjSOA=;
        b=WeMw911aTZd8VHYZNlmb/MnE9Oa1rVjwsU91QJX6ugV59eBh6ab70U6Vx6Vxr9CrRJ
         8f8rw9uKRVKpQvXaD81thqIU21IMIhftT5HfcaVR/9CaOewKUKqNEmgkxAEpqm62Z+tO
         vzebCbFYiR3JvbdsmUfQSckvPJcko/Y1FEqRLe0cCadxN5lVr4bfKwojkPT9hkk1IfXZ
         J3pCCly8Rx+YyUTccGcEUPMtQvg7AWMnJUc3guXKb8ZyurJXNIWihJmIFt0XOPP70lsG
         FG3kTjoxWCT6vvJsomR0ZdVzbzDxlJ9niw6vRfuJAEq6v6Bvk+SMtqQMVEg2shLWtBys
         6wWA==
X-Forwarded-Encrypted: i=1; AJvYcCW+egRq9qpfO8mWRbLU8LNHVALtBrWuz87wFH8D3UbFmntLSZaXY+WZHBVcY1xaY8MVvlJbbng1xZnWbXVt@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyDn9TyAArRi12RPX329cE0ErtQ/FjDqHgh1/RLrQNSg4SqWI
	56GtCLrtg9PNsP8Z+vwzLgiLKmthffflWmftzN6omEb09AJlrW/EZnNDY2KuSAo0nd/P8T0d2Rg
	bwzWF8KTCG5gQx6DfE/qGv98cgaWshcOAhWN0Qx7xFxablMAohgxrXz6ezk6BsdeUbps7
X-Gm-Gg: ATEYQzw6mkOYQawqnTiybfrJXCNc07QLAHYnzWX7Xc+miHpFDKQfKsSarC70YCt8Qlw
	TC2ckjdoFRrQiuEd1q/SogB0kr6hKz/crc5LOnJXUU/N/tDMWCEaQ/aPP41oks+/pY2vZKYD0ap
	/BAgOAUIL3IuVUqK8K7HrCbvHvOSlsavgPU5t/4IpzYC4WlIgxxDODQh87B+FMMv+oTrwI/Xq1A
	jCIXGIFiPci4N6poGLjTVNY9BORJFNIrRnG0RO+V9QjyJQFIuiJGK51CJWeSuyVvjwTyices/i2
	tIq2mZiIBjqmmTIZKZC0/WjZfrHvISXkgy4I28HGgeqk3YAIP1x8h97HU89WHAIBJvLDe86DfDZ
	zNf5Fx9b/qAcAt49OjFP16Wb0nsF8V29XWde63sLgy50qrM0GHXwH3jrkE/L8xa5iSQtXEP44zh
	qONuLqzQ==
X-Received: by 2002:a05:7300:a54c:b0:2ba:9ba8:5af4 with SMTP id 5a478bee46e88-2bea554b3e8mr3208872eec.22.1773465261408;
        Fri, 13 Mar 2026 22:14:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a54c:b0:2ba:9ba8:5af4 with SMTP id 5a478bee46e88-2bea554b3e8mr3208858eec.22.1773465260965;
        Fri, 13 Mar 2026 22:14:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:20 -0700 (PDT)
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
Subject: [PATCH 1/6] phy: qcom-qmp: Add missing QSERDES COM v2 registers
Date: Sat, 14 Mar 2026 13:13:20 +0800
Message-ID: <20260314051325.198137-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5TXtgal1mAOHTGeuPAzGLN4JdjpZuYEZ
X-Proofpoint-ORIG-GUID: 5TXtgal1mAOHTGeuPAzGLN4JdjpZuYEZ
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b4eeae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PaEeUX0na0p9oEYLet8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfX1JXyLSQaCm7L
 FLaJKBgUMYxLA+ynhcGemwkRiKkkHNdgu0Q9mbPJWKVMousnBohgfefq8NxEw6rAcEKKR2lA4cc
 IXXR6zsSqdt/8Ad6OI6BOYkSg1QLwIHqNuOZPcA+X4F5/i1W1EzMFZyGuhrYdIlhS1ZIbvdmNX8
 8VV35HxYgy2N+rMqJnI8hCRr8Kq7ryRTKwyCDDlHSyZYygHPrU+ZnVewUKvTwtsBDT1a7xZJLfH
 frb4HMiz/52GZZg4htvEfH+3Y6q3UMYjvU7qXQW1NZrj3HBQpnInwOuU7KF3PNDQ6MFK6R1FXoW
 R67pHT6n2v0ALUo9IdYLIEkm+SOeZ/lN3k/oTwVGE8+f3svPPBbWjasUeeFucVYOqtiImfl8RI1
 znirfXvMYjWLJpzUbOXJmAh6fWgzkaPaGW4YaGY+0/HKn1KMjptE8KKZzUZ1ffrodaVuiUL4i1o
 TJyWg3FRh7Ji31GWOUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5AE628BBB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A few registers that could be used by phy-qcom-qmp drivers are missing
from qserdes-com-v2 header.  Add them.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
index 3ea1884f35dd..cb599c113189 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
@@ -34,6 +34,7 @@
 #define QSERDES_V2_COM_LOCK_CMP3_MODE1			0x060
 #define QSERDES_V2_COM_EP_CLOCK_DETECT_CTR		0x068
 #define QSERDES_V2_COM_SYSCLK_DET_COMP_STATUS		0x06c
+#define QSERDES_V2_COM_BG_TRIM				0x070
 #define QSERDES_V2_COM_CLK_EP_DIV			0x074
 #define QSERDES_V2_COM_CP_CTRL_MODE0			0x078
 #define QSERDES_V2_COM_CP_CTRL_MODE1			0x07c
@@ -47,6 +48,7 @@
 #define QSERDES_V2_COM_CML_SYSCLK_SEL			0x0b0
 #define QSERDES_V2_COM_RESETSM_CNTRL			0x0b4
 #define QSERDES_V2_COM_RESETSM_CNTRL2			0x0b8
+#define QSERDES_V2_COM_RESCODE_DIV_NUM			0x0c4
 #define QSERDES_V2_COM_LOCK_CMP_EN			0x0c8
 #define QSERDES_V2_COM_LOCK_CMP_CFG			0x0cc
 #define QSERDES_V2_COM_DEC_START_MODE0			0x0d0
@@ -83,6 +85,7 @@
 #define QSERDES_V2_COM_RESTRIM_CODE_STATUS		0x164
 #define QSERDES_V2_COM_PLLCAL_CODE1_STATUS		0x168
 #define QSERDES_V2_COM_PLLCAL_CODE2_STATUS		0x16c
+#define QSERDES_V2_COM_BG_CTRL				0x170
 #define QSERDES_V2_COM_CLK_SELECT			0x174
 #define QSERDES_V2_COM_HSCLK_SEL			0x178
 #define QSERDES_V2_COM_INTEGLOOP_BINCODE_STATUS		0x17c
-- 
2.43.0


