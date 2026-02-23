Return-Path: <linux-arm-msm+bounces-93701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKm6N5FlnGmsFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:34:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4702E1781AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62345302A6E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09CD27FB18;
	Mon, 23 Feb 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epqD4SEV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg/t3ddz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB80328DB49
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857172; cv=none; b=PT3CHtp/IFwHdEu3BCCgwZnPHGHBxbkyH9wKQ3wDBZPAIrzqGJBX2/6z4w5xmTDRZJzldKpiv9X3sSAVr5PDbvxwtMlnTdZhE6BXOF9iKJt5/MrxMAvHVOXf7tL0q2w4MagSjswioKbNDReyf+Zc8xdkFLH0DY1GzKOqkB59Jfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857172; c=relaxed/simple;
	bh=0xzDlC7N2Li2FtS8eDJ8PuGX0sJY8k9tUPeI83XobVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HH7bFaGi13sAc4uuiPewsjs0IvVoifJx1iaW3mDf94ip9oeI+6hEzgLbYgRozGcdfZ19TZsrf7bFdXuRQcfQ5AzNBIZFcL7qvPjvqO2gCOimABLqlgy5m8TlmVWKY/Mstv5rdkCkgZgY3cfFdbN3bZhXlGvO1IQ5sebSmi220rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epqD4SEV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg/t3ddz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYIhI561407
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tmBlSydX8knIZXyl0Pvuba
	2NBQKTZ/5ssunahHjCvwg=; b=epqD4SEV+phP27q0p5NYRuMIxmEmAasi9l1PEL
	CwuwSnM75ttuchtcKbEX9bDOYr9atk66lzilgHfya/guQmcChXA/j0JIFO8f+h6B
	gsLQ1Wl0KgpLd25BUAu8HJorZLnk1CR1zWk3YQsAT6zqUGb7D97usTAMY2AuiC3y
	qkRDft2Rtbc06QccpnsVK4DwfHtLx9GszaLPLflhdqk4YgO9dcvZN6qoa+ppGPzh
	OxDGc89432jZ5/a5y7J5QQ0UzzAtX9ciLlbATI/hsak2qaakcT8t/6d7cv6P8VrF
	ADuXQgXo1GSeY/JmzR7pITbMcGxnrz2YqHRctMK/4B8kFa3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r8mkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so4647480885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771857170; x=1772461970; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmBlSydX8knIZXyl0Pvuba2NBQKTZ/5ssunahHjCvwg=;
        b=gg/t3ddz6RQIbAiQ+YPXFbMBpuqbgrlpLsjPaxOMpAvMK9FJQ/IyYZ7Bu1+J7TJBqm
         GIS5eQBRUV9IxeCX0HG+Alcu11BxM4Rft0lYTlEPNUvhK1rqdOGj9I/0gB/KoP61Bqu6
         pr3z706iLvVELut0wOh/dYeI7v0XtZZlJ7yCEAXBlltZq/kX0yGsYv+z5t286yLZAHNw
         kShZkjY29EZp3jZfNBgZeFT7QGyYDQjz94j4WT2598IKD5sM+dr+Ah2dtiRSZG5zGaEp
         wO+ULCreBuaX2Tww+Yk9TZjgOolwwFYIa17Cc1XbIY42clIj10rUc0ncgX5XQQr3NksV
         h0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857170; x=1772461970;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmBlSydX8knIZXyl0Pvuba2NBQKTZ/5ssunahHjCvwg=;
        b=OhwTpSlY+gvJgtgArOo1E9HgfEKx8LqRoUUE5V120zDeihUfbq+N9ilza4vxI15FNq
         nf7M3t5CIQW6rUN81pF7fw5fWakWciXKtHYpZ3iIArgisNt8x1V2/jsglbhGR/JOcm8Q
         GQetAt70pgkr7rs9QddY99mkO7vKXxD3Wv9ZEeY7yNiH9wATRwES3sTtsnDQ8HflD3Em
         AfIpcGWpqXk4AcydwvGJc26i/znaj6BimshpOuVpm7rFVKZuUB9JbSvKfuM+xlVxE+2l
         9g7qQ+o/hAUaVCotTDZY2pJ1/TQS/QKwuYnGDVOySn0QwV8by2yAjwItNBqoMWOaaggY
         0v7A==
X-Gm-Message-State: AOJu0YwkAYsqdYOJDmaM682l34yEu4Dgq8lP+sxUTqrL/0nUstv8d7gc
	DXzuqvjOXabbjIdJU2J8LVYyn1+X8JWOB0znoP9a4DC25bE8jYKLb1yFjOuQPcqInStA0vsFaur
	xpwxhXCCrWdc7WzdXruie+V6QMa4dCDLKrM2ZkALHZ1eED8DwSQSN1k6jEqCZWQtUWWYK
