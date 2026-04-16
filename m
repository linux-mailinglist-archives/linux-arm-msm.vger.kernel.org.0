Return-Path: <linux-arm-msm+bounces-103344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCNPGhyb4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:17:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B943740B6BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C249631BF235
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A47F38A701;
	Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kik5vsGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl0IGmtF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E738E5CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327051; cv=none; b=uxeZknLULJfgMhbETDfW8w6bmSXc8VGmnD5GR4iyJsMv/TUMHeMCLNehY1kkFinzsTjEBPIIXEG62Lfc4cOaYK16bYlPYvcA3KG/hJk3xKrjmG6EiOl8c//c8ilmU7kD/GbMVJQP+S8IlxMBPPc+NTI7F/QYTohV9redc7VZVB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327051; c=relaxed/simple;
	bh=Al+Xd0VzOSRuBt6wM43C97nMZHriDCsl2+EbCvVx8tY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AL6lFtcbyKUY5UCkq/eJg4sEzwHAt7v2HXXwKM9y/daApZYPoewf8boHdg6q7CwlUqc0s72Ji/zE5v/dnZCbyWtgVZ7fmQLh91+RlFgfn+0xDLH31K2SJEtM9IW+2YKP/rMXEwmgFtg6LT0SHlZTOou4JjM8ZdoaBhLuyH2h6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kik5vsGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl0IGmtF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2BZLv862969
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sr2aBtEefmYrlQQ2L55xZbCJXcQBBJugvs+biKl+mgk=; b=Kik5vsGgEfw0WJA0
	qVKfDYzOZIy3VpPyE9GOmksb8jsoxGq816CXFC1x5Tu7/LyrM6FgfkoGOcKGpteS
	6UPvqxrmZ0FA7LAcNKHHcsrlof/WUxTC3m1miC5j+HuYOvVdqHUIa+2FB0+C8UMt
	XMdKf6FyTIhb5hw2qU7OYiRNU5G83fv/D6K3EYXJrXJCqI6czWyua7Q/MjlszkUk
	TV7Q2S52fVrJyQ0AbsjCEPh95xJSs3TqH2Rx164RBLdumcJHuAXJ1AjxLyPxE+YR
	TQlGLweH8CdOHSrtrOoUZK9GIwya4ypalsYgncYzBXHvsIXOWVGxVFgXcbzMW/5s
	NaD6tw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0eax88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so278110281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327047; x=1776931847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr2aBtEefmYrlQQ2L55xZbCJXcQBBJugvs+biKl+mgk=;
        b=dl0IGmtFFVxkJoI9R4hjMEYhmQ17BJEhR7K2nOloomH/Aw48pKQMDqDuVQX333zXoL
         G9Wo4Y+9knPef/Ld+3atM95x5P/FohMp5LYQL8onxmFEfWnDu/gxvtRufAgJnjTw1+4n
         DJK8BQCk+aDS43/4jjInjwqa9I609XpT9LDUUyGpZE65RVIRuV/iVcFmYky8UJR5CKUH
         pXJEWF4icLoDF5BFcpNIHN9J9Ikmz0HobeD+8+iONlzYIMLyqJrPtXCVqbEj5usg/VKN
         CkvvtY1aqw9NcFpwMPssU3thY0kN69oZkbMqdcbsuZMzVGHvWhQ2e8zxX/O3rLGzj0aE
         tG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327047; x=1776931847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sr2aBtEefmYrlQQ2L55xZbCJXcQBBJugvs+biKl+mgk=;
        b=eknhKg+wBj0NSCtpWSVjlylZe2wXCEaiK6AK6ChhvqKamTpCimWK7i4ofg80c/UThr
         iHEMUvT1zrZxcn5x4bs7oY53Akx5DVAw8bEp4ambEdYRkAryADO8P7ZnReQmixXFYERL
         XfpLfJWrxrH7SBtcUyToW8wID+6YIr/igp1d+onsmIJ5Jy/yv4W9eghaQYjmdg/5+2pF
         EdMWmQQUvojMCbZLWF55eYyl7StR2T3ixL7OBL+hfg1wAhBRFIntPEkkIYUulzBpT+pw
         7pNrqO8OEr0zqrrt6lh510QMqJVo+rody3aTYpzq/2eY+jbe4fzBtI0xEPGjQA++w0/n
         6H3g==
