Return-Path: <linux-arm-msm+bounces-117119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AXBTIwmKTGrylwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF87175D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JKjLJHtm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ql7kmyxA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117119-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117119-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE58F3056516
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35999366806;
	Tue,  7 Jul 2026 05:07:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E893812D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:07:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400855; cv=none; b=BQPwTLqLadhgulPfMI6XTYZMht22iwKlOIpEFTlxe0Wh3XFheMZC5KgdhxtwK1I52HeNNFONLWDenwJlHtZGpUv2BmW1aC6DAuIXOat88Zebe9e1rFx2pI9x6LM5Xw62xQqapEaG37xMg2rhs3kONgq1+ndiE9Su6XkBkSsqJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400855; c=relaxed/simple;
	bh=6RVr5NpJkkcCiFIoHGaOvdBVJjf0qL5PKNjHtaOrEWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVcx+0NVKuK4RsUkNWqu7WtIac70hcCHrBx6mH21ePrDskpgErN/N8p774UC04tXFLbiLxBMRSlZ3FWJf8yF6Tn+CZASjjvpUFF74XsJWPodxMM4fxUvuT9TW/KbJFkDrzAm3SkbZnXF3wmFRhGOes295pUzlXevo0SpCWF8RZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKjLJHtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql7kmyxA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748Wul2514291
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=; b=JKjLJHtm2mdFKt9x
	tx6hteFxEw7PW3oBCS+IZTvyyZ5ehwmLwcZ4FiqsMdZhjMstDIocLQ5xpGfcTdH+
	MmPee2/rzDdZMCLTdk6S1FKF4f3+umrArqF6RF+VqRSQvGluRNl6+EaaYid/XlkA
	4aKhY1Y3giU4wZgwqr/4kb2rvHV1099yRafn2qOvMMMn9c6io+CuE798zNs9iW9l
	McUSOW2OKOemez044ISt3hhZRBlI25onKB/lORjqrC8i4GhJjpHIKVp9THjUf4aU
	DrQm1iSrkNZ+i5a+/7v7eCK1QE02h0Xqx0E3LVYfZXGa9Rw53NtQmwjHDx18N86G
	ewekNw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8g8gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:07:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6162478a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400852; x=1784005652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=;
        b=Ql7kmyxAKk5FpJSySfZtTuwDgpEjiWMGGqdv5/siUydZy7jgLePfNRHUTgdS2tH4Ml
         uv9IuyLgJDGdhwNoQJ/HxhUl8RJPoxfNpTYoOe1hGH9nVnKg2BdaYYkyG9Y+FrZllRBV
         8iZovUlSfhJ4KamcyKmOa7nkjfFFwW9zB1JCY7cenBPPJogth7Ily2TE+R0O9wMzrOvs
         awy4W0FVp2sh5ia5n0OY3jRBlhxSi+5GZfG+TZhxWNt2Ub/sITbOuU6mv9OvWeV+m51h
         w7AYHSyHVE2ayrQt+CYDXIqL8xHoHwlq+OTgWdOvGMeZljWNP/KnVMzLQOm7QorNTThx
         952A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400852; x=1784005652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=;
        b=k2VjfHEfHfrNnqQ5fBcYPUrmaGk8IVmbgVIpUptAIJrYCKDRrWXOeOaYgyZ5Edr6VE
         Apc3paEca0kZXd0X0AneYL4HF9uVY5ZY0ZBgn1Gi1/gbh08reM3d3I5hWZD2mtk5/n36
         suEzHlHrJcnz+rD0XsQOp0lCV5M414CAV0RM077oQGzBOEJxMIrrQYgu7ANDksiKuRql
         z84vDf6Id/dlBjJAU6Xbgz9M+bMvsgDYnxHXikFhBM1M7hKbHGSOHtXn/TWQDdigETtQ
         96Ye5eEvta6FDQMQch+AmzK3qreLwzq5rp3SdfuGhupah+r4GVvek9jdNKCjW0fbnMQn
         /GUA==
X-Gm-Message-State: AOJu0Yy/EMzx0ITw9naFHVr5BTBJB8Tck2ktr7Hm82Obr2hvCC7TEfSf
	dYHGIp+/aTHMnBRg5R00rC2leDdIMkrcvWLee6AOnSyklu6i0Gm7Tj0R0zjHUD3usL7FMqL0wav
	kclsx5vEJUk0iGXUCG73GO2Y9H5xVtS6H8rKuDZzFvE8+qx1XPsM+CFfUzfcvNz0sqScLhRmXf3
	py
