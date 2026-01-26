Return-Path: <linux-arm-msm+bounces-90571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJoHDS5zd2n7ggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:59:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00789384
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC90B303C514
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD9333B95C;
	Mon, 26 Jan 2026 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckCRJ5Jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZUGj0u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D003370E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435799; cv=none; b=rwD43FR4iL1W1dh8CcN8CQHeYfZq/oVb2shBkIhmH1c5Tx86B08V52oTV3zNFF6AAgteQvv1VZAgOgU/oE7yw4Ru8/FJiWv6tj1ApVGAVxJ6Jin8ux721PPpGIoBdqVaaOT/c8lhIdgTiMY7MhRdBlaqYorbaWwd6wkRzH3snx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435799; c=relaxed/simple;
	bh=txDF2VbreH7ATXVVZ4eKPveJuiE45s0vBBbQQpoA8Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJ7cPfJZiwF+9J12RLuGQSKSs3AQFvedD41RFDEdLXUEnVqn0fsjbzNnRrVzEXwYBhMTqz0DQqlb1kRbpOqr7LdDh6uhEf/zgmg8M3WL8mH7qgVxzUrqgtSjaLmkg6umtMTW5R9N/KL6aCnjCJzRVw2xjgRNZR/U6Y2L3KcEyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckCRJ5Jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZUGj0u0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q98edC767910
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J562d/g4n4ipysKxHIpufzsi9eskrVZsL5H
	jv+FXQPA=; b=ckCRJ5Jf8LLFBp1OcSPck+O/l7LbMETTxW+NaPMa183YueQiVsG
	RCfcFpQ+FD54qMd0rDgsuv85mOysibZPqvFzDmcqwXe1TDS8ZiAjd/Y61v3B99IB
	U8ZvDSsrd2Kc8+tOvMccCsPPT5UaRjS01ahRAE9l9/sYunzm47oKE8uV0EH/ZvRk
	2okynVeCWvsZgnUrTz/et7CNOhiHkJoherRIZXsWCWUf86/3yKezwLMidRQbs8+c
	X+1i/KQXuxia1C3sehPZLMzZacXoYz4zJfhoDEZF+CzRGPPszWPZjWYAJrqb+9ce
	q7OVFsja8+SRAUZuDrcBoha7d34hqVBYXdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qmpj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:56:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52dcf85b2so1707748785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769435796; x=1770040596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J562d/g4n4ipysKxHIpufzsi9eskrVZsL5Hjv+FXQPA=;
        b=iZUGj0u03a4uei76CvOud3GlzcoZMPv9TnDNTwT3dNDzT5jEsiQJWGLY5YenYgQ6Zf
         u9jaU5ARrYYpMyHP0deTWglNOjf1mNhgEbhFZ7QR8KE6VLsKj5ieOzCHi2Q4ttvidSZH
         /2LOyDlCGpTS42qd4arPklUFYPhJaeHX5p//nn38hYGsAzqXsOms/cQVhwCVEZw/qiYM
         p2u++kvUhZNHq4lYWynoirpToWK98hUVtlFNBhfp+/gtFRICzR7FR61JBOrRRFVf3d/n
         QyzFcgA74NFlt3z16IFbKnLPZH9Hzh4SrI9KPIAKgBt/9ED0OyQo2HEaWfjiXLOiLgHP
         e2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435796; x=1770040596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J562d/g4n4ipysKxHIpufzsi9eskrVZsL5Hjv+FXQPA=;
        b=KuqFsd3qcD2joD2CEtGjrT9dqb9ol7dpliSGhBfN+yE0t+xgbdcadQKF5CQYMqFewm
         ejdNGyEDgn3J8zQ3pK/odtf35eiPVPVPrfT0dDRfHOkufEKdn61FS3EaxPO12fMXBhKs
         dYghw2cLHHuTbuegLe7AjVL4FJWv8VYKh7ar/iONo6uPslcqpnQtg9tg/Y5Bd5ag1bCO
         aHDQEVsHN2oZoYasucq3Ehobnl4+KWpmkXuYeY59l3koi0ueiQ/BH+Y/NJAV+NG94eDw
         PNoLKEyhJL5i0EXAVvuOjBrmoi3k5q9je+/mYa15oH6vENdsntCUSsBkZMHQCzULskw9
         OFVw==
