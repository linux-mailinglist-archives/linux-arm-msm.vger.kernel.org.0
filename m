Return-Path: <linux-arm-msm+bounces-102881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HRSIaaa3GkxUAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E120B3E8319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3067300A109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FD3392C46;
	Mon, 13 Apr 2026 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgai4nus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEFsjlgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D323E33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065112; cv=none; b=WApmLJNgCjp6in3p+cFH68XQpPPegTXS50+41rk8V8kfFi5oN/Fs3oHUkilnS2RmCfbaU55iJTJGwuJf3AZttjIbyLTA8CKAMxB1T8nHVkKnRkc4bPpFyzm33Tw4+Ka52QEjU5JzKkowW+mW8BDxz/ili1MH3NWt/flOUNmOOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065112; c=relaxed/simple;
	bh=/gtd8aLCB9UW6v0B3NV0KuDTPl/hd1xhXaVtDL8mtZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ap5CQ+8E7qaeTevWp1z3OiJh1oIgzKhMMkYjbGl42qjkoGMS6ti9+NCEXNwGHfqBUZBwJkrALFGU0TVGgqr8YbDojDq+aDAZQpFn4dGc7OJsjR0zuOjq1uaCuz6VAhy2sWPj4Zgp25Np+pQHmXMaybYKA0M/VIIJLJFoXqQHtj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgai4nus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEFsjlgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5sdvx440447
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IX3mbVpKI9CdsNJH+rUEyMRL9sYGXmxL7J0
	3WUO7FHk=; b=jgai4nusubaqiQ8fkdYzW1PVWK7coiNx2lYOkwSP/lhKCnYExVA
	rjDB3FYzOJnpcOncO7dJATPvpdkz2Bgk2WhfAd8PfHCA9CDz9DT/+mCQpFmy8DIi
	IUzVRqrBydA70wdr6CtLGSbtKP3nqiQzDBOb1WvcCWNbG6GB/F6tH/ydAdCa8Hbo
	qpE33xrRL+OtEjfcw7JrbL8h8/1/M1kZS8gPbuwW4BGKEqpZglEnGUftGFJt1CoY
	A253kLfpZlEHPgdNXLO8AZu/+mvK8yYvpUrUZuk0Hsyvm3WLJcst6uZb8NOEqtkK
	/Fe7JG+/il461bRgBLKQAXyk/3e7Og+lPdQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtm8v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:25:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7691378914so1623549a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776065109; x=1776669909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IX3mbVpKI9CdsNJH+rUEyMRL9sYGXmxL7J03WUO7FHk=;
        b=NEFsjlguvXKJOWYx5akx+XX5/66I9phvPn417to84N6le20D5l3EMNZvrzu6Ic5MX0
         /QoCxSTTwS5Ab2RI7RdbdiAALKHBABlskmtpY+wkYNKpj37fm7cR7HPjv9o+TPkqkCKH
         FC+uBviMrI3oF4z41scbP46Q2HZ4AyfkcwekGL3Ct/lj7YHAuV2xT6Dpv5289eICP1CJ
         hLlHQwtTphp8zGMzSixYqgTjgTOlosuIWxKkLj4pCOdWzVgZzriJ+jqih13uwpWh9IgN
         GZyp7++4Jqts+hQKsw8hmycUl9epmnesMnOX/A6oe6hdavYqyvq8VYHqnf0q6SKefQdX
         Ormw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065109; x=1776669909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX3mbVpKI9CdsNJH+rUEyMRL9sYGXmxL7J03WUO7FHk=;
        b=ajCaaHi2NxLqxXlCszNd0+fgqErcxSInXhHaRsQsvT8GpEnf9Re7ZCBp9nGQy2KrMi
         tL4TvQ3Pz+ymhYoRWiCqyrnmFxlyb75xhdNfxd+Svp0ZGSJh5CAiifpUnvPVukAn3rDv
         6MsF13roTeT2OaxqyfV8qL/NpBK37IHSSgJt6echJ7nsydCgGxLUmbaHE5XLFFhsl1CD
         /Fowq8cb0l5NaPNU3KVXn6i4moJxw83MkeZ65ViFqQW19LfYyYVyryjAkZFZtkHFr/1Z
         54AG3UX9XYZnGYP7xJ+TS/OefOB80+P/MAec7OQ0UdK0TCAJwJgRvtoamg7us2VlORnY
         q0mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JRC7/b+C6pAGYzH5X0A13Hr01UR7hemNVpQjyIXvT8iQAokO271PeVzd2quqw5yAG3moBli9gD9rHVomP@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrWuDKic0zw+pjYPCT69+I+LMBW43zA2fzWY0wWvluXPrg20J
	RVzAGsw+ldnE+XerpiruFE5IUcEGLryxsJZ2z0E5JsAjIXkmoBYa2IRxSN4DACTY4W9wHld62ry
	yDcEXU5m1qcZTxr3Fy5hW6wl6kTi8GDoMNP6o2lXa+gxKTwS+ccCKO497uItQwnJ5J7MB
