Return-Path: <linux-arm-msm+bounces-96876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEqwDJMHsWnhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:11:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65925CB1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF4B31D831F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC532F4A05;
	Wed, 11 Mar 2026 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csoOCu7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6nxrhIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BA35AC2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209372; cv=none; b=c8jsFK0Q28Zcl4Dl4Ep6V8eTOhoZBDHU/ZPDLKMlWUk0F/4Ae/nN2Pw+OnpFm9H5klY9mxkAfBFWmvDzVIzsW2dxcTZsnApne2U31uN5aus9pO/sqevaO5LB0mA/bZVqmMQ1xThEN7WgnciVlEZUJjzDSG5nQk5GN0wDCXv/oAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209372; c=relaxed/simple;
	bh=L22x1sAmNTPfVGmo45h6OxTwrRURMxryt2366AE58cQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BfPKhrh4yGy4crjmMq8j0CdsQ6AiPt8a8ErZXL4yJYelNY+qSM0TKr9YeJH48E1AEA5QmYrAPSua6YDQ53UdZ81ovPCI+ILX3KwPbyOXGDMsttMvFkJeN6twJYT2UXx3aRFkBXHwCoPZVMMnTBC2x/x6O3nR601vtB979C+g5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csoOCu7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6nxrhIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AKxuep1863237
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wUm1g75HVM1
	ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=; b=csoOCu7Vfb0N5E75cewFMiSAolf
	C9eHGWSZUiiuBMa9f9VA97Xb2UElA3G3Uv8tRbkv3yyOpnkkO6lj1x6KNUhldQDf
	vwbviMiMXfLSCgaqgIrgPcJ+Wq+hxbiCdBPY2LNHv1tRoogbJwApnePSJ1Bcueuw
	XJ+hQMn8Txb8ZvQzQLa/Zk1pxIy7iAFA1gNxax19JKdCFGbeDSVH9oEDgrMRf7R4
	byzoF9VgnKw3iEQXqg9C16q7XkItqDrd2yoy7muIO9k7QZmCLHcSs31gI+S8FkkB
	jEmzFtDR+MxB2Y2Su6y3xdkSgj4OmYMipRSZiCBpVRV7PQ0B5machuSe6pA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw831r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae61939fa5so264298855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773209370; x=1773814170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUm1g75HVM1ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=;
        b=i6nxrhIKVDtdrxwOaBtmUFITitHNmcufrcdyLKh+v1axW9V2D1bOWXXz+w1AEJM30g
         CFHzQYt9pcwBT6yuSx74C7CKjlT9DJ379+GdOPWqqSnxWDsRczJGzgBd94dlsrOL0i7T
         kBJZC3YiJMXStPxmOK8anFc858Uoz/eG6IHEJhy4xsZEggtho8a9M/81WVKaxkVW/O/r
         +MzwpXBg/pLUFwvSBwYYf8PKgTdymgS+76N4FQwHOFnjfGZjqzgb9J2ye3/TbXzaeaZ6
         ulB3uYacA/KdH6dFye3BmAzb08OimUjXN/lL4AFj0onmaPM/EUWgpeijxW5TUkgr87SK
         Etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209370; x=1773814170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUm1g75HVM1ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=;
        b=n7owzWbNxUH0THamF1deuxt8rQpgJ0eAFa/wL0Bt/IwlUuCJ8eFVoAgYZCgqXF5bwT
         3Xzr1KgfR66Ypo6mV3J1s+JZwde6xVLn6XyLC82/mMy3I1G1qEEqGClvRYGr91juAvYv
         RQ+fj7CO56Zc8Mva0U2mwOKQFl7UaVKOY7uGjXLtp9piXBX4KPTGxtJuA0WvIfZv08Eo
         JN8YT23gz+MN8P/lrgwJ9QvMLm1ezqKJD3lbORNud+4s3H+1T+vuwsdswgVj8WYOQcgM
         a9VSPSrxIrkPNFkiikO7npDxY2O6Fbv53kL/epy7tl9iwsDJW2AlpWAfrRakAu+vmRDj
         k+qw==
X-Gm-Message-State: AOJu0YxMMpe/IQBasTjXhU/Uga5x5oYb8IrY9xHUz6OMtUdAqRrHuKjc
	8PN6iyRSloUeCBdUZ2DqLtuTSiN6RKAByPyZ4p1xeqOrz6GKdpA2gY1nrAnfWugafhZU7Xrf3Ll
	Rh8k5baiqOKLMCAz3Wtlhjej+P+BW4jYj+aGO5Nveb/iJt+cd84DiKPyn6cwrntOGHaii
