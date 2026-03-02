Return-Path: <linux-arm-msm+bounces-94960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH7LKXmfpWl5CwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:32:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78E1DADFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C38F63004DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E22B3FB06E;
	Mon,  2 Mar 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIzI2SDp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyAFFjBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620532142B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461571; cv=none; b=WBUMx6UrD6KUwXeAyp3pSII13mhXj39Xe8PCr7QiznwrcaqjAv3DnIfQZsrn/SeXEcGdx+5kNlRPe4XKHwFZlArlB1w6hATw96r5Hehm1UEwvkwhKqdP1MsMSYdznInEmt52iE43SvJSBA9CIuQpUq5wWUC/1Mgk1zraygMwolc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461571; c=relaxed/simple;
	bh=CozuTtsQmrjIREJ1CnaBYC+hfRFACh7pszTPstMo44o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cMI0tZv2P4+XpQvO94PrXnmBYmdfcPGLNBhCpkxPhv7oNtpwZ7Ne3xUelieuvaHCz6i+F2GhWk9UwqDMeHTCBE6Lokq9jzg3ozKidw3Lt+yz6wG3wX+HbEYgE5hNBB23QiNmuiBZKaQ6RAS+f+LZHoNnfoaRXmNpIhqDD64yNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIzI2SDp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyAFFjBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K335782739
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSjnoDZ54pYDcZqRvr4XIg
	yQqmucmNPI9U5fbhk9cLQ=; b=WIzI2SDp9j09DZOMwyiCwBha5XikE+NqlfW3GY
	kKYsWWGKrnvwzzUtM8v1WHXoazXXrMJPQhp9oH8ZYjt6dnEcNFuuON0U/w6PjnGq
	x6OxA8JS5QDhwRTeVia9hE1/Ol4T8Js0xvQnauOU2nAhwJ2ng2DkD5qzF6w1pGp3
	mDOUIGG12ySqFRGldno8mzKNz2EAHc7kZCkkvUMCMmb/AFfkAi8Pnzakbmhvyl50
	ak1cnkNBYYoUMIUMgrEjG05oqE0VakPOQNAcJb/uVHsPOzTXFaWuyhEbTWswQ3N5
	h8KtTO0yM2N1DxHRxyQ3ffY50MoyErlO3LDVOMEaZfFJUgDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00y8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:26:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so2998575185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461567; x=1773066367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSjnoDZ54pYDcZqRvr4XIgyQqmucmNPI9U5fbhk9cLQ=;
        b=gyAFFjBYDQMXQQ+BItqjgbbLzlXRNFordwee9PKntra0JORA+7HtHheTEFnOg6MPFo
         KGR1Q0PPSVLERpEVA6Z/17wch5mwmVX5C93arLkzYxwDjRRj/i4wxJDfKSV9q7c+JKnC
         lXAXas+ujre43ep5w+7w1BoRpWj48nyG2n7W3xi1zVoEH+4kS8sE45gq18kFv4Vnw0Je
         vG0hq9XWBFfnNlpTsFZ8983JHrbu10D+bs35EnbmqZ39T1tZ3Rv5Kb37eINKWmiMi5sT
         +wt79AeqxFnZarsxQX64n0MXjxU57D6+4m2NXJfpsJTZmw3UA1F3vZO16cmq59mvGE0U
         yj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461567; x=1773066367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSjnoDZ54pYDcZqRvr4XIgyQqmucmNPI9U5fbhk9cLQ=;
        b=hidj8BydgRRWbEsODeDeO/8gcWmB2c4bLDefkL3s/H14KDxQOKJEyN7rbb7WeXnD+M
         ix60twQmTP1/eFZpqkCx74wvofrJrnR/HdBSW/x2/Ymi2+/Icv+kvn/4OpVR9mKJZ2zS
         UiaE9D/zs03LHnU+mCqiwkcw+csAUTsahLNGaQs0Qgy7jNaZjsxCRqPLcsSXl9LyWLVD
         B215YARFQCO94LVXyaQ3Q7CwH0CBucSKPcba5g+t6zcMVSdJEzfFkrf0IUsH3I7Buc54
         zYFoEx9a3/f57isI67u91nCs35T07QRVlnt3BsrQlAeAZH3WnhkHf/QWVD7WLYu2p0QP
         pMiQ==
X-Gm-Message-State: AOJu0Yw6GyirtYe9nqeljyl/nKSUBpYfRxXvIdaY8wMJGhqYlkeIsLml
	l5S6qgmBR26FM5ry400TwMbIrOWfhjg5b0Gu3BU4+18hQZmdw1+X9CvMZQNSQ3xxlW9jXVzKa4b
	fvoFQSP7eNpTc7sKD+yqGYnbrFLJNxL9upStg9BpcToVpHKD0dVtglAxXdpxg/dJuWViS
