Return-Path: <linux-arm-msm+bounces-95301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a6EaJposqGk2pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:59:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F01FFE8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C6093023D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236523D288;
	Wed,  4 Mar 2026 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0IAgbg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApZm3PZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204FF2248A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629144; cv=none; b=Ca2ggltgCmbg2W7SO1zBZESf7Zb2RLpYVHbS1sq1FNXFDt0+38/h9/bcZSbKdhAs4/DqoYFrTwvCfB6suZKHLGAh5KzmGzkKTnOMymJR59phPwuEVF6c3yVtSVanZdeFG+qhb1TEwWyBF88w+xbQ+YNwjgmPOS9ymPw05CS1aNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629144; c=relaxed/simple;
	bh=bBysXkvToTg/D23q142BpNcuFOhczPliT/xNmNM82Oc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHfUY3tUTlJm2GkOKN24A5dE4s7ueGAeXOMLTKy8ywqv0ITUWbY2k1EKhlz0hbOgtCc/SL5CYNm+biHKAmmuo68EGLvVVXnTRS2378oZ57peoUaVzCYWhtbjtzUxmU/sXZMXaqCiYgOp3ESjG2SDVBsGkWIhCfPsdNl2nIMBI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0IAgbg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApZm3PZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6mr1203226
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qzf5HxDIggFA/Gb2AY/ukH
	FIWaqqRzZw0bCzF+X9vzg=; b=b0IAgbg0voYqIE723owTsQGVZv+itVQ11Kjf/W
	nB+0D0IjczhgWhf31WiM5NuGdN0V5HBu6WLxgQIMZawjTmj9g5a512+eSMouSy3m
	jNTLL0FUh6mMyWahqvTyPaqwKZZp42ikOrsxHytqac6m/plzZzcRdwairR7iAWOL
	QCjFqZAtt75XKF+zlsrYHvz7tY8jUqMxdYKInqcqBWEtmfQrDK319wu5PfYbUOd6
	T5tEXiY1T8noIqiMMzyP65WjEpSeV7jrA5gO5sXmyoD6pPhJNN6ZJO3GsUpjKZFY
	InVx26NGU/x7rGIeCWEe8vcK+BhhEN6d86AogaJrRuclyBXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c711251ac5so4203780885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629141; x=1773233941; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzf5HxDIggFA/Gb2AY/ukHFIWaqqRzZw0bCzF+X9vzg=;
        b=ApZm3PZu2xR4ShB5LcIaWrX+XVQYMj+FYBh+JN/CXj9TOun/zP3OORAP3dj9eJ9K4B
         BxjsTsRn70oMwBd9HoxUpqEaXMG6Gc66MLyEw+CWOWsjoUId0+xfgu8WxUV3UyF0nRbH
         OuEVjMR3yQM1zsCUCe3BXXv1JmS8bmWxMVdEXbN52BlSuY6v+AVlFgJeOM6zLvGBb4B4
         4Sd+8c4zYOZ63fRw+I9CJDpZkum1SdKKFrlMeeLEPhbVcqpx97l+SjoSLRfvt7EuHH9P
         wSwjmzUUh80i6FbJXREn5zPB8+o3ewndwdRYZr1CtyLXd0jD5PnTTqayEcTm2XvqPBln
         NBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629141; x=1773233941;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzf5HxDIggFA/Gb2AY/ukHFIWaqqRzZw0bCzF+X9vzg=;
        b=JAd0OVk+8i5e3mBNhVKKhxdCTH9Q8+jykyLWTwYVck1mye8Z6kA+Uxqp1AXPzgDuAk
         FjrcqPXG9OLXq9lgi65st+xZKbBNTGbjxIQXFGZUV8mgHilGbJd1GZ5O27oRYf27UQzY
         spw2QJXOXDjeprlyupXc76HjNbzplOq6JqwBu0c58A7HkvLQS00hhnqIPjl8yvmmyQbE
         JGN4RiUWOP1IqLLHtJc+AyZW49GKbf+n5io3QwAd9r+KH2Tit0JUF4d6Qv98nKThgQKZ
         bVe/abkgI9P2FkOxpBVYaB7F4k2RhL1Cwqe/GQtKzxjd10D20duFwcvH++bfQ54zkfZ0
         zsMw==
X-Gm-Message-State: AOJu0YwihCk/n37P+YSy4UPzL0EdLYie/JG225g9efwMt4wxDu9IY0tZ
	fXUfRa0yJviQ/lgQ8BBjfDLC4DIjmQlzT8oRrKOhw4K2AI9Jlhj2gxKvkC85bsudI0C6VuHfG5w
	wjrvRLDVGoWybxQrkLexPipIbtT99DHx+Sm0L3kQHVbVL2wKsKhlwF753W16AnwxEEFkH
X-Gm-Gg: ATEYQzzvHdrxLjQnQx6Tw7tAgbvFq2gpP8aDkG2oIYP7gX8C5pvtxRD9T3dRiMl1/qd
	mWDIfDG1QOBzXnZanMV95odLmnHnE7MxEX+7yNl3ieW95o4kacxLRc6zppn5f/ZjPah0gZv8xxO
	ii7pdb64ko/VMLALPsmsBqAPr3kY7oDUKk/krIhBitxHR7Jpj0TRfsHNLr3E0aC6+p2ecgK5E2k
	C3br/l295iRND2o4gnd7S374i8tNafB1avO0WnReDoOZy4vpx6ap0Tg230BddDE+dXj65cyUsMz
	TzlWYcdVC/zlEkReA+YXNYQv0+Ey6NYLsol6mat/VWFYQqPE7OgB3/BYyfpLKYynMCg2n92aVda
	WgPwJ55B92vTvwT8AA+2MYT/5+33pT6rL0VTUPcr4lWL6
