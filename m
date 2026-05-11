Return-Path: <linux-arm-msm+bounces-107007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO84H+1WAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:23:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C6516C49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F004F3025F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F3C38330F;
	Mon, 11 May 2026 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evefXYKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wub0sVXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918D383302
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538218; cv=none; b=mFA+L9gNeJgmJmVHnwKbjPaL7VoCczHvm5nSZIecZqiMZl1vvJuhH5x8LTnApokou+rhlwH+PX4IwhQlBrimdQGQgPe5RZom5lZs0didEYQHtdraPJwaegqLqW1YLVjwBC/jBIZp1jQq7efPnFDWIU6ShDGIJ5+cDtSTjYbA8nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538218; c=relaxed/simple;
	bh=oZ+yt/RXidFRbw7KkVC6QwWQB7cStOb9OIQ+8ARPiNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UXy87cYkmUnPpdKpfb03bd0XOIJ57pgPny1UsaRv6eXS4nU+2Qbckuv0omH1/6nCXuBdsUTQBwkm1cmHI18G6aGFbP3L6YS3Ew8XTUqpjrG4rUvbHMlf6pQFvdW+KxzJScrJDj31oWU+U1dPYnAFXduD8hTqlBe6j63+EqCPW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evefXYKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wub0sVXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6rEI3385188
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vmbVJwi4WaTGTVT0i5299u
	LCIqKpaUV1SdNvk7Z+siM=; b=evefXYKDR58EE9T3OunshXF5Ag+pvmQjvcM4kQ
	/C2aQdBk4x4t4yp0Y9EvNxSWgefhejdByw0vrsLyZHHW31twNC1yTVo2FNmJI+3T
	1n0zWuAhS0srW0llm+bufiJpv3YLW+NZJtyUl5lc+Y4GOm/4zPTTfe25RtmJCLyg
	Oie6jsmKMjWuCLoiZ2GhbDJE7sU83vxxDb9YM+q/2aBCkpFIDAyZEc1Ei2m5SamM
	S6yHKLWU0r+KVpWWOFYwZoAvCbe1jbpJ+60mdXuIXcIS/GpzVcGBYuFc8hrUnZ/c
	eWFnkEyDH5hbBE1fnwcI8LWMTqEKXbUZq/Ty24gV5U/JUUSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4gevj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8375e2df478so2428783b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538215; x=1779143015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=Wub0sVXJ5FTBMY1l4VIbLCye/3mrYou8GUuw38yW8cP9k9UhnDZBbuwHp+i15jGb9B
         9WVMG7GkM0simgskSVZC4QC96IniX0F138cCF0QyHMRE7fh771/yr/i6zVPFhEVuRkLB
         F92DadhFwmuWQuitmpY9AKGDhYzQjq8t+1cm1abwMPHONF3kcusSFM3gseDvoNvejNCL
         EPVmjdPRdg4qKGB7NDMOeg6WtSYF3A29PuF7IZVsDv32ENapuFnZoA9+oi+490C9Lp+M
         uIyaczQQqT8wReplkC769ROpRYq0RClsWroPFAufdSxvW37j0sPtTfouaCX9ib+EfCeF
         P6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538215; x=1779143015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=YxVDV7uiFKVYobx1vY2niFJv9cqK8UFAzzFs+9a1aAk72xzcs4n5qx+xz4PTNna4BF
         qaaeZ9qOVNtijCqw02DZ0LgqKNtPQmXDRkVoU032k+eqX3otFdLX5Ya/Ph/ivoHN/LTh
         YtKpF7SVKW2ehBvGg/A5x3he7ho0trg4RAYYNi+NlbwU2T5XnYW3RJoFN4uTAm4L3Y8P
         oyXksQ7AdmNYSfiZ9Ab0TKltkOffz1UzTFmwbT6yQNhoJH8Hxt2Bs3En3XXj8fgyVNnT
         bcd7Ji3CO8KsRRAQQqSxgwn+eaZKtLeOANjDh7xn7ijpu06GsRxAVrG4b2nPafJpbZHx
         eYXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9K870DT0uVI+H2YYkt3hS/w3Ks6NS32IzaVl6opVYTAUOYSrWssrG9Do9msHWt0ordaXsmtyFNMRe67d7K@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeDQlqMbtngjj73g6MTbISwt7W7Wt8rsTisiXMGdX6rKDsDyv
	dwXwg3GTvNfCswN/J3x15kWSWEN/ZMHa9dlXeqm2KiztVKbpGU+xsZCuDW3W1TTVMzZCJFPlfLY
	TQJ5jHMj2F+XGD/AdEQKbq1mrdT4TYcZbPOySMyWzx/6qZq2jj0f5j9g6svpA6NhzxA2d
