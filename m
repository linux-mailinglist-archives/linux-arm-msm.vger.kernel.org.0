Return-Path: <linux-arm-msm+bounces-99100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNpCO53bwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:20:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658812ECF74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DF293004613
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A772DA75B;
	Mon, 23 Mar 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvM7TNoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3YfRz5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC582D7DC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246807; cv=none; b=MosYA9nRswRl0iINwU+Poy9xVvmZ9vw/wvaSmDrydiATfIBYTgMdlQOMzCX/R8j+F66WJWkX4MhPFMVw6ftWsw8BoPaD71UP/RW1xvTMo1DGvafU72ycpwCkZr83NdfkngJ6/9pXReaHOB+7/XXpjqjeIAvRufwbmdDBqSLCfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246807; c=relaxed/simple;
	bh=2Pd0viSFy/ivykY48jXmIuciuPP8RhKa5t+d9xQtS9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKZInWTme4uKjCzGu2LzHLuExzIMBSoiWgxE8lDaeERyzf2MMQH09YiN3pslBqVnlkzCp63u4m9a3Vi/SEEhWLzp+bozlt8ukkSNU5rdIwro6HsXIU9TBSMr7jWI7DYx6BEWEKAqKSzAHUGlpSnSVZq0q8jBISbQ+czDFm09zZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvM7TNoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3YfRz5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MN8EQ83529248
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=; b=nvM7TNoaRYQTeUT9
	OCtZuWjAR4FqmkksGphpA/Cp4NvePQPHFw4zGjoNXl93F8bMLKwVnfe4rLDcrZhV
	nRvkBL+BF2HWdrgsmmnv2FGaD0g2qCRnTowoYRlBmhFnJxbuTte126TeABf6OTtt
	+f4niAyoxWqhQgUftWgQls3rIFmzGVebXwaHg0E+ZNQRAbuWfWvValmnhb4B3Gs7
	eyUnDLSK63JgcyPXU7f8rxPiuYNvueT15Hfka3q6uy68XuwEXxLKoRh+xP03w3jq
	poI20mPWAlSvVNxUZlF0KjKIzH+Y7JZ9Djd57XweWz4SNUgcZzZZqvShcWXFpKC3
	2n1mNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hxdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ba59a830so2885190eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246805; x=1774851605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=;
        b=E3YfRz5QkHCPBccKE0F4o6eQ09T7qLX1lokK7nlfRgme8+AP6slBXRBB0ZfodK75ZT
         9KBHG5LJ30Tg0iuJoM7ZZg3YPmSCa/Oue2eIC0iqGje4bi7FV4RCvaqt2RzsDGZkDBOY
         fiGQQa4oLCr6kNU2zSMmp1hPjBBz2klC0NDUGL1rds90uuWG18Odp+pUz8668umBja+5
         96FdXwJG4kDvfdxu9u2Zv+XRsc+gyeM9JBBSl2opjv1V23Fj7bqEhORuHZK8YOfSRjCE
         fBKiek7o3xOBid3+9tGxVpC2T2kNZhekTZDmLP3uIy2cSi0xoFvacZGfib9URMaeICL9
         Cdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246805; x=1774851605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=;
        b=RWsk2kzwdLzboNRoj4W8o+eTjZ56HdLth/O+sPZLzshyilNezbKF4U1DTuzBC6YX3C
         SkiN1KzPZQaY80U9/JEqgNrBHPCd8VvTJZF/nyWuK7GB74IaCLdvvYCaNTlLyZMRJa2F
         xwahHbQmMznl6iuH59ZUl199h3+rk3Qt+8WcsB47DKWullZsS09DtK1N8KS446fjAmEY
         vpQgeuqACXvp189RTOGXwh+Ph7g7fXEJ4FI7aOuAWNWWMdMS7aWV8oywQx1IjeCXa3OX
         b5uElWXwg4Z/RHr1tT6xkdqEAGy3Le3Lh5y39W9iG/KnJkPX60jO5EBIdZ+nm1nU8E6H
         wdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpp8/ZjgHkzqusLPLfM1w/wtnxn9kJOORcXbNmGCA8vuBy0qDY5y+n3dj2j18U7iWlmlu/pm8jwgtrq6s9@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4Z0ir0s1gr5SXtBKY32aVw7kZaAOMGqp+WLPSVDD2xaqCMhp
	0DvRZYxm1/4/fBFCqwFJ5apTNIU2vvx9QIW77YbnWOtTgL/23nRGxzYzUjT1S1QZIzTXRwF9jEF
	2viWI3BNhRdmEataWzijQw+kD4d2DsfetFP+EltDPRhdbv21lpSbCopWrvQIFfAZ0Gv4S
