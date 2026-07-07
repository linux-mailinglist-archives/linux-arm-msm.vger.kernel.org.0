Return-Path: <linux-arm-msm+bounces-117331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zFqxHqkCTWrMtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71B71C0FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YW+u6zyh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PO4VHMMZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0401F305C19C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496F241B351;
	Tue,  7 Jul 2026 13:36:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DB175A77
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:36:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431383; cv=none; b=G//SnAi2ey50pDS8fpWzEsPADY/HV4BggwVytcdSVfKcDvvoB00mATn7KJUSCZ8qzzOZxWp9420uCW45Yb6dzmYf9WBPPw1TeropT1NRXfCt9TKMpdj+zmH5bAMCrrcx/a3FeK1Aw7kVOIsBfQiUJbe/bDwwo7/48hXMExmMKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431383; c=relaxed/simple;
	bh=LBYnKLNV6DLfCXsjJVNhlhUDruSjToXTcPI2Df9FIBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StdkjykHKREOczYO10Iuy+e7gt0bjJV0R3facGFRkFC2lyBOkRpM0BZXvyoIxnG8OoVD/nuSWKZm7RVKxQFhOlcxB6LmE/Qjd9Umi8HSEN15B8F+OSDCz7XMdPNnAOS+7cWaA8fk4gp5AV+WDuZcjh+AeMDoDk3b8cewXhDAKAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW+u6zyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PO4VHMMZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9ovf3741505
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=; b=YW+u6zyhTz0zSFHy
	t+CYxd4mXuvLPukcZHfJMqNH6hDZUSRtgdeJlinwamW0oPtSJOrvV8i8poaJC5gz
	PulKv2yRvSNMvlewhozbp4Zaa9OvZixVWwx0k8hZab95KIyU6PRkKjK894ePanKg
	itfa7CKVfh++bWXlW/P67M4pTsG2LnSgkgGy8FIrfXEbYXAF7Z5mpzatNf3HymhX
	xhzhXMquRUHi4W3vCC3fuahoPUaPXx8YWvEYp7FIoMl86F2rHCFbaeYsM4ACxMDk
	dAvROyvfukZdzV3aHmXqb5aH+Mn8dSgMhdr6XaT42zmglwV+dcoo+Mm4/NNLaCya
	3ntK3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9pm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:36:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec45d9628aso95145326d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431380; x=1784036180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=;
        b=PO4VHMMZ2DZSZJ0SYhASmU0l9LMlcGCQd0nruAxPmgPTF9CNamtkgH0hWRGy8serus
         TB46Mtn+uZxtkRuQRZqgzs6xpjVN5VRWeqMRyGoiycC6L3ElADTE7iJe0/wupEZcWaGj
         Aq4rwJIQD2u/KDdD0jHA3SU/pCQKjz6mear7/sXvGBcoLQiWsEiwsaLlD3pQUkXQjdmB
         2hXHIiMPT8B+gyxco8AiCsgJDiwxpYzpvxaHYMaI9PuExsrVxnRobRlpfYnrh7L5l0WI
         +D7m6HaFhl2mARVGFYlmXE206EwZG3yD+h9Alu/1Jb+pGrFjykjt0HKh6PB+5d9dgbEk
         9SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431380; x=1784036180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=;
        b=lYs01LILmwOy33f0yzjtCsBiJIVxtOUfS6uWS6/RWhoC+ckmM1xHYJ6r0raBlORmea
         f4Eggf/8GJOaz7kV7n4cQqqWSTKU8Wu9GXi8+9TWFHwhzDzgPdvkDUtkh8UCnrCs1Ozs
         PQ/z0IFk2nrxHTcPCs+hWWlsaWA7e1uWf8gitvdbas+liWAClwqiimyCjg6mu7do0DpB
         nxEBrq+nofsxHukaHM5uVQSIZjgFdXWpKfMZF2R8B2Ntpm+S8bsrhjQJ0QGLNKEm80IW
         eqtUil/J/iahP24FpNUysRvMI4enhxOub2UlQNM5pvfSWoM4xCVVEzayxcGWv9k6+ZQ/
         9YTQ==
X-Gm-Message-State: AOJu0YwIjp3FZ7BQQSbDBFvCJPxtco1gQuC5U8jIORp2C2vqlvPKE3+K
	0k+NoWpVyGTKdJzF9psp4VO+RtQ+BDb4X6y9uvehqbfUw2nwn+e6VXMdWt+alj5ZufoQyI67prM
	Q3r/ZoOQtwf/H9HLEgY4lWd8htR3b6Z5qTLmz8y8WN/0ZlLyhTrMrxdUelfW2FunJAJPM
