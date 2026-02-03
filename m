Return-Path: <linux-arm-msm+bounces-91601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHNBDMqQgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC39D503F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC2DF3029378
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6780536C5AB;
	Tue,  3 Feb 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogpSHxpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAqe4QPo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE6371069
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098806; cv=none; b=jbo7CljAArm7oK8lRCmbpZA1HnwW3pLg5dwCpWCCyAqNqFbL1pAhPHukEghyw3YmkpqkunaPGjadZ+1BsECNFGSMUcxILcD1Otj9Re31qZCVv1iIvC9QsD7T5KfdirqIqoyKR6Ak/OZVgT4nnGDi9KF21gMjDwU9bRZmlZg/ifU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098806; c=relaxed/simple;
	bh=/56D0CBGwVyzeNr/bKvd/5zvHjkPfwvMBgCgHjYmYlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssNtC+z+MFK4dJPqwdwz5IuaNVd/kCbHk+NNg4YbF+2iMB3hYF2xw+bDnqhZ+UNxUZFUC7lXyiqhhohjHZiTr8VhD0oVf/UlqKLMHzpfYORmLOpC8Y1/QOuRMZn+f5kwifofpwgwLZf4ZPZ3V8DkLw3o5m9sYcfJP7bOUoH5zn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogpSHxpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAqe4QPo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136587r2899952
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+I6n1aQfdZpG3e9vc8tgl2rq3FMFAVrgKKxvf8UPFxs=; b=ogpSHxppcRboH1p3
	44mu7s+tbl7louDu9EzA9vL60mT+81ew/YSNvL6K3SWrR1uHiCMVbjHT9RUJ/58m
	WWt2iEBAha8bhStIHBcH8rpyMUrkXXaG4VYpvmAi0IN+m0D9wqYrhVHmfu/hh60O
	OC+z9jy/sabSjSN0QVpZK4pgpnBC1moLG9+V4Jau3FTldv2Pca+4ErtBO6BjMLRI
	eTt81nWwp1ENO9TmvY56sa/dq+cN0OCR1dx+1DD40mnS6/pLkwVfWGpWsNMPFZw5
	XX+KQVZNHp+IyGyvFb/miC+NpSSloWyzavxX0aEFsQ0TiJ0Thw+3AiLGf/woYp9q
	zWpqOQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u34x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b715b26fc3so7163303eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098802; x=1770703602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I6n1aQfdZpG3e9vc8tgl2rq3FMFAVrgKKxvf8UPFxs=;
        b=TAqe4QPoVhDsh/c9t9rMZoumLUunT2TtorUJUagzyPCboCXb+dmFNBtHcWb7kZjoiB
         UBsWH/ByTKns9WCeN/GpG1SeeSB0gPKJ5EvQGI5bgBpMjnHCi6vKpNgw50PNLrsM3G82
         R4JH/5YRcj4oqnqDcJbeea5ydZnWwaKYq5/O3RrKooyWghh0IncObVi/K4G1IYgONXrY
         10HsiTLUKyrcNFHm0JTzBxzwRSeoIi6oM6zWU7Xo3m4oQG2zarenDtoNNpyg8qZzrzZe
         l7mf228UZftsLuxT4zP/JbUfToNa/rl+nVggu2kMirG4Qh8hTWZLTExy7PJBbGbVxctl
         CyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098802; x=1770703602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+I6n1aQfdZpG3e9vc8tgl2rq3FMFAVrgKKxvf8UPFxs=;
        b=pfpynAAFJTSXSNhOQHuEfOTGDwbjPXTbdUBNLL3xAzYhjx9VXKt/oHUZ8M0JRz79bY
         HF3BwBVlxLuBsdrE0ZyZJ7E7ao6NsAPV/GGQD/ASj1Drp7tH7iyW2QzqhitS27zQyhf+
         bjK7RIcZ/w7mEivdeVnqKSEi+1G7AxZiX1bdhDtpuKIYSZIXdMDS/zO0uYJ40mzzK5EU
         mn9xAUcXWm+xqXO1R/V8XrH3/u9+HxQ9CwOXVpt695mQ7DbKaTec5UHv+zd1uSwWP1rD
         LpZi6BlZFLcnELRB0LMa8RXUEGmpFlQZKoE4bNajAtVkq+Y14hR2TDKAYscqpFVvRhX4
         rzFA==
