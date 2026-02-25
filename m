Return-Path: <linux-arm-msm+bounces-94041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNyQNXSknmmhWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD101936BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B51E314AB1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1D930C361;
	Wed, 25 Feb 2026 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5EiotAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLVOo5Wj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B82D374F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004034; cv=none; b=RuqGUH90nvjz0qw95faOj8fd6VxHhx/T+ytoAO5FEo/YLpch0+ADbjrSLXbnJiUrLZiCJQ3BfDYf/wIsGZGzWvJF1dI9gtm7c1qx0QOA99zyqjjVvtP1MMo0rq5e8/B3P8AcYXFSSoUMuPM4ABOwizg6hh2poVZyGYWEHw5nl4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004034; c=relaxed/simple;
	bh=tW4K+WgSJyLZfWN+10XcL4+EBYZ+0pCMvRvFk+AoOeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqlgnsa5cAkLmuIoAwU0sZuituuK+Fb5JF6aDn8e2UV/LNM+caXXZtM0e+G6WIWmC2lAvFV9gKI2iMN6Oo62v3hDZYwUlHwhCCufCsAfK9EeBkUMBZeGRqbUggL/6zHaqw/AAGW+6eUiTV5TieDYvZ2yQ9ieOf+XbwO4ZNZTlaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5EiotAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLVOo5Wj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P0n65Z4044440
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=; b=A5EiotALzfwhjsvo
	5Ns9Zx1yhWozatVMAE5ucVbvosaWXrhCkfpgCZwm9K3E7gglUUfUfy1Al0fw5JC0
	+NElVgh0/PfSdzl82X+0merDkVEq/jG/XyMvbBjcKPoTzOuJi6nIZnk2L8JvPQrn
	fMVd5EVLaYHeveQLRjcy2r3DWflLiyot7LG6uMAIDnRK3p6L94ZW+IjQcfjVrXOD
	ZMbHexWSlPIDSPdrG3/pcyc0JPTgCHQ6FAWzaEtJaR3bWNgNCOHp+6vNJmVF/hM+
	k9G/RXa3RjMZb0FVOjeJSNFRPbDij+KvhV0N5yywOwWdFflXxGbdbvL7Jqq/BPpm
	4wUMsQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexejjm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:31 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4bd83e456so71853564a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004031; x=1772608831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=;
        b=hLVOo5WjQiX/js+3JH+GFiYnXWlSxlGZTIsysTC2jDbmIV3LnbNsHPD+PvErBK4EmM
         3mE08uxVQzx3xEfNP8J8LpbS2yPiBThbbpcZBT4YOleX30bXb3zGkxt2FZTVVwGyrLYL
         TTiCr4O+SxVu2q0WahpX4V9mhjId4eH1qXvjyyGNQPJPyxqzr0dzJCsXNMG0ZZqO/jHn
         OUW966SyBaClmsSk0NFy+xPlBgvf8t4nq2CsVSOQUF2TRpSEXpZ/twcYKy1tabnqIG23
         0N1Qp6Haa6yascwKBrVQu9TyVFQlq08GSaWOE3EwFLfJfZ3y5gsCcJrb0odIC8yBaE+R
         6/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004031; x=1772608831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=;
        b=uOwdvPr87vHhf+TbpsqeG1WXX7r8l9QbVZJ8HcGBbo/47p5g7Rh6WuAXBfxfLxW/xV
         JSgWoW3awYFQegXyOC8DYrx64+BpaaCCWEKVX8Tab6Jm8NNkMivjaX7+k3tGwwDgIXXD
         3iKW0AVPFzA+p283e4d2rFjcBqk3q8BbnlKsvKCD86VUd5PyAjQtGcFZsNyMDqAYvsOW
         VwGsUZw9EqN4XiuYg2/jYbmTaLoaVPPUNE7vyYiMzZVA3J41ETZh5qQGMy9c4gCP4+55
         Rew3+ZaeOPbgtFpuROOz2Wj/rK7fZ1vEURJsAhsnPLcUY5fl+Hssz6WZZs2oIxbDfcj/
         yUdA==
