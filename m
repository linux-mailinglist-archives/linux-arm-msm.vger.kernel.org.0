Return-Path: <linux-arm-msm+bounces-89403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ECD31D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9888302A3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BCC26CE0A;
	Fri, 16 Jan 2026 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZ2AXBWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9xADq5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE302690C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569938; cv=none; b=Oz0lzEGzPW1LJEirzv1iGMIR+QonvqPdKuSinRB2J7xx4ug07t6Zewl6pjyOWdxo20SH06Qqp9TxnmuvuAxXhf+Fda+/ffwSTvx+F9u+w/E+l9s7OJC0BGQkvzxRK21E9NTTlWkX8KDAgnW3txSK6Bgypt2cW4Yf8gjvbDoXgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569938; c=relaxed/simple;
	bh=wO65puuOPV8mWj29LAskYkY/c5gM/i22JAIZF9FnHbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U9xq4esOR+56GzLHGlBO5SngCc6CKx1Flk+Lk68uOyFx0rIlow2VT9aMsofdlji3A+KonhTRqU+jwAM4qb+Tqfo4Ze7w94fAGz6gGvAUmMzkIC5nQ2M/EywrXWS3YQTFMSo6XCLpsSl13RiNaFGLLKfeSbDylnsgI+AUUhtzxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZ2AXBWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9xADq5j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8SNx41240899
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m89N69Feqk6zBGnS3QVDdgrPq5aK1zZ5zVjNDPweqnc=; b=HZ2AXBWZU2kpQLpg
	NN45Nz7tAuSugBM+AmURkwVJ+Ce0J4zqgjUA6vcTngFHSqFWQOb7VjIj4elT60UJ
	T2858fH4KE6QF6iTedIVXqGZ26zIYjlOqc7SFV8mlALgpNQChe0rctK/g+GzxeFy
	jhKL58fXv8wevGPWBemkLGp8dj6z6u8EcMY+FSdcB1ZXAJu4JtQrxXzvj+TZlUmi
	ddOFS1QkOTd3kfJLWrKUAVJIWFv6nJDG2lNEs+Cg5aY2ILOvx0h0jME3ZrQvEVN7
	CQ+Md5gzBeiy6KPsMcXdsv+am0YPX9vHyxI3C57+7J4t3R72BnLO/PRNcuae8Vzo
	CYK3bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96st91e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:25:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5454bf50e0so3649714a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768569935; x=1769174735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m89N69Feqk6zBGnS3QVDdgrPq5aK1zZ5zVjNDPweqnc=;
        b=F9xADq5jCfCKcEhE2KeCPQ8B6+yi2fsbPQx0kn3luZ5Oo08ZibU8a05bx5DvBhSiaO
         2BACObJIBr/ihbHVqZAIFNyLQU0TmJXcrRND/1sz09fo8FFNhCYkyizuvQgNmROVmN8u
         lwub6Lk/Yt9WUGbzB6G07LEuk3Ntrs6I2kekPihiZsA40woqXx83S1dAOuqaHSdmODkD
         dw+Nv6g84j0B7/6Y2bertsuii8oFjUwjXtkP7bn1Deo+YYp3mVQy04/eG/kDPCHr+4ot
         WcDmQZ0Rne2Y3+Immt31XHtBqeT8mJPJCBnTNyEQFioT7VmbKsPfOJLVsTk/W0UIsj4P
         2N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569935; x=1769174735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m89N69Feqk6zBGnS3QVDdgrPq5aK1zZ5zVjNDPweqnc=;
        b=sjbaOPvB8FRuaU/puQ47iKuUNLXBZyIZr+NKsKG+/BDio54bCZKw4qZ01DW0cQxCXS
         htgwnYbB/YJD/crGP2C1/HGvlIO3eBVjTY4A1o44OjxXXwyvp80uZPN8UB8oxSWXxBTO
         G1htOd0lQc1YODTaryXsRRSvkHj6DWaExO1UgXPAr+TGx9oOFCNuDXIhrRNhCJON69s2
         f42K32f9JGkkvplg6/HLxLrgwYtDaCd9XpetY/O00GmXqX0ceAVh2+fhCVMzssDF6BPZ
         psNea4lQZ5HvSpnPkCV3nyNirIY3rSNW5ZTjWx1tevGGeeuWWTyC9EthCMIZ1U6fvPET
         QiDQ==
