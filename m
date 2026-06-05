Return-Path: <linux-arm-msm+bounces-111319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /YznJo9nImq5WgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 976AD64565B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:07:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L7EUSxD2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BPmML3gH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111319-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111319-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E9BD3020E27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 06:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38EC3FF1DC;
	Fri,  5 Jun 2026 06:06:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664533FD973
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 06:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639590; cv=none; b=LSsNXHdlokV1+wVsDASYmZBcS4oZdJZJnGTUZJ1LceWvhUqr7IPciIHq+fVBpM3/RTfCc8JNUWgVAeji9rnx433DvG3hBrot6bvESY6Aq2L7M/mJy+NrSkfbibr6QbifNPUz2iS/EYR9T8bD2BXM9rST1/bS6cQQzs7u0iBK4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639590; c=relaxed/simple;
	bh=MHuJ4fKzG83WmGcGTNoZ3KKqRrE2qcs/Zon327BW3+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X6IPQPfaJVZC+Sb3Tfg9EL0CYZi/oyDnhiwjaHbaAsdjvq24Dthv4HwmcZyrb3Zw8TllHLtcr7zZEvY3UY9OyvK84srZXPWwmm/tLl3yHYzTdCpKCkMz2zfCUU0NAydyc/2fQ8Hi3h6uJ6vtqxNvs7T4Ffyx7Q2Os488DACY48s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7EUSxD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPmML3gH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654MpwXN1132195
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 06:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qpmv6sPKR7DMIDOOIMilBz
	T8udCzHjrwL2Hfz/sedlM=; b=L7EUSxD2NN+HUnUqvlKZbw75Gz2bb8OvcgWuxM
	y0Uubhu6WtWWc5TZkZThtyhH1LaHM/Klhp7bg+NFm8cTrWrrJG7/oF4GKhVYQcLn
	nxVKeTnfI/qMSvgq4LFKy19jjMRYk3EopZiMPUGY5FB0rvU7bib2seRN6QtDN456
	+N7EUz5MvRSW58r3iKuDX5WpjRKJKgD3d0JyaJ+hFLwC9p92lzZHxDChq+IJ80Wl
	2nJrpA/1GwANLxMgYV8qr+Bq5YzdPWCWsQ+rNH2KkaFT3wJ/+Z5j5FMqcEUayN4p
	12hpkAeomeL1r7RAekVVFx95zTGagd5alWXQPXt5LByJ8Bvg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsn002-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:06:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so1941307eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780639586; x=1781244386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpmv6sPKR7DMIDOOIMilBzT8udCzHjrwL2Hfz/sedlM=;
        b=BPmML3gHEmcBu8cnbcBHjRAGoEyXaMdArH0cKIcs0jWS6SL8cWrQ4q9ny15s0Fi+cj
         udljWhDOi079MPuxdy4hD5e309JGLOJpb/PYqG3a8ZXmErKhl1J1Wf5F+WEgtd+eV3MS
         HmHEPZVWIi475h9oIq09CLgqWeHFGUS3OPZa+gO6qgYfJUJVcXqKPm242p0RBsT4nmXB
         Y1f40CP8qoPRgSkRcW8EKyOkcDct8MR0x26Jx+nML9b9uWf0RaoC0jhuRr3gm0iOpNkk
         jjhsbrIM9er4tSLnG+dlqMwrTsAqb7ABQMx7Fn2G55hGn+8qMH6pnhMsvTsyakngBoFz
         SiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639586; x=1781244386;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpmv6sPKR7DMIDOOIMilBzT8udCzHjrwL2Hfz/sedlM=;
        b=em/k9HX2wyVcnE6k532BKSFMMeCEQ+/5G48GvCWu200sVn9BP74ViWzG/l99LobfRq
         cMI7ZcTIOlr3iW+OnKWEsI9FKA/NvcQ9KpKY6fDuCkNcJwZerEsbZTJmYLSJVdhTledZ
         +R2F2SAcjw+RCkO6ALtIlctWVUgTS/5mqsFQ9hrTqgHC213tGN2wI3owTuCnuoLo+lgY
         3oCHZ0tyt/ZunY97hdLA2iAXAArGBZY1XVWm+NTcOYdha/g5nm3Jx1WHRJh0xM32WthB
         0BsHFQXvTirUnvx/cBPuHUntqLn3yD5HKQ00MTISBiEC8/nosdDBBQx2JYSNi4Y0T8ZD
         DbFA==
