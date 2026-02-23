Return-Path: <linux-arm-msm+bounces-93675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9Cb6EzpEnGmRCwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:12:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0667175F08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 682C930789DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B529365A0B;
	Mon, 23 Feb 2026 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW8CJDJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEMcHmDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D41F3659F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848494; cv=none; b=bTgcMxYG7pVY1hAoyhlJTi3x0fhSNURKDy9YGMgOZeOJNOH1UtN5vrcRXl+QtGYq9iOqeEWqT1S8SribCFkBh+cNgj+D2Vwln/D0v72Dqehuhfohuo7NfK9vo/5eEIkXF16yWVHteQ/Bv2fdzXbtIiXIzPHoKiKyF9GgOkACE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848494; c=relaxed/simple;
	bh=sSYP89Z8JomH21HJk5Yj2suzL+Jwq9KlybgMDnBolRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnNhZVhVxiI/QokpnwP3+QQTMPr72ptqNN/plEDttr6/UmUp3BOXAM8vrCwlqS7SOHkqv/OBFAt7I8rP74QvgF26QV/WmsqHg/uDIzZ9X5NSVm1HKHF7cgkYfI3tNTxD8FLi1VU1RrrpSR3Lz6kNkcT3KYa27JKTA5JPfa3kl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW8CJDJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEMcHmDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWDIP3732694
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ldZyJ1c5TJehS+F2KkRUcZr9NMKbSXHp6zHeXOoE7M=; b=eW8CJDJ4t12AvLQP
	yfpwgVHyPlAN7PK5JPEHX5XDJuMPb5bbkXlMjgkyL75qeaqhT8pzJNPplSRJTCh0
	H9izECj/ZWH5cPEG68p1u3eE8aEL5X/SOEmfEFq1nVhUkyajvUG1jBk1S8EZloZ+
	YELqq5lj12xkhxXS0RU8jjLxXWOl3q2wjYwH1AZdseZqL1JH2O9aZIz6SL8QFmZX
	v63A9vh9+/ctjF3grZ0PDDC3dyLIe5zA62h3Gp3Yctvvzf2T5pH8PwAqc3mY0qA3
	qVdaPM5NAGZ98WApA6M3ot7GHidAWSztLhhnsSG3+lGCJvXjdrH0D8oNjpg0uesX
	GaswcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t891m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so6573657185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848492; x=1772453292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ldZyJ1c5TJehS+F2KkRUcZr9NMKbSXHp6zHeXOoE7M=;
        b=BEMcHmDefTPmzO1Dr9SBqk4UbOKElUxeXTTmQE0+ozoR/k590WFxl4nvM8EKZ3qzRA
         9uaB7EmiYuCk5eyAusohgqOg+HYZK3ipVvc51xCd23osoBgpEU+EIN6duC8yIuV/Cxik
         wUReC1rVY8RlGOSAYKNrDGFMqz5QMQQUCVQT7JayrSyzsJ1elIlhM9/mvn5fEHWSEakB
         XjurW6rcXbVqDiLWa3LnPDMhBdUNrE1HeK1VUBvU+zohkQKVei7p0hPirhc9j8pIncGz
         NUZ7IaUcMW6YxmJzSlVmOAPr5x6oGjCRvqQcV5A1qwPl/Abdy2VrM3UXUtsCReMJjKyq
         w+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848492; x=1772453292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ldZyJ1c5TJehS+F2KkRUcZr9NMKbSXHp6zHeXOoE7M=;
        b=VF/kytp+WrE0Wrv6asWWXOl4UghNkPka0q5RF/jvyAYhN7zTREos3Nm1iSKGCHzw4L
         sbZcaKKdIsJtgA/rjaAH5dk3J8Vq1UFsgw+oA1O+xTDfGln7jCffGLJOnv5qddPFf7K6
         +CEf/nmymHenbsVlN4h8Rk4NCPfJ9wPZVC8/iaFGC4aG7bDcJtOttnxaGcG8bR2Z3AfE
         cRyczLDgkbCnM/cZb192/udWQCkuyr83LQkqrC0eTUhtJcMBrh5Hpv8vuJLJcB3FPBpc
         ir5OXFJZqOmctIg22KGc9Oagw1fnR/ktSw9gXh5iwkBpsh+O1OXHly1+TaCYD1PETEQM
         o/Jw==
X-Gm-Message-State: AOJu0YxcOnTjzimDlc1rXJbyG6WFLMLf16D2IxwNOeARxDbhfvi3dN7w
	SiPRc4bog5WkgWIywBc51lHgkg8iHXFLl+V8B+VSlmi673Ve3cMDsZhjO7IRdByEDljp6U41DRp
	8VqbXq4AbmhNBqfI6LCZqU9EhdvvZDSmStFJQtkpdhQsgdWPE51SNUn/ZINP/7voEhTkP
