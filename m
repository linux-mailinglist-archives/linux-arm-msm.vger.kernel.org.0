Return-Path: <linux-arm-msm+bounces-106859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPzNAl6hAWpKgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:29:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAC50AE29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35D330EE2E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E583C2798;
	Mon, 11 May 2026 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZH2mLP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GX719Ae+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8883C2762
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489998; cv=none; b=m9iXjSlYeUUAe9xJCZe/kvUNjTce6m42a5DQSq2HSHK+CXMw58e8cx8wa+kaWCTMh4oBth+RybHt6KTqVoSZfmq8tBf2j4orQfD71cFjE//hvP5GP7PXV3O3vvJ0hPovK+1ujh/e+E6IDFm8u8RLlgGGA4z8J6F2D5K/nYeBAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489998; c=relaxed/simple;
	bh=agBR2CS4x5wMlmJkSvdOWG//l/xBDL8qOFa3/d6nTgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=risTcuxyFjpI1eVY3zOQ2asdkTCOO4vfTK3D1tzDt2kIdazhFg9w8/VLXr1ItTi0aVILnhyvavzHZgc6WKCjzmD/rHWjj8aJ5HWwaY5WTP6ZYEKs2PbHs+B3BuYwzqT758n8s9DGmxFFvcSY9NjVPmgRw5bc7HqTsQZSuImQa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZH2mLP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GX719Ae+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B71APi2500655
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5yHyLJNceScQLyT0D3szqxPzpbXRp0IiP0S9FpCCEc=; b=cZH2mLP7ddWu3RDZ
	SjfVu76jZI5Ot1gVTUGYFSGhWlUjlWm/YI8XTFFY7+lxhH9oWDpLIIO3Gcra+Vq9
	Qu3jxFbWkRlUmafd1GfYQKQ/enZsukNtOrOIjmKC+28ggxDz5zinbH7fXROCV1u8
	27HE2BNutxkOitb90cDWor+c+LG6zCDhFg6Qc0YNFor56PyzwjgVlz2y2BDhXWux
	tEuCYYJwiamHNnkE26rzEEAOl6MdovvJIiWyGwF0oMvgDUsIeqsZdTcWFF8yMj0S
	AjOg50PRFxUR+O7WOHIISYG/TUJ27MsGxYDTcORtwzfFZ60vWM8f4QwRA3wsHp8P
	h/x+PA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79n501-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee454b1b8cso141377585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778489995; x=1779094795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5yHyLJNceScQLyT0D3szqxPzpbXRp0IiP0S9FpCCEc=;
        b=GX719Ae+44KVMNiepvV0n7eZcSEYmbna39VdWcDSTLwRgIpGcdPpp/ypDMgTOKw8YX
         TrOL5PbWenc92drVQUr7ptWAe/y/m8R7prlxcis3DxUbuHPPXBBgL4scJUe3VrJQzB7M
         v9AGI3G4BrYQi8bLnbOq6A/Z3nfXSW0Kr8RqbY8K2WExBwzAG/2rDOqU+bmC7FMtQE20
         AqOJIPz7XMwbV3C/geyY0RMSlutlY0fT/5YOtWDGLuS1QGgJAH23R/jBdI/hV7L72VKL
         8ynldhz9ZNqVzRTxtLSrWGxUtghN5+ZRy28CxXefb6Jt3YRwpwPo7wlbxeyUwEoM/wBD
         0UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489995; x=1779094795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5yHyLJNceScQLyT0D3szqxPzpbXRp0IiP0S9FpCCEc=;
        b=gbhV21o3JLCEdzifJ8ucpuxxbhoUHD6XIkR5aWJXod6EX7RKj0cLJuJ8n5m4B8rupy
         omzeMALTv31Rr2FlacF76HGzZXCg9ztmhNtPP1RzRertTc03GhRMBa9K0UoPeS64q+b8
         cI8N0sEa8AMMt+VrbleqLZDwiM84IwDDUnlCTv2xAzK0NHfCDUnZTIpfxbQZkbZ+EqRj
         DeMrZKGaaQX6rCuFyzFSdg2jVMT++9PaCqNRtmRtf3rygCcuJlr7Nr52T90lytDFTVhy
         HS14Vo0Rped4O1BHQlUX9NB56RavQkxWmB0+XVDurogSulXGXk2oCc7cphPnJ+ye91RH
         Fs5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/yiiFX0TF3rkBYTTtKMPPaPjCN+J+q2/i2h8R1JpN6EZRD+4uypCrpr5qq1Xkk+E+a6L7axtGe/iqM0fR5@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaiKBMLu5dpnoNKY+D89hs4uC5hii6dpD1vxWsQ2G0TOnzpgu
	U321RPyJrE0NcKEiGHTdzE5CpINw6douJnD6KLQ5Q2b5w7023/sauq8Lj5BH6Q9oRsVCngNAKl0
	hHnAPAT+13DcSCjvpI1WII7rgdT6KPDvkBgA91w3pwbh6V5NPIHLvdjMvqMrk0Zli0r7K
