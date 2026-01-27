Return-Path: <linux-arm-msm+bounces-90673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MscDdV4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E934C9120C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1F2D303E753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEBB2D5C83;
	Tue, 27 Jan 2026 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izWPlrT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etoaIHfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C92BEFFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502865; cv=none; b=psKq0uNZkkBNzPU9g9VYXBogNEK5SuJnQ1pGRO4oWzXt2oWm8smjmoVZJ8ZJHo4ZZJ9lQbWN26VEYk2BkQme0Bv+NAhneIju27XJ37Sk4jihQ+LgB4aO7HGLdT+tjqbehFSUpHcxUh4Tb/Z0lway+xVvLk5Is3PorovHsnbcNuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502865; c=relaxed/simple;
	bh=r2hHl0BjCYK85CXM9jjubu6UCLnsCKW6S6Wpdp0/dwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVQ9meMIeemDw9yFeazLJsITiEYvFYB0oVhJ0QS6Xsks6N581BpsSTDggZttGX3yn68VjyldQNnLmROooElQX3GTQbHVFg23pygJHCP+2hcm4YyXbxYnywRjTJTGwqpAGkFMUDEYd3RVwGuXmc3aWbQjR6NZo1QymFBrQUGja4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izWPlrT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etoaIHfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U1KC786605
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZF0UqSDEDidBomRoEe0j4fTp1VN0V99nqY+NyPVNW/Q=; b=izWPlrT1Zvw4WysL
	dIPFAEFob+AZAktTnf8byqX2HjXjB4QeCIdOJrhFsJEIHg0sU8iELZ9c8YOtNiP6
	jPp1RilSFMC4V+xBlprSaaV+2r9N1SuGtlPhhPkD9hVOn4hj7I00l+O+pSWCATHm
	eIZg0gpSOUgG99hvYMMQk7SUkxscOE4zRG6teGEKnz0AcNNUV2yURwSy5jWf47hJ
	VQdt/f/M0bp/jGlqkMZ7ZmujHkwiZmq86XgN6KJzUO7/gdaS3jGIWhdLG/OvR85h
	lG94avpVeLZ01SgbR8tBgPWP6Z3mtM2ZUA/FshpI5kzPZV0HNq0SkT0X3zM9vINF
	JMbdNg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93htkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12338d13f2cso6367516c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502861; x=1770107661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF0UqSDEDidBomRoEe0j4fTp1VN0V99nqY+NyPVNW/Q=;
        b=etoaIHfecA2MR1Nljb1NwVjArn/3SEZha6ZxYj8nVF9PwoIar8Cpp3HIbfcqmGQ/W5
         6zzPWEUZl3kxBC1+g2lzezPqjDHI6CopYMZl9yxEAFQexyWMl2TxP3yNvPuZyXg5vaz8
         QvHzMzChVjHeCUa6/s4TlZhUKH4QD/Fro4Hfr2FfGpBz1uAiZXT8XYcwqE0oId1wjVm1
         L59G86TxXWe+1Yor1sI4/vbqYGUBnNyDOFwIruhmF8n1wLGWXx//5pWGQ79gTmJK2Tg1
         yJQrEttxM14hklItDwn7YSFlGVp+qVj/QeSkpiYGrmSg37Yw3nB4sOBZnoHK16rfq2sT
         /bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502861; x=1770107661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZF0UqSDEDidBomRoEe0j4fTp1VN0V99nqY+NyPVNW/Q=;
        b=g9vdLyyEwnNbAc9/C1/3XyOqaU+tMKYBrptqZu9oKUldUNaF87VN7MVz7NDle8z4yN
         NzJbrLVUuMgCiLhT0LZhLdkLfQjEmlGVkSP8HDjbsLMNhbjPkIkCLWXwHZxbEmWMdoTL
         VCJuni/RYQmrDZTkG27zEpOBt9qKDSSXqfqY5LiyCxHoByRnfrTZFkErZ0KUjpCNCUNm
         OxkrH/DV3CUcMjCbMqZH8PqG3s4GC96D4PRjDXr9Zroctdti5jR1I1Bo67RR1Gehfrs0
         ntmxwcERbiMLRovDmyts5wrm87lEuf6FEL09tVhF7F/lU3JJaPppkv9pdBkrRq9xFwm8
         GfJw==
