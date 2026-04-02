Return-Path: <linux-arm-msm+bounces-101408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA9kC2LVzWn1iAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:33:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6D382B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B38030451C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 02:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E75033A007;
	Thu,  2 Apr 2026 02:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5gU7t3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXSjWoC2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380E258CD9
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097096; cv=none; b=gNBkNp39DNnzuXTBCsJjG1VXsitadPIIOdjNKDxNNuqtuooJmhIDvOAI48VaeC0VcLidZJVxPdxMHlS/Wcic7JtELmVsW/YN7l3TEibmBjeVpG+10w+s12IjyUl9e8UuAOEfEhlMr3i2jkgHpm2SlOfAMSzX70/Q9O8WvLRj7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097096; c=relaxed/simple;
	bh=2a/odLExI0OX80jkw/umt5Cp4KnKvx6Mjd4FhZAIDFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+hsOwTLYjiWPhhveNwTU+123BATaO7T8jy8+f9LHrHPgBm+o/B023h+QixlkBCgbpNG3prchTxxtg5C8pOePIgaNpdHKL+Nd1KZtVqVJOk0Vb2kaOuFXC9rZ8aTidPG+N5Mt9T+cGCcnKebygk1uG6PKWoE2dWy6SQCPNkA+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5gU7t3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXSjWoC2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4KtE3044199
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 02:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=; b=K5gU7t3V/x0SGVh2
	4njS18c+9bAZC7Wa/m7tW0rpbRj2PALXbI/qcRh17zNagsfWZUBm63huahCJd+4k
	iaLPqzjqCYAJm/6pmr5Xsv2OkvnLFJFxvFDY4giQEeFDCShOkzSf2zaOp00YAGWS
	L8y/xHbJtRDJLiRk6yC4jkyiod6+7mwj5y20Eag511cz/1webOsAYCE1xSeUyi1X
	z16usAfIleUhpvAeSpDaP3YF8fhXlSHGGdnCLN+c1hkM/bfedJKq+nWtdNrA3wib
	u7hmEVcBw8W6gbLyhuJm+1pJ7/Hx+322lra6fNjuiEEygb4wko+6dlSKfepvntGe
	aZpuyA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483tkbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:31:34 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67deac23e02so1047990eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097093; x=1775701893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=;
        b=HXSjWoC2Bks/wIGIBYj7AFVXQ8r7ryfMu9MY1Z7cBPh9YOT2IEPXfoTzc6lFMxYQgq
         rXYZeQAGNymFErHA1V3f/e+zI6pdwedWr0PZCJ4EeWVDzco8ST3BppYWWDgJidhxdE71
         Q99XxJGx4uAbl5ITpkyMo8yWg+io/hUfpVES96gyLkV7dgtuEMiHiqo59HDlkQHQFU70
         j97feelwu/O0kqYs439cHF+CLv0gP1T+SDf3uM+5Z/0PuB6x8CcRSEhSEE+bQGwcw8VD
         3OjXDwU/gSOFnEiMnsoJgnyt45X4oR4PeSfuRl2iZbVaVY/COk3HhOms15T/tzyOQEKi
         KeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097093; x=1775701893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZEutISPWtTLB6mtNal6uCEIF9hJY82tKMXDVy0zaJk=;
        b=hylPBBtllRRNmDpBwmTnlYyaJJtMHnWsWmnuxrctQmV+VkJkA/fjH/nlqCMiD72NIZ
         TTj4eh3RMPLOMpJLH4zttkUXxiYbiWsYx+T4UnqPhLTr09D6tgZ6/Zwh+pxv6rh9iMWp
         EzuzY7Y/LAxKO5Sde4cx+iFGz3GMH9u0YLq3dAumLab+C9pDWnDrm7ZQjW1NLKTnp9X2
         hhXAyW7gutOYux5TSmnWHYZRwVH4CAd24+Wok45Vqqm/E1ecE9jZJgMMkEQPdcGa//VD
         wEaecXne8TwUCkxdwcl//2jJLDYKrW8YCbJW2ojeBJV+12LsW0X9H4dyFrhX5WWk4rs4
         PBlw==
X-Gm-Message-State: AOJu0Yy69OAXxaO5XEMH61+nlOWAAt3wbRHBvfHdN3BvcDolHlBUuZ9Z
	vLyWh1HAHDDrqC0yo7wVzV1oifFYjxixu5Az4Iy/WjntqywRQm7A7tCjLFmER9CD63I2ZTSMUA2
	Wn45VtkMfeNBeFWTLJqjWOGkgNV4vclMfVKg7NBZr927ruJUg4jTz5M8srBxNK2bMyd+b
