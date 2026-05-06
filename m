Return-Path: <linux-arm-msm+bounces-106110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BaXJk01+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:34:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62B4DA41B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82274303FF23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587583F20EC;
	Wed,  6 May 2026 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwZ7jbW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OE4E0lOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8686543E4BA
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070643; cv=none; b=U5vM6XeyrmMtiotZpDRvrNh1Oky7NqufUUeUjOpMwPQ1EHT+m6ApxLzlcDi+kbTpo1X+BjU3wMqtWdREXppzuHjW/jm0U/DbP31kx+C2MP2VW5fHXTUUJdsptvmi8vouH0Bh15PDKLG/Bx1EIk10AbSy01Nsd3lV8KdtPtVpDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070643; c=relaxed/simple;
	bh=LfqF+tISQfOqsyRgNKFdDYNR/2LiKpdRLyCLL5bbh1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZS3PdiiTUDVE6gaJjbUV57QTpyaPFIPbJB9DoW9WMnvNprFbWoNQMdM2lLRuTQq2IzsH3D20A2OcIkJk9LTiuKG7NBMDjAxbdt+InBvnTz9WnH+jvZH6BtLSMAS8fmPyBvzkCcBTok/3HtcejbmQrAIderzmYmm1LQNQn/AHC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwZ7jbW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OE4E0lOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64685eIq1435043
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z9YRfr3uYhH0pwMTMbyI9+
	KcAk+dbQ90Wa276yiyGnU=; b=BwZ7jbW9m93k00u7M0y+15R3qXcd7AL8RzZ7AX
	Br16rw2DgiCt+zX8ofOci5zDVOa0WPAJUmShO6e2VqHsqUY0IhsKLLY/+3QbN7XV
	2TtmIFE7baI01/D6fERjHLYh9l0PDbWIbjyFXfo3OVXxRek1fbYl1fa+2E8hzffr
	tFPbhPrU4gNY78N0Q9PZXf2v/jWlPoDLwqZep77VJR+REMcmqvTQfhxFm5AHHh6l
	73pQX11Qs11MYv+otHVeuUcbByyNLdhPXNqeawKWUhLI0mOl099dBeMP6njkV7tn
	T8DZokO6tklRFpX04EaaH+3sEJMEazBRYn/u4IjSulok3G2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqdt9nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 12:30:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso159771481cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778070639; x=1778675439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9YRfr3uYhH0pwMTMbyI9+KcAk+dbQ90Wa276yiyGnU=;
        b=OE4E0lOR1J23CwMvmyI3OsKFoTe35MdtmxJKnMU2Gq5zy4rKWnqIjFGU1cJFaCCFlD
         Y5bBQke7VYeQ8VpJob7vM8D0976d11BbBTJtohrNgvpcERKnxvAcJm0eJT58C6u5E+ZR
         EtY4sVz6SZyLQx8PsplG6DHzy1LMqUKeggBMjXGLdg8LNIgqeD3LIYwj6GIg2qThXI+W
         uxZxR2PZ+H/Fkw/QSl/641VAxeXkCHBVnSWe0WgiPxa9siZCSooxdglKtZ5nmQRK0T7/
         3RKZTrFDkqInfG6cYcie06/JfqBzF7oACXv1tCH0oW2CHIygM5Pg9FveSOCEpc6XrpE/
         H2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070639; x=1778675439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9YRfr3uYhH0pwMTMbyI9+KcAk+dbQ90Wa276yiyGnU=;
        b=iwI+tJjdS+4OMp9xsWQMe1Yb0KpVHQKgtSB6J+Vjb1Yv+KkB5w8/PgqoiIabJGcnIM
         yP5LJCVRN7ZWEgzeIGcY+dTaMMNiQRuS3xKuxWzHIEYK05PPgwxRhku0ub2uKx04tMMy
         hY8B53Oteyu7RNNhjPTQQwlpyCaIy0c9wO/tf5l7F+iWg5fnDyCxoh60fTenK1tolMJR
         ATErQzAPyvGTgFfj/4LJ+POr+Wjc7mzZJhvhXLYTRz9rwwnol3ZpCWi8KjuCEKn0/7Dh
         HhYAWiRBp9wdGqBvxHiMT5rGZNoCV28CNxvH4YbFabSyH7tA78QJdD279hN/aNUujM3g
         LYlA==
