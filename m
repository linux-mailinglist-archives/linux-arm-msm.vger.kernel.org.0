Return-Path: <linux-arm-msm+bounces-90492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL7KBTMfd2ntcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:00:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20E85353
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B32230946CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A14731770E;
	Mon, 26 Jan 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmYeYEYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEqSGAmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B8E283FC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413757; cv=none; b=EBiCc3wgiJep09oDavn6MNDqQGbDQRUHBxa8x+MhYg3pQLqSj0S07dqr72bVW5cz3ODpvDkzlPNGItXa9BNi9QRjmx5bsMnsSYpjtU48d2CwI8DYgNLew7WoQ3dVRaOl+SzrwJ6otv11uql8Yxx2nZzTJxAWRo50Ly/JK0uHqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413757; c=relaxed/simple;
	bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaI1voO3HKa7S/u7I5kMJ7LnjvAkrhEaXeIR8AFqp+TardB7sx4/8uTVCN6sp2QAb0Na0YRV5w0nvw7Rps4v0BgHcPbw8FCeBVULNocujPgtHqPhqSP+hkUUl15a0GYnTqubhtQZWNIjRIMX0bvWSlLchVzThBHm8o5NROHc3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmYeYEYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEqSGAmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PHnTj0032778
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=AmYeYEYehVtu71H0
	KIhpYPSDb2kinA3gMeSwg8DB95QS6Kw9LHMGlfF/XhKsvlMc85Sg7s5gTkDI77al
	xq2OMmGNboe6LCX9N38mSxuB4o7iBUslZIbHvZzA8o1aKhcyxKGYNDLrB2aTBpEP
	R49pjvjaYI8abpBD4D3xOevnRRo7lUgMW2Z7Xllh89kq2lWaRsJAvff9WM9Raotv
	sou+/1bS9VhAZijQUmWSrkVasYh1/On/baMRUFOMca99suFQFiswiz4AOAsGYTrL
	ozsP1rKt6rqxFN4o7wJ696Forka5PrMpg6je/NGTguf4lgocyZBfWYy3M3HVhZLb
	NrZX5g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uus6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-822426d844aso2998109b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413755; x=1770018555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=UEqSGAmmOVAhri8ONhV2vDZ2fZlCrN4uDGze2CvsnKQGiyKiSY9RHGj7UVRY0GGnhp
         hqQU4KTcRx1x/iXMzUPd6Mabt8ZqLE49TLgGYK7ehBrO4V19rJxkFmp3nBqab/XAAHSE
         qLI3IX+OV1z+nGUT0FwD3USbVLSlzDij4PSS7k5nWJbpfOmWAeugiJBrhx32ljHEW9pr
         W4y5kYMG6kSA6IHO1/gfvLBU4G9CBFlfM+7C/RV8nbqcJ2Z5yQ/CmmW9zuERAmGva29E
         CCordeEOBOw/MrDxey0WlqKtYIt2RJ1ArdcK/HGFeU+B0uMjtnbqRpS//oFcYp5+KTJH
         JL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413755; x=1770018555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=XHjufEfz1HdqFhYUbmlaq6Ns17WIWWsX3XAZwEWXfxx575Oo2MVrQhr06iRrxcKmmX
         XfCrC5lKY1lt+yC4s7z+k5P8F0GJO/YmGxXm/Y8SDJfCSEeFRuY6soY7vsUsed8Er2Aw
         S1qwiB+mi16ryhpd7OHtG42/djciLNpl1rgNEdnpCygin5DusIjIFZSwQmSK1Q/4z8sj
         ewT3Dmec/dEHAG6ytv57aNBskFVzoy72rTNzcaGfeAc5VaY8/Pchzehi4M9Mv5OUk30S
         rVVoprkEnnZl8St8ojf4YerLvaVej7PuEGisFTrNdeOw5wvUEx5ZPOa7QXjXB7ghFs3D
         llYA==
