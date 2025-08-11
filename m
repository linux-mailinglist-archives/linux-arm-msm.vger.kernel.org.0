Return-Path: <linux-arm-msm+bounces-68310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA35B2056A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AE13BDB25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B86F1F3D54;
	Mon, 11 Aug 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMdIHOtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C622356C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908382; cv=none; b=E5LGDCYuq0jT5vylvbZ0lePLL4bHRug/FDMxxlyR93VbbRwSSzwvjKPqnn0L8Sp0rEqSz/v0GHBHqkYnN/MchZQOP5tCvSegU32WzRr1CjfKqdLKpAt9JWtFk2OywWvCUdvf+PEJqvGkpOEZ6IAlFFnnqkdy8jXhyDn/g7NOxr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908382; c=relaxed/simple;
	bh=LnEoDpnkoJHU8kW/etIi+d+IHIbHf6VB/4ZcFLdBa/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OA5iXmjTc7HErnuCzFycg1MVom9cOEnIEEEoeMsPz14GdKb6/nupkX1ad4g38DdO2Ir02dclGBaG31vmuB47Yc2ABcpqnu7LqsmFDDkr17Cyi9xTX62Lurjmf2YVlRDLAMM9vSa37XekVeM9A5Hehrsn6Nrfmefunb7i2J9P3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMdIHOtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dFLI000762
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnHcb9SoHxXWIKTgE0sy5s0fFPVq4IXyx5zLZaTr1jU=; b=eMdIHOtqd3s4zWYG
	K5aGT3wQhdg/20NBi2POFtCEeyFJcg28eH4R3n317ZAIdmfl8O0ObfPn4E6LsOfU
	LxYwsftdF1bziVqY9mqo+XtlEerhowwiy+chsBRVAOgzpumQ112HeyjQROcU785G
	YKG/Xbl3L+Bes1Q4H+/N5i8046RRVsT8Ewq2/JhJn5rFjSkPHhFgiv9BiEer04ML
	k0qrBnt5wuIyWT92Qji6DDtXpjggYSf2Y03eOVx3F9JsJSRnFtv43MaSCytzEBkz
	usUXgNyIY3SaC8xotUsOP6wb4Q+dJqkTFTtl7tGDsfgtZJvkXqggOpYyepkL9DcI
	2F/V1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kye9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f33295703so6499656a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908379; x=1755513179;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnHcb9SoHxXWIKTgE0sy5s0fFPVq4IXyx5zLZaTr1jU=;
        b=gv9C11l3YN5ysx8sWu33KPAYAPFODjvps2ZkvIJrC9lnwFPl5azdjwO5KwMMzif6IV
         wlCWFmwipgJheraspumUjIpbTsYnfqCb6PeGhf6UlqN4/aqf/yWLuICxySKxvstV3tX3
         oSPiOkSPA26mcOdGnsZvZVtVY3ASBpMoAWaMK7a1UQop8MABN2NY4NI03DGkcf0khKzS
         PJ2MZ0mEpfBC9IhQ/nqR4bhOyH3Zt2y0FmtmCjaqAFAHymf7HbZHiPdyDvalGGcjbEmW
         A11l1CdugvlywgXM1v5xZXqocWQ9Wy8sqTwLUjgNZmeauSBATCSwVaPWSfBxRoixuMa7
         E7UA==
X-Forwarded-Encrypted: i=1; AJvYcCURlCdAvUML67v1a4v8MX9zma64/pCxiszH8qLVK3NM8Y1feN8Z5gJwqcUibqrXNBl37wie7g7I6x8A8nwB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97YEZImKhIGDA5WL0pR00UI0qmLXoWodVea7EMtYPrMoLHBN7
	UCyaFILhSQFO42pkgxYbBiNtEvTEM1req84RY+Zk9pWoyvP+bz0x1zf1qrosFmmDd+DnNNBh6uu
	bCkRvc4r8zePN4jfs/NJSK3jRJywy9C2ElZm81/XcKMoYj2DO8niFrqaKbllxrsOeHVTf
