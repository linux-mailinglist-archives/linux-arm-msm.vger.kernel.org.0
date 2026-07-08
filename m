Return-Path: <linux-arm-msm+bounces-117465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sKI/ByPLTWoM+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0C72184C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SV+dAP+h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F36H3sPr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117465-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117465-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55C7C30398BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 03:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D6379EDF;
	Wed,  8 Jul 2026 03:58:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28DE37AA6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 03:58:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483139; cv=none; b=E36bqeLtk+qTkGCo0Cl8o+ol3bCrdR+SV7DTUtHK62J7JkQDtvUVd9Vzi2KBus1PO7HfL3t69nPFzP/5oEgySchMX8Z1tqJBXCK4bThP+NKKdUwdkvvxW8fxJj4IK48Vn2gg6Kys9RWGFTIaZXn0vuois4Ri9UVUUlkiLcAoKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483139; c=relaxed/simple;
	bh=jcBb2YDdqWv1otYxbn2Wff3itz+faGuhvh2N5yqzuIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIGAMAubpygUtkgL2FL75qlqrOmLQlPcSfe0wmt0cIuaSmeoY97ck0l646HU2DowQjHDSUwo8MHWWMlXW0n3a8td1NBPTQ87hEqCffYHFqF1rl0L+hNubfZ49dKHdjLEnf4LA1AK7JEuvlgh1+eSn3M1ptZhajM1onSGDWir35Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SV+dAP+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F36H3sPr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667NSYTr901045
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 03:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=; b=SV+dAP+hn2aK7wMI
	L6R38/BT4XrdocIMc39s1kXh6whQzQmOF/YuxxOVmFlwq87AVizRD/3XZE93pZc8
	PcwI34dSCReN+OG2KG3vp/BGzXD7HexD+3kqqnOQax2LzI+9AGr7JJXN9QRlie+h
	NM1fl2maAl0KomVHdzdIuSWYmLMfxQbU29/b4pjHiBiffM8yMLa6dH/kIrIxx95w
	2F5eXq0y65DBABdYoQePssIyTeH+eQncC6XZuIs3jdZ4EsTjWeA+ndwdqmQ+mUHk
	uczvvFIs0+TwgTqcvU633oE+Xg+YW1Ryd4jpYbJAdlHbrN05X0TSWx/l5+oBtVI5
	3eOlRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g8tj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:58:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca3b314193so6617685ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483136; x=1784087936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=;
        b=F36H3sPrPu4Xdij9Nt7Cr6Oy1E+XR6aZzMc+oFMVqYtuNXXECpGmMrfm1XBiJvkk8O
         iYNOAxZJefG2YjTEDk8D+CEj7xWYDu9uUfGhNLG3Pkvp9/6wGxvgGPaiQCBwudaNhy8O
         Lq6g1iBf5IVgO1lPHFuK4iO8zVYsQFe16Lg0jjN3C8B0CM3mZEK5XLMfoV0UvWiG3A+Y
         gO9sZgMMYxSp2T1edH6FhtVbzGHrj8+ENbDTIEJG1wiyfV+KrCb/1znu+3gP3BuljbjI
         nWim97tAVVtgsNoH4zAEIWaVAaVjZs2zPom8CItwFEMMErwZwlMZai4b1tIT7h8UOjBD
         OHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483136; x=1784087936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=;
        b=UfSwNULX5rB46ppXrip7mxlPpmoHt8nBirxW+bGDbzB4cwzn5mYW9dUXuqr93hSLje
         uvwDf8DT0N9sp/ivFyiiV1a9uwiNRL/k9xtZs/PhhHxENKsv/iSWG6hcdrAj/ehFFTFk
         Ab7jv4foDxlICL0KOJL53PDY588nimVLbbjryHToLPttponvJYmGGHFsbL7Cp7YsfUpE
         vvcOjdKEj62Q2qgaBws0P7GJ49ZZs+jQrhjP27v8WlVRIQqa+g44frqL4OOFbkqz5d7h
         ErI75JlFOzUVGgeZYJQiDmXOa0foNic0tcVT71R9rfF42wzDH1LGyzQGM5EXkfckpxrF
         KLTQ==
