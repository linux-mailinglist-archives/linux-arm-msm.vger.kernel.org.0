Return-Path: <linux-arm-msm+bounces-112224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vlxVABQ2KGr2AAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:49:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF2661FB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:49:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZP4a3aaZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="T4er/Yzb";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112224-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112224-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25AB831E6CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBF848B38B;
	Tue,  9 Jun 2026 15:32:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692AF48AE2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019172; cv=none; b=tXUY1v33sgEFVbozBumgYpEyW8McB5vZHJuRv2JtzMXXaBrgLxr37ctIJtsJOfROM0kzwzVzJbqhh7gr9VlJkV3TmRN1GYkU2tZ+Evvwpk9vXB081zJNc87GTh5SdVsCFo+3t7qkNkoJk1y6aMZURC0zKssYHXB0/KsrNjZ9Xoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019172; c=relaxed/simple;
	bh=oNTHsB5TowCBlNgjoyzytUoDnZl8C5a4JxuYWtTP+9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctHIhF91yUylN/L6W0UUlSvjwy+XODx99BMuNnEJAFj5vhgiil4zDjzj2rzT/Wz6D/8RvpviOVBo8IZ4hqPOq+RAq97Nh2s8Opj8Wt//jbJhqwJqgqMsYMSACxCne4/GllfaDMvTEkip/gaqYnSzitmZmMDFmSSaUotQZWASumc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZP4a3aaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4er/Yzb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVis2706177
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=; b=ZP4a3aaZoVJifauH
	g7JuQJpNNzq4qUKHKWc01J8Z6gy0S5FvuVTsLwndxGjdShGgv/anqu2hFSDEZU5T
	8RWtfm+QXwh1AE+6aIxKUaJTWHH0eLGT0CMbG2IG0pvsGwN7ALt/i+3hsExTHcVZ
	DsmSHopth2pja5qm2ykYAs4VQZurUAgT63gK0wV9eFX7VJqfKQPXILtvKRb0jDJJ
	L08dL70zQE05rECJew1vnSMOn0UDnpNz4h7QVz14TcTO8751ElSoM59I1cP2ANjC
	Zbbq5gVgopOqYOq5nz3XqPdhnK9Ck2VM/HYRQ87lF9g3mN6hxkh+kk3s8I2nSIbm
	T5E6KA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt205m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30762d67a64so51706eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019169; x=1781623969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=;
        b=T4er/YzblHQThmUkYOZWvzNzFh2sTfdT9TS55KLrj5ISR2C2wEgvbK9kg2jwCcUrH/
         3Hn2jsmL94UKDYjScLhwhtEMny86LBYVOwkDWz7ZbtefxxWTIoDDNU+rMM06ZZCMlos5
         WXr+xk8cHGfIL+Js+gF8Q87KcZoN5018OcVuk/TIwziVi/0ZL9HUL9ORLcvoQQwKbvv0
         r0kGH+gl5gbY7L8HACgYq3yMRMljnfh3Eeis5/6EbM0NKkdVP24YwKCdnmAzix68fwgI
         TXeELFyxuk0aBodp4E67EAIZgv1EnzKmK64rYa7FFf3S3+Oug4p9BSU2mDRAG+dVFVPP
         cghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019169; x=1781623969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=;
        b=VHr/maDNXqb839fhDuu7TKSv1weSQLQCYfIt+oZQcszVCbMd21/bIzaGIEpBdl555X
         RJUSl2wLLvUFuL67tCx4q9yMCANscNq5q58gzf4e81ehEMtnHZG5iWgVbVohs86xKQMK
         FXcjuV1i6mnZZMatQ4eEqPfAf8ENTFItLe8Zt2VrGRj0HTO3zXdwNeNVOrncZ5gQs0Xc
         RupySluKCm19U46UL2F+UCeQyIj8fUcvpew4Gp9S5HEObVe3JY4CGuXKyUML4EnrC9fF
         ssLyMqHwkeJj1m246aGUMV4j/Rp5t8DQZU6TqQXgsNvgF8SIpaQia7Lq6sRwg1KOq+pD
         lr6w==
X-Gm-Message-State: AOJu0YwW2MTpTmEoW7y3S0mznuDxEIP4QJKB3657ngWPA68Ny5m4b8kW
	qVzr3mWjzx6byHFKSmNjdQLhuuAK0oPoXQA8boWHl8c2pC1JCznBX+o9QTbzCu6ADCfD4xERfAT
	urbPwsZFnChMtTKxSq0TaK+pwuwpCyb9daNA3Fl63aiiXD/CTqy3BmyvbeF/pkr77jJ6BJnvinz
	Vo
X-Gm-Gg: Acq92OGEKI3xWwfYe6uUPkkrpFohUEqOpqbXWESuMitlu35z3d6mU71vsNn3uMQUHi3
	3Mh+FOa92hCe9O/Khiy6Lw9jRCus77VnWiLYqaDPnDF6WZiet7qlKtllO35Bv6+ANH0xikHYLC+
	RnQ4CnQOaaUc2Gb/IsCwL1t9KkfzFtUsYW4HP3e3CAz69GjP0mxoPPSEMIVCVaiiVB/9SvNQKd/
	LgVE1P/L/3pqEhyZUa80jfosc1NGeJuXCdoSUG/DDXH+8q/+Xa+L/BxqHafUS0qvNGZd+sxOTEL
	wsmuPgtbm1Qa6+2pQtXtcf26lIJWSjjKbxahVHHxUk/cRgmfdCqOBadktR8M0qb5mt0yq8mx5FB
	q5GWmFDDCHQAN9OcONPEKS/MYuxkCgEWTNUMCOYxqTDvg++PNMsSqjnKT