X-Gm-Gg: ATEYQzzDr1pU92/UwY2jKVD7F19FqHmrZy5+yYVMwx8755Is6oEeiQH5V9fMvewiDih
	B6age5a9RAqMDh3kciasjHA/fIoeBNr779HXD61XCIpDyngmMcSgp3nkoN/+msbAIxkZ45MI29a
	PZCF8PM59d6Ilb3enzkYAYa1pi8M8hfN/RGbcKhJe3DsGu0s7dUA8SPooRVwSrw4xhOIxC38gCk
	MaoPINFXFws76tL0SlGX9Kz586b4irkac+lTE9f+K0BY3F5kdn+Wz757dLEsDEvqVY2kX8Mg8ng
	ZSR+HIXgCK/qzkmbdR0wtKsoGnv1plYjDO2HWjI2tRAEi1D7Cz+eMu9HhrTWVnGCvveGm29xQ6z
	N6kUTpYsPWTN+isMdo/FKhOtQUXhJknOTxgjDpJT8HvcbH2yFqUTHMMBlxzghJxbnMK6Ih4Q7yf
	tGrk94z6NdyJTYvWJ3kHQgmPJNZzSXUN0ZGGPdmMDuiA==
X-Received: by 2002:a05:620a:4511:b0:8c7:115a:d0e3 with SMTP id af79cd13be357-8cbc8df6f1bmr1596781185a.37.1772461567067;
        Mon, 02 Mar 2026 06:26:07 -0800 (PST)
X-Received: by 2002:a05:620a:4511:b0:8c7:115a:d0e3 with SMTP id af79cd13be357-8cbc8df6f1bmr1596777285a.37.1772461566593;
        Mon, 02 Mar 2026 06:26:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e48asm3524873a12.29.2026.03.02.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:26:06 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_jingyw@quicinc.com, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
Date: Mon,  2 Mar 2026 15:26:03 +0100
Message-Id: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a59dff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ifPCz5NSfmjTQMQ1m90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMSBTYWx0ZWRfX8I9suz6MeT7s
 BeS9goeYvskYUqwJM7fjKxO/K/I0pq6RMwU88iFOykEerW9dQpc4PAkspu36bDz+4aHCaBd0Ibd
 nkq5gxclB62mqvqxAV6q9eJFh5+U3eGIfI/kWdx0bylADq7lQvlWZvgKnB4kcJy2J6FTv1zSgGa
 Le36unf+u/6fCvoROb7MlfRKB3E29z9vRWG/9fxUQurw/QxyikMQqzlCSWApKHP02x5BGJCDP9h
 SZqsK4njhl+YWg7P8WWslBnAallhHtgeogQpDOMtAiKa0nikAjMFv5lsHkuOeo5Olxwe9oiDB5c
 W3gNedgIw1XhudrFcLlm6Mf5HT/RhzorohMovht5sfNswEIKXspVfwqCNH0thh8yB4srRhTEIeh
 BwiywrmnZYcLw2YYVLGTMpES3UbKm8Lsue6DGBQ4BdxrfnRjbQi51Vqgf64xCUu8sbzq968byIl
 GRLnExNpU494vY9lGmA==
X-Proofpoint-GUID: MqE2v9mTVtu_xVykMeZ5KcN4f3snMXq8
X-Proofpoint-ORIG-GUID: MqE2v9mTVtu_xVykMeZ5KcN4f3snMXq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020121
X-Rspamd-Queue-Id: 1E78E1DADFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

We observe spurious "Synchronous External Abort" exceptions
(ESR=0x96000010) and kernel crashes on Monaco-based platforms.
These faults are caused by the kernel inadvertently accessing
hypervisor-owned memory that is not properly marked as reserved.

From boot log, The Qualcomm hypervisor reports the memory range
at 0x91a80000 of size 0x80000 (512 KiB) as hypervisor-owned:
qhee_hyp_assign_remove_memory: 0x91a80000/0x80000 -> ret 0

However, the EFI memory map provided by firmware only reserves the
subrange 0x91a40000–0x91a87fff (288 KiB). The remaining portion
(0x91a88000–0x91afffff) is incorrectly reported as conventional
memory (from efi debug):
efi:   0x000091a40000-0x000091a87fff [Reserved...]
efi:   0x000091a88000-0x0000938fffff [Conventional...]

As a result, the allocator may hand out PFNs inside the hypervisor
owned region, causing fatal aborts when the kernel accesses those
addresses.

Add a reserved-memory carveout for the Gunyah hypervisor metadata
at 0x91a80000 (512 KiB) and mark it as no-map so Linux does not
map or allocate from this area.

For the record:
Hyp version: gunyah-e78adb36e debug (2025-11-17 05:38:05 UTC)
UEFI Ver: 6.0.260122.BOOT.MXF.1.0.c1-00449-KODIAKLA-1

Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 337e5ee0e520..1daa4ad215ba 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -772,6 +772,11 @@ smem_mem: smem@90900000 {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
+		gunyah_md_mem: gunyah-md-region@91a80000 {
+			reg = <0x0 0x91a80000 0x0 0x80000>;
+			no-map;
+		};
+
 		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
 			reg = <0x0 0x93b00000 0x0 0xf00000>;
 			no-map;
-- 
2.34.1