X-Gm-Gg: ATEYQzzFSeVCqvQlPc80439f6u8SpI1xwGwNxA0HK9oh9qPfHdKZv6VmvMUntiQvfN5
	jknCzoUMEzlgvVatfMBtCb6po8Bg5wOyV45pf3A4DD9lcYgonyDHXxmzhlDxJBM3l6L/eAqM5LT
	1Am4uLCsXc0vrc+SkKsz5AOoRYsB60fQkQqveySYTOeRwl7y6DaFxMtob096JAlFZMHpkBk8uw6
	ybDh69tDQojMJxiaR9Epn3WEq//fngW8HkaJ57ZBP04ICLDSmgyQ5/mGcP+1A/0i3T57W4yJpMV
	dlh/lAZkiSmdSDcgxO5Gr67NXx/7fbAXveN1KvyiM+ZBcUgxTIdlNbHHwcqeuAEGbLTkdvsmusL
	i44OUSJPnwSe1Mmk8jSTna7sCMXQwGgjx0y4YOQG7Bls=
X-Received: by 2002:a05:6820:a08:b0:67e:16b4:aa1b with SMTP id 006d021491bc7-67fabcd965fmr3002339eaf.53.1775097093499;
        Wed, 01 Apr 2026 19:31:33 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:67e:16b4:aa1b with SMTP id 006d021491bc7-67fabcd965fmr3002327eaf.53.1775097093059;
        Wed, 01 Apr 2026 19:31:33 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:32 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 21:31:25 -0500
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document the Lenovo
 IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-ideacentre-v2-1-5745fe2c764e@oss.qualcomm.com>
References: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
In-Reply-To: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=2a/odLExI0OX80jkw/umt5Cp4KnKvx6Mjd4FhZAIDFs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUCtaDErh1lAt/kOEShR5fUxyJa8qBiZtMqf
 M3EkZOU8K+JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXmGBAA2J/kI+gf1o7m2FNjWXZVq+U3qkyK3AFwas18MEG
 8E2IB97qmm7MIZTZoauYPpaZ95fYZ0A5u/pQKUw1oKWxVB2J/gNFBIRrghJov7DLGJRPL2RxAcu
 5R4CGvlnl25guQNiTtjzj+kYNDRSm5NhCBLszjCjOMb7OSQzUrrgiJ9tbA/dKVzsBTxaKsJxU70
 rmeqjhCzIsOsqH009r0mrGwXNe4MIK/NukdumfVH73Je1CYBF9A4x0qLySapNZOc3+i875Po2lD
 AQN4FkR3UMDnL77oSLFxtMolOIrT9lokYF/7IobSfxfze6pEKPsyYNTw9JVHHgsPrWP5AIbH1uV
 /CHZEHYFZ3zKwn75RkCNjCBlPMq1vxsmx8ig6F8Qu1uaTbeWUfY1oUYsSdx7ha7xB0z1EQjDBse
 vL+mXtHz07xS/6wB1OIZMJsqVg0XtfXDqjUsmPiIzNDEaOHOCFU6Atyyq1hRJ3eVC9AmOkkzmtQ
 sT8E3LXFaFAuUWN6jXNJ/B983+sbkLDxHhww58gyiwafPcFs2hL5915bMCz1Q+xgAQQDT5jZbov
 mQnP/rDg/9fRlKT7qm8fAE+78jZemnEm9coPf6nVgLa7UJtDPeYgdYO+ZWMsuyVim52CswLHBVc
 sxP7NiLnIHtRuu0P7PpJlDr570SINydW8YjVZRS8X/e4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cdd506 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WzdHeGATqTO1y9J2u-kA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfXwoiYTAIAtg1c
 9idaRS1uAw4A4CvUHoT/VUFhYe5E+o8mrygq/FxoatPqz+fPMI39JYJuTObENElanZbDDhIjUy3
 wCBScKzzT9QGCm6HmqTMFjnKoekGljHGaqmujLfpwckVyNeqx4PU6fdqXs4yEjSgb48GqATc7HW
 h7gjXpZ/+yUPOQE4Y3DOOgjInbGHGR3lw2j5i46mVKuXgtnrYCqQCY7rWXZ7gHOL6ptMWf6GiCV
 tfPx9dB8c/hr9MvxhuYezuy5ewX47NENu8kv1rEDaIVCeoM+XbX93642vBitxsf8beAe99G9J5B
 ubnLCx4/IFQlT5680yke9BRA6TF8qQ3YBKzvhuPerOCE01hiwbfzb8yREMzj4RZtvNkWSmGOWlj
 A6F6EnRotX8d9kipxvWCNGdRzasXK+mGFDa7szrplNC+Tn4/q8UBuiaY6jItGcCG1sV/Xigktyb
 T6dtmjAMtFr/dNOU3nw==
X-Proofpoint-ORIG-GUID: 2QqanNT-nqjcwsAZo-x_kZ7ZQcL4kIv1
X-Proofpoint-GUID: 2QqanNT-nqjcwsAZo-x_kZ7ZQcL4kIv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97C6D382B8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
headphone jack, WiFi, and Bluetooth.

Document the compatible for this device.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8c5fdd320cfcf723b982cf10d886018dbabeb6c3..a7d212d75bff8ff9ccc680ca61ec9a97a091a81f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1148,6 +1148,7 @@ properties:
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
+              - lenovo,ideacentre-mini-01q8x10
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.51.0


