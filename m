Return-Path: <linux-arm-msm+bounces-90809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCuGM1nceGnbtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:40:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CFA96E95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC75E3029A7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCB7361DCB;
	Tue, 27 Jan 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fa5sMzRE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ehd0aGn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BE5361DB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527593; cv=none; b=FcEQO6yu8c1c3e5mtPQKQSboJbllKW7MfPFlyvmWdR2h2QaKobBw6e4Zi1waIEu7h9PmkoV6aUPRdRm4v2hFlc4+UNvcJu+Jqep602Y3h+ky4BcAi6WtPzNU3+NNawTcZF+FDEXJdkbU6T11xT7JkDcS/o+IKP2FGE/fNw6Ykec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527593; c=relaxed/simple;
	bh=EgqLcXuTlGZv2agsjvJlq+LOofnAqNhpL65qt3SuLak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Esf2I7Ja6eOYoDv659RIzGliP90ucZ9HaX5d62MQ3HPW1BKBK7gPJQNe6mCJp8zZb2uPLVYBgAee8GWypobb37igpYUdAQ+//s/dzejhudJlwRH/PbHzu3scNRNqoPLyfkpFY0+poRFldfsehIBD1di/2fxQQJcsreJwGDHiOQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa5sMzRE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ehd0aGn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF40tp2379287
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H/d2bi3+JkpzVQUWLv9/+M
	MlTlvgE/L0hzA72n4pIyM=; b=Fa5sMzREWyXigzcGfSu3gYn6f6Ux/Mm6AHkSo2
	9MjDsJn0nptwLZhoOCU5ksqdAImMfWjNhwtp7oJUPCKuX5uTQwqENW4eGsA7imTH
	xFfm/J5Jb9uYrBYJKliqusVcllb4SAZ6WSntlAgeZqcevzl2k51RwC1dKcrZUPJO
	rXwG8AvE1b9I3YsutcZKaUo31aE7zDQdRtrRwG+PpIxeoYPyF7jfzOTKGtBM5F/b
	0cBhEfmGtCzKJ+J1SHD6mpRyfPSw6xstDtPaY99W1znCVRgYZ5IXAz+dOsbfvSid
	0zmzsekHGYKOSYxIQo8bMprwnW6OqZA745HP/LgOAPDH8t4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr9d70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:26:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so1482439685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769527590; x=1770132390; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/d2bi3+JkpzVQUWLv9/+MMlTlvgE/L0hzA72n4pIyM=;
        b=Ehd0aGn5yRhGGTqS6GV9X5ru6aThFv9X/Pkf+U07iXAlMVsW5Mpi8eL3jyBCa8HJ9m
         kXIlg8A17Rd+0Mpr+l612os4F7fg2biLgNbgaTaYZWDlJ3KtJbKggNMGnEgNilT1yF/n
         Uoi7qO5UyY1no8tvKuJ9Prhg4mu6cSKBJDOlsl25nKAGmXIl9ZdSDoNWvaUh4lhKxVUN
         opLTSeFCB5g+VvZOrog7XLbtaKj8dAJ2306UV6P3sMoBYK5ir5jRY6KRtulTikiFspMB
         QDxJC2GexjkhoH1MXKTJjSoHTMZhyMzHlp3uUdsyJL9oioPzbmy/EnJPWBvBMWd2UrpJ
         6E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527590; x=1770132390;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/d2bi3+JkpzVQUWLv9/+MMlTlvgE/L0hzA72n4pIyM=;
        b=cVRGRztoRsJdDDxwQuebQG0zs8Ri5fmOOHBlCMkL3kBAxS+1cgYjF8aWLijO7PjpXJ
         DOjL1myHPtXyGaZmcj9YdDsU0a3UF9glwOW8iTj/Kt10P3PatJ5wuqE/fVJPKSGTa8Fk
         vSpzhaeujTI7bhVP5WrFBOTm/+TD8dY9VJ7kfMWgnGwaGQsJ1GQpapCtZithrSoc+YIH
         pPvdfoNAi8dN1SEyTJ7mtPHzJUJO0SWz02c4/DG3YHCpK9JRBRTX+m+9XYgPrvjDjDxo
         AEhcINm6Qzzg6ZpQbbAcqwL60JaDVsHLQQQMP1LboZNJ0gVZAoUIhTPU9FAIYhPlFCiZ
         efIg==
X-Gm-Message-State: AOJu0YzclPcNtHUL1BmkqOsbSnA2Ky9/Fw0kUzB23ZzO39mbre06tFWV
	iws0IkHydC0sz665XVya8D1CiocAHGnHjIjyE+JGKaNP87C9y7AbClxPV/x2DKuR/rAqaaBbITl
	ltLIH1GWWRGfvPhVJ391LGk0oXq2PD7Ok5RwTsVWDGlBeq2y89NfCo29rm/ib3xg1LGOJ
X-Gm-Gg: AZuq6aKUKEppOIf6Jwgr5mM0a4X6TfV0hrNJAPgCZz21Or1EfS0cOgRFmc1t4ez8tE2
	CXoH6s+/obYTFxt6OiyLqv5SMCcrK5/dbT2Nvm4OzsSCS7JyluAbeYu5k+GWBF3upFplUdN+h/R
	mt/2WxJyy1mH5S0lUvpPTvtPYrLA4t9jZNAkT3Cdqbo1fE84Ny74bY4NuVrB7+XYcY7cFqxKA/T
	1jNkaNNNmLMWrA5ZMl2GsdWwg1uLFw/5V6Z7CfdSy1bTdnrPXrCgyEvqy8cT2XfwZWV7CA/Zcr9
	37I9s+IphQCA1pdl9x7AZDgUEOSqBJvmx5PvozCX9ziPVrugw3YWMWWg+Cy9jA5xauNefxtJblt
	Hl0gJvxA7M0+EQSikZw==