X-Received: by 2002:a05:7301:d81a:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-307d4e7b305mr1892707eec.16.1781019169108;
        Tue, 09 Jun 2026 08:32:49 -0700 (PDT)
X-Received: by 2002:a05:7301:d81a:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-307d4e7b305mr1892665eec.16.1781019168356;
        Tue, 09 Jun 2026 08:32:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:35 +0200
Subject: [PATCH v2 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3513;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oNTHsB5TowCBlNgjoyzytUoDnZl8C5a4JxuYWtTP+9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIVEqeWyYK5mwyOjfUWIIiwjdoS+kSjukFzz
 TjHs4IdkA2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFQAKCRDBN2bmhouD
 19gXD/4/kKIytRMihYOmUDbc3xE+CGfjETm/27Hp8ZzKk0JqB4xauGt8PFAWKY8IfYpnaVBwJsm
 GwABprq4zScmJqIjZS8D3IPggY53xCB7eyC5priNFDqBnadbxX1vWVmls9gSgHCOZ4rEApz5EDN
 NUGmHYssLvteDFUQ4bLE0h7eCA6NPlkO5NNSMbdIMF+EMPqmJWvjQ+Z0kL75st7Z5ntuKMat9lT
 PcmnX4iDLHsHaEJ9M8GcZpJtvBkEnwGKxHnv7eNnVaesqcdtKDZGCPtMFiTbpX43aykrSjUUFuo
 zoXzdoczUzt0Yq58/kOxVr7YbmZ1sFx34TDv/XqBjKSowgDNVQCQ6rjYleqgNuRvlDFIX32oT5P
 0ILv4JcT/Sw2MWmEopbxyGNo7/FqVO7AF7qTqJQJm4DNL5ymBBjNWNBGuSdUWk5vnJYHwOwWoJf
 /0ne2Dlbegadc6pYiKB90FaRU8gWpWqCkZIm4vUO5fauCJEb9G/DdBFPEmozM90oPd4YEZMdqRK
 +qFsPR1uJe/OEBa1F8Yv1e+/8k210ztedijyfkQOLYhs+tSgP7iARK9I1fZdTeLN2GZ8qAW296Z
 MEupAHp55Y4rMuhfoQQav+uSsYcbnh39SR7XJ1ZMeqqjor39rOSYiwFvGxWwTDvdeGpS1jx7RHs
 qiY31FzIKma1Phw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 8136P-6XbAYAbt5GbsqexWuyhumug3n0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX5MIvGYGhKGOj
 4x5QMgnZ8hyrO1qLwoZ7DvYi9AGEui5/hb3XvjlW3tC4xu4bhsCh0IuzoZj1qHv8q44/rS/9aah
 EYOTYyPLfbEfmNgLgp5dZBfZERuOb/FHqHEPGT3lfpQaa24zJ4/hpj1yTQctF7jEzv02QwG9ORN
 7dH75lKaknfT2ZYZJPoCDK4hq2mypgBUNqfDCvfHPkcdrwduTL1uv0D58X8a/usng8z2ZxqdTtk
 TmiXsMQhRZILwWd3ECt5LVsh/hPDiSPKFFtGqJ43ohvHi5be6YcbwZHRPm9z/UxYVkkXqQJh6Me
 p8+x1VnUG9r0tak3F84vDbuPmMOZ1+bQAc6LtwpgfP/mHr1LRMGuRSpywb2XEZ/BRWBrHOfK2Jv
 D4y+2kjIodLONBDKuc5jcBp4TuoPkiTyXjCVkPly1oPF3NJnZFfgH3Yth2iaFyx9NTNGz1/cGkY
 S97Sc5ns6sB0BSZpZbQ==
X-Proofpoint-GUID: 8136P-6XbAYAbt5GbsqexWuyhumug3n0
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a283222 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oh4px0T-8jNy5rkF8LYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03EF2661FB4

Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
so should not be a choice for ARM 32-bit builds, to make kernels smaller
and user choices easier.

IPQ_CMN_PLL is used only by the SoCs already having clock controllers
restricted to ARM64

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d..799de35c5ee8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -341,6 +341,7 @@ config IPQ_APSS_PLL
 
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
@@ -351,6 +352,7 @@ config IPQ_APSS_5424
 config IPQ_APSS_6018
 	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
 	help
@@ -362,6 +364,7 @@ config IPQ_APSS_6018
 
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -410,6 +413,7 @@ config IPQ_GCC_5424
 
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -435,6 +439,7 @@ config IPQ_LCC_806X
 
 config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for global clock controller on ipq8074 devices.
@@ -444,6 +449,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -668,6 +674,7 @@ config MSM_MMCC_8998
 
 config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QCM2290 devices.
@@ -676,6 +683,7 @@ config QCM_GCC_2290
 
 config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -847,6 +855,7 @@ config SC_DISPCC_8280XP
 config SA_GCC_8775P
 	tristate "SA8775 Global Clock Controller"
 	select QCOM_GDSC
+	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
@@ -855,6 +864,7 @@ config SA_GCC_8775P
 
 config SA_GPUCC_8775P
 	tristate "SA8775P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
 	help
@@ -1057,6 +1067,7 @@ config QCS_Q6SSTOP_404
 
 config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QDU1000 and

-- 
2.53.0