X-Gm-Gg: ATEYQzzNVo2PvA8tBkbV26IPoPyeUZ0rcTdzWSCUqXvWYWGbFKjOWXqyl+p+qhMUXe5
	lPpRL+Irwl1iRT8+tXssNEdNLTCUcREImKrg8WOQ3/ckHmwHTyY5giZCMYa/iiOFjaGeerO8i2K
	FsM/fYPvWV00HTdd0mMyAZW9YXy3bwn13Qv53iUgR8c68eDOLorhubxzZ9P9MWOcUzsG70Gae9f
	CtYuB0LgyhGlQ2Mjgkx+bAMpEU34bThFiIQ1oWZU0cm6Sh+8fbbL6EFvhxJA9Cgo9WfH+JUG6sT
	Y/wZSZwOyGYt/CqNKHgbZ4l/Jm+hEt38XEZkpf0FQHX+YX5sX/svGVAc6DMNOmyPS8KwFgzFBNN
	GxVcCfm9bXfdLIUmoiwSofOicve9CyZbhyT5d8vvKXUmSBpeERPAJ+AHhEQqpKW8ZZcGdMJ4N
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr4408092eec.32.1774246804966;
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr4408076eec.32.1774246804409;
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:42 -0700
Subject: [PATCH 2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=3720;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SvSnW70Sb9tWX5TuvFgft189d6cWJVAOHmqQa4Eukjw=;
 b=fJqbwWyaNsR1hRnl9DoSN5vwcpd/+0BZqPxCbXsZBFYWv7UOq6BQt3ICyorTiL92fnDt5Dw1B
 pUDS872JS2PCnBrgSILFxKmudYiWbkljhfnPa84ObrEFNqSDuYP7Mjc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX3JQ53CJ6QpTA
 6E94zLbn4FIvZpuxqlpXKccg2fMIrluHTkX9fCuO5bA+jajaMcmC/HzC452a3hz+8AAP2buZEip
 AMPEsSoTBYa0huaNjC9ABkJmQoT0UIIhxNcrzfd5W1giDmyaLUc97MAvi+TLR5J54n/iyxJqJiJ
 kSq/w5o/bBC5YYOq/fGFt5UzHZH5QUsIup7nypnU8FuE4f7WBWxMY4aIOwQmHE06qbMbwdWKZZK
 BfbjvFAbPgop5Tkr5ZXUHGRK2+ezN1zibOBKCX5ZpzRC3oLWCW4wY/mcUbL8MWsQ6uPAXrdhsB+
 4YvRIanLNGtJlamqzLjzZepw77SbAK1E+nxrcd9lchi7La/3SajmUZSSgD0DKagSdIirto/Q6Pc
 trqPdf3i7p7zZPnXSOiHtGDZ5/p1EQ+NJzGe0nEYL1BtsiN/5CYHN4d1dA767BtpibphNgW80B7
 QZoXn6HAIPup/B01G4Q==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0db95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yaPpH3l5qGelCYd3kQ0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: DJKTEXDNLLxKtSHkxbs3Y4mprA_XhZJJ
X-Proofpoint-GUID: DJKTEXDNLLxKtSHkxbs3Y4mprA_XhZJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99100-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.2:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 658812ECF74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Include PMIC files used on Kaanapali MTP boards. Add configurations for
keys (volume up and volume down), RGB LEDs and flash LEDs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index bc57935c042c..5054c5933687 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -5,9 +5,21 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "kaanapali.dtsi"
 
+#include "pm8010-kaanapali.dtsi"     /* SPMI1: SID-12/13   */
+#include "pmd8028-kaanapali.dtsi"    /* SPMI1: SID-4       */
+#include "pmh0101.dtsi"              /* SPMI0: SID-1       */
+#include "pmh0104-kaanapali.dtsi"    /* SPMI1: SID-9       */
+#include "pmh0110-kaanapali.dtsi"    /* SPMI0: SID-3/5/6/8 */
+#include "pmih0108-kaanapali.dtsi"   /* SPMI1: SID-7       */
+#include "pmk8850.dtsi"              /* SPMI0: SID-0       */
+#include "pmr735d-kaanapali.dtsi"    /* SPMI1: SID-10      */
+
 / {
 	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
 	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
@@ -53,6 +65,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	sound {
 		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
 		model = "Kaanapali-MTP";
@@ -801,6 +829,63 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&pmh0101_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <0>;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmh0101_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/kaanapali/adsp.mbn",
 			"qcom/kaanapali/adsp_dtb.mbn";
@@ -940,6 +1025,13 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		bias-disable;
 	};
 
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-n-pins {
 			pins = "gpio102";

-- 
2.25.1


