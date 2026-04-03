Return-Path: <linux-arm-msm+bounces-101672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIiYDIbMz2m50gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:19:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D193951F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7364C30C7A2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5183C9EDA;
	Fri,  3 Apr 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fK4mZTh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/p6e8Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC93C457A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225493; cv=none; b=Uu2qH0/RIHhWS4TelRneOHVPCabx3qgFzOfI6wnTBPanny1RgXW6CDo8mSMSKddeNyZ9VqO4GioTytx9rqwYC4gH9IzYY5fJyrbus+zvBpmNnIrsly939d+ZudhdIbQJXxB1vwkoKuKmu3vrhPIRKPirJgRM348TpnTCrKGEjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225493; c=relaxed/simple;
	bh=pGXUSvvrPCaY9bNA8U6IJfdUVXNbpB60+57XVCPk97s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0sllCufl+97LO1mHi/SGMOUOs04BGTeIPGFBLQNFAek/NtlivZySZqUl+LqMgWOpYWqPQlEln5CoCT7ZkaiDXmcwNB2THpfM7hzD3gx2c0y0K8BofnDaa/5BdgA9/e+IOc156HyFkyzy63XalSAaJGXAmCjYKuSKaT+V2A1WoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fK4mZTh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/p6e8Qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DWEN92362356
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=; b=fK4mZTh5TGPYKExD
	oZm23RS5Zq2fnGuHku+FWwGyeVm2iXIYZD7P/MIDpnAyv6gIHevKuVOQBE7XIcSW
	CfJ/3K8LrBrDppN5wkdREqFYnCRrsMQKkSluWLnTenU1yXoCAhObCqTClaG9G8B8
	ohfl538ClU7uPWXn/7ZvWgSfyhZLReYNpDiSN4KQJx2ZICan9H+msh0RCRWlwS/I
	DxWDNINrQkOAzsodaxTJI53cAm0hO7zpY4gLHFgv/8WU5Vdxfd6qStLyq2zhC3lj
	C+WzWxIlZcgVc+8bGOpknwNJPoaMglQ3Yto7IbFGKYZ1YnIZtRGbwEEGcbqySVFY
	1FU3Ig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1g3pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60521f54387so666904137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225491; x=1775830291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=;
        b=N/p6e8QgY3V3+PDMBMEd/9J79xG61RfoCLCU5k8++eAAs3DyWfCRP0CSJQjULelWsv
         RXwnJnbVOpvOvxnyfsQLrxlQj+6TbmHdnpsPW2cAP4vjbr7FSu6KtRSGpws1mtKRtoA2
         mqDcLmXEQ+GiLY12022R42wf+jjZWoS1i7FDBtaxUPfHOtit+EJg7HMxR2VE7PWGG9xy
         qcqQqKvb9fKNztKTnrD48YlEO+F0jMTXeeaTaX2Gb/g8VQ5nm4ViZxbQisCrBRjehKQU
         V6z54R1e+hKl8NQQIqKhZlc8hgu2fVplrOaYWVofNerlG2dnOvvfgJoL/JCQYtLg90Cr
         WVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225491; x=1775830291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=;
        b=QWxeJCQ27CRwxTevxzepu4EkwD2Jh0JxQo8VsqMW+n2NpA8jkrpa0DYmOwuW5R44PP
         O0LzBDTZ7VWruSI/eBE9t7nu9V2qi81fjrNOW3DXpZwIuGRmVGU7Z0+42h6qoekrzrN3
         4agwDDG497yssU5/Wwfkmi1DeqluEdqF6QBBv6N7//Ykm4doyBoFBS/kC6Rtig8BpmUU
         +wuh+qyxkPoIKFp1/EQZ4KsoMCW2+kPefdW312l0L1C8vaJuZdANnRwX9hqNvFt2qndr
         UBnCsgbKw39RpelqCi0MMXNk9ZjBR2B5mFloMWr5RmiYFj4FKQWHLTNm/xPMGpaMRrHq
         labw==
X-Gm-Message-State: AOJu0YwYvTiuRE7uFjNK4s5LWgx0w6I65J2naUm1f/NdHno1JaXSu3NV
	uN8UTlqZDx0WOliRHcbtZUi0VUu/78pn/RcNEFPSTZrR1yk7qZ4hlO2BPA1RACaeNIpeiShwyGf
	mMOHd9JWzgGcTIXfmQh1LbhAGQf7Q7WZyktBczhqSzW0CM6D4azUbFFrENJsQn0SQ5UKK
