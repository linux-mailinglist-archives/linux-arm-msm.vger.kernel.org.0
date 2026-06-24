Return-Path: <linux-arm-msm+bounces-114395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vxrTOmAsPGq7kwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5A6C0ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:13:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l0acE7oW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hK1XNGfe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114395-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114395-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE55D311C3CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2033403F8;
	Wed, 24 Jun 2026 19:09:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787CA33E374
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328159; cv=none; b=iBParOzyGxzbUG08Mdl1/YS7DnrQP4myWF2TbU1FbKfLYEGplfe89kpXcmrnDqMgOFIwp13SZiDBMlpXvihhDXQVHOxkM0vRv1P3lQl0tddqVdckjAsDdWnuhda7bNFz3pvypUvXdA7ycDfub38K6q2mpZLQ1IL1u5WZQRtJG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328159; c=relaxed/simple;
	bh=YtU2UMqzvzQG4ISRFsBdCCqeTm7onMpVEQu1DHRBhu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpO+k8STSepo9EeAdHxZIajMgjX3/FmJ6LdCWwxLOFNgU+cOzFNPXy274GpwlXjkZesPSueXZmKMQSMxkDpRG6h6Osp7Jij1D7HIhMRbEGa9CkbOzW61M8CWk6g1bxrba9lEn+hYRFurCoaWG/rjTzZ42u3gqELk9jX+t/nA7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0acE7oW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK1XNGfe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj60f3492799
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oNh0Aukfdy2
	d9exLWVEauhP81hz2On/FlnM4F0GZY0g=; b=l0acE7oWYo4R4FRFi2O8ZboU7fx
	0m8nhCzA8WTlR7v0jrPV2OYo8BZQmk3IQXHsO+Mo6H4F0EceVvIEIT+4yhv9DQMF
	P24xcFgc0/omYWsMVX+2fcyHb/zTWpul/LOo+KXSuFp1qDsrAOLunJEN1k9si88p
	m37mcMDdFpWGWAOzk3OojqER0oyj1JZdcNinabwDfB1oSQam7iHPxphNWKctasqS
	pCBSgrr1CI0i+VwNV3ZDThz6pNBEIXp9jvdJp8M66LVNItEj2uM8LylkdyRF+H2D
	5DcRJMWsFGfeSziUyHlyAH6Slq0dxzvfZxI2lA4YTl+PdvEFEUZvFnDRv2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfbvck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso829182a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328157; x=1782932957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNh0Aukfdy2d9exLWVEauhP81hz2On/FlnM4F0GZY0g=;
        b=hK1XNGfe3VTfSjvj7OQgBecy+V82aUYsGAhlvVcvQRi5LQEE+l52CP356XaCNydQT5
         jGQZQbdEnxyEEJAOxksvVwsqaWHvjcnhD+4opDVIubQPGg7p+9AUEzpcgvtQ36Zi0P6K
         7duWSfke1F2fZOAkvshck6Fqp8q9qM4VWMucGa2FMGjVDsRbQjnweq/B1HFUzc1/l9bW
         jg7DStX0x7wqr/t0D84j/INnXWzq1tUKG2xshsWNETAgquPl/8HVnVQ0WaY1cLQ07tdb
         pbXusvCXFKrd2xMOUdn+EsozjJ5yHjDBDUkrRqZga3LmwVZ14jlYgAxfEQdXymfqnpOR
         BFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328157; x=1782932957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oNh0Aukfdy2d9exLWVEauhP81hz2On/FlnM4F0GZY0g=;
        b=Vopp/ctscdiG2jf896wVFmgxAfZD3z9LC/WW6Trl526ktpZ3QaMCwgw+jkcLWPbSWh
         mGdz8E4GHg5MJhZC/sm8UOGs/5SQxt4ctUe1VI9fNxcg5DLz7c6utDkVYvsGlHl+I7rz
         TRc4jgpcrFpztAHOOPY+z8SshxTIW7JJKJT7/rc7RrH9Ev+9HKCqFkHLKkzUnof/IreU
         e2WsnQTdx7Jidtg9+03Ym8aaqX/59XE7L6Z1WrOia0FksIdltLJ9HIKP8qxQhoO6z1Im
         aWi1xWZxElBoUOzqSwWmZsiQaYCMHGOqTMb/RkKL3AKI3AAXV6dH7ziWUIUpa62RYnYG
         6Ctg==
