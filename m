Return-Path: <linux-arm-msm+bounces-96606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFiYF4cAsGm0eQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:29:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62F24ACF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00BED302BBBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8BC3876AD;
	Tue, 10 Mar 2026 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvNdvUYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTKRWggq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A41387361
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141769; cv=none; b=pDnBELNGcLktyT4pUsXutECq6IYMAaWH5SEQWqe0z/bSAydU6k+iRpbc3VvxHpoqOUuFoHk3KA+ngxXbSK8XBrMZegaPcAkKARDg/5o3qMCU/TGsELR3U9hrDKEA/Hir/EBPBYI4GT3wHeHlWeD5r7xQZVuins3a9RLgY7B8PcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141769; c=relaxed/simple;
	bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WpdfSKcM+Zsju3j8toVpJy+L8O2vk0PoUEJ+LdZo+F2WBfCwPyOnlc+Ics5CWuj09VRGenytW49YYTKcCg/Zjr7JLlRSSYqiIrCky4jidCWGbGsiFNZKKfXR3FhjFlFwiMpRqJc+c8GeRMqKpG268qDZx6zQ6DbbkFzNTtfoBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvNdvUYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTKRWggq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB14ve568845
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y/qwFBVrh28l0ZkfnwX7cS
	s5swrg6QXLtTG7HCt/bKI=; b=lvNdvUYVrWfemxq61pdGbHF7drp9x+Bp8VAQNn
	3uVWzG/PYaJoffXDdLU5DovvKKcOOhI5R1dlSrBXucLfOrCdIDkbvnquMMzBJoZM
	/ZX3biQPyhWUB/C67MeeQMytvSEHXTynFaIJGmSD/Ul3PiviEbs1rYyyinB9FsKL
	c8DHwmkiMXNy1Q+SOLb2oeRQiotDRy4mlRSyvoXARrrPH0T+wR/iV8XNzONGazbg
	zFxvJd6TeWEvj+eUombbAf1uDY1rqmkeEpjlR3RadusEQvN5KuRlawCAv9yB+21s
	9zhg9xi0xrteftGP72y7xrl7n5v6QT1NP1Mf4N/afUEKnJOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h7wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77bc8186so3110421585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141766; x=1773746566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=cTKRWggqbIRt/fIqACXHeZoy6JzuLF34pxJlbnLYTZNE6xkezgKGbRUxYi68hVtGot
         qLe3Y+MRhwglYWs//cXxpavTeSOBZCEd3Pvv6vtpK9RVgUv9nUsvA9dMicfTYNjoMtgE
         PfI74j2rNBmYy6YbupiOjJDOq04n7yNLqmGd26qUFMWQuVNDzTmHzAmmL/PUu8Muo8w0
         v2cAzhI5Ao0gTlKYy92yCpn3R8YgLU6VZz6vxfgTyO0nUQVSqmjSVx+grRoMqnhMHRAo
         +gsVlMpRqvbnKgCbI8lbbsxHwAjcCIWZck5woZs0KmzLjXPacJ6wJUmYIVD67KqBY828
         hmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141766; x=1773746566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=HtNensrBdswKTN2X62YS54aQaO9RJtSHd+vNVJbF1Enktr5Wb7PeIfOfKFXJp/2IDr
         wZW5+avF7nn5KKLup5K49xRPH9j0TUUuKEgBPvqZd4sY6w16l98ZXpd/LU0VM5e6ySzE
         EQfqaPpVD34ZfB9GW2gSUreTxdFPdtgxptM73RwOUSyLkChF95o91mIb9arUq5+LV12J
         XQYPqztfjVH2GHmFhPlD4zjJV/AfMUcPAEuD1XCkQoQ1DY11/lCKrui71UjM4FK/baUH
         OM9KAgdD5YfIYwIVUu/mZyPAWGZQge2TjqgNr9Ynpjn8kAUHcXn3mPEC8YzD5XE4VjgH
         Emig==
X-Forwarded-Encrypted: i=1; AJvYcCVoyRT5bi7ctj/787S8POW+hh3uIIfEtKxbGYC+yvAJVkvaOypeDPFzkzVdyqQLGbonWdqPsFZbFTBqK7hg@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAhc2LHncTnmOByfozZR9My9O8YRi0i6Is+jhOLQfS6LGeeF3
	ffPjELENXoyEhzThOc5isRZVgAzof/Lw4dccAx01eEA5A/tD0f1Q9FLNfANxZDM2emUUd0QhzP9
	oNMezI6DAQk0flQ0MvHhFvmgJPmUD50em3puI89gmbi8k6/Dy2LunCY8gIttggzzATV9P
