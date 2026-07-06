Return-Path: <linux-arm-msm+bounces-116729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3X4IjSDS2rKSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA470F296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FR3p+D9x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bc5jWYbs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116729-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116729-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6203312CDC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7567D42CB0C;
	Mon,  6 Jul 2026 09:40:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1823BD65D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:39:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330801; cv=none; b=OvIY/X9CNEUUK474oVq7g8VXMe8+vzxNXQYvMVEexjqs/1xBBK4vKVATZQyJ7uhXPHC4jtwpYJAd9NKDPEpA0Zr5HvE4kXfL33EwNI04XjS1jLGw4PYYG9QX9/0LKyL7kPisXC7Gxhs0DgOu4kaR0N17euZkmYO8X/j9fg97mMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330801; c=relaxed/simple;
	bh=Q+ULKD6iTya6nNn+dmfSRnlhyOUXt+9Grq3kTmw9x3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BoNuKo+Ed8oJ/0YiUOFIhyKctwFGD5bk0AbsBQUAjk2hNf7NG3eC7jnnTes2Vl0QSkhgC/t6+I30+m1dZQLTURwcLz/p7S0R/VD1IBl1p/0bOgS/MA6l+OQY2J1hVJUg8oxW+lnbdnAk9eOWjI0hB3C0G5CZ44pkpGiNracbt10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR3p+D9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bc5jWYbs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xUw4151627
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zUmv+Kp1YC2bVA2CIqAW0t
	tgGETsQh+ZsJgZe+YBT24=; b=FR3p+D9xLZFygJQDgm5at6DsV8xur+MOB8/SNS
	ZnEDU6dl8KgeQXKTJPoCHF9I1rsaC3FkN6g89SbDa/hHVLzyomXmXSYb6EVS9e/F
	Q2emA+y4ioeFrec7kRlJ9FMPuISZsYTAVKUQQbjbZekh58k5x+heaYkXC96yxTjD
	VOwqIonordH8vjj2XCYSppPzQocIPqPO5WOjxLcywFzlLgEUUitCvehwWWcDuu8Z
	L/vay/xyClc6XQGha8jqX7Xpa+KDRoOHccaHnxWL8oKZ5Nw+wP5Wa1m0Ghk45xqW
	Gb33vU2jh9WN1fFAbq3/JQAYzk7TS9yC305GPz/usATS6GGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8d1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:39:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e606e8f3eso204582685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330794; x=1783935594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zUmv+Kp1YC2bVA2CIqAW0ttgGETsQh+ZsJgZe+YBT24=;
        b=bc5jWYbsQ6sS2uG1s3IVQuUlBK6kf58PnYMBnwLYQbU4+f6XP8Cp/g/I7czJUGf3j9
         gR0JVsvl4cPV+CAeTr3XCEMyJQ9pu8M4j2IQtgCRX8HI+DvftUxuctUEdAc8dABm/+gw
         qd1krAiDjiY3PZhOAWO7ALFe0+UI5jo3z1hobifqtFrK+kWIGZHbHZOl3+wff7xtdysh
         fOy6IGCsgmS5gpfyc1B2Ql6j2mcR1qgZgOXPyMJUaeey5AS52UKO+GpP1e8ffbNLhX4i
         w07t+kbNEoTNqxnHNCF5Yt3zakVXV9Ntc++ljWx+TJUN3lNe3Zlv1IczU9Uxl/+oji+m
         6i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330794; x=1783935594;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmv+Kp1YC2bVA2CIqAW0ttgGETsQh+ZsJgZe+YBT24=;
        b=WboRkmJrWk1r98EwIGWCT06rzgkFobImKB1uUZZ2dsK/X3tyW9780k3FEHnW94Wn3o
         qawDOlMjf2GW+TkqJOITtiJXs7foLKprXRmGrobNznmPFB45UAh+recA7bHsJoqy13uo
         nRlwYEOSHrh2uBFUNh87NtxxYWFnKX3VohrhhNmb3yCYAqOjt11ppCgLxjtrOpLgnyRd
         Dw88ppiw2dI77ne6NDkzE2azqjmzvs5dmaN8EhtDhfFSIy5jYeNZ/hsZ8x2H38xmHpGs
         KCx2PvOMSku7kzVCF90QZ8kol2miEAEFoWl0LaM34q856plTnDU+kjT9zDplNIMZsMAY
         wNng==
X-Gm-Message-State: AOJu0YxOczCrF7fP3jMMCH0Xkandudv6PJYPt7teFAUe1j24nk8XTPKy
	v6USrbB2XL9j6xXmM3byeq/qiXUzTaOuJzDvEIMbaWLcqzcWsN7nkDDOyBgX8xLRrXZs1IDDr5S
	SNriX69J/KREUz/7vW9LdoXIFPq82kW7A20DkLgQFt6qLG54n/sTq4lJxjHrwEOP5L6iO
X-Gm-Gg: AfdE7cnCTqJKtb6YEDthGxP/BW25T74acXYBu+jCcFpy9eBwNVicKWwlLk6XPUufkGe
	P/BwRYIC35gS0OQZxJzMIfXlfnHGPGsNnrmS6PSjyeURy1l0pHHQs+tOH8XU7ApNFqC0aEnhhh5
	JwXLwJlrz27PjsIVJfpceBKDjz8Su/K3GbXd6cib/qkBzV1syYzwfJhJalJbLLUInatwp0gAYUl
	ZApv7YR7cGIdedACtFCNINaoH3jXCj8QmhSqmxUPhX/qEFNMvY17/8IOgXPOI/9+ZZoZ01MpTbn
	SPPUhj7QA7n3C/Fmx88occDJ6Q0iNXxMUW7/Sh+F8hHHoi2nuD7slpjyZITD4vF+aTwP+k0u5dv
	javNHW8K2wP492EqsDSjQWEF8R9E1/WIkFnc=
