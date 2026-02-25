Return-Path: <linux-arm-msm+bounces-94139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBFYAvAOn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD83199232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B88A3024A27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957F3D412B;
	Wed, 25 Feb 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtTmz+ze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaMV7SxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682C3D4122
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031707; cv=none; b=s6nFFev+XqFtPPJ8NiXVI5HbknuNcvDP9fiFaQlxOiVCRz+jZuXj0/dSeUFZSM6ikDA+bwSOqZcT+tV3hyMXqJvROwofNhZSVh6MUYQa78BijeHqEcHa9SH8foYxWpNr9lM2iKAI0BKADGk/Ep0dYBm0xtCNk4fRVpzHSzaDajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031707; c=relaxed/simple;
	bh=3udxX9/Yu7rrPR7gGNluw4aUKd2OOvqDuOEkryP5py4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QuY0jAwsj8h4bmK5uNHz4ioCj/LNSEb1G6Y8bR9Kxg7JolJFHpTryObyPIXSWR+eMGYjWvwt3cxpym0NPfT/loio3o22l/pQ20sBSvbHOLDuonJBdASLr5xP7Qb6Na1uxTzItRWmxUxGCmzyyQOhkWY+QI3iISsq5esP/wLLXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtTmz+ze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaMV7SxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SiR11088217
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyvkN/ddnYH6zpwu13QwKtXJtceE62lvHmjKAUYLRIs=; b=NtTmz+zesajPIrb6
	YVTK0tNMF7RgEmGc+p0LHScNjYAbRvSfqEjmh1bAXk7Tos0LoGLtzJzGqEjxNebr
	mIB5/Fv1BBhvNRkspxo/cBXoOCiB4mL5jpWbncjj4bMIsNs69psARrinvcj7eXHQ
	UzRXk2nNa3aSZ5fXP8u7E6noWLrn+C6CdUCKe9m8iKcuCaQo//W82fLtMxBy6KBW
	zSangBLx4rF87YyhEn99kBNymRVtvfNEz1N4PLx9uaTmp8Upi/Znl/LVat0TCmmq
	QYOLlbuzztDxlvaLvZs7NdkbtgGqO1TJEGcfV4jLOsmfn+d3C8opwJt1lUcwBkEv
	6Vrsnw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh473bh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:45 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-66308f16ea1so77011822eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031705; x=1772636505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyvkN/ddnYH6zpwu13QwKtXJtceE62lvHmjKAUYLRIs=;
        b=CaMV7SxLidVEA8Wa/GF+aNHUBpPXOppj9JtnSb2ufGXhGeiXYyxcanD1Q0cgg8lE6y
         vrFPMdX1dDww/z6zObk2laXM9Mgu1P8fNdyhzDZ+vGpPDgsgfrB0gBGpc7+KuMZxbnZo
         FN/m0jqghsqU+Wwyjtftp/Da6GurIQd9TILWWXLNU/NKF4JC4dsOInVQz4zScKLSARDy
         XsTYgcFSxGU0dAaLu6Y0Uym2mDM7h9uhBrCKRZoWcWHTYJho/XkXSuij1HrN9TPqauqg
         4At7aXkgrNjZG442xy+gU5gtyP2vwiV/uCFkAiu2SECBCCM/fT04f9Hi4v7kVMReXALV
         XG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031705; x=1772636505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyvkN/ddnYH6zpwu13QwKtXJtceE62lvHmjKAUYLRIs=;
        b=ezIcLG63utf7v/DheAHs3huzo/sAcZXmf5tLj1H2wKSQ9pyLRTxbAugPAGOPz35LiS
         g/7yxd27dR4GwsEJLHSSYr8GyB8cg44f3FJE4ML3UkLOFTWEtm0xtpFtfjOsGVHYh2L0
         9HoKKsig70w80uTmuPjjny/26zoC4r29zk1E31SejZSQsCM3mlpVXZ2Xtzu3F6X/pnih
         4jDZzUH9qI/cHE4LWQMg49tEOxrZ36bI3IdXljF5GEyglbbdNJ5cC3xr7OiXzFfiZBF3
         NrF6N/Ju+M22nkxqEqQMK0WJencWAOXYgS9Q9JLjh6oJ2fF4nxTTGAUN4xXSOcu6NnQ3
         We6A==
X-Forwarded-Encrypted: i=1; AJvYcCVc8gtbkUnM6mBZB10aWHo/MrsbWasn56RKwwD6QAtCWK91y5r9vmstqtMc5WD3X8myBZAlN8ZY2wgTyHu7@vger.kernel.org
X-Gm-Message-State: AOJu0YxcM5bcXMlfnRXXfYyFyVQXpy0Pc5rRrjy0F+yGOdgYTnZ3mg6+
	hQWMuw64mPn6rro7mA/MakrExmQpzn7kTHX7epae62nb6vQCv9/lmrf8kh4giLz+e9/D9kO5oZ4
	0b2rL7Nkr/vlmyheKLLoXI5EulYriJXJkU50yGr7KqQcLiHiNGmRe3QnUnkM8sKKDaLQj