X-Received: by 2002:a05:620a:2984:b0:8c6:b19a:5a46 with SMTP id af79cd13be357-8c70b8d142cmr248710385a.47.1769527590176;
        Tue, 27 Jan 2026 07:26:30 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:8c6:b19a:5a46 with SMTP id af79cd13be357-8c70b8d142cmr248700585a.47.1769527589206;
        Tue, 27 Jan 2026 07:26:29 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f744e2sm40967260f8f.31.2026.01.27.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:26:28 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: Add Eliza support
Date: Tue, 27 Jan 2026 17:26:16 +0200
Message-Id: <20260127-eliza-interconnect-v2-0-b238a8e04976@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjZeGkC/32NwQ6CMBBEf4Xs2ZJtCSqe/A/DAcpW1kCLLRCV8
 O8WvHuZ5CVvZhYI5JkCXJIFPM0c2NkI6pCAbit7J8FNZFCojihVJqjjTyXYjuS1s5b0KOpTZsw
 5V1mTFxCLgyfDr330Vv44TPUjqtvSZrQcRuff++ssN+/vwSwFCpRoDDYSURdXF0L6nKpOu75PY
 0C5rusXzlr1oc0AAAA=
X-Change-ID: 20260123-eliza-interconnect-b73ff8523d59
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EgqLcXuTlGZv2agsjvJlq+LOofnAqNhpL65qt3SuLak=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNkgNa/0D3eJGsl1tdMo8j5ZENDAM2/ohfFJb
 Q3u4HMTGK+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjZIAAKCRAbX0TJAJUV
 Vt8pEACJ1wNstEMFb9EZ8hWPGNm3OoroJ/a7pouLwqR7GPZQEGIaHgw6ZXrJkyjweHWlppqssEt
 Ql4Afc8DezPhYcvqUhS3RyewpUcknsEMCjmaL80ysDcZZzh7Y+gxvcvtRz/Xdn8iBxIucEyqCsN
 kcV9AvS7mNY+HP2gSI5TD/NcqjD6Sd2c+2SXQ5g5Ty3vsFTaX50MsHe52qEgoA/Kst+1CIteCJw
 V+XkUqaE3dsr4yXjTIdxLOXsx0LTNlq2/72iXyTvfs54hzY8j7/I9nWK6DdeQebWh42LqTNnd6u
 rpaVouCvq5bmCbDKH8Gh4ErrIv0k72JOnS9lX9l1RAyk7xabB2Uz276IFawZVXMUamr4qBszVGi
 JmH3a20bIzTa7KzoEkUqvPdS9uOPxzr1rrEEmoKPZHOfFuJXCJuGkuJuWC7VebVvWN+2j4QPH9U
 mR/EZEW4wJ+PrM/p12cCr8gK9MKaApIfhqZOlpl2bCddclUY7GZVmRGNq/NIr4XmpiDOKeL724M
 HUiHY0vmzzg5vxTK1hdlmp/bMzAHLp2qISgISgwbLq+5f0LwAP20Lk+FcNYScC2A13fabmTSI20
 MZ2bVg7LFQfOeXZwqWf79MzmH9BdV12U2si3fvQQlVN53ROx7wsaMXVm6IdOrpEA1LVmTQoRj3Y
 ia4UPSF1Nw/qzDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: U_DI65M_l0odBXDrqAvuPjsm6rdQYPKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNiBTYWx0ZWRfX+kMDaleim37V
 jyWnRtNIUZVUWuYvdObqBlNM0Rwtggt9IiT8yAyNM4M2XcNRyuYEpEdWsMKSW3rQd5+vRWDCzCA
 19PhyTb7oQzmPwCIHtvkS2+TZ+gNqVz86HUBNe2nMiVZ/8oEQ7prLk22+WSy7XL2jSSQMEJbj7D
 kSYBJrupMvDDZPZFq7RZHhP/Wg8TYfl2I5KtZkySSGYYO+itSRM4ra+dGz2sJdN0DAl7wVU/67F
 PxBjTF5kVqFnR745oWKry9oyFJGknJT42xQUlJp0tezrpKXoELczoSrHa6+d1Y9NuvWYY3Gwkic
 58pVcW4aQ59EpZ9kzUsNDT2mpHGKSlurisjuED9yJVoe68tVlbutprCmNi4Kb/m++YRjBA4EP+q
 fqtJL/mJEtv5iqiolHFEnvN92L5AJBkchO6xZY91HV78xtvj6fEElsrFNUlQzhqSr5DBIp+fQKw
 jdn5mt/B+K9+IkQ9Zlg==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978d927 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=uy7x88RTe6HEIydgH8AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: U_DI65M_l0odBXDrqAvuPjsm6rdQYPKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-90809-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28CFA96E95
X-Rspamd-Action: no action

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Picked up Dmitry's and Konrad's R-b tags
- Replaced the all-caps SoC name everywhere
- Dropped extra empty comment line, reported by Konrad.
- Link to v1: https://patch.msgid.link/20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com

---
Odelu Kukatla (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC
      interconnect: qcom: Add Eliza interconnect provider driver

 .../bindings/interconnect/qcom,eliza-rpmh.yaml     |  141 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/eliza.c                  | 1585 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  136 ++
 5 files changed, 1873 insertions(+)
---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260123-eliza-interconnect-b73ff8523d59

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