X-Forwarded-Encrypted: i=1; AJvYcCUiBl/VRoVr0QyE2V/wbg6XUH2BoW6WZIR0whXvCJrFECEtjkRX3mgWf2A8VtGqZzaM2QwGDcRyHL7sU8q/@vger.kernel.org
X-Gm-Message-State: AOJu0YwPsFF3aUpur7FUhrX6V+8FpjWVs2AzwEv7Oas7uCIvDcD8r2G/
	8MGul4sER5mFsxvdjEo4l+qYN4N6EOusRvsRUSCn8EAErYYPqWO34BEsZrzOhXu7Ig3L6/+vxXm
	MyQ1yu18xpBSdH6ScluDP3v1FXZUOBAl1XMaEZxhXuFscSXR/9e5P9FWbKUSrrNUVKqB9
X-Gm-Gg: AZuq6aJO+4aOp9i1pzlaLgdZwMm6ko14fz09+u8mo99apC4GL5ebAIW1EKCxlvWIE+f
	dU4bqPI+OwiqLwBV5aR657FrzpWXSyZJlCGF6f22lDrxyT3YWP9aAjlBCIGYHo/QnLy5AX5x8cp
	hFAix2f5GIO8sioHowbta/Kuz81bcBYD4oShpSxBx5zuyf4Pe0i8E1PyZ93n54DS3UAhAzRjhp6
	2BYkXTZoshdBEIkbIT7k5e0qcn+/zmn3Z7a6Pw2b4tyla4rB7tHDaH3N3Ac+5sBFPOzf9QE22z1
	YDqlRc9SRQ8V5BZOpJyPZRRX7PEJ5FH8E2e6dyYTUyOCJ0NHRY5EOiYF1ETd5d9gZIy5tuPKBOo
	9PjMU85E5jIA2fnJ08owRMwmA3IR7C+9v0fK/R8m2MjWScNn2uiwAE9xuG0ke
X-Received: by 2002:a05:7022:1a83:b0:121:9f05:7d6e with SMTP id a92af1059eb24-124a00e8aaamr553886c88.43.1769502860580;
        Tue, 27 Jan 2026 00:34:20 -0800 (PST)
X-Received: by 2002:a05:7022:1a83:b0:121:9f05:7d6e with SMTP id a92af1059eb24-124a00e8aaamr553874c88.43.1769502860031;
        Tue, 27 Jan 2026 00:34:20 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:07 -0800
Subject: [PATCH v4 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-10-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=994;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=W2s1aaxDJAQbl+dVc+eFxjzAccn2ya5EYJntZUPLJOA=;
 b=1k/9iyJV/Cp3UUZYpUjYUTn0x+mtarnbIiIOrRYJMwAh6osCfeJakm1OIM4KdCSLtXQHH4BOn
 EuU9nkZWGf5DBe7cYtmMNMkA+g8J/hyhFzXZfCB2S07r/FCxEQQzgyZ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfX7DGMAk1O6v08
 IX2OcAyS9YozQ9NmikD7Gwv+mVIv+prs5oE4yx9rblDYVNysluX8cgNjPNiIt8DwNiB5qegwu3t
 uoSijCDwExVpwzRnda28eh2/GitElWRAhKHcPxrS325ihap8jYqOTg3QWcxz3vKto1Auqz7i39M
 Igdclp5ZmSo4m8vyeo3lDiya5vk2WQ2t3JeyLPopMX5y9nXGux6SOQ0+cWyMzCzXu3IdASkVe6r
 pPrDl6lxbwXTszOCMHsQUJiV0DFL/2rHdEKBVWrYTrycOoaqaPszDW92hBP3FBm/qkYmJDlrxOL
 00d5piOztwknXwtyiU9KgWR6+xDZzqHafG1naZWRcGzZlkqQkJvEvWqIeXLP4nenBIxEXnj+2j8
 TU/X11Ak0mGWP+kkk0NUfh7+ea6WZ0YnEOD2GPtLAypfHCc1JgE3x5GMH+JVqOinR0YZmekJOS3
 NW8RDjKLT3DN2DCT5gQ==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978788d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hvWDQT85v1CTPbyC7zMA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: HIJGSiq4jPQqfLrKY2Y_iDTWKd6XQA3B
X-Proofpoint-GUID: HIJGSiq4jPQqfLrKY2Y_iDTWKd6XQA3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90673-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E934C9120C
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Enable the Kaanapali display, video, camera and gpu clock controller
for their respective functionalities on the Qualcomm Kaanapali QRD and
MTP boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
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


