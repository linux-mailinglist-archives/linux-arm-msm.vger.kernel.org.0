Return-Path: <linux-arm-msm+bounces-114197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kemNL4Z0OmrE9QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:56:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 588936B6E9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:56:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bO/WhQWE";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RYhRxKpe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114197-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114197-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4D463009CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213A23D413F;
	Tue, 23 Jun 2026 11:56:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3F3CFF7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215812; cv=none; b=SadRZfYoMA+NyTFaNiY1rbO7C3XAnDDqfpvDvEmU8f1aMdqMqM28bkcY785R+GmgGOR5U9MUJISM6KZb1xPJhJyZV7Pq3eAtvL1gh0iYgaNgON1JCumPF38HtMjED3JtNF9EWQ3o8BeX37vLCfHscGaSrc5L9mX6Wa5yDyNZkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215812; c=relaxed/simple;
	bh=3wvmw63CMGaQoxKMqe+zRUeptA1VJy/N8n/iY8MTMTo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HeDXWm1izondOYq0qve2Dobr3ifkGSARILshkLTj5GOGTY/9jxlhK7bBJ2Ww26c5xiZhBHhehZk8ALQ6UM+A4684pJ2QxAatATZ5jgksWwOthkETYFq4sHY5fXDw0ABTKQVSC6PMQmN+Q8eT/DS3d0P5YmKcq8yQs4pLKUey0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bO/WhQWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYhRxKpe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYj3Q113482
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3B
	c2qnOxKk=; b=bO/WhQWE48U0+yX7LS9fOdeVUvTGCh56FrjjdATHLS8tBUXsRRu
	smnn3ePjTaVvTcTTbbenLFYYCxcxKLp1rNfQhc5DjaxKRQ/iLuu4j0Be2HijNzHz
	RwFiEazKivlDOhESfQAE8hwNKyUqqSRF1FszPhcFriStCrEXQ5fQM1TKGi+lRrJR
	vonycz/BIdCHzgSBveqGXwIN49sBzaIzVFq/kMZD9JiBbM7evfrj31waQKDJ/qkd
	vsnBM8928shyBqJO/0U5q2qlh41p0y4vJ8SSGnzuYVYUaWon0qdg8laiE3c8dXXX
	Fy3QA9I4zq+MhwnoURZdDeh/GlaaGdDMAeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsbdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:56:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915767b341eso533620985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215809; x=1782820609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3Bc2qnOxKk=;
        b=RYhRxKpeWR9ktYkiF19Go0ieAwzRLI1a6/Ovf62nzywYahQU6khhSHgGKAhEWOh5gz
         AEc5FBk82af94rRBmTkgfNcduHY4yFL43AiJktOqsPa+yEl0VrwOWknu699I7aMiNcD6
         B7EJtShvHGR7lJIpBBF8gGrPHMbO3W2I/XREcdk/Xl2Hfu04gJuklos/ggn9tVaGMK22
         5E8YZcxXlplXxObDvpVE4U1SI0nBIKu1Zfq7gkxwjU3KpFNpDJq5tvQbf6CX//cIdyPx
         tYKFpBjEm+uPn/GkITN9jOAHwofyFvBqi8qionAZj1A5yrDM4vKrD6DwCKqvPdtxiVA7
         jwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215809; x=1782820609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPoxyGzrI4Y9qIV62oKAP56Oj+yyEWF9A3Bc2qnOxKk=;
        b=VwYbYH1nn8VXl19K6UcS8YcRGianfYoKYEDGxhIBO8YlR5FIoulT+LLqkoQr3xcw0l
         w2OVrLh/g3GQJAAHISzaMHik16mwluce2cScVtls83wb+lMGlmi+56kRJG3mAB0UThrd
         vonuhrO2bBfWsPtKKQhPdmvEemmzuKuLLs5vL/phfaVBkdLkXW5TvfV3QXYA1gtnKTn3
         oY62yQzqxmKh54QFRh7BDk7ZUyb5UGEJeWjkvXBDbPOiZq3++1wp1sVcSXSB6T7O+OgF
         GZU3WItqxuWYffinLGpnzVr717T5+q1JJJAYd+OkyCBXX8L/uScnnOK0pJR5tvMhWrKw
         HdXA==
X-Forwarded-Encrypted: i=1; AFNElJ+8Wg1Y6opx2fCjmx6gwi9i1tmkj6PwpeHgOVUzoDszaGJbuc0zLsrTaY5jfJjSEYRF9wu01/xa5PJYkIbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AcJoST1YFiMDmf/E41KnkWROBq4V5hlZTDCK/evYPN4MiACg
	0nYzy2W9jBEydRUG3O6Vp7bA4gCXFFWnc6exiI/nwm+UDoBjHkDRqHJyxOmkkkVKne3hmcN52ML
	bkGNmN0/Kv2s1UNrHo2P/VwyOlMTydSDgsUf05NtovOBtvhnfrTbMFIspefnvTh+EtBil
