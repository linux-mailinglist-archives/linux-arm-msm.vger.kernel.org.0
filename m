Return-Path: <linux-arm-msm+bounces-111942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qud4AIsHJ2reqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:18:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44166659A21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FcoHVPoA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fFx8xdNU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED365318E16A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F70E3CC31F;
	Mon,  8 Jun 2026 17:54:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000E3BED7B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:54:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941250; cv=none; b=UjmUhtuxCP/S5twTs21K89nDFZTZOx/o2KxiAq4h4UtBxzAwBdS7SarAbEe7fNiBLniF5lPyGXxigX6C/tq1h8s+Ji6qYqduTwVyHvgD4A1Ho3ypDRLJPx41O4SwInMm4idbecwz9X2oD4cTh5Q0A3SjPFMehnxS5xvhvP+u5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941250; c=relaxed/simple;
	bh=Sp9uCyVhZgE6V5ypRAHDAVLYx8d20YuRlOPU3GnP3Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sClLyZ51/mHYSWwWPZu9DuxiNlrrVLclzPc29PNA7GoU24eTQsF1mv37InR4seVQWAfu8Gj++w4k/7CD/UAJLERQh1MhhhL1W3EeiFu511GnG9KPGAwzXxUGK5kwx6duoOZHjWoYOwtxeLl+4xdFCtLYAJvZ9FL7/JR74/lTQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcoHVPoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFx8xdNU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFaBZ4041774
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fvv0JMgN8Ty
	Za2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=; b=FcoHVPoAaHtp3MEkph1MP3eGt9+
	akc2WkZi8hOQb+5MOtUoiDev40y2mhw3CQhJL1AchabXydt+2McJW88qNcgjSyJD
	VaQjnldwbmSCFimf7V3MuSEYujaNws35AjglWKk4JUmoHfeQ4dyxfI9W1sqPbk6u
	U1j0vthFQEO27YfvFIgpFdC3UCaDECZmclDQoQun25tEZKt67USDbQwen+pkVM6R
	9i0hOiGXLFuY4nE3ViOepKvHuGTxGF+gm4P0MaCj8Ll/KjTJVRma5DLsruDPcZQf
	pntSXQtSauVeBzKaYZ2MbC9aJ3w5rzZat5NNv3var/XkGNWhX3yLWmVvySQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9per-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:54:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so2291041a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941247; x=1781546047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=fFx8xdNU1G095a0tELdyAeGERwOyqb4hY8GHdTjKohnUD7TKNgs+FLIQeJphSzZCkj
         LE9peSPJ+XGMMrIYcJXvLPKoMEIQodi8ulZ2cEvaXHCsq5RKoW91rgO9W7KGnpMwvIMi
         ZxU0J14wgfuu4OKsW0QlJEc2Si0I+l2ecriHkPhFByDN3e8NNe0gsKP8WDbsFqKopRAB
         XYwfbVbd4IDdIC2MRy924X+OfvLkFeKtacWVZ9MRb6mB6KZJAJPkRCvubByl9+4UN7+e
         oMsujAyHqgtj1oHi9t82UE9U4gxdm8ySKvQk5wSkXtR9XVCc5cTeKrJIWPR+IO55HDVO
         8hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941247; x=1781546047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=SfzphPP+3/FKzikbu3RiW+E64rx4k88jC51I+3X3x7zXIs6K1GtY3LtEclB4snuzr0
         hyYfNWDN5lcINaiWii8ehDIvqGFmh+YJdTmwYVZVGjTH/8+AF5Wa+f8E537uzTMy1hBN
         zK0fzEKt4P+6gMCunyuKfvyW9WJtB6lR0kz+mGs3+ZplDwdBVWlN7hmtWkZRi2A/vEv0
         LNaOjaazCkd6TmG/SCtWvUiVRg57pdQAsi2w2N5B4coyoPmGRkGTW5Q0DZ8/3VV4cvAP
         tri3UHb/+fxVqohTyxsFr53AmX3foRgw9p8nQLqnx2H1UGBsJs8+G8MD8qLIfDaCt0q/
         OnXg==
