Return-Path: <linux-arm-msm+bounces-113321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0EZB5HZMGrAXwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:05:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4A68C00C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VRGGlRJ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Om/H3nto";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113321-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113321-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4436D30879CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 05:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BFE3CD8B9;
	Tue, 16 Jun 2026 05:04:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028A3CD8AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586297; cv=none; b=tnuN5lJDiu1eeRdJjVrvC3TPSNxpu6FFpu7oaKimzN8lDO+YnNfJYEkf6qD3rpFleQozHb8hXnvllO/uDJPH17k4TWbew2VoIjrXCL5gYj2J32lrh1qBxh8xS8w4TWyBmHC2QNOWPPJl1Wm5bBZDayIsJ+S8JG8baarawD8bMlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586297; c=relaxed/simple;
	bh=LQuNuZJAEeJCLkH8G7sgu4pN8/dcoJOBFIRKNpRwrvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUDWoByWzYPsRitiOHOmxmEgF6d83kQ5ZjeYCmXMewqTftixsw5S32dZnZBzWQgFUjh5/d61smhawSqch6MTbCOZ3wV3yiB3R0amM4ajY4qVxs7fZ4UCt9JSO295N18z5UvaeDa7oyI7h9gFW9SXEB5rpAzSV4k4PRf5SWWS+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRGGlRJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Om/H3nto; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xgeg2300059
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=; b=VRGGlRJ4nSt+fwmD
	ZjMGyRaVupfMH85eYc6mUZkwyvVothpgLZiaxvVMYzz2pP5UI3WAtPM3ETJLVHyh
	u4qZRKmp41Tkw9awCWhZfZtyRCpq+wkLeRWP+O46Z0R9L1K9bMK3lmWYqiVemUy0
	L7qyBKamopKla34SE2mNAxr05MxSbAIkQI4IsgUkglOfK0dJA+nB6k6APhsbM2ee
	5nxqIaCkFlgZsvxqhrsbTHpoSu1A3aP0UUarT4Ic76UGzuRDhmHFvFLFfFvYm3kH
	r7gSbx75LsGz+SVAoB30+KEX25Bj2ysjW6Z88FqSMQmwUqT2kjy3sYsJO6VvbbDA
	cRsVnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter24wg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:04:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so71725045ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 22:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781586294; x=1782191094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=;
        b=Om/H3ntoN1rHsHuj4C6kEoH90MOJCw3t7Kw1iDU0JEm+DaJLHjMP+yjfGtpMF3WlRA
         2Y2rj1YpZpGyILE32TVjJ8pyr3bim19+g6edNi2qzgo/JH0elVWqmHZG3RkqWI08efGb
         Zlh9RUbSeejUzei7FmcGgiZop6fbGN1AvAzAeFC8mvLJlHXh7lFN0pNs1OjlirHiDlw0
         0hVpGRifn/yrYHo4sU67tVSxpuf3ZjYieFsD3f98TxN4zvwf+R+rjGPTckEOAs2aduDt
         uUrghSWwXZRCDf9L4an741feewq3fn+0CC40J3Q44Xfkty1cPdBXwLQefNvT/fE7dHEi
         XOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586294; x=1782191094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=;
        b=haqjrL9Xv38CRdW30FIpVtnIHxDum8xkApYVY0lsklua5RLTZfJILJhg0EHZYKFlNi
         67FKL/uG9E1UEOJQAHTa4K9eKgAd/OoqnO1PARo9RBPtCbB0eSxJccvQrUz3hLCbGN93
         7MQs2/9ZrwgNPbQTywQG7t1Frr5Y+Y2z03Ce0i3NSlQrImVeK7lcVinJ9+wfBjLBtiHv
         ghOEW0iHm/CKF6ywnad8UtqorS4FxR7ktIFHnXvD3WLLEP7xJl6esKngqBTsfZBICaNl
         jhTPdMh5YSPcqj6qwV5P807Nx2Al4o32n856RSLUNktAy/z7+eJckXvbqRoUXzmxb3bi
         7AKg==
