Return-Path: <linux-arm-msm+bounces-99102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DAiD13cwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:23:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C12ED02E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8457F30315F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A562D877D;
	Mon, 23 Mar 2026 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOFCl6tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOy0y3En"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4E2D8DDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246809; cv=none; b=EB2wEKT/6FuQZMsCk9EYqkWtSGYismR45xNaJ6oG8EHOe2Ac1EGOrzmb3zDb1TYdNJBVrLf/vkI8O+YQu35up90W4ct23587SKYH3LJeTjAE1JEeBE5VjXCDSvSZIG+WqOBdkWcwweg6HyZR0wHzfaYNUFGK74HHbbd0HM3bcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246809; c=relaxed/simple;
	bh=Ckw+fbht5/8dB6Zw21hp8fvSQM4UhtdCq1q4XXzxPnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnkFRW0sbmBsYOHoh0olBkZfWbQ8hb1iUFqewwePVVWt3/cN9Uq9zne9o6FpxQTxP8+ZG4ykYXnLz5dKrMaJKNjgA6rjmYzPn2pBtv5PEBe2MDqmm+F5fyakg51QzCphZ1HUezOxz1DqFVLYTdQTluds7KstbawhMUdu0M1rXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOFCl6tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOy0y3En; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNrCgA443182
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smQJ1vHroGuky6eOKjyAI6i0f+SUpruwYllBuJ5FTsE=; b=XOFCl6tTgfb4hXAE
	PJDrV+Mi8a1QT++x79HNOUEahZhCT14QTwhwEHf5LiQDK72ChVgWuEWHsB9aRNBp
	mr4ubn6A3zsD5GByUn+lMvR3pOQwfBJ0FxnZCziLuJtVDg2aQI6YztCXPUHOpXEj
	EjUPA4lmAFoLbJD+sLymU7K2Z09PPLKOs5Aka/rVAty0b3ANyM9uxqonfGtXU0cl
	Revt3RQj3W2zbNnmPVltIu0YG2U9jUuDRDHgv5/a+li3w5P/JjU/dZtzdFJL6zXv
	nEp8M1EPA+cUJGuVk4BH+HtCZvf9DwCaAAp5jqCFUzRkCW+murdibck+GLwbVuBf
	Snz+qQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e44q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ba59a830so2885209eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246806; x=1774851606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smQJ1vHroGuky6eOKjyAI6i0f+SUpruwYllBuJ5FTsE=;
        b=IOy0y3Env4SgowfzShsqtbKCnkjDwT23Bmy8nUTXh3pvIyP9FmAmjy2I5Jg2J93lpt
         pS6qn8ll4zknBw5bsUdhq3n6VW/+Jepb6pwVOrpvGXJzGVNx02UPmfXrsRGYofKe+Nik
         4zSTrakEAGvPrYVTBgvzYg6YqOanC6u4/apKhltxnwUurukGh0DCkNBu4JuHuCHQVVYC
         IxPOnj9yuUZapzD/oeRNBVqUQKeuP6muTcrChQSejjfN7+G0EwBNRkOofqimnTFu3m8n
         wXdyO8ujsLC0zy2m1D/0bL2mm/kCjrR8eAzr963AU9om5GSa4s50Qo4a0/QJwKW8dAVH
         tF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246806; x=1774851606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smQJ1vHroGuky6eOKjyAI6i0f+SUpruwYllBuJ5FTsE=;
        b=NmEBqrakJDTGO8vGdfDQs8JpsKLv5sn3B5tECUPrdOHtJs8baXVDXcEeu1I2Akug7C
         9OQeIH9KYPp3sANPL4MeZcdSFYlVCfU7mpG/UH6GvrIHUy2W4kmWUZGfuM8OazsY8rdL
         Mw7mjxxdYMNUWE/T1Mu9g3nvHaxn2uIc42sxrDHSCX2o84KoFhzV30utRb6SibcDOQfj
         /+Y6lC/y7E8eIOFGlzVW5vc7Y0o2Ggsp6VbqpahHXcYvGoe3n3yV2QrA5uBkNa2pkAtL
         1VFks6PCtXdetT8G7hb2yB4mDPPtBvNSx+lRC4VFlzB68Of4C0riSJSZl3VXoA8gJ5nR
         4Tyw==
