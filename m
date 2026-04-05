Return-Path: <linux-arm-msm+bounces-101860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJU7Ku1y0mkFYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 026DA39EA85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8469C3008784
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F75B1DF254;
	Sun,  5 Apr 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BblqL1CQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxTbjDnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB21A6805
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399653; cv=none; b=KWqdWNSSMHUuk8ae0+Gy5svczTjS2cJX5wjkFAoFzMSTXWU9A+DqUA3zMdAI6zQW9sTmjT7+Ml5Vavg8muwoHh1MX07j5nfc5nI0o2t17lliyjeOV27U3RcN9DLesBY9Qvw+JyhprDUgGU8YGbWuAFO1UyIyGSA+ljFe7NGQhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399653; c=relaxed/simple;
	bh=siwXtk6AIkGe6Aeia4fyjnEKYh2k/bm+OfF3gEyRIcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G4UTuu2Pp7NIHc+52lwq/LyCYndSo5oD0EFfJkUvw4aV6GTW9PpqlNGZRg4sBhPrHoCgD2gedLybTW3if4ixfPwbOx0+SXyxqbo04W+dZ8/K27bR2xCWfFuPFDYgQYkaQeoWoO04li90RMBGY8p3jmSTmFINsUo2mV0BWkHhkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BblqL1CQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxTbjDnh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353p69C2836996
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F6QtTYepW7Zf0tKDTJyL20
	HOsHE22oFxxA7+qowz6Qk=; b=BblqL1CQ6uS+3EpQdtMjo8u7krLxTxxHl9bYDV
	gruvNHeLqZBfgLnf3dhIz600HAmdUbrmOM5c2nXalMfB79QKBeDwCkL1j8NLvO2H
	cJCznP/VmymxXrh0/2Zv1dSBsosopPVmN60CVxXObifwIFvkrS1QA4E1nAse+8dM
	vLJmsOvGJlokm20Z+KefyM5NRmfhlNA5a5spmA1UT9/AmfsZvqHqJhCez/aliaLF
	NTA5/+hN2TUaYQ9f/BGcZjXnXu42Ec22w/T6qQ3moXgkIZJAAyzwH7GQkA4vBxr5
	8ZSrQlQ5ERnOruDcZM8YHwOPRW625yHmQY5L3rFAOXOKfHJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfjpbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so7524201cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399650; x=1776004450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6QtTYepW7Zf0tKDTJyL20HOsHE22oFxxA7+qowz6Qk=;
        b=GxTbjDnhVcuYKMUY75PPBzWGYqB7qXoWMXeBRQDqvJM3g8s2B8nkRrtQhe10XJN2R6
         YrHIjOeqMXdK4d39+T8ZwLcU8kdoYYDJqFMxqi5qHUCzGlIyTmLSvbhu413JU5dzTXWD
         wr9RXz6iYdm3T+Y9Zgv8Kz++XWu2Dq7KUKyci7T+FU91QqFmeDX/t7aHU5YMmqp19CNE
         7FZQvf04O5T5v4Ngk9/No8NjyKaJbF3M0QORioqyNtg55yOgv216vMVbMOSrs97j7zmM
         CwtuBB1QHWSsOM4GUh8Jx29Qw46xaoEaVG2gPzPFwEkGiPiNetDIybHtAre4iiuFubFv
         ZG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399650; x=1776004450;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6QtTYepW7Zf0tKDTJyL20HOsHE22oFxxA7+qowz6Qk=;
        b=kPiT7SywzrcgRqXzfYKb3ItcyJDtkOlHMiISRrLxJVhmaSDqoPP293wdBJM6iOqsdd
         Qqvztw5nt6peojGhsKPN70JlOsPULLv/cFFnEFnp93q36BGczIdipwLVPlc0uLgaWWUH
         Sew4Vri+BPJ0NBoB4hWpLe7TRTmV2POmczCuqDW9d9Lu5g2i1M/jrU0DH3rQs4bApOg7
         MvyNL0lb+3NqKcqj6xBab/gTz/RlzhgYXsGBBfVNnlH610e2+KKAMXh0xgi2VeCQlcwr
         NJG8Bf+36pqD7ATeELjI9PTqHRgtp4FY9wrKkTAmKqrpEQJsWZHoIiBKVeUTxsiZRNA3
         1W/A==
