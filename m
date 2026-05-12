Return-Path: <linux-arm-msm+bounces-107035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLHSEzS3Amr4vwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:14:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9907519CA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DDF3041A5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850D6334374;
	Tue, 12 May 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isCqtSEp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brWkfE/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FC33507C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562795; cv=none; b=Sv1cYxxd5hurr5J9Ty+iTgF3k3hP4rHxRaIxf3zjFGJ6eIBePL2Dp7CZc2CBaOkYOIwpuDhtAVK6OvrQiiglQWBBq8uKwfQ7UmFLT0fL4cePjiOplDDTZc/LhFTX9rtbqjwRJ4VTTwQCSD6wotei2UklSKoxJPO+INP6CWyRcm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562795; c=relaxed/simple;
	bh=nbRy1tk8J+o6IdDCQBAh12ISVjY/AuDFM6QaiexvfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qz7mpH9thMjyTBBkNESpWtu+JCtzbEJ4EeT/I3P5r9f+sODqk9qI5qQitvb8j+iK4PTb1ylpYfNeu+O+15Eyr4ayS+wlva0IaXhK2e32jG2w8fRkuIXkZiK6dMy0eV+UvW5i7oUUENM1Hfzdpqb1jh93WbqwjvRx7vmyIzChrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isCqtSEp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brWkfE/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6W6K2994880
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=; b=isCqtSEpvSZf0m5U
	UErxZyZH59fvXT9Qmhn2MuD3EbFeyOVHVrZrtCQtD0yUoHzNTC9OyA43XgEPrtIa
	BvkSTe/SyP1G7oxg4sEa3bQvezBYwklX7RwoNg2q92uOYRmRl93iz0r/e7Pt+ojp
	fiIrQCn3fWiRHA4nNYD1dLi0gR5n5eOuwSeggrpkQu2I065RKfW72C4ubHJAYufL
	7d67YJry/EX4t3AR/oBp3xrSe3bJuGJSZLzVJAxeND3BwYcuot900Xo3g2w5Es2i
	0gLX4lPsmSS50kDMVHpLeSbMsShrOpzZDwjc25R6KxkLQb4JkmDaMuYk86EPORee
	ZCFJCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0sjxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:13:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so2396602a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562792; x=1779167592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=;
        b=brWkfE/y/jeW3h7g3ROndGVHomGQDbhCsxoUQjE86dXOAfD2uHW0QQRpvQf1TXGIhf
         sZiJq+rn3WFLfC9wF0Ll2Dcchnh3fqMMP7fgEkyWafj3xOyQDQgAhOJ8VfGriii8l/xJ
         iEPNy6X5r9Yqr4MnGVDu7gikueqdW76XqZBptlkBk5lJz/n5W7JIMme5huf8+YW1jT7p
         CRVapXYMAPUtSPT6U8OwQ9KxnqjQkH1OR0CIC/Qte1X91mqFjCaRm0noDRVtGaNAdp37
         0pbEtNGJcTGaN7lnIBACQlKsh1YEz83l0juKaKjUXMRdj6yjo0y/EX3/Km1EDEOL0yb/
         HjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562792; x=1779167592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=;
        b=QSqvdrCU+BiNHMGjnOL4ax37Oq8mthQhX0xi/V8g8r+siygCd332Dhuy9z8wiBV9+s
         +9Awv4g00ty+Jy/mHxwK8TZ8AiUMxBKKplL6N2h0P535k7sk20SBLMIWPzHvmBlf2ZTI
         nwY9ukhC4Iq+C40dSGpv6YZHWmZaH3nBhfXYPADhaNgwrj01JLulvx6He0PYAfBdNRoF
         opf+Gmol+nqEItAgEcemVjERc1wS/YC/io/g9Soq8Q1XNkN118AMsGGf0VzU9xNh9MP4
         L2fMTBlax64OeRAgw0MF+1f+neG4BsBIFsDPBgr2bhxx6qBzwq3xW2eu5A160pz/FmV1
         rSiQ==
