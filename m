Return-Path: <linux-arm-msm+bounces-106924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JKkHqDRAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E938D50E4EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43E95306008C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50453A4520;
	Mon, 11 May 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipz16ZZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIhMTD9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656093A4528
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503514; cv=none; b=cF12QG8iNuJp6XyGZLouq44kSxTukvvzWaFWMGYNeNj8kJQGb64Ah2fabgHBk6lnK22bYa2TJ0Cgq2Edfq2I9eHxketFyNQgE+h/lwdbWK9r0tkmejdVPZLX3dPwib1ur6ekUhkqgRxF3FB1E3l3ty9YwOKHk1icQ28G9m++yPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503514; c=relaxed/simple;
	bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TohXVcO9RGy64wlUQ+9CpcfoxSfmWA0mKGQGgvDAx/UOFniK1Jrs4bpl2WAd7yEIfL89LyklI26XD8a3M/gHnmoHndxCojbqhjTUvwLtCLiv7HJnONUvInHiR1HAqe2iDiYJCtVq0UZtaquEjGnaZBj78bQ3tH64NowBUQByxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipz16ZZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIhMTD9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9I36g017280
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=; b=ipz16ZZSDzK8L/7N
	Kjsy596wMnDZQor+IIYC7ATDhrl+n/y4fHk2P1JncWcxW5jn8l6EQmgMK1m6zHVp
	7fa/70sq0Y5YKvJvOz5I9AfMDqwBuAd9EmA7n1b7RYqNKHHEAv2wLct+o4qk32Qd
	s/wLXo6x1JoMIQcnIehLY85MM3s8hX12OacTmXILUgGtM7NP8CzYHzVmXGzDugdu
	1Rv6VxcKVma7osebl1zQ4/ljGrO6fjPhzyovpOr8QpmXwn3k4zSkl4sUrpenkiiB
	zIW/uhZGET3a2EHhLPEUp3iKHHKlkowMg6NesH38zWdlsrqFkHB4pEqFd4JQcirc
	La35mg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsr4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:12 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c027fb7a62so18241047b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503512; x=1779108312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=WIhMTD9b6HDR7h7P55h5P8ooo3C6s5yU3JmxG5Yz5BOb7phoEPptCqFHKKx+PSSIRJ
         osBzI33vOhIj6tfI3otmfkRB+A+RMh34hRo13EOcEDRrXPcycEFbvVqk0yUONqDm7n4T
         0kyKRRNMfpQLB5JFX1wA4eKDtXa/PGbx6SEFOvJltbIdvsb6aX5ZNwFVf8wB5afKs0B/
         sYjC5ZgQyr6Y1h/uvNnsSlI+Q94o0dHqvSmzb3+uaXja6nuiYZQFDtRvBpbhDx/rvnGl
         hfMKEI9J/QdxxLjc+zUuWglE+h66pehHTeuwU4A1GqMIy8855iA2C6oBNq3YIgsM2kVU
         wycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503512; x=1779108312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=VnWVnQzYWnojZAWL9sb11wzgYrOtiM0TizHg4yXyTHwSZ2h/QRhgBDAWvWbfL5eDjn
         d7Peyht16DbOeLYheZUslDHgQ1vKHSvm58ap1NIy0qjcm7Fhe9JJJbAvJCYb0wZuyeB0
         j3jyqt4Sk3Suu7ZwxH4/6lJWPlvWPdkUDFCn7AjCUBnfnU9unUsodbATmAS7xWPf033r
         ZP/oHWQRFZdjq7D/zPHOf+FNk0t14NnRRV5t3CWBq0wyI4u5DCWACwwsxPgS+GWAK352
         l5MmdgxVVvleLon2k987NZQUFFynU6maXFcfYWJy/Uoea9Oix8FAP8UG4NnFmF0yDYqz
         pIRg==
X-Gm-Message-State: AOJu0Yw/BYEjZrSUUcSIGq+GRtGsnTkvDf75cVa9zD9ckTlzt91VmzR1
	RrU8w5x9X3vZhl5Fh4XEHFN7I65CBt/oTE7KDPcXJM9ZdouKpR6DBLKCLSust8J0TMRS8F3JKX4
	NUoJ1b/njgj2ftjsaB9CCrpWJCaAQw9zP7eQbG3qklTFuMGxx/6yd2HNmVC32/2EHf+u1
X-Gm-Gg: Acq92OFC3XG/3OAg18tJS/XN6w/TdFp6La6Hc8JVnMgIjldk7NF4RdSPIPM+wc6SC57
	7bnU1vTQrcxHVJagXy0byWFkDN/eS+3+hMkHHYm0F7c4ky6ICjdDxwIAHYHH43Z2x0fw6ZMlasg
	qdBiQxnOlgfYdnH8Rus1AFdjUUWH2v2SX0p/TTKDUyi2qf3j1/7y+KjwizIB21OociZ5lP1YQoF
	3FmiLHCjpB2OniuG05dcIzp4M3/DHQBj1bsFta4L0t2yIkznyb4/59dBlieVY3lylHOaL/Cq23d
	v76XC5UpgkzPOGDV2un6bUtHdamjRBa1mjXukExwdmupo/Xcx6RKKfbgBqZuZpYRcU9YZ09FQ4E
	BAx3PrtuIve5aIkomidUmYBV2y4vPGTY5gYCN+PUuzuZT016/SxXvWp/VxxjCZ990Fm25X9tQWr
	Ak27j7mpoJAof0qdFMe37oT5IPSmhZyEBWnQ==
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542687b3.13.1778503511820;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542387b3.13.1778503511287;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:10 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:24 +0530
Subject: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=788;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
 b=+MyicJXnA4tzbG5S/Yus7WbBggmWS/SZ8DpIDufSxWI1PvyDWXpW6drYh4Mlw9JRkVAfDTGMT
 ix92tXPJrDXBJacUaH5em/tn005lalBL9XJ9q9WV0FeH+9VOuoQckOn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01cf58 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: rYsbczUEUydwXN029pWmDOUH2DIQM-IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX3jsKky/bABS/
 IOaIMcJlyscXquprz1T93hxJtCkaJLt2zrQ5prRZwzPArlwmaIui5iaHEj4nqceuHi6gQTA6Hrm
 EuEC7D3xfVDFLFNfb+HNmNyq8mG7iqamTYW5dLDxBtlWoCSGfuh/KqipvUPuZksZxvVPmKH84yF
 nGaiiF87sMFQ9btbf2d1T/wWE9jgiYFv9urlnojNCqn5Hv7EdH5uUk52bNy6JjKEEtxkTn2ZOpg
 Vbv7dC0QVwdwgoXVd0KhJb+rA9TwHBixjPaCKKuJIwbGa45kXeMKfFWFWGHhC3Hk++Tyh64waVS
 Rr6G2g37LKfoFUJKp5RMovQEZ2vvvV29SNGlPVrI7V9XU2/veuERfpwbFi9BZmH/HaSLHoz0fLn
 ETivSrxQsQc5TZs3Qvc9/iJjhP/UPW6eZtKbYufSDA9bWDPmwgimJSmuFAZS2ccLpA1sG7gdCtV
 gYUxSwExsy5v7uEWEDQ==
X-Proofpoint-ORIG-GUID: rYsbczUEUydwXN029pWmDOUH2DIQM-IZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110141
X-Rspamd-Queue-Id: E938D50E4EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106924-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e5f1901ee408..52ab5ffe29ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y

-- 
2.34.1