X-Gm-Gg: ATEYQzxWoZV36nnJnOvi/J0ie4SQ3REUTieWz47ZR0mv9sN9d6YPadxiZjdpq+txDGJ
	nZgMg1BUw96IdVMrWq//uZVxoOLZ9J7d1ajUVmT8wC1buiRKm5Gr4G4hn2xw1a4LH88Ac7COv2s
	thDd9j0B3zO0av4tzCwQRg1oYovpPOJVR1eMpPblW38gdduV2qKps69ikYtCC/qagrw+NbcUM2l
	oJUavoIycN4Py3kcVoXK5ypDBngZKFOQHjzT8ks1EagP0uuxDWFjw+KSS4gNO9rUb4XabFoCbhN
	srwY45BZ9UVFhplXjUAR7OxmwvM6SN/rX5awZ7+tCnbdF+MP4HIwsAsjncbfrz9EC9iSRa0XtP2
	aXq/azQilmvhGjhF7eCB025IT0UbDoFieHEjV6J/OnDHtVnWR99FZL0+78/AthVcd41+q3J688C
	1AfTbA2DHnHLo=
X-Received: by 2002:a05:6820:16a0:b0:679:f05e:f13c with SMTP id 006d021491bc7-679f05efbb2mr181208eaf.60.1772031704449;
        Wed, 25 Feb 2026 07:01:44 -0800 (PST)
X-Received: by 2002:a05:6820:16a0:b0:679:f05e:f13c with SMTP id 006d021491bc7-679f05efbb2mr181175eaf.60.1772031703720;
        Wed, 25 Feb 2026 07:01:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface mapping
Date: Wed, 25 Feb 2026 16:01:19 +0100
Message-Id: <20260225150122.766220-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lv5MXPKa8TWw2TplIfiemm1uXXjtIzcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX7rKWzVb3zFWZ
 8gPKfEsNI0sX+07USa/Gw6h0S/lUTF/XfrOBtkqDOU3CKW2Dqv3DoGnjRmaRkQktEWc5CEwl+dM
 dz3BO1fHbi3CEt0F5yBOPV+A11ZkRV1Smb3DTi9moGgfbsz6G1S9nTpqGdLiEJ6SYUZ9HuQE6qx
 PudrH6WhEYZp4nldB84/hXk/bAH6KmUBJLRIB8h8IUzxu4Os8ykNyVJ4D5y+1+eS/DKn1o4Is2j
 EDNdLSoqS0CtsDc5v8+cr2JZaknUQhDpbAVVSkAmBukOerT0EMnta5H4tyrXUJvfVeuWZkZOIjI
 Gr6F6v/oCWGDWssMj17R5S4YpQIlTSj8/OaXPnOY+qRi0qJ91SZMX/1+HXea5RjXqLOzUTD/74p
 6Z5X7hghEqIxF4UY1gIkxdgENcipqSCaPGo44ZrdPlw9Y4kErFviICKtMbV1L3kJPpjkf0iba2E
 jt3BDtnH2RH41yz1ivA==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f0ed9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KcpIjEZMv6ng1Yh-ZjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: Lv5MXPKa8TWw2TplIfiemm1uXXjtIzcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94139-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[loic.poulain.oss.qualcomm.com:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CD83199232
X-Rspamd-Action: no action

The CSID‑340 block uses different register offsets for the PIX and RDI
interfaces, but the driver previously indexed these registers directly
with the VC number. This happened to work for RDI because the VC index
matches the RDI register layout, but this assumption breaks with upcoming
PIX‑interface support

Introduce an explicit VC-to-interface mapping and use the mapped iface
index when programming CSID_CFG0 and CSID_CTRL. This replaces the
standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
path.

Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
preparation for full PIX-path support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index adcbe3e01d62..9e80408727ee 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,7 +41,7 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
 #define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
@@ -51,10 +51,24 @@
 #define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
 #define		CSID_CFG0_ENABLE			BIT(31)
 
-#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL(iface)					(0x208 + 0x100 * (iface))
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+
+enum csid_iface {
+	CSID_IFACE_PIX,
+	CSID_IFACE_RDI0,
+	CSID_IFACE_RDI1,
+	CSID_IFACE_RDI2,
+};
+
+static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+	[0] = CSID_IFACE_RDI0,
+	[1] = CSID_IFACE_RDI1,
+	[2] = CSID_IFACE_RDI2,
+};
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -70,17 +84,13 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
-{
-	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
-}
-
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
+	enum csid_iface iface = csid_vc_iface_map[vc];
 	u8 dt_id;
 	u32 val;
 
@@ -106,23 +116,24 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	if (enable)
 		val |= CSID_CFG0_ENABLE;
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
-		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable RDI (dt:0x%x vc:%u)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(iface));
+	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
-		}
+	/* RDIs */
+	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i))
+			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
 }
 
-- 
2.34.1


