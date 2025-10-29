Return-Path: <linux-arm-msm+bounces-79436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D90C1A0F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2481188E8AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C193A33A037;
	Wed, 29 Oct 2025 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fc70GeIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJX99EVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234CC33A010
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737434; cv=none; b=naTBHi4/qBSNcrzS0hnrL8d1kdSlkcuqGia67n2hZeB/Wol/7kj8wM/6gzrkZuNnBEIJ8XYIiP2R17J2pp89MKhnApln93Lco1dZdV2Kk0LMcihxmgZTHrj0qrIQiFze6fSwpxeJBUo2XGTgDgSZTtKs53bAauiPp9+ovVJRj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737434; c=relaxed/simple;
	bh=0ISk1zo5mbRe9LxvVD2vadNQhbkjLDQVBj/SNxnxtpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeGZ+3/IRbD7ZcMJ2DPUoW0JJRg26KXyE0luPI06VGZoGcSex6SMaInKvPe3nH3+UsLH/viKHWIoORxUDgg6YX36WSOQ80tpuquPzs7bivx8zrp8tquL1W2bQExNd0krDqKQvyiYwXwpp/G0txHvgZvP6ldf/r8pw6Rn9ulg1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fc70GeIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJX99EVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v7de3755096
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=; b=Fc70GeIBGwxokD80
	gTwd2frpgXYsUgFR9D+UQYKXzs64EokyWRZq+SB4BEwJubyeto6Y6PkIX5vO1rCn
	IgLA+UTVKypmQTtWxmD4OTLZIolhf/WV8m380wBk5VNl/Q+UvIepon/z2CFq4efl
	VhIGwp7TbW5xiekkftvfRqGEtumtugjrhyV3sSKs9b4PwDmMeoy7ooF6imYNKVHg
	x2ER9A0YYhT1ooPD1tPu/P8QDN7z/Nya819lZ46SPxRMBmqGSU6flUcIuhQ6HoPi
	La18/FE97HY/Pbp67ept8J7xFwDYJTDFO8qLq7rtS+aV6GBXr23dw1Dd7w91upoy
	l84cCw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a02bgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5529da7771so4255427a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737431; x=1762342231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=;
        b=VJX99EVn0qgb2QczArTvKf8obLWgQzmCZ/ifMmkmcF6UEvO5GZiaqr4N9L4uvKe9hK
         m0vbl8qpSqZv9XlYUFmcc3HmqRZjX6RnHdy+FwCfcIBqJh4nY/AbXPbcr+NjgymLLxAV
         y01l4lpEsklMPEub8e9TEbi2ChSg98VOt6HSjalLawIMigkIGBckwgVk/bGtlF2q8sbJ
         Tt9DZ1JS2Zx5fzDyItxyjXAYarimmneHzpMZ3VdVSOd5EUdfJO/GdBcsJCz4uSjQqSxB
         UoSNcF9T/yJxk+4X7FrsqJrap0oy1xT+px5ZKFnxbOGV4BX1SCBzivl9Qme+Gv7Vv3fK
         A75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737431; x=1762342231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=;
        b=YPMlRZqtsyMY+4Hij4jdOfjj7DgIMokDeUlKMHWRzRnJg9u2u24ps7Pv6ZN+7Hj7it
         bT3bZDiNPjA+veCRI9kEghonkC09prxQ3W+o0PW144ijGTTWHSo56ykEcopalfDcDmvw
         P2Vmei4N+teat92kRdlyOoxcJ4jhIaCWSfVOkWL+ecjoXMWmADdNSgOQbe8XQolJeg4b
         3gLrFwCkafspI8FLQtda4jFjs4ogxiapbPlrpUjofk8LHpiP6K9aARtOwwmccG8e38KE
         6CHHLjk4ad+GF33GW0J3vDNdtBEZqO6ZEPYQ31Vlyoeapcm0NAis5Glx74nCOYBQsJmb
         ZB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxif8/wk6lJFMwofIyNi5RL8wniaWQ7x7I/afOrV5GxncO/CoKv0WmhjC3kdvosgxXbXmlAdAarDsBSpnL@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFT+Vs/9fc+IvL+GJ9TkOb1ZdEeDYAEmZmzV5LsJmB4rgLH9A
	1uLdRHvH1S22yWHGJlYGS+bAuOxdDsW2Vn1rVb6HqpzpQ4MZEbv1BWtPxujEHC1JYVuejvKl3FT
	jqTDfHAKUpjOYILWSvCuJdyXQuUKPXAENV2+Z/rpsN3NxTkDADcOrt6br3paKbHJdJGBR