X-Gm-Message-State: AOJu0YxLIN5pcD8gwuqbZKXemsvBpRApHbWBkNvNm4c3eS8vKh3FFRm4
	2nCHxwYN9uCjtZcq9F0P/Hr9SHQnFroXMaMWD47w5DZRLWaoMrE/rU61jz7KyUEtqQBggrqW35r
	ZljknsmpHDZ7FuSn0FA9AMPON/nt3kaVxYm0KHEuuXGSShmmUoUYGo5tEV7V0voUi8bbX
X-Gm-Gg: AeBDieu07gZMfOwfrQ8fo4MgbUxJeDIbrPqXDVweXoWRDvMokFQtiXx3s/0g+G9i1j7
	BoIR6onELOi1j+yd7QwOZ0fBPIyOoCul8ceLn492POhi4mvsMQFVxEfm/QXLlczEMv0jdZcPK7e
	saNhoFnavxalZWnU+MKnLLL1F4dj2rkYW1GW0Ez2DDDoFHDrJbLQu0RSGYD4Tvxbj9W/Srzt/uh
	LyexMrt9+iCodbV8YisO4YnvyWQ4Bdri7DTt5nIVFBO2Ww15+qqRv+ImCpa5f1infQF4qS5SVQ0
	LUFWpSj8i9w2WKvKqEpxh4NDU8zFQwbavslqP+9HbA0FPZINTHMq0WSdc3IWyQvJs9xSsMpCJjo
	Gjefz292EcDj+UZeSFaWinn/Z0tqguK6je8NO6S0XlL8F8xyjVm6b91c=
X-Received: by 2002:a05:622a:59c6:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-51461c28965mr41799561cf.20.1778070638709;
        Wed, 06 May 2026 05:30:38 -0700 (PDT)
X-Received: by 2002:a05:622a:59c6:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-51461c28965mr41798761cf.20.1778070638060;
        Wed, 06 May 2026 05:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm11855464f8f.23.2026.05.06.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:30:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add display
Date: Wed, 06 May 2026 14:30:25 +0200
Message-Id: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGE0+2kC/3WPy27DIBBFf8Vi3YkA28TyKv9RdQF4aKgcPxhsJ
 Y3878UPtZtmM9KVZs6Z+2SEwSOxOnuygLMn33cp5G8Zs1fdfSL4JmUmuVQ8l2doIsFo+xtg678
 1NJ6GVj9AFQ3m1tlKl5yl4yGg8/cN/P6xZ5rMF9q40o6NgOOUjHFf+xPW2a7L+WHRDQ0wkYEKn
 TTCcGdFXs9y5RhNCOmhm4911uE9wnZcSM5W8dVT7MNjKziLzXPAxasuswAOVakcN0oZWclLT3Q
 aJ92umlMaGznpf2mFfE2TiabOrrJOlGXS/kNbluUHqKYLYooBAAA=
