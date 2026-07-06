Return-Path: <linux-arm-msm+bounces-116733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5sSXBxyGS2oETAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:40:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546870F563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:40:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E6nMAEAb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gC/sIio1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116733-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116733-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705F830B0D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4E52F7F00;
	Mon,  6 Jul 2026 09:40:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039C42B310
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:40:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330808; cv=none; b=CLVyvj+chHOHQUEJAT/HREtVK6XpWRsDx8l/wy5QvEw0jdD9ZMR1XtM5oqsHFgzT2d+Ga5FLz3jrXbuMGFxfocIRtI1X498hWUCYiLzt0chyM+02KDNF2/vX7B/jHNfGI2Pwwh+wqVPM9/J4DGF/clzfAq3Q6zGL5NHeuBFtqM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330808; c=relaxed/simple;
	bh=xM4SQprlceSTwiHBTsSB07sLKhOpKiDutWA+2XMj2yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDipleL+QI4C1Wh9rSlctW38+hGInX51BQXkJ0x0PJGVxZyo6lxlRxrjalAxq7wNPEnlLGwCaAE4a8pa/nL9ID/iL9ykuX5azUz0cxXmDHhGa0rq0ewUhzOAP5/uvK8PMqPezcNAlQ3zt9CDPwsZZPBWYGSHCbBxxU4AszsLMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6nMAEAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC/sIio1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xOi109191
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=; b=E6nMAEAbqGKJD8BG
	YhhiOoZD/zBpRbRdvccqqt2qL081zDaaaAJ3sJzSs6kOtQA9Dqqm84+KW+7M69Wl
	SyU8V3nmEXVsC5yBzgimSZiUQ7oqcPQXxwPlF4qrLpGNtxoeYtT/wcFSnV7Wou55
	BZQWbWjnzeMUqJSb8Ia6i38tdm9woGNAMYnUtuNGVSGQnbG/r1b1hha74vZi33P6
	t53D9ReOcZ3Y2sT2Yj6jwbcdVrjiWaxNNMpgoU2sbf1xkZTO1O4FOltdhg9GwMu2
	YJBHfQCSNB7wCYblixlHZHBeagmGqA85hZ2WK7S34eOuiwwuCkr5/vHrEECKFgau
	Y9k+KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98cqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:40:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so507730085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330802; x=1783935602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=;
        b=gC/sIio1pCycxDnS2ONDvMFVLUGUdSOqS8pDGsan+Ew9osZ/eu4e6ndSO4+rodMPtO
         nETK3c7TfkJ0h9Ef5DBGqJ6UX+ZPF/282dh+P5gXhkVrYAbKJ5KbN5WtXtlD8yn0rXFm
         wuaR2JXBs2ThC8iE9hGRgg4BpLcZ9FAOit13spAzk87xTKbfmoV9iWhPaHpxd6rH5bM2
         Hd0hnGMQTgw9BJXnpuGSjv3OtmVzjWTlyFo7uTT/f03yE0N1rBruIgYPMwnvuLxOZpmZ
         55o7TfhAelyaglGJnGLhY/Ot/CKFlhjGCMYGF2lORtAOp+H7bzQpPGR7TK3wXf3AFje3
         gnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330802; x=1783935602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=;
        b=CCiMKWsgg4UYRS6HyptVcSkMp0cWa4M3AmTtSATwqo712jsFs1gW8PoOmhzEKjRvkT
         Te0twn+yqlYltDOVL3owWBcMFTivQzUxJQLbP9MZ+7Jbo3bYiSsbmhIIGlwqHWrWDdh7
         z1XMLNpNqgWbfP/dWAY3pXeiP5cisHS7j4gS7Y2sdInLk9+yWHEMB3bvrBfP4bkG/znF
         CcxLQP34HufRPuiOHlZEbtP586k+1RbAv+AbBfubSUKsbwCVPCL647A/r4/CPtK17JzX
         LUgRJIxhgi0Pl7evWbM8C2rTJ/ZnYscQA2ajRne2CwCqo6vtUG435dagg3qmzMIAQ/XH
         w98w==