X-Gm-Gg: AeBDiesvBOjJ1MRsqjVjHfF5XrYPLU+f4oy4wsW2gOVCkVYs2V+gF+t6sQmptvKx/LA
	fIYOhzCLOBzRi9NSxurNUM2urpYHpMto0WSC5Yip8Wjs/EXFdf7Q0K5nDE1sPIZuWGxo2+SMiy7
	Ji9OvObq6xbJyaO5he151rKJTMkoInheFhEYgFgqlN8Gv7mSwSvDbnGlSlh5YhH9cX01nQkKPu7
	92ihwirsS5K5Y4vmGo/oY/dkJ3VGgVT8O6BONmV9Mhz3bL6J9g9jeFLv64dtsMo+f67q3hEE1fM
	Ci1fPwo9R2yDxFmunW0aXWpQcJqHUGjS8dp7GhR5CUsQlyd23RiEWkT2LqJrjPF0CtoABm/BEuE
	EWqJz7yYwx2K9KhGJN1vBm2OjbzWzPxnrZTcOEbIQ3NKl7pT0wggDOkaL
X-Received: by 2002:a05:6a00:302a:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-82f0c2d93admr12361294b3a.47.1776065108745;
        Mon, 13 Apr 2026 00:25:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:302a:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-82f0c2d93admr12361260b3a.47.1776065108219;
        Mon, 13 Apr 2026 00:25:08 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c500415sm10213450b3a.51.2026.04.13.00.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:07 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, praveen.talari@oss.qualcomm.com,
        anup.kulkarni@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com
Cc: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v1] serial: qcom-geni: Avoid probing debug console UART without console support
Date: Mon, 13 Apr 2026 12:55:01 +0530
Message-Id: <20260413072501.263871-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dc9a55 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-DdxBgvXw3sWXynY89EA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Gmvm_kMJuKK-l-YrxrzVBcRH275pZchL
X-Proofpoint-ORIG-GUID: Gmvm_kMJuKK-l-YrxrzVBcRH275pZchL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MCBTYWx0ZWRfX6TKc+t23ChP+
 POk3cihdFgaDYa9ZCBPIo+NNPBChN/6/ylLHljTkIqq5IcxvmWOO0D0O9v+rZth5nn3Hj8HKgJw
 nzFPi7dN/qgOHpUgT9ggNTbuV3fBZgGx1fwa3GGv2RuaD409+zq3cuPSc1m0C54qtuWTeQjd/2L
 hZUZwKJ6zDNfHJYKHTC766w4YAAzTzRvoGE5KT3w5BbSzk7DXkqFQPuuzXzJXNILI31rzKcumiv
 IFyB5Mo4aamRe5ujCnpRBXzAf51AuOE4RDbuewcM2R9J0MPIg0xy1r0DtBNFNV/R4S99qK3VJ4x
 xwYlBDS9DTemLLa0uiHedBzqXx1bMr4WM3jWu8Dgm8hs8y2V5PtiWIfBZl+VHIIsMwZINDrEw3U
 hH+N1UYrKVvdu4K8HBhqUMuotO84MYq4VSFZansQUItqvJlondwMBL0lPIZS4uhToI/YOEaiybi
 LmuAEzBgshzMco4oS/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130070
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
	TAGGED_FROM(0.00)[bounces-102881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E120B3E8319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CONFIG_SERIAL_QCOM_GENI_CONSOLE is disabled, the driver still
advertises the debug UART compatible strings ("qcom,geni-debug-uart"
and "qcom,sa8255p-geni-debug-uart") in its of_match table. This lets the
driver match and probe console UART DT nodes even though console
support is not built. As a result, the console port is never registered
with the UART core and uart_add_one_port() fails with -EINVAL.

Fix this by only including the debug UART compatible entries in the
match table when CONFIG_SERIAL_QCOM_GENI_CONSOLE is enabled, preventing
the driver from probing console UART nodes when console support is
absent.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9854bb2406e3..b756e0c07c16 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -2039,6 +2039,7 @@ static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
 };
 
 static const struct of_device_id qcom_geni_serial_match_table[] = {
+#if IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE)
 	{
 		.compatible = "qcom,geni-debug-uart",
 		.data = &qcom_geni_console_data,
@@ -2047,6 +2048,7 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 		.compatible = "qcom,sa8255p-geni-debug-uart",
 		.data = &sa8255p_qcom_geni_console_data,
 	},
+#endif
 	{
 		.compatible = "qcom,geni-uart",
 		.data = &qcom_geni_uart_data,
-- 
2.34.1