X-Gm-Message-State: AOJu0Ywij4CaSUvqst9aDEEoq5rGJLs3cf0yqFe3J+hXtFDTBWOkgw0w
	/sipcbBv9xjYdhNf/ao7+57eYAMctef2qgTmOkZqY1T23r/Q3GR1rs7IfuIPdLikBg/WGLLnOyk
	Yi/c78sYPYfEaERdZu/6xCGRw4BVo0bmw0n+gMU1RTDNOXt+O5AIYn7JBvoTlz5+OE1ZX+io5ZM
	ee
X-Gm-Gg: Acq92OGBHE3eMbLupfcyTzk+rv53R1+BJ/pATaP1FzdhI+zdYMl6BG05hyFPvmqdp4l
	iJ1zUPW7dt284M/OMomEcaxdveqGeIK1I5MLVbnfhg85hqQKWZbzLez/cKQCInUB3ZbhmEtpKD/
	PtcAYdBjqS5uvzFnsVrSGJItpRkTytBZBCWOSQ56nIsQiD3HZnzXf7NceNL7TNNWG6e5V0ITZP0
	JTisRegqp1g22/8RUiN6eT661qOMFTn5moyp18s7+g9puQxJAQe2NffeCUS1zV+mlrUVfBR0LLc
	h3MODfoER/dCbBxsKTBGh9+RZlhSFL0WPj3uIGhGVEw1S8TYpvgAdZ2qDyoB4v7qivZwMsEHihC
	bSInrQTgLdVY69aqbiKO2mNXwXyezopfn5L5Xb7o1UJbfbvciQ2jJtKGuijz+A32/e7Cg/Hnr0s
	J6V4RaKaV725cFgInQBVVDoFUhHdlQg9tmST1UmAyFtb3dfKDzlHU=
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr186916385ad.3.1781586293730;
        Mon, 15 Jun 2026 22:04:53 -0700 (PDT)
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr186916085ad.3.1781586293324;
        Mon, 15 Jun 2026 22:04:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm128957335ad.14.2026.06.15.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:04:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 10:34:41 +0530
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>
References: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
In-Reply-To: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX0z6Gi3MIuws8
 ppHYVgN0vWMzQqR7jco46FIusEA8gsuqzv+2J8hXNqll2Xtk7UwkEP+D87cq1qPe+fTMlAvqZI2
 OFpDfhmsIKpWhc7Rq84eryGvkXLjGaY=
X-Proofpoint-GUID: _nY59C14MoQn24t2t8jwnuP4uvhF9S0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfXwc0kn32TvTyE
 uIsKfOdxHRKRi+5wHX3cpvw9PFlQwELftWX2KbHEOgzbH0LLYkaXOrXwcUzR2P+DMpLLeKV7oa6
 bcDmeqZuDdjN6BF5m0kH81FqI/5Bj83O/6aqu8rES7imeyUNGzxsWtxwIb0hvJ7AZC9UlXgOaWz
 TSg1DZo0Cy8hnthtiotu8K18GLpgc4zYcWwiD5mWEbFeT4y7AhQac1oJtO/Viv9BjX2xefgp2E2
 jh4B3miy7JJtpfeZch8/etU7pgEqA7j5pFSOE3KpPbQbCJK2vOFb/CZs5XdlB3v55IDIT3NmH5O
 kRD1vXev9qQJxnd22SXvsqHOgs5Yubu/UYcMnD2EOfs1JQh4V4oc3C3b8pQh7YK4kOsxhzCHmtm
 LZquvtzhf+pISkIIZyhThdZEMYd+Vj3G1oLEgc9UFd3zhGMNUbLKAkABinoxW41P6cxH52dq1iz
 Rv95OrFLVJes3Z0lSwQ==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a30d976 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _nY59C14MoQn24t2t8jwnuP4uvhF9S0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113321-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CE4A68C00C

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible as it uses a combination of its own initialization
tables and some of the existing tables.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1


