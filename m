Return-Path: <linux-arm-msm+bounces-116102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vpthCjuvRmo7bgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F46FC19A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dgwl1E4z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e2se9b7q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23C3B303E619
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450D13446A7;
	Thu,  2 Jul 2026 18:33:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13136B054
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017222; cv=none; b=r3OdePSFe5DHrT+LwFEN41IrC0x5x0WLgIffOx8ZVoej0v1YCtQIAE97v2i8s0fINha1BoxBtCCLImRotgyeRBAxkFeUJceFUT+6UXnEVKPo8V2p53ryeS9/Ds68gfaahJWFcecgDrq18eJ02WwOghAww6VghIu27h/S+zg9PSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017222; c=relaxed/simple;
	bh=ySRNjk3Foozy/aJPnV0U6MukIvIZ0rUzBopoQk4qeXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Da8qDOinneApvW3cSDatQUHFi9WyKsjc7Yw7GzPhwLHgpPZQQyP+i/NgHehj9tq+ZvnKudcXkTvMOD2k3O6uUEbCD8OMBuqcSZ9O4cW7Y7mG2ldChXc4CtEWX39oehf6A2vVy/kQhMlzQGKGem90yqiXKfvDy4kk6AjPt4JUdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgwl1E4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2se9b7q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Bcu680919
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=; b=dgwl1E4zFmxazu45
	vBFbdKDAr8XzsIEMgkTnuxS/woksgDm3h9hTQ+o86fDTaCrMUl2Ev68Tf241Ze0c
	Ll3s9Ugif/oRFSqnrl4IVurh9Xeh7N7SS9BezzSZsymuBslBF32Nt3LKqQJ5Kkt1
	yuU7u2UZSWnIW8VVgN0H/qjTfJ1Wr4GmDOA6urSzer+njm0BPXB1i1z9ye6lQ+Ka
	cSQfu8ELibDkFsVAKcFfABPm7qijt/sL3JbvPeTkULCRQs1VZi+VdgxbaQdVvz0P
	mfFfIf+papYyYdEvRJfCazgl/o1zS8vnHQV8YWZxD7GadiM5hzdwayWSaJNT7cLi
	Wd7pjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtfh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c79e5de32cso25993465ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017219; x=1783622019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=e2se9b7qkAISe4u+VGlbhJetLbzgbc1cNsXWSJnO71FXNYiNhqQqvP4VAWbN+O5zzR
         9EtL7S+xYoN5iTvvqNNlnnNWcNdyMA2zkR6fB2/sBwTMj9XPeD8bsaLDdp0dNI6M+VRE
         cJtgIXVPqVWGBS5LAPVFqa0o61r/2JGu0NMWec0ghGe/bynExGz8DNe4VUFE1URxqJiQ
         f6ZsNjOzMziGsLqtAPiVl4ET9+3GcHze0R7KTLINEXMberl+Icb6IXE3Z4wJpNrv0a4U
         QfUC+S2SUF3MgumoSS16R50UTZV5Ix/o/DR/kMbI6YX2v9HD1koDs4xM96tBMgXkPt/Y
         /lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017219; x=1783622019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGyFwAiE5fg5bRFS8w6ttV9F8RMVIs1norIDQCSehHE=;
        b=tD0b/RrVINdv56qdown3aPTlxov/0002jdhUDEzTQiAK4PDRYgTkTarY1xqCL0BTc2
         WcKs2IPPE8ymOTMYFTqsJBwaBSvGZZDJb1miHP9xpUxevwm6ss9W64MMc4+3rh2g7WF+
         XoW79uK8+Fmdq071LIvqwUTMLMSohTlvP/6feo9Iq96ndhDQob5IvhjzLfg76VvwUKMj
         9pH2TQIljxWfQZt1xf++TzL7JHBajmSu6GOBTkx2Fc9IiUBr7i3q5kdRdZ0EBZzIEnfs
         ZoMjKpxsi2AIaKNlv51uHOBP4B6VUTyF5Wjaq0GLSZVfTlwRqO7M89TE6Is2it2aTHqr
         +qeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXWUf0Qryff2uyin80th8IoX4u84Kfu3xp2jwz5Q/o9nJUJfzkeqcrpSVzyI8n4+TGeVc+/RhDV4GffsoT@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvHm8fXcxbNisznwl0wErZX+HjlqC+gTy29ZX0wBQ5rt2aSsc
	n4brc+D1xE2JCknKzyKLK9smwWyzAefdJLUAKldL0feDP7ux3c0zV5C8qd4fhEtedLBMhu5BKTj
	VVr6XJ0sWytErRw4rzEc2V0RCIidXPnZcZRXN7IyJd22nD+aZ+cuo//WWNeC5XdKAtogq