X-Forwarded-Encrypted: i=1; AFNElJ/Mue/Vj0UGEALfFm2Pqw1ZoArT4tlwB9W9SjLwh/3D31ZoERTb541NB5X+QnAg5p6zFcw5eK8423x1UT1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd836ASRnax2mBJL5AM1JRm2Mzx60M1ABUQKk8QyorD2/jE3Mt
	zpeT2BJI/529Gdg0E+JSd3P1bbFSde77Duz/l3sMK/32vDZUdTLvtmnd2I/nSv0o+oTdpHuCwk8
	mO4YzXBauZvAqMcxlJgLwF1TA4ABBsUom7R5VRJI4//u+hi0X7bYZt8/9ux4iiaQZI1tV
X-Gm-Gg: Acq92OGnracn+zHaVmnY4j12xzpUCe6CO52FoJQH3j0OHfl/0GOgZ78NgMK5jIHrejP
	Wrz6wg0lluSxCc8R+LYXX0cAt+L5/bpra0BFYUG20XadSL2w8YI5RMj8urHnjDf+AFIuc0FCZ0T
	Mc7IEzLcJ1N3Wcacik3IL8GXOq2vzg7yimAbQFsLnGlmhsrHGayecetdO+HB18vpjXBcMRdzqJ5
	7ZflkAK99JREmlasHzB2ecv0mHHfM7dDYWLFenZgo1/0ZLH9tp/VH+fv6Jp3pxVH0NAIV09pvTe
	QX+DLEdzGyvFhI7BKn+Lyi9l9UBJLqK/1X5zYY3tiAi7FLmPuIHS5vn4bUBa1xLzJ6ZISeAeLfO
	b/87d9VrVbCV5s2aITASATgFYEAEODN9bnQ3n8QVwxrnhD+j0HRZR/cwciluBv+3u8Dy6v54cqN
	oGUekZwSs=
X-Received: by 2002:a05:693c:2288:b0:304:df8b:71ee with SMTP id 5a478bee46e88-3077af31664mr1005521eec.7.1780639586069;
        Thu, 04 Jun 2026 23:06:26 -0700 (PDT)
X-Received: by 2002:a05:693c:2288:b0:304:df8b:71ee with SMTP id 5a478bee46e88-3077af31664mr1005489eec.7.1780639585486;
        Thu, 04 Jun 2026 23:06:25 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm6933488eec.16.2026.06.04.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:06:24 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 23:06:16 -0700
Subject: [PATCH v2] dt-bindings: cache: qcom,llcc: Document Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFdnImoC/02NzQ6CMBCEX4X0bAld5EdPvofh0C6rbFKodpVoC
 O9u0YuXSb5k5ptFCUUmUcdsUZFmFg5TAthlCgc7XUlzn1hBAXVRF3s9WvasvUfUTVkaSwagalG
 lwS3ShV9f2blL7KyQdtFOOGyKNIetNrA8Qnx/L2ezlX/2Cqp/+2y00dhjA+7QuroxpyCS35/WY
 xjHPIXq1nX9AMVtMwLCAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780639584; l=2871;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MHuJ4fKzG83WmGcGTNoZ3KKqRrE2qcs/Zon327BW3+8=;
 b=NTG/Zg+WFG7IbGPzAHS67W1p3xcLprPwwoyVUATyFwKuXh2NihStyq2cnAaYxWhHY2pb+onH2
 clcIxSQUScrA5XZKo/c7p9jdUbGO08DJXSksknLaqz3Y9zWFtF1se4R
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: AjOOhxZDWAifekgKejZ1yNe6CBSpMDa5
X-Proofpoint-ORIG-GUID: AjOOhxZDWAifekgKejZ1yNe6CBSpMDa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1NSBTYWx0ZWRfX9vy4S3kt4OOd
 6jRG18PVA1fdrYm/ZahTRePI1+Uw7tB1Qrrb1LDzuPm6sa1oYXbsnYgTLKYeJzKRO8Ht1qiDyMi
 xB2oIPFSSH7dlCLERnI8sn8sPKzaPneQAgwcxBzdfTiwMNA+lojqB/sPp0HuyEWxMgZE3qhlm6H
 vDu/5SVsa7VFYKWPfwDh4uvgbzsQK6NnICOmLuJpbemD8BMbnmAUS0YgDlT+ajXvZ+ryQMsJ+kQ
 f53YKRgWXHVMqvUOlCqfEMfCtE3XuGbGuSRgbUbyhL+fybOIdCgHETeZq1YeGY1aRtVO9YTejDy
 zv9XScLOeNaio6zcnKCideqXcXTzHlstddACc/m/nS+CcvSXa0+148cCZYgKBwsiD1QwXiI7A32
 mzrsegxMWBQO8UpwpwgSh7NeV9ujhJQgAnct64NOm83+u9ogDwFBopi9vH2dxfzd0GpZG7P8NSd
 e7kwwHjKbyQMcAMIc3Q==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a226763 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cvMXTzhbIQYqWXFn2VAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111319-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:conor@kernel.org,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 976AD64565B

