Return-Path: <linux-arm-msm+bounces-103406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIJaJ5bV4GlymgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:27:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC640E1BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 502B630A1FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781C33B7776;
	Thu, 16 Apr 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSxahPMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/5LhsV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598C3B5302
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342391; cv=none; b=qUQEP5NEWaESOvhbE2ZqSZjsy1IzlBQ/V90Wf6048v0L8SVfwFWZH3M4T27hk7gZCrXp53ML7VazBZDm+bP/iYKQa1r94BlWUVudHk+SgbsiujiblAkOI1rPN40DMpZzBc/bLoM2n83pQPOrHo919l+5PdGwTSMyzF+QwI8QjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342391; c=relaxed/simple;
	bh=kXFqwZQtEIRJmlBlrnV4mxUyArN/uKPldKW5VZ93Esk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d77row/Ad9Dgs4Gq0APg6Uzj742PYhj39osKCeWYIl5/VWCvcoCLSuewZl2xNSPsKgMHCmZwNPdpAq/BI3Nknf8L+mbF93/LOaVKBo2K1uoeiSWZfcO9Xh5evMa2jW1ziwoAJ7hpjp7QfPiEXt41EYtckemG3RD+66b3oeijP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSxahPMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/5LhsV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xnrV4125032
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=; b=NSxahPMDcCgB2zAM
	q9XFaKjURLnc3ZlBflV2VYhuh4+fY5Urhue0jvIMgcDvA0fFag6K2fae8yAB6iaV
	QOe8fxyqZW+HrxUy91vwr0MMI1Wn7SZiVZydGfMWmtBVsDGulLipR+Q5U3hdx5Yw
	9nLuTa9JzEh910DkZF97MDN+tZrVoJH33D18IyBxSkBvu7KG5vPeICev/T5CdoV9
	8J2QAIEGryrZyXixBfzamPckEDoNUh+CnWxeLA0kFPU29woU45XPw2IySAu/nbij
	CSNEIRKy86GqpdLn90jIxarLbuLvHLHKyZQpX2DmQrqfww0ed02j8Av5TjcNMnk9
	BpoY4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf8nsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso1060448b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342387; x=1776947187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=;
        b=S/5LhsV9L/wBHhiCecyf94Ml45buS2u20L2FNv/AIATnalIXUoku9xzukmUiG0Mz3i
         olkEG1yhrflqO4NeXrzEUH1NuESbKMC32ha0V9/uClvJev1mCxkQ6LzUahrVHj7JbyMQ
         d+fr+yaBrZHqO6BxWJliMMoebfFlC5QmuPDPlkfQ64pKKIhDbjF8QCctKMf/iDzTouoV
         luYl10/rQosbnyJP9JYNVThsh/d2Lw9LAdmyaoAu3FSFo3+1c3IyzbZ542TXROpVFeg9
         4iRA0xmY6QhwSY4hX4o1kP45CevndJgj84LHImksB+D2o9fzen+AEeKKs2eA5lpA9/TH
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342387; x=1776947187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=;
        b=iWZCvRTHap0Jg/7ZQf8/yvZhKaLut8n931sKhUCV7TfIcotRB3WX/xtTC0Dqi2KykQ
         s+idKQMSlILID7IAVNfdQVEzTz50xuWLw5vIHEZVv3im9kFjypfj+qo/sA+JSVHF+xBO
         xmoro5a0tgOscSzBFrwOTJ0vA4R1zuhojz9r2iCXF/rHdmwJ1AwCI+k0wPX46mOJAMhc
         VJ/TXbDCSsUeNpZlnmKCkJzsj9leVlJ+0nKqTDpHeSHqFPqMGvwJLUytMWrTpeKeaRZW
         9tKndVp7nrrJIggbXW/SCHObFt9Xj3JRQv1cfdhsKZF58kw5lns5A1jbZIOCFrA1sV+6
         auRA==
