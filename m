Return-Path: <linux-arm-msm+bounces-116681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LGRXJYJkS2qmQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:17:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D170E00C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:17:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pxPgJhY3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=er4MVA5t;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116681-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116681-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCE64300FB68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD4D3BE633;
	Mon,  6 Jul 2026 08:15:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D03E2777
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:15:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325733; cv=none; b=CiClXLNzpI0uwvtMp5CiM+jMe2arqBf6PZY3RVLEPwp5Tac2qIpD5EomLNQlCVoePvIF5tCmk2aNeA88k81LtW4UqWArDK+nMxub9Q5KQAatXYq7POTwVO27sYsUSBP2zd1EAnYKxotFYxgh6w6IbRPCj9IIlflc4eFbsZDF0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325733; c=relaxed/simple;
	bh=HfW02N1l4i7cmbUtMhYPdTWIGgGXsEjiwIOB8y3xC7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFPdogNtosrLZTgARlkMwMMMv13kJrODXBmS333BAuynDctHphpbIFKQ1sRUkYHvL09ayoKlzhoqhUf8BxzeUI5lOBfwtYJ81SzMoqyVPebqZMACyLPTza15oet5jq7QEe+cFnuJjVqaXBYaKoXwSZ+0XuAE1DZVBWuoru92Q4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxPgJhY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=er4MVA5t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66683d8J4150834
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=; b=pxPgJhY3u0cIEi4q
	ZFmDtEANrUdbSlxnZ0xsn7xBJWtYSzSVBz4ES+sDDXu1MUqmRD2yb8IjBJntAyGA
	wzcr3/eQM8lPoo7K+q5o6/BCq5SKTPOAQrj/TNnj2B5pNfa0Y2TMLOzwOvj1pQsF
	fYlTOEqVpGpQ0OLoDvFzraQ2/u23lXM1wFwT0cETK6+857ZpStStDFN1I5iL90eE
	FjWZ4WlfgKjtxN0eaRLyn+yVYoQ1UqUoh8Wn+F4FhDAjwH/WN4Yy2oz0ScC83RZG
	BUGIpfKKf4x3fNXi1cqoOtrfH41AWhJ8vf7HjukXJwfTWk+yYgX8luGt8TzpMuDc
	qpDwEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h501fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:15:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so2245183a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325722; x=1783930522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=;
        b=er4MVA5tmVjgY6Z3PhNJl30kERxy0k5klaWuF0YZd3TqUzhOno4Xy2FPHrb3+hvHBW
         dmJRge4tm0SHLv82aXh+KezsxxtxkA3rD7lEaKdt/LedFLVFGb2xCuJHrdOUJ/MIupHS
         +tq/Ca3LcIUi9oFDc/iOJdd+lQsre+qEK4GisO74fmzHla7ZxLkNNJigLsYT5HadXAyE
         HqrAzejz18GF8KAkWzxZgG6FDY5wv52vk+5qliq8gepHueULbYHP7W0ZeyO6m9fnCKsQ
         QEYfLohsxRcQIYCxjYyrDVSwUvHM0ChpQ/IS7J9pK+RzPmcwJgYMHLLNNgWs+Jyqnfcg
         cMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325722; x=1783930522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQ+KvHpKSyuoob04CXLtszZfz/siqFdFw5I3KK1ovkU=;
        b=TnoXETaoc642r0gTrHhvMrM2UnQ7Kma7KVWZ9HXqZQPlqe3D0Z5AWutT1kpo1N5V+0
         a5rbI9vqh7VNYsZDgKx/MqsBTBPI8uvq+xsqAmp7cd+i8Iy7K35uANCIsMWcz6j934vT
         eMP8D8yHKlOTG1sJ7xOlrLv4C1mYXRW5FHpVqaXOclyV7HTXqbIzs3hiDKpGOOcQq4kC
         4b9utTYCdtEjPRJzRIY1zuNQ9OEmQplbGou7OSfg6ViHc0i6NYUq/MvzdsF/EsyAssBh
         w2m7NbcE+eFVGPNNuqtiAmEu9GH4D9dvsmD+86qUBebVIE77YLnmMRnWY9zRm+pqpe/a
         3lxw==
X-Gm-Message-State: AOJu0Yy4suo9IFkqkHvypR4kutzm9y0MAq83GKaH24QBoxXUk5BzJbu2
	kQY+MY8+6rxw4Kw3SGYHfXra4PaP6j2OeGuWDie+1cSG6HMv16C4TpvlZCVYSCDZcF6YYwbqBXN
	UX+AgdHmHJ8B9WdjR5HAMOOfcDC8W54l2TWNezI0uw+qh4VKwLHDOipfRsOeubR4aQdiA