X-Gm-Message-State: AOJu0YyneBc89JEYAKj8UjXKbMTYBUkXpZrrOZ5Uz+PhbkD0eYASsbGu
	md94Q+Xd39V+n7QKqlvY+ghA/sPBq2rbw7DDO/0YL36/vyrEviMObGMP+rEJeVAUaE3xo3dFpFb
	cArZwsApUtrgiOoNa3GxZK7D8yLi/0UFMh81/EZdG6YGdu+687MiagxyZzxKatKRhRuCDsF5xUW
	tA
X-Gm-Gg: AeBDiettfn+FgSAE8m7Fs3Odsl/k+9SkwwR3hQW3LByhZg87K9LRe27gVoqIJkse0pA
	is5/8ESRt976UIkJgq8LHy12W7RG1ciECGzs3h7de95he7oV5Y4btFknE3vYR/7KMrX3Y4IypfN
	k/FoPM7CItzHSnlQVABiW0jyUyewWVqAOjZnJLNQRdgMxATJGEnUujBks8hZp6bSjpGcfwWFWpK
	6lAYRTxfaTayL2Rp9VdMHydD9wxXk+EXdLCTUhLl8PcpDh8BFbEuLEADpSqFBjdJXWAvqCPSJVI
	hHHrSqDI+xz7HHnKh8cCb3vhsIoHGUFT+x9sdxhGzrANVDkQ6Weu5JH2VRI45z8jut3uLKSHOz0
	YXn42p5T8sR00f3ULaFUNul6/gMHUDwWVLppUB8EhrGA0
X-Received: by 2002:a05:622a:a94e:b0:509:2579:283e with SMTP id d75a77b69052e-50dd5c0b95bmr297273481cf.28.1776327047328;
        Thu, 16 Apr 2026 01:10:47 -0700 (PDT)
X-Received: by 2002:a05:622a:a94e:b0:509:2579:283e with SMTP id d75a77b69052e-50dd5c0b95bmr297273291cf.28.1776327046860;
        Thu, 16 Apr 2026 01:10:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:10:31 +0200
Subject: [PATCH 3/4] clk: qcom: Add defaults for desired arm64 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9762;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Al+Xd0VzOSRuBt6wM43C97nMZHriDCsl2+EbCvVx8tY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl9XUAGfjan3dLDD74vZePPkSiCtF+nWAKKU
 EHLxkRkJ1GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZfQAKCRDBN2bmhouD
 19gBD/wNb/8a5AcV8d9xNNFVQULrgjSDCVp/Fn4z3dHQW0PzNhDDmPcbWB/JMmMZCAb75AD/Cl+
 ujHpz8ZEckeNNy0+wwVCxDJkf8wBAklsn7Pg4zU6JoiWFhO3zGTwUaos9O2pbkGm4PJmk2S2fN3
 NVGd6B2OmP4ZkX9DpztUzdpaXhSsr3Rak8NDnZU8UbqOXxGYLsKTzdDRVIquEqoIRAEZAFskmSy
 6fFx/v9sy1nruDCfOml+dMBcXB5RVxy56BJ/QUNagbbCpQgyFhCUu8le0KfX1E+m2CRJiDcwwar
 ayuWKJhgvC8qYuPfV3x3uR/ZfmV4YkpnvTFC4mIrk+NweoVSz3PmUjd2y6khGuY6/khaD4r6Hpp
 cIU8OTTDElTl6z3Lyb1O2MPDd8778erVqqm2+M5dr6VzHvUZVgy/PTmh63LyBvMhiiDnEeioKA5
 iIg7sJJjRI/dLF/JgKxjebca9RKUJMeQUvacSfRvfZd/X88XjA9bB2d/DKldM8dCkmFO4ZWybrN
 8ysWRFZTOuWwdVhR6bYJ5UC63F+Fun+9xCqxR9PMF8JQyLjXb9gYW6tN/8w7bgNxOCmrsmsCz0X
 lqlj2GHvBDLgCpJ8glogPqMLmARwVK6OBxNbDcjRD/xFO/5U3rq4MPopt8K7gMrQfVOK1FH8PMF
 RopgC/Zc31/OkWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Gbxg4GGIIiKqo9jt_pc1eyFHsf0Xvm5O