X-Forwarded-Encrypted: i=1; AJvYcCVmbs9etk8SzZOt2x5uSsaflACsd+9cLcR3Zm0AO8Wv3KZcpA/uSmUg2d8T8bvHnFnn37Ce0nNrvr+cVFJR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GInTvYN7PTKaB+iIcLS7NavW1IkfIr8kIG4jnaTbsaRiYWun
	eVsIVt87I6KD8SjWxExGDUfXFOP1+5JjGTyQ7tHYcvi053hmMYI77tOv/5mNI5Mj0Nju+YU51ie
	gX/cIS6wSgEwsvEgFYEpcTmTs6N/G7vE+BMQd9Av+z6Hmm2BcklTCsHT9rBd74DJnVPDr
X-Gm-Gg: ATEYQzxWhynDDC6GiCYTt+45qg8J7WgRc3KTEoLTG910DKq6vc7YW4q4REuzayUxSs9
	CP1LxEfsfxevAo9pB1bX+gh1U/nyex6JE0+350RUa22rwW7zvW7VCvbuPWMIXTXcPncWTIP6hE/
	xHdmUSA475HNXeaLLscB3s3ojULuOu+4cZcdVKpw4+kViSTkF1C34SLosb1bX2PuMElrXWeYMRA
	IELQha0H2Mi06w5W2vzxtiew0sdM7Qm/QCmesqWHNXLY640pdmHMZ7qSVS4eMG5JTZ/NfbnUGy9
	YruwAB1fhK8GzlXVPn4Ia7inuUA/oCQlGDZqPTlqQrWd41SRAqtqGe3M9BBaSJY/9Zklv+VqppQ
	s5z4q/cQrCS7lv8D0fLBFd9ep9uWWNr2B2KFiVI3AEUvOVYVIzs49w17CdJDBLlioqIyomSeD
X-Received: by 2002:a05:7300:7495:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2c1095a9bffmr4459898eec.9.1774246806163;
        Sun, 22 Mar 2026 23:20:06 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2c1095a9bffmr4459891eec.9.1774246805621;
        Sun, 22 Mar 2026 23:20:05 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:05 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:43 -0700
Subject: [PATCH 3/6] arm64: dts: qcom: kaanapali-qrd: Add PMIC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-3-70bc40ea4428@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=3539;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Vn4MTikmvjopyb40CQgWHJ4Lhwk8roxXBQ6s5NKdMkg=;
 b=9PIRclgFcaZsKmfy0CUK/9qmgfIvFOGCJYO0rFPOHGL8uSW18ymGy8OkMbY+fZAjdB+NSZzyU
 ogZiV1LJhIoAu98b64QRM8eNQFO2BeeCdL8XLEyJ7Z7jrITRKPy7/V2
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: VLTsfFb2WDoa77YEqDmr3AN7gHsHrDZx
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0db96 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JvrcR-vZCtq-GmvfgYQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfXw1CIwlQepV3V
 oW1YE1BoUVLj+Wqaz3GUZSuH/RdCEdlQp2MGLdl6XquOHY795wiB80gvEExcEXCgVEBLd9+5KWa
 SuxLV3N98fTBFOYP9PGgpK1bkCpc0eA0Hj4zE8JnimsTL1EEY+VlE2LlQgpRPGvSKprKNoK/+NG
 UoPhfR3MA4wnuIeVHIV999Pt30IP9TBk6qDgue0KN/HT3CFsv29W6AdPQ9OoBnjC+VdKW27+hpl
 bH6Mv79h9XRll8btn7gcYqM9kmAmlfIohRKyr1/vWGlmBWtSTy42zXhTLYireDE8KazJ58/KEYJ
 +WzAvo4wtTVW/7bj7JlPZV9AXW5nHHW877bVuFD6C9nkxfMjm9pRC2PSTqgKfHBFT4u4Q/1ai1X
 NhRL6hU8n2blfdM3O3Cj1VKQ8wIA1OqjssKothBaAKdkWxEneVjcuL7h4rx3xZh3cPnMf5e3YzZ
 ljNjRgqkQl1kry5REMw==
X-Proofpoint-GUID: VLTsfFb2WDoa77YEqDmr3AN7gHsHrDZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99102-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 978C12ED02E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Include PMIC files used on Kaanapali QRD boards. Add configurations for
keys (volume up and volume down), RGB LEDs and flash LEDs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 32034eed03eb..da0e8f9091c3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
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
 	model = "Qualcomm Technologies, Inc. Kaanapali QRD";
 	compatible = "qcom,kaanapali-qrd", "qcom,kaanapali";
@@ -52,6 +64,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
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
 };
 
 &apps_rsc {
@@ -665,6 +693,63 @@ vreg_l7n_3p3: ldo7 {
 	};
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
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 
@@ -701,6 +786,13 @@ &tlmm {
 			       <74 1>, /* eSE */
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
+
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
 };
 
 &uart7 {

-- 
2.25.1