X-Gm-Message-State: AOJu0Yz9YgJzeHQU5VHAWA7TnNyf7gy3cdbcw2teQQ15TAKxr9wqVXAG
	9j/hdwBZiYzzUMVwMGgPnHZ5lGnELL5QlFSSZ4sDuheIwGwYTqXiRAIlh8SurywH88Q/K59fUhT
	M9+Z+/VHHlY4AAPQ9l0uHaPYJ5/yu9CUt1MrlETS01ppJmb3r3JxE01WpTbd5g7aKmT/0
X-Gm-Gg: AfdE7cmdnVGwmAGd8Txl/zWmepQzw8tui24F29iMSG9dXdIx0avigcM+fxrXB4QaT+V
	bgG9sCWeiHif55pawffaiHLKmYi9pIO1ewGzAGl5QgNBnRLt3rC28NoQD05dle+amq4bbgSBMXo
	LT4BCcvPtp7X0BLJf5Wz82lHGa6/hKBqvPrSWZJtcGDuJrIHXz+0jhPe+Jdkbh5gYAl+XxPRYYh
	ZcRl6ep0wOGyGkZ2DEtCw+GCFQQk7TSn2LrkzP0B2aDluRj/6yvGJYIsvktpF3X15TpsDAY0me4
	whsGCNKpNiMSV1dhMBi/N50HVRPRzpValgwtGms4rku0CtSqZyoZN6ZpoO2OqQyVGXy87bQZeNg
	z/HA903eLCTrWWv4gYo4snenIaQOiUzgvX4w=
X-Received: by 2002:a05:620a:3710:b0:92e:541e:632b with SMTP id af79cd13be357-92e9a3621f2mr1245840885a.2.1783330802075;
        Mon, 06 Jul 2026 02:40:02 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:92e:541e:632b with SMTP id af79cd13be357-92e9a3621f2mr1245838885a.2.1783330801755;
        Mon, 06 Jul 2026 02:40:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:40:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:47 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: Correct whitespace around '='
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-4-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xM4SQprlceSTwiHBTsSB07sLKhOpKiDutWA+2XMj2yc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fnZIMZlxEKWqrvE7zjv8fcTmDkwsRMiKwnx
 c/gIh3aOqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35wAKCRDBN2bmhouD
 1353EACaa7/rtB2F0fESQvgHDFFpso3uB+Gp8/K8FpnzHOwd8geEjINdC2/mJKIfaCdgzlV6njG
 PtcXOPUjSBxuY5gVtsWk8Ac/Qj2DRiblc9mm+Z6vXBgP9QfBBWg8hPnM14gLCtsGAAM9wAQiT9J
 tG18/h5f2KarCrLWN+wY++2qdoDveJoZL6j9rt7Ims5bulM57CJLG8lGj6cNMKlspg3FYLvCDxh
 naZRzlDeSy0Kca+qFMkFRLQrG54dRkEj+u7u065uiE8gx6BbnASzhHAtErM40Uw2XFctvTw0LKk
 hv2yF1L+B+Z6eZh3MCXE3c7Tq26BReIH6RgY86qDAODK6mIQ4v0NHp66DQck3W77ek6zFo52v0r
 vnCOD86acosu6h36DBTh9qdFjJN9g5iakSn9T9THbyJfE6H6j7T+v7nunvDr2vXNtj4ilaEiKrZ
 BluAhg9U7/0GHw92DDGRQRIawZUA+C28AW+e4BkQjgmIlwg5+9ubw3zSAERNNF1R9Y3V4x9JjOY
 e+duVlJwYB4UsPtMNO66DXncKq4tfm0NFgZlmtU99XxZR2N0d8TGZZTiXACv7svdC9A3rzFy29+
 YY6YDAu9mu0Obis3Izmgqax/daDDo+zMxIRr4b7XaSz0OH69DXOfkF1PGS5pnP/GvQWvFIszzOi
 gb6wiEi0BIcSk2w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: FjbLOxU8wBEiMX-TuIjrQkAX0bhNkCXe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXwBy2p06VkVR6
 2vHKIpw0m46lkNYdImoAWNjvnQP8r+YVnPu2FcbT6HHpCRseV4kMkb4bGK3H3dkPLe/xfNSgN8y
 EKImgLsWh7dznmO8m8mmOcQLm5AKK8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX0q5t0LyXgJxv
 S+mNHOC3SLWjFC7/ZDwnMZHlZqhHN7daqQNcOPz6NrurWhJOjNG+tjQhl1xB2UHr2MdrCXrCW0r
 5GTyGL0DNHI0wgqQ5NYd/qYOy3XdFzGr29dDA7My32rYx5Ha7XEh17SCZLt9sYEugmlnuwR0cuB
 rsV/YWrvI0PHrB0otdj02yLAOZA3ubzgb1KbPAmzwjiaA4qeQWoAy87pqQMlzFlWUsQ1Cl+2Y+M
 uQMTjwjqIaGOmDfYYlOUWhAoyfR5A98Tr5UulLzXII7nsC4JinNg4OfyMYLPkg1GvfAxeHYMGji
 1HnzezdQOANXKEhJp0es4P7fERg0aCT4GMS5arS4TkePIo2jIlJMJfx8ZNr76flJZoRUu7vM0Ag
 4+j0wExeQBMzygAMSlBLkos0NW3b6xFk6A7NsbQLf9nOq5FqdBP2+MyUsY4SZteXm63t3i0Js5E
 pxGpWVeAex9pGlJYQcw==
