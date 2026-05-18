Return-Path: <linux-arm-msm+bounces-108148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCpuCqziCmoV9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:58:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1A56A2C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB103047260
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2813246F0;
	Mon, 18 May 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qqz/K3X+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDsp/mY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED73322C77
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097978; cv=none; b=HD+uCnTYfuGh6X3/O8Bbw0j24ewSgRXLRlWZOnybvczwPOxbf1rVXp3V8guM4OvvAPO2KCuCsdAhUtUQHcK3orp4oP21dt+uuoKctLSGlrTRJPmVJU0easIcC23xpJykH437n5u6KC/zw8dihBDoOxKbHXQTQDnWWLcye/UXdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097978; c=relaxed/simple;
	bh=of417GscjKdbAnhwfbSWrlsJm8LWUKrkEmCLH5aShT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mOTsM/94I9Op/7+nEwvomYvvjDFwx2CfXx96TO/h7wWw6dLGR3zLs8kjH+3ib0gmXgEvauTc7CCgtt0mUO2TycqQjKPzPYv/gw9AGCOQgFv+hXmbnoAUEW9oJMxLBZgZF8lHtuYP0xPca5orW9xr5LGzO07cI7AY+crLmDAp0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qqz/K3X+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDsp/mY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8DkC32614932
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YvXvwkEtJUar+AF4mcltGq
	qcUdDyNha0AyAaMHsVw1I=; b=Qqz/K3X+IVYCds0PY48txgtanKUESkdprRr5B6
	Sfx86MEoOONR1Zlrj0it4IB6IDC+MdOtqpi4OOtzYQFyt1urqLwBaAdHacEWgEp8
	gSulg8w2isGQm85oF57WlUYCLoYMnGk1aXR2rIWqgwnXIcZNUVIe1+nnPToqAqkn
	k7h9sx3vRKAXgfr/HAfGBoGDsKKTgI6cpPDfdTvQ9cxN2H17+m/i6hEIM44ImK9R
	wnrMbKsCurt77RxVfv0kelkKjAFhEeqctAML18DLoriWIWnvCbkFuHD6D07FVJlO
	v9DDL1ll1RK5MgCEgM1SCaLMAAoVlb8BvRq5lk2KDHosRTVA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmp5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:52:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-303b38ec2f6so2728721eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779097976; x=1779702776; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvXvwkEtJUar+AF4mcltGqqcUdDyNha0AyAaMHsVw1I=;
        b=UDsp/mY2DtTQic3APxcC1yeJuzVBbAjgHt+00/0dTKf5B8FjmzSXAl84rFz4s2zDqg
         7I4A8swA1oT43OUJBhW/jz3u0UySShOJwvH3rFa+cQJlevhLaP12w7PpOmxa6V72IpMs
         Lm56odO0EFcalCEMNi6G+VbTpYRQnmBJ74TBhptInAittXiwv84QDiJmGSI6gxMjYkmv
         MSfAbbpLPTd4lUfE9dZxHTHs4IN0Vz754uZG1ZWx/sUR7o9ZXjAYVR3nWk2mZDmGMiA5
         Qn2/vRrXtbgHLy/g7F/1TGcgJuDH4H9ok9GNAP6cLA2XyowDk1kHxUnKu2jFpmdOtXXn
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097976; x=1779702776;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvXvwkEtJUar+AF4mcltGqqcUdDyNha0AyAaMHsVw1I=;
        b=XQnHmFY3bfSmpKHtu4GkcKaaTcrACZGHFz3HhED619tgi7fggdH+KB/S4msd40SVGA
         XsHlNULXI6jE7d1kXaTJvkkDXaAhDEsOfqtt+WKlvV5KZr7ZPkzCOjddreOv3i5Zg6hJ
         0k0pAmMKh3ARH9/WwwQNXIHx67RfdJc9XUHdZNagPzU0Tlu3gOEL6bCwFlaWSsRCQlQr
         MgkRRGchpklPUMVlzZDRdh3GfCx/FjsY7PPveY6Tht+jB2kZhlSKBAxrc24O1bm2l7fi
         ncG7NFWk4j7alASTe9ztIKKZMjtzZ47+/685aRvei7aLVnGnsHwOap6l4vI1mH3eAqWh
         TUhw==
