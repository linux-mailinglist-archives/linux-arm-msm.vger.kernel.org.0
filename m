Return-Path: <linux-arm-msm+bounces-107792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z+dNHPr5BmoKqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:48:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75B54DA95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A968F3001FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DFE466B58;
	Fri, 15 May 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSFDzNx2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uxy6c68U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A24611CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841996; cv=none; b=BbAsn6HNls/Vl/d7OtM2va1InUaxgOJdGRtq3p7lSMGvry5x0x4GKQ5bRGbPeSKLRutiB4I3TsllHtdsRXELtu+fQYGKzBu8TH74+JfKLUyBBBSLcIEh2CV7WGEKeaRCz71A5gXwWbuATP2Ugqj+zVlNk2bOIktPw85/BLQtFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841996; c=relaxed/simple;
	bh=RvUqiWlt1Ergu4NMH0uwjjsce6vuybjCzM+VDSmAESU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLNtPuMLdwGle9QSq+FIUOL6Sm6ahK3alz6FBXj1vQyXJbcwD96RTfGk5xZ3IKd0UkiiUAAFHWL0fI9vCylOQCN/ppXTGqhbUWlRUoB0A+KsfvX47ZXZkmITIr3I5pf2kxDb+zYXOqjcmat+DJO6SowpKA1SZ+mn/s+wRKvnU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSFDzNx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxy6c68U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F58U8T2676263
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=; b=XSFDzNx2EAt9otdF
	jLH2IsOwbxjwAn29icuutrWK5wmKo5Zuap0yz+fyNqXRdFMiOKpnIdG/LAGKiSAF
	EcUr/+h+xcXrQUG+XwAzWTUzNJq3qlpws2rEgyZO4JUs2le9TcSvAtKLneGhQevW
	MTyrIZqIWlag3rNoLDRrBEszxvq21SSUX+juwvdk53nwb+pLIZQYL0vYcQ8Y1Of8
	dtfqrS6VCJQe8x5ueL61Anr6nszWz3zYmMY5qdNDK1gSkr3boot52NnVSmCHg9v2
	ZT7o9met/8uIC8qsrBU/rZLC5ihSesScA6mL/WEpoRlFpaq5e1vBPxCGu63sMJgT
	o5NwBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtwnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso18263093a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841994; x=1779446794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=Uxy6c68UIzQgsl88ZrdPerSxxavLm80/YTDc6X2v+qJchROY7Bf0ndE9uJGo2+rVpU
         avYAliqugeuobEOm7gjukYMmrvFb1EQLaFhhAlC/zQuuwOjaTEAsOK2AM8S8QT0v8D9Z
         nqD3Zd3Agk42iFShVWyA97m6v9zpwZ6ec9hCxNyyOnF9dgJHjni3yJTrK2mQbkj5VxAa
         TMKgw0Ad5fBlQxGQHe/tna920o9oQfUwNKgh3YjodTb3PBbytD22F/fEIWSuW6tm1qEf
         yaGTF6EMAH5ZPKgvjgHTkm+27TDMYxwApICSuRtxgiXLRiKeHcemCiT/otD1GvhgtCp/
         HMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841994; x=1779446794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=B4apzok3dKmKEkc67jcqWIy4T2/InbKO8tyS64Hvpno5m9o/9cOhsHKn0offGgW3G0
         G2ZAep5FxiQqmhC9fCugmx8vBkP/7f50yZLGLXZYs4e3AEw+WedQqY8gexFrR3i3a3o1
         wyyJpANxSqW1Cqsff9dHwonztCxod0dQDjPsOSbqw69yXckgsRQDLd6wKVsqXZQS8YeQ
         vLrF2QKYp2SDHmZG/tovvfY+9YMuviPM1xy81bInnTF/uspZkw9Z5YhWRuAgGozCKgAT
         MNX87BDfMet4zFAL9aRWVQ/ZE5vqeDKktz/Raw6qsK6POfqaCrH6hB/lDX/HriK5o8m7
         SjVQ==
X-Gm-Message-State: AOJu0YwRrOFHbLkD6b6y38+uCLkSOZv8A0JiSrAyR3SP9V7wBqhyJKQj
	Sx8qdJj47Zc8H2vSkiGd01IikCRGtM25Rz4qjSijJMOXXDzXe3flT9K4nXstO6vmm4cQRhkxeXW
	sofUkXV+0rzIe22W0cfz0BnQ2m5GCEaJC6rjdKAXLes9h3cafmUY40TwhtajpYJsR7h1U
X-Gm-Gg: Acq92OFUJXRZKKm5kZQDC2UizMcgpKUrubLthoR5IvqzEN43dQpVcfEWFtFKBKfTSNL
	kWvW+8nFJzNm6hZOCZ/2K8Ijm7W7O869kJDF8xF4IFIvmyT8E143xF5WtM86hLjb6BcvMk6qHKr
	g9S6CWCWt0S5Iea1DZDfiI0PwXXabaeeV6oqFv4c4IFvxUfDO1NqpXnDr74UJ4y2NeduHrkKMsN
	R2sXuzwl0RtF2rWdw9AHKJIr8lv71y8wUNToG2hJZSkcvnw6wRKATTc+0DO+Y8SlA/i34cZYJoN
	PKjEGpo/xAtGpI1WyNPKjoYVTkRUu8WrnhKIW9iHOwU51vEatrj+xHmszPurf9+QFD3DXX/XpXj
	C84/KD3Tz2pZvJukiGfvjWloQeJGDphI/EjxPpMOG6cDJUYViKUtV9ls=
X-Received: by 2002:a17:90b:57cf:b0:367:cb53:7438 with SMTP id 98e67ed59e1d1-36951b75d0fmr3702495a91.15.1778841993934;
        Fri, 15 May 2026 03:46:33 -0700 (PDT)
X-Received: by 2002:a17:90b:57cf:b0:367:cb53:7438 with SMTP id 98e67ed59e1d1-36951b75d0fmr3702457a91.15.1778841993393;
        Fri, 15 May 2026 03:46:33 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:32 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:16:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v2-1-2724a54339db@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06f98a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=twW8G0p2hbz0t8568-wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX3xz0tV7EmaV9
 sYDLf8jjonEA4IAuPrzbxd+MYzoDKtA8O2j/TPpPwglG4VXTDEEctNVaHakiy47PaBx8Ox2AqWg
 FWNrP7UwXWuhkBAylRV+I5Alrt6CYl/l00wXSkk1DmQ1QldfbrksqD1pbaSF4GIsTXxUd3dasIL
 I2/56j4m69DV3lAKUXCenzGEe+HWIv1a6UOR/xPS54NUWg8dhZezakLbw4k3xu5eGiJyFg7WRXP
 FLlsMa72MJYJxvj+SphCypdHwrKhQpU5nypUs+8FXV5PqB7hJC7uHnHnd7sh/JGCJbjCeZOq1jf
 b9/naSTLC9ekIJbtCtglDMpH0Z+a/Ss4e+QJdqwvtNuVXMjwgpn3fsIr/X2lcgN7dlnyp1B87iE
 b+B49IuO2DtY7N4tLwkJotM9/dptcfZKw6KW6R1rf0Wm4531cWPiGUsj/WzNuTkIzD4cHaKRoE8
 WgDw0pPxVtvu5u0fALA==
X-Proofpoint-ORIG-GUID: vaGQwMIMC310IX2H28eEqaMnRbsaruUY
X-Proofpoint-GUID: vaGQwMIMC310IX2H28eEqaMnRbsaruUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 5C75B54DA95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107792-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Inline Crypto Engine (ICE) on the Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c0b083da78bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1


