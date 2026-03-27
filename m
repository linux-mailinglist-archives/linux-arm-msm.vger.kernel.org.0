Return-Path: <linux-arm-msm+bounces-100266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKEYCFhbxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:26:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B774B34280C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08792300E299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AF63B4E9A;
	Fri, 27 Mar 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlIVioYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feLme7Eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2D3AE183
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607095; cv=none; b=YjAABr0ONg50D0K1MkeAGw1rT1L1LZYNKn6JZVW4MEOpv0tClZuZMU6P8+as6V8fsOZF0sqh7z45HzH9DaLZveIf8pMnWqDZOlHEXEhWQzVh4yGgE9JW4/iucpz0oxDWBBJydCfNk8kH4wsd9MglWX+suzabeqFAkZSnZnTu4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607095; c=relaxed/simple;
	bh=rTNyAXYa0G8sDfHiF7L6uMqPSCAR9cACumeRerK6XaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwJR6NDV76oMmavoK/TwYlv9AqxZ9EkztaU1wL0HK1cX4wEgxbisR6mtyOjyNg76IFzrL1WYUgbUZ25Xzheim6R4HR2Hfbfvn0XKqK39W/lmA2kch6DGQp1RlKV3JLZLYIQkFOTaKQOug2vANDdYd8AFWYrn6uR6dijPl+F7p2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlIVioYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feLme7Eh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6ww2b2846529
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=; b=hlIVioYA2KU/r4jY
	duRQh0anxT1ETUyvnMyblxFF5WLOK2JeO5NbQF8Z2kZJaFhGYWc3/Yoh0WaE9RrU
	T11oxtN1zF3t2DTFwni4oQFj7PRREJX+YVK8T8fWNkT750ZzVQLTftGjC/oSWhLl
	Wmt19fdWB+ShOfITWF0EKGClIgF7qWgbw9R79v2d/ATtn74kzk/KIWj83uOQ8avX
	XUzaz5K+VnS0qeNqWfFNq4ub8xbejMiOhhcXtd9W+Pce4dYjrfzRzZNlzDpUYAss
	stevOEqd7y0awZQiCmZMh07XuXuHOCayZ3B7AwAt+3/UTRWDzZXdbd8Um4H1hL1w
	wNq3YA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmm4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1534549eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607093; x=1775211893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=;
        b=feLme7Eh38v51ed2oFCx5s20FwHiowp8GGGFkqW8gBOiwZ+zlP5EXUtIPWizRefWyZ
         e9zESDnFAC+QeBih2k0Qg/aQArmPDV+qLLJhtZERoIpGc33YBP6o+qr/BhlTggfFNY4h
         HDL4SEEuurRBWmMJGStHCkb6JXMZv0X5Z6+ZKK7vL/M+G2v7qLS2InqBHvtd0IiXxWil
         l2wrUECfqPrZhPgpRwv36nNBORTO1X3bb1RJ15loteHkKZch0wX1YygfKfDN32PiGXMy
         vkxQmG5vjmz0D09Ffjhyotj3f8fTolwyRfYtnH0O+gz9aPw2XrJLCJlNcktP168jF4Pb
         Ypwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607093; x=1775211893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PwovfDpYGUGxOG1PmiqhuvreEQneBruhR+pIsBwwcGE=;
        b=dyTbvHkv1zQ/PJtCMc+eckIZ2JVC1FTPmTD1oAxbFcMpIYRIMI2wpvGXHiSvNXpIVr
         QdqFNfjEDAmOiguX73PlocJXn0tOVCOF1HETl0YiSBZvNh7Ifn/HNCB8i+Fa2NPJn4U7
         wpreflTQH0dcZyhdSg5ENW0ATi+TgEu9BPXqVDrY6xHrHeLm1+4qS8XwcxfUwqpcoqaD
         t/WJ/QiwlPHUnm1BAnDk0oi7xb9PcTZ4XNh+JaRREShtAAwGR/uUcqlRuEBy7RYcymXg
         0d+8tbU93Dda5Jd3lcfHx0SbTT84SCwoVkenjKGCgf6AgW5UcNAi1kn62GNe7m1LH8+S
         jOLw==
