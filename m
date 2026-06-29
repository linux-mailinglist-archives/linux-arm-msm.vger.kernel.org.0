Return-Path: <linux-arm-msm+bounces-115222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JtomG3DGQmq2BQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:24:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199F6DE46E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dsd6fYde;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bgxApYxz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115222-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115222-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD09B304C055
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E421739EB7C;
	Mon, 29 Jun 2026 19:23:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442D3ACF01
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760986; cv=none; b=S3n0QzjzWxXOUdbYAnkOC71DMrOMb04BjEJpvnpY4USt6hx8N7BSSiR5kJI57K7BoYAtgpvdw7SWuJHz8jVdqXRrYG+NUhHmeVIsrpERLPCzqSLpDiqUOb4YqISV8MyMHyPooCOLtPATFfKcFYvbe83WInWIFOd1/9nE1rIt8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760986; c=relaxed/simple;
	bh=lK2qihkta9x6Yku68KYSHqtkE0Fhc1ob6Gdqgx/z87I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4xBk4YvxiBblH0D0bZ1USPnpaeRtKcgFmcDQa/ZK18K7uChD+cu9RaAD1wsSPuEWlJltOfJ1EqtUx/p/gwsdu8Zbggd5WWWrRZa8lieQdkxQjhtAwU1LIcH40a7+Z4FOU1DTsAOx+s77mTb3vjau63yq4gPRdF5VTsk66jeH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dsd6fYde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgxApYxz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKBDc3432890
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=; b=Dsd6fYdeihlzxaeF
	+uHby3shSE02It+cdLjvdmZ8P0n81ABtZksX8WxNz8kez9FxxT+lxzdJO1Y/IUPh
	myK6V6/+SaY6Dh5qWdrVKwOzTnDh07PHrN+BJEiOik8oQhK6xkMoMQMdpbj+ZYD3
	LGvHVzdoSmzsoW7H7ABu2tH+U8AbSSOlrOXFEUCLenCwRRd4jig9D0JLv7GB7OWD
	32QpWxn7lofiP8q6y1/GiaJv5D+Ez0A3K17hQlKSxtFH0E+U2RDjpLm/fbkFRfB4
	IwE4A/12P/36jquGE1QYeDXN1OusMg1AtPP/sgBnMzRvgdT0jGlkR3g3J7ZBkqyM
	vkhXBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgtrvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so634852785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760982; x=1783365782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=;
        b=bgxApYxzIutRtj5hA2ylnp2gCOCUD3TMQn2LPwtt+URMS6bi8uFY8Ck6msVlqd8vyY
         7kU7DLHENa5zg9TRg58NvJqjpG3BY+DAvRODcrNW97GqfU2Uv/ml2J9EH4CH9T1Q/SGk
         6igm4o7mnlqZtcoOw70IVM5GhuaLBTyus45bgv1hmjSrhIJ2OYDw6di/KDWGV2D45nP/
         z5GBbkM3KUHuDfsCglDhLD48clNF1kIjo/QgnTHr3MneZfvzNiUl/iVsJv2BiAUiskNG
         KauKAGgWKAC6RxI8F2mnNTRkHIuH4Pgm21Hv0r8QNSVrtxRpBNdNoEaRhRDz+YhUJoNi
         Hkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760982; x=1783365782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=;
        b=c/Mq8nZNhefkXXwBLbuudBr2sI4FDWPvEDoiiBrbRmT+uJoZn3h0vUvVVljxCj2/M3
         zbnREiBnCK2ODYbzK4IVixwXtkynlPcjks5gGZ9y+8How/FZ53Cbwx/3ysfJ1Ae6/Roc
         +S1rP6zdf+669zW3Tqf+iQDC7+ZgV04akbyH8DZ435ZXQVArcLdcq3s2GkBqCHppnzDP
         QogXDPVTvOrwQhZFbcQ6kNMJlK3uCTaoQT4sp8wsLSprMUTYhBL4HXa5KqSIQrMLm6TK
         LL/L9jui4W2SQ3uZoWIKvjIG9tmUDiMmkCgg4KMXkFi1YormSUzE82bY+fVtfDWwaY1Z
         kkjQ==
