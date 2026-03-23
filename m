Return-Path: <linux-arm-msm+bounces-99099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ALBMurbwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:21:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB102ECFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1C4B30078D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C1B2D73BD;
	Mon, 23 Mar 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4Ikj//E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePHW1zqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3E32D6E6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246806; cv=none; b=i7FpVvc2Xjg6rlSdLrhPd/aoecrZoIhU197/OTh88q2PiX55ysm7trPznC0VBVvqAdK7Y4MnM2fL/IWA9t5MjInPdLL2sk4QgayjXlxi3+qpwXjOB0RLaQlOIsivvIhl75RWFvAuMjngPAIiiFebnQ8pzlxyIQUEqYYo2FFm9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246806; c=relaxed/simple;
	bh=QNXNvnY2Gh+AxXTv9dpnUuKNkYIQ137rk0zuFRUWgK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O/72Wl2BfoJWjWZWKbqYrp/Rj9q9orSl9dHZH3FalyOVN3k0rwLJQMv47n2ithm/AeWNT4LrLAA0UTPTp470JKIC68vaofh9jFwwNphRIR3VWN2KD6PR0f8BrLK+lQx4p6M9bYLHMCR1VCWXb4Qk7rMm69IEipj4QvtDrpn4jJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4Ikj//E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePHW1zqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJeKol1040726
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eFCEpBw3BuLI0ad3VhJwft
	LsmrqSupUObcFrR798rSc=; b=h4Ikj//EjkMrsqeTvE24kguIfzBXWGQ3DPu/r9
	e8+Kc+TTk1AsjwmsSMeOlnLDwnUZBunSV7Ofjmdv1cUcJA5evLaYGiJq/zGKkteB
	UXCH5a2yJl6k1Lefuiw6wOSTeK/j1OxkXv+GsVMiqV13GpP+UOejBocnOHhSPX1a
	BeUhpfpaeb0KsYbJ9tsq8eACm/JDeCPr3H6pSGO5GPkPmTNXjeKd7w6WGf+Rgce+
	0v9lJC1m4gyupVI9mL4jjSeQjDC8yeKUKlYvpWfiQUiIN8Qfssj/Z6SVLf86KovH
	g8B8jlfcOCV+W4/GXV37ts0c3uN0b4dJT7zoey3RfiS5uHMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbuse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so9735521eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246803; x=1774851603; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFCEpBw3BuLI0ad3VhJwftLsmrqSupUObcFrR798rSc=;
        b=ePHW1zqtqrl6mf76nbVo5gaywXQtIVuoNIDKHiiHIoO7pGpaIed+GPFgKwqXSyC0xq
         RSrofBlmGOg78hKvzJvDm6gufUoNUUXyOaC6QS91bwTvbSxB95DZY1CXOtrMalkyQZzS
         yTeA/0d/C3+R0Z2Bw/Tzx0d2vrzbSuGcW5aizxw/pPjzhBQfhZZo9tCxabXD408ZCreh
         aZOgmGLMlsUTUUDTUHnqJ6PvIIsmT3ObCpGGi4V48RU1LWCrnFDNtArEs11fJA+Vqb9C
         OFLvlJRVpU8fNCw8WE/q2vTjK9JoPrqssG+IreER6QjbxdBan0nbfEbv1w6Gaz7aUASL
         ia3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246803; x=1774851603;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFCEpBw3BuLI0ad3VhJwftLsmrqSupUObcFrR798rSc=;
        b=Wwjvmyxl9Icd0rK1oLesE1oFTowM3N/AiAxK5mWaFCV7ryrda4nHRHRmP0Nd9KtSjP
         cclJ3Es0CS4RLxcagW5LdMwmeFF9Ny/IYrgFLBXitZv3YtVqo04yPkrw3sANVr7hfRYL
         /Fls1DVIoC+MSzhJD2v6F6P0gmI7fNsOqJjdSzs3hAS64PDQwF/yV3PWKY8LjL9UWNqv
         C7O0Ch1R/01/w+LRB0T6oyBHEb9EcjBzsZjjYqsn7Nzb4ITi/sdEMz0udNn2cVP7p8o2
         enAFKNDBhI0EfbBdLVDMZski9240JgdzysUcTiq4EAkF4deYfaZ7hGzBVb88uTXtmCRw
         vhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVN//4VbTvrmcaZUo419RXgtq8SbJ7wiZRd6UM0eL4vr6ep6+RopjAeHpPe/CuZx1CqZVrlzieMkrDT26D@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlSCnNBwWg97Itt85y+Npv0w8X52p/bRjh/hZzCbNNpMMuTMf
	EnlvICtvjpUItnTlSz5kT6O/o6SF7owk2HYQKEV7EWJ9dFMbKhOfYcrFgjCSBFYNDEBosbx7OkG
	2WxZ21VaHglFgQhiTxh+D2c/9OHZh6uBajcV6HuIUiDB8pPTkTdzj3GRe26Ntfn78b9Q2
X-Gm-Gg: ATEYQzwwgkp+Vg+L+j2D5HujUPlkmHrHa6fYUxg/hgbQtZAZA3z5kfswx0defMhMoH7
	pP5Fw+3nnG34fy0+Eh14kyavbGr75uOzosK6C0Do0Mab0VVc6FqbGZKSUdZVMpzz3N2L3ovd+xb
	1NwOigtJKHayjsSDqj4Juc5zgXQ4+7Yq4/349x0BcCFVtcc7bEIr7vLQncRFv9GRAuXyuScayic
	b0rVV2HkR3+67XAWrfc/mUfB6tHYpoq5l7jZaVMzCjC/jRqFCS7uS7NTDUe/cyt8k3LP7TmY+Ek
	iVtx0s539KrwJVHZSeWZ7kmvf0Ey8TK9Oy7dQjizOK66YnmcJsgwB0dcxyCscuMLkCTwIm6R/j7
	QGaBlraywSaLHAmrUeMha9heju5RVmBEQNK/ymdb+WpN4EljlLek6whPSzee1W1C4SGWtHizy