Add documentation for the Last Level Cache Controller (LLCC) bindings
for Qualcomm Maili SoC which is fully compatible with the one found on
Qualcomm Hawi.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Update commit msg - Krzysztof
- Link to v1: https://lore.kernel.org/r/20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 63 ++++++++++++----------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 34e3a2d78592..a1340226a0d0 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -19,35 +19,40 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-llcc
-      - qcom,glymur-llcc
-      - qcom,hawi-llcc
-      - qcom,ipq5424-llcc
-      - qcom,kaanapali-llcc
-      - qcom,qcs615-llcc
-      - qcom,qcs8300-llcc
-      - qcom,qdu1000-llcc
-      - qcom,sa8775p-llcc
-      - qcom,sar1130p-llcc
-      - qcom,sar2130p-llcc
-      - qcom,sc7180-llcc
-      - qcom,sc7280-llcc
-      - qcom,sc8180x-llcc
-      - qcom,sc8280xp-llcc
-      - qcom,sdm670-llcc
-      - qcom,sdm845-llcc
-      - qcom,shikra-llcc
-      - qcom,sm6350-llcc
-      - qcom,sm7150-llcc
-      - qcom,sm8150-llcc
-      - qcom,sm8250-llcc
-      - qcom,sm8350-llcc
-      - qcom,sm8450-llcc
-      - qcom,sm8550-llcc
-      - qcom,sm8650-llcc
-      - qcom,sm8750-llcc
-      - qcom,x1e80100-llcc
+    oneOf:
+      - enum:
+          - qcom,eliza-llcc
+          - qcom,glymur-llcc
+          - qcom,hawi-llcc
+          - qcom,ipq5424-llcc
+          - qcom,kaanapali-llcc
+          - qcom,qcs615-llcc
+          - qcom,qcs8300-llcc
+          - qcom,qdu1000-llcc
+          - qcom,sa8775p-llcc
+          - qcom,sar1130p-llcc
+          - qcom,sar2130p-llcc
+          - qcom,sc7180-llcc
+          - qcom,sc7280-llcc
+          - qcom,sc8180x-llcc
+          - qcom,sc8280xp-llcc
+          - qcom,sdm670-llcc
+          - qcom,sdm845-llcc
+          - qcom,shikra-llcc
+          - qcom,sm6350-llcc
+          - qcom,sm7150-llcc
+          - qcom,sm8150-llcc
+          - qcom,sm8250-llcc
+          - qcom,sm8350-llcc
+          - qcom,sm8450-llcc
+          - qcom,sm8550-llcc
+          - qcom,sm8650-llcc
+          - qcom,sm8750-llcc
+          - qcom,x1e80100-llcc
+      - items:
+          - enum:
+              - qcom,maili-llcc
+          - const: qcom,hawi-llcc
 
   reg:
     minItems: 1

---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260604-maili-llcc-7331ae12258c

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


