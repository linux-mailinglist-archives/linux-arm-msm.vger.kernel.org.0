Return-Path: <linux-arm-msm+bounces-101409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EwPHaTVzWn1iAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:34:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E289E382BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6C9430940C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 02:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C324D30F938;
	Thu,  2 Apr 2026 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqLWNnHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2EfeUyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63571344040
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097098; cv=none; b=nJuE30z87BkHjq9sggzqIK5EqnGAnbloUCWKnzJjyjWbvOGeUHnmaayzh73oknK55U+dLxR/FGnMO4D778BJMFAf3qsPQhLmsShDLURFxCNgWFb74KfwRuq1sRIV3zwP54BWqb9FgDTIraSvR1gpYPmlTHQTloKSwcEJeQ7CYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097098; c=relaxed/simple;
	bh=1kCOpM72dPu/jJ2UXAO+VXkaPzHGqBbkHRFOj7DlmxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AST5Tih4g6rAEC1+SU7bI048DU3SyrCLXn6552hfl9my/1vPu/NUIGZu5fpdmbJwsdSGxweZUmJxFuuqM0UZsxmNCt+v3vXDxdjCOMKqjFb0ELOxsuI481oZQkDJC/sL89Y5C1VMEP/okgp9KbgVPKvZ+ccnEtD4xNkfjH8cURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqLWNnHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2EfeUyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4AMi1424430
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 02:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=; b=OqLWNnHfMVphDupQ
	46fLr27Zu+ero2zaTVibn7GLhlyofO9ryHWp7hgrFvuf0BsGogdfe8d87s4Lgde4
	p08unYBdZjxlm9lNGKHiGUiREuge742m1i/lqRZ0D/x1T4zgWbVq4ibzVzKj71bw
	XqUEU5a/f/GQlDsXPT97IECAaFZ7cVImrrNPIYwcCscieOc1y3+HDssG1+HCSZ8U
	JPYimxEKqj9wCwosmVSCcLuj45NJBzF5W8mRWnxdqPtMC/VkcgBaOvXsxu9xjH9P
	H2s6yDAEB1M74BhBhlqjvzwAkgVDgIxp+emK7I/Zp5vHH8lMW9ExSElitIatroLN
	SfKN6A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511afy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:31:36 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67de56b5bd4so1714366eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097096; x=1775701896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=;
        b=G2EfeUyNbSf+iZl/IQoxXvrXxUEB5z6m6Chmif/jqGFZ+/If5J8lddZUSKPv5X9bE6
         wuBES+8UjLMCw/OFJVBC9ZigE8OA59T8ADec3TmrJuR2ckapXFZMoojbl477fguCebbe
         Ew3gAWi8DNOUSypTS34Mi+AdROuGX1vAgqrKnh8H/ujr0MXkCsF7RLOIohfgugEXEEdU
         VOeg1N57xCmE5ojWgFGguDxZYdrljBapEiqlcIoocd7RnNPJLkd5CT4+rFG85fRR6D4k
         VYluusP5Pib2nk+eLxH1JkWkooDVqr+VGmwRyukQyIOApDHoKqFFXkgmzMm41YSGL5zA
         YvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097096; x=1775701896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=;
        b=KO/JQHcEUJHEB0SM3IXzXRCi0KH4EC27EhXfooM489awKkmDs5VE8wme44dTn0B7UQ
         2xXNF4jRL2511uW95uMEik4UJFba/E3OuRKVTIGsKc16RupyjtEI31v6eFS4w6H+u7c4
         MAu1G8hj+Evk4lUehe3jXL9SjqibtzKUdnG7oJcbqG6UqR5PFNg+NAnCDOSj9cLTbiR3
         8Klis19+owNbtYuN7DSdxk6+vbVNgRiqmCaXNbbHPST5b9SsoIKEfnLpIKcDFdTg6pBx
         IwAESrEeRh4R1e+WwLvJE6ZOPbKk6UbB5L08EYSP6H5W0sYLz13YhziuZ0vK6h1sgW6a
         9CEA==
X-Gm-Message-State: AOJu0YxNcyKIkcO9YaJ0ybu7wMgn/nUSy07+3rSOwcRxlluDDOFtwlPz
	yIZ3KSx38Fk56xkBPERTAG4feyMW4uwgm39jEBLpvvy2JL3rWSKyz8cXtrH09jvZyOlB4AtFhJv
	7g5JyuAoYH8tkNyLUN5RGPYne/r5Jz2JWvi69oFHJkOGCcrVC4TQWC9lnzFWiOhtCM6fT
