Return-Path: <linux-arm-msm+bounces-93606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMjkMVwSnGkY/gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:39:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F217326E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DB843003418
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DC734B40C;
	Mon, 23 Feb 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omjqY1pk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbeGFjzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E234D4CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835993; cv=none; b=cJIyr9q2mzP9qrNqInmeasi9JOjVRmqfdzqKWLcPQ18cO5V583IjgWKPkzRIZv+8vW2w+Gq3TSOPoLZfmsowQ31hJDSnJA3huuICRmb86K7I+lPd99iOTg2omDmdS+TYJx3dzI2NY1q+u0XiHr0x6gKAeOIngHayzV9Go1DiJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835993; c=relaxed/simple;
	bh=grILvU4H7RpDG7Aav0NPtZio9xIoXx5x1CUd1XoPRG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OenJmTNh4LLC+b/0UgiCI/GtSlc0vNstFZTY240ehy891tv7uO34xp3rdaxufFIiqZ036na7iFTW0pMdsIwxRPEHKoJmeOZ1/Q709Rroah7Ydr6sPF1XjHIjvSOkoIMf8UGmx/whBwJCYFdBNOOQ8GUUcoWAZaBoS9fyX1GKLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omjqY1pk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbeGFjzN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLFAVp2080266
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tG5+bKknP/D/SI+HXxAYZS
	QtxV6PMcnXC0l9j2QrbGM=; b=omjqY1pkipMoQIMJ4ND9S3inKJbZCc8/iO4dDj
	4Z8PVUcwyb2wIkvElo7EDgv6Cpb7H6Lmgjm9Arh9M6rhC1EjPxolcl86tDz9KgsM
	aNsrNMB84d3GRIyI7FyMWnTX9rLMxytQCgKtiDDi8kKNZsoOUXVZC86nH3lLqu26
	itPdB0wYl4gRdheA62PIzZ6YeE4b+z/27JI1EGTXYnrxgM3PLVkbotKXnoCAW7rn
	trl9qXie92K+PuGzIpa8Jdu180DvVzjpdTdW6B5G7DVMNfYwPlNB0wDGADFGhjpY
	JM+86cDJP5kk1a3g+kVG5rjbAYJI20whtmwvZUErcRHd93DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3uy0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:39:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3d11b913so3811564185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 00:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771835991; x=1772440791; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tG5+bKknP/D/SI+HXxAYZSQtxV6PMcnXC0l9j2QrbGM=;
        b=AbeGFjzN7NQVaO6tZtmuY83B6HVymXwcDl257+IreQPE6Pw5uXUXftnttFudi0Rkqc
         2bqNx+3vG8/Tih4wkYMFP5s0Iq+wFjK81HDxM6QF7j5+kc7RNc66zGhoVToUhNavgtJ5
         yClrlzhoUwHIfCerc3i0Avj0xiIIQR0ElvzFeIhs1t9JcoxwrILtndcrEOddvH1Zc9Kg
         3HbtHXUS0SDv6pFWAbHfzJ+CVhV/or65xi6yAbXw4Wk/swwKKrnlgdkeAQsAQ+Yp6YkB
         mytqyngfMmiOtJZC6rc5+ZmzD1hW4Ufbp18DB4Z3KxNz53gDcqxQSrZ4DPZeoc1VeV8m
         w3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835991; x=1772440791;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG5+bKknP/D/SI+HXxAYZSQtxV6PMcnXC0l9j2QrbGM=;
        b=qltiFNtkJExqGmrTQVWskWzu9is6M1MS+YLX5L91r+ETyKCxby+MRM8bU4uAc57bsc
         j/hU8LRHIabL+9uoYxKwgOqK7BugZ7QNi13A92ROdKRIzY3xMXdukwfCQBv+zEu6zJEZ
         Z6NkoYejKqNi7Rc3Lj1LcbeJcpryGTI+li2kn+C+ZZpN2XieN9NTi43dBPNcy8pM+TEE
         +WOIqAcEVgUP7v0r2xfG7Ee6cWE0QnxrSNmW2daddoN0gAd4iLqKZFdqpyF9TgZa9xaM
         oz4TUWpEVSpEBzEqzwzh3q3FBgVvFAoKmdbbKeRG7yatdZtylOk9GIsorK6xypIfE80J
         lsig==
X-Gm-Message-State: AOJu0YxQUlXm2831Xadzk/N9hnSYnZC2AQSUYZTNR7Nk5i/XUFa1Em4I
	6pPRwVXFdoud0xBm6nkymAeeFCAG5MkdL/wf2i3mcps/rbmOq92XgXTAEmGoLKlxRSY4wxVcF59
	wuCOP86MxTH1UFHg8zfWaFN+tDc7mRcZWg6+bYKCRxbQllqxGsqtCyEaFCmVDkjpc8/uj
