Return-Path: <linux-arm-msm+bounces-93669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CINqKNlBnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:02:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B42175D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7B91302C2AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD30C3659F1;
	Mon, 23 Feb 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pN3IDsmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfHYRGVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDBA364EB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848117; cv=none; b=qa+u+DGfDJ+9l/MRNqUAq8jIbKm3OgCXcnpZdmKLhSD3J1i44AUIqsmlD+drUbCyqU2DKtCqGaoQ9T2EDKKAqJWYFCTPrmAFaOOqO31BZsQFIlx8amyFdxmQQ/OG1t13p74EDnnVWFtnVjXgmnPlOJdnm/HA+GhdYRDjvqHDyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848117; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V58/br5Mhe9YR5X7NJ8xV2QfdF86tqNhR52QhHZRlsMbvW2sf9kTQdCzTus/Mi0zC2omGYUofARV5RnxTw2cuqLDghzRogqM8zImP5HljXyq/mvgWl3hpH/ChHeskFHYqt/6cdcdeAhPEuGJQzLLWHavAhkCD9yKcsLnoj4OETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN3IDsmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfHYRGVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYR223409194
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=pN3IDsmvSfHM+xwQ
	CH3TYcCyMLCgG1GaFQ2h41SnTNPDhAXPa7yUUVyZRnhEtbPdszLbOAcnxYZYKEdH
	fXAdw0so4zu5PnU6UjCDisgmJffhi+EXNSwFhR7QBBZQ314vkTm1i+MQ2py13KWz
	RfyotsYVNosihG7Oo4yidM+WUAocWnS6SGt/xsaeIEWz9eLdkv5ps+WdV7X0tjAo
	rf66PPQBo7H0WMl+HVkWoxsS18QfVxK+3MsTdwoXGxZ8zF3vMmXG1qaFouABkfza
	4ogBdVdvzqR6JpNUYZEf4evGbdZiTGwbYWI/Heb4KTQhftXS5GF5IMlDAeJfYYGg
	BdpzQQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tr7hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:01:55 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4c27c728eso45625321a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848115; x=1772452915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=kfHYRGVtaz4MA2zsKKzwXYpTNAdsiONcWphLF0wdZ36LhQCTWdh3BrCi1CkahFjjke
         V6rt+2RjrPd96jWAFxibAxo9jUzkgzL96NMYdX1XbjeKRXZp6wcCTZgcGqYICPUNZJ4w
         MvRufjzlotv+srIrbgwZgq94MaEoWAddpWrRbWaL5hr1WG9JoOfG4H45FzVKBW6t1BPo
         EZAj2TceadpWtIpOXpFZuxNZrNjCwPnQxTzJ0JBhusOgfH/j4LYmA67UxwcRF5Zc0kAq
         4R8eWeoCeqGSLpv3mIYcOXThE5sA9H4UiV4AFqvd6gADa+z3rWLX0+xna7Hc4wd2IAk4
         164g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848115; x=1772452915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=t5JGIOZ0GyJdzk4FDb2EL/fgnqDWTig1hORe23V3vDQBG8pSSHrnxsNeyIXepwa6FZ
         KcrTwamFaxSQmReWBfdQrv+jU25xt1YCLLtPPkNLwmakHSyHTQe4ln99SDELSxREYmKa
         vvUX3rTnV85dOj+cDeo2nNCo9cuSh4bzMoB+dVnrTLVeEurSoRnYSWjtNHQz6IFin5m/
         IkhUQexEggNU20W3KlsX59GKVgugLe4GZOt6UyeZwQ8xqp/mWKq09fiHQiDLXxhmQNmD
         FkrPUQou1YtqkVvsjucNUV+dOC2MlcIm1ypLAmVLZUlNddDwep+OlWHiIViHthG8pUEf
         zsfQ==
X-Gm-Message-State: AOJu0YwW3hwlQEz+IPYDa3Dg5xUYfuxwUmQZRLyitomQ9FaPgK+PPszZ
	ccYHC0jq9lrylBKeJYwS+UIvswzXBHuWJx8EJ2ytzCB+f54nvWEAX9SiDIMPTKANE3cmWeXATf+
	w5bgPVEvYtXFWdtDR7W7is6cu6ZXwH9WjDDzLmV0NYnE3hJI5E3DklREUS1iiJoEAjBZ8
