Return-Path: <linux-arm-msm+bounces-104395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEyNKVgr62keJgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:35:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA445B8EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EFE4300398F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348A8351C05;
	Fri, 24 Apr 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHAxppWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxY6gDaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43E34889F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019732; cv=none; b=F2sdTPYviMIkCSMaxl8PLpZ0ysqwDs7ViNaZ/9qgVRdqC8rBo0LzZO9egK+yTsjGsvQhSlhxqMN9R9z9b6wG7jL+iwrQdy1nBEjDaQsdTqGDSuBtOH+w2FRREDSx5mYiZrVsY2/mlwYmuhfb7nhUg9UOr6IKu2/Xx0DKRksBK/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019732; c=relaxed/simple;
	bh=gWiGMmGQbBe18ffsU4L3hPUa0ko8xrTojxRmhL3FHzo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CHSlAtMar2BptPzwzNnql0f+2c8GNV0MEmH6NFGMZKSt6/n/R6Sj8OsQQ/C6o9ROYgzhrBzBbjskVTEnt3W6DZUocTpgRGYZasBTLQbh7Fj5yw8c8PPTp5CiJF8wHwJfak0b2+EIV5OubstHFiVAI1Acalz03F7k+BXskm6gnJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHAxppWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxY6gDaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8H7T62291550
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rNli9NxWLRttENa7rW5FZM
	vDeSsOpn5Sj86spOosc64=; b=OHAxppWOoDsuJS2xyl+p6bynmDH/9RYG/Ad0Mm
	ZDGgwwQQH3BKNF5DWH6fPst7MG9hA+M5pm2wJVFGaaCMphBHv1JRDA1dPEpntNha
	httLh0JlZQ2JGMqHE48hO/f7RYbzOGzvBvyZ0PdMK8VR/6dO7sy/U2WQLWf8LWgq
	YC8p85IfGacdYp0r+vhInERszvEFF9B94JdYyE/OTnHzJnEQFipNO2SoRH7pvFoP
	L7IkowHqPjQNcdfhyRcctQBwmevZk+x74XX3CWKldKBKyKgXOWyELcHotFhaB4tQ
	t3HTEsVz0u7aqo5okPDC+oQjvIbzPxu6FmWXWKEe/lnufwSg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbp9g5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so79994555ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019727; x=1777624527; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNli9NxWLRttENa7rW5FZMvDeSsOpn5Sj86spOosc64=;
        b=dxY6gDaWtCAzObXml9ex1inbOx6rbxEYdxmGVli1aR3YISXemzGJBoA9zOTBA4XAfi
         AEjCfAbBFSPwQreGAR0IW/iRgRci8dfjk2OYSdCVYOa0iFyUUfdlOtBVwUCR8tY20vmj
         P52ny926J5XPKlsF06WXg68IgtWp4aDe5KEZllvgnaMldzByY8TBQFU04A/RrT/ZuxB6
         U1gpSii8waY8NMfjF8IFiCiAkGF0tycCTQilBsOeO3eXMLvu0FhxYUNO2PyT5sgNmAqi
         Mvm7GKalQCgZmS7xoF+fEyamGO/w3wgcR7T6bGb6kqOEOssbDN7ZYjJihU9O65uvJh/+
         fkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019727; x=1777624527;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNli9NxWLRttENa7rW5FZMvDeSsOpn5Sj86spOosc64=;
        b=Pze21iEZvSgkEDc2HivR3DW3T9mQjhJPJrVdVkNmNb/G34ObYVPfzcCAHHsBJkKNqi
         0nQySaSd9yVZTwLLp0GBorEVp1sa799grnDMNlJ6gefRJiMDvi8EbJhZW3c42xf0V2qc
         DAR6INltJpch738WAvbRzQYzEcFIRU8qY2tSLev6MdoFhre/pic/J2ArdRDGPjZ1+GhJ
         xmJqxR45VgMIYg22i5WqmJvGAFP+5xdmfR7n7Vxwp3nw5DUUjE/Pjjhjw5GiCuZSWAXz
         aZ3mXipWfDvcnvvYXSyDeN4774fiBnUGDejf8H5pgJ43EUVZrNzF2n2z0kH2rs9fvmO0
         ve2g==
X-Forwarded-Encrypted: i=1; AFNElJ/fb3eGBQ10RFPL2yvlvVdsiYTdQwacA1e1EncRk42WYbRJkiMJl0z54qNHWPaa3we0pNOLQ5UYSE0wqlfD@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9AmAR0zB8YL4f3LV5Rs6fqsy6qn48w0OCmdD73EVnjAKAoah
	fDcYjjI55iE7RVcAaufI1lZbHQNq8j5HgL3l+7c2+LM8+ItVBR3rEID6oH4gcjlhMVLCb1b7ACH
	guN8bNkHIvN8QbQt2k8QaKCC00qkb66i0XK3FIrAkTcC667tM0QazGrRY/lz7p9zRwqW8