X-Gm-Gg: ATEYQzyoen0dSf33vPbSQkyAnQ66Slraj82406iYJYVBkcSPREgObDS7358qKBZNjeo
	H4MrGTJTUSilPdx4rom2bOuN5s4GjzpaoB2ji60dR4buLfSNWihH3xWzzlgZZ91Qe6PQLhndQWT
	qnV/2qP7h5AThYqXh9bsHm00Ryjrtkr/bQPD9XZx0Rv37Qjz4ekvpOLAAO09xsjKiXyEO9DqZtM
	Uh7ccO5XjwDNW6ybRxe2PnYQQQmMUJA41aLogxgMx6IH3ywxCzLM8pIYSCdF+vusghGOuj9Nvmc
	qbRKlTe2lZIBOphVKl+8eAZAXA3TET3WwzDtx6FW/Ygad7G/XxPlZoeVRfgCsRw2TZPYuEMESUv
	bG9t3CMNgL+aLXv09CW9sS8K88/MHBlSuBRz1g/zwHb4=
X-Received: by 2002:a05:6820:3083:b0:67e:9a9:5baf with SMTP id 006d021491bc7-680a5ed5871mr1173063eaf.16.1775097095703;
        Wed, 01 Apr 2026 19:31:35 -0700 (PDT)
X-Received: by 2002:a05:6820:3083:b0:67e:9a9:5baf with SMTP id 006d021491bc7-680a5ed5871mr1173054eaf.16.1775097095301;
        Wed, 01 Apr 2026 19:31:35 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:34 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 21:31:27 -0500
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-ideacentre-v2-3-5745fe2c764e@oss.qualcomm.com>
References: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
In-Reply-To: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=1kCOpM72dPu/jJ2UXAO+VXkaPzHGqBbkHRFOj7DlmxU=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUCxwhyjpkcYXJCDCpDIcCfSIFLfIiifXiUU
 GoutMRlDwiJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVImA//YaHut+qYLpdZAgGfGt9wPBiBpZNz1TrYbSiBWAU
 2fVFsIQQr9n2QFuxlcgIkc03xyzks43kkZ/cYur3dEMmb84yQBEFGiSYzLRhVanzLN2oa0+pa8Q
 mnTJL9VaAzltCUbpEOYtDBcLewhzcAKg6QAbBva0H+6SPNhS6gNRltDKHHbmsUkC4iK5fZ7aC9W
 +4UDZ6Fz6Zpa/BY3a54MmvqTJwaJZyAoqTbTH9ayW6CBhF53RKokIwxhvReiXiJ4wYujmm1UWlL
 VngfYG0p1q0djWZ0Jf/jMNKHTfEdniFtSSoLUavHqPeAwqm3Zxv6buwgzy1YmV1k1pBx7DVyr1O
 Perdtn8kNpjkxDEp8Fm4JLS9egT/wWx8+62zlEjhIy1oaE2BY67uOqdNc/x9gAfAn7PDdIilbaq
 FjQmZpbCJhkf4C+L+dpy78KBGdgIAqo/lCJlLjD7MNJTt7ocMv+DYnB5ZDPJxp4yjtRoKjiXSuu
 1HHsPj8rcXpQ/JuqUzjtX6qJBgoryAyPFsEqNZ7nNfhU1j5cnHiceaDTAkd2XX6jfGqdxakuOyB
 S3nIWI4aks9sbV1jZGMDOuX5/oubSDThaSemmtk3bjN3Z8ugGR6o1nGVk8/DtQLlg4EWkMoSs9B
 pTNcu3EypdAfJO1Q/nCcDu34xEttiIE58sdRgcX8P5Ck=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfX1fs79xlopZHj
 7QY87CX6CP8Nw083o4+8iTXyiXWHeMQ5jhQNpsGD8tMPIN3WYpo/B9c3CXCOSI9UwfeJWrHKobe
 6LltvARAuZp2leN8fQbMwxEjktD7g14ARUw76tvSko1quYh0/5F4cWtVArlFJC3UaWncqBEM01X
 60WY6TV9Zb1JQxTsCnBmPC/5cuOU5x+BUR2NDBGWK68Y2PQFlk6cXOZjNs+s/vvTNi32w4uTw7G
 3c56QjXZSTQc6hYN9cWnTnguM+UkVvmidg3rgzRs21n+EpErSlJGe4taGuI9SyyVH3D21h4HNvo
 FaA5KneeumZ7P6HiYQIP1VjQaadmP5TDXK5w1ad9gBSTZKrz+tos1bF2KIt8nZM5ekIgy3lQVaG
 49PRYGSBXMs/YMJNIQgQHjXwPxHKzj9Qdma6/mPRP3GaT3IDqR2hcxHJQyDPQnIBhh4FXTPqdWF
 dBKExD4ZVi+JqDwyUAA==
X-Proofpoint-GUID: rXV1ih38j5mLfx-SiVj85QvfZRAjd8E2
X-Proofpoint-ORIG-GUID: rXV1ih38j5mLfx-SiVj85QvfZRAjd8E2
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69cdd508 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101409-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E289E382BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9292af4a76d215f35c2fac28acfecbd199296daf..9b06a69d3a6d76c9e3b0a26be4cf7880587e8b3f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2299,6 +2299,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.51.0


