Return-Path: <linux-arm-msm+bounces-91433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EOeLl5TgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:33:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C4C92D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8B443001050
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B692882B2;
	Mon,  2 Feb 2026 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBH/JmC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOZVV/Ob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50132882A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017625; cv=none; b=EZuIIzcgCJbcEZdZHWLITp9uq5bkNB3qElklKd/nP+Uhbksx0SRfZnGhsau4JD1fkqpJW/xYEXI2DFQepe2oFuZcdgAxofw0vvRAEg+esAZLdQ9czKOMt6CM8LxEU7pJN1S+1jOeIBKVSyARpVQeUsAEkbALxlQjZIV+06Qoq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017625; c=relaxed/simple;
	bh=haOTBfLJ6G66nOuaLuswaEjLpGbUStrMRJyyCv2J1pE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OzptgbJimjzcIr6VEiELWjmEgmX11cn+g77+5cahGWyU5mlBZUmbnYJ442xIjmI2VfFEHFRP2FZX9XqyEn7Dm2D9gbBzfzqabBdIZ6Ey/pMP7Cv4rug2yQXcUfVhngqbkFOM+ApEbPVtjZlobHzJAzZ6vCT4JjCptIEDpD/kOJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBH/JmC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOZVV/Ob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MlcsI1473776
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=om1G0bUi35I
	JJwvIUrY3DL6YzKwXm+Wjox69ofXth8M=; b=iBH/JmC4K4CafWlD9JHB4cbulIp
	77oPWHK1cRe9/+0TsXleaTKUSnsEJj+cynKbncDQwMBQ9FnSw5lbv6F3Y5NAGM7g
	jrGdqUSbCBFCzIN7zmpOfIPIms68cSPyYgdXazCHJVECvSFkaOW/5l04Wtgre2UJ
	MxklzpOGFwnJsn8Ejxbtg1iOVzwwr6TcPU6XifgsSIvhsvLbg0wglBF9/ZM4qUSo
	9J61F24b5NwxqKm437wKWzZ3w5PUVJHP9R+AxqdasrFfAZmwZHWiuH+tGWh1LYh1
	vBQtazMmxigajVktSaVKgj4hdfEq2z4lC8nQCzq1voMhTSf0PDoz01j4CSQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2me1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:33:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso10288303a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017622; x=1770622422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om1G0bUi35IJJwvIUrY3DL6YzKwXm+Wjox69ofXth8M=;
        b=SOZVV/ObBwfvgtjzuzuq8eHMU3k3kEwo9Lg6awvYCw9gmdQmN4EDJGCMLhWtVEIjDf
         57HPRBtG1rDG0aVF1DzTwKnZcwEEIF9APyBh8bzaDHNjYKggLoZm5g1ZaFYnHn0j9SXB
         FF7yWP/rnZiMHwkl30HIJL6c9zaupaEcn4N0OL74o3nichhuIHhAbhENJewUn+UECJTh
         B3sV36DJY+rCpZBtbGWADnyjVg3fdfVBAstGGaQjDqCQHJYRKOt1flPW/xLpr04W1eR5
         WrA9N4wFX9bmtz36GBgk+oLyZ6WcljiMBAJ8DZD1N7iwztPhzDU9rNBaFpLpxN3jVhQ3
         DRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017622; x=1770622422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=om1G0bUi35IJJwvIUrY3DL6YzKwXm+Wjox69ofXth8M=;
        b=IbjM0jjDSN32PSV6e+2g3o2MpbxShxs82SU+1H4Be5WJ2WFD8nQI4piKa1UfIxusZy
         owt1c919AfqbG7scTv38+RgokEAljlOxeq5wsM9fnUfL5B4qCgghJYo9bkrutQMwewM2
         2Rl5ZEdN3cLHcxQTvXf6uZ11T9xxr8cJwoc4G4nEPRW+d4ZvbYLl3CThk85DTN44JSLg
         Dclm/ydsWcRFb0h748mWj0lOes18ibGZzj+d5PQMaWV15Y6nRi1CV802X6ILwTWZrRPZ
         W85+doDe6dOyyqgaOVxIKoum4/S+TAALHTMdBPZIRzzvKJYshgVUBc9p3lPba4byWZZU
         ls4g==