X-Gm-Gg: AeBDievsf9mhHhwmIpBLyvRE8kL4noNWS/vsVxK0O6wo3vqhl7A9lFBoBfa7/P3vA57
	q3kFTvFlvGkrWpfyhz+zLTFb0aiLYE/cq9vFI7SgqAn54xV7stwuVF/ESFnk8wFW7dbZEWQTYS3
	pruSlnWdEB+5R8K3RFgbFZ/lHA4iZHqoPGB8WojLpq8JdINdNw4SPRe7CoSGEVrzqmNF3ZxD37l
	FbfEwhHsmuXzhMxkqNhnGVsbHw5dc4+51OdY6/WYtiVPbD0mR4HdqzwlhH1X8bs4dNvBWs/lwGy
	8NVviq0zcGrHWwBJRXtcqr4oi7ibjzyFLCdVGObUU4niuoT2NufSNemXsVr7+XErGFJ6jfYBLtE
	a5WsK05MDKX09Umce7Ve8WE6l2uRqn/Cqt94fvLNOzFIWR32XyFkWQjX0MA==
X-Received: by 2002:a17:902:8603:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b5f9f9469cmr247750515ad.28.1777019727257;
        Fri, 24 Apr 2026 01:35:27 -0700 (PDT)
X-Received: by 2002:a17:902:8603:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b5f9f9469cmr247750295ad.28.1777019726761;
        Fri, 24 Apr 2026 01:35:26 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm211389495ad.72.2026.04.24.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:35:26 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add TRNG support for Glymur SoC
Date: Fri, 24 Apr 2026 14:05:06 +0530
Message-Id: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADor62kC/4WNQQ6DIBREr2L+uhhQJG1XvUdjDOBXSQRaUFJjv
 HupF+hmkjfJvNkhYjAY4V7sEDCZaLzLUF0K0JN0IxLTZ4aKVoJyJsg4b3YN3RLc2KGTakaLbiE
 1a9hVidugtIQ8fgUczOcUP9vMk4mLD9v5k9iv/atMjFAiqFR66HnDaf3wMZbvVc7aW1vmgPY4j
 i+f+TyEwwAAAA==
X-Change-ID: 20260416-glymur_trng_enablement-31518b69fbca
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777019721; l=865;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=gWiGMmGQbBe18ffsU4L3hPUa0ko8xrTojxRmhL3FHzo=;
 b=swVv+9inHaLQJijV73JP/+R3A1MqHF5qjmMhiKnp+YAEkkMKbnHwXmUBESvlk1LR/16Bq5Px1
 m5cPKfvCbtZAn4ger+a8c7mC7GMVTDLJV+CWPuzD8OyAQMpVor/wQ0F
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: M8DEf0WPCpkdCKbDuayjF-USYBYfg3kQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3OSBTYWx0ZWRfXwf6FIpqz+NM0
 tNBXByYDcMY82QAblqenUjSXbq4kja60EUoxBcZ8mzNOq42iq4mwhell7b+QJC34m/hGz+AYtWq
 VrqozcN6nxHf6HZ0cscMKEZabW0asHOgtZBVUvm9oemPR0wJR7p5x8+h53SSMeXHtKcsPcyY+0I
 oabPYdDDpu8vCMo3+DzHyfRFOpzkBpbSjsxF3v5inFNfUV5pbDj1W0trFy7AsDCZnaUylj9uZP2
 VFdnG/TTyPL98KVyd5yENC6ufjVxoT+OOJ75+5uY+CuiN2jaRwJr7cYbF58JuFIjASrTAsPoOnw
 tDTyVwQPupYVrUt07hIJLHiumgbLKgXFAfqNjL9OS+P6z2zZsGpzfpebjRCvcncLGV7Tjtbkd3I
 7T0Xls6FJEi3Vz5uMl43ZgvFopz93u5HyOQ5lj5YZZnF3y+VQ5M9ZoTXstg6DOm1PWtw4msYthi
 In9RerJtSziRyVFGZbA==
X-Proofpoint-ORIG-GUID: M8DEf0WPCpkdCKbDuayjF-USYBYfg3kQ
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb2b4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kES01Y3mVqZ45jXFSuIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240079
X-Rspamd-Queue-Id: 37CA445B8EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104395-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document and add the device-tree node to enable TRNG for Glymur SoC.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Padded the address part to 8 hex digits with leading zeroes.
- Collected Reviewed-by tags from Konrad and Krzysztof.
- Link to v1: https://lore.kernel.org/r/20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com

---
Harshal Dev (2):
      dt-bindings: crypto: qcom,prng: Document Glymur TRNG
      arm64: dts: qcom: glymur: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_trng_enablement-31518b69fbca

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


