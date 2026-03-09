Return-Path: <linux-arm-msm+bounces-96183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE4hAaiXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97470236803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F319F300F580
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046C8381B1C;
	Mon,  9 Mar 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaNOT4rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJQ0n1PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBE3815FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049726; cv=none; b=HkDZX3tF2ZkP9fjRc8KNG+UPouYxL8oYCNX64CchHNDwjRwbiGtnKjukSP6piDHq16WX4ZH195ZorezRxvnUsjxtRwF4MIQMjVWxuTK5HVJsTrzxE398yUKTKZwWf8RRox8KX6bYdWS3W8eNHi8DLzDQdDMcMfMoH2TZSE8Sukc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049726; c=relaxed/simple;
	bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYkeisxaq7NaN/BRW/fpXBAxz+fTZv6zYTJCtzZksLqMzAFId4dqYum1W2hcQXEbM6KUfFw5Y1tf8rFp85+3508cONomC/qWDIIwByR/OgAOgvcEtXecxsntfu9GVF3UgsdghV9Lk9L57iBEh4Nf3kQIH5GmEoGO2Ed0vLptQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaNOT4rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJQ0n1PT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62983pjN196574
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=FaNOT4rTHTMX80BO
	NNDcD4DlDMmDyOthYlfwnasf6azYcFvjPA8cNV5qe6kXFfrSzV57BNnz4Xodp6Kb
	esm3e3psLAVtGV2zJ1RVcIZvzhGccFPiRg3A4aQ9qP2XDGGBoHIA/F3gqtpPhUeI
	kQVgwY+DPTc1S++6VkAQsBbeFzhTWOXLAK23PrX8KNbRarY4YWXiWHwehOT34a97
	oe11MyGkKbp3D8HVdkv6pGurF/ppPXApiXgL/uIcSY1kcKYzL4G7t7SSnexujfvi
	jUn0xgodnWynzoqAJFJbIA5G7eo94bOXgtOjO+n6YmkvXalj3MpKdb5h8Hf1Tq/h
	htfYDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vcu2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3595485abbbso10464899a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049724; x=1773654524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=EJQ0n1PT0LqVaKtkbcwOgEZspDB1xQ47GR1qvFzXyIQILtsmiI7zWRZsH9IlLGjd6W
         U0rBF81D7Eo28s2V4+p9xIsZ7OSiDGoUvOmSX11N8CQvqVBjBswMpbc864UK/nW7Ntjn
         ZEmT8uALDL4BTKi4MrfKKp9LWxcyLhZIIjZEN70pgTjBLoVHyTJ26pb/YoDxv0sopkRg
         vfA4HnQbVXjY5X/DpFTJ9G/d9UyPpRNkzs4jBFlsH0RcTrgwJUXZoIlans5R7/l9diQ3
         YjsfmwtrfwssiyeChOzhJnfRcjD338GTHcb/gvUAKhqIMWwGpo7bXgFdVl1sjdNcuXCJ
         ZLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049724; x=1773654524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=dcHcsRcHJLOkf2T1ye0lXisSrARdwviagHrouEvsQJrkctux/2FQlI/YgWYkveu3Nb
         9+QtAPI9MC95F0JW+xA699xbVmeIa39uabQsLzYTnoRHhq4TeBYFDiZLyJg2FgTkSA70
         yr11+Od7vj7mnpXLNq97PIR684W+hIzGWzNoiEEmwKd5K29LhmQJdVoRVVWuDChQ/2ne
         ub3TIZIhlTEoeKYSPTCMBgeVAqTTVexIYA/2VQNO1KfK4b3aM9+rQr+3j6DiJruY+tV5
         u1Z6e4nxqWKhiA5DOqSq5rYWoMNkhB/GaFFC7tVdldj6sUsh6RNjwalsZhPM4wyhHmyy
         deZA==
