Return-Path: <linux-arm-msm+bounces-118176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JkQqLHiXUGqI2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:55:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E8737DB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HTwHgtFx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gAMFp/0b";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48F92301CDAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D923AB5DE;
	Fri, 10 Jul 2026 06:52:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F73B0AE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666366; cv=none; b=HoMnSdg+iwg/MT2UIWP6FMMeU7oU4doex2hef30f0Wf5SL6CMbvZgv6HetWomWXRzmfXSiIImx+QMsD2CE/vHInCOZhK2uh7sd6JFbb7diJbi5yZW+0kRMu7gTPgAEBnju77bCQYzvffgMihRr57tQRucWJm+91hNglLJ4WnHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666366; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8714tsfJf9TZaDLlxPitisgj9yKkBgmgKum3CI04DkXhc+tevSWYCc2K0ozvAyu52J4nyNpEP6xQufftuLnJCozy7ynb8raJX6fNIRqRPIFD9rTLn3qvkzXkgUnYQSH4GnacpJo2VAeiJeMSsjV0msIh4cTNph4yLQkossRsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTwHgtFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAMFp/0b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n6wY3661819
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=HTwHgtFxCX6gKC3r
	r2HwkCAStEX8sKnDrjE19y18ucPIx0p8hx9GGWmvEQGGu/f4g/6PbwCIWmcz/DMY
	+7SZMFRkzxoS7hpupctdOhkFlIobg6M/P1E3OksnvvHjClvr/9C6IqNCNdEwh6+Y
	LfwOytiW56En4tzgrXaozQ3bxRHqwdsO/H1bioSU/0s6RbhKgcoB2quCzHvoCtaG
	1z8YuC9u3EPyAmRDoOMFCpiLJIBBHapwwnsLR5O7KQi2oOv8SDxfC7F/MQ8vsJfe
	u7A/+KK4WUVwH7xYOZ0HLq3kjZn32kisjJGxUY0/cJfebUc6ACMB5EkqQovJjRN8
	fnVsgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24u0ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1087690a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666360; x=1784271160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=gAMFp/0bKtuMQ9fghUvrEi218WJ4pcv0HxtmeD/5vFg7lxDD/3lh7PSOBzljyyyy3t
         VIS25uErj5l3m85hOpPXZEK/G29f6po/K7IlWeQYuiljbZYlmTUgw5kneIn0MSpDl+3w
         F+0juCsIqM4cMju2libho7PNrVKL31L74a5MsP+Lt4ffczFYw7D3ti/5lP0hkjBDG7Qf
         d7eL4csS2ZI9NLwX2u8QQ2y5LEWYoy8q3wVtiyZgwNs1tMG2uYPJ7sNnckywMBa1ZWzu
         G5JR9sAxDtDcjDzNic6me3d+fxJhWYaAoVSp2TeC9byViHL6LLBRhtmtxE7gBLBQjmXn
         2+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666360; x=1784271160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=G/RoL4Xk3gsc3RwyfQAocN1Sv/tI0LVySbdKMipGCWR5jSgKaWJmmi1hJOlJa1p9G0
         qGZiHhWpJNPPAqD3Q9QwEu0l2cmH8jn3P3n0t4jf37gqwqnSVhMJRHJt6DIuomLeRKgi
         ZeEqafb5KSD59Akov3ksdkFX9dR3N7Se4iym2QMIOonNgrt6VmQ9E3kA293+Rblq1HGA
         FFDreoPCPWuecU2+IVCxrz7eWddT3uAv++Bo+4Z7Ge4VsjSfFj0oUDW5i+96djnSIHYO
         zJWq37wYSeXU/5DXEXTsqy0Xd9iwXvaI+bTlpPz4MGNGlYRZPdNXEDLg5X/+7wgSA0cE
         pjrQ==
