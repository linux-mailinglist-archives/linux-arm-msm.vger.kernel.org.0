Return-Path: <linux-arm-msm+bounces-106743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JcAE5hW/mmupQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BED4FBF14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8772E30160EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6C130171A;
	Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+m5M1qT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDEgrnCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F423D283
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275987; cv=none; b=j7McEBkc+O2ooAE5YQaHDKIprjTy2eEQTzhLhz28t/VFTESPxec3zYbKoJznG4TH9o1l4wOnWgrAcNsK2AXMg5NNv0sI4+oXaBsoCMd4BTtZBf+u3jMdC/TcrRnsANqz41WlQ/ucvAEZHMXJ1LDFYCL0P3JAtQ6lnmllMw5/D5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275987; c=relaxed/simple;
	bh=pCIGMlA/nMC5ncud5vvgUb8fb4QYErXq3W2kk7NW0Mc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fdOD+i5S/j0g5+jxghNcXi7UU96vAxoNof/sPfnBWYkfj+x7tpadCbwsoiuQYeMgAmYeOlDUQrwjYOSv3zYahA52Uoqp0aGZYIB1XXTGhbswvM56xJycHA/aU85+YxBJ7gjUawcnZacz4bjOjyT/iR64PoVB07vA6iCorMkSx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+m5M1qT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDEgrnCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2wQT724365
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqG
	B0f+M3M8=; b=l+m5M1qT3cR4+K1Toao4eL7iI9DEAg9lzroeZrfiA/h73eCraqM
	brJj8tWcAEELVWLz1ebnhtCwPTFIJKp0W/qgzEqO6+pwtAD4mcqDfAk1Cb6CidS4
	lsTzmWXAHrZAjqdBArEbF6O5vT/bw2dVwYJTT47aRl5CCYfFuTSa1ac+at9uhDBU
	Jpdk5RO//cHez6i0diRYQEilIXlF/X9ZNgxnAoWgvDY6bjCMenIcZoqSmfV7OhGC
	HtC0+lCqBdxk7stGcPl7ELFqGL09QIZ0brCryBCDi9IqGNlXRilSb94+OH9OADh5
	sicbCXienX+rA0bFKaEp1+z2BzQhPGgmo5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0uh25b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:33:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so11136370eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275984; x=1778880784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=dDEgrnCNge7A9DuQRcuWygVd9Sn67Daqey3tedJfDhp/pABOmvIaJPjQ08RMDUdqIs
         x+wkFUUKjFtp5AABC+2Of4uFG0GcaZc2HuX39hmUfi+qRx3brCo4oI2FEWHDpkbT0QJh
         tSrg3SjRheUWCMBWPrgjFDQi/W8jZf5JrS2Uj9A6kvvKLTN+Yf0h6OjOVWm/bi1QVMxw
         9+iD8UAQ8qMJ07tFN+OoAiCCajGoIu0Qv9TO2DtC/wPvj2wdvamsSjMpwBuMUNXqtQZv
         bCgkZ0Qc6XFBbLxq7rf1wkTSBFPDIQEOVZUdfnDJ8+TSPQ2DPqtZRdxqZNVb5Vilnpu/
         URsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275984; x=1778880784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ishO0sGDv2e12plW9StdJroZu9Xzo2EbYqGB0f+M3M8=;
        b=Y8D2tv4up0D0wHHtR+uQK16QUINSP4tzo+zNYOqR7vKRrWi2dUMDGxg2pfDSchJpns
         Ily9svAXUGNUsrgU5h8hsnFBZjDEB6SrChkNetNMhPGsQWntOX1Y4ClXuBM23i44kgcq
         +F75uBd512w18NonufIH4dAsdK0RHeQ4ibmumyhSxo71LjDYl53fnbZuoqXYCrkrdJq7
         jhNK7kP8I6N4y17PQ7EdAitQEYK6a67XmewNvWCtE6MzyWLKlyipvwjnvBdgRIkTUnfk
         mO45mcoUrhWOh1vxQbWAiH+JrUMoQctshFLz/F2Tbv7lW7WWXhYo/ELs9EWGXZqq7N2D
         TtZg==
X-Forwarded-Encrypted: i=1; AFNElJ9nBY6EIVF4rlZIwmRT/WzDPh0y5tAhkTWKFHHElwLmjPOHTXQ8QNjiAB+G7T2SKPClnZ7bhLPVRuz4pn4n@vger.kernel.org
X-Gm-Message-State: AOJu0YyGge112qywbqtFRLskxy8rnW+uekU6nEV/IhYgo6IS99xly0e5
	GJ34OQYOQyn5zEJ7bOrNVP3ZFLR4zwtCMKZIdKtZEvwmr0bHMoHsVimP5wqTwXc6UQYikaIfmhs
	D+1TN+0Mx2EtIt/1tAq2YxfKl7rnlDUmV6S7bmtHXkH5P0KY4ciwSJL6h/NYSqCFAD0/Y
X-Gm-Gg: Acq92OGpCmpCjuFA9UR24Rn5PupmYkfOE+S8+LtoVVmLUY6DYjtHUbx7yNOdj8xz1Vz
	iNQT+nVzXuQwi/eKezw/xt5bylthaeGul0GHoLDJJQJAeF77icuOQcSaCse36TpMLmwmpe2uVfF
	vZT8eo3qvYmDSeCb3RlnMEEYEnCjRGCvF8ivkvScB2fgW3c6NPVUFkHm4rdb/CAo+zBOx60N587
	NAvTNB8W8DZaCrwaNP1nDC/1I3I4768SiybywL0B8WelvMWWup/0VsZZaI39QCyU5AYIsBgLS2C
	Hjz2x9+HR/HrtgKuoH+/R5z93pPsN7cW50seBLUVLuiUBebPE8MlQsAa5S446HUL4EA0m6Mugtv
	Ikh3gyW9ARopCoiv4oOQKR7lIN98ygs2s2vIfTN08JEneBlJlipozHT8iF3HVPkx0yXjsD773Cr
	g=
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815883eec.34.1778275983809;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2c97:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2f54be949a5mr7815852eec.34.1778275983281;
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri,  8 May 2026 14:32:30 -0700
Message-Id: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe5690 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MIQ_48QafD3qSJXuFwaZU98FzgwdYDcv
X-Proofpoint-GUID: MIQ_48QafD3qSJXuFwaZU98FzgwdYDcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX56mbAPwjWvis
 iNAAH4JqXUn4iTdZA04P3e4p8aynzKPMrCbXDq8TLY6UfTtQXNGiqVPJpwI7zAHXnY5BOpuTuBb
 k42/YqM5iYxf5XOBW7jHP+ukcFMPwnxM0Kp1ky8Oil5qWV/GiYy3MNCy6IUjqfoc5c7lc30Wr2M
 Man1sP9sBbipA0E5Msw9SMioeRDj1nu+TqrsmAO8OnyjoET/CTRBxF9jh6kkrayc+fzpAXnphmt
 opkETnAGIBakKCfZ7y7oAlLHV1Zs8ixz1g+CITz0uKp6tfrm8L8wCPVLbtFfsDMiv+PEP/ZYf/g
 XAssgUxwmaqA0mIjOmeBXctCsZlOLfysMnyLRfXib6P4NZsBqQPh5edO7Pf0nuIumL8gGGJuwH+
 cPKfc6Ar2OLhefBLhJ45HiY8hvr4702EB+JqHb60XRADVeb6m0t0vTq6ebVQRASy9ivEJSMSCmc
 V73a7UIScg8FOCHo/KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
X-Rspamd-Queue-Id: 93BED4FBF14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106743-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


