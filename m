Return-Path: <linux-arm-msm+bounces-108162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOCFFFTuCmo89gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4B56AEF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AC8230F64DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB733F074E;
	Mon, 18 May 2026 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdF8qLkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE1vfoa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516B3EFFB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100508; cv=none; b=lxuUJaFs8dAJIbJv9qJGpJtun+ebdyAu/enUco3oiecCAPzW4eCzEvzwX1WOx0dwxkdCDaYjp9bWxzviUgpJZRIR/YQG2k72iL1XUZhcAJoMZj9PTrMFSliatAfOyZLaO+3wJQH9Q7CPwzTqtvtfvPbv1VrGLBtZ/vHGAmMVQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100508; c=relaxed/simple;
	bh=Ir3Vc68TUfNFyZZdTpS/qqZD/AMADOKm17xOvscfuBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgCZb+iWFJrUkViILFh0VrUua/LB1IR91h8sk4GSwtzt7Nf5naqbzqiH8vUHCCdnc6vXYXb/c1R88o4us28JTyDw/Qj0iQSXYUmSNimXWB5lNxRRWHmlV93uLZuRwsxcC1OrNDN2tDXnOqcmV+Zm8TCmfy8f7suGDbx5k3gzZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdF8qLkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE1vfoa3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6vo1E4177759
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=; b=WdF8qLkGV7ec6yTA
	HSxxF7o7iypNfIdJM7kZApfQzPsml1WC+EnK91EVsNyCmeJpZ/w1tGraBzAKywA5
	QRXcIFTyh1MGV8NU8i1mz1BTzH1bpvRByoR9oK0AstgtPcbQ6kzqERTC0R3DU7Py
	6+oPTWYhdlULLpXP6fTAyZJKJj0htU2wNltFqQXJztffSykPALDwsGxJu7rKk3+v
	IC3A/mDCw1Z38z2V6ZucHcXsWIpLBRw6EZ/wazVZO8XjkBzSls9t0wK+KiggMoD5
	byFX6NIr10BfLHqVQ6VNDICYtXe5FLrFBLGulLOb+Yt78sKPIhcOq80XlE9rISNn
	clInkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g60ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3403e99so63876801cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100487; x=1779705287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=;
        b=EE1vfoa3uc5gihAE43IDwuhvm8ksDmfLrIXPxXdxEopASFGHxcJ4ogu8RWcwQr66fj
         2fKlaxRD0hsUPNIk0lbQA6msV4y2eAYBe65vFjrGbf9NF0SLt7j3LyW00wxqtw4xnhyu
         +oHEroVTflzGHO4W52mb2s3HXbswh4aACOd4jqP3D8p37O3rTAV1JXF9k3diJ8ixF2Ys
         xSf5Sxe4iA3hBIscvdHC7cYYFzra4YcSRFz5HIS0s0ISZudJu7z3w05rVfBH0y0UT3LM
         FcyYpt7LO79y6avbTSMnwK+BTv/qFP8vdg986MsR3H+ahqaWeBuWW4lJnbp//9t0caf8
         ZL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100487; x=1779705287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=;
        b=M5vlyFLhdZyql1UzHzy/1r0kr0ovIvuhK419p8staZRnmFcN31W0qAsm/NvSi37U60
         Dlz6SP88SSZGqAQhNt4X1CufuQQIHEhWppX3heRO+OZ/+q39W/0h4T0RvYNwWatkCmph
         fTjkBN2Z/SSYDkZ2uuUuwsDUNZ6AqlgjBykdW78q95IJQEkrDNlWAkayEvq70rmb/yHN
         Se+V7d4JsPCrnuRuIWe8AQu5N12MbGX67Jf6qgXfyqxNmY5WcGZ+UNcp0cujgDQUfYT2
         GUVhDkUj4OG19KAUNLigQeHMCI56UWiUz7FxqlRN7UoLseJGodMB6P7m/XiXbTuR9CB4
         xzmA==
X-Forwarded-Encrypted: i=1; AFNElJ8+s+LBGfUZinJ/1ix9wKLD0be2Nbnhy7zWeR04xXL/Y6Dw8rxvff+4wPtoEIvJgeVngYpowKxClOZDp0vI@vger.kernel.org
X-Gm-Message-State: AOJu0YyllKjValhEn7uElZu3tsE+TW1+hrZNiHyWbMPcdsJBZsvSEGHN
	fMBJPZCBwrYoJWOgHC8zLDcc1sr+4LU8ga+1VFfYQbZeeyPGGQoF/mqwR+1nvUwn6YzRQOs94TI
	FyhVkBidbmtXcEOfQz8oP/UrG00HXz5aXkjGz3oNVCvPa/3CUz2Xa2Rd2wOeJKz2WGZ7+
