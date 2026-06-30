Return-Path: <linux-arm-msm+bounces-115526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/7eKpYTRGpUoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544526E7688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R1iXZhg9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="eIf1U/ab";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0FAF30BF141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD513B388A;
	Tue, 30 Jun 2026 19:03:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA53546E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846207; cv=none; b=f9setmbGVkGGE1hmXU8I9m6eMqWJYz25hrescNOXCjn1htDJtOtOiJq3xP/ZgU3Lvc0spRkqfwizalMG40C+pSYcMKLXy+I8y2MbstwD/pEGMpGe0LIz3Veac4YBBWdGz76UuI4zTo1+MycNvIs4kXkbupTgmXYrQnKfmnYG6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846207; c=relaxed/simple;
	bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEQXes+EZXk6id7fMDGC66IaKSjzzedQZOd7UA7HKzcGIyWJEDhvOfOdbJO9JbaBlXJ3sjJhQc4xgdWsPHGK+efkSHkaLurmlmcqj7frdfWRdaHr6ENhDroTY8+WCBNoS9OMUZag17y8kenkX3GQCgI3FDhQAFJ3eaGLQ6ZFom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1iXZhg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIf1U/ab; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHl0qn2721738
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=; b=R1iXZhg9haY6dm/S
	2F39eu4ii4yyDRtTNPemOjRDf69aWTMnvRIIejfqUATWkEd9EEA0B2kRgSfL7QQR
	RPqXr7eAqaKlK9WpfVV7noyzy/Qg+JjMLELH5gTm/P9/1D649+q7Pm/HdCPyLJ4w
	r81nuKMODFhFYaeSDbp6nhUotDke3RY7kbdisBNVesbuzpl+neBO5+4JAMNOJC9Q
	0rypCDuDh1Ak6G9LOM0OHBFfywAwo4ccijxp1NnFbqkwNO/RTKDrv/JQsoW4eCWQ
	G71krNoJWJC4qgbtisuTBnB8SHcrbZSGOqruUwhbZR0uVBAj2ef+fpCsskxzbPXR
	Mb8alQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc09g98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so13661871eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846204; x=1783451004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=eIf1U/abMtM22/dkTQ8GhUQOLwpYi6NudSKhT+5PlPeHp03MSl25kXnTYPirFu51uF
         JbM2IkfWhUUMRxBeT5ipQ+86BnVtKhl6/0opwtHtrj36AwXlsMG0ZS1wuVbqp6gxLfGn
         mAN7cq+sFXjqHcAZ9mpJUWqd4UYmDywF2y9pOCbXVmf+25BoJ9uIaFggpC27gRcP4ZK8
         Cl7hj44ozSqbHBV/jq526vcuCXWKMkw12u/TjcaViriot7qD7iYcdOjyehA/8SnaWgOW
         GIvZHYIxg3GJunlbrG9ljezFEReiiljg5qK8UGlO5yLP5zMFS3B9CpUqfWkfndAH60vC
         ZoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846204; x=1783451004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=q5wBfTlVJjofaaX4eZujv+EQO6FuUEZ051kNM5Dlzs8Y5vb9oLT2s0rVk0osVaVwu1
         wcaOxbMSJbeF4HQy/sknRa44GvchxSebAkAXKCYbJU0J33+2ktcV4fA9nev3Lj3ZLazu
         OSobXGYvQ6+7kEjPZymP5pdQM6fJ4szvBbOKDZpoYQAYp8C2m5t43dXQUKCKn5Ka2nc6
         JghKaNiDwIxPw8XSoXD1d54l2X9sQmNjo1456boaV7RIKBkwFY7tdkrTgnEIAZS6+mgF
         9z7noTfQep4tGkJJaJpMd9iyPVeBhZUP+00Cs5q2YiOq7i1BvXQFNnE1ViDhX5+bJofv
         FaUg==
X-Gm-Message-State: AOJu0Yw5gITJEtEt91T+TzkMpL6aexuA+wvClldbtq+zbjrbLRAfxHc1
	fJJHgF2cfKTDVm+qVd5cXrb/EUoc74gQE/EBm6tviowANhG411LCNYUidzv7jGs7ko3G1MpgBkb
	n7gHg9NFzQ9nZCHAhM+Ja2PshknBNgq/shLwUh6o/V+wLVipgsaVapKOBooAS24UpnmgG
