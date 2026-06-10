Return-Path: <linux-arm-msm+bounces-112401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N1ZXI6FEKWpbTQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:04:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 064086688E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XhJ+FBb7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aCKV/HRj";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112401-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112401-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 649E6318FAE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BD7400DFB;
	Wed, 10 Jun 2026 11:01:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D13FF89F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089280; cv=none; b=GKR6DNCr6Jb/JINSxLHdJYjN7yKpZguP7O5l3E2+j8c0qbQaKosPjCxITFZHx31FgiTybWBTY1TGgixD2kVARAMGzffj11vsb3ifAOY16Q61eU3+AlfxBZarMQe3YmwhHfxNDaZlaY+SahqoiSohXzDGdG6PvYXM4jVoISFPKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089280; c=relaxed/simple;
	bh=kv+0+DQsZ+5rw3Z+LZdvu6rOcLL66oeZLjzWJ4X0ekw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3l9kDpu84E/IVm1duLOyXbmf1q1PCCgo+2zNiYjpT9/YpOelWW1aukCq385osy7Aum1tHvmo+toRwNrN9ndZYp9AuVFKytEkEP0zGRgFKAz7703JRFXCyun0/i+5APvWopUGIWPc/QSrD3e2nvRvrWSuIWisl01wZ2UlRSwKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhJ+FBb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCKV/HRj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hvXK530529
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=; b=XhJ+FBb7BtferQl1
	oUZpCLII+p7dopAMttFCpFINWfIWXT/FZ5D3dnbqLCCsGtkVEQ4+bT6uGTA7pzOm
	gwVn0nSBMtizyLv9skycrp3niT7SxYzgwKg1akf2H2Lg1aUj4dmuhnoXEcazr1At
	plyROk17Pu9kQEvkzq7Q9d7Q4H/zA3segJjvacKAnoJZdYRAKKr50pvJOBwdkToy
	8NmT0HzWsx22skpLTHRtiK1SgaXm/yR/+DwgJNAO7rSaL/K10PffFupQoaV9x/Yl
	dzMJUp0vdtoh1b9GmyEJY9E0ia0WDl0K32KQjE53BgGUBM15DINaKCw9eRc4CKA/
	kT7UQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j36u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so7361265a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781089272; x=1781694072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=;
        b=aCKV/HRjPL/NfQHVyZL+BA5alewphlhzX29NXQoEzOiXeSHjo29Vz6kGDlHuQejpJi
         dOe48mH7Ka8+ck9lErNmv2ngNxuDvtwjetS6vovFRLP06NFHE8KhzW8wRQuI36fYlINi
         aZtJnu3l7ssHxhrprhd3vYoZLU92ybtod/+egHScPoNU6jWWQ9QgrzXPohvZpHv1jI3U
         kjxOINwMYFculTWJuiuGNWF/8oaNbTLCzj2HYhAhX6Y+RRYM1/p5YwY55EPmrQDUZpCI
         pzm6WGOV57SGtmMUpzUviEBiqIuAdy/rP4EUHaCEeqBG4iFLhmkvu913A1JqilpjApe1
         /htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089272; x=1781694072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztJEPWEdcGLc1Up2sWWykyke71b1U01clS63f8eofE=;
        b=OscLmwpjzHdJSUnnOJNsrnSfUgkiNupwumaR+jC4u8nvzue5GaqUB465Y06r94zCjp
         eh557s2zfChUTCn6Gra1Ys7c2y/UGTZ5LFyfFWT/qvl9vg+aixzd5oUdsEhlXEmATyxS
         C+E8SHrEKU9dmhtvnWsmA9TjKm/spkOmPNLUcuoCrJt+igZX2diE/o/bTb4L7eO0i6Jo
         0/lS/g0Fn22dBpyQE5thoXzHy0PbAuFSrXPbylJVbGQcdZeIbTmd7e+w9J1k6obMlM4O
         q4w+DLzhrwasbJ4CJ7SrvH77zx4CMruBbUBFcWai2Ni5FcJbisnFheyzT0Irs258mVFB
         z7Fg==
