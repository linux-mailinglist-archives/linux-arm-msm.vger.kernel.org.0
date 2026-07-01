Return-Path: <linux-arm-msm+bounces-115721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MIleJygfRWqJ7QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC676EE837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:07:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ffXvF26g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Sg7usutf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115721-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115721-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0920E330FCDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F9B48C411;
	Wed,  1 Jul 2026 13:39:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7EB480977
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:39:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913163; cv=none; b=UIS42QJmF/3OonKp9FPmt6h0M5xxATe6Fx2K4DLi0/SidVUsNdNMmvztJArSh06nx+q5cmnNl7TCkFx+TE9KeDUwYx/16xF+N6VJH+bGFKLFhn/uX7EJS/Jqsgw5OelpsEy6tmiTf17NnWsjYyzxaTp0RRbyIxcwKDOg9V+33kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913163; c=relaxed/simple;
	bh=SFs0hk/sZ+RV77QJkJ3QqT4KeJhULB418pC/0A438aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhL4xCSc9XwqhVDO9QY89OP/W06paI3ySQZMAMFpEG3w00hXSa6l43fT/nyUibH3kLyGWkMgHJtK7iDYud8ZFGUbSux+eaoC48/uX7gWNFc8uzFhsjYcIl1On3XW2jv8aL39NYudL9V95ws6xx2aHOFraQfYOyMvYOkIUK8obM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffXvF26g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg7usutf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661DL7fp1080274
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyWsVThS0786LQdFkmVzjizo3UAUOYgnqHIePxEYq9A=; b=ffXvF26g4KxZIVrr
	YRzhAy8F39QOTTedYA7fTRVPwicQt48wxl6gGK1BTkFqUFP9BCB5ctpxRi+kyHPg
	6yHtHC4EEP3kQYMG3vvzFjN5YY5P1bIjy05Gd3u//K8ISWEJHLRpwGzbjelbaU9W
	7zQNcGtojZvMvS14vMSDWv+pxvi87muDKxjJ7eCTeYJEIvyd7hROWdKmdfTd3UhG
	mwm0BE6lFM4ZlRh0UY6RtUPpG6MIICVSDP2XSlpVUp2GofNxGVzVOWwj+nQhxe8k
	4oiXra2ATJ7GLVrf8ypnrxbcCb9kjWfFCiEFSvhz+IFip+C9uIWlH3e7Zo7YVOtG
	AGNqLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q082ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:39:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55721a8cso75442485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913160; x=1783517960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyWsVThS0786LQdFkmVzjizo3UAUOYgnqHIePxEYq9A=;
        b=Sg7usutf9Kvf1XFAZSg8Jk7zBtipCOCwRyE0yOmc8fUCpiIOGDKHaC2dvV0Bt/AV5b
         Cgnwf+GefsfK5snVUynJ26gMEK1Hi5/aG2LPT4D00Kq+WiJp97ZkuVfhQqjFVXBHHeVY
         KMFRsw8R0801ud6iX+gsYG7l4/HVm0VxhfOnKCnE//EFTDR+7sPQynal6x/c6mdK98J9
         osGb9mV81i6AeaDi0PcndI/JbBOuC/pZk1xGT02AwOvoydTzVUMCxUoN3n53PiIaD6dA
         /gk7eFI0h/pMIQI1xQ+tAPfuLKIwLSWv4NZdKpy0DuofaJYQW3p8B2hUG28N0WyW90oz
         OGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913160; x=1783517960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyWsVThS0786LQdFkmVzjizo3UAUOYgnqHIePxEYq9A=;
        b=EB14TCogMcZtslU7R1HvyQNZfVeTdyQGd6AGIFy5565NkDAN1K5DRqrA6k+jLT6NcB
         Hk7tByzswVlL9HxO3NS6suyUMiUzp4CITLc283K0HbfmcCRspr5j/hmSNPh3knlVFAK8
         ztwhRp6x6RQdChg/wz160uiHqUeQo14dzwAPvRVOYSnZL/oI/8egAlXC0klazj5Xqmqb
         f6M+tnw1TYTY6jLHEGsTSMgE5zCSzqEHP3NMooFIQudxL0aFxP/QefW8daaC5eVJrPoa
         umF2ieo6zEkLsOhYfDzquBe91+HWDfzgesBjv3YNFfIKBh7rtgw34q2KeQbydPMiUWh9
         VEsg==
X-Gm-Message-State: AOJu0YxlZM8sdmW+FhY+f+3h1CWIbhCS7BcJfmjM+r/Ckf+qLxrUw8+o
	PNkv+8rEJsZ+MLBsyeF3aAvjbYPCvq2cGfZKBsCVi+vF9sWMqR2BRaA11NHHuqZz+uHdq60lA95
	Y2kkDL+5+86NYO+Ue5/kJ8v2qSm7ACqEIelwPTFFmgayF/HvHQiTd25MPiEhcRPiRzHfa
X-Gm-Gg: AfdE7clXbr6WBQMdPBJTLCehUuii8QX2aNMtY2koPRgOgJr2713T2amQKSjqakuBWUw
	zVe2hBqN0gtT1iKfkYumtIEmpD96fgSdnNEbn8wZesDf6QjNragSLDU3VB0Hh1KLwuJbfqbf069
	ripkp1MCSJ+Hy5mVBW6Na+D/ylsDb+wp7dkgWKn8lm8XULYEn9yCPAvM0F9UW/W4AhUEeuN2k26
	9d/evjowOcrYJgBFY29Rs2arzoSLwO1dd+LqJQhHDvvSPZ0V48Ozz+E2elY9tD7vcRY8qtQ2FVF
	NwOBoYUE7j1fFX/ecPp6aSr1GDjSgCSPqnlHBG9ocwrcMzJUDfT0XWzbXeZBn0ax1zQarVQQZgH
	ClXSHBMcjQY7G3C98A/tO0JPShSe00IzGdTjsbp+z
