Return-Path: <linux-arm-msm+bounces-92955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EtsH04hk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:53:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE7144316
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC34D30867BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29C33126D7;
	Mon, 16 Feb 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMsQKr/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQEsS7L/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418A311954
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249406; cv=none; b=ssWKzNCSn/GOKmyYCG/dlU+zm6xf4052vQ6lq/SYECMVY5NfVFmmwMxVBoGlPBgHgNYWNNaX7Xv6mIsDIrJNi2Aiqu4C1SsqMdCUSSVJKUvJJtfc5CAbjWPMRRAuzerSmwwpTPY2WjjpzVnQWH5hY9/QBXqzb9lrStpWs3nBQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249406; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQdk3A9tw/axmJSKsI7YPeAlhBGga2tUMzV8sUKpAiPu2Q6dO0ULNi9UkH3gn0e8GcUAM7+2eWyMmuYuemC9bKBu3MVb121WepHsmKw14Lqp3S6tH0bcSGrr+DCvn4/L/3se9yq5rmzlpkgo+RvT2mPwyT1aCfhcb4ltjhCj2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMsQKr/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQEsS7L/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAkdnw2221238
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=ZMsQKr/AKn766924
	faeYOOkWHxrN8bvPrVdUGhUNjS2Ryugf7WYOec/bAzjiHBIcMVd1DJg5KRyE1WvZ
	TB4IctYbEj45fXTKqS4rucNlxz9aRBSQgi0SWsTSZS/wBvHpuyeKyweK1iVYDu+Q
	S4KZNeq/h9rxQ5h5CU4cHh5uQc8vgiWki4E0N4T91yerUjVoHTWyxIKOF03Bdwh1
	pLwDTE67uUI2ijYb11OO63iuRgnTV0dfGcd5L0GSC51EMuZjFJf9qscDU3KvHoi6
	thvAJ+sj0wToSwJrrBK9TcNLzT+TBi2OMBzvV7p9LDl/O5BApWZ0N36uFCZ4ab5h
	GbXWwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe64kcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:43:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so2588672485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249404; x=1771854204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=SQEsS7L/FMkbEuZkl64PwJI8u2axpHpYRLscGdO3wW/B9Q+p0rHYdY32IbL6vo8Gpj
         Pln7N1i1zM9Zu4Mt0Gd71/yu9A3DUrkndKk0iL/59XK/k/zZuLVvaNe+07HOVPI7d2JU
         hY9B+RKkGuinuH15UWI533mebxgiEGm3RTZ3MnOcyOGL+9+6MzDntz+anKCZV3zLmQZU
         Bes1ZNu0dSQ0M0F8B6xKe/i1PyV+yivB+w3MrORf772l/MaxJQP6+Sa0b9iQDSk+PeJK
         O08/0Wkyrj55zS5Om1z26ZlrjJbJQqGnybpZOOlYaawbTJcpJ5zDHB0mYiMMJe6R8dZ9
         xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249404; x=1771854204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=CIHHOB8UiS1Tj/nQSFbeejbddpsZCCL07Kmp1W6rjxmmvkIWEoKJYU5V2mse4sr6M2
         pCX/dZvbR8FKXJOYmHiJg45C9o4Q2deRosntJyRQbpw6bPTnv3aJeqP4t4aW8tGV1Tgq
         eLPQz/lIUiuRcWf2TC+i/q3kmgQbFtsUyTxU9+PGAK674s581JLxBf58/7SUuRn72lox
         ZCh8Z6ZOlIBwihWGtky2D0uCGkLTR+RBTmVqO0BV2K5rFCVF2146LQtTK4NYQtmW0V9D
         RzwwD+NQVQT0Ay9lL8YgFy5yD73nzMn9EnvNvY0ROv8wMVFPkMXZdXQDTDmQ/W98rmOt
         j71Q==
X-Gm-Message-State: AOJu0YzuILSh3BsqdRHkEgctDyBJYfTN0GTKDU74DcmQj+1sblqm4meM
	j28UMkXV65ripYc/2Ol72AwE6wA2siHvsMhSy4pYou8+eiT9OKsUsvzZ/XkNV+4Ii55xDDbUcFx
	yU1tNMBqgn/J/+ASVrQH1OiCqKL1ySTZWB/BBUtIsfIXUUYxXeIEx6K3uAdUwtfCTi/JX