X-Gm-Gg: AZuq6aLZdJpS1TLAYjkAbkWe0TvMT2SLJYwftkmga6hZ++r+L1DJzOGnGafGK2zV4pC
	4YhXzdHi6xxWYKsFo2W8pwohvJMpQeLAKbtGZzkgIzMXXOMPZyJ6gzr+lLa6kxJsEO6f3URXMj7
	CPQV/PfqXAF7FVuLVKCQRkIUkBIiT1fS1oS9/TRhtYrtU4xImsS+cJqGPuHSgOuUipxOX+twu+9
	oQX12xqXEcxBIyLNKAw3kssbi9XHgV30iQQOurSM+Uq4pfzrRmXkTYkknOdvZEIbmGdDh6spNP7
	PTfmNK8mSWpS8PRRHaux+9N8lMHyOfinlx7Efb/MWbeA8zjlk4jheC7qpBTkKMOqXA9F1uZ2YrT
	J0yC4soEERvp20A4GE4pvvQAeIyzZ7A==
X-Received: by 2002:a05:6830:110a:b0:7cf:d075:2674 with SMTP id 46e09a7af769-7d516a5d08amr5937453a34.15.1771848114621;
        Mon, 23 Feb 2026 04:01:54 -0800 (PST)
X-Received: by 2002:a05:6830:110a:b0:7cf:d075:2674 with SMTP id 46e09a7af769-7d516a5d08amr5937411a34.15.1771848113626;
        Mon, 23 Feb 2026 04:01:53 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:53 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:20 +0200
Subject: [PATCH v5 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-3-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGh77K97ujy/AEvMQVGLqQDHUKNiSJVUjZJo
 huNVn5twEaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBoQAKCRAbX0TJAJUV
 VjwwD/wNFxvckY1MCknRDYRYcg713HvOycyHmIENyd8IIlD7fuXxr5aKHfY7H5u92zoVIAWVu+E
 Q+acZEdJaW5+7iyx3Y4R/3N6yIYE1b1FLeN2XZb/i+g6TWaT8JqQbXez49Jlum4JeWOKu4CpsVB
 Zrm7eKIFN6pY5wFryEv2/NfhB5TGpDGwtAbI27aKjzPZGpk7/IYtQuncxv/NWv0Nw8WBq01zjyl
 SOe8DDtLw+ioDn7XhSZaxa6wWABno8mCWOULPnOHTVEjAGPhujpFqth/Vz0xwamz+sVEKStFfk0
 svLuByp6ghmup2zlX+lBIYUZ8RjUVYQDL8Ux7wduuYKiGcdO+9VWvQv1X/UGBTd5gkxL7KhHXu/
 BHCN+6JXYr3U1NIjZn85yqCbD3ZMUH1Al460LDLWL35y2hpypiSdV1kkk6heLLK6OI3828zaI/f
 mZpDcFCRVizV+CcqES+xjEDR79gXPqr1UfQid3QhiRkOS6FW6Yv8128tg4DYpeOhjyXMarLzMux
 LqOx7VM8pKTP+IVisc4BNMVhtFF+Oe0a8yEY0JUbkMPzAtLSNIBAOEfr+Q2P7v4CmRsfoqlPZV+
 CZK3CD+FpgyB3DHfu9EUs0NlwEcRUIeQVr6qRJb1yNvHr59V+XuaoPS/Zd0ODDCmpnXU8JWqEcE
 R3DsjZxh0UoksNA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c41b3 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: QzD8Slh48M0XKeZ7pkK07bYW3FF3z_Gr
X-Proofpoint-GUID: QzD8Slh48M0XKeZ7pkK07bYW3FF3z_Gr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX+Fr097TYvLxP
 2UzkvN6GQHWQ3RcYeOHD9e8GX1VKDbBic/T2kkm78qJqeyrF+ykGg93HJ7BJ1bAaAWMl5WohYqY
 wn7mIIarSu77tQtuWASdLDG4u10fLUA9FLi4dhYqhwtF1Iv1WpC9YZhobjTybPceH8xGwtSs81C
 t9hTIKCWu0hZWAt8LP6tXyFgg4A/x5k0Ve4VCzDHNL2NFkxIoJpNjtVlCVDE+KqhN9YSE3agXyh
 CviIK8RPpqrOFPcd++Uom4lWo8qmnT902TJNu4WP9YESeWI2waKENPhRhGMC22RCoIRGc7mkdRw
 HFUKqNTG+EILpIJBgF7AW2YmBJFCRHvmqE1RnciySkB8XFTzKdzmLe1rv94ryMZ3yjM4F+wNHuB
 X8T0GPImyfcuE8EFlpwA1xwqvGz9N2JyDMrMnK9oQ6bCHtKpw8XbIMCOQnrymsfkF0sNU3bAY83
 +aaDt2uGjVIZh6FpNpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93669-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45B42175D3B
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