X-Received: by 2002:a05:620a:28ca:b0:92e:745c:6c5a with SMTP id af79cd13be357-92e781d3b43mr253032485a.14.1782913160424;
        Wed, 01 Jul 2026 06:39:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:92e:745c:6c5a with SMTP id af79cd13be357-92e781d3b43mr253022885a.14.1782913159679;
        Wed, 01 Jul 2026 06:39:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6619:ec60:6996:ac02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c3874f62sm18349985e9.2.2026.07.01.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:39:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:38:57 +0200
Subject: [PATCH 3/4] firmware: qcom: scm: introduce qcom_scm_clk class for
 clock management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-qcom-scm-code-shrink-v1-3-02f5ce02c95a@oss.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5291;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SFs0hk/sZ+RV77QJkJ3QqT4KeJhULB418pC/0A438aw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRRh/RxNb1XEW3PArVwxy8JQa2hS27Iam4gxAb
 Fha2vDD0RuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakUYfwAKCRAFnS7L/zaE
 w5q1EACEGTgK7rBb/T0nYIDRc92+/2hu5k079g3eOWNbg62wfJuP7dNv7apK8cZn9h5AKUc9Eqh
 U+/OigcCqf+ofqziTenCBHaXxHkkA4TlzDG6LaI0I9pUcQ/PYUKwK63j2Bw9a3rTGyOj5ypqEaf
 lf+WsfozUCTMbFpooeilpNSNgZZ7DO31q8M1wYNA0dGXI2Vit8yf2s0OnNh4S+3if0bpxXQ/xF3
 qbRD96JN5zuxhGT4JWxiY9bsgJFiwrRjw2wmWXL2TBQzCM/mo2hVwjD0YJbpDpYFp/5IczQogZT
 vOmtEttBdHPcHBD7NwF9/cDJAnIop6cmJxR1F5eD/Z2wfwKvVa6WWf36/DTaPe66iLvKcUVazqE
 +HzlLLVAEK0d0betYJ22A0La23YfzN/wY2VuI3sykkcqfA1804k9ridGZp76/9eIp+acxsqCuwy
 Mtq8L29+EAT095yKWYO5SBssXcmPz38EXlKRPqVAVKWKzPgmMfh7KGoFLwFC2jTqGhHF/JZbVZL
 OaUdniqp7mexPXzUbxK0EbVKWOT+Qh+qVzFrCCdqPvXOtCC0vNlz9Ru5Oi9yPhaM7HLfjpP9u0n
 3fWAIsQn8RB7KK5xUMwx8ThsePWc4wuiVnlSSPPW4MwZy8JnPm803Wu4gOu9/VgrE+58U7N4rWC
 3ZHBUifMUTicshw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a451889 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wtmscHdGGkZXRT90TS8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EDoAW5ivzGKLCi7D2ivJ4uOmilKlnyO4
X-Proofpoint-GUID: EDoAW5ivzGKLCi7D2ivJ4uOmilKlnyO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfX1amb5ehT+Iu+
 ltj6Wj8dY4H/4+Ma9b4b/r1szp+si42fDmyWjB73inGKeqFlenn+pC4CxSlF75eU+KeW5ypL8gV
 6W16aYMIJYxElVL+DgX/c3ugmF2FWogIpfmNFqsljQ8cwcasnAt5fO/JCAQGt2T043tvCMsIF4h
 xcYCkl2MGpoQ6dhzOd3frTw1tmJZi5XyE96bwAwrWdz1D7lCN62i35D6KCbGq2+OvUI+NLkLlEH
 6rRAd8bQDGfQDeDgRUbt5e/aZNX0MsWhSgwhRzwul2rrAIYhZoE3MRkKtOTuhzH87X9u/WhzaUu
 iKJU1p7ND6lX84Ab74JuRtnHSj/h+v/nHaPrnbWbGumj10fWTThd/uAeNq5xZyE2mCPZplgxc72
 O4wHDF8Sz4EiCg+O5JjsleUvy2bSxiZOWCg8bbwW/4u6/w5J6Jp7lRrZxU/fOfuyDJ3FBj0hyrX
 4pQerz6CDYweTOX46CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MyBTYWx0ZWRfXx0rjaqGp9bO9
 I3LMfTNXD2ZuG9KWyeMeDhcBFQo7YT/Th32PAMW1T8ZiKXJisqcvQj0ShKO3OkpqZ8TBiyGodsO
 FGX2gkiCXacIi7OkAOcGwZuf0OYhh5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115721-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CC676EE837

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1684220617748e4890ecb45a1787a6798dafd5cc..35aa9e8886b6ce8ab8eaf16c83fef7aafaef2822 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -192,6 +192,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -511,13 +514,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -616,22 +617,19 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -758,20 +756,17 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
@@ -877,13 +872,13 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return ERR_PTR(clk);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -930,9 +925,6 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
@@ -956,20 +948,17 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
@@ -1039,20 +1028,17 @@ int qcom_scm_pas_shutdown(u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
@@ -1791,18 +1777,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk, clk)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1840,15 +1821,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3