X-Gm-Message-State: AOJu0Yybg57k6m35RI7XodTMQMfLz6mMnlB7ay/MhsTOSMrs4fPgS92P
	4ItcJB/1NwTrL2Mj/QrbhNDiMs2ntPqGvn18nUs2nhrvStlmeqsJ+ITKehXHhBPZlYGFTMs6YTL
	YvG0Y6oNrP3X/EUa12chhjBEEHADo9+BM8e2+8+RhBDySZXPmp5jfIDUee5kt6jOpZ4io
X-Gm-Gg: AeBDiesGv7Bwq4zAD2BdU2XZvBkZY/VoRXaNqOjruPY/p+xbRVUrKxlNYwkcWh8FIjT
	vSqdG1U3nsjVpyF6sij7DvzRyUM+SY6yjpBUl5t9pQOQgEQMttiA2He2AKfaS0kjB+yq7bxgHrc
	RSIH+pKn0tExmF89zBkfoC2Rsame/I+XopFDo6s1CNZr1NyuMu1ayFvZC7GX6a+MqmroR2gVE2n
	PkbYhoNAO77ExQ/yyQkz/itp2a5zNX1Bm7KOBIdJV0bZ0wqoGgfKbHRY6P6FHDlmWNpcJzLOj6r
	uGzfEdDsCyBDb+Kk9MO1XOKRC5QMabjPdFq3Z8/s4BHrF6jfA5SaQLBEk92shhyJiSMGH1aXi0r
	nUZ5fL3LQ4Kpgf/IFHHvEQOF/7to0prKadxRDVVtWAzI0E6dxdOGj79uE1A==
X-Received: by 2002:a05:6a00:39aa:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82f0c2c8dfamr27229275b3a.24.1776342386918;
        Thu, 16 Apr 2026 05:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:39aa:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82f0c2c8dfamr27229233b3a.24.1776342386433;
        Thu, 16 Apr 2026 05:26:26 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0b56sm6227542b3a.37.2026.04.16.05.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:26:25 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:56:11 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Glymur TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_trng_enablement-v1-1-60abcfd45403@oss.qualcomm.com>
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776342376; l=806;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=kXFqwZQtEIRJmlBlrnV4mxUyArN/uKPldKW5VZ93Esk=;
 b=5AcQ8d5Zr0FNLG+vEMQpM/OZxpCwHHiD/f02ICOb49IpGeKtQ7jXFapuCISNZ4l6Bd/sv0158
 cauLKZ8CgFjDk4tSTWMmFUn+MzNok1TzEzI2mBMjOKPeeyvmyxXd8nY
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: WvF7NarfY2UDp_tug5-vTwJk8LSNxZWQ
X-Proofpoint-ORIG-GUID: WvF7NarfY2UDp_tug5-vTwJk8LSNxZWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX2AWaWu4f8Ich
 dXde3PkDjC1L9KQvkgXCEY2wfJ6VyzX9e049ge19EDiABVF6eiO4gx14YbJK2VcKyivsU4bZ2G4
 VWKUd9bnLPP1p92+DOk8A4IaDas0bKq/rKkUr0F6KXnFx6s5mfnJegit2T2ggL/ylv3ctR//yFK
 5ZWEgdUv5PkGiMCwWSVWBo7ljBv5jltfspFqRxFOh0snh2xZ6o9d36XKy00AEBLVuxWphat2czI
 XD4VBeT/Ibnn8PSp06BgNoc4fkGprHSS70hYg1oa3U1nFaHGeOT+1qpwR4jP8fGIBBqOVyDLsJ7
 bOzKNFOPuIKJgKRfJEGryT9GVyDMHkreogQNUC6TccKVzbgVvjqwmVBo9sfwDuOzCFkXg8PMO36
 zl9SJ2+4pcu1hb+dpLavN2jxptMKqssv2Jn66GBya/oz8pzWlqzrRQs36DH3L+oZpLFl8xcrlKS
 Ag+Wo6dq4uPy47CRzPg==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0d573 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Tyd50f1jF2ROF_aEsCUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103406-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22AC640E1BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document glymur compatible for the True Random Number Generator.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..498d6914135e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,glymur-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.34.1