X-Gm-Message-State: AOJu0YwHbCO82ir+FYuBfFIsLMKCfNi0mZ/iOXHTFWckLnqBRm9vUZAx
	V4UkvVmClmnmwpcVcwMM/HyLo2DP7Ht5M0KxLTGG1CQYou3MVJ47F9bhaoTX8YIqPDWzfYjtcbp
	2OH4lMs/tPgLa5W5NocQqQNQuNOwifTPBkE2pSLrixQDxRcynaFJvjKr6nYyoCaY0cs3N
X-Gm-Gg: AfdE7cl3Ehpr9eFtm7d9BD1WOgIKAcP27EgxSegE8DUQ9S+WQ4OpR8B/YhBoeIbF8TS
	hkhuOy0KnL+GuirPoNIHcBkC2uqelSEH1Tx42fP79hwDMEaQwICPBEPPeEQkYo6f0MZL+tmlM6F
	ulQZiQpP8E1Dl7XKcIOv0HJzwwsiqmMO3XA1xW33kwaVAAAn19zfhitD9rh+9Z9K/IDqasfns5C
	4X8EduaNxNTFMfbghA+7Y8hJpZKnqr+ZK9AxvBi+gbDtOz5r6j6IqV++iFJcsZQqs/QOr2wR1QE
	Scys+sxn2+tX+0WP7R+Y7hHWLhk8RxXKSY0nKICjlS4P82aL1PCF5qI6KMRapZPgPBT2J7mjSKw
	QPjhFsc1N6u6pU36G+VLh1zkDAm7bUS8wXE/SQ2VALMFno1AnYll2vyndgJxOkYTPlPXauA5E+n
	GIgkDUQBwivl41J50s5Lk0H+OY2zUQkpTHwiJSgLzff3icYcq1ZMBRj4vpauG/mUsPA/VcREMEx
	VnhOaEyhViFD2tTm341
X-Received: by 2002:a05:620a:29c8:b0:915:cda5:27fa with SMTP id af79cd13be357-92e627e483emr145572485a.58.1782760982341;
        Mon, 29 Jun 2026 12:23:02 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:915:cda5:27fa with SMTP id af79cd13be357-92e627e483emr145565685a.58.1782760981850;
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:22:56 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-qcs8300: Use retention for USB power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 0IcALCEc8oP0SN9j_tz2CmFjukM0me6R
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42c617 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K4BkOEyOW4MAsK0yrNYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX+P0xGvIrulxW
 oCgWj+xEZ1PpCoVhPH7uI54FHklYkXMkfIHDy99NcmEe2s7HiYMM7yS9SJxa7KyyQC1pM5FRYvO
 RHDX6ldFX+3bb9BQzfHveuCeRXX8Tmk=
X-Proofpoint-GUID: 0IcALCEc8oP0SN9j_tz2CmFjukM0me6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfXwHhTa5x+mxLk
 aBLsqKhxcM9aa8TbM52x5irXoSqJOJqRmt43CwrlKDHZjUCyeekI3BBjQlmaDWd46adquPuxlvd
 zlCLyZ+jr6y/RKIYFnM2Te7IJ4Aq1QoPwO+rpOCJVjM8JNHxkEbfh3Ru+l41VVXaEKMDZ7+YgkY
 KExVHVIKCmDm2YqXFXH67ouUXVv/SOwfYHIgf/2gN0l9wqIPEwHF8nQ+DK5cMOd3o9tekmd6g9y
 vBM/5KpsR1tXAfe1mCa0zGSyaCB0lWIux2QJjo8S9hUoIYRFEuvBSFXBkxnPSN48aGBHILOX8qL
 XgxwFtvI6F1DJ3AT347HGczr8b+k2PVDxWzAEhBYt2I089UyVJ0nG2AI+FlgLzdaKCb1GaBkrqn
 //4shU6JecMfLYDGwCWhmbsD+kHEWSWTNZhmSamjpaGYs/UViZW/qPdSPBfiUwo0wBHZcmt31mC
 BdQBM/TdxxSXB4eXmQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:quic_imrashai@quicinc.com,m:quic_tdas@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1199F6DE46E

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 009672b75fb9099cb0c6db7af3863654f2fa6648..fe0632687f9f0ec7c8205bd2daa31786373ff55d 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3306,7 +3306,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -3318,7 +3318,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1


