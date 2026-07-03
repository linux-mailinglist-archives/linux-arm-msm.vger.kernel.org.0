Return-Path: <linux-arm-msm+bounces-116160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4yQPID9ER2opVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C386B6FE981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hN8Fh4qM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CDZGFH9e;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB7B930358AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A803876C7;
	Fri,  3 Jul 2026 05:04:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3535AC24
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055079; cv=none; b=hPFkY9DSSr82giAapYiz7UcVr/CRjHA6j0wWKrwTZ5su3CjM3IFWF9umel7cegcxuL2FXrn6w+ram6XxU+ZSaEgZJOBK41EyO8FtP2FxrGgLyP5jRAE5uOFnJeaIUamuaYTlVza0g+SANvFkIdp6O5z+MTr6a9E4cPZoanuZZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055079; c=relaxed/simple;
	bh=/ANQLmMYTNsw5cAXpfpErMVI9BrMl/ohHrJG/O+RCu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZRRHizZVAC3OE++ceSL1/VNRCTi2p5RoVokofuucVGfZRM3cSTC3iUS+G2yQcMM5IeFLxp+oSs9xIfLcNsAdIL19KAAAp6adla6JG9eTBSy7M7xLtxxlX2BGVvIlQli+sgm9KhOQRYPDPYe+vvuY4cI9HI69YJ6bT4AYdRo+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hN8Fh4qM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDZGFH9e; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342Vra2828799
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRF1+DWYpOIMeNUULgNk1GEZQHb11qs8UfEUuTi65So=; b=hN8Fh4qMde/JRZQv
	xsjxCc+4UDMtk4X5ggOzWMSvZ1bUJQBFgGnN4DQt7ySts3GmL+5e2tuPh5NIR2w7
	VJCA/dFpZRK8xuWm/a1YaASNaO+XlXgWnvqfhffmDsKl08GSISkJp0L1pdwc4B0/
	U+TRum3IEtA9ErZKvI5ttM5WaOtSWX1EwwajDMGBhmJktRVgeFj8NyOStDLYFjhZ
	xtJEOHBmS8Hgq98pcxg7NIZQjECOzlLMbBco8pgeukNKaXzwH3snn3NiudNRkAnw
	37ngxwHR7v5xwMTd1HjuZtgdOVbHqo6UoikXk8tA+a+4BNdju1qo+BeLXLA6aGOK
	KW/psQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b58hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so754408a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055061; x=1783659861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRF1+DWYpOIMeNUULgNk1GEZQHb11qs8UfEUuTi65So=;
        b=CDZGFH9eIRWlf08rNZO60JZzqL4ExVFj9i6dYeuAVabnqVbBW6Tba2K/jpVuhLbjvd
         c2AAle0lEU2u1nWIiSpdiSxzd0F6esB5UbkdkLN3/wX3iOx/9flevZA/yRaU5H3Nxtdu
         FRgh+048klgGqZugVRvnDdkWq7DZC/lO2lVCsG9UP6glmq9sb2QYEXWYuLqAVhABHCzF
         1Dd+edF6dQMcxj7E6VOM1GjAvf+aExZ6ZD/OLBEI0rkN0qOrGc8z7Gk6h3nnShjcYkhM
         dcyI3ebQe/EAKDTOZgkkwK76Kf4EW+ov00tJPRODNDZuXjFOkajjXniqMIAaTZ9qqvuK
         GWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055061; x=1783659861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tRF1+DWYpOIMeNUULgNk1GEZQHb11qs8UfEUuTi65So=;
        b=FP0A3AGTH+8ACk1OiZXPwR59kuSFpyTgg7f/KHKMIxRuvkYxX/meH1oE9CBjxlcrdU
         mlPI5yRI9iyqGlgEYsvTZUpVbM0K5jeWkjhQFqRWBgauvUOqEdyzLLiyBEsrdW8vL+y3
         RLEQX9RWqQqtb+bEOs2Mv9pIZbPKMsGQY34VsbInyclv3fzpjUhUhyg/QqaChynbAXMK
         9mgz5mKLYQA92qHTUAFrCwftJyUaXSNmfdtXqwWu2RiSi8R9vTInbkX3AebMGj02pLZS
         SSlzzO46/YgJccCURoicJII8d0CLtCd8ZtMXyieOYuGc7rqlV18EwqD3j7JyJ7SNTlf8
         NXIQ==
X-Gm-Message-State: AOJu0YxBmaapOVQl1dPwdRyHXLieB1vojCTvoi0s86Fy2RBSt6/a4tiK
	KzO12WJ0nFdh6K61/ljpx5GGbUTl1Pg6PqhFAB5XfAtT1SckfiT4726h9MfjJFZ73c9yyxJycnd
	vWzpDz2EXsoiZxu7q6WWBkJ89zF798xYnRxVJ9dX/orQTuFSnpUmCsonaMlLTKxnyxa1+
X-Gm-Gg: AfdE7cnM5tg27LPL+MaT3iyCB1ig2cXxmatlAZQ3nXhH6slXgduiIuc26bKvEy5qPgA
	UGljiugSw2syeywv5dP9+3Uul7zksioQ1zhIJoS4yfwerOC8cET7s1zkeaibxVcsPYkhVAzC6SD
	igqw11su3jfPBUx6z1XrMPs4cZ5AP11erd0Xb9nYuvSnRlV0nLADLStmsSLKNyKB3tvBNGJWlSx
	ed1j8PErKhNg5NUnlxmTXfhUJ66otUaaZCHr3UR0OaxZ6nESFtmulBLzYS6qvrV8GM4RNqecf5j
	h5JWqDryj4+SbPHGoJAhgZxadZkXyrY0bqOklFYGINso0/UhObLs4viL/hzAgO8YSnCmpaP7uBc
	sIXDK5RX2wzStbAHVAHlBA1tTRpY+MWMwjqTYhqMa
