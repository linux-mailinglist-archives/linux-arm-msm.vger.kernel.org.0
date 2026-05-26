Return-Path: <linux-arm-msm+bounces-109916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHLnCXnqFWqXegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:46:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 215835DB83F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ADC03014262
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD3D42189F;
	Tue, 26 May 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE/Aph9O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJI4r0Om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E2D421A17
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821065; cv=none; b=lNr/pR6dLy4HPMUggMrazp5Q3nam7pzSZ/PGIpKLIKPhwBr4FG2wnSozseDXW2O0skPM7AsVKTO8LO8EAq9MHoMtt46ni1QNWpbErTNGONERGy5/aIl+pPH/IkMvCkVlMFD1fNDisenibR+qBiseaFqFU9m/h/fmHKSy351smN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821065; c=relaxed/simple;
	bh=cDOUl024n5VeIBFXLvzkD69n9tvvm5Q2LndfE/RBpbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KaUar4yWg+1AuUMEcO4Ynyp585G2i1s+25uSknzw4pzZY+xjpNVW+8GeI1VLIj2Jz/VN0WS+dAet6SScMtiNlaV2caGoPiaQAmT2gkFBrgdmlgow22xkGZAENr9vz2J1ZyQtXkjzMygv1PFODvkZhR9mHXYA2YzSBQiSLXF+gUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE/Aph9O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJI4r0Om; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dJR069504
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/HUkG1zS7sY
	fX9vzya4QfQZieHxpfZOiesSJzF31FrQ=; b=CE/Aph9OWMp3t8t7pSld6vr4s//
	1Jx6lA5RuKCv0zHByk1HAaJdD4E1FXy9C48R3KbGrmtWEEZKIJyEuM10mGaAUVYT
	gVvtbRypggdGK8Mc/aMcTJiFRVA33pZEaP3PaQn+m0RXTicnTNu2N2S0U8POOkaM
	oVeFj90gTiYTp1thvFw5LSUuL20GEWatmFRfFb8CUILhzWCaena2C2620HF0DJ6j
	Kq9OU9iaL1fVPvmaOBZN5W2+aSA+DinhQDnyP8SW0p8d6bFFO9gJQKfz4cu1UXhe
	rOo4Exr+hBEdNu0Ow2AcnRdjfEJh/HhIiO/D4LZliCaZE5Fzk47F5sggtVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhp9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3660e420c34so2956894a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821061; x=1780425861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HUkG1zS7sYfX9vzya4QfQZieHxpfZOiesSJzF31FrQ=;
        b=TJI4r0Om+eB/H9P9EI9vK3AxIObSj7/MUsISdaHr17j89LIcU5vpeyIzNPd4KMPoGk
         s3965ZLLI5H/vUFkng5Qq8eANKS17bC3EwEykCwHvIaN6QLKjhy+jwknfXqslUimmyuZ
         eDGOe+8+PGQleQMt6YXPec0TE3f5oh8ualn5WSzUb/WBJd4WY8Jc5LqTq04UJ27A9/FA
         9Uwc3llN7A167UifWbrDZBix/Orq0bChkgVEpBlxooYbKQPXD8wo9J4QjaG23yIGk0/c
         LNeWlTaVvbjXl//45MvouLAyhdHLTxol0uwqqcCPvzAaiCG9c3NW3SyVmLrskgg/O7nU
         gviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821061; x=1780425861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HUkG1zS7sYfX9vzya4QfQZieHxpfZOiesSJzF31FrQ=;
        b=J/JCg6Xg3PkjMEMm1NQfvlKKzT/OBQ8X8/yTl84aZTnsJiqh6eyAOthLIwGoZ8EICU
         vnYZJluiOgCzfHOha6kLfe1iUqgfHL+8HELtorffFPwWM8nDyvbYxXj/MqZSjZVLd8cF
         hmsi0fj76aPcoEmvv54RCi7VywsNZqQMCJ0ZXtDew3FUsP59FnhNoUzMS/k1ZVp46Lnk
         qPI7jTrgGGPoLwpoizh7tW0oZOk2BqiaxDB3M80MWOhvD0Gd8aeO7/4jaOQsPQENV+wP
         5WzCAePLImZB9m0iaG51PBrvn3mJLvILRc+VnlWAK7im3MNDZv2kLKmdGGb4hHMMtL7w
         awrQ==