X-Forwarded-Encrypted: i=1; AJvYcCWAH09HjohzGQnOyZ+x/eZL3lXzllgxuUqLtFQK9P0uY/7PFqLz8f3nhX2UGtqFkg6ifwIksurqtz1mQAV5@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPuz+kZ8PmGCkOPsqseL7wpforPB6KXCV1nLerSWDaGPz/N4p
	VtSeL5p5lYMzHTMy2aqnkHYLIBkV6He9EJe5OVuV4DJECoAtNGvNdkq0rPZ4PydA4gMSvZ4DYRi
	IigJu6RF/NBm0ObcgcXq8Gh/qBpk1tvSOUW1R86H/5XzzAD/jPUSO4PynllTo0zdMm8r+19TLJm
	6w
X-Gm-Gg: ATEYQzwzwbs3RL5S6iN96dQ9rDIineX/EalYvf9raXj3zOhdpQWIxATl+YJixphlMUp
	r/OkqtM2n8/1JdUkO23YmDefOsxZBLlHIPtj2/Vr56H8utz8y6eLD3dN0b41cdxF0+MKuo/RdYd
	JDVvQFC9Ad4YxX792eT3LFVzaINXGRI0dYCf0h7CG15uarqn6xvxTSfaAC1UswqCpyP00yZbBv+
	DKhW8DomqeeZ0mCoDy4rOKj73Thlfa2M4AsEv88Jx6ute9cWycOIwZA9ZKFsEMXP9Hs/4/RWb7a
	CjCUM5msZNuwYjN1fggxG1M95JQ7IHjMhI+yFFhq1nSjjBMlyvx9D8juEMxAfmCtmXu+6+GGIDx
	GLaf+W9F3Xsx2qn3evrYUfhuW5t908C3w2aKuptAacoM6z/NYRDP8yZnE1bC0ISvJQeAqoFs=
X-Received: by 2002:a05:7301:2f8b:b0:2c1:5a78:ef24 with SMTP id 5a478bee46e88-2c185e128fcmr905271eec.17.1774607092658;
        Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8b:b0:2c1:5a78:ef24 with SMTP id 5a478bee46e88-2c185e128fcmr905256eec.17.1774607092175;
        Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 03:24:36 -0700
Subject: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=1053;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=rTNyAXYa0G8sDfHiF7L6uMqPSCAR9cACumeRerK6XaE=;
 b=1GAlhHhKOlwTpbcvE/k11Iy1n37btCxxJoVoegesZgANcRKKg9f+jmYNAHay6WxBx9/2jM9RT
 V6iBryz30lUAR8mjs1tcWo9J6ZkOLLSY1/s7gcmhGmhjjz3WRAKSoC1
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX2C+cPJmGAxAu
 n8ttj0SAE8wLjP+diSOqyVdGUoDzgO17586rLYlCBVBuJ7yXKC5rtOvE2PpGPPVPNzm4loJjMcv
 y/sWUn/Z1vI7JdZBlB03dpXK0SPTzITeaFS/9qlJaymvLB7l0VcMmWgMWw6Jh3BTg+BnQiImm7d
 kugoIbRwptoGuv1sG03VZuhMLbWLWmwzI/d3GZQ1wWbxuCtFGfJxlJAKrvku1qg+BKFhGdly5lp
 BwLCusIUy4k0RTmajacethEB2e0oP09NUQqCHDHtJM70hYwSvRJ6TnNJjGj0ZeTY69dYn1dP4CG
 qxQgZ7ebBThjNnxcw7963RK9V8QrJtwZLgoPv9t0jIBx82i/qKOmgCTgau8/R053vIMneUwQIoe
 sp0MTvYFtcnbjai5uYlDc1LP4esxFU0miFMvStzV4v0VcO9xFjVd/PQdKkvcVCJhIQROJnNVznM
 kndwri49OKGhbKZg6iA==
X-Proofpoint-GUID: K9cwhxGiBSrLKOd27947I6kChdu2HQrB
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c65af5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-cAd5Rr3oDDor6eJ5jQA:9 a=9XvURe7g-aze0kr4:21
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: K9cwhxGiBSrLKOd27947I6kChdu2HQrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100266-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,94c:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.228.225.192:email,0.223.255.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B774B34280C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an IMEM on glymur which falls back to mmio-sram and define the
PIL relocation info region as its child, for post mortem tools to
locate the loaded remoteprocs.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4886e87ebd49..21ae05f0ee17 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6457,6 +6457,22 @@ rx-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,glymur-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x1000>;
+			ranges = <0 0 0x14680000 0x1000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",

-- 
2.43.0