X-Forwarded-Encrypted: i=1; AFNElJ9Qe8uTspC3r03+sxJAxxf//MpdYoDy7L+fZo4UA+A/hkQcpmJYstE+qc6qe7yD+ClofacrpmJIpQoRxE9t@vger.kernel.org
X-Gm-Message-State: AOJu0YxxPkp20sFaTlOBDnCSH7ah8saFA5UeMZCRGqxNrR2Vnk75H8BW
	kq79IJMZ3TkOqchKIMaNubeR1iIhKH1fxzUQvoXVwq/4/38opYJK0gsVXnZYW8fNOvYH3bZ1RwQ
	QsMBmYUHx4VvS19fHrjYWx/qiF3xCt5AzT3oqAV0SUnpBn6Roi7HfDLkFsp8/4df6ehXH
X-Gm-Gg: Acq92OEJ2Ydc+9zfx27dNN6QMZ0T5H5Ry7F90T7a7KOWPEjVhFnuRDWWOAVZWTvxvpo
	OHGLjPFG+w5Ko7MEMlr1OqZQ+AebYdurDoo3wcp10TNa/93f0vQkWzZ12qv1Z90Iz8a+MrZVGFx
	58xYdAHAwinRxnpLg+AEK5ruT2YDY7Pd1c/WySHB2PQo/RAYY5OGdF2Ggs4aLE8VDPwZ1hjKFfy
	jaX9ZA7OtCm8rDJHjoXpO0LHpVf5i4tTuwUMr7eHKmKWwSSeBuOiuAaKjWt8V3br2u5103Tvuqi
	3Rtp4GcVzjvB0uh1LkMmgwxVx6E23R+xXr7huFsbWxX+PqZcMw6+AOZR8axkLsQH+nvgS9iGK3s
	qnKdQ+6L75+UjoeYshErNu5ICFc9j4wCk8vYgSJuvLaV0nQumdo/nCTNjfct4fdQysoGJ
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972805637.24.1780941246891;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972756637.24.1780941246380;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property
Date: Mon,  8 Jun 2026 23:23:44 +0530
Message-Id: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: llGJqGUIMOlgukguFhfBSSQt9vdAnIOj
X-Proofpoint-ORIG-GUID: llGJqGUIMOlgukguFhfBSSQt9vdAnIOj
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2701bf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=k36RDxEvBeizBLppCEQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX5ikZCuuoeMya
 lBADOi+lbBvTnXWi7larVHQFZz+qnaMkVRGZc48tA7L9FRd0nVIlurmD6n0JF4rIfQRMwQKxa/y
 B74YlhTKrdLYRptHFu1e8K9CWmZIoDb2aGxNfJPAdl9I8uze26JaBxOsLbD6XwB0KLvFQwDd8vr
 0++meMDevh4aLM2GnB6y4T1gZ8cQ1lF4MiOUJObxw/Mj2rieK76RNKKNFKyRlzMqEiBRJKPwH/M
 t20/D321IDTuZRU00okNddFjEMgelHbA91SluM0iUgMXWkzUPsq+hDd+EvW2VQ5qzk45/IcSuXS
 B9rYcSWu2yRgKrFfDHGHseJDK8hiE6yWvHI4c++NIYSHFvKqKAAWHUSG8llHuTR7B8FZhWXnVBi
 0a3tSgq+uiCM4RF+niWR9wTVVwz44tCDDqtUrA8NAfv8obhpjkfDGf+QhnWvQiSCcaMCa/J7rQL
 0dxpnFkK5n3YXNruPKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44166659A21

Add documentation for the qcom,swr-master-ee-val Device Tree property
used by Qualcomm SoundWire masters to describe the execution-environment
value for interrupt routing.

This property allows platform DTs to specify the EE value used to direct
SoundWire master interrupts to the appropriate CPU target.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f37..5b06cc1a5 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,12 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,swr-master-ee-val:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Execution-environment value used to route SoundWire master
+      interrupts to CPU0 or CPU1.
+
   label:
     maxItems: 1
 
-- 
2.34.1


