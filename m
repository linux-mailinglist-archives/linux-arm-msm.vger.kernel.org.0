Return-Path: <linux-arm-msm+bounces-118898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L5hjBo6YVWp9qgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:01:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F17503D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GdFVVWf3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CFhAaXRW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 903C2311835F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DADF371887;
	Tue, 14 Jul 2026 01:57:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28812C534
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994275; cv=none; b=Jla34yGJComm9zxVFVbegOCd92XY6TmTHi13y7hBDxcmi+AXgLnrgiX2NsdJYN4X2ZSgZtcVIuSo29rUqRZv/QCTxo+u7wNKH7FjMaEMLLFsOmbfe4qIUSQ0/nxID+Qbvz7Bf7yKk3P8HnDZkuD+NqB0zsinS8Y2GK8Iw2TkDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994275; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZbIdwtLDuaVdHar3f2t6XdI7mCtd082QZMqcsKdi+RW39DNMCkKCJaQkSOQG35bGMdcti2PFLPpDm3XHQJ6Wjzi2+g7lA3e1qXP/CbPM1kY6LjPAFGwQu991Sp7ZEtYZ0MKCyk42yrhJ7h3ZPGaYpUU77UcKXk5yaQyn5sJk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdFVVWf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFhAaXRW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNn5cH3062876
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=GdFVVWf3TfbkZG2Y
	ZEXDFOc5++40fuiyQx0QM26CIhBkbPxbkOTAxrl1R13hRkEf6SdW7hR382NN/Q9j
	u8QJQxoFBsgkejxOhShH35JHCc9NLcn6SbNNLR5fRdV6k3pFfzGtAdA4uMMKKLDC
	QEAER7IIPXw5fH9e7RPre21/dFWA7vCKQp6segHeHdOiUsSIxEt6RvbVtFzs4366
	dvQwbSUQob1LThKD1mbuzp9OW5MJ3ZsPQ/IwOllR5XTY6jhahurQ1AjFLtvX/hy7
	XCg15Ao9QtNAf0JTY46Rfcx37sqY9Ek5q4oEzsxGrJPup26xAiiOjBXCQqCPzYbj
	T8UoQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda3bs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5402916a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994271; x=1784599071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=CFhAaXRWn+7z4IrHsOrZf8QQNqwhcKcWcwnYItKscYv6GovFSw1OCta3jZccyn6T+2
         axAE3lklbcWgyr7Z31eym3HzRLpSIni45v9cPQX0ERqb/ekKWmfowYvvqiNyxEHWYQNq
         2UXe/y2BAnGGwCifRDl4tn1zaB1ptTctH2xkhjCDCJvMwsqmQgEkmJoyjZN3wpcOg8FY
         36xHRkP64nsVDRSfeA1IAe9B47y/pAR/g0j4CO3MOh1hYamm4GPo2H2JSzGZ0W3lnZO6
         rTaJD9Das4lHFRTLtJ/aYsDYLG0R2Pn4OvEGh4zrt8K63durIxjHpQwxO4WPyJyF9dJf
         qrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994271; x=1784599071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=bvCPVUG1aJEeY0jWeqVkK1KmlkZ/BTCVN0LwB7NmAjSkAq/tFpCoDZEg/KqNyjBDKK
         ysHx5cXZIhe9Dq0zLNmOJyFC19zh12nSbzM+RuoNJb79PnDA2KXO99Xg3SDbmJL1pDVd
         qttOD8cVlfWFfrK3wTqBXhS14qDCQS50fnkfkTBIf4kec0k2cIepk+EzQsSuGe7b9Y7y
         +bzNCFXq+s6AGJm3pz8+kOS7RAvKc1p3TFYLNtLiCFv5osT3R6hdgjVP5e+ysuXczbEi
         Pmgj1UGg4gvfYa9jssHUpDkH++q2H85SoAqru47JpkKpRuyizc/z1JIf17l05nh4yY/Z
         IUiw==