X-Gm-Gg: AfdE7cnvNhj68au4/mMXF5TS7eV2nxOk7vsGq39uaCKZ79bDGfmCpKCj0qeQkPl+Awt
	268W739MdvPOGGnhmeHYSpbUs6Jd5b5LNMLPrtuPZvQfQ/GZUdkaO4mFqBN23Wn0cd4W9o5aInb
	Rkx5TE4dQ63KmyM/3YQi2JlZTPRj2eJQeXlpPMnmRoszx6EwxhSpaJlhrnoVr1R+XpoJu0smKSN
	Y9wTuKR+yX9jzh2/IFE1JDJ26DQimJb2Toq2ViLiMI+qogrFbMvHwCZFHmRKlVcZf5Fq+ZUPnbI
	0g2sL4yw1+eeLkHXffY1iOtfxjQnFrgEXpVv1g6K9CYwaKaInR4pwZXi5i+eK/3v+fvLBpeHBGT
	Q3emume7rrb7LE/NgYu5JQngiH143EpmZtBQzZUc4dw==
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939485ad.21.1783017219454;
        Thu, 02 Jul 2026 11:33:39 -0700 (PDT)
X-Received: by 2002:a17:902:cccc:b0:2ca:c861:4757 with SMTP id d9443c01a7336-2cac8614a02mr12939045ad.21.1783017218966;
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:30 +0530
Subject: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: nrSOHFzwknrVAGr08yydzOQxrqKgUX94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX5XvNeY6Bbfud
 VDcVmT7yu6ds+CRruHRUV54JJuOd7BSG/kr4jj2DQLtRGK53GFv31DqKLgYDVgdLmGGiLrZJTC7
 1BramzyKF3YjK7k4qrrS2kgzQn//1O1dR5HUMmv3N928AHqXtDubF/VNt+1GDvZ/6JTR3xEDbLk
 wXFJEWIRklSTnDc8EcUEJqFojtxYV1jVd4pvy9So1AndCXuMWTmQtWlgeAViNZz37P4q/BsW7tT
 R7FJPV+MjcCiP8ApBhGzG9ooZo0GwRvgVXELIg3kI4Kn+QLPlzspNIfL2SxbRqaxHEr1aTCTQgj
 sRZdfTwL05KTaVu7GXnmg/dKQRb9wWoy3fNLReKizbAdbZ1mpxq0tcgBAwXU+1XO2c15DmxMJts
 Uwqhj4eH2NjFbiXvw/Emz5tynVfJm1TuHgUCfbU0ItjYMY+BYQr0jQde1KRC/EyIHQ+N0Yr81Ee
 3a4I+ghV2vRTgYiIshg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX6n5EsBYAoeKO
 3xAU2zb4q/xxC9tPY3h+HF96goxe1lUU/MQIxZf4fDmLMINILMABZfnCaimMsDma7dpF6Et/Glx
 Lk4SUyN28rZa9Re56NMWNTF93PDMpzU=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46af04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RcQCSl0kXxLcSeZUyo0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: nrSOHFzwknrVAGr08yydzOQxrqKgUX94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116102-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: D94F46FC19A

Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
switch the GDSC HW and SW modes at runtime.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1


