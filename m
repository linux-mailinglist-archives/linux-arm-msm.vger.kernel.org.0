Return-Path: <linux-arm-msm+bounces-91484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K2fD0+DgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:58:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7BCB568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BC03301BA60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5A035CBD0;
	Mon,  2 Feb 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl58j5km";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUPp55+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5235CBD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029828; cv=none; b=nwm/ACFOC8wOwKmAIxA4q+8i7LZO/laXWwL8VFFpGXxlRHqie1fOmSzzsFjqXV8fkNUEWuEGXYNANYRDymqYlKnpsFtvIpH/CVW5s8rwjMFE9A/YD5WzXyv4sLvz8wqjTSejHo7g6kP58f8E8zd8Je+aKcVanQjQqZm1qxLLMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029828; c=relaxed/simple;
	bh=cHCPLXQpZgOGWiQ9cqlN02EhhMLJIwoEMGitXXLzg34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxlsfu6DMQVHKD0ZViWQRfXL1guaikjyLes4ELdmUbWm6dkTMZRJ2C9vo4JmjbyhqwbYuUZNO8v7dioxpSfKtsbRvz03AacWtkGJpVUzbJ60TXKZLMyDbAOkZSMpyXmBUR67OKX+kE1OzgNeitwy596MCzbslN71rs5HypNkHpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl58j5km; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUPp55+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285pef1865442
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=; b=Gl58j5kmWwhny2U6
	rebL4XEm3Q9wKWFJCfmT5eoh0KCbR5l5XVHjJb9X6CCR45iybMoNZnAm2aZO783I
	EWtAccV4rMfrSm0+ZLz77oG9vvJin2lucmQsiXbjStWVCAJoK2V0AD6jLTg4im9D
	Xdb01hj6aNkLNnzueeo5XZ8iyiI0cA9aQAA8ukZJJSikA3sWXlJfX3C/mSyqb2zZ
	Y0Mq2Zem08wmDSd1hUeGTW1BH6yCUQaIxp2hxQA0I5lk3/YIHx7x+lgg2qtv0bYo
	TYcJ2bCJsboJWzDMeTTtETbLT/2cuM51YoOmIEh9rFRm89JRhra8TnY2u6CEBrBH
	1oL+Bg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn5dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:57:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so57815065ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029824; x=1770634624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=;
        b=kUPp55+8xqyd7iEaBe1NYdlvNL0kEd5gOwp1ogTIYDVmphB1aBeTN9JXNO8s0E/hg/
         KytTfBWuSj2HiLFsnLxFPeuCFt/4FM/LiuiBuQETyQzGMBThxNq+6ETtOi1ZMsVdEwaC
         gjt9T2oEPcyCrJZFcWVfza1y+f6J2tVgO085TOufKAFBUSWB0K7Nu6syz/b5OqHGd3d/
         JsA3KMEUNvJzizzj7BbMYO3r7UhXzZBw12uRJ67Dw+cooxG45FDIonrMcb/U6zAe9I3L
         VCBZxkEW7FoKISr9CboCMojB5YWZNVJB1jWpOKbXd5GQRURwQJKNbEgrMEEEdil2MO9x
         pQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029824; x=1770634624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=;
        b=EfXCOw+MMKYTfc7gXUMCNXqhZ/EX19A3PdwDMlBahl07mQOAbKX0oL8VzeBDCjwMKI
         T8DiTbhR85XQXFS6shvxtyVUVyQtM1S5K07LqXAbihxB3QONxXuAuTyjpZDa4LCi5tqk
         Xz0qu+fxDaQzHR2XQbBQV+KlxHlxlR7PWsmzJUIivxwgofAp6WOzlkRQydXSsQ9DCMQR
         /zaZPmF95LQWdfJ4eV5Yf4fIx+kxPQaS0Yge7PLs29A/N0/W+1BeTo9uhjIQPpdqaDjs
         J2nfCaIZ8kcNyPfmeU0CkT7adqIGOYYZVY+ln+KXjDRXLlplDQrlKkumlNSZlJIrViAH
         Rjpw==