X-Forwarded-Encrypted: i=1; AHgh+RryVSvcQ1LhKt62XEM3FICNfhY7VqnSi0Pxu25hUDAR/N85udxdEyP7RuhC46WGt9IzuKAIEzsPu9X+PaTH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvi9s/Yjv6zHWMCdL5WX45zErLCqnzuuNFAph7uwhqhlPpX3LI
	HvKN6DGIjz7kIzYk1Y5mALdM3c+KmeSZ39Q0yEfo5/oLc9l80UtsGGFnHq9WKbPkyqWOEnOvS4x
	5c2RHPjBdZpTVtZvplpR+r1vZW1V181yi7HLwBfyxV0Y2aT/Oux9iV0z68aPpOCzoK3aE
X-Gm-Gg: AfdE7cndY0OEyJq2p9Q3COrMzM1TPIl+3teWMXeciQsrb2/7mcZ5/z9EruLYBUa1I/W
	pMNLlx5/qglYQsJzeRwSEwF+k7E4xnMsHkRj62h3jzj46lqR0D/qky5NCcrAVVXac8dbL9tL+VR
	Cz6oOzmjq9ryFRCE4HvJB3/En/vzlDQXKUyXtnkisw6DkX5NIoQf6vYEJZ8nwK2xVNaUSAv0otw
	R5vc6HesUuFkuqe+Y1Gt1+Yj+KUmu45Awg13k2uFSKNUStsu3E4OQ/8OSP62uRGhyJT395nbUXq
	Oy/HLi5BmYTiQbYTEJo8JUUp4p5XdoRC6Upw1OdDxlhp9C7HWotH8jYavcU/8eU33mgq6T3tO2i
	uC2xoS0K7hYkPrNT3nQGXZnOW+JS+2pdIzPePCsTop0wCCiEK7/wgeT1GBLKHh1soOxm0cBhYlw
	==
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435676b3a.14.1783994271267;
        Mon, 13 Jul 2026 18:57:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435657b3a.14.1783994270836;
        Mon, 13 Jul 2026 18:57:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:25 +0800
Subject: [PATCH 1/2] dt-bindings: arm: add CTCU device for shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-1-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=dFnReCQgB1F4kdP6N3jOcn2Ya1eg8bL+kLH+qKY8JJP5w1AWyBHlggG7AXiRu9hPYu4/4MrrW
 LCjAADl1NfFC3xBVmDM6Iq1YOeuluTQfFmcIKhbdK2sUMjdi3FMnmzm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfXx4Ud1/NaipBQ
 vx4X6yfJXfvVb3NAY9aTG3d7wJhT5cuwrlXXbbw0eeFHo4H9/gAGS+U0BjL7mb5/TF/hV7D8dfa
 1uFqy2/Z9CZrQb9689JiebZLnH8NOaw=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a5597a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: TU4Llyv1LA6okpwdISDJMdhPjIHE7Tgf
X-Proofpoint-ORIG-GUID: TU4Llyv1LA6okpwdISDJMdhPjIHE7Tgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX71Uq1UfV/jmQ
 6z1eHhCuTCyCKVDuN2HGp3o4ar6Of5SQ7BNQMssl9g2c0LJ6FPN//iuHalz6UvfHDCl5icWflZW
 ARSw9jk9A4e2HKxEQeMr9GNfFDoU2Pecj0MwDSPN/FgPpipyCd5v8dXTT9AMVtcR/36omxETXYe
 gysEk0huOQ2Ggode+z7IHmyzs9+XQBSsWcWWlKS7Sft89UuJlCY8TiNSx4NxzplLWXLCxiPSb+o
 2xuen4I3ApmWit2iNAqsDGv5MzUCyOxsxfEspgY6kYyzviFHdiwtSSbvd6f1xzDk5hgvFTXPScB
 PcYPnUukOMFy4sgcBKLaSkU9SkNs8K7Serf+2FjGPWJyJuJAwLhpKTymGrkULvv23AN/NaG62aW
 gqb6oEq1R169C4WUjm6Zc3I1FipcuuJCsA1y4D0ieJR30H8fv4H+kXemTsTAFMPQRnkCX+bmpuG
 f2eT137qtyFXkERLhzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140015
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
	TAGGED_FROM(0.00)[bounces-118898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB8F17503D6

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