X-Gm-Gg: AZuq6aJGiLZzbt6/08KQ0+TS/KtkizxsiwymQRflHDBB5CsS+0QtvYHEvFPIKmVyCRN
	o0zeL5V44u5rGpR8Ns7KL1GkOG+hQgZP5DZK7SOgsRH7fsPnGxKc2V0ohE8ny/pAplnXIQRUuN1
	1Q78mw0PLB94OVhP87q4SVlmbuz2SqdJhFQ2CulZK93i5mCdzr60P49UW+V9vZTknVwzdT28cLA
	HXRsgDp2ERLF4W6KJU3oQG3E2oUWeFJbdOeJFWUo6rjjbBP08RcstjrbDBNzheo1G7zDqPeqG+z
	zw0RvkRFglGMRjnUb8IGEA0/op5zY78UYqv8ghy0W1jz306KdLKGr17Vg3uBl286FRzChITy5oU
	wTCzTMwfp8aUQPK/+bx9vcs6CCDXwcA==
X-Received: by 2002:a05:620a:698b:b0:8cb:4059:a90e with SMTP id af79cd13be357-8cb4c041a43mr960459285a.80.1771249403583;
        Mon, 16 Feb 2026 05:43:23 -0800 (PST)
X-Received: by 2002:a05:620a:698b:b0:8cb:4059:a90e with SMTP id af79cd13be357-8cb4c041a43mr960456085a.80.1771249402904;
        Mon, 16 Feb 2026 05:43:22 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:05 +0200
Subject: [PATCH v3 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-3-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7v2otDH5sb+vzDJgwVRcAv+NbCPxufSR4U6
 +bV3RqJQ/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe7wAKCRAbX0TJAJUV
 VosGD/9lxzRsPm6lvcyqbdl7S0WHh30MZ9GNaEnOVUywAuYse8Z2aSVI9N0HxqNnb/ZwfrrUwaJ
 lMqChiFPzCFiwWpet8RrCB3dMX3X0s2tKKRuLuJsx2/6BYvIYHuoBa3NWLqbVKhy6PQGGCI8iwi
 qmwKGYGg+zyIHfv+rziGowNSiiet4TnAcznjhQkNIPBN0YpGQngEbXtsSAPUUXWyOUvrG4Jb+gY
 HH0tS0BfGYml+rglE6oKhyC3Z3GJNTPhE9xlcx27UFnnB1D/x6Zl1L/0td4DU5c1ENnqDchLeBq
 mdQukDNM31fZ8zSI4CRWyo1jnlk1grVn8fsrZNItqJKlmJ/gfDzrmlyCW6P/+Fu2NBVJPfy7nIz
 n6oF0LPepMNcpGVRS22Kx3bISBsnJzb3WTiG2RDYHhlN9DYBn9chVjnaVpc59wWo2paqKTfY311
 oFwn8JH+NEVz5rPyt44FXmTsxlAWVlNOtsTZm16gg+/bVe6AtsxsvNzEcQD5avMHkArtAdjNcpX
 rV41BaT64XBsvZzLDMhcL3T6fcLgbjYIH54CTtIzrMdsoKqA/LvWzNE+qzglg6kIiPopmz9U59L
 cqZfkuugNnN35kEynINupqR6H7kY61361oyqCMdbNhPKpzvcQjeQyfB4HeAUGWRYe0Ywl2xFcDY
 7Z6VReUUbMrtp8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69931efc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4Wh5VC-pPzy4Bqg2bPwceHfz_0G529G4
X-Proofpoint-ORIG-GUID: 4Wh5VC-pPzy4Bqg2bPwceHfz_0G529G4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX2yPABVRShAaw
 J7PpfNJuFJh6Jo19e+J1nR9xrS5F97Xlm6llssXFp2agRYTFepxIUtZQlEBa8MhRyBLlcRbrJFe
 TqASPDNVYLv+477sFEh6jgdwqq9L95unSbuGBpx/RuuBkIZAmA2rAmSvI80W0S9bacg768FuEAJ
 QuKi3KaidSG68KAs5E9nMhztLsqUTrxNWgPEtBvOi2bDI45CcjxpMA7OoUP0EGDiyTMAwnY18fU
 OIUoFtoe7Kgo5jIfHUhUph8fthkEw7UVwBHa2kcpq2SuESwpFHf9flLlXi0Z+PRcLYvr/9hJT3K
 9lz9YDPcZ5KoMY4jd62jKfxHr+BUx9Qu1jHnJ5M1CkZBsINiTakI5nvE6bkI1fGYgxCJ5qMkmFY
 6kR/BtG7SH84DlBwuMWL9kv0NI7R0fu4iCGTI+2eN0AbQCbEApsq6tAOIaevK4UMslO/QXrTr0+
 fsHk0HpTDF182OrmG6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92955-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FEE7144316
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1