X-Received: by 2002:a05:620a:1a03:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd5af0bb04mr210371385a.34.1772629141073;
        Wed, 04 Mar 2026 04:59:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a03:b0:8c7:fdc:e871 with SMTP id af79cd13be357-8cd5af0bb04mr210368785a.34.1772629140582;
        Wed, 04 Mar 2026 04:59:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:58:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Wed, 04 Mar 2026 13:58:42 +0100
Message-Id: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIIsqGkC/22NwQ6CMBBEf4Xs2SXdlhD15H8YDqUtsglQbJWIp
 P9uJfHmZZI3ybzZILrALsK52CC4hSP7KYM8FGB6Pd0css0MUshaKCHRhhEtx3nQK7qB3xprVXW
 WjDJ0UpB3c3Adv3bntcncc3z4sO4XC33bn039sS2EAo9UkSTbtrLtLj7G8v7Ug/HjWOaAJqX0A
 cJCyGW5AAAA
X-Change-ID: 20260302-drm-display-eliza-634fd1c3c193
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
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBysXkvToTg/D23q142BpNcuFOhczPliT/xNmNM82Oc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyHaMigZu1RbUT/E3DkVmWTcl4+8W9KloYLz
 gk2xj8vfoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagshwAKCRDBN2bmhouD
 1/amD/9UfgadqxYGh7cuJY5NOd7nfZRC0SsGrkdO7bbJ0Gd3/4o3OqUTSkoarmVmUecG52FCt/a
 uvrLybsaqXWaBhYUAWLpbztZ5Ildie/qJIEHrsPQf3t5pZymj3K8L2TbE96NOI7JMUSFcN9eeOd
 bcTynYDAcd6Vr3zwIteXORA1SE5RFsqRkJtVV5nueDORiddpaqkyhM9shQKGMajslXewb9SZVzB
 xrVAETLdhou2QDvmovkAH9nDiNuBsYqMB5uMs//coQuto+fZ2N7qQD/VyaicehftAJl4uEX07Ys
 FWoh9eX1zx4AhOAqOVeOFc8JhnLrKsv+vehWpAUEG4n9ad+NN6+jd7fYpClgIHkV1fJgkR2PL3u
 3Eha3RPYu+EeqLh/njJcwfIt3xkzPV2+7FxSifALV31VbwNPJXHjZdCUne7QEWLEDEh2WvPDhp7
 VmVCegvsHh7NNdlGIxjmzUfzEZbfN1mqv3j1KqY+GAgeH22XIF28X7z3gbTIL6/rSPfkUqqfANc
 bKH02lW1ig+wxU14uWkTYY7R7rMlmAeVeBz52hBz++1K8/As0B7HFaUEwroMQAiKc5NR9wuT+TT
 tGgSR+UjUG0Nv2Rc9Sfsqc99WDngBl4iwYhN99F1PwyxqpYSnIje/W90ocuxtJAWdBwX6op3OmV
 eKWFtAypzd8A2rw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX3IdztxDH6ctn
 QWWhpgOW5CXwRYSUik4z0GOcSg7NJxG8DBeBWq1W3RBrlNhQ0c//TluG9flkAtUkIDvJ+VL0+YN
 jnDd3///83edd/ed0l5AnAxCR1N/Y6Umpfn4gkFaS4NrBI99MPgck36iKCZJVpN5F0vMto9zeIH
 1yEELloiRbWrtPWmrfewgzwt1pQJueiCNhqDY8lNwaC/+ocWyLtWswZCL5tjEkRRgQYX6wgFclD
 2Zj6TaK1NRelPi+HoJbxoo6Yh2GfT34BlOj6df4V52b32E7UGs+1XgiQLdlLZz7HV+OQs5L1sd/
 zJb4K8oGF28LoMH2dYIM+5ffVpHA6CKBgxwXvsPSWK1i8NM/zVtuoKCus1VtEwZmuu3cSwyOlEJ
 S0YiaEtn217qAoYOIChFMM45x629qFMOQKVzijiSjo9y7jQAKcdeI1lN7+zudJFEPRx7IzKrGra
 vfDeZKGYme14o6LR7Qw==
X-Proofpoint-GUID: 5pvkru6WrnYPe5TlztNvaPCUs0kTkYZ_
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a82c96 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ji9SQXcMXxRat5kPLT8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 5pvkru6WrnYPe5TlztNvaPCUs0kTkYZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
X-Rspamd-Queue-Id: 233F01FFE8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95301-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

Changes in v2:
- Add Rb tags.
- Changes after review - changelog per individual patches
- Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com

The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
removed and added HDMI.

This posting brings working and tested DSI panel, while DP on USB was
not yet tested and HDMI was not prepared.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      soc: qcom: ubwc: Add configuration Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   4 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  11 +
 11 files changed, 884 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