X-Change-ID: 20260327-dts-qcom-eliza-display-64de3cfc8a50
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LfqF+tISQfOqsyRgNKFdDYNR/2LiKpdRLyCLL5bbh1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+zRlbNPsDD0lpqidMJIpF1e3e0x0iIL8u+Xo2
 ZcVQeb1otWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafs0ZQAKCRDBN2bmhouD
 162uD/0RlO1xIB45jyvDkgMzmvUBFiAXXhyo6qTwMNuRkWG68ufX7kRrGgWoPpwQg76rk21aq1t
 0qwqJ03okmnbyECHbE8x9Va5U/pMg77oHX1AT9yxz0MB311nGT/ubwRLJjyg2HipXP8Cjuudd+b
 9PWXtIm0xVKBLSjbeRJnLUYbslZq+hbwP80K9fd/68BQRF3nPa1I6wHZNpOVnO4YBnogcSDv09C
 sFMffdZfyVekM6lWjRD2FlUrPf4yVaQ6pmcTTITSj4qIzLx/J0qJmhYxRqAFa8/LwOJlAgPUgKE
 Rcil7TMOtwGci+HvLzFfBHt5OpZfGBb9AKb6VDJ/wcI3eFRjAtT4EorGX76YnfGpOrCdV6wyxkN
 2/uxONqQKETGHvJRgBNeqgA9ynUSgW0RpUBKxHe0g9HqO+ITpPpIyiSqq7LbiopuHb7U+Pu416p
 AG8EVHV9NPXYWe/TTztkjigfj5DihUK9mMTerTPfba+8wAnbzSltCKrHFCaFCTvRCmzHjqPQQDj
 M/X3afdYSjRLbVZzGiS/2El/E+ODTS9Y/egEA4kP7YRu0/QYXVC4NmW2unwLz0aVTycXdnM9nd3
 XjdiIgzn0CMPyD7SMo2srfjt4ecZbbqwVHAcuVpT74vCWwPGf6H3d74KrfYEwYlDsodZqAUtSkX
 IRfaqKeshFsD+7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb346f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=lyQqAiOh5yN2nIw2-dQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyMiBTYWx0ZWRfX6E0YYrAMfV69
 V9Pg7B9aP45JI541dNgLhFdskiiNAyxx3+RfTLGs7SwRnxSvu2KiZb2ql3I1QBOo2YCGudWOqoh
 BreTWMPrPdTh3CYkykZniXC8bOGzMTejtn+3J0s38h3fB6Rq0jPfOL8I244PXQJQ6QZdTHwiUtq
 d68FQttXkY9FOUxef2QFOud+hJ3G92dQ/bqgbpudfsCtffWXXdEMwKrP3KQH22joiMN0ZueAA0r
 nA9tHSrIWRRXCIjMsczTc1sstKgzoJiuTMdf/4BOXiWdji/aS7Ah3pBUpoBaUhB+ecGdiAvKLMw
 gdwoAFyocM43gLaqyDgtqRbyrH1iem2epeP+ySbkLgZmIqB3pieg2k6/8/XfOVYFv9KYqktfA4g
 Z8VUeN76nSnp59aRUJ7a93cLEnC66e+LdTIDn33qaHjEO7ugRlnxdfZiUD2l+RoMa+JQe4+LDyH
 /80SMVOkj4j1b5mfDtg==
X-Proofpoint-ORIG-GUID: spyTwIYldu7Kyj4T9attc62i1O55CdHG
X-Proofpoint-GUID: spyTwIYldu7Kyj4T9attc62i1O55CdHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060122
X-Rspamd-Queue-Id: 3C62B4DA41B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106110-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Dependencies
============
1. Depends on USB patches:
https://lore.kernel.org/all/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com/

2. Bindings were mostly merged, except a change to SM8650 DP bindings
   here:
https://lore.kernel.org/all/20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com/

Changes in v3:
==============
- Rebase, collect tags
- Drop RFC, this can be applied on top of USB patchset from Abel.
- Link to v2: https://patch.msgid.link/20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com

Changes in v2:
==============
- New Patch #3: enable display port
- Add tags
- Add CX power domains
- Implement review:
   - correct address ranges for DPU, DSI PHY and DP;
   - add DP address spaces for P2, P3, MST2 and MST3;
   - wrap lines

- Note that DP will work only after adding USB mux, for which I have
  work in progress in github qualcomm-linux/kernel-topics.git, branch
  early/hwe/eliza.  It depends on unfinished I2C support.

- Link to v1: https://patch.msgid.link/20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com

Description
===========
DSI panel and DP work fine.

HDMI is not yet ready, because of lack of hardware with HDMI (work in
progress).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |  71 ++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 444 +++++++++++++++++++++++++++++++++
 2 files changed, 515 insertions(+)
---
base-commit: 77a9bb0193d790fb71c0edfc567bddc1b56fb3ff
change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


