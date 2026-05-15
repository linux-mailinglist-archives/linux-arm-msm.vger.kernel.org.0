Return-Path: <linux-arm-msm+bounces-107798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGRoGi37Bmp1qQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC354DCCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9F4B3051BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1210477E22;
	Fri, 15 May 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbAC2wjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhzjRGvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E726477993
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842081; cv=none; b=HiIEjueQxz2ppiRC37978j1WmqO7C9+HHxYkJ/P3kH0rbj6j7PzeqSO+caRH9wjjV84cDtzJ1lnbiRY1m2eNtQqzszTYgV7aLeAk6gMtvMBaquGOZadNho0JfUJwzI2IDWUW/waLGXk51aoRAnfn+lVECOqnG06rTuRmQlPov00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842081; c=relaxed/simple;
	bh=R6+dVh2XqI14cCIE4/7mO2Ktctr5Aljw6gefqysMyrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8hF4+LssxrbV+weSBYH5xIG661BpFhYsl9bYbpJUK349og5CC+0QvvgixH/slngLnQVN+JPpvoZSQ8yWCKguNoNJZqis58Q50dNEtqg1CI7sruMZdjlcu0g4RQw6tQRQAiJKOAVbxP/Emfj2MoTtr54KVVQKPQ2HBC5S7YrLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbAC2wjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhzjRGvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9O77m1714971
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=; b=WbAC2wjMPFRP8mMa
	YEqF6A6q8KiAiX9qu9+x7bPT42+TdbHQGlh/ZIboZ/wyQ8eUqO6Jd8PI33NON3Bc
	Yd3n6hDEdQwsh34D+XRUTH9yJrNCqxRYG1rGsWkCDRdigjWw/oq+lblEbwe+nSDJ
	OT4UNNf9UsqJ6rQ9DfBs9kCiPJ7WSswgEoFZKZ6osV74OJQMVSoF7BMQ489CzgvQ
	dj0Wgpx/24X/dWDKDPa529/Vg8Ib8Swv0mwck3LJLjFN13HHhKGL9N11iAkWCzNg
	HowLgCC1LnbWztEMRQpTxLf3PRtoIAfvOpBGlJM8MQ6kYUCiPEpeCiTRFnpJXCZD
	51G0Ag==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxspf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8292e18166so3220984a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842079; x=1779446879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=QhzjRGvRpA78hi1mrDNWGxJlpBoUkTcHV6Dg5/CTiAowFjUIyb4ipdcuGSu0+zS/uj
         wIo4IPuKmQf9WBHyGhVXGIp6oJpRLu7XXWPS2/nJmGMFUGRy1KDDGde6HCig7dgO7bEc
         XcfEJsLEbYgnmXylfta5e+UCpsCQ0OVRlHhG37+5gL1Xj2yveIQmg1RCRxGkJaZ/WaX9
         GWw5N5JJq/0V1GQbccAW8tKtG12/AHakLwTTjc90u8AUST+8EVXwe9qcjq8CxS3480wk
         9qvTWmppLGmSK1q22tbAeRmVaiIGQZ0h5uOxkqd0e4TQf0g5o3J8D/oGCpmbo5bXFogp
         visQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842079; x=1779446879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=eoM7fcWPDO8fFMkio7ByauqYFYObRkvRy973fG40v4JAvmkwYd/Oi1mnBmuO2PNkQs
         Gqer/Qrtkeho9lYqZWwRoCV/m2SFqWB5jL7OcuwR87EFrOXu43/dd6Gdz5f3xRsSa9Tz
         QiZq8+Qkek83TZpsxhDxLCbYGnyr5VoEIORqYNAQJJWmRlHBxT4m3fp9m/e4Wq57KDhH
         XwdYccZejkM6Z5ajOTaYmpx5ZbiQ+vQGmNG+NgZTvuL0Bwh9iQrUaS36doGm/IXWz18q
         vQY/kqLQctUyyyx3Ps5m0ttPa0hqZUZPOksBFgXkK4oh4ygOZKTdusfFLVgG0kC11XlZ
         yLcA==