X-Forwarded-Encrypted: i=1; AJvYcCUu02LPyuRfpnDTtR4N+RyNoWN3vGZCKYZIk1ygaJpKAQI99JRJ66SksyUOi0SJN45kmX+DidnIdnINYUqF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz60VNqD67uSg1U9n1M/VxjFHQuONaYyBDYCJvIGM/IfSwerpyE
	gKrqzErWR4aWQHv7aSWSXLmey9M7fvyAkB3SiWvMqZTvYbPQEL1VqE/9XISqxPBokAujNK/iJ6x
	UkNQbKVVwqVmKfgKKHZpuL54IQ3ZfBDXOk7bHOFMrWRU+b3c6jCwqjOni3nDSmN8AgRBu
X-Gm-Gg: AZuq6aI5X9Gn3rJYPsbNokTemCZ7+u0NdC0515Cz8c8srSC27wMkFrsGjKT2BuIcMR5
	WADwgeDyJIgA2JQGgNm8x2VeJkbGUv1ftUVSCVwU+RKWX5y5uHm5EKnpA6bcdcIQ059K5hZJs/p
	U0CfERXpYelNhimjzA5vi1O5krD0OJtYXDBqa+1LqSPvX5d9UaizvFQxbxxEu6VpcivU8mladoq
	7a56bbgFGTO/gmXvYQWYNBQI0xO50imgfEQThdC21EH1qGeg7WUXMhcyw/8TS8M16jSwwRkwriD
	6PkUGNFvEacs+lu9w4Wt+asvA9rZMd7wb93pAkqaQQ90loVUkF5dHkwjgh4j9kalJEXh1WtXsMy
	78P6Fp/l43zvaCVJhBmaBHF0xWfyGwOuVZYFpD15cTlfKshwpgQleDhbiEs92
X-Received: by 2002:a05:7300:e7ab:b0:2b7:3281:6c59 with SMTP id 5a478bee46e88-2b7c8663d85mr6318607eec.17.1770098802308;
        Mon, 02 Feb 2026 22:06:42 -0800 (PST)
X-Received: by 2002:a05:7300:e7ab:b0:2b7:3281:6c59 with SMTP id 5a478bee46e88-2b7c8663d85mr6318583eec.17.1770098801788;
        Mon, 02 Feb 2026 22:06:41 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:41 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:27 -0800
Subject: [PATCH v5 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-knp-dts-misc-v5-10-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=1047;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=tdjvmMctoKSa6ra2CfAphD+EWBiS7JJc2hxS6t6vhwc=;
 b=JheejFkD3mceZ7NU38xOjx8wGTxrzR7BS8z7gL0za/FYTgjOzxP5RqZCwbfUvp+WtE3LRoZIr
 dYA3n5kPp++Cw1lMOiJv3ryqDfWfwb6DY/n045KlgwVLB6KMauwdnEE
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: lwg5pzjRar_adkr_Kjxt2AMtt7BPRnEW
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69819073 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hvWDQT85v1CTPbyC7zMA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX7zMpYiT5Lb8T
 JDKPuq5Cg26EKW4wUtNlLAvJKNSACqqH4CTixdV6j0NJP6HCVyqU4P9RhXG9th6jhugOBDeK8M4
 NK1xuxuZFWUTNfi1UwId+7CF+2O0Xgg05TPb+B+oqMoaaUkT67fayyNOFNB7TTxcns/RBS8SfXs
 1U1RuPE+/Mm18bVrusIf/O7O8EWWPRfjJhh2xvFqx1IB0/jr2m7cbWpxrV42MVR3iK+z335jp3+
 H237ZOUwZqayaAguefx4qlfD/5LjVAwq2Rewt828iQzaHzsjqyRqDDXDpsE9xnjk+miRnMgCbJf
 LAlIlYyVXLbW0lVC+t++Hi6tO+YkjhTo4NB6K5Y/kffiSEM4n5HweurbXSpJ54mtJdcvExOSkDP
 59uCOjzLIh72Euo+MNmgflue96bhPb/pXHCF1jCVB0S8DfN4SNdM5fY57d44MP4QKbG0jgmG3wy
 tl8pntnJ4cHaB30k9rQ==
X-Proofpoint-GUID: lwg5pzjRar_adkr_Kjxt2AMtt7BPRnEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-91601-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CC39D503F
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Enable the Kaanapali display, video, camera and gpu clock controller
for their respective functionalities on the Qualcomm Kaanapali QRD and
MTP boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d383..66ba440d0123 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1454,8 +1454,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_KAANAPALI_CAMCC=m
+CONFIG_CLK_KAANAPALI_DISPCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_GPUCC=m
 CONFIG_CLK_KAANAPALI_TCSRCC=m
+CONFIG_CLK_KAANAPALI_VIDEOCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y

-- 
2.25.1