X-Forwarded-Encrypted: i=1; AFNElJ9mo8UUQgIsqAGN+hU5L1ZDCmnWtiDqKUA+wzNKIl2z3wzEtZxLiOW2N5jwMtxGysziKbh/xuJEGEr+VYwu@vger.kernel.org
X-Gm-Message-State: AOJu0YzaliaSBipYfc3iLCH7taP2etOOXElDEKaraWasbfQGbvgZFvFp
	0FlK4nZz4250pg0DBbGEew7mpVSzlB5tW0CHbUV9jSRs+fKdUykawEFujVWCPLU2BFI0Tywhd5J
	tFsNzcnbzqcYfY0jcyo61H8I8WMEFM8gl+D+P4FGrnMearje41XR8nxVNQiEzblRGL9GW
X-Gm-Gg: AfdE7cm4HMTaN7wTLK10shbAFiuxIzoGHEeJaQisZVnO1oQenLchdVYRva2R8wdaroR
	4izLhdng8WnwGxmqsvyj/mrSirLEOSOrBWBX8OMyRnoQjcOqHPqZae0QxsXMaOvAaK9fI00IVnh
	dflRlJYQ4gVKi/UhutFYLaWZI8d6b2EnitNW14tLu2parQbWVjTvOAhqjipNatNu/UdZbmPz7Kw
	t578jNkuIbd9dfJNfa2bk95VebX5U1iqkdgyKKjQkc68drd2myqFxA3u7faTS/1VDuwHMLRmMU2
	UdZw9+VkTYFT0Tb8/5YvLtNPE2BfOD3u5ExB0ye/9c9SIS+aY0PbcCWOQOIqz5Rpb6Vee/AFHBY
	MBjcMulM7F28hH40eXbOlEyRGsZdujKtaQYu/PA==
X-Received: by 2002:a05:6a00:2d19:b0:845:4f2a:16c8 with SMTP id d2e1a72fcca58-845a2a97d8bmr6042733b3a.11.1782328157336;
        Wed, 24 Jun 2026 12:09:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d19:b0:845:4f2a:16c8 with SMTP id d2e1a72fcca58-845a2a97d8bmr6042700b3a.11.1782328156786;
        Wed, 24 Jun 2026 12:09:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 09/19] arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:20 +0530
Message-ID: <20260624190830.3131112-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3c2b5e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5sFproqCb5TrlsysifkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: R8PpRTO4MqqBaO8xwjs1iqRBkcq7-8bG
X-Proofpoint-ORIG-GUID: R8PpRTO4MqqBaO8xwjs1iqRBkcq7-8bG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX1fUI8TznBbc3
 vmvfgYSYC/MuM33f/+aBuZECj7n7kQHGj9mgT2s5l8vGNbPCFvd6DcKhOoShJv1rFF4eUkOy0LV
 PpnRhrPg+qldwv65QFRw/h++mY3wlGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX5NU/+WDw6zVz
 L4jq/7+7m/YSE6xUYMe8/vWzgsDLo3sIMj7aSX5HfmzD7q5nf4Wh+DUkd2E7dbgf8rXRcZkfHXq
 iNrE8bo07kwLSj1QGDwLdfhOTFmHK1Frtb5vmZKGdcG5TvMAq2+Rp/+Lf7KTmzQv8w/zEZoPjqW
 JcuEKFHzYqJKbq288hNHIx2JQZnuiiFAUo5DQQ0mC2MrDncooCn2Z7gGu0VAz23jKGbpaXMnEgo
 BHbkYbcAmrJ1o3Dh0tepczl/wWMqebrmUiRozQ/zZDpGCYmBq6fTW83P+JUfU6oEguGjrcewl3C
 DNtLDHDkPqFkgKJnP20BE5Ihz2inSfN9IO5uEE5o9gYyzIgcVc++fGiT8sYGppVxfPCOZws93d+
 SD10vtQXza2j8tx1zF5Q0rWwY++kBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160
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
	TAGGED_FROM(0.00)[bounces-114395-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55A5A6C0ED6

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..a05b8d28bdb8 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -634,6 +634,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs8300", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7154,6 +7155,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