X-Received: by 2002:a17:90b:350a:b0:380:f389:4477 with SMTP id 98e67ed59e1d1-380f3894634mr5483633a91.6.1783055061087;
        Thu, 02 Jul 2026 22:04:21 -0700 (PDT)
X-Received: by 2002:a17:90b:350a:b0:380:f389:4477 with SMTP id 98e67ed59e1d1-380f3894634mr5483568a91.6.1783055060540;
        Thu, 02 Jul 2026 22:04:20 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:20 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:09 +0530
Subject: [PATCH v4 06/10] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=11455;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=/ANQLmMYTNsw5cAXpfpErMVI9BrMl/ohHrJG/O+RCu4=;
 b=lXDS1j5CSHe3cFT8bf1k+0XAJzpw6SFwoj8v9N3WjoIPO+L38uMhKVGW6DvDCIXfdzhQSCg95
 LeSMGaJQ2CaB9NGbLc9GNuK5N6+T8Xc0OE5EDs5avOLQruIr71rQ6au
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX5qkYzPbXwiHT
 qgYoWqqT/SpuURefFAsgVpV5UXx+9N940/YdYgc4+/kw7UqHapr3CZN/95eIfID0rGBke55HoqF
 W4g2TcvyLGKUq70ew3XHvPABoHRePMA=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4742d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c9_L0O-3IDTAyDT5DigA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7VTCsrrxQhoV_jpFeGW1CMTb6__m9Ls2
X-Proofpoint-GUID: 7VTCsrrxQhoV_jpFeGW1CMTb6__m9Ls2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXx1v9ILZD89oj
 0+D849M0DlZlpiWcT/ldtAs9SHqNKMu6DvqCB7Y+R1kX67nHGe8JDG6kXrBstQTvGaz9dlqsgCZ
 s/huI4Fuarhrz5XpN8AzYj3A6BPjNmVzgtjYZpuI+iSZ7x4fbL5rKzmObtCqqwrJ7JYE6ps+qc7
 mJnU7r44HhocUdJSR3mP56JkD295pNCe63TwvttdqNRkwlZzxc+cwWtgNue4hhu9Lac49yxPpsf
 gWPBIN9+NwjMmPh0AqRLWNsg5WwpJdy7awoftWerrYdcUqM6/I/0e7ZHpysKoPzG0lykICU3lxo
 cEk+p7RSH6q+1fQJnmgp0NC3SOsuCble9xBTE+DnchpzDr6rqxcDuZaY+x/SUKKORg3goq2Q6kb
 Wk4Ajt1CMkuhsOMb7bv/k2UnzyV6qpTkjiFMdEQp/nShMWhXluuFnuMNXzNk7iTQQ/XCVI4DE7y
 6rWk94RJrQuNKGSE1OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C386B6FE981

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in kodiak.

Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
for modem when it reaches to 95°C.

Since the remoteproc_mpss node doesn't exist on non modem boards, the
cooling-maps that reference it cause DT compilation errors. To fix that
remove inherited mdmss cooling-map nodes.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +++
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +++
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
 7 files changed, 231 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..d6fbafae6d3e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7280.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -3427,6 +3428,8 @@ remoteproc_mpss: remoteproc@4080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -4787,6 +4790,8 @@ remoteproc_cdsp: remoteproc@a300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -4906,6 +4911,7 @@ compute-cb@14 {
 					};
 				};
 			};
+
 		};
 
 		usb_1: usb@a600000 {
@@ -7716,6 +7722,8 @@ map0 {
 		};
 
 		nspss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -7725,15 +7733,31 @@ nspss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss0_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss0_crit: nspss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss0_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -7743,12 +7767,26 @@ nspss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss1_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss1_crit: nspss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss1_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
@@ -7787,7 +7825,9 @@ ddr_crit: ddr-crit {
 			};
 		};
 
-		mdmss0-thermal {
+		mdmss0_thermal: mdmss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -7797,15 +7837,37 @@ mdmss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss0_crit: mdmss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss1-thermal {
+		mdmss1_thermal: mdmss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -7815,15 +7877,37 @@ mdmss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss1_crit: mdmss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss2-thermal {
+		mdmss2_thermal: mdmss2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -7833,15 +7917,37 @@ mdmss2_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss2_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss2_crit: mdmss2-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss3-thermal {
+		mdmss3_thermal: mdmss3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -7851,12 +7957,32 @@ mdmss3_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss3_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss3_crit: mdmss3-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_MODEM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		camera0-thermal {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..400d128132fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -24,6 +24,23 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..187bc2899191 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -25,6 +25,23 @@
 /delete-node/ &rmtfs_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &video_mem;
 /delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..1e190ed18ae5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -22,6 +22,23 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..8e8dd4efd8c0 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -23,6 +23,23 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index b721a8546800..1e9d7e7b5fa2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -26,8 +26,25 @@ &ipa {
 	status = "okay";
 };
 
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+	/delete-property/ #cooling-cells;
 	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
 	reg-names = "qdsp6", "rmb";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
index 3ebc915f0dc2..6642076f62c4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
@@ -7,6 +7,22 @@
 
 /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
 
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &rmtfs_mem;

-- 
2.34.1