X-Gm-Message-State: AOJu0Yw7qXCtEiQLaUOTabvkR/Zky4Dz7K1Cfus/SIzmCCpKqyk12xz4
	zIopMjvi4LstMOHuQi6LB6duvdYN1wEfuLUZ1JefRv/FyB6oi13DT0V8tZt7eBdyrQ75Hm9KBRA
	SoNI8/gLTyz2Eban7OtKse/RRIQ4rrbBnupAIOddxXe6jNhrK5+d2A+6d3jV546FnNnT9
X-Gm-Gg: Acq92OHSuadbz5WaxQeqD1qtqMRf5FpMltFFwquVkj6DdrohzPn0XYKBe20s6pHym6L
	qIqbVvGsYYqK/N1w+IjFp8KBbyjKPezfZu4JJ22Tuy17ih0kBa6bqWiGBbLoU0ILe/97pynkQ1e
	13uWPX7jqrbV8Q5/C5ZvwqvfhMH6l6v1q3v1m0CVQR+eSJcNwqNXJgwYTGEfw9smV9h6nbJEER5
	RRiqTb6JUi+Z6qtp49npZXDu3NAgN7C+sMH8281BZymn+fZ1186DGb2f3oop39KupNp8dj4L3Vl
	fsuekxfMHkBmJ9ChzaMAHhwSoM8T3+VtIgjqxgFUnTz+N3l/T4foMmVH/V0VJQHaIzm4f+IF0HF
	rwyVQIaKGXwrHNAbveDVxHZOTxYIp44sySpMhO8StQpGuhAGWgoIeAWnEtrqHJkiliVw5sWU3hU
	7VtIMtX/OI+9N3S7HsMPPIQ9fB8xs19VIrUoaU0QlkOC1ZgYxeZKXGzXabkxlMXQ==
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895208637.30.1778842079029;
        Fri, 15 May 2026 03:47:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895170637.30.1778842078544;
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:43 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-2-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06f9df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0GDvqmC56tkqaa0O6TQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: MfuI3Y3yRDjAUMUVOFvkzgkIR7vT1c2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX+IRfPhmEEzml
 pUTu9Pj4m75h1VRFovrOcQBkvu+g5CAr1i2gIVBd3BbFtN1cFslIYE+buzTHkssX5sU4+HNB3bz
 2Jr4woXfIEMgUTLrqPxnrSSFv5Q7Ij55RLkTQ/QmzQfQbaamHWwPjFTdTzcugO2WRMd3iisNq7p
 at8fvc0ZDCXjoggNCuiywGShVQx4QoNnwrrRH2UyTaGi9zVIncUCJ6PDXrDph8e5tVn3rP9ANr8
 Lh90GDmjrkiQpt9OOGLtezHJ4qDM4FIWY2gEHSLi99tVISbXxSs33kjAId+VWzo+w3E9DkhkD2L
 dtlzfTjk/pOtPIB8B5ptlei3o3083rwH2/qVTRUAcsMlrFUfrSF/crO5Nk9qHuDO8WC/sReZUU4
 tgcNjblg82Z3NqIPtHWvlTyJdFBWkp2/zOa6hOYnSriAyKNlVHotxozAIsBU2Y5AtD7j7o9qAJy
 oIsOz2Udc+p/Xknm0Lw==
X-Proofpoint-GUID: MfuI3Y3yRDjAUMUVOFvkzgkIR7vT1c2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 0ACC354DCCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107798-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add dt-bindings for USB3 PHY found on Qualcomm ipq5210

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 623c2f8c7d22..bdb80371ea68 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-qmp-usb3-uni-phy
+      - qcom,ipq5210-qmp-usb3-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy

-- 
2.34.1