X-Forwarded-Encrypted: i=1; AJvYcCXH0FtNlQ/FQsQHE32oSfWP3/L4p1yOpHGEJEzYaF9+SUyTRhD/eoEzAQVJEKn0TYmR4jix3eeTMY1CaT3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vgcjPF+VYyM2iuShZWNZk29SRSsue0dsU0LwuWaupnpLDNKj
	Pas/gcUtZKO4vFz5cutWngJHszSz9f6Zg9I/jnv22P6KqJhsfwfRT9uPbNtDLzz63zzOtYbD9Zd
	3NhIZD21yrP3AqrbQpkIMRJESGaZGub26wpQ1PsyBmmvF/crmbYLYZBqpXaI8relhud9c
X-Gm-Gg: ATEYQzwN7esDI5C7NUvMsu5jrFaHcKOle4a+4EtR5dPTl+4to9wT9/Bzo7UhzGERa5p
	YMNL0mtmOJDiEyhO1VnG6KDHngUtV9frtDbjAPQffIOlmucRVvLTW/4raJAnoQIBIa0t3advSRd
	pAsQ9W5AHY8dPquFK5szlmnjw8uqyogx/5KrSY2xMpFxn8KIiNT5ZcjWXz51nZYUJqeqx7wUoFY
	xlgley9LaYYo6h8GLWUeKH7/qa3UgNvs5em1hEzve4N6d9ehZHcTH40J+0AInCStat3FdFg54dr
	tBoN/zXFIj+v2kFJtJM8w34xS9LQ0TimYwPiUcwHRbAuhL6VbsXMkgZGHhXIMUWDXmHO4oICGdj
	QeVOzZBYXpNWtjL1PvSHmxRJBiiNOSeSZ4a2Oe1rL3omSY0RAXRzP9FEPVfTqpq/heYhxQL+rAK
	dkmAPtS119
X-Received: by 2002:a17:903:13cd:b0:2ae:506e:4711 with SMTP id d9443c01a7336-2ae8243297dmr63511605ad.31.1773049723653;
        Mon, 09 Mar 2026 02:48:43 -0700 (PDT)
X-Received: by 2002:a17:903:13cd:b0:2ae:506e:4711 with SMTP id d9443c01a7336-2ae8243297dmr63511425ad.31.1773049723199;
        Mon, 09 Mar 2026 02:48:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:46 +0800
Subject: [PATCH v14 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-7-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=RSm1iC1KmuhUuoAcNzQ9MDJjlZW0pji30cK8svj/c/5UUe1a1wjIKbxi1G6/YIyTm28tHffPt
 1G2/LSGs3vjDhii5pTvNxPkZ6p3YG4NvMQWo2QInDv+Lud2JFO1bKVD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Ovb1Hn-WNdvrgBK_IlVBM8icSIiZY6Yb
X-Proofpoint-GUID: Ovb1Hn-WNdvrgBK_IlVBM8icSIiZY6Yb
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae977c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfXzCAz9SgvzBY6
 e8dZJL92qR4NlVqoPTJF563Q3dUoNOJTbMINIBQ68N1tLd7IJ6WMREW5Uy9H7wxYLtClX4tvE1R
 A0Vm4Nch3PuR7zUFh8pBNNl9+K+A1AqG2o4qU2iEEOHkMUTCtJ7UWF//VJmRyxi+vPNxiDf4LzZ
 o3fUx8k/yGz9fSXg9L8vogJFuWlecgkqr4nlqcODahmimEa47bfsD27WL/oaumVBFtqahdWIJ01
 cutsJB1aGv/wG5gG9n7oNWLGH9oZUc1qW7hke8b1yL5E+UZ9ZNtMH5Rz2k6zFBRO47kUdAlbRfd
 zkP7HDB+kzJ1APBYwRIpgVbcJ0eMGEsOZtsqKs/nLeCk8jQ0AbRHg3G+UIrhNNwr2NBbvxEgCBP
 OrGRdIJOSR+PX6PjhLE6gx1zRv3DuNKDy5dn1o+u4IcC1KaG14GtovfxyclT1xSHcXTCXlsFE1F
 RtU2H/aheHyon+89RFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: 97470236803
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96183-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.61.12.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
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


