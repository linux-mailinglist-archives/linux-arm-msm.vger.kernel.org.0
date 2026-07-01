Return-Path: <linux-arm-msm+bounces-115787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C3LUDHZ3RWrrAgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB626F170C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j6+844DD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i+dqpjBB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4826E31422D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB623B4EBF;
	Wed,  1 Jul 2026 20:17:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73442431E6A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 20:17:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937072; cv=none; b=OeCCJUdyPTK05fsUzxHGQWMmCTHECsRjWUNYsiiCqDmtGi9FEKKZg7M4hKbQMTHNN3pXrTkNsxw2tqH9+EjzWN7e1MAuNmmkcWWVp4+r2tFRePCcP9bO1p/jYRDIkh/XERl9stw9up1l5o++ciiGuPRyARLZ8F2/kTGwkqb45t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937072; c=relaxed/simple;
	bh=zf9TlqOfwwZdx3G54bR3USVrp7P0p8U3F44gkqVs+os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIAB/Ho/D4SDhx5xajecrygknB3jADFUxw/fIjnyJ2YzvEmoTOtSpo9bjxSijdI+h4ZL5WnqrtsVBnvHB3gIETHEEoKzQqVBHbS+w80TssDgpVE+8ifiJUD6O7U438BgvSXvJdKTfw4W5eSpBRV7BqFTbgsXw1FpfivfXWCHhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6+844DD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+dqpjBB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmZwO1627023
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 20:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23PIaOdJZ743PPYrTOtoYq3vqxgjoVKfYD54+HI5AOc=; b=j6+844DD9xOyM6hM
	14DQgkXl48GEnL9B+hQ74161SOVZIxgdVgFPcU/ZVIbbGyxSvpBffCkiIIR6cx3K
	5KVLgkh0vMl3DOC0O6PtUQ+HMGa6hFpUZUmnDePuK4wIIlCTXra7NlQh2BcFgyQg
	yz3bS/IMb5gacvzVp79zjdYA5BFX/wATr7DU9IPP5UwnIkuvMPkZmiFpdl4pDA+Q
	HBJEIOMNIZCzECTdfGqk3BpIogUZzLwciCpV1KECYSg46r+dmPe05p59fdrZyejQ
	QF/CA7Rjo45RqLbAe0ZpX9NbUvwLwDo+uAsCcnn9u2CKJ3J/bCvm+VgQg86vdMJU
	uw4+VQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563090t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:17:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e16f658abso845451a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937070; x=1783541870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23PIaOdJZ743PPYrTOtoYq3vqxgjoVKfYD54+HI5AOc=;
        b=i+dqpjBBCgIeeaSkn8HPi4jwxSqVmzBKwSiAEL2RW8Y8WZwPajEcBxcRBikAcKrrTQ
         PqQWZRw6R0+QpGbFuKnfIq/Lj6Ty0VPJjL6TSK6bGeEsHy5ufcoQwYcnBVqBr+s8SYci
         c6xsEoNlie1JdcC/wN746wcKSJHNamERxSInxpbVPap8jKaMYgDAxrfOSfo6l6ckPNTz
         P698ZCopWG4DzHIAhYy6Isf5iJkwx9TCPHBNW+2zR+JPKpgcSXJYZjcSIklIg10HegNo
         Fhfr8J4VzsymvLh8RdD4OoqUbL89eFQtG2rqvXVvZuOJzaxn9PjoqdW6eDgkjo+BoXTG
         HeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937070; x=1783541870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23PIaOdJZ743PPYrTOtoYq3vqxgjoVKfYD54+HI5AOc=;
        b=qWAzfiSQPzNHqHA8f1OUMEAdMB1Z0lZ3MsCll4uIE8rD0GRlB8+Z8o504R8FQAKdHN
         JAQwFZq4t3A0Tc9ccgIQPy05RNsudRyHe91E/vx8MluAlLNJU3eVOmG2xhd5LwyUSUJy
         q5ifesPXgdzCghDcmaYtj0ns6NspSGqkJTp66fOxG65GD69LLTGGzTmzo+aw51LVMyRF
         Rmg0szZMmcD2A51UBOqnPUuPCee5zatqj8BFJItSZVGEg9szM8wz3NID28/+5dvrgZNV
         DiTEk5G2cSTCjhR+jK8UD9Vmv7R0EMF80M7MSB+PCVbczNRQdsXYoReWGXqD5GqFbGTH
         5KcA==
