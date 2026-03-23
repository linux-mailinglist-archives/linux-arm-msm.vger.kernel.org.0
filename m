Return-Path: <linux-arm-msm+bounces-99132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPo7InQBwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BD2EE98F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C475C3034DE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FF6386541;
	Mon, 23 Mar 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzhukhpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZ4+bjI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B443386456
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256077; cv=none; b=TItG3hEMkxm2KjI+sRr3UvRwj+KiThqR3NHiWKxnoOUuxMWTXl/XXd2vF1iWodjkgIWAAfoIGC0oyqgKN9MbduHUc7xHlP8EcnpH0x6VDTtKCX27wcoYVqcgjSjfPa5JZCEh/is0BfP9kHBj6lOlXU3mvf52hY7ucdsox6Hjw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256077; c=relaxed/simple;
	bh=QH52w8WOG9WYQEGbasl9y2Tcm24j0/g8q5KC6Udqku0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2C/73pKr+xqcg6okHN59nL1UXUqg7dgccgGeOKa8mhrtnnfAfWPmL1huXiKjb82ryAlc1DmmYa9yUcjVETb5S8SvDByMybmfF6wtn93SvjGZQS8EHjiDVk+59XrpsB1yAtwMl5exjPSDkCHt+6eyi52Rb5p68rJySxcbaTxTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzhukhpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZ4+bjI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ta2v1627158
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=; b=MzhukhpEeFP3M7e5
	rgyXocotUPUCNrf/5sqpeO+jI310uOFX7kQyAizuD+msqZVhCxMUL75xjUIhSHqE
	eKq3nHNVkW8pPWEe2aynQV9CqFcFDnOn758eZw02S1Voyr0KUYqtjac55ZJu8qQm
	V0tdhaEnuoAuyf5xmj36MVhnK35G2XusE/xZEVOsA5MWoO2zvb0volq1yaKKkWUZ
	85GTIpfCwcNXt0Q3/nYfZER8H5H12T8E2PuVH7/+o0zjNQmHmUko+h/fEcB8Lu7G
	7el9CCMz00+d+oDxfhL/aRmkysw51bl5nhZuXLMyAuJpBuQcEauXxEfNELJlD8M4
	DA/tDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0675-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so4324351cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256074; x=1774860874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=;
        b=EZ4+bjI3HzywAxqthJowwmzZkEZtPQykJQIIW4KaCakOhgvG59Ylhov91TWVl1pqwb
         SrpbpoM0Glu/b0cjm6AAdfZSXNsrhRf0cF7W+3+MVxQYPWkA/3DPzMMlirC1kT39URtR
         RTXQpGLK+qITK3bEFIZeOM8tR9M9w3gSrjkyM6MNElc5PSI6XKsxJVH2vGybVJr4xkkO
         yMRDc8Ao9pibg6GTAyIasrZEs0TjYfpeIaYgfzPIOzzzFyYnJ9IPruhkUxUt5fncDOql
         LSwhwdXTopzQLF2+e700+7A/6V6OHzfF75RTXZqsJihiDpx18RfiYmPWurv2psy7XAAU
         aNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256074; x=1774860874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=;
        b=MOKoDnCR/MSSrW95R9UXBbvnWWGg6hGkS+jTgSv7Fk0JjZtno1WsddwYE8aE91O8uL
         /93+qe44v6KwItrGJO0zVOLJB6GtN2h9SFkPhrrVWjDZaqvvM+udXbgQtH1sFxwrcvgY
         fgGSZceR3DnFXuzoKT9GOEl3kr/TmB/VOPUmFSEJxT7dnEgOR2PxXxuKLa7culuBnJ5n
         b9DXYUNzec9xtoLo1KaTZxmgON8TcWB6CEZr7jQw+PlAlnmIkvD8xijlSFGK1fMw3BuS
         Bcb2lB0PrPy5Qr116rsDo2y2InA3ku9zXT7hTXylkvHQcKMyl1k+gVbPMdhWo5xEWc6A
         EqpA==
X-Gm-Message-State: AOJu0YxfwpZUh1j3qOAzg8XSjg2W0R1ouqhA2wVvMpoY3pPub13ZMo0s
	LzCoCbB+96j2BsoAMeuv4qcr7bo/WMDruXQ3brVhn04o1k/kJ0kUsF2vbUfey750msV5t+NGddZ
	b4ZRfbC9wuFipppOqtaNJ0Ed58xdrF7AFpSfreKJT9z9OAXY0QIvUrOVyU1Oni5HF9kTe
X-Gm-Gg: ATEYQzx4EFUZbNf7C04L9QwzOB1ipJimTpWvNxfDd1V1KfMzA2obSmS2cx5b8q8IW1D
	6yr+3f1VV61uel4w/mzphCo6DFfK7EoEvnPzK6h9fIn242EZ/Ga+JMtRP9F/JTAqCj199xfDix0
	7vmk9RQGYO6tGq23+wdlmRMdSDu9Ru/T4w6PXQDZSCSN1MemCndkVsIONDWhWzl3HEIit1aprM3
	xh80M+xsqsOXN7iwYQ6csen98n6WkFXNbqbiqhZWBf9JNDbfeMavRpzL8mCsOJRbLcr1nhvy067
	qZ1qDthCobnTozX7b651Ia5ut4jOQigXpQOxC7pIahvETASizhUY99AUL2pt1wo/WEaagjC2sA7
	SbCEN+sMCNbrix0ewewUvGce23iwP5ihFBVCLjGPb1nMR