X-Gm-Gg: AfdE7cmxG8an27pSmOz/TUfHoprMTXE997sbicOFcaXCVGKRNshP+iIEJeSkvWHM81V
	HdaBTTdzzcBAAD1+cTPs9bUeWz6jZcR2adllI+PQAeBLp768GihGL6MhMlYzUzYpoDtMGMtAhDk
	mn/2drb+xq/LGOtI+1Jum8aaF6IAgyYn/oEgRBB2JmsG8W6uYhxgTUAZ0G4qRLMUbRG++EwXFDC
	C83QKoWAoB5q2Dm8I4dHMX7DiFGRmXTJ+Rq/v1zyWtgyTKjz7fUUYyp6r5DVzU8DtFlDPkJ7os/
	4lRinMPIOQE7FnKxlH9CuqGIa4sRVj41V+ILPLPbNJ1vtovpb/3aynZP7DDMWzNlBGf8v8bnl3u
	/eta7HeX7rxWiJDzWWX0H6wCAkHxVTCOmt1g=
X-Received: by 2002:ac8:5e46:0:b0:51c:147d:9bec with SMTP id d75a77b69052e-51c747be073mr54621721cf.6.1783431379731;
        Tue, 07 Jul 2026 06:36:19 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:147d:9bec with SMTP id d75a77b69052e-51c747be073mr54621331cf.6.1783431379194;
        Tue, 07 Jul 2026 06:36:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:00 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-2-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LBYnKLNV6DLfCXsjJVNhlhUDruSjToXTcPI2Df9FIBg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDJhsSScj7W+3/2MZECzUJYRXNZCl6MFzC3K
 ayYFHdRZ9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyQAKCRDBN2bmhouD
 11JwD/4xhS1F45tuEfqYnXN/zwejXXePnPIdnwnDpSPlz4rRqFJ/ALIwjX/cxhJUquGTJm6RrDc
 vSfgr9qohFVpwqVmMUgE3OTInC3SLByHs12ZGTq17QXqyjwl02VkhhK2KVP9Ps0OqzZoIJvUOb2
 aTb1QOI0h6kqqbk2diqvDVZf4SkwBb+6t7XopnPdgG8dM5qz2nwkQ9B48PzP3ys+06zItTrF9bK
 qlYHve2dqb7mQHyqy2VB/zgimcawBxGbbVThvo/bOKTrjkQDz7Unj47/Bn+hUxQ/vHbpmO7MCgI
 Ld10jid7pKQVw1jwlJwUA1wt1vQcMhjuvBo7bgv7xIqwpD6Vzyk81POrp0I6ilmGyABVBxpfADx
 +682HnwtBnvRlID2lBWzQTEXsqN/zazX9WCdtlmYBKTBPcRH7Lac6pIDu8ytkjqocI7pPYRpSpI
 Q0plpeTg4dSv1+gVvPWhAJ74H4dNkgK2AVaWudHMOKRnIshm5/hl7SeQd6rIsxFN9pxYZ2dl9M4
 gBAjrWRmW/1A2Cx5VOFIVm6CoUjkGunlBGrbJbxxh+W46aYm9cdEpjOsYS5LMrIu8DpCjzJ+dfd
 f+BDXCDvaqBNvW77V9IAQBIQef9m7h8+g14wfyD7q7PtUmy4WzDuHM5WlkxQM5XYtPg7sol/jsy
 zdyQAtLbwIYA6WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Uak9LiRqXonlyA4OMr8gGcGMFwZjLGuE
X-Proofpoint-ORIG-GUID: Uak9LiRqXonlyA4OMr8gGcGMFwZjLGuE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX/A/mhb0S1goF
 5C4x7TD5YnX1eArEshlT0S52CuSjALztf0yEflG5axyqFxSTPVidGtPUptFH/bgx0C8CKl7ED+7
 PmDrcme+IDnw8cxQm2rzCOFQj2SzW0w=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d00d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX3s1DaNUJd85G
 +PITmSkpR5m0W9RkldhBTzkHLX3kcqNpiqaPeb+PgHGbSuPZHlIH1TB/gvmAinXj12+YK8ROsqu
 MV6hzxTUOvw9qwcKZSem56b9Pwu/TasoGQYaQdzUEiZQYO9y7F/Cp0L9mJBKQNKXapY9I99o7ps
 zwr4zzsThSzPi812zHPJuZpVq+sTw5nTf8RamiVgI0UcdbmlVBmymgC1G0yDB7YFXSfOcZ+OyJC
 dyPL3T0xgZHM0Y9aXhl9tc5HihZznG5VnHZXlShXcZGfeP1Q2AozCBrE9sWnUQrofsC2+imyFnG
 qAu8ViYqK8nCU1OiMuMCGrxCEb+CFA46OJHf5XJdi5ISAo+7G0SMAzkVwryywu+igs6SsAFC1JH
 TrFRtKWAcSuIrgeZAu5ToF/KPI46JfFx74P306ofFHxmMBo7jq4NIFe/ewwQr9JYT90V4sVuHOV
 pi1LdK5OmLIMK3Bb53A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117331-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD71B71C0FA

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..d934afd59df1 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,20 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,apss-wdt with codenames
+      - pattern: "^qcom,apss-wdt-[a-z]+$"
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,scm with codenames
+      - pattern: "^qcom,scm-[a-z]+$"
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +63,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0