X-Gm-Message-State: AOJu0YyOg3aRgCxzcd/drujhQnv3qaV8RSj4xREG2DSOMsG9UBzsG1NP
	SWhz3VyrsCajmMSVxYVrh1mu025k2YIEe3TwnnHEVzsOeVcPjyKwCuH/026BOJaK+aTKhHa9QcR
	q0MmEyyodKE/Ei4SowrwvubfWVpLiOpCblYWU1TPYsS9m+L4YzrUWwC/f4BF96eLmHBPV
X-Gm-Gg: AY/fxX4YdRnGW1ecSz6Ntqm5OzuoaWEXQx9BEIGqtxLrnda48c5LhDmbiYparEtzzBJ
	4YsrFEwe9Iuvexdd6U2pPU1jTw8TUeB6XwWv1c5tjuuwhtROJpyyv8yToxSJTdo6qax/wHJTdmU
	Atg0+EfX1JgNE9uA+6GboakHY6usCz+qn2YOlx2T3uh/yfISVsRGcGOu8AbJchu64YrES7XIe2P
	UqAefZZBh4buBVHJ12EYYvwIgW85fICt7G4IEeRkv6MjBzAG6bSmj+pgOU4FD1b9c3apvwBUHRB
	8cWlfQRHuxPGglcAgaLCAKQ7TN3CfCVGUFDywQ22vQiWCPuqjLgrKAH6b0Pi3vqKH+pN7Ircg/K
	FKJXf
X-Received: by 2002:a05:6a20:3945:b0:38b:ebaa:c167 with SMTP id adf61e73a8af0-38e00c2ef84mr2544601637.20.1768569935110;
        Fri, 16 Jan 2026 05:25:35 -0800 (PST)
X-Received: by 2002:a05:6a20:3945:b0:38b:ebaa:c167 with SMTP id adf61e73a8af0-38e00c2ef84mr2544564637.20.1768569934560;
        Fri, 16 Jan 2026 05:25:34 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:6031:39cd:c600:2b20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b252sm2138072b3a.7.2026.01.16.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:25:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
References: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] PCI: qcom: Add support for Glymur PCIe
 Gen5x4
Message-Id: <176856992835.23711.2150005271893614146.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 18:55:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: EcCa193zxcPtXsacCZo_E1ZhpUV4e_JZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA5NCBTYWx0ZWRfXzBlepudpKQoF
 qmoge2oSolJV8OuzncZuUKsfqKz7Ikq9t8LjFhIHqyalvw60PFFIT/qWczUP6WMn694SegfBpt4
 h8GuEA2LWS5z4Gakle/8s1kDkK+AdjOoZ5RfIlJ6j2bjgrE/K3+mLXZqLPa+k3UKxjZ0e8fVlQT
 /ZEZ55ADMzZC5bXglCGqg0MAGwFjBPzdWAkTqpfoOxij5nxSick1d4g0zf95DnaGoXf++7NqfU5
 w34Z2a2JEWU2SBpU0ClrWuDiGhxpuR8AwcrnpDDBLsI5ikWLcbWGUV1q9SqJI+YeHnlWN5zJ/ry
 2eeWw+wktQ53g4+AHxHAbdyRHSoldg1L1EwC1QCeaUBS6uJ2NS1RKLd/aN7c9inQwpXfBSolokP
 ARVTHoyl4BpYqXfhRJs//3LAhtbMwYbuIjqOmG0hVny0rhRZRA1Sx9/pF/CL9DiL1zI+oTxbuIs
 4BbFWvQdQ1j4OF2WAog==
X-Proofpoint-GUID: EcCa193zxcPtXsacCZo_E1ZhpUV4e_JZ
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a3c4f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=extm9pdXzRddJ-xlDaQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160094


On Mon, 25 Aug 2025 23:01:46 -0700, Wenbin Yao wrote:
> Glymur is the next generation compute SoC of Qualcomm. This patch series
> aims to add support for the fifth PCIe instance on it. The fifth PCIe
> instance on Glymur has a Gen5 4-lane PHY. Patch [1/4] documents PHY as a
> separate compatible and Patch [2/4] documents controller as a separate
> compatible. Patch [3/4] describles the new PCS offsets in a dedicated
> header file. Patch [4/4] adds configuration and compatible for PHY.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe Controller
      commit: e74887035fba99ead63235740908debeb1326dad

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