X-Proofpoint-ORIG-GUID: Gbxg4GGIIiKqo9jt_pc1eyFHsf0Xvm5O
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e09988 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gtlUWFdD0XfoLoC-UmoA:9 a=isR4AqL0EaFW8Alr:21
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX6i3dqf1m0mFI
 jI/Zuu0OadvPQXictgU/MpD7Ra7c5mZYdgvVdVEq8j6qxyM0riI34nYKdeUoutotVmZZKw4NFd8
 hx0/fCfukMO7yxWuamLEAJTp1oF+3/8wxORaYHuz1rrF+5ittI1odN6/5WgHN3mNvkqonov+8zG
 tekwYx7af7avtEtYpuCflV111m2IEnSmA/E2fpTAw1pE6HGuBQGWv1c37yqowLspmFeUfb0VIPe
 cYkrMF3qYIr9nQvEgxf6dYl/Ng+IWtvBsJSgBnrOL1YypRkBXs64/3ol1fF1YGv5SntfMjG7/s4
 4LjiblXUPB0MB0P/Y0zCc3R46M3EGhf3ewldx41rqwbtPnf+q5+idmG6APigq2NnW19uC09rbV9
 sko7cJgBrIm/fbF+3p8a+tGE0qw/LOAIT5qVy7Jy+m1ij0A0erVKq2A7wFis0cTwZSpBikjNYqm
 e99qL78JLBMgqLFkI5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103344-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B943740B6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable drivers for upstreamed or being upstreamed SoCs, which are not
yed enabled in defconfig: Glymur, Nord, SC7180, SC8180X, SC8280XP,
SC7280, QDU1000, SM4450, SM7150, SM8150, SM8450, SM6125, SM6375.  Note
that main GCC clock controller drivers are usually already enabled for
these.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d11c5ea8be83..b0c0208d7574 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -73,6 +73,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "GLYMUR Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on GLYMUR devices.
 	  Say Y if you want to support graphics controller devices and
@@ -91,6 +92,7 @@ config CLK_GLYMUR_VIDEOCC
 	tristate "Glymur Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Glymur devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -161,6 +163,7 @@ config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -737,6 +740,7 @@ config QCS_GCC_404
 config CLK_NORD_TCSRCC
 	tristate "Nord TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
@@ -797,6 +801,7 @@ config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -818,6 +823,7 @@ config SC_CAMCC_8180X
 	tristate "SC8180X Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8180X
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8180X devices.
@@ -850,6 +856,7 @@ config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -966,6 +973,7 @@ config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7180 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -995,6 +1003,7 @@ config SC_LPASSCC_7280
 	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC7280 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1036,6 +1045,7 @@ config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7180 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1117,6 +1127,7 @@ config QDU_ECPRICC_1000
 	tristate "QDU1000/QRU1000 ECPRI Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QDU_GCC_1000
+	default m if ARCH_QCOM
 	help
 	  Support for the ECPRI clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to support the ECPRI
@@ -1204,6 +1215,7 @@ config SM_CAMCC_4450
 	tristate "SM4450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM4450 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1221,6 +1233,7 @@ config SM_CAMCC_7150
 	tristate "SM7150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM7150 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1238,6 +1251,7 @@ config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SM8150 devices.
@@ -1257,6 +1271,7 @@ config SM_CAMCC_8450
 	tristate "SM8450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1294,6 +1309,7 @@ config SM_DISPCC_4450
 	tristate "SM4450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM4450 devices.
@@ -1315,6 +1331,7 @@ config SM_DISPCC_6125
 	tristate "SM6125 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6125
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6125 devices.
@@ -1325,6 +1342,7 @@ config SM_DISPCC_7150
 	tristate "SM7150 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM7150 devices.
@@ -1357,6 +1375,7 @@ config SM_DISPCC_6375
 	tristate "SM6375 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6375
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6375 devices.
@@ -1432,6 +1451,7 @@ config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1451,6 +1471,7 @@ config SM_GCC_6375
 	tristate "SM6375 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6375 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1460,6 +1481,7 @@ config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM7150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1550,6 +1572,7 @@ config SM_GPUCC_4450
 	tristate "SM4450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM4450 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1569,6 +1592,7 @@ config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6125 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1578,6 +1602,7 @@ config SM_GPUCC_6375
 	tristate "SM6375 Graphics Clock Controller"
 	select SM_GCC_6375
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6375 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1678,6 +1703,7 @@ config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SM6115 devices.
 	  Say Y if you want to toggle LPASS-adjacent resets within
@@ -1738,6 +1764,7 @@ config SM_VIDEOCC_7150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM7150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1760,6 +1787,7 @@ config SM_VIDEOCC_8150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1781,6 +1809,7 @@ config SM_VIDEOCC_8350
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as

-- 
2.51.0