X-Received: by 2002:a05:620a:278d:b0:8cf:c106:faca with SMTP id af79cd13be357-92e9a43b60cmr1279593685a.36.1783330794167;
        Mon, 06 Jul 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:278d:b0:8cf:c106:faca with SMTP id af79cd13be357-92e9a43b60cmr1279591885a.36.1783330793769;
        Mon, 06 Jul 2026 02:39:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Few style cleanups
Date: Mon, 06 Jul 2026 11:39:43 +0200
Message-Id: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkjbRCSuvIdhUaaDVIFKpxAJ4
 e4WPICbn7zk/f9XwRQcsbhmqwg0O3Z+SKBPmcDWDA8CZxMLLXUhL7IAGxlG9D1wXDoCbAlfFED
 J0pRnSyilEan8DtS4zzF8r37MU/0kjPvabrSOow/L8Tyr3ft7MiuQoAqkUhtdY2NvnjkfJ9Mlt
 89TiGrbti+l0yWW1QAAAA==
X-Change-ID: 20260706-dts-qcom-style-checker-108a85dec00a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q+ULKD6iTya6nNn+dmfSRnlhyOUXt+9Grq3kTmw9x3o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fjsuMkvMIjuFjC/XdExuMoIJHAd3KXGEhYb
 6OnfnTXnZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt34wAKCRDBN2bmhouD
 1wgID/43r76RJiUEme5FgTB/d24XU54KyOV4uEUR7YcCTeToGnZtDLM2r4ckIj+Qk5T+U6G9I+V
 vHAQkbImK6E0z01gZYYoiz1k8/hcMNC0zLO4X0/S3/G/MlIQyrYk43kOyYUuhxuFvso1rRTqLWf
 g/GcwIh/vAZpjaN6yTJbP6K7de8zRFyz+Rmb21SXbLdKqpkYJJyZ/IZwhMPlc/vKp3DSbp5XpgC
 S0+1Yvu0jBpd0QzuUdgczHRz9NenoWOUqvOJL0FCHO/sB1Ula/YOQgI/ACsD4Ye6ae+ho+et9HT
 zFXDv4R3jZJnTF4ipHpOt9zWdSLT1N57doc8f8jwIVzfUrL+xyVLX3BcZxx4drkU+y3ey+RXnC7
 BPKJxF9A4TgQhMS0b6u5VhAYhgXlViN6eafhiabEKBbc3t/tJqsOAPBofjhI8AzzkPvww1ma/5b
 fMnfh9RhlwNOv9yoveIHIZGhzKfjU/+3JgcfozfWpBd9OWIzxKNurDUAg7RXYOUTBQpQ0OaX1Mm
 m50xfPwlfBKO1LzOauUg+fG99Yz/0UTx3m34/qV/lxoaMHnZ8x5IBSmn+HAnArLnkXxJRoipUiC
 T3tLaHfR2RGGfoVYXQCSl5l9mzLR8EhdEUS6XPiSqzaaQbqJJw+lgtPR6SzHayDrtXq4ns76NtH
 RSCLgNGlj5cx+7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: dA36lNojzjL3a1PSusBb7vCjpjAas316
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX3kNisW379Fen
 cj/NkMJ4XvjR8tQA/JXSwbbi/iM5FxIHmEIWIPRgzUSGbDSHglcGHdyzqnTeejwGEaaaalamOns
 fHwox7kqlTtKgavzTafA0I882dNBOvgwhQrgow2rjS4punA/C3X4QPwGv7yjDCbkOWyGDk3TJ/O
 l5GTGk4+raf5O/UGdhTnWeStZh2c1VTWp+tUISmsFh/QbFIO22K2SQhsGzBO1ClhnFlOyPxYeVA
 Kex63rb5tryjjeUERXqhO8gjky1J4wSe+Kr0tBgG2cD8mVjcs+M9nyrzo5dbFnKbBpggB8wTYJe
 p26tRd9Xw2BDSBb9SOEyVupXlV5oRgH8WoY5HXHfttXv4/Go6bIouthqhzNaFBrVYQDkXdAkg2B
 zfMm7+Dahh/JzOGHvUBOrTTpv3LP64Qbg4MHD4Ao/Rx9ypt3ZzGwIMD0xShyakzxfCSQUxVhIxB
 +J0xCg69GHu54Mcao9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX3ee028y0CSfL
 4Ed5X2ft4NfXHhR9j7uanrc6rIuMCveCGbAusB09EVTL1B+UhKTHlNIf54136/2Bjjb2uXwN6oS
 zFsDugRbHte1PRhWosc2z1k1SwrbVoM=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b77eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_MK1DrSDlyI1SG9V7ZsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: dA36lNojzjL3a1PSusBb7vCjpjAas316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAFA470F296

Changes in v2:
- Do not fix splash_region@e3940000 in Milos (damn ABL)
- Fix indent also in qrb2210-rb1-vision-mezzanine.dtso
- Link to v1: https://patch.msgid.link/20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com

Few style cleanups from my scripts and one thing pointed out by checker,
which we will roll out gradually.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '='

 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 20 +++----
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |  4 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  8 +--
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 14 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 16 files changed, 71 insertions(+), 71 deletions(-)
---
base-commit: 5c92e2084d711fb164cddf9875ad9ce849b67177
change-id: 20260706-dts-qcom-style-checker-108a85dec00a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