X-Gm-Gg: AfdE7ckKFCP8II07CKmE/a1bn/ATy5ZdVX3YbQeS9KAgvulnraIWxgKbVPI4NKyzUEs
	OHCZVZM0StwRwYSq4cbKz7RXdX3JDfGfvt5M9NsocctsuPsdrI+e7ZypCiqvgGUPja9YSyFXX8i
	qfIs0BpDlCnYLR7PqR2Sb9TjMVfOTc4q8KmuDsV34iXuSiAzBsnq41frpW2eDkT+rhui59LDOPf
	dlXQdaD3VbfX8wVBNM4CjGJmWzUXkqKGNO6+F3hpHDA1jDGUoyPqGegKt5J1ech4Ggmcv/e3Vu5
	cQSmxklEAgonQjXaELR/QH6YVKv3pFrkGwNtwu17DeidhcwLQ3At/SWCGcX0Poo8ycgFTyk65AD
	w9KLAsPO77y46dBVjfggytMkKW5E=
X-Received: by 2002:a05:620a:2987:b0:915:956b:790b with SMTP id af79cd13be357-9208d0f90famr2703799485a.40.1782215808986;
        Tue, 23 Jun 2026 04:56:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:915:956b:790b with SMTP id af79cd13be357-9208d0f90famr2703795885a.40.1782215808489;
        Tue, 23 Jun 2026 04:56:48 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e3esm33561292f8f.8.2026.06.23.04.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:56:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
Date: Tue, 23 Jun 2026 13:56:45 +0200
Message-ID: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3wvmw63CMGaQoxKMqe+zRUeptA1VJy/N8n/iY8MTMTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOnR8+e1YL2BCdDR5ibKBOJrrX88tdwtIwWRpF
 Pzy/ht0eCSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajp0fAAKCRDBN2bmhouD
 1/5RD/9ZZr8VLzX6a2ksa6HXCOkLT1lX2rPSrlUuwM/KR8YPAc6qeRTydvGnY2Ig3SLd5CTVTbI
 DANVnGeKkwlUOLhTNIHo1z5SADiFiLVTbYJrYtEj+aHl6dGai2+e1ItXQiklWk3NhbcZDvLi8VQ
 Kjzf3156Oecpe3iEi8KOgmHJhHokDyWWKMDpRBddB3YXDjlqzq80/TLVeB+PuFGv3Z+8UqBAqjA
 Gg+Hpvst2Aoz2x2mxv9hLw+8EmwbZpshkkcJSn8U3j5HmDyKPF0rW5Ho0LUl6vz0BgjfpqFghoa
 aOGYbJ1aI6rl8ytcVAvmySMnTvahirKRLMIh8wv8yZlWwh8LZDbjfIj1+s0lw//WHSAl/r/OfLy
 3nd8ZDJKxyHzLvuRAaaV+nVMJ6u9WhP1uDWASIr13rCTTxaFjlSjvuaVss0CP3qMHDcu66lji8+
 yGQuIaFlok0DboJw4gOSG1de+vlxvDml5gGKWreyIphNPjzaGGDcxg91wdRlEQhCZFPeyMlOwUh
 SEbtq+bIFWkIePE/m8ddBDuCz6LR8ZHAMixghMyIBFu6Zy/u0JnCGL2aFx7CI/dtU56C03OFJCd
 7+Kf7/80tpd16ylWFr7qO7zYvsW2SZio+SekwMYJrAZcCgjtaXaozht8agu87sK3xt1MzTfMaWA 5OBjzJyODHUOuhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7481 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w2b9Q_YtGAR4YTw20V0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX+yBA1jXvGZBo
 G4Ent0UZCKBGKG3KmL0suLdm1WZO5SFWHeyn5w38zTKUnmEY44KFLoJymgJCq+mcKFyzX9rLyNY
 VeRhV7wHN9zAunDzS+bSUY2M+gkHj7M=
X-Proofpoint-ORIG-GUID: ZCfuXQPzgT0TZc66TPAPooSie1kIAkkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX4pbj6yTaqwPS
 D4dHo8cuAvFxC7goH+M47KxBZPiQGA+R5/mQ4QGtBJsBZD6CtTeDp6u2DykIgJ4tawGHulZPwz9
 w+t09f404MRJAL5Aa4rl5bucvIUS1lzBVAqHNOLr1h52wXlHrQfXuV7bcjlbafIe5JlwJdIdbJ0
 4+eck9gDc/NoSlGpZe+yn51vO8jgXgZknD7GILNPT0q96BM6wj50zxRFy1vTiKH4nv6M4ELMXy0
 vwW0bBrdvIediXtDeEmi7PwvLpxQqZoX5sYItjwXyQWzDeqxY2kdyzTqCXJNSXFGHgheWpffzYt
 trx03q5LXtarCz/caj35ASakId8bmmSvemzuG5V2jQ+XpSUNxlg+BbTrI3VVS++rg2i8fxtMZOb
 W5A+bUL1zrEp97RSTElsapB2T3HmmwZr5jaOihpZzq1Y42Hp0cYH4FVyNHpaFLsA1EXctUDVUiq
 iXimwH88y2zPhqZHQww==
X-Proofpoint-GUID: ZCfuXQPzgT0TZc66TPAPooSie1kIAkkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114197-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 588936B6E9E

Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
Display Clock Controller is enabled and references parent clocks from
DSI PHYs, which causes clock reparenting issues during probe (init) and
warning on Eliza EVK:

  disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
  WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
  ...
    update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
    clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
    clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
    __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
    devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
    devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
    qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
    qcom_cc_probe (drivers/clk/qcom/common.c:445)
    disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
    platform_probe (drivers/base/platform.c:1432)

Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Previous approach:
https://lore.kernel.org/all/20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/clk/qcom/dispcc-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 479f26e0dde2..e31c24125274 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -757,7 +757,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_11,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_11),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.53.0


