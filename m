Return-Path: <linux-arm-msm+bounces-78492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A621BFFFCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8C63ACE0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397C73019C0;
	Thu, 23 Oct 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NacakziX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8030171C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209090; cv=none; b=rtH41CaLSrQOtY/+FbVQ24LijJQS+7w7INuWJa+gaX9JwudKtBpi0L1yPS7RtPqHXDvlu8Jzesa03MDl2khQgTyQl6U0zfC6J4hn7ERXDc1bR4fUwCV4UzJTpxEHxVPd8Xjh9EHUBEar4qysWJj6E+svQcUqIwVnFJdGfgTBI18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209090; c=relaxed/simple;
	bh=TzxMEAEvBvay0xnUwiJ4rg2i0h0+YPV0RGQEHFd6Xsw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B0y1kgo2v1p35Cq2zfm1FMMNSottAyIYPcX5YzFVzANZKWB+I+nOAE+UOTuRopNXrJhjU98FebCChh2yPJRpsCSYqzL5oAxU44MogO+XEGjZbeJINdeZKNRdBwhp0SkcH2YWtRaoYQaSQzB+8qjzMutX3BogIHMR3IHC3qDENKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NacakziX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vhLL029699
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eAilDezzajor08e+n9AuRt
	0YHOook8LfrgI0jRV38Qc=; b=NacakziX6eeQ/vHN2PjYgKzwr7Dfv0bBDI2Sqj
	yN5f3mKZdDRmf2FWbQzPCAKsKTRE8ZCqWoXtIuwBrRpfJNIhhH7kVz71wlTFO7MR
	gfGDmt+rTYBhhEAMW/tI/TEBrlo7tekb3f/QDGCWOfHUID9WMKuMm9RFheKx8nbL
	KmryD+bB29247LS5m0f1uagsp1Z3MLc/jqliCN8U3b2d2HJ1s17BhnxqAdbMuJeB
	AdUOcz9+c6+a2EUtA4Orm+7/ZyYKCG08sgvJorJg/dbRszd0c6Byuuo008+J+0jo
	yUmZokCWG/U1Aqrr9FhhO5QAAyr291fbPBJA2UEU1rwTHrqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge7ncv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so645234a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209086; x=1761813886;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAilDezzajor08e+n9AuRt0YHOook8LfrgI0jRV38Qc=;
        b=vNQquhohjF9F9qzCl4KBW5zpgpYPdd5mw6dMqhcfxBlCzRZbN4yHevyS67nCQOrV0s
         Fy8jLkGwx6hJCiWFCeTEgZBWaiYTYmz9UEGI/Mzk7iKz8m1ItQ4F4Bwt/VP6235Iv8+c
         PC8oB9gdbLKwKS5Q2JTsJa5lgeW4L1zsMjxTpydNYT2rb5H9bYEesgCG//6Td59IK19z
         dW4bMB1Rj/9iMHg5l2DE2PHcEwj6L3dXoXKpRPhYhiGhRck+jSbnp44G1709rcufXE12
         73OOt1LC/lw1nRBO5DA6486IVI5Zmq6wcNdBkoTdIbLubClwdCu1vAXgNtyHBZWEocdJ
         8Hzg==
X-Forwarded-Encrypted: i=1; AJvYcCWxBig+qMh436GyRsb1kOjxyBB6wW4W+JItM6pi+DqysNP5RqxjFLdwRj7fPADAfM3rGw0S//dF1INZLS/8@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPO1ygWolb/mnZ2Agw7SLFMraoZAZlRFUYAsiepV3YkhZ3emD
	gvcHWb2tyYESJk0sUXc7EzKJAj9zhG7BThVJrW0HyZaJNR0VF0wUccLPTcZhQq8I94ojOdlqGi0
	UgA5a9WUVZ0XSwWRmy4XGEkeEzy8IUIKrpuiRtS2Ut7zL1Sq5SbCHhyF+raqmvgYUQUXN
X-Gm-Gg: ASbGncucGWq4PNRTR7h7XUPF6k07XfVzosZ5uGwI0jPjqi8R7jKzKnXzlpl7YHGj0o8
	VFNr/613hPTQT2nLhDbQvTuYLUTbPRCOINHA6o5V1RZTNVUDrzaEFUgIb5+WVxwVNGbrU2W3ZdT
	jmgQ/4nUIwxJxkskyP16MNFmlS36D+VbbS/sAqr6NxqBmZbGZHPtJuaxcn7XWY33iKIBCyDlpFm
	pag787Tzd+xGXKjcBsNaC0zx45ELXW+k3FTL+gzFbTPZ8FOT3qr0TovIua7AvU5YpeTfFD+S9nA
	qfsLE1kLrWF17XAWFE6b2fFFhwWGGG3oYg3sXEnsbGSGGaeC2sOUDh6DhDZ7WzTfvGx52J3juYu
	KMHNKzKHmuyAAXA7aDaVYZ7xaYLSPcZ0W6Q==
