Return-Path: <linux-arm-msm+bounces-116157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id adr+CxBHR2r4VAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:22:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209016FEAAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:22:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MADlUf4F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="guCDs/9e";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE44130829CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B063806C6;
	Fri,  3 Jul 2026 05:04:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232DC35C1B1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055062; cv=none; b=qn635xdZdvJv+guKLtPtl757aZRCP8YiUDsEF8qwf08jb3vzwa+x+sXsRA/fyDWOQmERs9snfneBw4/Dacl8Bi01PoeOqGX8iE0zNcLtxvzmD+Vogqc7GJ/nnW33oTykGYmvI5wT1p6tEKO7ws3gVV7wDiYvMKQmhFMu+P85t3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055062; c=relaxed/simple;
	bh=Jbc5uj854sndNrqzn6Bi+XLo5qBoc8WY2oE4nLn0mT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiXL4WJt30XUAPf568//tHzI8zwJBZJJU9GyyzZQQVpQgS5yEG3XmTLEC1UM+4xu0S1oTD86dC8UErZFplH/jZH3KEZ1bVvuzahTpdaG90EhP+8y/ECquu1HxkpQvpz4WO3CZInq7KAwuuyPbQhQbL6J5RwUbayq0MlB8WJM33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MADlUf4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guCDs/9e; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342fXX2777619
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=; b=MADlUf4F/3mNR9Og
	BLa6LyXPg5UK+Cp++72Ro7VPdeSJJmwmUezHRLdDxeyE7FZMstbk6yHjcs/OUC3+
	8y1FL/wV+0+A9FVXQmk39sed8MLKkX44vz6jJ7B1n4kzml64WmZ2hYECBxyz5t89
	FarKMPgFxueww3fA6Wt5m/Hc+XnYaAK3kdLERvWgRDV+LmVw3no4Kxy/naf2kL2O
	mrQR1ZCpJcshZi1pELBFOoV4Hv7HJj5o7JNp2Ca0ekh9JMW0xOmZbmuH12X6XP3+
	wEOpqEFs8HsnCOBWBCBH6sn+nRjoNAods7dgNEwfQcsXMm70gwlbfHxOBHZPTPXo
	3ovHmw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so170001a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055045; x=1783659845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=guCDs/9etssFs/psewTaOjQ3r9RpGFkSWxJwYTlrhNmKaHdacMjGtpAqAJkA1L19TQ
         WEPyq5bJV5k6iC2XgqPoQsP7GlzNyF+Aj2sn2oXH7+zy6pVGGAukEGefkktUKpOs6CZx
         7R9PdTJnrWEvqtFg88UBXernkKdsoSmURZymaUxhTLXn1fsn07epLpXtd0POaajkQIio
         fACDEXAs0q3nFrYPVLf+B1camZKL2dxgoORvYPuefLBbHLYxP5nmFr1y+zUqcJhDSUNO
         OeYq78Ixi5WYp8sqq+a1rVn5lxJS+hgyK50dNsyo/7427+S+uIzaV0s7aYWuZ8CsA1vi
         QLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055045; x=1783659845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=lNYTsJA2q+tSzZesD5JjC220RZL9TxtvpCH51DSXaSlmODxUHN/7bKvuduXGFjhviL
         7nfj94Di5ikEBn5zx4dVYknBelX9HZ5ALTgIxXY42s92M9xAggQqGbcU0japPGrh0/Yf
         +CIZBH+pwcyoaaeKy541QF/oAo3IFUtDkLkgpHHI2SUUHeDLM1qs5ylhlHd5B9/8ePSG
         4OVCI+b0JZHsRR3r4yBlpm0UTLiWwMRz6FkurLtrdOu6sUgAlupHWOA4ezjz0f6UDL2i
         CLckk2m06Z8YhBlO5/Xc1dyPOq91TDOiSfSF/mdKwo4fSkXBXhr5QODVOpPhT88hje8x
         duZQ==
X-Gm-Message-State: AOJu0Yzg2I2XhuyJf/P7qCD6kjUjY123/orTxfPZttDahcYhTLiAWRwC
	DNqt703KqcmMe30wnY/uuCfmlBgZuMX1BkX5LBxirK7IkLs2xW2jFIqtFY+oYD1M59CYSH77Kok
	uw2ee0oGcKYnny0DpUGhVY6dJD1ctC5od2Po8GrovoSZ7+B3nLrR29As+Td/QdrmqOjuI
