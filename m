Return-Path: <linux-arm-msm+bounces-83111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E6C81D2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 18:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281AD3AD651
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FA8318155;
	Mon, 24 Nov 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9Rn9uoo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I145VlTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40462315D51
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004154; cv=none; b=muzPzujBB3l5uH9Nse50Wdw3qP/HE0gJuBFJSGS/Li80b+axuhqAXHVQMOtcZptu/whJL5pzP+0GWz2RFTfG1cy86nR+0qELzf9cIBnq82QXaJ0byr7yxp/xOyh7Lm0yfwS6ABeeX4WsQi2SJL8XCBRFZ/z/eCplIf3eLOYlVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004154; c=relaxed/simple;
	bh=ofR3ihwtzlWlypMj/ZJqBpSefmnA44XUKBt8ZlrNmIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7+N40woXNQQFMTvnlyFbUd3pS2Xlz0bogAAbjQYfIcsv3CLJrTW008SDyvzqYArj8m37XPP9kOSkAyn2fDvSQiv2TGlZwN0jBAONPnOcCAyYFdSX+Lbc4W5ZTxCU6hEQtNnJQvqxH2wqIiiLsUSXqAZEs3Fx5FNLTmIZn9xexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9Rn9uoo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I145VlTq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOFuKEF776425
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXj0dS+IAKlzIFNGRz3FAzPlvCUIBa+JNmjbJBENYas=; b=P9Rn9uooJtoz27w8
	vtVjrcjkW2gAZDFHj1zzUwU+BccBU3iehAOgqmzLFC9rngZy/94ykk0DXygEBBU/
	4gSaNojDuv5E1cVBCUEVZ1t2Q3qlxXgIJPTZUPqayF0fzRSj4REW0X+2s0kvnSuf
	4u3By1Hr/NS13mpY5nhHPqa2hvMMis0V1ytbwUtrFPdNHeK7wVvXVJB8T5o4eK4/
	1JyVEMLBSbTVU7NiJuWZEaANRAKSumr7snaPaUB7vdl2HYKs1czDfekPnT86l7m4
	80iV8bWisrRFMifjo5E8djT23FFmwAgFAw9RFmcEzjoAjz2jE2F/jS6ctT2y6W/2
	ZxFc9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s8nw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e5a18652so50590405ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764004150; x=1764608950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXj0dS+IAKlzIFNGRz3FAzPlvCUIBa+JNmjbJBENYas=;
        b=I145VlTqoMf2c31TmOpOwI0vusjscoM500WMpw2rcjWaYF+d4qmbqDnSCCtn6txkGe
         nC2AGb86F6wgT+o68DvHX0Zv6kSKRhIGSacxqGUA6bZwf9s8hqJfMyJA111k6ifeB1xR
         9gnpt1R8IHlT3NtsRcVMvR6ActvMUnBi6VLgjKoGZz0jcs9BRQKm0yiFJqo/IB0pG3Dh
         EI6YMwyZD95NfudKo5kKjNQHHIt22sLLdClJRQKIfjiODC6Pw1IJrp8AW24VLpkjafLl
         Ha5eT2CB5MA7ChDY0g8s/C7+agbTB/sh03Fc3X3M99rnAWy/pNNuCtMiGeWRhbWGwq95
         uKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004150; x=1764608950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qXj0dS+IAKlzIFNGRz3FAzPlvCUIBa+JNmjbJBENYas=;
        b=J3JP3ZWglsAnAl7sor/c4+RNNiNey0sDKkpU88zEGwuBRWBC/avXVbJ5R/BBPvnMmf
         IhM3BVKExNIgaIa3446CzMJlcMLwump9ymoSxjmvVBTk0EKGmf2I195SrLyimx8kbeVi
         SvjDJM4Tyt51HO4qxTV+d5qQoAjMPUfSLd2D3UQADClPzQWfSCffLUoFhLZtja7/UGYK
         yoT3+FMjGdMurfic2FL/uDEBYibUo6okGZtBcM8YzTQoL75HDtvtIOPlqbPoA1jE3hkr
         lmF02Q5AIuiha0SC1YBi4kMzVWQKKKpzDHZVoIKlH1Oe/CVGxrpsiH+0vWvF72v9LEKE
         /8og==