X-Gm-Gg: AfdE7ckRdSQbMF6OkrTxA93sabjMfZqN/8KQnHef1kksrVd7HN0TmzUZ6bIVkdNEy+h
	DrXBcXXRXdY3nwA6xJR/ENWho0xv2HtlqVvoPR9cEWl5UCAWLSzgxD+qbCAa/aeKdStm3qhnmob
	0bVl2Bu/r7AoAmVylLT8ISbeCI4NrxCrN/Ixbwzs/VPV4za5FotI8Cmsqbu7Z2MMxcAvAEertzr
	wKBghLkINcylQQvkjCdIehqc0DzW9XXLWMiu8ZG7OW6eg49c1aaY11LVFhqvxt+3EmJ7lWLRly6
	Vov5EX6ZkGPEgex3pM02HWtSjZcgkeAsncyDGVhExj/8CxTpDQWXLPKMmA3kMIrbrmCp0CBICtF
	U/T2r1fitRPuZWMoTEBQlC0edZr5MZO9JIT+EDjElahw=
X-Received: by 2002:a05:6a20:3c90:b0:3bf:6c04:a817 with SMTP id adf61e73a8af0-3c03e4dee8fmr11935111637.56.1783325722473;
        Mon, 06 Jul 2026 01:15:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c90:b0:3bf:6c04:a817 with SMTP id adf61e73a8af0-3c03e4dee8fmr11935058637.56.1783325721949;
        Mon, 06 Jul 2026 01:15:21 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f4cd4b1sm5584525a12.12.2026.07.06.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:15:21 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 13:44:35 +0530
Subject: [PATCH v2 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-spmi-mbg-driver-v2-1-f883ff1d8719@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5RGGw3S1hM9OTBZnsZ1GsYoGegjUM2Es
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX+Ym+gLNXzGgd
 aAkH+bnynAdYIeS2oUK1DAy1Iz+594OwRRbcA5hlVYUSZkIbjP/mkFX7IUfG9lGz+UV4y6AILoX
 JC9Pg4WN6nEoc7grLYagXIbk0KUaGuc=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b641b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX2HbW5nVH/8Fr
 9w4LLAHg4YcMOf5+MklEngI5S87/XB5lS6HJMj0naMkbi08CEtb1m8Nx+fFcxzjJfOgD9HjXHQD
 cTavUfFW0PhK9hEl99wQdYmMNPPQzL0+79W8MR5RCQC4EuqdmaZhRjRMsvVrIAqz/Cc/bi9bOqV
 EqND47D057oUi8tys18t9hOWw8yVAVX7041Qtc4BgWOcaD0QUbtFFyEwP6JhRrxx55xEbCglJNw
 M7QqW4RVvUMiF+yAGES8Izj5GGH4MnpCDO0d/WpUW6unXRaeFbirMO1wtsLnAnE2sYUyzcpdodo
 I3rugaxp8Bad7mbKxrjsvwbrJXilgezC8XxnD6pJNAZWxfmHPwPaAZYCx85oWCyZWwR7ZLavEkt
 eujDMvFCKb2HgmEmzi3wupCcIlZCmTz33tqD0cPxbj2eo/pFUO0C8HFT2T86dFpiC+LpzdYj0WK
 2oRyrd1YCz/0Kdz22NQ==
X-Proofpoint-ORIG-GUID: 5RGGw3S1hM9OTBZnsZ1GsYoGegjUM2Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:sachin.gupta@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 041D170E00C

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm
peripheral found on the PM8775 PMIC. Unlike the existing SPMI temp alarm
peripheral, the MBG peripheral supports both hot and cold threshold
monitoring across two programmable levels (LVL1 and LVL2), with interrupt
status reported via a fault status register over SPMI.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       | 72 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..bd77cb7173e2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -194,6 +194,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^temperature-sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+
   "^typec@[0-9a-f]+$":
     type: object
     $ref: /schemas/usb/qcom,pmic-typec.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
new file mode 100644
index 000000000000..2e084d040625
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+  - Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+
+description:
+  Qualcomm's MBG(Master Bandgap) temperature alarm monitors the die
+  temperature and generates an interrupt if the PMIC die temperature is
+  over a set of programmable temperature thresholds. It allows monitoring
+  for both hot and cold, LVL1 and LVL2 thresholds, which makes it different
+  from the existing temp alarm peripheral. The interrupt comes over SPMI
+  and the MBG's fault status register gives details to understand whether
+  it is a hot/cold and LVL1/LVL2 violation.
+
+properties:
+  compatible:
+    const: qcom,pm8775-mbg-tm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    items:
+      - description: ADC channel, which reports chip die temperature.
+
+  io-channel-names:
+    items:
+      - const: thermal
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@d700 {
+            compatible = "qcom,pm8775-mbg-tm";
+            reg = <0xd700>;
+            interrupts = <0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm8775_adc 0x3>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+    };
+...

-- 
2.34.1