X-Gm-Gg: ATEYQzwSC4l/UvJaO6o6tppmAdAUs2UEPgedrEOp+XKBvVWtfUqyGIuC5s6SPUojU8U
	csaDcgmmv27iRsr/N8NXfEjW7vwzFEjhN5NoswE2fMOjLc/IgsrqEoTQjQtGwk11eqJch5CGtZ9
	1UUipWYvDx2p9/fsD+75ZY9hog7w76yvpGg4/dgfrS6fFU7/bRqwbLo834cnH/cnoc2E488V9DL
	XyG88WgBvo0dVul0leCQIlXECD7drIQkl+MtUMKFrkRhdfuo/5pocPtW8Ik2QiXozqZ5k5Doa5S
	jQrU63xitF9R7AgJczaUK2MyTB66JJqvnihur7c3gb9BcS001W/10b670/J7b+S/s5oRn7hiaiE
	w+2U1QV/7aCohfWyLmBJei1mPELV3V3Di4VsbVs+DxSbcPK4+qfTW9g==
X-Received: by 2002:a17:902:ea0c:b0:2ae:4732:2859 with SMTP id d9443c01a7336-2aeae769a08mr17354855ad.3.1773209370158;
        Tue, 10 Mar 2026 23:09:30 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b0:2ae:4732:2859 with SMTP id d9443c01a7336-2aeae769a08mr17354555ad.3.1773209369679;
        Tue, 10 Mar 2026 23:09:29 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246fe5sm12433265ad.28.2026.03.10.23.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:09:29 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Wed, 11 Mar 2026 11:39:12 +0530
Message-Id: <20260311060912.3139257-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
References: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ayfiLWvz1tOBm7-HCNYD3ZhKXRXUej28
X-Proofpoint-GUID: ayfiLWvz1tOBm7-HCNYD3ZhKXRXUej28
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b1071a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gce-7N_bzMkFAa6Kq10A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1MCBTYWx0ZWRfX9QAMf004tCvV
 fmW0nPzLWyj8y1+oilpeFWXtQffb1xPwEwrNkd/kzTHgaABq35SvMRMdsI/2NK3Jiujc+SqsFOQ
 SMXgm7kXjsVvqvZkfymXo1IsQWpbM4DyDZ7/pF4+zx+EbIaERus0y+qzVxR3hgX7vJLJ9xFlGXO
 DldE20MjjNpi2uPWn1wemDWTJugm5hJv0D7kMxIuQ8r93QKcbDR/FPLjnp+Ni6xzOqMzd4Hj/3+
 MDMDDDeAa42aaKDQIdMxxSFIsDxsykhWWQA748b8cbEq5JR1+cccgpCOVtJmhs9C9aJAQ1rfpNZ
 GW/38zNiXIdvlauoIYf/jDpcu/rr1LrbsZW260HG6Qryi//KKRvJ3aaJocU6XtaFPwSVpcb0m0m
 Hocff1xGgpGTdwGYjt6QChtMhrTNZiPxuqVUMOV6x2D3cn+MKvUVs2zz1HBSgJwbp/f7F9fwdZl
 ufyx48624s824gP/+Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110050
X-Rspamd-Queue-Id: 8C65925CB1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96876-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

On platforms that support Auto Hibern8 (AH8), the UFS controller can
autonomously de-assert clk_req signals to the GCC when entering the
Hibern8 state. This allows GCC to gate unused clocks, improving
power efficiency.

Enable the Clock Request feature by setting the UFS_HW_CLK_CTRL_EN
bit in the UFS_AH8_CFG register, as recommended in the Hardware
Programming Guidelines.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 11 +++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..0e653b34b00d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -683,6 +683,14 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
 	return 0;
 }
 
+static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
+{
+	if (ufshcd_is_auto_hibern8_supported(hba)) {
+		ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
+			    UFS_AH8_CFG);
+	}
+}
+
 static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status)
 {
@@ -708,6 +716,9 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 		 */
 		err = ufshcd_disable_host_tx_lcc(hba);
 
+		break;
+	case POST_CHANGE:
+		ufs_qcom_link_startup_post_change(hba);
 		break;
 	default:
 		break;
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 380d02333d38..f19def37c86f 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -228,6 +228,17 @@ enum {
  */
 #define NUM_TX_R1W1 13
 
+/* bit definitions for UFS_AH8_CFG register */
+#define CC_UFS_SYS_CLK_REQ_EN          BIT(2)
+#define CC_UFS_ICE_CORE_CLK_REQ_EN     BIT(3)
+#define CC_UFS_UNIPRO_CORE_CLK_REQ_EN  BIT(4)
+#define CC_UFS_AUXCLK_REQ_EN           BIT(5)
+
+#define UFS_HW_CLK_CTRL_EN	(CC_UFS_SYS_CLK_REQ_EN |\
+				CC_UFS_ICE_CORE_CLK_REQ_EN |\
+				CC_UFS_UNIPRO_CORE_CLK_REQ_EN |\
+				CC_UFS_AUXCLK_REQ_EN)
+
 static inline void
 ufs_qcom_get_controller_revision(struct ufs_hba *hba,
 				 u8 *major, u16 *minor, u16 *step)
-- 
2.34.1