X-Gm-Message-State: AOJu0Yyz5oVneP3IlnWi9sEEM7JXaSPSN//grnk5p9pkR/RrI/bnReWU
	JJu2npk0tFWaXcjmULIh3awr6FqQ8SBiUluEl5NRtQfq0EHLlOJ419aanrE00DvONWUJTMNCbY+
	Gey3HY5NSAYLgDAtJLMDJDOXGCylnpv62ZWvV7jmLOmqO7b3lhzALRAZZF+uBZXeUNdPv
X-Gm-Gg: Acq92OG/fFXHwZkoDHMfNrmIdJMjYBU8+p1oZLwxyx2wMmww32Ccu47O5B055hy8kGW
	UdQEQAjNerm49BmVITEvZbQnZ0B5Rb10EsOC0Q8AGB0HOZIXZSt87SBd9eMJKuBqzmweJ5Me9L9
	eMUHb/8ougA4Dg04iGJcIbscdAGfZiMDZE9X43aEvrdbCN4gmYpgbrOVHCBXkYUymm6ed9Kfth4
	uxGuWTDVSiGi1qfS/OxgtjydTfOCad1ZaQA0gsbdDbV5Ok5sv3P12922XchffMguFOQpm2Xa2yW
	JqXytk5Xgne0qTbgfwV7hT/LzhcrCbeyPMiLy4kr5MUfbW9+LjaYzJsH+pLi0Q3S6br4DozXt3H
	TzYAifFQJibAZdtLzHqFN1nL6O6h9N12DV6tNAL4aEhkYZecDFgCCIHzWjhIRcm5iTwtSgllmCY
	m3OfZvg91iSOlI1A76SOONGjbM165B5bZATbhAFdFJLj30QPhjNbqg0seE
X-Received: by 2002:a17:90b:588c:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-368ab9f86bbmr2208814a91.11.1778562791841;
        Mon, 11 May 2026 22:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:588c:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-368ab9f86bbmr2208776a91.11.1778562791399;
        Mon, 11 May 2026 22:13:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm425701a91.10.2026.05.11.22.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:13:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:42:49 +0530
Subject: [PATCH v4 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_boot_to_shell-v4-3-1e87c8326e59@oss.qualcomm.com>
References: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778562771; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=nbRy1tk8J+o6IdDCQBAh12ISVjY/AuDFM6QaiexvfEM=;
 b=+/QaBmEbfTs4Eeni7H0+1Xx+3GEVzo6rs4t7sEzHBQLHWkBMtRsOFkLjwJI1+ZIpYNFuBU1u5
 nyAGm5cbwUXAU2AxFGXtqxJhfGRmyyaWR/AXgI4+Kji/vHUqbyI446X
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02b6e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AoPRivk35tf9mwUyIFoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ED323iI_9I0CIgW7lEHFTkq95wU7GukZ
X-Proofpoint-ORIG-GUID: ED323iI_9I0CIgW7lEHFTkq95wU7GukZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NyBTYWx0ZWRfX1hLLaFj13Hxb
 67rwiYDt8bhvTO4BID0mGNDUKb37MU9qx0QpLrLaSyq2PALtFzdT643nhLlWG6nbXLJy3xjwiE0
 X2aKMNmrIuqImjZ2Q2AmjpPIXeJkMb2Z24lUbdt40nbFrlptjWcGklMKv/XG3bUreBYfxN3aGk/
 J0mkjTvNc7dnMeDjWyodY0D9LEz5dpkB3+vwnnY3xdDrWbgzlwai7TlAwoEvZGlZN96gyuLVhF8
 DjCCrevDeKe919OpkTwS7GFqNCxTEwypMAzMQDdgkbwfb0hL6UL89nHV6l8Dhg7R/hINOC06o8d
 0KbDIo1E1x9GDWWkfwG7WlMKptTBicjqwxhsAA+EvFKuxRJYS3HnWmPFUskQ7bDGy2ZJPlgzds/
 n7T0DTrpySMub4wtsOKlEVZm791wL+k4t7yNE8FcTkuBfORfVJb41Mx8QrINfrPxMIxROmVrRi6
 VBWdBpdpQRixQMYVp8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120047
X-Rspamd-Queue-Id: C9907519CA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107035-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..af266d584fae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -366,6 +366,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1


