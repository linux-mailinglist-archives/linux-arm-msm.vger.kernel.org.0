Return-Path: <linux-arm-msm+bounces-111157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rkwmFTszIWqYAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ADD63DE35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:11:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ERoNTu5L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="TVX/e9yL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5BFC3089F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE4E3BB11E;
	Thu,  4 Jun 2026 08:08:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F1139A04A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:08:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560485; cv=none; b=WFwpcTlv9qC2cwXXojOK5NGE2BAy2hSv0sa/D4f1ftSD2aYyubC/ETW74hQ6isRVUU7xMnA4MENf48i0XaRNii4xWI+MB81CTVZPmbGfkBic7MqpQzOM3tyQ1wKenq7Nkogqz0w56ibMLepFpHn/HYrbWIS4X6Bz4/xJrI+Bz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560485; c=relaxed/simple;
	bh=ZYq+Pc60R69TOKAA320tMHZs+shxB2cVaC/aoEkJNNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAKiqOwdhtbNX9KwdZhl6MrKdpkarcIggrzcwqcqasDQyXFpmNSfdcisb4Wtx10uxfFbfTuEJt8ZtoqJnJekDQZ1dxQbHEJqir38PLGYM7trGS46hIVvpx2z3PqDAP6N2r/UE5ddjkP6smrNQTl2QhssaoOFv5Aw6eDUtJolZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERoNTu5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVX/e9yL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542Dspe2260724
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=; b=ERoNTu5LcAXuWGaQ
	z/dBc7EUqRw7qXb93tbnoeymbVDD+njvEeb4S5IKvaQ+b+SLZ3Jnx1Vz1belDaqy
	wLQzWYGBUxs4XZbqkbHxW4cuZFDIrtFR0rYLpOvwjw9T76w1AUjFqyUoI/0ffnTz
	DybwXA5wNw7KfMoY1M80+LK5zTgeXfdOo9b3Vsuh7VJnqs6RBGH0oU/jqZ+idZR4
	04NPkQRJxKx5cCxp3KzaEmjzXl3NCyEb9pOWkPyohFmvAyBZp2Ol8aMTYRbutc8B
	gdlWQUp8+ZiH/yUTYlOJpVhomBET+MS0bS0dTA6VXHVN4w4RV4134D6Es0ngt0Ma
	yGqYqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mk206-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:08:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91550f68e7cso11719085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560483; x=1781165283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=;
        b=TVX/e9yLaLAXhsC9FbvckDH5KakBfZo74TAGcxbuyM+oAdRTviMEjy0u+wP+DG0RmT
         P2mEWIr6k2TEELkZdPVOWKXz47s+FNAtVeh0LiwxrbbFx79aAJa+meLp4Qwrkh9pe/26
         nL4rEXdENVp8Hc2uQA3ofQhhpn3lukpOSSOsp4fkp3ph4U2AtQnZP/YcLTcloT5ug+ik
         p+iEyq98kxnBiwV7hb7kCIN5MFg0wn5gY7orQnD/1yzMNTdFaMr74k14TUMyq6/xnoTy
         AUMZv2KifkmPKFFLTyRmrvpLX5FV41bfgMMNtOv51Ob/BMKMcW/mNlzPG9DaofrVFUPA
         Jeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560483; x=1781165283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Bak3RMKRzTj9voPp4pKGVaY2AZdnbVcrr/s+bfnjyM=;
        b=lqtIB4/XfGdr8axeRHFLCW6vWFYw8QINT2SDioOkzhBG7pXlmQbwo4Nk5n1VY4cvPo
         Gsw/abRXkkWwrIrcYFfIWYNs1RuN0Ot8EQo5/OpquNhsC7TOc3s51+K28rGCPb/+t0kS
         WTCW2SZoLMywRM6Zxr0MwUzEvQUgS3rYANq8+Q/FdPGRhPLSxXIIFPlDsLNAh+/XSOXw
         X/fW81dC15gF8zn2a4WqCVwyeoR1E85DC/lJzSde7UQv2NrNAuI/PrwQgO2nSu5EFLdr
         bQuskRN9p1L5PrHLnyayF6gRwVBJ9Yb2JLEy+QNN4wGLjBTjazcuKkJIGja9qfU8yu2j
         bvJA==