X-Gm-Message-State: AOJu0YwohmvVhXd45RftrsKPbjS+nDLSrnRb1uvDWYeTqqhVeuREcndl
	1JZiyEHPMcLQAgFVnFPFq2qK30cmGduRKK13EzMvKW3k0dm3J9EjmNdXVuvMRdG8+8CAAyXUEWB
	otyh4TuHR1CORZcVIqIwxMjApsHI+ZMTEKjxEAwbp5lq4u93mvAUEafGDOhVsiWf7zUNA
X-Gm-Gg: AfdE7ckkX1GR0zLhnh0rTGa/H45xrkQ6wpL78vTwKCs6H8Oof7QcyLRrwx/7YOyWBvS
	PuZPnnQSBUcVViMJ9UvTEwrAS7Hewsr7u4T+4YyOsttnLwGPRA0Za/V+1wYVcMyTnaRN67tL2Pw
	SXX+Zx6Mbsegtf8DL3737oYwvZXml3TGf9S9yUE9MPGdncwKRhlA2x+Fny6vLP1R7nkh+Cfq8Nj
	d/xlHEsTxguU/rGaIyBEtR//RwPchyNGTRI/6hkBDAht27qnN2BRyrs4rpM89X8CXxda5j1rxJ1
	tQNs2IUXc/D4kcTx+apqltNz+5/dntsU2Qr+azB8pwmoYrSWmxkCDek1Ck7YvOpJfAQY7kk8BCm
	4QMjQhp3Ae9IOvbLsK1qmlioUCe3r1eC+G/Ncvugn36/D
X-Received: by 2002:a05:6a21:4cc3:b0:3bf:a4c9:b054 with SMTP id adf61e73a8af0-3c0bd0fa859mr692001637.46.1783483135648;
        Tue, 07 Jul 2026 20:58:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc3:b0:3bf:a4c9:b054 with SMTP id adf61e73a8af0-3c0bd0fa859mr691965637.46.1783483135199;
        Tue, 07 Jul 2026 20:58:55 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:54 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 09:28:32 +0530
Subject: [PATCH v2 1/2] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dup-sessions-v2-1-da40f9c98a2b@oss.qualcomm.com>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
In-Reply-To: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=1078;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=jcBb2YDdqWv1otYxbn2Wff3itz+faGuhvh2N5yqzuIU=;
 b=NIU9Cph1kKEnebQNUvIuVcLjJmn8FM9KtYiCPWPf/yp1KGdMqb56gZbT4t3595WnzcHUhPLvh
 TAy6/+eaEwQCiFJLNN+7WLoMz8kDrC7rSQpFMEh2TiDFu/5se8tdG/u
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX5FMRWXGknnlX
 jAyrYcuXvHpKfTrMMvpz9WIl0P/UxyDjC6PG3i9iO/iF05MgHEewRYl+qRizqCrxflPXjTM516h
 br3hbfSSWY3PM0PI91zP1tE2fo0eZdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX7OIUaWTCTEeh
 cq5VDFrquc80sZvsQJQhFesqRAfd+gUG/PXxL34nCGeZyq4xb2DbzDwaXttKH8KSKPSSkQ82+OK
 ANoHTnap8rr9Kf1E9bOuo91JEsR3WZ37ahlnA8ke7hA37hNNgp+u07IHoSu3dPWBhVxY5pmDdE1
 KA/BQLzg79m1jaH4WaUefjHaxsy5+sMLhJ37Ne22nUw736KCX1UdX67rMB+WT9tilyIdlPbMi7q
 jsCt9lJ6nO7q/L8R1TGv21+5tKR6LKQR4SxUGo15sJkHnxPYmBkGWgb41PZwGDJVOY3C70XhDLn
 GFkU89dJslP7X/gUE28+yZYLUvSq9UTwXhiBtnUdELshQdHFyBq8PIzTzqPyTlm6IYABv2lKsmE
 0Hq7XoL9gnoL54LdOpqRgr5IHdJ8hgA72XETVuxhYNNmoGjoKwocnJHp/3YiisDmnbj7A7WqTAy
 +GxQE5zl2dP3032Uj4g==
X-Proofpoint-ORIG-GUID: HcjUiYTpSmBtFPbx-KaU7vxx_wMdDyIh
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4dcb00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vVYqS5fJ2MeE6r2tohgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: HcjUiYTpSmBtFPbx-KaU7vxx_wMdDyIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117465-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63E0C72184C

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank probing. Session duplication is now handled
at the driver level, making this DT property redundant. Mark it
deprecated.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..683989c468cf 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -96,8 +96,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1