X-Gm-Gg: AfdE7clQisSr5tnmvgjlTsm1viWsSk2F2moV+e9UmF97fsE3uUn4n+CNWCmlLiU4ozh
	vZeXp4haxLSfbtAd2+h3WLQSad9ZQumFsKNLR5c8pBjejjnRBnz2NXSsP7uyTcDrhVXkiOcJYJA
	BeBBKwJffZeT0cBbpKplq8/UtxN1qSGkBtTjWo1+0RaieYf8s7p+67DMil93p5iC7R5bRQ2Y33i
	oQfGKKWBnZxagzPsufaKD5x3unSbDkTz0oo8xO0F0rImYoX08z/kr8hv8tRz/9ZIXNKtlk4CtW5
	xKhbFNwFZz8Ss61IQDJkZS/czIAFcUd3Vteq25SFr+n58i9BoGjGPBg/YlDkG+gDVwz/TFgUIbp
	FKWBeP1ivaksCjFy9PnPpiU2LKcyQZ/l+dMUMtH3MdOcJSd905g5NE/8hUCtbeXujcqnpLeeHtm
	U+d8qZ
X-Received: by 2002:a05:6a20:2448:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c08ed405ebmr4264981637.4.1783400852216;
        Mon, 06 Jul 2026 22:07:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:2448:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c08ed405ebmr4264952637.4.1783400851801;
        Mon, 06 Jul 2026 22:07:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 10:37:18 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaanapali-pmic-glink-v1-2-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=1734;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=6RVr5NpJkkcCiFIoHGaOvdBVJjf0qL5PKNjHtaOrEWY=;
 b=wjEH+5UV8vUL2H4qdqMyUzf3/izAqB2dIMefMiAi/8TtWmzjpT6jqXabn4qOI2hXGJYONuYH2
 WhQYqNs2ZlgDkAhsb8fdvAzzSiK3qFe35u7cqKigzk0m+5//JIscXAg
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX7+nvt8a4Kxvu
 VkGG/zlBb/DI05FA2sNSpmwtl2Bw7EVunHUL/Q7Tw7E21GPsDlQv2iSwMLDCRZliK5JGelj0KST
 o3eQYF9rCMySgtdfA7XtMmcrs1gSLt8KvNaAY6TQ6w4Blzht3hr/S2ZTACA7i/lk4rHO+y6Z/DM
 lReoMQ/IbKea8Vu2O1zqaD+q9PARdsWuHtXs/2nwIq//jUyWqix1Sy8nCzdnGO6WZfL/fjEI5U5
 bJswaY7ZViiBRnkbAIFpxCYmIpHzwZQ6akTR5jd1Lazs3fsTqO23XSxgS6wiidVACk+VAE/WXDL
 dNO0roGy3tJyuoiZnjTRtOQiVRATRod7mdAMwXqmlG/WORd7VTCGNu1W3ema0mfzb2vkpuKURXq
 Um9sUvAvWTXtAnS6oxHDQWYH8Mq4V9XGVKUobr+ryoxAyvAzhAkL3gUwmhsGzwSEmI/udgl6GCl
 y2q9kuFVEezIlF9RpOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfXygoSPT+xMnpQ
 i9oXVjt5fqhJcbyTceV3YyizTooOfAqPUu71SNEfxbxlBgRi6vMUV5CaKv1B/md7IFMgEYxdFDf
 Qa0d2BSHZcLzyLIvrgPMG4YXMxzeMkE=
X-Proofpoint-GUID: zJooxe_JmijOndvYV0ZmsLwNwOEFvJy0
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c8994 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7aILTqA_qkZ4MrPzyYUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zJooxe_JmijOndvYV0ZmsLwNwOEFvJy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117119-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8AF87175D5

Add PMIC Glink node on Kaanapali QRD Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..a79ae73acf0d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -80,6 +80,49 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmic-glink {
+		compatible = "qcom,kaanapali-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -823,8 +866,6 @@ &ufs_mem_phy {
 };
 
 &usb {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
@@ -843,3 +884,11 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};

-- 
2.34.1