X-Gm-Gg: ATEYQzz/36wMospuzJFB2p2n5f/3YPqwtr4oWLWCIftRYiG2bYRK8QStbBl88rHMd3j
	FeqKA7YJWmtEPAqCHWz21LdOa0pwcW+pskK/Ttmf5kN7Mzu2rsOX7KrqCiBlbJVf1mKxaYVT6iw
	SnGlTIUk11RawFHo89ebXV8HFgHtBAh29LrM6kgBmK9jZCuFNw9wquDnIkL2EpsRxPobszae9BB
	dWxoSDpjXkI43IiO3xybIKxTJjFrX1QJLf6xMVVb7AVMEU5xYwiQmLhx0o9yTXNq+eucyp4TZr6
	NEyu91/vPOihIDMktn1X/VPco1CHmLvr2rSvjlKLuTMZZJwlPy0ByvzryUTgLCv63QzWrnJJrH/
	nMu/poh2XgSpcVXUOMjzRb2Xeu+U04zUipGq3a+jCBWeS
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356171885a.71.1773141766016;
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356168585a.71.1773141765602;
        Tue, 10 Mar 2026 04:22:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 10 Mar 2026 12:22:34 +0100
Message-Id: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr+r2kC/32NTQ6CMBCFr0Jm7ZBO/Y0r72FYlHYKTaTFDhIN4
 e5WDuDmJd9L3vcWEM6BBa7VApnnICHFAnpXge1N7BiDKwxa6SPRXmEeB+lQODq0KcqEhjWdDPn
 WXTyU2ZjZh/emvDeF+yBTyp/tYaZf+0c2Eyq0LZE9szJKH25JpH6+zMOmYahLQLOu6xcm/Pn1t
 wAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/79dtIL0hoBUkby2F0NZwr71kJVJLTW5zNxt
 HtKoGbbYoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/QAKCRDBN2bmhouD
 15aeD/0VT/T+e0k9st+gQW6YoLj391NXIaXPNdoizXWVYj9/m8VnvPzI4yWwLMZsyS4/u61yLYq
 17S5OEBQH+HVgrvKu9pBPYqFSQritNf9G/0hvOt04+KwKqlJzlBO9QR/2B2woU52sh4zcJ6hWYY
 cUpbshSq0bZsyO0OipVEbiYeWj6PIt0zKKi+mlf4TxbWMlX6pOUb2tKHUU/0c9v0BRNf/fZdKEj
 FQsxLzPgtHel9lhGJfsXDg2fyRpH/lrDNJ242Qu33xAQHP9Qa7/vx0/2GstXZ4f78qygz08Ound
 vR5ygwsDxAy8TveduE6uUXwbcytKBb1TXVbZBLYPaT95ssmFWQw11DvI+HpeNfnv/liVxY8NMzf
 GRab+WoELSC56zeid4QTsbVDSutmUwUdpsgtLXWgIEsW7DrDVrB1BRWq72Lgx6/nP66q43Z/mXE
 iTvTtgSmIF/OBXILTMAI99Q0tWvUNO/lMEDhaXEa9dqguwcz41UvtSRGFQgJ1O0AKp/m9t0i3Cl
 udGIQbKOUUncPTAupcq2h4sVQqMTaVlhQTNRmuW+FKT609sOptOyTiiOpMILV+DV752BUVBuFVh
 cnQ9Lj4MqQkPwFzyRWkaOE3b/j6SL5bY2SOdbomLdssxtTYpemKhI/FdhWV3oSlwm7uXtOndqj3
 s6tshYhHpVQAJZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX4m5lWmStoh4s
 eknPsg1WVysXlNe+gEpwTo/6c+PcZNyX0qF9+T2cfSxBv19JaNPSdwOZLWqVOsMw4MU7lArmF5J
 4v28uSP2Pkcn4+YC9cwbVllhXivWABz+BYqGYSP4HPfErU7/ONzpcIBq7aJec3A1dR8A4XDWdtV
 Xn3oFWnHNQ2X+FNkmqWBaThxsdC9/uPRL2i7XHZQY6dTHysdVawqExLCh6XnNUHEv/fNfP2V3O1
 yDDrKYf1BfGE6PbRnThdqE6knRZwFv6F7sjUYCHExXs/cV2pD5T/I2+1CWG9Z1fwYixZeEfKHmO
 FkqvJLt/OswwpweH2/GZ8gooeaqog3AXKylewMb+lKhYLRqNzCWhp5VrKDL5hQlWU4bmlBFJWhK
 Zqs1L+KNPW1PLxoXomLcCguSG6zteFyUBN4dRsR/MCHfkmoJyWq8eMHCfw2znKVRzH0zc3eKpGu
 Ylvx5cSrnlZOu+zK3Qg==
X-Proofpoint-ORIG-GUID: mm_z5VsFMdPDl1f5eWnJmQLPy7UFvVip
X-Proofpoint-GUID: mm_z5VsFMdPDl1f5eWnJmQLPy7UFvVip
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afff06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vNCZscE_9IHIdu0JSTEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: 9E62F24ACF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96606-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This got acks from Mathieu (remoteproc), but not from Bjorn about qcom
parts. I was hoping first patches could be picked 4 months ago removing
the dependencies and making things easier. This did not happen, so
Bjorn, please provide Ack so this can go via ASoC or please express your
preference of merging.

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


