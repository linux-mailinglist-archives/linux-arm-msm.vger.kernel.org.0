Return-Path: <linux-arm-msm+bounces-105992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFHAHX8N+mkRIwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:32:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86E4D03D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B1B3051173
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7983E481FB3;
	Tue,  5 May 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iz/vDIxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wj11M4xG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35D481ABC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994960; cv=none; b=IR/y0vhRxUXaCui9j2AI5qNq2rblohyjqZlim5VxYOW5BaBCFKN/MNUmBwkUUVrXYsljH5kIFTcdJ/EZsOGVkfDDF/N5V9dVfRHJtWcdqsPn9AxCAyWryoghcAKNl7mQeuEKv3TQwB9Mjqnj83pPKYYtzqNdcZuiXyVhyT8GoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994960; c=relaxed/simple;
	bh=nHnStKl3uJBuouJWIi0baZMrwQ9zRSm8k8wt5bYzhqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLNcLi40wl3rESVgAFLBV5Io9gF+HPp6bkjJEABtrbpEWki8mrOwG+6X1JXfKy0HVbjq/NL5CvkrgJpkLdpkWEP6dyLHMCYPy5sn6cPAqDU3pTZwjHPF9HiHiVLPY5Krwf7oO+9bYBH4KM0TPnK5nUVhc4dqG0f/k/7xoZXvBy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iz/vDIxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wj11M4xG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6NOX3091363
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 15:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA
	/BRremrs=; b=iz/vDIxvqM9iGViQ1PAlpOWLUy4lPCkaXq4hLEZJKVrncAWgZ6M
	ImAtZwuXwod4JOuw9zcRGEcaJrroMAB2CrKVSZB9/mEa6UYSFrYYACRKbTDUhcOf
	bq7DwpdvCcHBlWcG3qt3mLXlhGzLdL+0LJFl/aUGRs1U94poddbsKGDcld4aRtP+
	OG/Wmo0+esIPTP1iHLfP1KQptu7EUo4HGLKf7U+Dv4oomTdVgAshuM+nmydbXIgP
	rUV8S5kf6UbC7jBoY1wCq8gP/jdGpMK08EbfipAQybU9CCHDbqdk7lFx+twQCkSc
	DN1hGY1N00z4475s0ToQChoHB8OoONC7r4g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct0ykd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 15:29:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d1b7487caso3796363241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777994957; x=1778599757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA/BRremrs=;
        b=Wj11M4xG9IZSwsixLLLGKze5pz8lvFrkKzaHcByhBo5GYGSoHhonsPpVVu7yL2QtAy
         crqfrt0TzHeO2dI9M6rrjwd3FSgl9GHxiUFQ9mw8lu4qbhFGm1BiDCTDE+XXt056cifj
         /8BPMwoJPojok85P1ZQh7V592sNlgGto6irmc0wGJuER79bN234mbQ2T4h7uhKIAs6ND
         uoARGNcgs+PZk42KSC6vc8m7b8x/azR1yiCzZ4rl5VgHLYxkHT7WXa/ed2Ht/eTdhrMb
         tIF4wgG7bFDFYYa6vN8ytnZH0KiOZFthLoTyuU42BrwpciygGWuT6DANtWWfiRdvgyx3
         pwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994957; x=1778599757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA/BRremrs=;
        b=NF4AAcoVnrV0tStMUTs8wS8WR3n6YnJRDEn1RLPI+CGiBKG+fGMjSbh2V4dmr7L2c/
         EcpZ8x9zRTJ3jpPqa4R7VQET1GlnlAX7d/hnE0ybv0xo66OfQdjQ5RJfo8vR4JMz+x23
         YuFmgSOXXxHimGUUL+HIvX2ikmiRpyEBc3y6JJZFoqgpD94WgfxzgjB7grgyChrFocLK
         EvcUfK04J6Aq3faAZqbPRDwwTAyyf9nPfy8VVG7YF5l3RpHCcU14i9WODqUuZ4+r96pO
         cfchy/dVvpio/WlCRDzvfTvdHBni/WMM/g1QrVjUxEaYqBsFii2xsd6Kx/gHHjvv1/q6
         Eryw==
X-Forwarded-Encrypted: i=1; AFNElJ9lhc1NJn+q7E5+gHjo/qMjNh6pTg1s6Fao2gdkhQDDzpyOAlocQOLqsLrou2xhmSBcZaqLsDu7HBIgdUOf@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOgm0A7whBqsbct8Ec8GRT8ovXOv/ZJnxMvi0DAN85fkFzZfy
	+u3/3b8Zum8T/ueSUr98VaoBtgaYc1zawU/hrV9bEuaJ/b4MJFFzQN/Mg6cqtWlZf/mvIC5hv4u
	sed88Vb+EZe/T5Eje21VI4xMekrzBJfZQC990S/DyW5LwCGi+BL11ZXMWUkRo6ujiyFUW
