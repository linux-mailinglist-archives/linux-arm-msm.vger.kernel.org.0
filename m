Return-Path: <linux-arm-msm+bounces-105765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPiHHFnB+Gnt0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:55:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F134C0FDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 777593020FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 15:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E00A3E0C6B;
	Mon,  4 May 2026 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3Z90JUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6ww6Vyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86139B963
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910024; cv=none; b=Ih1AcDR4hDmU2KNwUsDS4tqYNWJgBpbCpyojKX7B8z752RqAbm9xSg4mxw+RmF41mM12s0cp8vVK57X7Ybbkb0leA3bApsswRgt+wsB3EAu6zQms3jWRMePH0EoVskxcwMQ3t4/jJJ/351z/yPBaUuJXfGiFVv87XTswyjdVsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910024; c=relaxed/simple;
	bh=dg+jLLgr5vkef5Es9bMvn8ytADX9HeTxdUtAAZwm1dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gIOVRONg3m4QgbZpLfGdLF12Ce0rbBJsNp0GzZGNMPKGc+z7cpMVY6+Qkr4ADVg07IZe1sWRHQpx21JDBXNI8BJZtTgHvJNJF8pITWxEzTNUq38VJHhl0f6sy3CV5iKxy+fmkqoJGmiztc3/SfQFWBh6RfJ7grCdC4Tix1NgJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3Z90JUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6ww6Vyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FOseO1346374
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 15:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WF/V7sg4uI7nycWvm2M6o2
	Yc1bS1U076/rwa/8lCuZ8=; b=T3Z90JUngfY4NNVZmN0y71BpFhlvC1W82vc3xJ
	rHlkW97G/fQ0mS76+C1dfbyWvGfBlZHhAvBE29C9197QU+RKasPotiLwfBbWXk3+
	yktDp5C2O5zWigtY8B9ZZZwOIY9RTOu1wko48mRSeiUHyDdhEM99BRwX5mrpAAVH
	zmIhG3x/PvR5fkxudLbjRSbEX5IuW0oZpZNY3mqzaO5G5mq5g6+EjSn94YRBK6my
	2b8QaKZDQcKpijsEuN0TwB61OeIW+/o9a8hIktnaQaxis38n2cqw62AI8c9SVXPi
	qRa5WGo1tclyhO4AX3XC7oVpkYE7fXMrcefC1ARjQdh7w01A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2x82xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 15:53:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so116129471cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777910022; x=1778514822; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WF/V7sg4uI7nycWvm2M6o2Yc1bS1U076/rwa/8lCuZ8=;
        b=a6ww6VyzAIHPS+vb9FIgBmU6h6OXNyK6DWoVdS2KxKA798lHlTOvXXyyBQbbGcHJLp
         mLIXBpMVYAi+tlPkYLgtsUamFhGLNlJXtGs/ZJkLwjQVbN4IRdUJh9flDjku7DeaGaQM
         n+3RUECMO7mINeI61kCGVPO3+Pzklxdec55rNDyL6ykOMEYGaByeYPHXHMislu1sFlPU
         G5EIz5gGZ5OWifY9Ni9o0ePAS8OuWYZOG1n8odK/7ErDwS4za/ZK9319YY1/0mm/3tvE
         aXsH19CnKAFs8p07K8b3nqLmY7VOt+J+IrG0QJz6r5kcc8KgyC/TCVBLYlD+DImpoSyE
         aRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910022; x=1778514822;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF/V7sg4uI7nycWvm2M6o2Yc1bS1U076/rwa/8lCuZ8=;
        b=Os3ZusbQp3RKid7NlBV0p1m46Y4A35oeYS5itNNCMJefKcnjUZ9IOVrlsjC0lI1cE4
         exAirrZC64x7RPsik2FS/NXWXD/p2wfd2QDbRtovL/ciXgobKrR3V62IuTeEPfFYcKNw
         IHJ6npOjHG6RhGbtCBi0Oz7QPBaTDDqHKwYUHNQFVSq6AwWVFejNzFFRsjPiLWXiHxau
         ePeTzBEaJrzlj/TmxprDl3opwODksvjYkv8U0Hb896krtLyyUCuWCJ7w2xvsZqZ+GoXC
         vIiH85PxOeRkqOsYg60KCh1FE6tMeGWlgkr2ZI2oRigm1HY02FWCp3UaootRjbnPRdwQ
         yYhw==
X-Gm-Message-State: AOJu0YwyykOCPX5pAUJImzjTDuHQCzKhj90pWeTA1dX2gW2kcE1pMHh7
	KN+nB1Ec/7eS5dtBxZHkagEkAHwAs8Q8oHnicdPQMHifxGT1krsfswwk74kVgrHRGXG30MxBMkZ
	qTBkKU6D/LtfPEvtq5L9UpVB9lHhXuZzWEp8Oc8K8ZTDoiwBxCBodO6vJijmWExcGuxzN