X-Forwarded-Encrypted: i=1; AHgh+RoDIToY1mrsXbRqnV+yei1ZcE0xtDDj7rBFxpPre1Pf8tZFXO2k9NSZHx65P21wnL9re//RFsIrMwlq08ZV@vger.kernel.org
X-Gm-Message-State: AOJu0YweALRkfmHQ8FLBhOcvtWghuebPA8QYYzm11MX7ETf37tI04usL
	MRegs1xxTmDd3srdM4m20m17w7aHcGLPc7REx/4XkZhcAmWxdQ4Ub18CN6tN9GQcTUDHuAjZSBK
	lFy4mPoGoGesUW/T6BPca/WF/lZSH0qjZ6IMntlvP8k+sT8LKJUDB6BzovcX6say8LG6q
X-Gm-Gg: AfdE7cn8+KeVl51rtQJkEiU+VHpeNN9jUQ+XOl+m3Ly025U4Hn1q9SaNNFLLuN+AV6e
	UumfxuuiVnIHdvQwKOBzsQuI+37O68dCQAzUiOR8oFcTeK4eNJynRmPD8AyQHBQd+DwL72xemS3
	rY+reiNS3o8n0uh0yb+wvMyerfdXfE1mf9kd/mQR25mbQmzWtZ8v5bM54jZLWmx1+PqiCfXSnya
	r/+Ug7mPNld5Zn7IHD0tQWds/y04CFsGLpEODXcmO72iAD/UY0VcZLynInrxuctaJOZXzMvGkvV
	rPhhwJg5d+wnVkWU4SBH0n7Ao7SjbOlezdsg7ReIfVcU8uyV+ytI1WfW1pGafEZ/lhjoPlpAklf
	CMdy/ci48CLzmcCAiDSza0RvpQHidTga96H8vMMKzAXS0
X-Received: by 2002:a17:90b:3e50:b0:37f:9ce1:7359 with SMTP id 98e67ed59e1d1-380ba91d27emr1912888a91.26.1782937070210;
        Wed, 01 Jul 2026 13:17:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:37f:9ce1:7359 with SMTP id 98e67ed59e1d1-380ba91d27emr1912861a91.26.1782937069703;
        Wed, 01 Jul 2026 13:17:49 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:45 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:13 +0530
Subject: [PATCH v2 3/6] dt-bindings: crypto: qcom,prng: Document Shikra
 TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-3-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a4575ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX/wnnriY0goRN
 e7qQM+fD03uggexrCGbXPUnkCeRrNtm1lI5k4r9sigyTL4BcdNd6IanlFoHVfIo1wyJOluy3X9a
 3Ms4ba4si748tAqQl3SWvDCRU1fPSDU=
X-Proofpoint-ORIG-GUID: t1eHxaskHQH-9Ss9x_ApOgUnGHjJs_8O
X-Proofpoint-GUID: t1eHxaskHQH-9Ss9x_ApOgUnGHjJs_8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX9J7Q5f1owzFC
 +tbHsU/0XaPP+waC/ajlNpa1RTl2pSKHFbX3csfF0830Xr8uMDAL+cwdwCnzk6tlY2hITUjjJ21
 IuidDNEDZ9H59LoUQdSNU8DwVzN+mLNX4hVRpnPUQbTUC87RoZYLEWS9j5IeoecS+kQ13Ky1kaL
 8QsZh9BEHmgLKNTCFlGMwMB2DJtWB4tBb4srKeDqKd4iFLuHZeNBZGoSsbdqwCGKQjV9++F77Ys
 /WZjoGeEPCTJKEFi55rjWA1oqeXMuDzuJZ023yeCNxEJ2nKViBkBhQgj6DqY7q29Vr0I40Xk2aq
 w4Ar6TWd/O3sNBSiZeYo4gVVLKz0h3YOtYMKv2mMOoAdh+nfeUGaqs4MVgOv8LB1WEJO+kNK5o1
 G17EHwrYwfGrtqZqlbuLfe9uY6DdnnH/x7lMgQMWERZjyxU/jVSGBYXI1foRUzCffpD/1UQ1rEs
 g5FcycvkqR3+VGGJL1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,qti.qualcomm.com:mid];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EB626F170C

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..5de52d7a745c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1


