Return-Path: <linux-arm-msm+bounces-103086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M9kGF0K3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67003F7FF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92445305BDD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A3B3C141F;
	Tue, 14 Apr 2026 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXPBsaxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC7Nmjg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415C3C3455
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159116; cv=none; b=uj27BUTmnzHlnuH38s9qtheDo3Y5wBgzUc62YT6XqNVyJPeU5Kw280LBQ0dOuMzfXd/EGfacaF4FMxIxHpGls4/SyJXq5yDXcDUw+vuriw/sxo1CI3n+ucPiyf5+8Q/nz4cK4ywuFRj5XoYFvg3uG4drnA9XcuRSKJ29g6cTgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159116; c=relaxed/simple;
	bh=rz5+GoubMhAQGVFxb80Ed4CW4c9+EipbDJvn3lW9Fcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJuEwkPwq6I1UNnWiywszvMitz9SmhV8bgcRvRZ6b0yLNMzm0X27vL7IjVyrSewdX6DQ8H3yrPYm2g1GGZDIE9+yjvsy6QqCIosbQdqOVQ03hd7Qk6wn/96j6R1ci/Ajtasfvs1+lPaeirUr9eq5Aytsllm4ny0sbCSpeDBKgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXPBsaxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC7Nmjg3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6melg3157820
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IFe+vV5UrZO
	2TbK2XUaK/lXdSgZTCas250r6F207btA=; b=XXPBsaxs4wzSeq+zdrYABNNlQdV
	9wrIyDTi2xaD/ATnjdaVLK+JRnElu9k0I+f8e7c3TgBUrEuajwpI3+WNq1Ruzcqa
	8PdVC2tCdb4s3TP67gHpzsMJEEhfV5qtwhuxMxRpORWY3d5YcF97qG5CPABnZsVu
	GihQIWXF6p9OrJWn1/X26OQZ8zKQBOHzttHZ9cN/YATpIPaDkioUVP2enT7YUBD3
	AUr+fS9kdR93soJ5ta2eokMBYcevCZmceBuWM16yzTgJp57jH0saIDGvXjalCIy9
	VmclvPF1hoagrA3kVOrtsjSz9/aJfZvxOvYTvU6a/fqszRusN7KIDclLPFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba2mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so3565579b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159114; x=1776763914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFe+vV5UrZO2TbK2XUaK/lXdSgZTCas250r6F207btA=;
        b=kC7Nmjg3GVSdpZqLpOHmuEvruyj2UzqKbem9Z+nwLIdACEIwNF6N/Z4xi4p1JULyrE
         woiOVZO1EG+yuketehwDIHxojOitQh+B2QBxv0RrpQosSjKhC1ZU/zPa7le0JanwLhPv
         7bZrYxkkgwGai+sh0N4VaQOnw1YCtgAPswuHvNPIjcthkDmbnZbo6R6Zvl35moYG80Ag
         i+c1LxJKauAvaCDmkcaqmYgKUrSvkaDo1+0LWggnLjDyJ1Z673d0/rGVegHrVGvG9eNo
         U0xCHQuCEV0KKpND80HGBuMK3kl2XcySa3PbHdVpWcOhREMRlf6AXGtCf2HpqeHV4hma
         i/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159114; x=1776763914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IFe+vV5UrZO2TbK2XUaK/lXdSgZTCas250r6F207btA=;
        b=T6/FJW2z+OBfH23+2o6BYkrU8d8O4B4YFz0hVngRVtZYyXiCOc/XWlzHCi/LPZHPnS
         yO27F6qnqIGrgjoICB0rTEUp7NChSL8KRMfvOp1qmQvcUO4DxmyH2r6H/V8G26GigE5e
         Sp15JEWK72KWHa2g0cKr9zfNwZkmokDAELdDMzQcR/RkPJhWNTTubn7nRZxcAoZioxvR
         A9X7tg5KbBruAo0r8iCp562JJC513gpb8XSG7f2bZDoi5YIThmF+JkPrp1rcS/0NbNsE
         RGiu2Jn5etnOUH3AFeSFmWq67kqXv8N57RhDWyCSzLT4yYhBSTPVoIYvQ+G85Zx+dEfZ
         MJ5Q==
X-Gm-Message-State: AOJu0YxDPd+V5vu9i+sYSMXSZmRgD0a10vzpZ162voNnKnj1wD0Ja9/F
	d4nirZhlwcL0I/sq2H1ebVCB5kL1Y02kfIReBsxtgls/W/0tStFh08cl0W+RJaOWd1psCpeEYLM
	FWr6rARthIuq6xTts1BMcWrfaaquWjr81io6vfVcapAPfClJE5/pzFLqGLjvkKExlQU0m