X-Gm-Message-State: AOJu0Yx/WvL5yNG8var1MODO3K1AL4DJIyNvvshrEnI1fXcof4e/HQQK
	IhVWI/2ctuN1TjYtBwyEsXid91pnCVgGHYjaeiXUDvqGfabcKP4QpDZ+CWDdvlUvqZfGrxZXdSU
	hm+QK2eefhJDO3+qzPlI3hFtqmTJkmy2mK3eiEyZs2keZ3yWa3gzFweVoPjGcgY5s7II=
X-Gm-Gg: Acq92OGbpqpIybTBrVMwex6UlScj9yWl6I2MoH2koUkDVdNUgFL1V9/jXd5fac8NNzE
	d300CiML+MAMjBsIbrPP6SUJAOybDwAnH+TfsDWKMRUWTTyhVph/URjH2E1mWF0im0oeU/KqFMY
	vek4thE0VCmKUXwYUEH9GtTC2IyIowau1pmcgmyMfRn/YFkNysDXyZ9JncK1QXB7Gd8MqfNkFuf
	xeA7a02V0/1REAtuSPsCxWlWjSMFiBPZVSWVY1JcUw1vmIAkvt8MYdSPam3Q33rwr+Ei3yfD5Ev
	F4lvOu5OdVFN6tkDxKdJ1knTodeLyWwd/9aPuIAzQqzbPbq5oHr5r4eIr9F1lqiw371JZDC4s4j
	t+xgLkTIGK1NtpS0d4ul4+emZfVnkfFK7wkP+0WuVsrx4D2vBOTgIaQ==
X-Received: by 2002:a17:90b:3a08:b0:36a:5d43:2448 with SMTP id 98e67ed59e1d1-36a6741f979mr10705381a91.2.1779821061141;
        Tue, 26 May 2026 11:44:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:36a:5d43:2448 with SMTP id 98e67ed59e1d1-36a6741f979mr10705369a91.2.1779821060706;
        Tue, 26 May 2026 11:44:20 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:20 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Wed, 27 May 2026 00:13:58 +0530
Message-Id: <20260526184401.3959717-2-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 487dYkPrk2Cy9YLVtExu5CW7ZoK-82vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfXz9Qg9boTZvCc
 p+hzgToVxHMyKT8h4DFY7GxZHU270NpWWXbgrEyk/dfAlEfTnBOC9ItAs5qvoXc21gCG2Ii65hk
 UZxdYsv5wReakvziOyl3jdl+4Lg21lhLuelHfhcucWVxIrw1BO3FHobm23j037IenAiEf2CUZa3
 mORmGnH04SrcKvJBPLvVj0NMn7jGo13M7VjCbfe7EibE4aFRT3tdpCpeqlFtuVx9CmPWqLDQasB
 22kn6+XQ0bvz75vqNrlDx+y2ds0xOLKPfs7F8ZuNWDLQ4RXf737IHGgimoKWfIdSABPNsZFwjTh
 4ZkXmJQh/E20QDU61s2WPRx4lv/8AiFAgd7pVqWmPweMcdHgbu5ZjJuktcsHrwY3fgt0xi0iWv1
 utukCTdhnesNdMiYlKpDdczQS+BiUAKrCV9S2AE3wwtPJZKxqrG06ovbacZdBJnxDlF/UVlmseW
 ToVwZ3v80b1WywgN+ow==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15ea05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=H4VnsNtwn-kQcSS3XXwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 487dYkPrk2Cy9YLVtExu5CW7ZoK-82vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260164
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109916-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratham.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 215835DB83F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:
-- 
2.34.1