X-Gm-Gg: ASbGncuS99+bHu648KT0TF+1eNzHFyjqjseo7ROPMuW1smoi5K+dDyFnWyNZHNM8s69
	8RLODjnjvQZdnNTc4Ku2v8bwtGJF96POIGHC64IBdDmafd4or3Kfm++lhvp1ev0+ouEDO8F+moW
	U7hLNWgF0IAKE7eAMEji9AEHP0MjxZNK3bKkRYLsYfPYIghdX5Eb16kUstdK9Yz5wvoH1oLaono
	UsNwe3yPVSo2G6hzNikdc1QOxqNXbwKbH0C0ZiL3SadGZF2+pUeD+3kNHmRnAxu6P3yBRJEsDdM
	9m68vg6ksJMxv9WkKpjXZ5oNPElnOJJtEneoLZJHJ6lc3iaXMIASYiAduRRDXiUfiHOfM6utTcE
	1LMntHbM5mbD9os7w39IRj8oTytiH/+ayMw==
X-Received: by 2002:a17:902:d2ce:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-294dedf443fmr33997005ad.5.1761737431328;
        Wed, 29 Oct 2025 04:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzD3E0IZm0JLmQ6eTP7Lq7ar8FKXrfNnuIQJfcHUciek8CdlXU+uEBlYoC0IXK5Nyb/Xjdwg==
X-Received: by 2002:a17:902:d2ce:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-294dedf443fmr33996485ad.5.1761737430778;
        Wed, 29 Oct 2025 04:30:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:57 +0530
Subject: [PATCH v7 4/8] PCI: dwc: Add assert_perst() hook for dwc glue
 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-4-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=1362;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0ISk1zo5mbRe9LxvVD2vadNQhbkjLDQVBj/SNxnxtpA=;
 b=kOSo+nmmPNadAjOdB06SfSAKWKG/olLMaKQnaw1Yrr90I/zKaUVLNSJ2NCiJnpG3h7DLefx82
 JJ7r2dS3VeABWmKmDzJ4i+yI+7xbpWJl/11xp4sC19PcUt3eyhvpgJE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfXytSthCUX5h4y
 GDPuyYd8Pr6VusKx8nq6u7e9TkPR7DRT2S2q0Zmf0/MUYkwWTceiflrFSdvdEUENeh5b9H7VQhv
 BALgJgIlxnUNjcRskEYYndhmrtlLSHhFaGywuN6Mv/IBL79++oqUqihWaNDLTDI5Eq0P62A9aDZ
 J5a+xGo9XYNtSCrIFa2EIgeDSlHjKTAIQ9Syre2qox8BimY4vFeLU+ZtOn+8J2IV5GPFT4C4LOW
 l2puq54kC1va2ZVRCHOL5b1TdoN54t/rxQLMnStAUDsGxMvqIxO3K1OjVVf89DqSJ2GcHmFUZlH
 Evx0Zm2O0saKij0mdE+a0Hmygaoj3WSMQz8ns7BpXGOW/0Pvx9grF5em+DZJL81iXND96zelChx
 wSa2F0ufvFWzyODET3y1Os2PuE5Aeg==
X-Proofpoint-GUID: frD3QEjncV5RKPd9lsT7xud8juS-Tr8V
X-Proofpoint-ORIG-GUID: frD3QEjncV5RKPd9lsT7xud8juS-Tr8V
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901fad8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085

Add assert_perst() function hook for dwc glue drivers to register with
assert_perst() of pci ops, allowing for better control over the
link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ecd10130d3be3358827f801811387f..99a02f052e1c8410573ecd44340a9ba4f822e979 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -485,6 +485,7 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*assert_perst)(struct dw_pcie *pcie, bool assert);
 };
 
 struct debugfs_info {
@@ -787,6 +788,14 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 		pci->ops->stop_link(pci);
 }
 
+static inline int dw_pcie_assert_perst(struct dw_pcie *pci, bool assert)
+{
+	if (pci->ops && pci->ops->assert_perst)
+		return pci->ops->assert_perst(pci, assert);
+
+	return 0;
+}
+
 static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 {
 	u32 val;

-- 
2.34.1


