Return-Path: <linux-arm-msm+bounces-114823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i60SJ4/3QWp7xQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:41:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A116D5E83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:41:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lgUdXXon;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NaSe1Im1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62385300148F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DD637AA79;
	Mon, 29 Jun 2026 04:40:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA137BE96
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:40:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708055; cv=none; b=kOBokkmgP5dLpNf8fqr2gwqg/T8Ud8d9fvLOs3SlPk1Sy1K71x1TT1UEuU9EjT5p4Klfmcr6HMaABUBwVKn8Fcqw2A/X5tVatWYKrqeV0KaftRfKPCoc1q3kG88PrMqpfeh21HPGN5fJalYIOzUNgp5JnuNyuxbbDQsVJmLgVLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708055; c=relaxed/simple;
	bh=dLReet4qk8pKCmyNfK4/VwN5WnHNEfcbrTrlCI49Zx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IBdJxYowiUS/41a/BT4gohffaxuKIw4PPwUlTW0tysNoMQohhwkuhjm+x19NeMz6Cr1kRsxc6PP1nLQLn2T3c8hnyxef1SYETXo7HEah2rke/T7eFE2RvTJuoPR2kkBNCuJNj8NsiSCKEAoB+/XG6fAnhsycSHM6h7D490rCnkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgUdXXon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaSe1Im1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHFQ1771453
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8FypNscE136sRgc5I80PXm
	+ZncAbl9/Js1MyTqglHjg=; b=lgUdXXonMXdgVEDrA04Vj37xDsifNV7QkZkY9o
	Uj5bx2rHVwmdoWQ9iRJUezkQxUQBSVBkvjeAPqEc3r/nrxadwNMR1p4t2Iw+qMMG
	XsUqOhYT2Wo9PpJxGM1GPRs8FZnT/xCdD15RypZTUOZmA3hCZ7XM2zJ19dDWuEKo
	CfcndkKUaiTvF2VtTsstg9BWWUVf8G7iUI3DJ3DFipkpS4xbNVDfCQneIA87ge9q
	5RMShNuXD0TCoYXnhRtp0PzvN6nMeJq4NBl0yJ/9/XU+KYbSlo9IiKRVUDo0u3wk
	0xOFtkOMGuM1/ams7IXoq/7rZYF8BrwV/PLqahpZbFh4oWvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumdur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:40:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c42d96713so1778464eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708053; x=1783312853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FypNscE136sRgc5I80PXm+ZncAbl9/Js1MyTqglHjg=;
        b=NaSe1Im1dLhjzdz9tUcnfuMiCoNH4DbWI4nOPaWV6toktpRrAYRZy1jpqj4V69PnX6
         s0/5um9QhiKx6iXiGBtiPp5GI2/YDCvQBD9Ti7Qd+Qc92LCguyv92FE7juzURjLoNW0X
         WWiTIBEetHhkZlBlSE/15v20Zot1AB1gWPTS0ui9NGcXQHmk0q8fWYJT7UHpGrgc83Vh
         9k8bG9BDlA6q+ftxtym6iQ2GpDDtP0eFZMj5kX/Q76ykJFt9p6hjMu0AYF+CqDzpP1E5
         ShkHBFLs3FzJ4FE1DL7c5oJewpIB9V3X4YIYxkT1OVrmKhCb+YteKjRxYCqksubZ6wwA
         WvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708053; x=1783312853;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FypNscE136sRgc5I80PXm+ZncAbl9/Js1MyTqglHjg=;
        b=Fv0z/9XFyW5mU3w8ZvmLjuxg7TW1vlO0jO8CEvHxjl4xm87Fu2SfwkdwKrHN8A6s9n
         fdreVxdd7YkDUeqLduYKmmqpYV7roHyuIjhULwRJy9rXDgBOar8xiJHnik65Tx+WeKCh
         poKzAxlwrCCyBtIfwxZqGorCTscXDsPsj6U5sJ6Dj898J6aUwExWJB4SAb6aTaiZy5V1
         OUoIIz14GtepNfJx3fIeDWAtM7snwwFTvDuexMZ7W4njhcFkMZH30kadpHwjbCf+lBXQ
         7NcVcwUYAds8sdzim9AmlND02pkLQM81wmwcid0R6wsVTO01Tm8ET8hJ5Excs5zwYGw1
         xThg==
X-Gm-Message-State: AOJu0YwzA53kyPdrn2eNn7hMhpbeRZdt85Qjod44tkQnL6ml3ZQLA+nS
	qJgW86e1Bl2HorkDzTxasHkd4ItepWWiYLDEyopIIcT2dpLzht9aigMSflDP3XOlJZtLSGWUupC
	ErkQFhw/T1xyicVlQ1ai4hBDL2vo9SQXsRcgBlHijyYGkYluWvHeyjPMmoGH/sic2pWTo