X-Gm-Gg: AfdE7ckvtZwG/DBhLckbwJe9qBRcnx3e3ByxOPNK4lyifeOBcNzOnd84XEjP707QD/L
	TKXtVkgNeIHJn848s0oZgG4YMkyBVM31/RiZdW1PwTfVXYoCRTZeE8Jo6W80l0q1QzXm+KXrzf1
	Z4itvEsbFok5CLOrEksln64oDNqyp0u548DVJNnesK4PNLYZCdK/F1BlL+LqoSzWJZ0Q9G59Z4P
	j3csuac3+JszdVy7tOHQVcoxluQKRb0w0jKhqRBtQV5bZLo+ySl154YYBuWovBQqyeUEaRmO4nF
	pQX/lXMwhax7Igc2V10CrbZi1Q2z+qqJmMvDLydMfQFolIrzCR65+fgHLk3MljIw9H8ulfhhRL8
	qlo8Bexm5bZj55vyUWcMzjmtZmMGjxPDAs33VnDVipddzxnY=
X-Received: by 2002:a05:7300:1824:b0:30e:da5b:2725 with SMTP id 5a478bee46e88-30ee12c0a42mr3649126eec.6.1782846204253;
        Tue, 30 Jun 2026 12:03:24 -0700 (PDT)
X-Received: by 2002:a05:7300:1824:b0:30e:da5b:2725 with SMTP id 5a478bee46e88-30ee12c0a42mr3649064eec.6.1782846203728;
        Tue, 30 Jun 2026 12:03:23 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:23 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:43 +0530
Subject: [PATCH 1/9] dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra
 PCIe phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-1-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=1298;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
 b=uqjVKoeHK8WWuWX600D37o+uFPkHhRKB/ccwAF+sT33TdNNRkCWATn1i6vmYcLafrBzb9pTBf
 Cv8UhUYEmfRC2ptExN9cTlfzWDtzTDysF/b39BoFm1OhlzFicTx4WmQ
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX3VDaCHCzXYfv
 4jo8qf2U8hh5F5UKl1Q5kQlIM0RMN7dGg7gqD8dHFmeNua02fqWKjYP86vCNmkm/h0ugrr7KRgA
 0P+XQBSEYOegiCvs7pnQQ4nWMT0ZhKjZ8af0mC/0MR1zacH772v2tIbshcVfk5XxEZd7hAmEo5c
 8JxnS+VaSsAXcvB+Qa02MoUQxTFE4F4Gaj4ovIvQl5mIC/Bf3asYNuskJFJcrr9W2YGxc+ffes9
 OOvfORHWtKMMREXGcqJLyzG+UC79dyYtNDLr7uu+F2gckC//y8bkhSJVvECsOTZx/Ml4Y2Eh7r2
 QoCJq0sxU7s0vQIskXZln6SrF2zXBIBX90Kv+TDE7UjQ1TlOlkg4qpmkDLBhC5nIZdkONQX7e5D
 PckxZI8f+zD4uQRluC/fUqY99oYdNoAx07II+844eBrvVCmWOZefc9YuI6pIkxjLMMUsSpwuMsf
 PWoNw5vyarromoFs2Ow==
X-Proofpoint-GUID: n1vi5J7OuoL6t0HFCWSpPUk1a5Fxdmx9
X-Proofpoint-ORIG-GUID: n1vi5J7OuoL6t0HFCWSpPUk1a5Fxdmx9
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a4412fd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX6BsZv1Rcrj8L
 QPuKCwVlLv4dc1sjm/BC+nsgs7m3vxqqd/F8T8y4vQvqSQcwfsdIbnDibBk1cAQcCWLsZwr/lLb
 ilqHgN150Z6jWFNCHIb+Gb2AV5pbz3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115526-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 544526E7688

Document the compatible of the Shikra PCIe phy which supports
Gen2x1.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..b9b0fa26347b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx65-qmp-gen4x2-pcie-phy
+      - qcom,shikra-qmp-gen2x1-pcie-phy
       - qcom,sm8150-qmp-gen3x1-pcie-phy
       - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-gen3x1-pcie-phy
@@ -166,6 +167,7 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,shikra-qmp-gen2x1-pcie-phy
               - qcom,sm8150-qmp-gen3x1-pcie-phy
               - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy

-- 
2.43.0