X-Received: by 2002:a17:90b:1e08:b0:32e:f1c:e778 with SMTP id 98e67ed59e1d1-33fafb9755cmr2113285a91.3.1761209085821;
        Thu, 23 Oct 2025 01:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhmMIxVjdwZwB+RL6W4zlRgSWTS+YxPr19/elZcrqqzsvZ7foLK82FOM3+gPdgpiajIHnRSw==
X-Received: by 2002:a17:90b:1e08:b0:32e:f1c:e778 with SMTP id 98e67ed59e1d1-33fafb9755cmr2113253a91.3.1761209085336;
        Thu, 23 Oct 2025 01:44:45 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c056fbsm1391414a12.17.2025.10.23.01.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:44:44 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add rpmh regulator support for Kaanapali
Date: Thu, 23 Oct 2025 14:14:35 +0530
Message-Id: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTq+WgC/2WO3WrDMAxGXyX4eir+SZu4jLH3KGV4sZyYxUkqN
 6Gl9N2nJRcb7EbwCemc7yEyUsQsjsVDEC4xx3HgoF8K0XRuaBGi5yy01HsltYEpUWX2/oOwnXt
 3HQmC18GFSh+UCYL/JsIQbyvzdObcxcxn91WxqJ/tSpNWl/A1TPBLWhRI8LbxaJ2tXVm+jznvL
 rPrmzGlHQ9xfm4GwsvMZa+bRiTM2a1lj8XrRlc1tP09zQQ0pe6PxVNckGWGZaouG2kPVf2J5p/
 sjW3Pb0ytMOkiAQAA
X-Change-ID: 20251023-pmr735d_regulator-fd2faf72613f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        jingyi.wang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761209080; l=1248;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=TzxMEAEvBvay0xnUwiJ4rg2i0h0+YPV0RGQEHFd6Xsw=;
 b=FMd18hiG+bzBkvhzRSFZlZ2mE3mYIpBjvVp3VRQdFwP4wrEovlSF7XYCV4RF5wR9KwBHbUjMJ
 7gqqS8lCcRTD5k97sRZbXs55k8+QKekmE7d+8cLUjyHZ00tbXnwHbiA
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX2NHjBUZChWzc
 nh5y805lAXoK4v6JyEXWKCEmy6WeqacqGv9Z/B6o4iAemcLOKk//H+WNODk6Wf7KGz4mHha0rpi
 JILcpRIBAuzF1x26xk9IDfGV3iDC5tdQY7HE6KuAZ282IxAroU6y2YtPKcXA3qLShk+hv5FSqb5
 Y33UB5KSKXNgWt9deMOUPiHF/Wc0/eagtkH6bseEa+JGmJ93gHQi4DgVuEPDXhcceD1GOn6RIEZ
 QTBMS7rLyFKFct3r43K9nfzk4Az0XMjYfsp5DBwqbMkZD5tb3g+yh9sf20bV74BhffuBnWizkLB
 HoRytjXbKJxDnVjYOMa5gFxLwofu4Mg9nGciZ1USHUd3zABfGCcOHgQNnGnVkALpHeYn0j/S2Xv
 0UQK9Tt959WJVgwdRzuJu++GimuPhg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f9eaff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qzm-_OucbfTBZaCAGHUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Q5SzwueJMI2zNfD_8Yh89NNCaZMn6l8k
X-Proofpoint-ORIG-GUID: Q5SzwueJMI2zNfD_8Yh89NNCaZMn6l8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

Add rpmh regulator support for Kaanapali by adding PMR735D RPMh
regulators.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Rebased series and updated dependencies to fix merge conflict in v1.
- Link to v1: https://lore.kernel.org/r/20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com

---
Jishnu Prakash (2):
      regulator: dt-bindings: qcom,rpmh: Add support for PMR735D
      regulator: rpmh-regulator: Add RPMH regulator support for PMR735D

 .../bindings/regulator/qcom,rpmh-regulator.yaml           | 14 ++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c                   | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251023-pmr735d_regulator-fd2faf72613f
prerequisite-message-id: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
prerequisite-patch-id: 3f755a759b681ac610fab3a3ab78cc50a82996f8
prerequisite-patch-id: 7f1f8d6f460a3032a7696290b5138da7d37bc6e0
prerequisite-patch-id: 264b32da8d734e44e6833d3ad5e7807f5fb88b59
prerequisite-patch-id: 0ebdc2319e0615065e1a0fe44008f2473e4bdb24

Best regards,
-- 
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