X-Forwarded-Encrypted: i=1; AFNElJ8KgjUoyNN10D1H4QDrtbqaOrCrnM5LYAW4wONCs3pSZJHy/nCM21V7mamAKSr1mRUwBGrjkmjtIaSORKrA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzy02km4QhB8xBGY/BBRZ3euLRZ500EPNnL2RUIGy/6L5MablB
	ZWN+JxjSIEm9MBw0xr5bzXjm1ymwzQSbya5B2BvXUWTv8GbmbOrr6469PMTrcFMBEE/xatYxGXx
	z+C9zM0hl4A3Et0WYO9kIfA7PqIphIYkJSPm1pW0l1fOe+Shl2ufFSyreGJ3qGwuIpZtU
X-Gm-Gg: Acq92OGZdE7F6ixUTGBzV5XXBzShrq+8FUUa+tol1b8gbr/n5cmT3MiNUBVFQZTnzdk
	HTXi6DqGGlPfVZcLyaLfFtNwmWr9Qj58yJ0T7eqRIdmxQ/fjemTh8JVWvEsCGfk47FdTOH4LMUL
	jhqeXk8OSJ7/P8ZmWyuR3xXleC129BWZuQxCdUxfrfclRdT+6e72IBpdMCK6nR1l+o6LMRw6e9i
	Ppf1NEznsGKYzQH2QZU+f0cVgM+t0isyIxSk4uWYYGQDaKxmFfdbcadiOdasDuwn1ALLrBSa0ZY
	KPplI5NuyluqT/CaPTYQUqqkmHKFhwXSlobuV/73hZMkfHU8RXmO+og2yTT1EMCOHkQcUwrxtjT
	NQSJhHwiG5d1beC8N2FW1UUoQAHAYJl3oX6os+glqmTIzV2OOq9KoBS/feiY4Ta8PQEAmop62Iu
	z1+U7ohbyhjg==
X-Received: by 2002:a05:7300:4307:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-30398655963mr6287209eec.21.1779097976160;
        Mon, 18 May 2026 02:52:56 -0700 (PDT)
X-Received: by 2002:a05:7300:4307:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-30398655963mr6287190eec.21.1779097975658;
        Mon, 18 May 2026 02:52:55 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm13994915eec.24.2026.05.18.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:52:55 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 18 May 2026 02:52:53 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHThCmoC/x2MSQqAMAwAv1JyNmCLC/oV8VBsqgGtmqIo4t8tH
 gdm5oFIwhShVQ8InRx5DQl0pmCYbBgJ2SUGk5sqL3WN43wvh6DnC9kMukGWHcnZpiidr4z1kNJ
 NKAn/tuvf9wPxO2rrZgAAAA==
X-Change-ID: 20260517-glymur-fix-i2c19-irq-eda945df62af
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779097974; l=1351;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=of417GscjKdbAnhwfbSWrlsJm8LWUKrkEmCLH5aShT0=;
 b=mWZjj2MyCV27OBRk1TyCJFKRcyHSGfjtLj2EPmccgnJYpL4pBYnp6BbAUzg7z6lN9RN4bL6Nn
 XYVbo5XMOx9C5j4fIdxLno50tkzvLDfw1cC4af6I070OLCXSqfOZnyv
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: g4fo4ODOYOm5zUOymO4lH6yiiGeW4PnY
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ae178 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gUn1S9SPUxNGwtii2nwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: g4fo4ODOYOm5zUOymO4lH6yiiGeW4PnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfX1eVF4nUUPI8j
 3UIWSKjmilA3VtPBl4DVONDnBikAKMJQ2ILXOeFRMpAtVMwMyWONLcm8+GaB8/lDM+KlwjZMwY6
 rtLfzU4VpVLCC83dMgyf3waehHzqIrS0AaN1pJoTLNamEaLpG7wF8XOHKGngVyfCJcgBRXzAJ8/
 SuA42Vd9waMS5M66XcY82UfzaUkjiBVglLXjxytkUpJyrExqX7taBwc+2GjlHKYOLutU4LqSPYq
 F8lyA5wBp6M+u2WUap/m/AlYX8dWRTBTH4ogaNeYb6jcruJWuqq3uK2mQF74jfSPtPT/lX/jz/h
 gpFz7IC4jdm/2V7iNo1LIkOo7z0qegwP3o/++rJRDBw4G46Tcs+1Kyk2S0DjHmSPxAvDnmJJceM
 v3g0Ehg3fopdh6L55jeRVnKBV3Hd8hvAsmBt8Wolbpyy+eQDd4vc5P2wieHjgLmHgbva8j5PegT
 AgZubpf918NM5ZmmHiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180095
X-Rspamd-Queue-Id: 2BF1A56A2C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108148-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,88c000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
spi19 and uart19 which share the same register base and clock.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..ff2c66eded08 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -968,7 +968,7 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 			i2c19: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x0088c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260517-glymur-fix-i2c19-irq-eda945df62af

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