X-Gm-Gg: AfdE7ckIntyN5jwyvJ/DqzIhFYDOuHDfImFxUMpl2BBRZMNOnCqi8XeZvFZ8xT/Ks65
	7CmWdtLdIkmcdpBYgfaSOogQbYaopExV0AgV11YVP+3imtBRRmOsPYl9PaG70fe9b5468dU+ITB
	4tKQp62Y8MPNzD/T5/Tz7V05ZaGOHYY6FPNl1btZzY8gOplRKQroioKMic3w0SV1otjQPNh2PfI
	Gj+oQaeh+ecqvqt3oSWjlgIAi2Ff1Y++H1rUA/UteqUcyUKG8vMD/XWlf/khvVozM2iFwElvyxA
	gcqgI1eVG4abBlaHuYlZvUkjJo1yGTEJaDbhkZZc8cETBzI5u5rIeFIVMh3k/itU0W2JYWfub4E
	VRZn1RftVA+F/CTWp4d9pVsvm+YUMkIGqWb9vgvzx9UdpZZtqQXVdmr4Ki8XKX9p1Gq+xeg7q/I
	I9iDRMRXOV9G+QGNh+U1yWbrZhZ5+vMuVsDqlWghtk
X-Received: by 2002:a05:7300:7b83:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30c8511c2f7mr16170152eec.35.1782708053141;
        Sun, 28 Jun 2026 21:40:53 -0700 (PDT)
X-Received: by 2002:a05:7300:7b83:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30c8511c2f7mr16170118eec.35.1782708052646;
        Sun, 28 Jun 2026 21:40:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec3e400a2sm11849664eec.28.2026.06.28.21.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:40:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:10:46 +0530
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE33QWoC/0XM3Q6CMAyG4VtZemyT8SPIbsVwMErRRn43JCSEe
 3eK0cO36fds4NkJezBqA8eLeBn6ENFJAd1tf2OUOjTEOs50Fp+xs9JWw4o6aoo8r4iYCcL36Li
 R9SNdy6MdT88Azsfx7xn10+zoPVL7QK6TglLNdZpdzBK9xcp6Rhq6Tmajel5n/M4SKPf9BVqNM
 eW6AAAA
X-Change-ID: 20260625-mailbox-01f977bcceec
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: SJAUXKgg24EJKWOQFUVkQi9IzmskH1_6
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f755 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oC3GMwBEtLq7gvGfhnoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: SJAUXKgg24EJKWOQFUVkQi9IzmskH1_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX/+s3oJxvhQOT
 T0MlLgFiWZuZP0wyeZ7lUzgO7tjvIfxZUNLeCnoNJdKfV6tESBpFdJqc6tYZnVJ107H4H0cOa4Z
 tTa2qxv78YI7FKiOgcnTsUyt6ZMy0FbOQJL4W5aK/vRDEDZ92W6a0u6NZY5tmX+CebfWQvDmxiT
 DyCQpZmSGL3KV/KA5DCbzxuaQEuLLHptE9oDsbgOk6yS2uwhjHUuVjiwY6CZGttKUJ6u/N24IGb
 aF0/xWYh4SDJWu7WE4iKhTZOVu5KknyegPdopnkT+gM/7ghUGtum4GKOAgXok5MDZeLViT2eBQ9
 hSGBQza2nXk9K8koffNK7jVTrnYMm/ssfLFZRvIG7DnWLcRwXdV6jGzNpfBixy0sXykKbbl/P3z
 EeDq8BjYLJCkNZklBhkOfODULGZB+bYtKiyxbVt1mtl11IQmSEMyz6JH0vBy9nlv/JIvTCunyav
 p7Mx866EBMtxlOA76KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX97VHgYnNOQwf
 Ke6g1nPpN525MY/TmeAWpf2I9HE20ayoAm3b0XoJPntMna9tn68dV7ksVydj9XAwaX+tkvpyOLT
 axLWC6jVEwTuTzpvbFpw/XY1+Uyvl8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037
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
	TAGGED_FROM(0.00)[bounces-114823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jassisinghbrar@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A116D5E83

Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
APCS mailbox compatible as a fallback, so document the valid compatible
string combination in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
no cover letter contents, it is a single patch
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 1b4ef0688ca7..39bc374300c3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-apcs-apps-global
+              - qcom,ipq5210-apcs-apps-global
               - qcom,ipq5332-apcs-apps-global
               - qcom,ipq5424-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global

---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-mailbox-01f977bcceec
prerequisite-change-id: 20260625-apss-clk-ed39c40ed468:v1
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: b4b3a2f745b4d83a81939f46ca3a4c871cde73f3

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


