Return-Path: <linux-arm-msm+bounces-90814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHaqKD/peGmHtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:35:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D171097D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02612305A934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287C435D5F3;
	Tue, 27 Jan 2026 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/YzeqHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpjoKS1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB2301474
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528869; cv=none; b=mN5tFyMn6vXglp7i3m0pid0sbOqaxkRlOGqQ3Nni6Ua9dW+d/qEL6ad7UOtn2yfAm+nwiIJ2LSr7eOcKoo3/u50MQLlEs1zZv31lsGJPkntR2fZQLmCS5jLep+uk051/sY3Xl1QcZ9sMBh/28G0QLcUfpBSCWP3RlhjiOg4h9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528869; c=relaxed/simple;
	bh=dR8YbjjwEoWOvKr5L8OE5Xjpb1N4LIlErSO/VsIaOOQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j3ahj85LKgRtuR+cxmR3h3Mcfi4rmFblRMDYuDtWIUb/RrmzkQmLA+I9Aw4DVkRi9JCdtwFoQ2MRnruRo56tEM0QgvscVvppM/Ms15kSD1L+ngmY0Iq8x+Z7+Fwkpdy4gXUvJz/lF8nzIaNhrqsFRsR1ihn9FF6RwT6lCqUtMfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/YzeqHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpjoKS1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9qZXd171364
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=892eAZJONFiYYejolA0Vyg
	1MNw8Nm8mdoY2IhQYM534=; b=U/YzeqHXksaxYujjAmcaTKDD648n83el60HxeE
	nH3s9L26R6H1ezsYB8adG2GPU/Rd9tNh7DUUyf/lVmaOC3dC9FvEODSIA3r3QDi1
	AzjO7ntUdr8ysiw1Vb8EeHcQsUeZW9Wty2WsubwPvS/mc2YmwDcLF3Y2BC/agw5M
	o3G0P+ajGVazGGm/44y8uv1x/pbjq5sZ1S3VV7cqGmvFzmYu1jr3QbWL3fi6jutU
	rzH2BtydVAHfhiZujXIv1+QAgkn8A9Dvk1ac4XokH//QpSEg/mnt8P2b77LAIoSR
	KnruWxXQUU9Jc7e8R+cyMPtcotBblgij0YhNQRKVYG+Eux0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3e7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:47:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a87029b6so1848122985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769528864; x=1770133664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=892eAZJONFiYYejolA0Vyg1MNw8Nm8mdoY2IhQYM534=;
        b=FpjoKS1FdB//GWRpby6hblT39HvENK/iK9DtLRqBJDFkUCzqtpGzhuRHAbRz8NFq1t
         L8nTsGcavXTg3xxGcByxJa0jhQrux0lMzllNnzNL+7Bb5f2TVnsKM9j5Wfs6EJl0KVY9
         IbWilpOk9bl8G8PRYKLPrPJ08OlXV2jPubD2XV2Lb0Zy/i1MwmxxUJXLM5GP5V1x9aim
         FbJfEAMlBC0QZ6hRKE52jgHNS63FrQZBqaG7G0cDBYSsdGAK6kvGmTOURQ7GZbxIkJ7f
         LGczCa0Hb3GqG/HxTtVEMHVY5Vvyo9NvqrSs+wjlVyjrOt7vhV7DXbY9LS2kJqZbKj0N
         C3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528864; x=1770133664;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=892eAZJONFiYYejolA0Vyg1MNw8Nm8mdoY2IhQYM534=;
        b=k/c+4F9ERPlnjf8J2kTHM+Q5tj1qyWJC0W9buPhHEjb+UR6S91UruqmNRJMWfEgetR
         3RlkKijJ61xOciTLi8SVAtUkAf5k1hBom6jZlX9oxntI1kNWhmKgLrSIk3EodU22PVRN
         jwSJNUDgviZKk1ktUocTCmPlPG/3qRzPS5P7gXJC5nwuAE2Aad4s8GyUMup9IuIKGYPr
         J5jQmhACPMGYUbG98g60LzCUnY8OF2iwTig8o7xcey7lZjBDb86icbalzrxBQaEs5d1Q
         9gi35HGMWb9v8NTrQXxxPbgAEsJRpRbvZtOau/uihhtFPpN9LEbf0eLuRwog/xDjaSIR
         F2Tw==
X-Gm-Message-State: AOJu0YyIltKlVw0HNT6bHa8SOBbX/kDuijcb1btppWb0YTTN8G3VXRFl
	ibx+dkDQSJCddTQTRhBOxO+yDpS4eGOzneRh/XkWM4j2AQ3b5hEJkpAtgvxBiinZWQhKuFZwUDp
	Lope2p3Ng8SAgrxSJpZIQEArSlE3wNClmuC3NP0aqsOruMMiYLWGvn05Zy7fanhNQkkTcluFkzf
	6O
X-Gm-Gg: AZuq6aJhqjFTu0r+qMRyomvZ5yA4osmUDPXPXh7v3s/k3nGCOxLRN0acHZV5tbVi5Jr
	PQRA1cwMxt8vbfhHMBaVz/+iMk4IJlQVRn9Vc9y3+F3MYbR9JZFykA7ZMIQvQk3rOLjgBUrlUPM
	gJVptMtUXIH6vOSy/XQemUBVhFJ/meRPR3yf7G9qlQxtYPrwsweVPU348v1Pz4G5siNw6J47mPf
	eYh9FdYyv6aCWNP2fGH7XoIozJ9L9CnYow8uJDhN4rEvu+hN6+F2E91djaKVl8a6wH+Zq3OHheS
	NMZY3+URwWeDv4v+3jbwF502cJ/L2qnXsWlR2/xixP3Byz/9FoHho9IzK5I2zE1tkvy1/UVansv
	c2bgJtMcTAv7JIZheFw==