X-Forwarded-Encrypted: i=1; AJvYcCW3v/SJ6cHwHu34/Kpg+8hevQ1ET6vsC79tHyk7C/LxRnx3T9qCqCm2UQ233Tv53WfFNStJwnW2OcpN3ccn@vger.kernel.org
X-Gm-Message-State: AOJu0YxocwsxZARZ7Xpm0BsHgl6CNtEx68cEK0q9jZUVbNhM9PcOWw10
	YS0+ESVvbW1dkl0ySYxueE9TrDC5et6YEFpWTz3kOtoez2fy+FhIGwJb9Zni6dfHXDocCgHUxZa
	zRumYgj0njRxn/qpPuLSl+dDcSf+1XUmIZrsnSy791gCCptJlaZ/H9W6C8VLjWmvSRTYI0J9a6b
	sl
X-Gm-Gg: AZuq6aJf9dvDsqqaTl+XWz30CYPB7kjKPN4OI8bTWA+O4hNoGQ0k1U8X+BCQnnfq1Be
	4lOu87gX9Qp6EnanMhImLIIjv612gXXRz0CA5qZ6ddsjEKVD5AxuG9nPMz3M1lln7asxciI80dE
	r/3lzNY564KxU1MMEDw3jJQSiD318ZdvKLkxMExrzjW69g81KhL3tI3lrQv8lZ32K6aGoji/xqS
	oy/7pF0FP6EwzE7VWw20EOSyw6vVYgSVNL0VUWe2msuAATA90FZKmigZS5qGTquBcZJd/EGOe7F
	6N3dTEnBQDWfdC+szRRY4hdAqBbtf3ht/igEp+baI/0fVOtU7AR0lF72QTGKy7td0iuvsJGkdTm
	1/6Koztua5FR9xQl9HJsS9+rS/naDOcXJvQ==
X-Received: by 2002:a17:903:3b8f:b0:2a2:d4fb:2e4 with SMTP id d9443c01a7336-2a8d7eac07emr102189535ad.3.1770029824246;
        Mon, 02 Feb 2026 02:57:04 -0800 (PST)
X-Received: by 2002:a17:903:3b8f:b0:2a2:d4fb:2e4 with SMTP id d9443c01a7336-2a8d7eac07emr102189315ad.3.1770029823785;
        Mon, 02 Feb 2026 02:57:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:57:03 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:26:50 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add GCC video axi reset
 clock for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-glymur_videocc-v2-1-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: VtJr5jlRXXliSW8V06EnbuX4Sg2MwahM
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69808301 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h3uFTQrF-vKaECCUKRQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VtJr5jlRXXliSW8V06EnbuX4Sg2MwahM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX0cb8a6VWdSgz
 ikz/BD5SBEG5iBTrhhM2qPKBZKslOT8lMPk8b3ohh7chBiEkU0PTILmRbqfLbXcZ4vIbbsfglQr
 5ymrlhWRaW6dUummaX0hik3do2Riq/TC7H7AWjZ2gITVuifJOoXzmRTHhjBITq5nPqr8Qs7mYcV
 52wt0zY5Z+SdsacA3QcUBcfR8LBjk/QiIvrhvTD48nqQtRU4q0q7P5xL7TrmRV5Z2tyv/62AMPF
 Vp5wn508BUskFy/CjwLKCn2eld1LRg/h1K2yCKTbwucbajvHh0tfUjs7i2JvkthqFLMeaaCErpm
 CAkMBxX/b0ZpEZlm584UT09GwsHdINptWAiNpevfvccLYZpic+q3iEQBwdVWt6+jkJISdtu4D99
 vIBAmXXAEhZLcBMMQIxl8ghqZXO1Cx675H+dA9ql9CGZfYO/oWlzPXRLJJ7FO1D4AoyaM1FVC1A
 kM+CqPSyGoUAUUqP3oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91484-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACD7BCB568
X-Rspamd-Action: no action

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
--- a/include/dt-bindings/clock/qcom,glymur-gcc.h
+++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
@@ -574,5 +574,6 @@
 #define GCC_VIDEO_AXI0_CLK_ARES					89
 #define GCC_VIDEO_AXI1_CLK_ARES					90
 #define GCC_VIDEO_BCR						91
+#define GCC_VIDEO_AXI0C_CLK_ARES				92
 
 #endif

-- 
2.34.1


