Return-Path: <linux-arm-msm+bounces-111125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zbPQIWcNIWq6+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83163CFAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O5rX6+eQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HQRHBa27;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22E2E3049735
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704213C1F47;
	Thu,  4 Jun 2026 05:27:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676C3C0A04
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550838; cv=none; b=M33i+yyr3jMpXFyeL8zvY63kOHBQMWTv0pm3L4LCS5Xsas0dKzW4LqxRfQAn8980TwQNFyVmhewUKumwLfp/O5fTgh/sSwX/fBlQrOk/mtU6OHUbm4oBp4W4m4cdysTy5Ss2o0phwTG8FdaysLXxZhfmJ9mz5xPVa/R6cCSvX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550838; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZNEWl5ihebnAvWGDSL4oz2eYokjFdrfls5qK6dT38s09LOIX/sMIRwCZlhMJzlv0NUfaP1DzVN0xWDj/hHWwIio7WvA7s5fHghlaJwRw6+23xsolkW+IXa/MtL9AJr7bm4NS7LVNiE04kcmleS8HfVj9WHFA5qIxIMM+2bDl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5rX6+eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQRHBa27; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o0nf313689
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=O5rX6+eQEVwIo6g6
	2l39rAuAiC4AGMSMLMnKQiien5YGJ8WOaXpi9shsijiHQm4CRITGTu9xXMYjlW4V
	wH4/qnAIgv4OXqkKdAND7dCYm5xpujpa8LuA3SgYcxHLhmKVpbDfEUuScsC2btpA
	5m95RekHKn3keX6hwRu0+sxprqwNBOLEEQMAG0usOSjZoL+t3lO5EAAEuqWlvL+w
	i2G0HZuna4GyPaReLQBZudWfI2HCwsU//VpBC7VWsUGeDpIqwXjf3zeP6VbP4u0B
	za3s6fR4uziLFsZ1MCu83Q7oLd4IOFRi5vfiKaFReriRPWnNJeh5fKlFDhZy5UbB
	Qh+kRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0suw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so279431a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550835; x=1781155635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=HQRHBa27CcIwjZsbpdC+X0RLCJ/Obq+1n1agEZzi6IEDRDZm8tSvruMoeQKkeadz6o
         suU7Vsxhxy38jamKpnoPj+TtlQwKiJTGrT0rlQCMdoGfjxgC33gq5B3nM5B8BRsj2vjl
         MqT9/3s0zIigRreB6j2hfu63e290ndxiKNcGEs1VLeA9RetAi1w6JV4UI/gYgywa29IM
         SpCpXz/bDmeqAW+wB8KoWjv8LKzbDGk+CXFBKEcyGyVr+WWsiUZgiKJJ1RU6bu2QUwPs
         x/NXQtvgFDj9n4lKEm2+LMiAGR5KvFO4PIyexj1d8QtKH8FLp14GN6NqmuYdmMYf6lsZ
         syUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550835; x=1781155635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=S/ofPjexVCVoxWM5CjrhV0fKd+ja1V4HUbf1bOBQPCA5X1/Cg8obEIiHqAQsEzGGHP
         j/P3QO8acD04yCH/jgSzpi8ajq2mN2O4Vzpc9R70rFPI7N8dPwY4Gsd/h4PHGgPvSXRR
         JAwis2LR7uuUX0dEZa2QUDYeNVkFuvyRLKuOBJJGfqa8silaDlA6Pf2fAnv3GN5sCC/u
         0VXhgCYB8q1F6PPMZW0v3ZzAY4eC0J8XhznVXnnJKasOSKi++qzJZyBZXFHqG8Q8p16l
         9ivdIk7JR8/4VAILHiqBnYuvzBlHEsakvbTRRfKeJ8dsxYFT3+APGj2j8B8ImBIye2li
         EjNw==
X-Forwarded-Encrypted: i=1; AFNElJ92uiOosvt8NG4RpOf0HFMHBHqzPHcwywhosT9wY5cyoQMiTzi81Os+I8hXPgTm/bz109h1Jb8NfK2Iu8Y5@vger.kernel.org
X-Gm-Message-State: AOJu0YwuXDOXG8y5SoFjH9GYpwrxjObinUMWLnyng4ZBp2ol0v0qs3+x
	P+0cmOitJ8BWLM9DKstU1BWsW3+93iCU1UenRj67CwDod5qC0/WnsT8VtrJbTIJ0oRTVZF0xwMH
	Uspe9SZ4sL1BteUPATiNoMGCXETsGJt4V0H93YSHnJSYBWhcOoB7HmkTghQCXg3EgxGVx
X-Gm-Gg: Acq92OGva4jCionG6AVFtujcB/AlwNOARoH5RdUNFsWxElYcoTJ8IbRzGssUYblbx2W
	yDWO2vUGV7u1g+JDkm1H0OQvWN3z1c3FnUScPDU3sikqZnytrrErlKkv+XfZgalde8fn4fPYrJE
	ZhpnZ3LjU950knOqWr8umYXKEjvKUSFxhz0fcLBm4fqGmsMQM3G4OlTNO1Ge1x4db+4ijMKhp8m
	DxNmWGemEfo3VPKltft8bOFudIwReiuE5dY1fmh8ohnygSdDc0GNaIzl1A8Ga3NyyhwhgvoHDrv
	dgwP/aXgS4gloqOVPOkq8klU4g8ZXI0qrGHQl9iEZrjxqwlDN+OpHRoS1F8DHFg5WLT9hz5qMfJ
	u7jRNEsvYH53iOvF3ImF+Z+a/1SLw4yMeTLRBWSGlWc4AavkFtOi8ko5V9D72/T4=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387405b3a.33.1780550835141;
        Wed, 03 Jun 2026 22:27:15 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr6387379b3a.33.1780550834671;
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:15 +0530
Subject: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX/gDZGBtpagi+
 a97voqHhFRPIcsJVP92yBuW2MI1jBOSjookj/3+lHk1HfWFwwvZYvqtnljpLIoGSABePRdAqesR
 /vqAS34XWunZcdUgXXkyWSEbNIJ2rRcIn4CCNJFyjHoK3BCDRxl26CIkegn56rFA5v/7KjXMJH1
 TMnDjJ6LxCU1wOUtvnh3W0IE85+gY7VIcC1cf9LakUAeNU9Lgh2gMCE5JoIG31OwViTrPQQKbDx
 4oPfryHcegxfTadQIR78QFmFbW5Y+KjRUjUyeYC8+ydj8/+F/HsH+tHMEbPUg/RUlKdA64CLC77
 AH5caWR5ZtTbLI61zvNJBszEp0vXBd3J/ENRB6kU9Rwp17v/79WkCKUToLK4ei+B2y7Cq+9T3hi
 aoLH7gLNihdlzfjfaDI9pvp6fdqJqZ7Ayofuw/bA7H7y4/2npESNe+UWIj8WcDvaZ8z9tQsCrOS
 FHqrOnsKPGwsY/sIZ8Q==
X-Proofpoint-ORIG-GUID: _Ol0CTel2cPtv0w0fGw5jx-fprBlKf8S
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210cb4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _Ol0CTel2cPtv0w0fGw5jx-fprBlKf8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111125-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C83163CFAD

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 1c8ed12f6bf8154596d031347540ef621314edc6..2150b94ad0ce5146c47ae21fae4deccdaba20673 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