X-Gm-Gg: AeBDiesBIKmESZd4Vo+IS6lnQX15RdDykbkYSRH4/Hl+PpXRdBCcFh6LBrA7rCG9HSZ
	5/nvRirz6VVvkW4VrKnDAWrzFC/aaWfry4YGxllP7OH/R5xj6CNansmhL/17g4ltPPeNiKAN2B+
	c96Knp+Fz5GiFJ07YkyisY+wPzWhn1Bm6mZgm2OJHeg0gq7PcMYDyWf7SPK3dB8DoWvmS2d7ytH
	RMbrk3JH3gXhsRnEnOcXJ6CM/sBb8dYzRZeLxVEZT7aPvAn+WL1t7H1ki2EbgzkHLaXjVUXjNug
	GUk7QHW0rGh44yHGT2EcVrJ8Zt9dKR9soSmuDte8S5gC40V6L/DFbPn1oMOYRHy0qLwoRzpoj1C
	bK34acCHyOubzwYXdV/8x6+CnlUebk6HR0mNsQnQC
X-Received: by 2002:a05:622a:2c6:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-51305301395mr1124551cf.26.1777910021488;
        Mon, 04 May 2026 08:53:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-51305301395mr1124041cf.26.1777910020900;
        Mon, 04 May 2026 08:53:40 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm303922915e9.3.2026.05.04.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:53:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 18:53:33 +0300
Subject: [PATCH v2] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPzA+GkC/42NTQ6CMBSEr0K69hGo/KSuvIdh0ZYCT6HFPiAq4
 e4WvICbSb5kZr6VkfFoiF2ilXmzIKGzAfgpYrqTtjWAdWDGE14kZ16C6fEjQaGt0bYE44Aa2h7
 tAzRvykKoTCtVs7AfvWnwdXzfqh/TrO5GT/vh3uiQJuffh3xJ994/niWFFBohizwTeZMLcXVE8
 XOWvXbDEIdg1bZtX3uJ66/bAAAA
X-Change-ID: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dg+jLLgr5vkef5Es9bMvn8ytADX9HeTxdUtAAZwm1dE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MD+r0lY0r4VwKhdWRbYplPkrzdJc23mL0vDV
 dLCE27zXKuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjA/gAKCRAbX0TJAJUV
 VngWD/9SyyZd6Jus8Ni0gxvVPDqQ6UWgp1gpW0pjx6ysw8sMFsoRUPiJSlWOIMLqaD7iKfch0cW
 +YL3gGEVIzXju3+2O9QJ6OP9tP5e9hBESiuudHoDT79yFBDnX7s3/XVn8rs/+BO0dOXXIJEAFIR
 Gm3kNVg1IS6RQsky5CUA3hHZBsC97ITXA3hlN45cgvm36A3lJWIahP6+M7ff0TStg+jUnMDAuEc
 J8BEll4gfoStc+1R0pGv76eEy1hMbXFio1XJZYDlPsjgppdUJml/2YK/Wbe5A1+Ku6U9jnrrDMO
 p6T9j+pt1aS/k9/0ciKjiZHMaLzJRZFrSaCivouSfpHpeOU2az61B4ltROX0cDnbEie40z2BkJf
 Ya9dmVsKbFLTawGAzJYkCe3QDw2UdLHZGlRxTI+0r9Xp8yO/54aol93bFIYx2y2fyc2PCP+qbki
 Wp5LhpJSOYPUTbkEekTGYU/Zcg3+nU3dAYT3x0qnlKpIZ5IYEcjitjd8oTqUoZeAF8lYFYfJVYN
 O65yRSb5jKNR02ffD8t/4A8WyDak5LtBbvEzpGTSXzbmTMs4xoYKL2m9RJOLcJrfSbgxYIanNT/
 v1cazCUpqAFGBpkAuwssJxE03obT2+vlbn8dBxfzF3AoCsNQeDbfotfhsuXOejBbu6SmTyWZdk8
 gppoAib4FtwWQWQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f8c106 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rFgtliq726l97mATxKoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: KhG5fGv0_ir9ZYRvQsiVee4PA_NZeuFD
X-Proofpoint-GUID: KhG5fGv0_ir9ZYRvQsiVee4PA_NZeuFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NCBTYWx0ZWRfX+BODt1oEz3kP
 mcd0OkWRAgC0lIqSaTd6q2uLoy7dqsaeSdA7UCtf+fASb7Ct+YjDFjxsOv21gjZhWeCLi5k72Ml
 eGA129doWB9HMNwtVs4Dsjlwvc9iHle2caXOpEOVTsGDqSr6ibwJQpy5nQgj9fvLKLT68DvB2cb
 eompnnGDdZH+NBWJPgVBB/ujvgyD2CuUermKjf0j2O7AL+JOtwPypFcXYiHTD7gt979JhNzGYtq
 H9dygRH2WeFrPfwjeZK4983yJ8/LS4pXgEBuAZRt1xxRlvpqaJICaY0uqOr4z7KKGeCcuBEyhrM
 aaVcb2SjlMmybZ9Bjo6J1eU2baGeqwFCqDKLXIG632EWVRjXXDnTqOh6Azh7v6S6q11qHEN3U+S
 9Wd0Fha/YAPeZwMwQBjiFdsC6tN0/iSeSKQ/vbEeAhT1a4C0HZnQUZm1auQwjnM1QiZTRe4FDz0
 /1hR7j66LtSXTUMZoyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040154
X-Rspamd-Queue-Id: D9F134C0FDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105765-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the compatible for the PMIC GLINK interface found on the
Qualcomm Eliza SoC.

It is fully compatible with the one found on SM8550, so use that as
fallback.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Picked-up Rob's A-b tag.
- Link to v1: https://patch.msgid.link/20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..411932f6b282 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -39,6 +39,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,eliza-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