X-Gm-Gg: AeBDiesCdvAW9GlfSLeHu0+iJDnzCmsb0LQ80mlpxID3Entu5f9JDX/J5REBvOxL/ek
	j+V0wMz9x6JqpJmmjK37rs1ckfjfR4Wkl4Hohll1sdFCojPzicZbSafhr1EJHdNRYA3b+RGFSO7
	xqyTudgB0WsXt6S36PQCVwKZBKjB6FV3S3gnnaclyaJUSlvMlpbT4v23ne0GfJkoMR8JDkgcmO0
	jqravB/w0fkkctwQnztlCVLf6nyja7PrZ2fW1h/m+mVTL55RSa442Qcpfvak8MM+YOemGPUfBMw
	ecs0pRQRTpRb+dkzmjy96kkrSVb7tt6LK3c5YPMEPNwZ27/zqBWRP1iO+nzwcjXCyo9NtO4RCzy
	Ajf5P+Co9Z37khc6T/YuBTKzOkgEmvYn43OevQNTnq0nxmnt97yA=
X-Received: by 2002:a05:6102:358d:b0:605:9ece:8d74 with SMTP id ada2fe7eead31-605a512bfe0mr919743137.24.1775225490728;
        Fri, 03 Apr 2026 07:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:605:9ece:8d74 with SMTP id ada2fe7eead31-605a512bfe0mr919720137.24.1775225490248;
        Fri, 03 Apr 2026 07:11:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:55 +0200
Subject: [PATCH 7/7] arm64: defconfig: enable clock controller drivers for
 Qualcomm Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-7-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=770;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pGXUSvvrPCaY9bNA8U6IJfdUVXNbpB60+57XVCPk97s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8qB9rA6oEtfhw5E1F2I9M0SZW4hSH9QHKa8+
 OOr9TGSwh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KgQAKCRAFnS7L/zaE
 w+lAD/sGSyzHSiDLl10lrRqWadTn4ar0xcomvKgXlKXHrjSyctiLQH7te2z7srmzG3lfa1h5s0B
 ikoyEIhTNdPpNk8zWeM30ZUNk23lMbfKS87V+qhENK4zFL742sDpLqODNjBOhpJ7fi4t2FZKun6
 xBfJ2Zbggg4dR5ZmogMqsUYXqesjtNSAWaygJFKibSthKiKPZud/XbDVE0H3MtpSw2XlHqIxoTQ
 6QK5XqwrEeOTrNxa6htGAIMH9USIKfJwO2UPsT9wfR2uwunj2jhkCMulINf8iPnH16T1ytPk9j4
 pq3EV89gi9n7md1MKxxWV3vRcGP0wQDEtej7ugQhcbKAb5IldMGUs+WXhQRUjN+ou1gcB0s6VZ7
 U98HFUsmHWcLewH7FyTlBYOUgvPpD3c0UZCqFLMx0BI2qthJfhcKZEUO6Fj83jK4n2NsQOLe8zm
 n/+97BVz5PLtIjYGOCzl+mvcMr2CCcoJt78rL+sBg1mUIbz2qgESjMM/sZG2bgFpWQDkhm73zod
 46BA0mEeNU6VRIVIEoPHWUTCx+qbGeCy4gqWE5JDUu6kJMPEj5s2C5Q/ewXuzwCgXjhVVTMeP67
 C7/khGdA8PXqsRwqHzN92IOrsBVaQ93NUGYURs2sFwXerP0uUsiwk+E7DTNZMbpN0v0VcEbijO8
 ZJSu7skSwQLJjWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: IXtKkNl-pg3AOhpsFrdkP2wMSgL6IECg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX5dsokgaLqSFW
 uCDFB/sNeYoYZEuaFeZwC5SWQNPgGD1poWQBVSOPSAA5qNCbQt+vmZiKpc7fycOV2XYeBSFqB7X
 JXyPT8wBEyZIOZfyVQiO4qkevJKrwHEpNBIhEuNTs1Igfa2mfIBSOCDlDgEPo/a4JmQQDqAqSVj
 /rFZBY9vok6C6i5+TNwmkny92MD3gLEiAPpfHvAGN72kAsnfAlVAT5gmC8L+6eskSsgLQYRijBj
 m9Gj00N65pTU2I+PJOK/swTjiS3oWY7R4p5wFozbfpGDvlMBLFzLE+9ak9VGdwN2V/tVwn+pmeA
 TJtK4/SxJClQS2bDIPIu60MyHJyvQxHSa/l/0DT7zVNQEzOUGSYFLc9I9mJSMsoi/D9MK9OAV6H
 sYaGYrmj7AoWo6rHe5YP6ObExbpKg+jMSGc9NgwHi2c5JfWoJK8tSZBV9J1dIg929C0cjiouCdE
 YSH0+QAmGZdPDvRUXXQ==
X-Proofpoint-ORIG-GUID: IXtKkNl-pg3AOhpsFrdkP2wMSgL6IECg
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69cfca93 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5D193951F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the clock controller drivers for Nord platform from Qualcomm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..f1a3333bb07482ef4f8b4ea9154b0f2c74587a04 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1483,6 +1483,8 @@ CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_GPUCC=m
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_KAANAPALI_VIDEOCC=m
+CONFIG_CLK_NORD_GCC=y
+CONFIG_CLK_NORD_TCSRCC=y
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y

-- 
2.47.3