X-Gm-Message-State: AOJu0YwrHOXy4zvxalJSeq//btmkdz+l93qUbcRDlqKgLsbGlVea1wFh
	fT8EA/TnhkhYGeTp8KO2oKJIXYvpqqPkVNDFqU0jY4O97tPyByjck3W6fdK7ve+jUoSMLUJvhMd
	ZrWsz0Xq3ZtNBtGmY7xVhXvcbiihpia1j4zloWtKdFHTIyRiWQEqRYMezb/OA1lG+vNR6MhBRmz
	8q
X-Gm-Gg: AZuq6aLJ2aTG2VFJbs9ViBZikh3VeSc9DEMsFrhqXdlbdie3LQlyu1ZVBc6KPnwagVc
	6maAvHIpR+uG+z396VcRsE4iDzXF7iDUaUHkiDfHkq+14zXL7oePhmosc9GXUEFL57E8YNzqBUt
	GynH0DNf1CB8k2XWBnrYIDDhKQPbP+ZtVTJFo3Cb1wckYDCa6e2S4FmDUshINRXOnU2m3JTStGv
	hGQxoUlIORlhJWRPZakp2Pk0T7vGO8sW0ZBiON6Ol6o3hHBjVa6eP7Pm/Q1hZaHlRyE1IGaePXP
	Q4RChVBr7OBxXKwVin+UvaQRx9NzyxomyCOpEtOFY0SymCrYX7geDGlf/6I/NqkVWnxIPV/UJng
	rpDazMgV+rYXIpPbNhS+03yPXqoyzrJbq25vQ
X-Received: by 2002:a05:620a:4711:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8c6f95729ddmr513139185a.14.1769435796295;
        Mon, 26 Jan 2026 05:56:36 -0800 (PST)
X-Received: by 2002:a05:620a:4711:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8c6f95729ddmr513130885a.14.1769435794810;
        Mon, 26 Jan 2026 05:56:34 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f289:66bf:968:acff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02f71sm30738644f8f.6.2026.01.26.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:56:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver
Date: Mon, 26 Jan 2026 14:56:27 +0100
Message-ID: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DJpleHE91-AC7yez8I9SjObm28LuDVxu
X-Proofpoint-GUID: DJpleHE91-AC7yez8I9SjObm28LuDVxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExOCBTYWx0ZWRfXxytt7h832+m2
 k7DCDpUS00e5ZVMzNQGbe0Bm438jrwktuGc79qOhl5sCdVmiuqXvqFIj0TzuGScV3VhbOIiCoBc
 qHojIzgr3Itzkr8btRqcJYAOyKATosoN3Iln9crO3hQYNfUH/mNatUfJieDT6ypr8zOSVmSXfnj
 u4i2Ndb6uYNqwOjsbK/QtyhHFvSwb8/nZGUlAzYi0SxdZXrLbuClJfa70Z8HXhyDPDFq/+JLFgj
 1hhtnbhZKtDL/fC4GQht73rumgVP7q1GrWPCM0A4xRQ93pphxXZqSzoSxWudQ2bKzTo81TnPZtJ
 uCo3j8sWfW/RnuWPwHDlcLE1nf0g+1J192X4fPFznyfWhEAZWHRD9q/jjbheSYnzsakwIt1fFVK
 sJrNLg44KrA1Rwz5Qr5fcTmEORqVgbTS2MMTMkC5Nd4vJFjsj23hgITtOq9p6vuZ5lHpSGA/k3x
 EFxkHPJLcnRmGBYlRsw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69777295 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FtTykWrGNLgODoecdScA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90571-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF00789384
X-Rspamd-Action: no action

GPIO controller driver should typically implement the .get_direction()
callback as GPIOLIB internals may try to use it to determine the state
of a pin. Add it for the LPASS LPI driver.

Reported-by: Abel Vesa <abelvesa@kernel.org>
Cc: stable@vger.kernel.org
Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 78212f992843..76aed3296279 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -312,6 +312,22 @@ static const struct pinconf_ops lpi_gpio_pinconf_ops = {
 	.pin_config_group_set		= lpi_config_set,
 };
 
+static int lpi_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
+{
+	unsigned long config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, 0);
+	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	unsigned long arg;
+	int ret;
+
+	ret = lpi_config_get(state->ctrl, pin, &config);
+	if (ret)
+		return ret;
+
+	arg = pinconf_to_config_argument(config);
+
+	return arg ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int lpi_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
@@ -409,6 +425,7 @@ static void lpi_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #endif
 
 static const struct gpio_chip lpi_gpio_template = {
+	.get_direction		= lpi_gpio_get_direction,
 	.direction_input	= lpi_gpio_direction_input,
 	.direction_output	= lpi_gpio_direction_output,
 	.get			= lpi_gpio_get,
-- 
2.47.3


