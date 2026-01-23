Return-Path: <linux-arm-msm+bounces-90292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pe61BfMgc2mUsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:19:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D947719C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33F80301FA54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0251A36CDFD;
	Fri, 23 Jan 2026 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzFSXVnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rlxh5F0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC051364E9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152400; cv=none; b=YX780mqCUWzOOtZSZqFOkGxnp8p5LmMlCAppvpcf/xJJp/6rpVYsUIWg9PrW5U7GCWEEw6mlTEhOrhVk62a6Qq27P0eNxw6XwRIyA3IzYAlazyao0OE3Hox0Q1NvVI2ZMDtRqb0SH0zU/veUHLwLRNV+7sCXbB8ZcNh69xAMBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152400; c=relaxed/simple;
	bh=htBjb49w1NMJvju0Z9x0a6d5PVB8917gPx9MATU+Z38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVofDjUXsAzIRUtQzbcdTEBHe3FlMiXZDAnfwTk++z8/AbSBR+VdhyjsW2esA/FH//8Fsi95k5BwMdXZuTyIXeMARscxYQeXgJCdmASseMcbkxXZVCAoEgXN2AbEnxYkVI1mSXBI9RiKjy5WjmBRIdd7dw1jRzcUakTSHZxik8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzFSXVnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rlxh5F0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6KlX3322443
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hevsL1VFg+Wh5R3ZA/I+LrCo1Rf8Ew/DU+wBbrRMIuw=; b=MzFSXVnlJHjlKO7E
	rNZ4HPsQqOJ5YV5ycWJvMJQNlU4HJpK2EhkChNy3WW7C2xpJVu3Lu07Lcf07Qk1F
	reYtGxqxOxLcEkJO2Ng1zQ2JQjMu8XmghRiqc2hIEOdw0XPRIm2TxuF6W9jM2w7Z
	Sn6TfJPmY3qZwdofB7tiIShgadM/9VuFoikgHEOyxXVV8CXmewK6EYgRHHU8al/G
	9I8RCfnqAtF8uc8Rsnf7CYukTYqa6p8LxAVSJWcdRAXdjGFcDEWSE0ayJJKs8LtF
	H3b5Sl7NmKaz/VYricWmqgdwRlnAq4z5FYxNxeLGBiIDe6Bkqu5nNBJLvyJxqIbl
	dWR9Iw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mq84wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a78c094ad6so17174585ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152385; x=1769757185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hevsL1VFg+Wh5R3ZA/I+LrCo1Rf8Ew/DU+wBbrRMIuw=;
        b=Rlxh5F0LLJYhclNyEoKiR7Q/kkL4ph5stmsjjey6AcQZJEzA5hcT4iwG7aTQjwpieg
         eQoujKK73qOZeL3p918lB817AFgHYS3GGceHaB/+J4Yic123JPLJXZTERmaf6M6ZyuMa
         ey1N3C0NhvYhG6X3luZkZRRLKoKzRTK3I33m+eLm65o7u9/U8dvxxk6DVRZ1j+qCRDrV
         n88IGZxmfH6/S+38aZUy6QPdXBchH+SdLG/RAWly1cvq55OL+LG/D5XH5UEo4Jm48k7n
         b9QXHLE7adUoWn1l0FpdkoddU9tc9MvopCIr7QYlT2sKNiUl8ni+lZNdiODNd6z+JuzS
         VD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152385; x=1769757185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hevsL1VFg+Wh5R3ZA/I+LrCo1Rf8Ew/DU+wBbrRMIuw=;
        b=EyFN9VruS4mLGP3TvJeJ0Lt2wyC9SDWEvRCU2mgV0/0zDvzYKavgMRBnbU+cS5ttqM
         Uyk/auLLVfWaxdzZ4zAOok/jqnLbQIYZETf8MmKUL5KGH3hET9w83wkOHteTZi+Yg36X
         y4gHQZxNbGh6kArOeUcnxoNiwqmUCv28td7QqsrC3pPCHRV1nUcM9Dl/ecCx1jEgJfBr
         lV70y6/4fRN8nokzJ0vEko/Rct5NeOYhBFXVV0BmhXFdjSU+rIf9pMTmyOTX/FV/e6iQ
         Y92ayK3NksDMeZ/zdiPI0/0nErhSPlylJjlSklxYqMStrpUPdzkhL2Rjy84wVUPT5fD1
         77Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWCxWX20XGRkMikOA+97JhRoyFHT7+zWWOszt1QjwWMVovyQaVlb+t8yRdlJxkz/4V6wuySFwiPz6Z23vYy@vger.kernel.org
