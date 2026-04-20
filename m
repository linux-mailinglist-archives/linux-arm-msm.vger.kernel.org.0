Return-Path: <linux-arm-msm+bounces-103730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHosGED65WlwpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:04:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC8429270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1F053010B45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261D638F945;
	Mon, 20 Apr 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haxZqLW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUxhLD1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87CE393DC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679478; cv=none; b=ATglqOMSygrXtoNyKC2Kf1lgF5qjeOQzrfJ1h/peiCTIvlkaTu3JQFt4e89dgR7+3OHH8IBENOCQDukawuyjCV71b7DoC6jjXY1c8a8m+HHpyxFEzyV0/f1zwbJWF/i37hxlGicYoGS1JML35HGHAl6feC3mRQ5phhDwUIPCH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679478; c=relaxed/simple;
	bh=KqW4ho6y3A/FHoS7E1slFKZl/GqcfdvaciVSZoOmOiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP5Xu7gKY6PgCHCTLGX6yDr3XiTiG5XQx0/RjoXFFQ/gIy/6EnPskQRqIjP8q6DLXvpaDO6qu/TBsNv4uDKfT+QVOIy1NvWC5rShDOhMJ8UvAAoT5hfBsrFF2AOJApG9WPtTB4dUI6UZBUa2u/4OOE4YKgYEJRXjIqtHze4Wcpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haxZqLW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUxhLD1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K70GpO3212117
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QmHOp54KgPu
	3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=; b=haxZqLW+tefYq4fy9gpFp51/eKh
	Pt1amrbYZP9erq6Bx1DGu16Ef9ig3Fb61JmVdJQo4KEM4RbgicZ/nj64aRyetJth
	d/UekbZnfuYxQSgWBCQEqnVyFQ2Qc1HanPJ8ltUdcyDe9NaBp2/m1GKMExbVW5dD
	NwgPxRJTQAtdOnMO1UwzSn7C9HDgopiZ/+nk+75g9pr4OsjUrFI5LILVvKqPOD5d
	mTaIbNBbnzoCgm1yNBu/tRkWzSCWxrrDEbUgthRqQ9d+jt7vgGmmpcCTpA6ymoRc
	W8kBgckJZsdtDFVzLdC5HFbz/dgiKZdWV+ccX/CK2RjmvWwf5/6j8ftyFFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfgxwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so4093794eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679475; x=1777284275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmHOp54KgPu3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=;
        b=EUxhLD1sdNrjgz8T1bOCS/CLgRXMnQTMPKSxyumvts/7hec5Kxe02cuokbuIOrGv7z
         DYtJ6PLsfdooOtCFusbrY43WFcWOuCgWvF+T4t2tTErC5K7XPhCC9qgWJ46KS2dCesSe
         zOr0lfynhtn2Dvmqe+BY7GiykTd4h3TvFM5v8ZSTKfZNMGMwhBXvyFgZsJsaHeQu8nm8
         gz5tz1Tmi9LJeGZgLADmhdTEJIxEv0HdR5g2LlhD2QM3upyn3dXXPmyTNZ8bZk6vk/51
         0hclLf4qEKNN+VWcE3fWPn9Td1VHrAhkQhvjDtH8YPnSbOsycxMaERhu5zZgwivVFov/
         qPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679475; x=1777284275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmHOp54KgPu3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=;
        b=h+pj+nQJE/XLXuH/wWXhV4asrD6rmmdLZT/fbuiJqcN32/3zpXbujJUBd519IQL1iW
         tm9XZLUgDl7JS+9zMBvhYA8YtnO52dZ87C5J/TGi/kkhOCZlIcKjh0vN81Qg6p01kMuK
         1WrQ3fTu2RWJgA8vXtlz1eX0CQz0D8XmdftLs25tfslU5kZdIR2qmi04kI+XCY91wNt8
         gAENAUcdqHM5MH1P0neVX9odCufHCksB8BFsz02tVVTKmX+jZh7TrD/TWazMYQE3mem/
         tDWZwAF2mSKHSAzZR44XOlItIZXxCoz6R5fHZ8I6jQolJrx9N2AAB8uS65vfJoP0vSWB
         Ne2g==