X-Gm-Gg: Acq92OG6SCII9zOk/W6X/wGnseqsYL8jN/UVkKIp+1DXNFbEahTz9xb/U/scpSAnh9i
	2lIGX8p3Cf5wPLfPhwyeFGgMrEZ5cp8dQ8VPe4yjGuObJ+LLrEViIoUHl8AkMj+/NxcJ/czY0+p
	cF0G3qnzstLx/3xG2dysFxhtFAW0lDtP/NkfXFCb4BIJHorhbE3oGxcm8ooeGf66F/o45as97Fd
	e/gMouyn4ahxDFY029R0+RUcmGf3SzpSsmB8XamyXLPA+ve0CoEJGmU8ePhbDzqzeya+rzy46RK
	FP1OA1YgO8kxsbC+i1V0eUrJv1ebpUaH6+WuN6v1Bm6WbiqG412RNsWY/7w0raxAhFWBQXtXY5T
	ouAhzT+AkTAtiFGcuAjwpoD5KwK7spRDfJ6UXsGq3A5XLrJF65w==
X-Received: by 2002:a05:622a:15d3:b0:50e:d316:fa35 with SMTP id d75a77b69052e-5165a0cc90fmr202910471cf.36.1779100487500;
        Mon, 18 May 2026 03:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:50e:d316:fa35 with SMTP id d75a77b69052e-5165a0cc90fmr202910301cf.36.1779100487085;
        Mon, 18 May 2026 03:34:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:34:33 +0200
Subject: [PATCH v2 2/2] clk: qcom: nord: negcc: add support for the USB2
 PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ir3Vc68TUfNFyZZdTpS/qqZD/AMADOKm17xOvscfuBY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCutAIZqDIFql5Y/yGnrTRqEZPJF2hoamUKEZX
 vWy3htrGweJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrQAAKCRAFnS7L/zaE
 w18oD/9dVz4awfDydFBDu4bNp7IW8HdGb51GI+Y84ffxxDWflx4As72/5nhYyY4MmAbz7CVORVs
 JVADBTe88ApbwgBIHpDXQgmui17SP5FWHGTW5seBdpv3KLDWyVJeMpDQyl46lgQGUU2/57j7j5z
 u2OO1i9zRrTlWO36h3aIXuyBhZsWcuAoNGgMOt4jm9PiSesCpvO8rFrB6DPEaXSbx5jVDp1L55m
 jU/Fo/Pu27dhJao6KKxblcygBxvbHHvvgMW2fGsZ0Pz9vEuZR1ZWTz70vAjc0t+tmtFrTenRPrw
 QmSjpESrOagw4MePMdU5bztzDHzEMAk/vkqGAnlkB2WWAzcuRPqPYF7+ZOKPGdLgliCef8NKdQZ
 i+LV+mo/TUq5sK6SzGu5nKg8wPBN6ZiCNH3pelMSdgK+kaOl9a68QwKozpiRi1vqIyUTUSvtWdV
 qsK6nKHfGKr+rnNysmJfzl6a31J58xiLhetFmd2U+Tinypyc/idhOYVbcyqFPHwPCf3URi2/WYd
 UVUBuLD5d4f+YAEqRy+bmhqzyNoH7VfC3QuaHfo76ffcg5Zh2sRAGUOkLiaIzHCNpAMuAu8M9kp
 w4Nb7ynzx+Wo9nYS2g7uF29wbleEzbEs8NCJkmmaQuO0ZNc7nNGQCubD0LWIFFvhTJwWFrdpzG4
 I48WZN7y4Tzmjfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX3uIXZ2HM97eh
 e2RhFGCFjjGcMZkuEzkjWWrNpANTlRipPu4+Z/fd9n/tiYvBGCbSYzK0bpyQpF0g2+VpP+zVTy7
 9aJgY15FyLP/1cG3bk45nFMwPYVIC5642k9e3XDOv2DywOMFmeMEbkcs4OqpcVeugGB+E7dzGpc
 SbG9fErJmCVf5P3YBDJm6NoDFAU92BFHZb43es6fwi1W9BNoESqUkLKuX26fd4Egfc4o7e0uG+Z
 6Lrp8IqhZK0dUIVwZe/Zvx9bSEPKwEeMxKR0hV5VDcdt+iOQQmfXHHX1YashDC4MLVGbH4OTlqf
 KZ612HKV5hc0qbcrcNWncsv4q1v0M/HTkUi02gIcL4TqZ7ho6dAnEaiWsKApmKfh1L+gdJp57AK
 H/PwKK64HPqumbRlaL953WegQ2PWVYk/CX0vSn8ns2nqdkxgm5Y0Qx+qdrX7itfI1W21+phj/nd
 Rx9zf2mhsTXOdYg6+1w==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0aeb48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gjOyZiz6IXqkjem99UEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: fLwfMQ4sF2bq2jXO2_sOpTMirPIEYyXN
X-Proofpoint-ORIG-GUID: fLwfMQ4sF2bq2jXO2_sOpTMirPIEYyXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101
X-Rspamd-Queue-Id: E8F4B56AEF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108162-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Expose the USB2 PHY reset in order to enable adding the USB nodes in DTS
for Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..162b58800d3d9f4a6a619ba98b471a2511effeb8 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+	[NE_GCC_QUSB2PHY_PRIM_BCR] = { 0x2e000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {

-- 
2.47.3