X-Gm-Message-State: AOJu0YyGsSnRefICJfvQIx2NpZH22QDLGYgmV7kSo59WPlZXOVYMR2Fd
	B82oOUqOtR15P7aTy5/WzHYQdlW729Kpbukk4Ql981lyB87oepyMAGHOfl9ASDtjVhwvVzW9Tdc
	EMUVgNtwaIkm1STE8sCKMpVAajHmpn1u5fM9EvJV1sO3v9odKtHXmqnK0ji6biDapy1w0
X-Gm-Gg: Acq92OF9GjciaVt9qCU+GQjPNxS8LNNaTP80P7xjugGbT4U/7Xfw77deyX+XvMcRHUQ
	jJmpZAUQOcJdnVD04IIxO2IeqXdpEuwj3U+XhvaBQD13cjmMvxKO5ivnLi0nynFXAhMsnEo9uLF
	NO0WlVfhSt/eNtC5AZATmzNX9e1/QJIIMBJT9ewbWACEFlBf008DeTCckEOBPqmInKac7uRc2Fs
	ggcNOXPVRZ7d2pd3TVppz5KrFEzNVTJ65yw+TTKM5APQ6rqhK/5Jhb3gMIR+Fx9THTCxT7Id3Og
	9orn8eQSWIKPCq2NmALayx3/iWI92lWTaDSfdHadGlz5Wtl/QeYj5UzSlEFc067rSJOM39TlUvQ
	Sj5oK5+CtQKckmMLdCRWQ+UFj3KRKJa7bktslRj7nm3OWaqlJxDZ7ghG7Y3Mhpa8gPKdfWY+s1W
	iS375fh6aN4/Gg+ZBUoCA0yX2FG5yvXkiYqys/3/AkB4yru0xTf7jAKrCbaIlxXbF7ySo=
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr24460464a91.1.1781089272245;
        Wed, 10 Jun 2026 04:01:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr24460390a91.1.1781089271724;
        Wed, 10 Jun 2026 04:01:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376246afe17sm3535131a91.11.2026.06.10.04.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:01:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:30:54 +0530
Subject: [PATCH v2 2/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9650_pcie_binding-v2-2-69e27a1fbf1c@oss.qualcomm.com>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2943f9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dAbVbwp_SXptH7tlJ5MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfX+hhd6WqtYlSA
 asDmLhiz01Sp8PLdd0kTSblWRbQQK9vepL0s5FapwXRkNHiXY/juCM2RLifu91o2n/B09KChXFL
 LdqA5wz1+Ypgq+L+u/xoScbmO8WnbzhRbdGRyWIYiCv+IwC5MldzT2nzBoaDSdfU1t0tXIcKfsS
 ZorSGKPhGxzSkFwvu4tyKyup326U11ReygClEag7zzb8Ug+oHRbmRN8gBKYJCrQ1E7+kFtbNjXp
 ofocIBb2p3HwqT/Ubv+Uqnu2t9+7K/d9HJX+TyEEmQ4c8wTSwyJ5AIpDdsmHyoRsnvbhzk6LOax
 2kyrWWTL9V9O08l+cOebVXgZe9yC4+BOiQLnQ0Djr+FjjtIoT4bqZS66zv5D5xAbrPl9Uss1c5q
 cjjzo9UPqB/RnA84y8AbhkS50c0P0Sa1SK+p7FDOBMN9/ZYN6OBsR91EpGK+WY6B3rvvt13T2CD
 NXiWTAfy9svm+FZvOiA==
X-Proofpoint-ORIG-GUID: mjaFYpTmUrTpuTx8Ucq4XtfqRvi5M7N_
X-Proofpoint-GUID: mjaFYpTmUrTpuTx8Ucq4XtfqRvi5M7N_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112401-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 064086688E6

From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index e92acddb969e..533079811881 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,pcie-ipq9574
       - items:
           - enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
               - qcom,pcie-ipq9650
@@ -88,6 +89,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq9650
     then:
       properties:

-- 
2.34.1