X-Gm-Message-State: AOJu0YzD+3AUv0s5dJVyC/ZxQVoLBOY3ub00L5PLwti8edj6YyDjsGM2
	r66WrMDgDtQQeq7TgBBHKlPsYWeLfktWTG7rQWEHR+dLyhjlMJL2ldQOJKUa9PuqG6XBxcbIaVF
	powQoAX+mpUTsy1+9JnZ3/Pzp5I2xtSHq5kAzSRXfA/aWqS7raWQST+d3mqJ1DofGVRgN
X-Gm-Gg: AeBDiet0QLiQefI5wTv+wTRfWlGbOB7ksKJmPCapba68thfnOdapLNZVTjy+G5GXNWL
	x6R9t/0ZixZdrP1AieCARDiYNZK5yQgCg9qLnRcdolKBs9EZB/GSgPLkcmeW/Ax/Ns8H51U6jp2
	A83Tw0jKx2JaTRnFAIgvgRZ/SsVjAojlVznOoWbmi4Crim2idIfQTFikrx5q+lf2xjsTZ0SXjGt
	GGyjtRyKEYJSwLYeS+fEw2gCsVW2Kga59rfNJR1EbNHHQCOcGwol6nO7tgxhNqSkD2RZhwU/BrY
	Gro+qaG0doQwpoEo4nW4N7Id3ZOsSR7C+YPrirHwRHe6rVBs2rohz1DV+al0uZP8sBuRTOuirQA
	4JZhcMgjHlhvBmwvu0oU/J2p+kb8sF00vJo7LC2r5jcnI
X-Received: by 2002:a05:622a:7290:b0:50d:5dac:f9d4 with SMTP id d75a77b69052e-50d628b91efmr108247361cf.29.1775399649853;
        Sun, 05 Apr 2026 07:34:09 -0700 (PDT)
X-Received: by 2002:a05:622a:7290:b0:50d:5dac:f9d4 with SMTP id d75a77b69052e-50d628b91efmr108247071cf.29.1775399649474;
        Sun, 05 Apr 2026 07:34:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] qcom: display / dts: Few corrections of address
 spaces.
Date: Sun, 05 Apr 2026 16:33:56 +0200
Message-Id: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRy0mkC/4WNQQ6CMBBFr0Jm7ZC2ViSuvIdhUegINWChA0RCu
 LsFD+DmJy95//8VmIIjhluyQqDZsfPvCOqUQNWYd03obGRQQmVCC4V2ZBwq36F13LdmwUA1o5Q
 2k7nMSF4VxG4f6Ok+x+6j+DFP5YuqcR/bjcbx6MNyHM9y9/59zBIFWmMu2pRa5+Z898zpMJk2q
 l0aA4pt275n10QW0wAAAA==