X-Forwarded-Encrypted: i=1; AJvYcCWfnB9OZHyL2IifBttpNqESkhy4B+PfXkwfpQy/A5q0G5qBIAlPYKf+elsKaw2tjEoYNZUOSEuO/ofsJhxw@vger.kernel.org
X-Gm-Message-State: AOJu0YynCub2xnb8aWgHyd5UCUThysj6ofZ0Y5JeIutX+/FEUZ6WEZHM
	rVDeMJ7yI2QCQNBY0b1cZqO3x1Mm160tZNjnB9s96KjnpVfAOfGz2X+2iqWDrpwOMMj8Nh1pUBF
	/XQ1sSpRSmgLZo2SqF49f1liZ5E9jeCnsjD9xUnZEztqLmM0kP9MhH7nOULeiy4i40QE6
X-Gm-Gg: ATEYQzza9Hm37BpLummhp2VDydKMw529HOnNw7Raqkni8lMXcwJkc6K7ig5l40GIW1k
	iJMaK+sdrLREdGICbSP666hr5FgIe5RuqsULkb0r7bnvdRUIvdpQf4RM77fjzhKx0bP0JOwgOnG
	YYLGvSIIWbTYoK6XYVTVsghD1EpMQv+Z3kciodYLO5zoXT1tyZ0vnvkdUkzmCz9j5ZxV/ik4AEM
	ouONSD3/qZEcpjI7m4Ezr0viCpwN3QvLIsLBoGtMeDSF3Yih6029g9loY2PFCToPdYyqcsrVBiC
	vdmQFkDdd/G6wvn3OZDxCZ0kXhpfjqbUf4+Tz7GNqwWFtNl/6UWa3ftXvSW1rdeEJgIdhmiw2Vq
	sb3HBT9Bkcgh0Ek+s2Ii7w/G9ZUe7Gv8HLMCCYrzQpmIr8BH3kTE5BQIl5CUbRejCozIPhK0q
X-Received: by 2002:a05:6830:650c:b0:7c6:cf19:1df1 with SMTP id 46e09a7af769-7d52bf527demr6602422a34.30.1772004031418;
        Tue, 24 Feb 2026 23:20:31 -0800 (PST)
X-Received: by 2002:a05:6830:650c:b0:7c6:cf19:1df1 with SMTP id 46e09a7af769-7d52bf527demr6602415a34.30.1772004031037;
        Tue, 24 Feb 2026 23:20:31 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:30 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:21 -0800
Subject: [PATCH v6 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-6-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=1007;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=tW4K+WgSJyLZfWN+10XcL4+EBYZ+0pCMvRvFk+AoOeU=;
 b=vkAXnOPhfwr2eut1vvPbOoyFabyfDGcyiBgVPT73B/XerPm7r6/IV80UHhH40g04CFMSvh0pQ
 eZEds9TYdTnBm9TtqRLjGDdMDkEAKltlu4bo7wivWKReyA34fidBnZS
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX2uGYptbaxGO6
 5N/crrl3Qe7JP47PSBClndFsCYP3i75gF9dkYDuOb8n3y+3vR0k9K5xVth5i2/kTP6XrHNeqSfv
 YqQdB6cfld/hoCnw3tg4SFhqgLVck155m8vOvFzzVVYbcY2PrsZWzi3rMHM0oG+DvI4x3P9TN7Z
 bZ46f1S7+xUq+5ENUIYlAx79JhI/Ki+l7O4OSudEJ7ENGJrA3dl0TiyeafD0lU97S2bk76V50V7
 E1iTIoC8db+JIQtkj6++mM9OMl3cyXOZB7Y9nbWavqwfI9mJ6IaNFZSjEcFjB+m2Wljd3LFvaU8
 5k8tm0YfcglL1OiemjquMo0ZHI87/KIwYJcdCj6uKeZIeW7Vwx2N4W1pTz3QPnlXmogvRxGeQT4
 O9RUw7py8dkYd7v2FUablrud3V8VwkyBlqGVbOag+3jZ2fsOJ9F1ueYJUuvhXqh7lh9B00U+wzY
 D7jCw/uoNfmk//yaTrA==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699ea2bf cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pSOtZClNuHiBGgWezYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: AJ4Xeetupl8iGq9cJLsXDbPALcQ0SNbM
X-Proofpoint-ORIG-GUID: AJ4Xeetupl8iGq9cJLsXDbPALcQ0SNbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94041-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AD101936BB
X-Rspamd-Action: no action

Enable ADSP and CDSP on Kaanapali MTP board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 32a082598434..3544f744fd1d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -684,6 +684,20 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