X-Gm-Gg: AfdE7cmNAR7ob6sRY2FrZiDBq1LC6qtzpsruyPy6HU0R+ZtDsTq5jp/2YJeIbmevfpZ
	J6l6C+9f+/HMWR432nz9XLDbepp/IRgfSf81yDx4pbxCW90bQZzIaGPPNdY0hASWZwZNGIUgLxj
	NZx8J0fKyPK9s2ltUFbWFsG6JdQlvuk/fYPYiyN3A/fIPboY9TIBD69uCxVWB/8+/d+4OhRU0YT
	jLVPZx8QSUfe9dTtjH2Jd26bMtdutg9VHxg8J/JhSksrSP4AwYbTqhdmdS/fFVb2cjlWPY+2DMu
	xfpzJO1+yuGk75IzEaP2N18f9cdEs7Bk+obz3ZWE7QGv4eVDwyD2rUmI7/9jkqC3oM7HgGa3VVG
	3O5r+x1nRd3bUKtcdQdsynsBMtp1rwzDK4T1p3UdAxuEtd1W4h02VWCG16MQP3NzQp+PW5kwJbQ
	RntQx1lX9BAT8CuHJAWnQIDw67p2Q9fig2bUyOsSjE
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848893637.51.1783055044699;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848855637.51.1783055044181;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:48 +0530
Subject: [PATCH v3 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-2-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EqEqTfwXvlj0V7tCW4HNpnZgeR-Ih_cG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX1OG0XyPcsIzO
 eV7QDrzWGT6Gx0Jp/nOJF7B2ckIee/ywrbuMiziTlJBoLNOmz4llPOoIytgpqvPSN/uZh+ya476
 TBJRqNQAXiaj5jYEWgSHJl8w8xiJ6CzLNd68rtVnhTSF69w6LPrLXHHJ5ewTPeaTXA2EATk7n3Z
 VWxjFCuArT+P+jcymKg1UYl/hIoYI/Bx0dnRDfaoVfR+QdRRlK8au78oWxAzlOYXFQBIycWT4Lo
 bEYRW7fkWBtCzC1T8RTCdYXT0aWTKbVR/2RNZMiG3cNGFoBxi6Sb2mm99D4TBE47uTn/L+JHYKX
 CAOAEBKwbMt2ZUCbTutJl0aVfZCdpnANGvcz3HmdgX0lapHZrOk7jKACUChwJBGKrbhojhmxu/c
 sxejNWL/Vvn8LySiVTyLB8pG0VXXbUkVwk0aMZlcJJCUYa69KKkHNY8K8mzISLDrYFb/RN8LJ3F
 QDgiTDZnhTodkEx6TWw==
X-Proofpoint-GUID: EqEqTfwXvlj0V7tCW4HNpnZgeR-Ih_cG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7cZRwUAJ1bWE
 SNaW53pCqJUMcUPammIUo5liF0YdQofRcNvgX8XONuVdRQ93c9jqo7SjmvvHOntj1u1N5O82X9U
 GzIA+HrMw0XJ65f9WFbaUEGaj4+HqKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 209016FEAAC

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 3a8987fe7008..5653bb5e93f7 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,6 +79,18 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+static const struct alpha_pll_config ipq5210_pll_config = {
+	.l = 0x22,
+	.config_ctl_val = 0x4001075b,
+	.config_ctl_hi_val = 0x6,
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.aux_output_mask = BIT(1),
+	.main_output_mask = BIT(0),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x400003,
+};
+
 /* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
@@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
 	.pll_config = &ipq5018_pll_config,
 };
 
+static const struct apss_pll_data ipq5210_pll_data = {
+	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
+	.pll = &ipq_pll_huayra,
+	.pll_config = &ipq5210_pll_config,
+};
+
 static const struct apss_pll_data ipq5332_pll_data = {
 	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
 	.pll = &ipq_pll_stromer_plus,
@@ -207,6 +225,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq5018-a53pll", .data = &ipq5018_pll_data },
+	{ .compatible = "qcom,ipq5210-a53pll", .data = &ipq5210_pll_data },
 	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
 	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
 	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },

-- 
2.34.1