X-Gm-Message-State: AOJu0Yygf5++yUxHnZe8ZlBNJObW0P9ZmYvXHKJkFamKLrWe14R4iV9r
	oW/1ZYxeeEU4ZsSAqWbbksO78uV/W19fMrlFIIagVyr3Rb8me7ezV2lrBN5h1OgEMANdVE0jsQ/
	ccV/SXxzjG/sudhTc1q6dK8aA6fA9nUruN7Kakl6ba33wx7M38HY8SpI1LdyeT0gaui/T
X-Gm-Gg: ASbGncsBQmDit6eG9XknQMUXNMjRcl2wRwwjbyv70BfFw0v/ghbqqhCVG1T/wdKowAO
	ag013h0AMLdBV8PbU1Yfsq2LuOFN1ZdP75EghhxJQ2xaP2G5Bk2EIpCeQTYWpkSmmZw8/La/j8k
	bKebFv6tRVdU5pKhCOf9gpX1lmX+9bAAEiNCaiGcSPLogLf36bmd88wxx/WBV+W8y1PMgI9z5Qc
	EC7OTqOcdPkhUeK4gdsNzVS8sb5GOAQHkuKbWMKKLhwvybSqh/sDqVBngg2McoC7ibCVliruiPX
	eLlzePGfKQ5qyvmFHwWR1u2SGHbvY1lJRdOFqzWGqbhSuNfakK6qcXaUzFBXvx7ExoIVXRKG8T3
	5n07IqR52LK4e1ojn12VeRHdYK9C1hNNR5Qk=
X-Received: by 2002:a17:903:2c9:b0:298:cb9:6ff2 with SMTP id d9443c01a7336-29b6c3e3f1bmr125395805ad.15.1764004150071;
        Mon, 24 Nov 2025 09:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbDD2EFejyNXx7KyZ8WflHqAuidxisctS9ZRCxozEEZI/rIjSILkiUYUK5QQsyPm/0Erq5oA==
X-Received: by 2002:a17:903:2c9:b0:298:cb9:6ff2 with SMTP id d9443c01a7336-29b6c3e3f1bmr125395295ad.15.1764004149544;
        Mon, 24 Nov 2025 09:09:09 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm143949275ad.14.2025.11.24.09.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:09:09 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 22:38:50 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-trng_dt_binding_x1e80100-v1-2-b4eafa0f1077@oss.qualcomm.com>
References: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
In-Reply-To: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764004137; l=818;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ofR3ihwtzlWlypMj/ZJqBpSefmnA44XUKBt8ZlrNmIM=;
 b=6aK7rN5rBS5D6rNIRL0jXwFbmQNqOp6NjeuNq5yPThMUPdqTY3WJm6VU9vtSi3xxPkEzOeaIv
 vV7qjufcr4JDHUHp3gbVsrD8ZBuSCl3CIujBBANC0M6yS9ktUIwZquL
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: vi7sa9zC8ngYWnEulyru9dcSXJPxJfkB
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69249137 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=75mWG-WH9mJFzEGoRSkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE1MCBTYWx0ZWRfXzKADF3IhSRlR
 wJBVPaAb/bRTGH7CG1jIlPLnhbm1HTl2JCYp/jxWdNlbqwW8l+8cHu3GBttH4jeyazxamkSwCh5
 qW5cNE/Tn8XHNOsQfZfXcz7kb2F9gLQ9HFmt9n0mbCkK4tW09sU8x4ZovRKie0UxHFyuZzJqgh3
 NgeDlPtgAv9mdjlzJY7CtKyjVblrvvvSrvqopoYf7BOFMCOwVgV3PmK5qlEtWvrpfUQ6BHAekOF
 PfDk9iQrGgLd3ozTV7kK5Hyqdg3K/tn8ehk5Ygccl+M2j9XqXpH/lZuK01jD4VPhzdT4wxfJxLX
 owsNqydL3ONsufbC1qegFVo1m5CMhH9y2z2L3tURmOgYJnrSNxTYL/QF6M/mbr2vk4y1cph7dn6
 t3PmYpH0ARZc1F24NtPSYWCN8xfWvg==
X-Proofpoint-GUID: vi7sa9zC8ngYWnEulyru9dcSXJPxJfkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240150

The x1e80100 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..c17c02c347be 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3033,6 +3033,11 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,x1e80100-trng", "qcom,trng";
+			reg = <0x0 0x10c3000 0x0 0x1000>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
 			reg = <0 0x01500000 0 0x14400>;

-- 
2.25.1