X-Forwarded-Encrypted: i=1; AFNElJ8j2a5X8MTlLRezZUyBGgs6qq+pE2gTke2+Qj2AFV/qMUbgA7eMQlu6hZzGH5lzu5n6lqM/XYAlRbnu1cHo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yGTi1eeCrwJT3XoLWeS9IAycviVPKLniwrxT1MLe+Kw8NmUb
	eWzVrzY1D9gJ3U8N+RcB5rEfRDJ7SOQY66ipvFnbOrbvs5Ao6zW5uweq7ihGmAeZobhJCZGIkT6
	GJRzt4F8asbjQvKXtCx9TimiKh6GouhOYT//wMvhpO/LkfDn3d2uu5lge2LrmYxXxe6Qs
X-Gm-Gg: AeBDiettIxiZ1JOPQ8sI3R0CdaJjQv4Zat7fP1OEgVkT2tG/tr1TYvIt9wc2Xkt0sxz
	pYy+k0T1tqfuWPWGQ9yalGPk2GGdBxVqdhLzlHvdBJ54291sixeONuu7Lh7ta0w/FG1nPlstB9a
	mvGRopGSL5ZzbFvWi+0Zr44m5rNPIa/JhTufaZQ2HySVJSGl4YOX3MmsiYoydOaNijIkmI2JDnY
	KPIazQMGDo0DsPmrwn04zdfN1lr8bhf9AfNCpVPcbHNB3gZnCefPXlosFtQpFX+gYmFRSSSncCI
	KrxFLT1xvf2AZMtM/eEIh4Odn+xXFBi20zLS2HhWKwXEguowWmGu5XUr4s4+K9cDGCluteYpDId
	az6uK4SrdR928WvU868dfMFpaI9lip+qjgVuQ4SvFGm0Vj1qFdsU/z9VRfsnxzwQSVWBWdGv34E
	btzkzPhwfaB3op15b7
X-Received: by 2002:a05:7300:641a:b0:2dd:6937:79d6 with SMTP id 5a478bee46e88-2e46c48a9cfmr4728317eec.7.1776679474657;
        Mon, 20 Apr 2026 03:04:34 -0700 (PDT)
X-Received: by 2002:a05:7300:641a:b0:2dd:6937:79d6 with SMTP id 5a478bee46e88-2e46c48a9cfmr4728287eec.7.1776679474072;
        Mon, 20 Apr 2026 03:04:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller
Date: Mon, 20 Apr 2026 18:04:15 +0800
Message-ID: <20260420100416.1252983-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfX/oEEaw/yHYyJ
 qkT+Wz9CdsL+AiuoFrPakLFFL+xohwFy2dyWJIiEMDvUeu0qu8UAJi3uosC8vjIV+7ylXTsyQLY
 g1PQ5VFxnaqy8oUz712F9EyMKrUNYitP+0U/y3OSqCJkNfb+h7UsqE4x3maqUbtOInvIiVPhcD1
 7VW1A0TfQx6fOZSU0hno/M5+nQ3R4ejz6BO693L8HR9vJHXJnbZIv/bIdZEz8It/OVMCiW/WUAz
 QagqReIwg42Rj+N/jTK+ohNbAjc9oj+N+txcqts8sPH6dF1iJbDoDB971IFnMChKdZf8CB5ZaRr
 7m1J/4VfdfgBpWH9ofeBxpAVnOIwvueIz00lF8jqoEJCYqMstxu6A1hx6rDDNfFFnsKrD+cpC7g
 vb2pFMK+Me50isO57zjulJbVcZdBLRcHYgPL1U6kK1EjnEnun4IsewlzhsEVCTu7eH7kzkmuAr4
 0AN4YyL44yVVyJ576rA==
X-Proofpoint-ORIG-GUID: HUn8ILpFBK_nPWEvVHMODjo4zGoVYLsf
X-Proofpoint-GUID: HUn8ILpFBK_nPWEvVHMODjo4zGoVYLsf
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e5fa33 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o674AwMwzFixoRFAmicA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1BC8429270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document UFS Host Controller on Qualcomm Nord SoC.  Like the Eliza SoC,
Nord has a multi-queue command (MCQ) register range in addition to
the standard one, making both reg entries required.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..900d93b675cd 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -17,6 +17,7 @@ select:
         enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -74,6 +76,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,nord-ufshc
     then:
       properties:
         reg:
-- 
2.43.0