X-Gm-Gg: AZuq6aKQVjrWtK/17AUPUp3tZPsxYILYGdlLMXtHwyw9ynXNSHxx70aezM/pFXjS+Oa
	nvc8e24lYVn4oBSN/rgSmxp5R9+Qh13KwimATem4k5i8L98qZDSHeU5UEkW7meZ6MakjiX+i4AP
	JnDqcgQBf+jp1SlvjjMh2nbaLScS0sGf6jtNk9GKaVxTnuM0zHIeCX2cFld8KjcFoGauthMDBDS
	rJO+OZ641ddU7Ptse6h3ICz8TedN+hNfZpEDsebUKUJ1cD/sMRgNjRBiMBrLvWTzlxSRGoFQLA5
	PCgVAkmmEGvYzQo3NIT0A8BxelYhEGEyL8uJa002SpPhS3c4s8NSHU9i0vgb03CZ4zdhoz9cjes
	lD23KrEAkdyyfGCNCIK7FBVU/BL9gJQ==
X-Received: by 2002:a05:620a:4551:b0:8ca:4444:26e8 with SMTP id af79cd13be357-8cb8ca8c3b2mr1144744785a.63.1771835990581;
        Mon, 23 Feb 2026 00:39:50 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:8ca:4444:26e8 with SMTP id af79cd13be357-8cb8ca8c3b2mr1144742685a.63.1771835990008;
        Mon, 23 Feb 2026 00:39:50 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9f77sm19573840f8f.5.2026.02.23.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:39:49 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:39:47 +0200
Subject: [PATCH] dt-bindings: qcom,pdc: document the Eliza Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-pdc-v1-1-fcb17464fee2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFISnGkC/yXM0QpAMBSA4VfRubbaTmK8ilwwZxwJbUjk3Q2XX
 /39F3hyTB6K6AJHO3uepwAVR2D6eupIcBsMKDGViErQyGctltaIXEmdWIs60wihXxxZPr5XWf3
 2WzOQWd8B3PcDj3+v3W0AAAA=
X-Change-ID: 20260221-eliza-pdc-91084ff28782
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=grILvU4H7RpDG7Aav0NPtZio9xIoXx5x1CUd1XoPRG0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnBJT9pG5x2DCUfbdxdCVc9fVBsJymgHEwLEFY
 2UMP07udVmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZwSUwAKCRAbX0TJAJUV
 VokyD/4zpHSbWpc/krPY57RcrXpNiT38JKaSkO3cAuI49taVXD0DaXh4DEIoUnyJvN+V5iodx3f
 MZk0TL1YDx+R2k1rlL0cR5U84r76aBwurKDDE2bWc/FmZ7na740yTX0umJpFxRO3RHiLDpAAlgR
 xct3mKQjXXIMg0iB/NC/8F/DqT/jq153rYQiPCi1NmKZsUhbYpEGAGDsPSVovZsw0LhbdhCDyCe
 kanBbe1WGRo41BnTuh9bqfH9cFewVtjJF1zI4UITFP8g9CU4zjcQUlYr83Z2uNCLoavjQuq1RrR
 sbb68zmRbqoiidEyBL1HSWjHu0+c3YjOuyKJgrBZSQC4kLQsTR4wmCsqKIrGDRpQvHalr7mMgJU
 VES37XrRFlm+DY5deVYZ3IHFPTKagV5+hPgtN/wySkLfhOmVDDGfuY/WSMfH5c3Iy2XMDqGpJfe
 twtzE3WytSiXOLsuHmRLw9qLEDvyk6LXXP4R9onDGEJa/EYfh/gPbAdmwlqJ0xk99hiwgAlBQGL
 zzM3BD4PnR5RlzJZ9wJDuSEYDeAClJrMw2++DDyd8V31RupX4IUu4rYOFnaTHphILN2OirCOAFq
 OBv7dUGqgvQ5mJo0K4YqGTHAkpHllQzFprjsJ34fUWm8GJ88Wn91Gn3s3lNqH9TI6Se0PBxCWU0
 eCfrBkoro6iE2KA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1257 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Pjt0bzuEMq89orxaCbYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X-REKA_4KpGnpDORckCVh96JIIGumzXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA3NiBTYWx0ZWRfX2l9ibtQERQC4
 d9ooPJdplnfxUut4jgw9svGRrEIzy3PYBzJznd8ahv/YW2MmTtQO6CHdfO/Jmb5NX1VTQrGh6qB
 kBbfK7zNJxJdhA+fQ481OQGsNy9PCTJn1WwnNfAPBCVLcL5ZV7YOhU00dMpRngq7d+E9sJpoSGe
 weqiVOs1WB6VAoYRRxSiIn7D1urRgnstW8B+dCTaBGbjnDfcsN27UF49H04rMKe9Wuy1jB8Njh7
 3qt+pEOC22MmksIMFgfNz6JFszXajRTDTLkL87djpqgE41FCSSOrPhMnF8E2mpw2ygIYC4hYpj9
 BYkkBYplWfG7kP1JAmi3CYeXTlrIL8TviKikaTUNqnvX/aJ9nc3mArr3tarxrfC7NTUJoh7a0pW
 2guRdocEgbKAjOYvywbWnRlpW8Xsn4SPjlbcz7X72RihsGX+iTmXqkv4vq7tHW143AC2TjYqSAq
 YpxMbdVhVf74mIM+x7A==
X-Proofpoint-GUID: X-REKA_4KpGnpDORckCVh96JIIGumzXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93606-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 448F217326E
X-Rspamd-Action: no action

Document the Power Domain Controller on the Qualcomm Eliza SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f9321366cae4..5ad68b2c6fc6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-pdc
           - qcom,glymur-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260221-eliza-pdc-91084ff28782

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