X-Forwarded-Encrypted: i=1; AFNElJ81yitf56WJWslaa+jHnkVKDy4NDIUMA69rdC6nlXU49d70SN3xgndcyW8zXHf87iJaxf6hfp9fyEbb6uMi@vger.kernel.org
X-Gm-Message-State: AOJu0YysuNID3A59QmPIzkjf4tOuLu1iqo4e39Qw9i4q6RUfhxx25BW4
	J5TDnX1qGvgWys9C0c7amPAYXOAwHzef0Dj3bOt9lrnNUlbarxrrcWlTWWpWovNG0xb9yi6KWji
	1/a0unUQ5pFxe9krIls/7mnEt7peyKdvWHFhj6UXfd/QR8HBdIGbdN4CXy3xbmSXi6lHY
X-Gm-Gg: Acq92OGHhchKzttuM5BiIi4qjsJlk+tJSlgsoPjwhlJg6pfHjCHGM43OdKrhCQjaPTz
	RSiPBwOgmGmmxdmIDC1b3Tuf2cpiV5rvuRr+BQPunFawKLRvHj4eqXbLD5HsIpzUoSDxpwmwqaO
	+ClWEKturWXNqPBPDm8LtSxQBiG138GdlMDrOefHH/Tvk9oM36jID4/tXQ7xH64S2G4pzjO3O+r
	r7cBNSXZFXK9a2itqCpi+9vvYyVoJ3ErYr0fR341SjPgAiBHQh83bpk82jYt6dcbdrPSNx1vzlh
	2N/aKe9+jmW+qoVEZbwlrI+ce1DJqVMLLdjsO8traSyCzutMgkJXC02lSFxsk2weZhOosz3sh71
	uO71u2/enCZt206Jh5efhJUnKPRaKirI8wVlZP5zLGHSO9j0oscnQ8wLiaU7Y2tiRCFXkDuHOMJ
	eRNn7aDcQT
X-Received: by 2002:a05:620a:4729:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9159e1a7f22mr134386785a.3.1780560482836;
        Thu, 04 Jun 2026 01:08:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4729:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9159e1a7f22mr134384285a.3.1780560482408;
        Thu, 04 Jun 2026 01:08:02 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:08:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:06:55 +0200
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=1067;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=ZYq+Pc60R69TOKAA320tMHZs+shxB2cVaC/aoEkJNNk=;
 b=VPdHvg+wneaknitT1z5agc9YR2rykzv00/GbM6pzictaN2OjNy/bpSBXAekG5Km8/6Jqvp2HT
 bOpP6WayS0CD4vU39jUVjJmBd0KgZhH876krR1HMRCfa1A99ENtRT0V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: s-Cc5csGqM95x3DvKETOhLb1ihU05P6n
X-Proofpoint-ORIG-GUID: s-Cc5csGqM95x3DvKETOhLb1ihU05P6n
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a213263 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8k6WQxmsAAAA:8 a=EUspDBNiAAAA:8 a=4FSBBunRfCg7zhCRoTwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX82Iw/3F2lWiJ
 VNYLi+3luYTl5S2//tFlb5gkNyhYoSXBFJGGafEfbwXFO2M19+02ghL+4LXDSSR3hYXtrkxbz+k
 F4W1vxsxZktACe10RQbYJRVMVW+G5KvvEThbmic1loEPtG4RNYeu756+cqf8rL9KnYykdbnuIeV
 a9sZM2Wof1e7rrGdn1oWcGw1wehs1Oo8+r5ftDoOUwSSiZNw7ldlx+JMM7dA4bYnbpxoNJhMx/o
 Ll1EJwRvkevCmAz6v1Zi6HXcnEJeZjPV9XyDNtfx8vlG9vVPPhu3iprOgbEsT+Q8NN2DZGm1YAG
 0ZvnovQC/6ZppkqsUZGXXf7nUBHxJBwF+xYJl4uc1QUbYeEuk3wPdQcfEPFxxwsarUxuD5lGezs
 46yImw7n6TdyyKoWRXmXh645zp/K4DJRO3EFId4XRBt0PPlX2DBrt0QctfOgvFEDcx/JN6bg2nN
 By4vlDKaIK0FMaU/HzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lenovo.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: C3ADD63DE35

The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
Lenovo, featuring an OLED touch panel. Add a compatible for it.

According to the spec page [1], there  also exist other variations
(based on the Mahua SoC and/or with a different type of display panel),
but those are to be described separately

[1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.54.0


