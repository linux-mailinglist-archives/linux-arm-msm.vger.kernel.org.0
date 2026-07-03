Return-Path: <linux-arm-msm+bounces-116316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wAzDGeevR2oldgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:49:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D512D70286C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:49:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HdVHys8s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OLX0OTdv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B903D3061DEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2763DFC9C;
	Fri,  3 Jul 2026 12:38:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8D3D9665
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:38:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082339; cv=none; b=B4le6M4AfUQA2A2vGr43c2l65GzjTIWWNlylPEvWZem69zV6Qincb3ebcF0NUYMNmFITXty72qXy/MOrqAHI7ft7D5JtrkWn062GZ7EBth+K2H/ifbQdLJvAdgdEQYclk0eoFOPSR9uqsZ7SunXmMcsuvxPFMolTUBa+fqTGgAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082339; c=relaxed/simple;
	bh=yrcztr48bhxuCH5lq0JIaPikaCvhdOM0GKlWIoBGDZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5DkTpyeBapakAiW0usXoYL2y7UJtlWxDSZXVOW0hnD2lyvXTwC+CYQJ8nyVQ09SVx354Ar4qKtwuHSnltRIaYo9ke/Gd11tuQJf3abZyLj2sjGF4CjX2U7cj0oNbjcZ9p2ybY5+jUPRHPgNPabMQk2yjEQPd/lyptNHTp0iWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdVHys8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLX0OTdv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639Bo6s3694364
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=; b=HdVHys8sym8Vg7Mm
	8zzeZUxm5qYja04JADLfYUJSMSK5mndXbqDQPg42YeibCCIdyUUWKIoy2+O1O/9R
	U8hs7l9bME8gYwwyfNuaAzAndI2NtMDKL4dlFoNlASAWcNZsvlSlvWLw77kaZyBM
	u/2pVsiAJIWElmsqnJARXkJDxpa8Ggw+8t2IrUwHRHXVIeRDAhgLroG5GovNUshf
	aj1WFWRlkIV72Pzs7rav1GYh9nu7s1f7/RCrppcfMmoyPlZ7P/B/VucyPNUtXkUX
	BemtmhXxrqA4JxdvaA02e7t41xw11n8oOPWQ4R9twnYrYKfUo7Aadw3z48IR/ETI
	Ql/+XA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848s08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:38:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca0331d0b1so7572435ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082336; x=1783687136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=;
        b=OLX0OTdvdnAj+5myuk0nBDGph1JaNPvOukkh567O9ub9TzTGpD/JWRGRjqQ9m3wKUG
         aPz7vjoqQfV7s/8pWu2pzVTjyyYmj257G6KcAfkvd0Ui8wglbW0EYt1SXTUsK4Uuf5tX
         kny9i8yzPqQugJBr4TJP9DdlJYFJCJyNddNS2a9zsY9pORzGd+WU5uZ6Q3ZSIphrRZ80
         Rpqn3cN6jXYcdkJ4xdJLaXGZmMXKhzB92Sy65ARNWEnE3ShF6/w0OlELrQtqYh9xp/34
         wQ/H06rU0DM1Zbe6vsB8pTLpSkf0tjuCnQ0lCcgY832/0KXMV0oGFYP98DqqbznQoFPr
         PWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082336; x=1783687136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=;
        b=GL8tme91F4UWEbe7xHUi5o9t6Cc90RKtJPAc6NjiTJIaBefzuX+iIUJM3g3d5IFoPe
         BFfMD4GPqOntRWQ56AadYOOiRKrvhs5TRnDhCrZ+QgAIWqXN14LuzgTkjQYey0V78HqA
         glOHl47kU22BITRiPN7vec8JIWxnbq+pSLHeDOaFFESlMFVawkYh4axBgxmyeZXrpb+F
         acpZp3Yvx7sHxdaCTK40sbdlahN2fcAD4IXAjoQ9WqmzAvUjlZwSJuSLi0yNGBVB2lNt
         JmSmvluXq0R0ncaKaiU1NbMhxwaroctiEPsTpbDHwS4RZYRnLk7arslJS226ue3gMifg
         b+5Q==
X-Gm-Message-State: AOJu0YyqjWzZfKKwBE0+XnchJnsTAMU+VZHHT9A5ck9FZJVIdgYC3HNy
	rvtxD+h9gLXEhBaapvlZ6Vmpqr2ADF8JQ/kP8umHg8JTIPlywS3aKifPmQK6LWXpuBBu9fS8K9u
	aKcjmhko2PuZB/XdyjWjOfEp34N735dGap9NkKm/ADYpWQyh1kLk1sSS/RpQQe9BolA7z