X-Gm-Gg: Acq92OHkGYdoJf1B+NCAEmRzL8KulYTMTarkifSeYj7FHHNCGRrwGeGN4OiCeWXcP9C
	ixcCvBPJISNFQcnIFsjuGtnyzwbtfouMTiSNh/zoWA9hSNo2ahaEVHz4xZ+uguQkezPhSrOQw23
	rnaQNlesoKFiWGQ+s4G5Yp85Da+AHhr358XfiSd869VF0uS5pcK4J8nKkSIrrvuojfiYnaI5BvR
	nh1TpRunzvtHUIMgccJEVGXSlnHiBpq4Snvp2YEhKw7gRr0vE2pEntunYpn6NYS1swpyrJfUUFe
	KU7s3/uTkWdX5qC4cSJ0B4Ot25SvZAgkqvIlm1CxDNNveApTj2MFF0md2zk5zA9TcFReyWoTD6u
	V+IR1Rl2fVJA/+wEOpTPG5Mj0MX7oZU40hLdcl983VDDvICp1yGZQ/l+gXYbOspTU2+vxEaKxc2
	fBoV6AYU4WTgLsKbIa/v/Dvo0=
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr3504801885a.4.1778489994743;
        Mon, 11 May 2026 01:59:54 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr3504798885a.4.1778489994232;
        Mon, 11 May 2026 01:59:54 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c7600sm89017316d6.1.2026.05.11.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:59:53 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:59:35 +0800
Subject: [PATCH v2 2/3] media: qcom: camss: add support for X1P42100 camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-purwa_camss-v2-2-22608ab9126c@oss.qualcomm.com>
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489976; l=7316;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=agBR2CS4x5wMlmJkSvdOWG//l/xBDL8qOFa3/d6nTgI=;
 b=4caE9i25uisoJKm/EjUaUFO0eJP/VGO5jESkbEBgzs5tCygXbQVNuIa2TAk2xOJsh+hDtNoeI
 a5M1kxpMx1RAF05h4i+OG2swD0er2QnBvaxdHZ4noYXRwykMNhjdPsX
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: oxD371xTkF5vOiT21oVUWkAlC3H_mo3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5OCBTYWx0ZWRfXydR9JcJEYuMt
 JCXMFXy4h0RcberbhTp5kEIGfyCEda2PsuSiVq+W1PYtN8FtHvrv5zBVs4clT7N7bX1YEJwWMrQ
 Ah0MlDS/VAyUXxKRNRkqSnS4j/iVZqJWPM3NScbCY4+XtWNgVJ1Ey1RpcWT5/iY/eZ5w2ItME/G
 KcfLxQiWXVGK/Iz4DBnTOj68r5u1rrWBhObK6e4CpJayS0dHBt40v3NB2HSTcmrX+r5bVzS6mH9
 Ivzyw9u9MaJiOagZrz/XKXPe4uzi+tlNUX9BAKK5rcr5cETNZVX7amnM1lv5oKcmZbixcdKocdr
 sUBYE+eqtV2uIxkfo7rSX4ghfY/vAzLumceI1Esqpp6PNw1zwoBI5Ed+DRLdxTmLY0Zgp/CgHwd
 CS1rPAuHzB17XDv0uJ4azR2JzNVWZesP9vZXOi+Rdg4C+DyM9UMW9gQYyfR90oJ/uAe+XTNmfP7
 weSryLdsnF4GUzmszFA==
X-Proofpoint-GUID: oxD371xTkF5vOiT21oVUWkAlC3H_mo3X
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a019a8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=17tTA0NWToyCdbMyvm4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110098
X-Rspamd-Queue-Id: 64EAC50AE29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106859-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Purwa camera subsystem is a cut-down variant of the Hamoa CAMSS.
Compared to Hamoa, Purwa provides only two CSIPHY instances and does
not include the VFE1.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 127 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 132 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 4154832745525972a663809c947a9e9aeca9f944..d37f71de0f42c394b0918a22de2a18836cbfec75 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1020,6 +1020,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = true;
 		break;
 	}
@@ -1115,6 +1116,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		regs->lane_regs = &lane_regs_x1e80100[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..b48dfad5a8a73f81254086e5fc8f5bbc3a45aef3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ceee37f0c910fe79402d1fddff92eb0bf5ba744a..07af369eea43a982ebe2249c0326bc0e1012b305 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4289,6 +4289,116 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
+			  "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5479,6 +5589,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
@@ -5497,6 +5623,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9ffc777d4bd7227166509bd836f73be15dae8cd0..0a18fc3fb0bdf19a24edd20b96267beda6a8d69c 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1