X-Gm-Gg: AeBDietg9PDNEsoYPNFVxbXSHPE6zlK+01MLyih8vl5ZqP59ze8gGOt/9v9CMyTOLcu
	NbU2KakPFpwHjmdiCB9mDhTKz+Z4bg8V/C4HhwCf9NisPz0EtkB0ir7TgskWCJQMYPFHu14dSCW
	tbDnAWNuEAzSqHkxOB7cT79DI93Q6a+JBwr87HJrTnNUPN0AW9eQomB1nGsFm29XBCfHK6bK6bf
	qnTxx+RVWQ+q7u7phMQOX+yQCQk1s42rFyMorvPa1cL8zzDOirjWTCIirI2+mmeS7UWjvgeY+Cl
	+dWVH6kcDZYwf5dVIOTW2KiHmfB52e2cp3qRCQWLedcSGJWk9sk/OkVBGCKE5Dr8pDZKIGc8S7r
	OW/VxXdLHlTbwDHFfTGX8pOWKwoL7UXzbgGJtUFymdEocXJVRtswAoQ==
X-Received: by 2002:a05:6a00:12dd:b0:82c:215d:5e9d with SMTP id d2e1a72fcca58-82f0c2f73a5mr17278358b3a.32.1776159113566;
        Tue, 14 Apr 2026 02:31:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:12dd:b0:82c:215d:5e9d with SMTP id d2e1a72fcca58-82f0c2f73a5mr17278315b3a.32.1776159112947;
        Tue, 14 Apr 2026 02:31:52 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c35194asm17321642b3a.20.2026.04.14.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:31:52 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        shawn.lin@rock-chips.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V3 1/2] ufs: core: Configure only active lanes during link
Date: Tue, 14 Apr 2026 15:01:34 +0530
Message-Id: <20260414093135.660725-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
References: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfXxI2sOgVd8nhF
 MMQKT/h/f2XvA54FGfzE9Q/N+Hg8WSMzcumAaqfgmhktHRUVY6hd1qCrq3O3Ld5jbdVy7ybJEN3
 RWOWvxnm3KlGF6waLhEwD+WdMLqKnpJLiiWe7TFpncoiVAkfkCZdZlVczkMucdqZ5Eb1EBrLR4s
 w+vfjrXGURqFtef79Kc3gAJWSpBdr/Yog/TvVBdgm19UJjIL9sxoOTuUenW7nZr6jNWzPh0V7ZL
 Sp9SM3g9YMqV1e/uqCosJVNnKliSulF9z9UN76gQU0TXIwHgs3P/2sXaRjctcQpNw0RXCa2sIls
 6UW4nOtcOEvTyhEsfjl6VurGtrolUxzj0nq05c81qDFzafiA74T/lRJbtVAdeY87kq7lIkKiZ4h
 rB3KJ3YtADaE1+kINBSeDgLUmGWqSPuP4Zn8g07ZMrdnZoXBVrXPpmnTsnJaznPd/tb+r212DQ2
 lxV1QhprONYaIjbNDOA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de098a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Z8YMyZzXpU5RQDwMThsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: gaW0EdaE9npwu6je0-LDpnd1AjY1B2m5
X-Proofpoint-GUID: gaW0EdaE9npwu6je0-LDpnd1AjY1B2m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140088
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E67003F7FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

The number of connected lanes detected during UFS link startup can be
fewer than the lanes specified in the device tree. The current driver
logic attempts to configure all lanes defined in the device tree,
regardless of their actual availability. This mismatch may cause
failures during power mode changes.

Hence, Add a check during link startup to ensure that only the lanes
actually discovered are considered valid. If a mismatch is detected,
fail the initialization early, preventing the driver from entering
an unsupported configuration that could cause power mode transition
failures.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..754bf4df3016 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,38 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int ret;
+	int val;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
+			     &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		goto out;
+	}
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
+			     &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+	}
+
+out:
+	return ret;
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5140,11 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 			goto out;
 	}
 
+	/* Check successfully detected lanes */
+	ret = ufshcd_validate_link_params(hba);
+	if (ret)
+		goto out;
+
 	/* Include any host controller configuration via UIC commands */
 	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
 	if (ret)
-- 
2.34.1