X-Gm-Gg: AfdE7clQELqQrboUoAB/hAeXw6z3yOlYN870OjVFcijQJWukuHYBP3bsr4DoI07vH5n
	G09PewkT+5T3aW8R08kbkett+UJuoDapGhe4cWAv6eLc1aTOO0s0LB9awQD0cZB3jZ4Fp54mWig
	iPxNld5P+A+TS2HAW/CYWvoru0caGPGc1suHqE4/g+X/W8pmV7DXkZ6nWarTBQiKdr2UPdLq+Vn
	qWfe1UOYch747/RG6h7b/GYlX0UjX4p4OPleeUhcsDG0M1YXzKTk+YeA3cQbH3BqF8ONrUJyG40
	wH7Vo7j9UNRX+uTn5YtUrprNFfPZKnp9ATMHioI7oF96/dW0s1o4ryGpdIBoqomrM0NKXaGjZk+
	BxxN7vxTFsj8Eeo87vNDQaBjkUKPw20AmMYtBvKNNzjGdFA==
X-Received: by 2002:a17:903:26d0:b0:2ca:5a0f:d0c9 with SMTP id d9443c01a7336-2ca7e8cb82cmr108830185ad.43.1783082336396;
        Fri, 03 Jul 2026 05:38:56 -0700 (PDT)
X-Received: by 2002:a17:903:26d0:b0:2ca:5a0f:d0c9 with SMTP id d9443c01a7336-2ca7e8cb82cmr108829935ad.43.1783082335987;
        Fri, 03 Jul 2026 05:38:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 18:08:32 +0530
Subject: [PATCH 3/3] power: sequencing: pwrseq-pcie-m2: Add QCC2072 BT PCI
 device ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-eliza_evk-v1-3-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=978;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yrcztr48bhxuCH5lq0JIaPikaCvhdOM0GKlWIoBGDZo=;
 b=O0fosvzU4i45T8cQPPruRKR2egGi9jQkA06AsdKRspZ7xBYL1Tlf7jgIdwoCUcOonXL3YHHj/
 a8AdApc9dDgDAe3OJpnNOLF6galNO2wunHGIdC4/o5JDuNeZ0lE8fIJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ulci__xtkSXyK1W1yA9NM_UPA4WkUhUj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX6F91BsMF+780
 EkAGoXfqJgTWfNGzqZK+8I/kr9G2ZyY+yKJt93e/Q0M5B4s74x9QHivRMLOr1VESNXMz/nL50ZM
 VP5DC8FRjqCNKfY/T15lpN1kNTtVhy8=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47ad61 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BU0hv6CmB1lMHcRhg2oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfXzxAeWdvAL1GZ
 5HM5GP0mFr7dRg5bwnZwTAbh7YOQZgiG0cz26F1sKrTR3E81rXr77je2rJ6VzQrVNpzdY1t7Cgt
 bh4K1ylVyBeEWAzh6Bx6/o8u/41szVJkObPMfA738unRCjyTbQZutdGT9on+N3mcq3xb5ddKzqG
 XkNkbp+ylHrRGOIdCtXNxTFVgoNfoTT1Kvp/u0AgLMqzDHzxDDRIbRDxTlgH4+qAk981h6fngX7
 Md4XVJb21UCJrcVGkyoXG3k1MvudmmbYa5pNn905ywMhe25uSmbxJC2nkxUp+Cywk3J+5D7AIy4
 abdxthd22dyHm52VlCVK+macamr0fDUE/sDSUsx09LZ427wcNbnbfT4l71NQuR4tjQzqkDzYxv+
 ntUrpSPHtpZWwXR63uRxzi+sxF12QjnMW8j0JS43+rf2PxfU0d7xN8rhWJVwHCCVHkZDPeUAwxr
 9mtc4tNMyAQOzF9Au9w==
X-Proofpoint-ORIG-GUID: ulci__xtkSXyK1W1yA9NM_UPA4WkUhUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116316-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D512D70286C

Add the Qualcomm QCC2072 Bluetooth device (PCI ID 0x1112) to the
pwrseq_m2_pci_ids table so the M.2 power sequencer can create the
serdev node for its BT interface on enumeration.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index b5ed80d03953..4aac52062fae 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -190,6 +190,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1112),
+	  .driver_data = (kernel_ulong_t)"qcom,qcc2072-bt" },
 	{ } /* Sentinel */
 };
 

-- 
2.34.1