X-Gm-Gg: AZuq6aLfZRIXH8AXPPVuwlzk1jMqx7BdNryt2QdT1kKiL5txko0PwqK3gi203JQ1qc6
	kTfpNOb9dgNsxamyaN48DU3SkgVqfF+KS+/4F8CfTZXfqZ8pR49a8m5ozLRkkLTLZHiLz0X0K2b
	uwu2xCz1C6trp13eZhb9lij+TvBKBb+/a7lKH8Q2IrkbvDKnVcWiuwThBp2CkZq3VqPB3le5wuh
	L8/W+p/I91sMoQhKJ0MLIQngWhTKfyebi2y5YCZfxrFgPeDV43G99Z2Jp3kzrAg8eeNBg9BzdeO
	pboVNzFvWfXr1L8lxr2lyggAIW5XNT2V3ORHq0sIyTiDr49niDDPzcNUQbvWKzZ3kTdoVFK/aH5
	ORT0L39DcK6BM7Wp/K3MOpTlzRhTjyA==
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr998436585a.38.1771848491683;
        Mon, 23 Feb 2026 04:08:11 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr998432985a.38.1771848491126;
        Mon, 23 Feb 2026 04:08:11 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm16522603f8f.24.2026.02.23.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:08:10 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:07:55 +0200
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmpd: document the Eliza
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-pmdomain-v2-1-23fb87eb70ef@oss.qualcomm.com>
References: <20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sSYP89Z8JomH21HJk5Yj2suzL+Jwq9KlybgMDnBolRY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEMk/2OkHJsTDoa9e4HTmnyC+zYgcOwHyrL2Q
 yvfZIDAZpSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxDJAAKCRAbX0TJAJUV
 Vu5WEACtAPGv3MQ61wNrJmnfh4/74kwgdieJ4bZARvJggcdNq1Lpa1evHOGrNUvNb8FGr3/tIY/
 vXTv1MLno7c3dozMJ80mL+ir4SjG+lquMDQDiheZRxYMispV+swbGs665AnyG8SKMZBnU/prNJe
 MG0IkJJnLGxLhzR2RuUBsDkH/5DprfzAAGbfuPMZCGR0dPfG2CcaiJsiiUkGu2V/ZMenS3kXT9B
 BnJnzFtCVxHyd4npRFlzxVLOiDc1+sVwLk4/7CpLQZv459PVh17u11+vo/NUD0y5o18ta1KGqe8
 X/0fBINCZjpmTLgaxx4ltRG6fmDVOyo7cdLvSS59V+KDL8jdtF9f0wpbgLfsdNwK01IVeg7tcm/
 iNLcokJr2XfxN62KtRGrDtzWHx4Os3zoWXOLsOXDm65W/RaISf7GmmQ1dzcNHH+sDyGIHfTSx1H
 2E+8gm+aJZagXLpMn/fk/SY1cFzJH52Whjv/u64OFf80nt14U2Xtp3ccVdilFNvq3ZKCHBQ2Evk
 lV6TzOxHxvOadoTxuOIrh4pNn8HuWLOI6+7I3e/QQQ7j8fV7XNoCoKebviMV3ypVY4Qvhp+3rPk
 tcZ+4Zum4/QH0Qe0nyWZdtpRpNUn8luhYH26yG7+gYjG4KBCYW+5JErh8WtP99dtVbBMc25NixA
 hS1OQQ0kO65LXgA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c432c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-qkovbBEdaU6HcigwZ0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CDWRH0RaHsFRtCmCwxQroP-FgitOXqdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX5AnNZBwxNGp5
 eC5bVRhWuTMETvxxxTpJPfoBucjFM6iBIOV5pFI2EMlSdfx7Tym7Z14snjrf/LCisc6NgIgR/AE
 +fkrxq3perPrAeTsNTA7XAZHRm6l3xCf+SCaGzb0d54G705cEQAjYM18uyzHV0ayTcZH6uXbQNI
 ako6A2hsJzQGpzVfZXQfl8PyYpkqvkdybqAA1PNgaekIY1l0E/C9wlRG0bdPcK7KNlBXnksCBbg
 1/SVesOKTmpkj7mkHHCWp0/n3o8S7fsceUNajGPOB+kUznrzNSQLmbPiMjpuzsO677y4SZ+P0/z
 qs30I9EGD2f7QzWAfjnqvqz4gK71jBzxc8KGNlUFNvLQ7F0/kridkArCWjKjO11Y55LzUYWiinB
 QxoXMWASRDpVvpQ4Hlx5pjfEEMpn3f3/8M+o8J14xo4x391y0gzeL0rCcm7IpmaaYtniWkbIXxO
 TB9ApEqVKoheyWtyJ9A==
X-Proofpoint-ORIG-GUID: CDWRH0RaHsFRtCmCwxQroP-FgitOXqdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93675-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0667175F08
X-Rspamd-Action: no action

Document the RPMh Power Domains on the Eliza Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..8174ceeab572 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-rpmhpd
           - qcom,glymur-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd

-- 
2.48.1