X-Gm-Gg: Acq92OGcUU8MalxggDSQjy8hGk7k7LhCuxsAa2QzdoMncCD9Vj4WvojMSZukl9ThSiC
	Aq0Ggz2oqMGEuYsIod+ESkjOEsRaM44jEDWJsxPo8QS3I9FGm30e3RLg4bRkbgqUaEYi5o9phQs
	akomWD3Q+IH6mWLlAnkwWEWsEs6b5tl/tIEHm/cyIltN6BacsYtfwhATMxKFfgC8iPJZPEljwsM
	CUe1klDyPCE1hVqBYFx/EtwYK/C7YES9AB1i2O/w3PG4nA+qP85FwhsmZ0jEnYFQmqeEOi+EfF/
	h8iizxtU5tAAVp8TREeiSoZc/obRoE3gKrj5B0VIEjUqpaNjXOII5uePUpvN1tDeBa9UdX4HAij
	c5Ac1ZBgMqKmZBop2VyV3b90UESXCH/Cl41T04W69cg+b7A==
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287566b3a.28.1778538214336;
        Mon, 11 May 2026 15:23:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287547b3a.28.1778538213840;
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Devicetree support for Kaanapali GPU
Date: Tue, 12 May 2026 03:53:14 +0530
Message-Id: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJWAmoC/22OywrCMBBFf6Vk7ZRkkj4sIv6HuIjpWIN9mbSlU
 vx3Y4s7NwNn4J57F+bJWfKsiBbmaLLedm0AsYuYueu2IrBlYIYcU64EwkPrVkPVj1AOsE9znXE
 hlUFkIdI7utl51Z0vGzt6jsE6bE921Z7AdE1jhyJqaR5gNSc8/+Yb8l6vnUV02Coxg+o2g6kfs
 KphQuCQ7TNK1FWWKlWnzvv4Oer6q43DOf5XJWF9Vb+a0f3mTxIE5AollgaF4fKP6vJ+fwDNRLh
 fJQEAAA==
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2499;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oZ+yt/RXidFRbw7KkVC6QwWQB7cStOb9OIQ+8ARPiNA=;
 b=z4wkKaTXNXkeDYdY4GxGX/+MroUPOcH6t63HZ1+4kb1hAZt+BGI/ky1jTgoA18Fcdd3BMaoDx
 M+k9TYb3CyQCVJ+t9jflHnoB2osAaht0heuWefIRDO4XXuijct4UNzY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a0256e7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX44t75SMOaVJG
 3mO1orG2r6GCBlWulN+U0J26mc0Ae6uIoXHKWuq4OTpgrOzwfseMQA5616PPvg0Qi2e1DWuDL8M
 fgQ0BIXJ+BkNps19xueTN3YnVcOmOLmD4tdhAjsCpAPcBW9866ScIcxJaSMow4IVhChQ/38nZpL
 /aPrBlk5KcWjGgu1iS5QklZxIStYws7BilK5pO7Moh2WEKTN6QvAe9vnVIP30dm7XuZtaGLZxbU
 oubS5KGGCKVigLFAkRmWkB4kQV8HsO3Uv/TbNhn4h2MlJxnImaL38REbaxwCShw3ZX0kQj8F8w7
 oD1AqFCWPKM5UtbNqZutDiOsq9hGFgLMyc9w1IuvBFyQodMmtGCE5qx9fypXycqKvqaDJr/M95A
 tlokPfqeEElq73/mKX1K4lmiUGY5c3IwMxaWviiiq1Zk1Cyc2mH2O5kgLdMOVVjcz2axvKW7XUW
 idEVCzLRglO60tN/4bA==
X-Proofpoint-ORIG-GUID: u7xdmdRq-N8C6kDIP60AyObmp-f9uBbQ
X-Proofpoint-GUID: u7xdmdRq-N8C6kDIP60AyObmp-f9uBbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-Rspamd-Queue-Id: F36C6516C49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107007-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (5):
      dt-bindings: arm-smmu: Update the description for Kaanapali GPU SMMU
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add qfprom node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 450 +++++++++++++++++++--
 5 files changed, 441 insertions(+), 31 deletions(-)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260412-kaana-gpu-dt-968a70134c22
prerequisite-message-id: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
prerequisite-patch-id: 82e142b3d904e746db0e288fb7ea6812661c3537
prerequisite-patch-id: d141a83ef741d26b03d931cf120b8b541ec51b9c
prerequisite-patch-id: 5bdaf78fd75be779d4aa73b85a185a10d8458366
prerequisite-patch-id: 0263b47f4e1aeb61fc96c6dbd9f7168ffe0eb04e
prerequisite-patch-id: bed1e449dca0167ed99e8c4f1e544ed60ae17014
prerequisite-patch-id: feda87721f22e443f38165787b2b28fe1a40aa18
prerequisite-message-id: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
prerequisite-patch-id: 9175e9ae77ac032c2f0502e2c63bb7b7d1ae4ead
prerequisite-patch-id: a29ab9cea24f74a76a69f144f76f9860e014ad19
prerequisite-patch-id: 6243ab821a3d9cd641a8dca8cdab167fe9da8735
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