X-Forwarded-Encrypted: i=1; AJvYcCWIPNgIYj4ig7xNtWGrxEx6N4kVCqnxVlT/L0o8rDR0xQ4P9kaOCDU/VOGcYie5pVIsIPJlvymhI3narbr+@vger.kernel.org
X-Gm-Message-State: AOJu0YwCX8wlj/havBZ/uTct7tup4tdDuVp1rBiWoB1KOTH/lHJgljtK
	Eu4uNYDZnBE1JWusktLiszDgoPa/4VamSDPRPo8CFslTePZYW0QHE4IHxWjJKK7igBNvpnu/r3T
	yZPbP859ieYXTNxdCa7hlz0qcIus3ZS7iihsWBrEIAnbsSFaka3WkayYfnAqCGHTSpKWL
X-Gm-Gg: AZuq6aJYbXwzTcJz1RIiC6V8uV4mVoIHlqJVkx8a4Aym2sCMZT3cjxCIp9QJdJf3jXI
	aE42HotCHV6G4TyfVJkX9z9srg+b7yfR/U6M1N+frWdDUQdLOTi5U5ATscqcOkJE9SnMNfMUL0m
	W2b+QFv809fPU1ccTmwzTSr19cRooPae1FayyQ+7AInDuUCOGMl1mjySGxMW7iR0GncZlMJhK66
	rXKrTv5UVAlxFNqvcIcyC6ih74WXATce+ovRbwRZvwNq7YwpC5JteCp4uzdLCiUC4FsidyxvR3F
	pM71XtMEOquvmurFlEVV5Rmw7kEF6fXshJ+WroVw+6aidJLXIm/AJp3i2eOInvkp6a39ql0g/DG
	S7GM4MChZ9hVNH+D0hFRPJgh6X2oGnL8/hxbzPgNK0CHvEkHxUiCsn04X5qEvRQD+Xt+Ig+7fcy
	49
X-Received: by 2002:a05:6a00:8088:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-8234114ddd6mr3939373b3a.3.1769413754705;
        Sun, 25 Jan 2026 23:49:14 -0800 (PST)
X-Received: by 2002:a05:6a00:8088:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-8234114ddd6mr3939338b3a.3.1769413754236;
        Sun, 25 Jan 2026 23:49:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:49:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:48:00 +0800
Subject: [PATCH v11 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-8-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=c3fl1Yn5d+S/JHZtZgPGa7S7m6K3H/GIa1tLJGLcn+2zhh5RXPn5Yb5BBM24+SyvhJ9NHbxLI
 WUStbQLUzctDbGOvcdjUgxHbg9ibXBmtMIbL9fRjVw0A2+itS9OMGgy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX2B44JgMVQxdO
 QetEMxL6EVH4DDv+Lk+XtzeDsYwCDC4ZTSD2JT/z2h1zxTEP8w2so7l1mOdrdie/5lCVmKNTWw8
 eNggQwyherdywBkih32L/VTi2FAvCbId0jc5lCsgtIwXZUZGufyqO3bqvJhCEBqOvhHZGuCYX5D
 PD/f5/Erf/3wXrt2qipMlym5F+Lfxobia6d0VL5ueR23VGu+QaMKPQQQvMUX83HfDqi/dYASymm
 MSxiH34n6FO/1zPDjWCNNIDvQ1dl3RBjVVxjf7ue544GXeNVs/uv4llh7YuvPUit8iQhVXuHYtM
 uxaewuXJvxQJE/nNl23D82ETHkWqcE7Lppg8h6VV3oKPBUQc2OLBKeGQNBkF/tPsc/wLSNTNb+v
 TljFTHoUhd5W8InBDBURUDR/oB6UVUiaw/ePwe75Ewvn9aIEonNtrInx8TBTrD4JKggLcyMjYlD
 8774AwtFkbVqd/4X4JQ==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69771c7b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: rZpgEtx_ZVgm-fDJKg4dmbC-OJjUXlxy
X-Proofpoint-GUID: rZpgEtx_ZVgm-fDJKg4dmbC-OJjUXlxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90492-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.61.12.232:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D20E85353
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