X-Gm-Message-State: AOJu0YylYKXFPmz4ugYeflcbmyfniFiwZstdzWIlfmkW1BrXSOj8dAg2
	q1TXWd7CctZ5GId+JRs66R8kLUsw8Wt1FfnGCv9T3nTZFQP6edEGKsptd7WqiP3zPplainfzLdX
	9LEoKVfPtd9l2AUh42C8K2vTv9/OoOThPWQbxPsSVtxycORzWGZrkiGyNEkoknWvzz2UA
X-Gm-Gg: AZuq6aKgPBhLlkQBHOdR2R/yvhnaFPo8kNGnNaVMqXYhGdJfxp/S8c4q13W5jHWqTdW
	9G6fzPdHL6aRuU5aomghrDLpW9AKaoylJdw+N96Fa+3YyYtKiGg/eAd9e5AK9+xBaRdpXeo4F+k
	P77Xsoi9aGnwQwf94SAAURy+ybNFsP9A9Kmcmt7BDZpC31NdoelJ67rfUfniGE/R/EQbur4My7g
	pV9A05kUQfGi8lVwly/x4fHQKfBlLngijFU7P6PJHm2+nLySciCdhhi+H83zHWO2hPaDW9FtVWw
	5sNDLUEzwLb2da336xf3yaHiG5Qy6zuc17h4fAwxScPyKeOv2d8PR+7qeasX+O883uaWRBNYwG8
	MPFp3eVBlPsmj+qpcMOeKxYIzGk0Q8KAaHZ8=
X-Received: by 2002:a17:902:d505:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7fe444ed1mr20134745ad.2.1769152384848;
        Thu, 22 Jan 2026 23:13:04 -0800 (PST)
X-Received: by 2002:a17:902:d505:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7fe444ed1mr20134515ad.2.1769152384277;
        Thu, 22 Jan 2026 23:13:04 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:03 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:29 +0530
Subject: [PATCH 05/11] arm64: dts: qcom: sc7180: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-5-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1205;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=htBjb49w1NMJvju0Z9x0a6d5PVB8917gPx9MATU+Z38=;
 b=poeVN86LAsa32iR/mwIDJBgUpfDHbxDfboDayFuiMNefBfkyhwod4UjVOV3P+YjAEDEo3718s
 bJ2V13Nr1GOBl99jMn3je7VVgZ32/FNi2Uc+fwdadI1tgZzN4zMrtDZ
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: 7mAEK_JiZmrnHvDNA2khnkywXf4mztq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfXwxU6nMDlNucD
 iJAWTHp8x6qzcT0XP8KwtKygD5+6MfD5dWWYJACec0BHn++tZ4499S/w3dQKdbkJLCGYBSWlbJZ
 /FIQP1ncy4pnA4veWzoFeTE5nLzXIG5i74pGbwHQ9E0C5S3eXk9rsAWAv8XwUZ/S2myZ7Jz7GQn
 AlZknsjf4Eez3IAbJBrjTT9wzjhR40Xw6PsRxAWx4ZbTq5fpO/cSFz2xdM/ixBBy/DlcS70EnRs
 2Cn3WM/fL5mCvXoPt9o6ur4nEly2uzhXSDVSf6V9wYn0wfjTA7Zg5LzPLO1iz7Eejf9OmKU5AuL
 FyWL9ppaixg4x940ghO1pnNKu146ENJZnYcCbQLFpYBjZFgU/F+oNr2cer6hBL2L8Dlg0zuCGiD
 r3mdgtGTobdqf90YD4muR/TPkx0L3h0olE8zANfDDOTLWqRytN4HX6WTSusgCVac48tV60vZaGa
 AzAL1t0xQafPQda3yuw==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=69731f81 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 7mAEK_JiZmrnHvDNA2khnkywXf4mztq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90292-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qti.qualcomm.com:mid,1e40000:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1d90000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D947719C1
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the UFS_PHY_GDSC power domain is enabled. Specify both the UFS_PHY_GDSC
power domain and 'core' and 'iface' clocks in the ICE node for sc7180.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..74eb895cf4da 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1605,7 +1605,11 @@ ice: crypto@1d90000 {
 			compatible = "qcom,sc7180-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d90000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.34.1