X-Forwarded-Encrypted: i=1; AJvYcCWoQ7GXfYjoVkEyrjd7dXBAOn+VDOruC5etDyQBhieAVn9jtbxN0uRBnRCWskmjUTV1GpXsZWDJA9389Z6i@vger.kernel.org
X-Gm-Message-State: AOJu0Yyze7kP0b4xwgcnBSF00RgKJ2yubux1M59/AUZer0zN6hTFf76l
	iLWhsT2/zD36Uw0mvw+kjNoKwp1tkSiJeFSVR01vvp7F9Nfb9OdybPcJqpNQbzabuyc04KlVf1/
	drliazBE1xAormUCk6LXSyf0e+DdMxy7lfEAolY1wJreOIdFE5IYb+4k3crf24mCZISpz
X-Gm-Gg: AZuq6aIG+Asbi9dlvTwm8I8X68OhDZUtJ0P+1FimsL3LZ/V5EejRmK8yv2kFBdkKcvQ
	psFLpi3QWLbuI7xnWoKupMdAFsU6/Cz+R2aqFccGpo7ETbs1rSYiuoZu0Zh3dKPBdd7XNoXQ7kb
	qIFX+DSCZ9q1Mluc++arHYAzIG7+sAcQhCGpPqy0+cmbzbfnho9GMHMWHv5o84TpvjfbFbzeh50
	9KPw0ZMxJl4t7P6x/5aHMpPB0TuHJhHMTSAZ30sq5sbDtxwAQJ5i0cJ1u2Ku9mHVuVV6IM0oSsK
	OO24jh2eC5zsujAocx6V2QxlHIvEP4SsQ4Sg3hVRyysCfAtmYCFzakljohyLGz5zZIFiLyomnb2
	PxC1ohAF4IglzRyZ1PxFe2fmUtP/D41NoCZR3pCc4P0ztfq8dOAxoryJbmJ8AX84nhqKzxtW9wf
	CRUE628rqco/j1HE/RMJPRZG2pP9wfH2WqplpQwf0=
X-Received: by 2002:a17:90b:3f0c:b0:340:d569:d295 with SMTP id 98e67ed59e1d1-3543b39413amr10955345a91.24.1770017622353;
        Sun, 01 Feb 2026 23:33:42 -0800 (PST)
X-Received: by 2002:a17:90b:3f0c:b0:340:d569:d295 with SMTP id 98e67ed59e1d1-3543b39413amr10955312a91.24.1770017621875;
        Sun, 01 Feb 2026 23:33:41 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e25sm20758332a91.1.2026.02.01.23.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:33:41 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
Date: Mon,  2 Feb 2026 13:03:21 +0530
Message-Id: <20260202073322.259534-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kjiljezn9zbbbbKhsUV4lkOij7U7MMdy
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69805357 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=okxJcUns-7FWwRFb3XIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kjiljezn9zbbbbKhsUV4lkOij7U7MMdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MyBTYWx0ZWRfXwqoW4kyThaOT
 YKEvI7Ttv2m8sxVnpwWNofxlpwy5VD9EUkLDVN45aFh5ZvMIsEoCCEj/oVaP9sTauHQow9ENF0J
 Y95oxtZ/pEcs6YwGDEe/x6Xel7XBGj2A7W8fIct9ZIba3ddEaO6Wzgg1DDoH0vjLcvvEotK2L9J
 jvy1nAfL+LNTi+D/iLcSfMnqRJ6UFb23Y1/pakMkC9ZRxrJIInk/bZpUlt1dHnEJj18bcpEHZTF
 AVsOgq6vgciRx/4psCuktfl0lrzjfLrzN/KcMunEqEbrte3CkY0pg8mki6Iv9h11X2zL5MRjR9z
 BgrmsUZFsw2/DalFBYl9AZi7pRdClKDNIhalTlKynA2TzcR/yq4sEd6padU9cVrI0+34/D2CYhX
 AR829UvdTbTClr1MlA6Pzr7PyNRW13X2UP89IXJgeiA3QySd9LStGZxhPTAuVHZ1Vc2WCperIk5
 jsYTnmsmghaTlTY21iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF1C4C92D9
X-Rspamd-Action: no action

Document the IPQ9574 AL02-c7 eMMC variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: No changes

v3: No changes

v2: Update dt-bindings to include the new variant
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..28f9a6a166a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -323,6 +323,7 @@ properties:
               - qcom,ipq9574-ap-al02-c2
               - qcom,ipq9574-ap-al02-c6
               - qcom,ipq9574-ap-al02-c7
+              - qcom,ipq9574-ap-al02-c7-emmc
               - qcom,ipq9574-ap-al02-c8
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
-- 
2.34.1


