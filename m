Return-Path: <linux-arm-msm+bounces-70882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5109B35A9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 13:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057CF7B6170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5F62BE62B;
	Tue, 26 Aug 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsKij185"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297492BEFE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756206189; cv=none; b=Hq5piQyXIqoLWTpJC1pCW8gsmpXzqcjH+3X2WHohh686jTf/yR/7I0x3LXMXZjqZ1ReoK9OOslG8xO5bQN34cfPBuQe8glE/2Gs1iCd2oWFyS+fo5/UL8RVDIMxP9QlxJFEeR6UWS2xoaLBObWqDN5jxLuddtF3cGl70+RzZv+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756206189; c=relaxed/simple;
	bh=jBBl6A3Sxsg2d6MaEgBHO65kZTpSDglRvHQ0xA/RmfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvMSBKjdbqWL1WJcH6QMOy/1Adp/wCgtzBj7rVTwtPu5uEajfD6vWr1cd3IORm0GDcGXieWvZ+L/eldlRd4MDPJIqUBgsfbCHGIPhkuHc6VUDvV4JOwtX4y/jrTGatjyTCzguU2gdzBYHHCbVVvZTrtgFm0plFRrE8RuV+ubXng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsKij185; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5odHx032292
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kofxhc8N7wzIQRIEJ2kzWHMlZjkxlt2XuX/b69ntAxg=; b=jsKij185oRIwGFTC
	G06TFUIWYpY4f12Wthm6UyjD6BDpogiHwBR6oQTJqXJs9d6zyTjzlfzacvztGpx1
	6+2gq8uEzZhUGwTY3XUnaTZG2vvLVsix1mimyzh5+WrtbZnAPN2bk0XSZ1/Ehdfn
	D+qKWrXdDwsuWb5GvzzPpwdzoN5pXN17XAvu1HnDL6w1RH2Zbuq74p5/5OGBfVsP
	q5KJ9qOMEo4EOt/n8RoinQMfvEQayXUbxoWeUuu4GkKl93yb65TbPuJDLmqy2ohr
	ToDiFU6Za5dGLHYATDccYyUHHujnEcFUP2lra5k+6MazM49xbMValf447RHkwGQm
	Pns/Ew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we0bub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2465cc58b28so26235435ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 04:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206186; x=1756810986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kofxhc8N7wzIQRIEJ2kzWHMlZjkxlt2XuX/b69ntAxg=;
        b=Aq3QT7dHo4Psqnj3VSwCPBdQK9FzubwbD3jECLAsnFKwPbZ1+GCM5E5Rdaie/0PQ1l
         vB/hGsu5zUKW6NyT5J4F5FFg05ysxRSExtCWmyQf0B6fJ/rt2mmpQo7vERY27ajtoU3F
         +H2uskv8PBTAhzmTe1rNTsG8rwhM2SAdVbAU0/wbzCvXzYMz93w+Bbx7qzCZCXEV9u64
         I7B+CgY44PT769K3+FLRHSV7fpjfDEancelKnuzxMWxho0BNHCnWucw4BMmjSYxjpHCH
         M/P/ke40T6UNx/7lXMrKZKD3qsNT8mWiqgnW61H4akiKyjiXc6UurIZvMAE4Cewb1R80
         ItDw==
X-Gm-Message-State: AOJu0YzefGy7g3SDxMz0t4YrrHdSTBmhH3REZGT86epr+Kwiu6bwi24N
	FIwlEkpp5cEt7XKQLRwWoWAsTruib338cyDkZogtk6DhpHV/TFP4Hm48ZzlqEsKoAqL2o/my437
	9oGmNEm+APx76srfG5oG3gk41fPM5FAEMmDBjHgH6TpZxJkHw0ohFZvbieq5MLAGuSdID
X-Gm-Gg: ASbGncuCxNU+KXglG4qGtPn1rz+/zXaX5RkCwFJnM9rZnZJRlbL9i4BC+GNx6AWysEZ
	mr7nLi+mmQ7OVr8dyAwMCtK1hlT0GA+CB89L36tLtheHWsADjNbCqfUzSMR0H3bCFiaIh4oscSr
	yNak5ppDufjNi6dzzdxx9NU4oRplFeyUVa07l+XIv8fFxPeZnMkC7ZfHKIowsgZ9hKFChLnVJPH
	jilAhw1tK+kxPxrD145lgOMbyGwuEpvMSy+KezvKc/TySX5sf0QyIdZwVVjYZ2HyMZhu4SwKuPA
	VNSbELGklFgFblfg7yvFJHxG+TntA6pnsh411IBMeIt8PcEM/9MCuMFIw2+o04HriRiNJyxNDsc
	=
X-Received: by 2002:a17:902:ce90:b0:246:d769:3018 with SMTP id d9443c01a7336-248753a2757mr14868165ad.12.1756206185803;
        Tue, 26 Aug 2025 04:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNR5imklYJZBTdqQxwSRi1KNrrUdX7w5o4w6VRejdpd1suCFnhxoCDkM0yPiR7w9hpzP36Fw==
X-Received: by 2002:a17:902:ce90:b0:246:d769:3018 with SMTP id d9443c01a7336-248753a2757mr14867625ad.12.1756206185313;
        Tue, 26 Aug 2025 04:03:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a5e5esm93207955ad.161.2025.08.26.04.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 04:03:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 16:32:53 +0530
Subject: [PATCH v3 1/3] dt-bindings: PCI: qcom,pcie-sm8550: Add SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-pakala-v3-1-721627bd5bb0@oss.qualcomm.com>
References: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
In-Reply-To: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756206175; l=941;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jBBl6A3Sxsg2d6MaEgBHO65kZTpSDglRvHQ0xA/RmfI=;
 b=1sSlBVLmp2op60IIE8JykrDJE0XwehHkU6lVFh/THdWWUN/8OY+3uAMfhq9qj47gOcrJq6838
 saX8h+IJs2zD3adnZjsn0lc2ZPZOrgWNOHOhUL3j+p6YIKzf1F66i+b
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: JOIIDznD-zLByo2ncPfbQKodQ8zI6GCm
X-Proofpoint-ORIG-GUID: JOIIDznD-zLByo2ncPfbQKodQ8zI6GCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX78ET8gjQYCX1
 xk+XqSbiA74ziv5QR7jPNsLq0xpe+5O9cmLogrY8YXfE52hnirHstYcCj/DD9zR0jROSbDU3Y7a
 NJTbBTH+Rh8Jrv6Dyrjqgp10TVTbsE75m9BK3XH42UdUBgQEUc/eOac00dpfEgw8hSBT0E09JgN
 dye4jFVQFQ+tOt1y5epMvz/+o0BwBtZNGoXTGTWYMs1ilKlflPYWzYQDAa9DwaA2fBxxb3aUSUW
 gXs4zyw/JC2B+UevSaoxxyroKWr/wUfJdcli+xx2Zmu5x81SriJB8oaM9b4+9dcdAZC0nSlLohp
 ANiJu2kRuZS7p3NYrs6XhdXvW2vfAaHUgQF9sxVm3phjMydT67n0sTvhzPPK1PEbGcjRjq0kcI1
 OBI7ROZa
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ad946b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On the Qualcomm SM8750 platform the PCIe host is compatible with the
DWC controller present on the SM8550 platorm.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index dbce671ba011c8991842af6d6c761ec081be24cb..38b561e23c1fda677ce2d4257e1084a384648835 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
+              - qcom,pcie-sm8750
           - const: qcom,pcie-sm8550
 
   reg:

-- 
2.34.1