X-Proofpoint-GUID: FjbLOxU8wBEiMX-TuIjrQkAX0bhNkCXe
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b77f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uWOkq5aS2IRcaOVXy10A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
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
	TAGGED_FROM(0.00)[bounces-116733-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6546870F563

Coding convention asks that equal character '=' in property assignment
is preceded and followed by a space.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8750.dtsi             |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index ebdca0e2d2f3..0c90c886b2c3 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -449,16 +449,16 @@ vreg_l2c: ldo2 {
 	regulators-2 {
 		compatible = "qcom,pmr735b-rpmh-regulators";
 
-		vdd-l1-l2-supply= <&vreg_s3b>;
-		vdd-l3-supply= <&vreg_s3b>;
-		vdd-l4-supply= <&vreg_s1b>;
-		vdd-l5-supply= <&vreg_s2b>;
-		vdd-l6-supply= <&vreg_s2b>;
-		vdd-l7-l8-supply= <&vreg_s2b>;
-		vdd-l9-supply= <&vreg_s3b>;
-		vdd-l10-supply= <&vreg_s1b>;
-		vdd-l11-supply= <&vreg_s3b>;
-		vdd-l12-supply= <&vreg_s3b>;
+		vdd-l1-l2-supply = <&vreg_s3b>;
+		vdd-l3-supply = <&vreg_s3b>;
+		vdd-l4-supply = <&vreg_s1b>;
+		vdd-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-l8-supply = <&vreg_s2b>;
+		vdd-l9-supply = <&vreg_s3b>;
+		vdd-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s3b>;
+		vdd-l12-supply = <&vreg_s3b>;
 
 		qcom,pmic-id = "f";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 71a70d051283..d5f3ffff0600 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4938,7 +4938,7 @@ port@4 {
 					reg = <4>;
 
 					tpda_aoss_in4: endpoint {
-						remote-endpoint =<&tpdm_swao_out>;
+						remote-endpoint = <&tpdm_swao_out>;
 					};
 				};
 			};

-- 
2.53.0