X-Received: by 2002:a05:622a:5a19:b0:50b:4cae:e37c with SMTP id d75a77b69052e-50b4caef275mr94775691cf.72.1774256073845;
        Mon, 23 Mar 2026 01:54:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5a19:b0:50b:4cae:e37c with SMTP id d75a77b69052e-50b4caef275mr94775551cf.72.1774256073444;
        Mon, 23 Mar 2026 01:54:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:15 +0100
Subject: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QH52w8WOG9WYQEGbasl9y2Tcm24j0/g8q5KC6Udqku0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP++FGebrAEu1Va7WTK/O5g3L1tF9BVF1JEj7
 wqnHN30tmeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vgAKCRDBN2bmhouD
 18XLD/9oWr3aLH4zk5/K1hvTz18gphb/xqV5yc4QWwMI0ndQSi6BbV+TClCudD3s0Oc9CoPuLM4
 bJOZe0hbndulXGRe8ve12ejJhJwltW/aNyrEwrWeQzDtQMOheb+PauBepMMnmx0qxo1hMc1+Hj1
 eZT/zhgzsFadZ8syvupRSA+i5TW3LEds9sQVz7ftY42CrCX6g55fK3lamahRnW0TdhxEj1OzRuu
 td2HiTfYAk0Vl6Ax8bHfho4Ul1SXOZkDH4riQYOD5ktcv5nE2i5wPhoERKxsPZjCbdNed76JVQ4
 ryOeTgW4UCTjeg01g4zNu0wWeGA6P9czO+nT4YNRIabIaXZ44uc+BWHMnslTISN5JHrkmlVyeRs
 CvGKeqVYsPIbgcVlxhPl2iPMYjreNpvqLF94klBLPwciiiejfpqSEllVO+DZ4jFdJBk8lZQLmFw
 kDpCKXkiKLXFThb40MCgay1Jc3Z8ygiYRCVfLssiO27GkxqkcDFpsM5olddEWP40wboKN5qvZu2
 J3Xh6pVuTFdtuBSPhLGrntcPwe58PqpXcT8LeKQmi2AoOqpAjLkmAMe/zuElluFCwj/vR6U1Abr
 I5gw6RXumCHgh5Wjtd8y4wNhoZqV1pE7BN7jgt8rnZ4F/AEy0r3gJ8SgAdtX2n2g7I0z7tHY3vt
 smcyf9Whec/+ZGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c0ffca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=r3R1BFB3LEwGWC_32Z4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 3b5mAfDHFRIR83CYMfM2VzUKGtiJBahn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX6ovNqUJhclC/
 XaIBzC7c66Gfw6oMUuKcmcP4sKE9je5NJVyzWCzOFqIdyFdiDQZd/2DyL0WaJEBjhk/j8IeJDVB
 x0pGlu3OXOP7SnqmQHhMS40vKBvaiQMJxLISUKrhvIr7Upfor63vpXBSkSbSbCRARsm9Ikbk9rJ
 wYFcRkyMpQH6hU7RkXKSHKwYUB5QJWben8AWKPMUzjIE8TxHTJmhQirWTTTbukd/P62v36qGWsd
 xzAGTseGvZWnRcpF6SkkeIIvN6kyyhY6t5AgMJtCVUTMVGmAW4XROpnF6ymOOR9LNg9KQwQoUJW
 itF2kDPRN9JNVUukj4KUPyCGNfqdf2jLPdnz5c7xuAaBfwwJv8vmrMA1bdgW+/lRBmzv0cc7wR1
 IjJ8JeyMWA4/HXGl+7YldWC9U+7/njP/rCeEfC/u/+UnN0d5PVbQ85hvOGjlBmo+RvfMBJKOt8A
 ELkYMOlhj8uRCGpT+lA==
X-Proofpoint-ORIG-GUID: 3b5mAfDHFRIR83CYMfM2VzUKGtiJBahn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99132-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA4BD2EE98F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom,sm4250-dwc3 is already documented in top level part, but it
misses specific constraints for clocks.  The SoC is derivative of SM6115
(or vice versa), so the interrupts part is incorrectly placed and should
be same as for SM6115.

Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 94eda4fe48ad..e9e534f49183 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -355,6 +355,7 @@ allOf:
               - qcom,sar2130p-dwc3
               - qcom,sc8180x-dwc3
               - qcom,sc8180x-dwc3-mp
+              - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
               - qcom,sm6375-dwc3
@@ -452,6 +453,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
     then:
@@ -530,7 +532,6 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
-              - qcom,sm4250-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3

-- 
2.51.0