X-Gm-Gg: ASbGncuzARzqqioNtY5ftbe5kSWive7C2bZkRCjSMMAH0q3wF1Z679GIqpiMHMdcqUy
	VW6FemqU7YvvjelF5zz50K4LFZFMsxAzDvkCCCVL7vvrXoT90D0Arrf4Le+y6dDauyX03U789rE
	odgbBpA9c9cus167+dOhZQzbBcwIVAL7ID9SumN0YxsLymgUL05g/CjmPf39SeuCqsHgz0y22PH
	Si3+9W8/R0mwMH5YPdj2Ij6LLp5lb/h3umSmycFMa/LsoKa0odD0TJz80wojOnBtmM03Iqz3lwn
	laUfqSxZy8Y+mfDg8AnU1y/saV3IlEyvUrWIrcs/
X-Received: by 2002:a17:902:da91:b0:234:d292:be7a with SMTP id d9443c01a7336-242c1fdca31mr188037515ad.1.1754908379576;
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnL8seQl4qJRIS+l3fx3q0zvEkrAxHVu3+GqAQLTm/24/fC5Ue6MHpNqLIu1E1JNvc543A9Q==
X-Received: by 2002:a17:902:da91:b0:234:d292:be7a with SMTP id d9443c01a7336-242c1fdca31mr188037065ad.1.1754908379120;
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
Received: from [192.168.68.106] ([36.255.17.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89771e2sm270188205ad.88.2025.08.11.03.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:32:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, sfr@canb.auug.org.au, qiang.yu@oss.qualcomm.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com
In-Reply-To: <20250722091151.1423332-1-quic_wenbyao@quicinc.com>
References: <20250722091151.1423332-1-quic_wenbyao@quicinc.com>
Subject: Re: (subset) [PATCH v5 0/3] arm64: qcom: x1e80100-qcp: Add power
 supply and sideband signals for PCIe RC
Message-Id: <175490837428.9171.16946610135898864162.b4-ty@kernel.org>
Date: Mon, 11 Aug 2025 16:02:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: sraGeJ4bmJL3vz8qYFbWcCG0iaVd0MaI
X-Proofpoint-ORIG-GUID: sraGeJ4bmJL3vz8qYFbWcCG0iaVd0MaI
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c6dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tivzXH558BYE5qsfyb1zSA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=idEpX0rf-HM0R3Am6JYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX5+3CHetYtjRx
 hXcWlSrWC9UY75I1yYvS2DyWE9ukBzfsUAWvEUHO6h5SNFCm9kpZuxipod8I8Z3kr8GFmn+KRiS
 yuKPrm4Sa3OdMB9k9VLfOIaHZ22sfe4xpGqrrDU7qP19FV5xdc07FyvoxZarAbQd+QzAUloxFun
 H2Js3kkU/epOhskK4dnwn2sMmTEEkG08vpau+X3tlgZo7GzO5GLIpM8T/AR5RVx5RstmKxImrsO
 qFHzuozoyiuSbdQ2PrqiK76N315gluKLsyy0q35c3S2fBt9Jicd40cytTukPFUw1oqV4ZdQ6CEh
 5/QYxbNkNaF97P7OieDKFVLMy6EY/+dTGuS+1+GFxy6scQc2bzIs4jmSrvam4YofjoGTrR8nv8i
 Zgu4psn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036


On Tue, 22 Jul 2025 17:11:48 +0800, Wenbin Yao wrote:
> The first patch enables the PCI Power Control driver to control the power
> state of PCI slots. The second patch adds the bus topology of PCIe domain 3
> on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
> signals, and describe the regulators powering the rails of the PCI slots in
> the devicetree for PCIe3 controller and PHY device.
> 
> The patchset has been modified based on comments and suggestions.
> 
> [...]

Applied, thanks!

[1/3] PCI: dwc: enable PCI Power Control Slot driver for QCOM
      commit: add7b05aeeb417c86239e6731a168e6c46b83279

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