X-Gm-Message-State: AOJu0YzPjHgxXMJF43dddhvIXDqAd12LMz7lgjAxfWuChqq0LNG8QX7k
	lKxeJn1RT41hA2FMFbxxDDEvaECDmfQhqC4Y0ncByirrlMc9sNxlinhbTj+yxFJ12Q9NofSE35s
	aCsGYvIKpnmt+X0zbFX7PSdfPLZrQlVrD2Mf2cgkk87dFi74F4y/ksQwXBkoCC7r1WB9i
X-Gm-Gg: AfdE7clf/Dj7HT/Zz0M4/jXKQKjlwL5HNlT6Xpzcn+Kh3+/0UQsNQcMWbr8bPb9lsQP
	v09Rt6d1g1uuLXRJfPTL9PovvgoyBtwA/8swCx5HT8T3iA1my1b8dsQt0bOiAFL1TP7yZMSb+el
	BfpyXZ3Nt5LfFtLKNbWxabqdJnG4qoX8m3v0sfTDnlcaRp6O+7YiBF07kJODIYY9js7/H0hoddN
	Et7dsvQIuerK/kZckQfj/+ZPuPecGmGd7ki/JGEkGKpV3Jc2DkXUzFz1eUpcTycDxGX4iHgSTg9
	gdL7ar6DAjntnArzzNiDYzZFMp79JcjiBZWo7RR+s4IhsL52SZ312sshzyZ/KwFzoziMTKuwHqw
	/zDg6dwZ1LVKzQ+LpxSYCYjUJWO+4CQ==
X-Received: by 2002:a05:6300:2207:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c0bcf4ffe9mr12318628637.34.1783666360061;
        Thu, 09 Jul 2026 23:52:40 -0700 (PDT)
X-Received: by 2002:a05:6300:2207:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c0bcf4ffe9mr12318595637.34.1783666359634;
        Thu, 09 Jul 2026 23:52:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:11 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=Hn9V7hRuGe4fwsCkL/1z8dZh3uS6vQr2sYmISXUQdjIaWrBOml0Tl7QsoSSv2iDX4y/2gph3i
 dSJM3+NriQuDQ3yf4A6T2JCOx0LFRw619CtHnZIf30d+vLTWF/pkjDp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: 1Q-TeI48k1ldh7kraY0vSimrAIj7_emM
X-Proofpoint-ORIG-GUID: 1Q-TeI48k1ldh7kraY0vSimrAIj7_emM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX+wElPdC7x/SG
 qC2jppV8CJM95SXCbse4yRrf4JxU98RSUWTZf2yODHPXOY3svZJLzOwhuLHjs2qA5Q+p/j3nqC0
 5koMp3mlD+XR1LXjTlghZRdgBA9upu0=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a5096b8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXxiVHiUMMRH1m
 2GonnAvQjrYoCDM535OEOFfxLYlBZbmbr4YIBURJzuJGsC0M/5J6OTy8ot+Sp/g9U6LZaiiUs8f
 BYs5tcFVMjrZ6qk+jNSsaLU5XG0di/SKqcJ3Pdt2k7pQ5izhOSaQbFE2dqLiXCVEWIWMazZSZ8r
 vfkIUhLNTS4V0JyveGH1kAJqDgqbZzwMzSohs8VxCdwdO1Yz9zAPR9YLyzS7l4aa9+mXREaVuj/
 ISniw/cGX0vvj8PNEaqK6Kxv84NONfswuo99r0gQS9iElnnZqAQcRcRrE5rYEtxnRQOLjh27kNW
 U6Ef4GeOkSRnznq7fdRUF6gHWWJeKzHNt/hS9EzX93FdDcvU5ocqbncOzBTQzGU+oFWNKFaogKQ
 xJgQsqSuauMp4OOVZ2sAJvVtg9zhGV0MZrXzPR/BgCO6BoSwOuBTrLHB9dy4nUVt1UR/3P23Wq/
 DNodutbZAYU4Vh8u6KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F7E8737DB4

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..9ab0b44b00be 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -26,9 +27,121 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
 };
 
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