X-Gm-Gg: AeBDies4sv6bQUjYAq6z9N/xirHXnTJNtcY1T5UsIJwAtjDI5TqXQ2ZNTIhdGBR0Bf0
	b9EwckoXJG7sL+yCPk5OXUCz0RyYGmTeywVlxP1XoRpcopicB6X4dV3J08Br3G47d2nHyeLcLkJ
	t660j6v9lJD2HXkslmpK5JiI19deyRm7/YNd+9j12VwXZnWfXlImHtKtFQpBHDsHA0jKFIO38J4
	UcKEUVNwHyyAOMyKztJkk8LVyH7g/rTkJwsi7Sff1bCe6pKs2/Kmr9meLPXxA4PnwocgPQyRlAj
	+2soMpd/Fx0lGATO0CA8BS6r5aTleOT/Wc7Ek0TGwel+IlQmdeY8Wh2Gt99AwzHB0zZ8MBVWArj
	wlIlJjAciBiPzj8Fd5Uq5pif4HmLdFCguqb2b4QIps198h/A=
X-Received: by 2002:a05:6102:c8e:b0:62f:c97f:aed1 with SMTP id ada2fe7eead31-62fc97fb58bmr1322659137.26.1777994957136;
        Tue, 05 May 2026 08:29:17 -0700 (PDT)
X-Received: by 2002:a05:6102:c8e:b0:62f:c97f:aed1 with SMTP id ada2fe7eead31-62fc97fb58bmr1322484137.26.1777994955414;
        Tue, 05 May 2026 08:29:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm5469103f8f.7.2026.05.05.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:29:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
Date: Tue,  5 May 2026 17:29:09 +0200
Message-ID: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nHnStKl3uJBuouJWIi0baZMrwQ9zRSm8k8wt5bYzhqg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+gzE38I1YaUUW1VMQGQgFWTaZr7Yxpmp0PPhR
 59OF3l5V9WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafoMxAAKCRDBN2bmhouD
 19q+D/9xqUJPUdhd5zd+J0k12oWzx1QR4nReESffrx1EDErTSGQRGS5xPoEh8jmZ0psw5yQoZDg
 qnWI/iRHuCy/TM2Pv0/mszp6dUhgGOvQduuZtrcnWyhYE1GKgWwwGF5ZN3rXTsc70bUdbGLkliU
 SRtov1DVtL5LrlF09uiqZ3ImQniF3+w4GpobgdtZ+1lGMGzXSOjIgHznnkG8o8XIDmMIaIGm0mP
 usXIoTnF/20tVWHnY0IayPpZ/lDpyxv+2rYXnJJh+N4dcvT84Lcn92wXmr4NyfMmYKlgsLh0TvG
 M9/IPWVkIT7DqyXHfwlLeQKb/jEZ2pm5lgUK+VvU6TizXXRF0VVI+V03P3tR8Qk6VMsTJqD3mS2
 zKUdrj7337tlwV6AIWWHO2X2mAyGqyksYXy6qo3NT0UD7Xwi4vU3FyDIbCykYa33xeo+IqKnhCo
 lkk+yFgOntkaqym84T2h0eLFhzC5uN6QnAe33jWIqgHlocTuxlrYyBm8QQvsfKmOXzHHhHgRsgS
 0ujMq4/jSI0nQxt+8kImw+IIISX6t0Ej6sK+q6J/Pm1kvKFIGKhHoQQP+qdUJAk5UvwPV3gFfH9
 7CHDVU3XMZEX4urURCyNQBhG8oj7m5tlhFrRgUf5YIwnBNbe2xY9m6KHgR+WnGs/n+rdzQYr5La 7GvzKz8FizsUX7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sJd59bGqGJkp9ZfE74aRpOXDSN95EsK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0OCBTYWx0ZWRfX49Mu9c+SAdaY
 deAvpaZXTN66bxL/YxCwtihji3cKXAiJzK4I1Pl03iVO2SIW7NiSeSRtdk+3Tp5CreHj+4oEspw
 OHiC/NhSPtplEM4k+ZMiwr6EgbKohc6gAy3HPt1b0BqIAX+tC3wY/hprJHWUC91MShPZorpAqam
 2MFTQXVaQkIopl+qbQtuyiSMJ5Tef7vK/0l84T0aEr/wxLpYeVwpyj5Xn3tcmas/slUwWj3/9ey
 Th17IXix88wyMJjEdSKEI9V1tBMW+s38dOJpj2KzlkNm5hSrR+lfCHeb1ahg6BXsyRZ9o8PaNsD
 mRYkz8FJPTDfJjvwEhup5Iv8GkgHpQRf5nKIL5+sAAxolQe8TKqOpylhqc9KPdYrm9O7tHsW0Fm
 5JYujFS7z6dEAZ/JsXGcp8mi64zOee2aDKCvcoiFRhcJzb8pmwtt6AqsHHHF3SAE+kvrFsK3ohX
 d4nwtZX9vmClCqmqlcg==
X-Proofpoint-ORIG-GUID: sJd59bGqGJkp9ZfE74aRpOXDSN95EsK2
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa0cce cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=vgyWbCOFeP7allhJYfgA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050148
X-Rspamd-Queue-Id: CA86E4D03D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105992-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quora.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
might result in synchronous external abort, so limit the regmap to the
last readable register which allows dumping the regs for debugging.

Reported-by: Daniel J Blueman <daniel@quora.org>
Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Not really tested, just idea based on sm8750 and datasheet/manual.

 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index aa7fd43969f9..575ba90d2070 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11008,
+	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.51.0