X-Received: by 2002:a05:7301:2f95:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2c1097b37camr5133695eec.32.1774246803374;
        Sun, 22 Mar 2026 23:20:03 -0700 (PDT)
X-Received: by 2002:a05:7301:2f95:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2c1097b37camr5133668eec.32.1774246802752;
        Sun, 22 Mar 2026 23:20:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: dts: qcom: kaanapali: Add PMIC dependent
 features
Date: Sun, 22 Mar 2026 23:19:40 -0700
Message-Id: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzbwGkC/zWN0WrDMAxFfyX4eSqq7dhpGGP/Mfqg2MpqViepl
 ZZB6b/PzbYXwRXn3nNXwiWxqL65q8K3JGmeati/NCqcaPpkSLFmpVE7NFrD17TAklOAuILtvCE
 fD+jYqdpYCo/pe1v7ONY8kDAMhaZwem6g1vYPK3y5Vtf6y6rMIrS5+uZ1U1V0U8VVICcJcHOA4
 A9RY6ShI4fvs8jucqVzmHPe1fOm/pXPT1r7xvCIXTdgaL3X5EbfOmO5tUTGju0YkHRAuw/q+Hj
 8ABJBxvAKAQAA
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=2717;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QNXNvnY2Gh+AxXTv9dpnUuKNkYIQ137rk0zuFRUWgK0=;
 b=ft+trLRcYUQjjNXzSWtT8EM8Bz1vPW+R0yeyT3CPvtCiAPE4ROBGcnw8aq1lawiQOPUtA5Jef
 t0bjt8ZgP9VD2rk9Er0msN0dtQahi4tocuEomvsR7ZuR/ENZsK6B6mN
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0db94 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9eyiDgkpgt9l64mz4AwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Qyqrx_TiQM5oXUMAt5LQ95Gt7hiZksuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX+1GS0DEgIjcP
 wxk2LvOS5nswo2/VW6vqXO5a76Quy2HbD/gLDBrjc2/fISOciGJShQsUcYlUFbPcAli26aZw89y
 amK7KyVKXDajt7oZyLe7KQN6fUwMAvtMlCInUOazR7oSQv2hg316hbfklhHFqwidyrFTLWh/5bF
 5FKGA3cP6QDmnooiq8URNJPEUgtxohUdAu9emHABlZm3oo8h4E/GfeK15UoXzZfgaZ8F6h2Ma8+
 Yz/Er4Qxk6vKz/j6IsIIFL+rkHaXBjtoHWEJiCMx/u6ceJ/A4pF2bbeHUGm92S2KGBYU/Ugcpid
 wMQHlc7D6y/lPx8ZdVUYHA05nfAe6nNXmqz6Qw49/q5bZrz+anLVp/gFhUVHEbfhmT4/w7t9K8K
 PDE157ZFE7p8BQm1y+iZ3PxjG8kO0L4PD5YHWem5SHf0c0JmLsREMCmGE8GdODkkxgy/wuIfTBr
 BNBAFy+RrkqNYi4eERw==
X-Proofpoint-GUID: Qyqrx_TiQM5oXUMAt5LQ95Gt7hiZksuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-99099-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 2FB102ECFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PMIC dependent features on the Kaanapali Platform including:
- spmi-pmic-arb device
- various PMICs along with temp-alarm and GPIO nodes
- Volume Keys, RGB LEDs and flash LEDs
- bluetooth WCN785x and Wi-Fi (enabled on MTP only)
- Display (enabled on MTP only)

dependency:
dts: https://lore.kernel.org/all/20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com/ - reviewed

For display feature, there is a 20~30% probability of crash during the DPU initialization
stage without voltage and frequency alignment. The issue can be fixed by:
https://lore.kernel.org/all/20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com/ - reviewed

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jishnu Prakash (3):
      arm64: dts: qcom: kaanapali: Add PMIC devices
      arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      arm64: dts: qcom: kaanapali-qrd: Add PMIC support

Yuanjie Yang (2):
      arm64: dts: qcom: kaanapali: add display hardware devices
      arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices

Zijun Hu (1):
      arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 331 ++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       |  92 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi          | 289 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 +++++++
 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++
 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++
 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 +++++
 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++
 9 files changed, 1271 insertions(+), 3 deletions(-)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260322-knp-pmic-dt-4873a7d906e6
prerequisite-message-id: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
prerequisite-patch-id: 46f519528d63c06ae8d46857285f08dbc0178a11
prerequisite-patch-id: 80394c38f46592e7bef58b2670bb18e9253718b0
prerequisite-patch-id: 2b0a4d96d4ce86fc6e56e80316f53f30020abf65
prerequisite-patch-id: 019501eb4a1a36a34c5b90f63bb2f1b521d6d60c
prerequisite-patch-id: 46ef2e848ebe5af55c6e8d6e16c775f4e3db4ed1
prerequisite-patch-id: f24bbf211e6fe18d5a022b1bd31050b0b4056cd4
prerequisite-patch-id: 72c1a9d0eb5c8a94233d47809192e033ba2cb6ab
prerequisite-patch-id: ef3125ac8d8471149ab219b79a90304dd491602f
prerequisite-patch-id: f7fff260ebea331c7faf9be96eae00ceb42f94bf
prerequisite-patch-id: fa0135a52b89f9c5baa8c9fa160d2d927e4e37bc

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