X-Change-ID: 20260402-dts-qcom-display-regs-11d61816e172
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=siwXtk6AIkGe6Aeia4fyjnEKYh2k/bm+OfF3gEyRIcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLXTEi7MjZVZHq+DxOR+aGWZTZWkvCzTTc3k
 SFIZ7pXcvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy1wAKCRDBN2bmhouD
 1/PvEACT/aPItrcEZaAM+XdnLlqNioGUm+gYcooMD5pW8nlzMsJnzQ0iPIw3RwYlFujKDtYk0uC
 f0ORngcfGqEpYkJRDzFM2ga19HpFwt4JvfP+aDjAmPKuSaaKC5eOfZRA3DNWg3k32LmtvWN/t8Z
 vFUSqwcRXMZwpJ6UHVJXOT55vcCKo4Jfm4s7+xyeQMUqhlXmkUjMwn0n4ozBgmESHpDS+6JYBJZ
 UUpWB3eX46iwSrKNVf1pHoFBXhxVK0Ei1f1jMMLvqtDDgIkxOzbpcYoh1HtNgmlU/hLf8mAfT64
 6KHo2E8oNaBMnj+BoP4Cc6YNkR9/qZaHv9iEMp4H9thegDs0CH1L5pWCeRgL2wFL5G2neStxldR
 BM7sJn+YgKwrvWrXpI7L/NNzHNCz0yBM0G9r8WyecCT2Ae+7+KOx+bDSOn/WtHYzSeMC4jK047W
 UM3DHk7ZV8PosRW08sa0It6q3PqPPO1FHT9uqINVAYffh7UmpBZshHW2P2EHvdDuU5tqArdpHoW
 p8ByaJQGB9xx8CzuB7TrWji5zVIGaOZQLxbYZE7QM+hHXSJodT1Dd97xGtRpmz4PZ3ANS1BB7R+
 I5aRH6Q+1Ojt2TxdgbRsf3iXQT2pk4cpOb/pZrwKa59A8QUStbAJhw8GKAnmmUkVbCTQO1up96z
 KBF3andsjdyelmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX103I+ueFi1Uk
 fsNirKNt/offKoDQrgZNzDp08TXwsR+2HjZSyghvUA7U7HW5dsZECayOHF+3FoWlwYUiPgVqgtU
 aGzVVZ0zeA/k0VEIhPqSiyewIiLgl384hu/yeE00GVRS6xnQ4cY/sHJvNOU1Kindg7fXRndrBqo
 YdWxwoJ5zZTpFfEEYGH/t1v73jhdOhsvhCWgCAusmtU7IR4ZLpc3PbT2MTyN9gSwBcOsRF3SaFP
 a9XvzYHuDoQy5mAGKdEUwpJtjQFGfgN6Le4PLy24CdEXXn8tpvNyGar2Qneof0qY/Z5pmwaE7MX
 WwXwuAo/Gki2aIlxtSbzmZh6SE2a4HFAZj3akR/0Mdl6UqsC35N9diTA6lPeFGZCdYm8zLEt7TP
 9YhP/Uph57OlVl4m36mIZV4YW6oMdJlTc1pgOJKbqyZRbBjVteBL8XHIRHxNue/fb1I2OPl4e8u
 92yrGs3TbnOIgW1II4w==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d272e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=-klF_pe9UpKp8yfWxysA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: S5j1JFWqPTXuXjmecwo46_Ause_4Qk9f
X-Proofpoint-GUID: S5j1JFWqPTXuXjmecwo46_Ause_4Qk9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101860-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 026DA39EA85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v2:
- Patch #2: Add dai-common.yaml reference (Dmitry)
- Correct subject
- Rb tags
- Re-order Eliza bindings patch
- Link to v1: https://patch.msgid.link/20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com

These do not have practical impact currently, but make hardware
description correct.

Patchset can go via separate trees, but DTS should wait for bindings to
avoid new dtbs_check warnings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      dt-bindings: display/msm: dp-controller: Allow DAI on SM8650 and others
      dt-bindings: display/msm: sm8650: Correct VBIF range in example
      dt-bindings: display/msm: sm8750-mdss: Correct DPU and DP ranges in example
      dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP ranges in example
      arm64: dts: qcom: sm8650: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct DPU VBIF address space size

 .../bindings/display/msm/dp-controller.yaml          | 20 +++++++++++++++++++-
 .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
 .../bindings/display/msm/qcom,sm8650-dpu.yaml        |  2 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml       |  2 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml       | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/sm8750.dtsi                 | 16 ++++++++++------
 7 files changed, 62 insertions(+), 28 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260402-dts-qcom-display-regs-11d61816e172

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