X-Gm-Gg: AZuq6aKiT82SMYYhsKwQFthMpdefj01Ah34rYsYknQRwfxLq77HRkZgs6p/IwY2cbFS
	hIUSQS7N4TrCc/rymXkONuQmGpOSL9sG7LWUqvxD8l7Mo0cKflTBUXDVmmfn2nhszhxmYAv9Hk+
	olpJbiTmrAx+9gyGvd2pLeRBL1f0TyeO9E1Y7pP6GlM4MXOAywUBEDIMDOT3ER9o1uXeXsBkHTx
	c4cPZssvUDGCcfBnxpzAIY35Ezptw19f1rkRsQu+MGIjvJCq4aBNOluzuBSwIc/mR+BP/10gEYt
	DNwvjqtwmAQsDnr423Jue6NyK2rDu65jl6BG2JomO+JsDQZytRR7dUc9izPNjKf3JLAMY17ODsJ
	o6ogyHf6cBkxyJhjPP8atEWZkUv99fA==
X-Received: by 2002:a05:620a:258f:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8cb8caa0bf3mr961160385a.74.1771857170064;
        Mon, 23 Feb 2026 06:32:50 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8cb8caa0bf3mr961147485a.74.1771857168555;
        Mon, 23 Feb 2026 06:32:48 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm189638825e9.13.2026.02.23.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:32:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:32:35 +0200
Subject: [PATCH] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAJlnGkC/yXMQQ7CIBBA0auQWTsJzKJNvYpxAXTAMQYNI8ZIe
 nepLt/i/w7KVVjhaDpUfonKvQy4g4F48SUzyjoMZGmyRA75Jh+PQcoqJSu2pEje07SkJc6UYIS
 Pyknev+np/Le2cOX43E+wbV+XZUhldgAAAA==
X-Change-ID: 20260221-eliza-bindings-ufs-2aa269f9c72f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0xzDlC7N2Li2FtS8eDJ8PuGX0sJY8k9tUPeI83XobVQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnGUJfiNLyr/PJJOJOjXGNqF7mzblOUPo3cruU
 /cpCLFHCrCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxlCQAKCRAbX0TJAJUV
 VhhqEADFwmKe9bIw5zQjYcxzlxVrWDmAj2P9R9s3QjAYNMpGJGntvZvBTS98gIJKBEEKiQdnVMo
 /7L4ziTGh3px3sFxEFBI8ByAN3xr2DeZTlxFiUoeNpkPVaN6m+c4kdR6EUltHod5J+7PAAAOGcy
 pEVqayaE9hrK6lrri7OJu2mZ7hspe6yssgM15NX3SWGw97+syBMP0CxvrezFonecPSbciKEXPIM
 eC+++3WpxZ28EJ9MNuriguxjQI/YM1nogVeZnZSZMD0CQ/rDU0dy+HVJAFBizPVYlTXAc72GEwa
 O/jtt0A7+uO/MwgKrQqSqAYpFO60eIxZoAPHyB+iKNNUXqq29BE2abBCZ5NqyxvRhN9XJ2H/o5O
 sj9pDaVQkyRzUHagrOiFjmzYeZj4wcvND71Gs8cT/taVhkpaeKqeEBVQhJytfbvlrOkTWEn2DLg
 TLKar1SzceWuFey7/meXUe6AsD9k3ZjQS4qs54oGLbijjnW8tzS8m6iMD/H/rlH2mm53q1MBlOf
 fQxZQdVJSlYMrgR/aJTpo2xmXphvST63wHmcQWmI0G58uLab9ElijEG29Qjy0NX8FvBGiBkcVuu
 zr8morp2GPmNbHx6jTXqH0nj+yfGR7mVTGQdj96smrrWTKw20vqcGYFzgNZNYz3IxUDY+YuTZAw
 rDUGXcvyhsu7F4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ccgtvd8_qOYKqqZiiypWm82qxRft_jmo
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c6513 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dkR0I6OD3irOzcp_LXMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNCBTYWx0ZWRfX20kCPXeNenck
 2BKYQDIlbT/ieS8DHOyuTJ44Kxhyu8uF3ZLeJkh+WZnEGlnS7NYgl2t/R6wPNCzx4uEqEcrgMoa
 XbBbwxjCfoRLB13rKkyiA0cHdZxyaTYSo4AsDbtZjTPcoWY5iLsIVxyLlC8ijncb+iSRfCycWrI
 bOa/v6htvQsC04Fiz5c+bldY/NpCuw0cVLaTi0km7utDRkeklKntinS0U+QpNBmWaWH0ny+sibu
 kiEMiMC9nSpLjqh1yZUtDftXivFmKvwRDSs4hF8bsVCSh/7+Xc4OjM0vwwN1y2VRaJaoPOEuGJR
 qIpiuul90CgurHMjspjnlCEkSLMHdSU+2vcFDzdcLEgkJweuwXYd2a/2T7F13bhZSUuK2AciMDX
 KjAYru7WGPfRNlT6otKft2l0UcivkQ0A0JWRKc04Xbaew05Ea1y8Paq1fMATxHChGK8QDvWdeFD
 8OP3eNYeOPgZ1/4oC9w==
X-Proofpoint-GUID: ccgtvd8_qOYKqqZiiypWm82qxRft_jmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93701-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4702E1781AC
X-Rspamd-Action: no action

Document the UFS Controller on the Eliza Platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index cea84ab2204f..80550144f932 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -25,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260221-eliza-bindings-ufs-2aa269f9c72f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