X-Received: by 2002:a05:620a:7017:b0:8c6:ab8b:29cf with SMTP id af79cd13be357-8c70b84a56amr274080485a.17.1769528864407;
        Tue, 27 Jan 2026 07:47:44 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:ab8b:29cf with SMTP id af79cd13be357-8c70b84a56amr274076785a.17.1769528863816;
        Tue, 27 Jan 2026 07:47:43 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm38096465f8f.11.2026.01.27.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:47:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Date: Tue, 27 Jan 2026 17:47:35 +0200
Message-Id: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfeeGkC/3WNyw6CMBREf4XctSVtSfGx8j8Mi7Zc5Bqg2AJRS
 f/dgms3k5xk5swKAT1hgEu2gseFArkhgTxkYFs93JFRnRgklyUXkjPs6KPZSIOdfMeOxqiz1HV
 ZNALSZvTY0Gv33aofh9k80E6bZGu0FCbn3/vhIrbeP/ciGGemELZoTkqrWl1dCPlz1p11fZ+ng
 CrG+AWeLrj9wwAAAA==
X-Change-ID: 20260120-eliza-pinctrl-7bb592ad63f1
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dR8YbjjwEoWOvKr5L8OE5Xjpb1N4LIlErSO/VsIaOOQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeN4auRagjHlRQXVqP7wN8ADtBYsGvj2nlWdS8
 Zdk6h1ctf6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjeGgAKCRAbX0TJAJUV
 VufWD/9BHSK6ASis9TJXJxcPnbv328jxPqdmadYGirLRf3FBLTXtT9iVzoJr/Wfofjz3bV6XY6t
 BHyIDUWTpY67SvPdxI1viGIrChr/wJ7txUSERyNWrekkadCArTzkyyDwZacaBcXwXOSaGCkCCHB
 GHZ9MkMY0Wty/eXLMBz9XelsVi4t5sPZJs20mR10dQg5clFgbEu7rNAT8+Lu0IulGUqH8+Y2GDD
 M8AgTPmpFUWYNqGTFjcQnIxwf4aW5yOKDgX3m2tmrRtT61AImEYfhtTgK99BbmMBC7lS8XFzw1X
 ckUaGnzxwnOpbsvQVzjjeRRy4o66w1UdyDnmlbKOtlL25HONyyPfZh9F4SlOVxeF9vrtAE6R29R
 JKkM9do4/EebTqklQ7vKE1aFbBq+j+IeqpIvdFKOZ9sKrXhofYxssk3OQgN1H9Ue2+uK+s0/ysW
 qZXr7gYz0MPPoPVHL21mUzP2cGtg0F2bvWGIDVdy/eH3/cCCdOGGMQNv8KIethhDDVx596lzYKU
 qZ+4fwZQK3h/z/6HCLEZ+PjEDj0Gnxx67dmZq/8qMOvzSqwnwpImp2/WmA1n20WOGiWsgCX4ZcX
 m1pOQj5WhPD3hGfozqHf4rY801P6OtUQsarmMwa0lss/2TOZApliD9yhfa/BDlDviLakWvDwkZs
 P7c1asPsrxZxCYw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOSBTYWx0ZWRfX4M+LRh25EgYL
 Oy3FTNdorYYcFGgXMgOT+PaRKm/afp3Kf0Ivj8zC+R1KScFjO7wZBRkRsRcBsB2oWFo8ZxDAiQ4
 SCeQuKFsGDd+1JjcXjPYnd702jYyh0A8YeL3P/asYV88IT5aqtl2qShONhXq/CNPUK2YDK4MuDc
 2RTfYy3rroTFq9Z9QvR5a+qyU3/BA2kLU0zAd+E1pR0R8h2R8eSSS1Dl71ua64RWh7NCXnAzkfP
 xaJpv6806wap4K1bMH0blA9fgpRueWpASArP8plIJl0/v1mtheazvDad1R9qvbq18ipdndmm2Fz
 Q66lP306NzaKioCRYr9o08uW1+iwMGphXe0zhocTFazl1dewhmwnGOaO5X32de9oGuWdneblnb/
 9Obwc3GP7wnJjD8CNURqinB9Q/93ndbAoXy4lkYxxf2NibOgTd9q28QX/7cvEnhqrXBUps58h9e
 2bVVVis4RTDuzt67UUQ==
X-Proofpoint-ORIG-GUID: HJ_W1zasGkKQKs_h20WQLugULMoUJmWG
X-Proofpoint-GUID: HJ_W1zasGkKQKs_h20WQLugULMoUJmWG
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978de22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=kyDXY30zTszPq_QCVXoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-90814-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D171097D36
X-Rspamd-Action: no action

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as built-in.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260126.
- Fixed the gpio related properties in the schema, as reported by Bjorn.
- Fixed the SoC name in the module description in the driver.
- Dropped the defconfig change patch. Will send one later that includes
  all basic provides.
- Link to v1: https://patch.msgid.link/20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
 4 files changed, 1697 insertions(+)
---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260120-eliza-pinctrl-7bb592ad63f1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


