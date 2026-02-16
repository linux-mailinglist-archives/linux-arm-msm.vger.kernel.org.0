Return-Path: <linux-arm-msm+bounces-92959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLF8E+Igk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:51:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1733144259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB71C308BA7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812773112D2;
	Mon, 16 Feb 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orDWyPrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlI8zcfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33E30EF71
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249452; cv=none; b=HQgvp1Yc/HhRKFIc+qiLmd0I2uMuHoJX0k/2dsAt6SW++huWmcop2J76hfOyxgzifaAZVOywCwEsMFmdFKbZKaPrGLZcOqqz6DyrhbhqLOChHujkLiUw3P75yXps9HTG3BWjhz9MWH+bb1JrxBBm3ScfYJGBP7Rg+lDhzm4BdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249452; c=relaxed/simple;
	bh=LHXejiw9nM8/bAfVKLaW9upd6YxeimoD3dgUvRqrd8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XD7yeXJtTeQtuzwDQhI+JMl9Q1TOBQQci4vanapkHd1mn6JKTCZ243maPOqhE88TGWcPdVjsl4cDqD+UMbTChDhFFbN0lofg6pCzmlnLf16KJQ3+hVY8O2c4ZDe8l6NBRnqknP9QnrRqwFifZz7CurisRUvmMYEnJYTeIVkDV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orDWyPrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlI8zcfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fxIu2802100
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PY7Qi8wmiAEqKk1E6dpN8j
	O8JjYeEu2MQe0uWjjQt3M=; b=orDWyPrxG7MZ7NojuPQKnbX6Muh7rdPDHqBAQv
	zjdnYlJ5V32W1C98awS0lxNt4P1d2pl4goaxuUTR2eu3qQTN9oeQTZciICk9J5Qi
	nJv/Y62lOs+ZEP0k3D924Aop1T5qUSsW2O/ea/5et1NpnDlYEFq5Zw1iO9jd35LG
	+HV4+92TpiguIFbOJ5SsfQTgCH9KKG+O77K9OV5PV5mXBvOZntL4Yg6gZgj3eM7/
	QzvXiyNXFSj+2JFE+u+oWw2NunMhHQOT0c4gXiZh27stKEFtAO7x3DjexiKuVmIz
	/fE/USPzM64FjaW2BOfhXihq/eQhWWIBrm8tE4urG57knrtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugq7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so1794253385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249450; x=1771854250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY7Qi8wmiAEqKk1E6dpN8jO8JjYeEu2MQe0uWjjQt3M=;
        b=dlI8zcfptHunEAksQwkEiKu9RvgEFDdOtnIAhWWWgw4//ysKPpP0InwvYjuzsmSS22
         iX59WFc8LNIHMODGeyzZyc2E5+ZegQ7yr5aukxocD271DHbUghQga3yjEGsH3mON2OmR
         E+qiXkSPU/J8u9osmm98HWr+0nV9E+t2i0CnUKPf8MvVM3JHt4CsNnMfiTdJXeJSMl2R
         5356U0v9ZryoIkl3Q3CYl/03rgeISFAfxWgZKCNqAN5u/qRlff0uqWXSPGefjRdEmMHW
         LEo1ShwXobF3y+ftCFfXMM598JsZ9E8rM/JHQdwhCW0x06RSrolhJenQzMALK/7yOi7u
         r1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249450; x=1771854250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY7Qi8wmiAEqKk1E6dpN8jO8JjYeEu2MQe0uWjjQt3M=;
        b=naPFdZlmPMy8NDFkqD1fD26S87idGsNV7MnYW6Z29y0pSUdnSoLLh4qMhooR9HDoMq
         a+V9R0LJO8Iuye6MUCacsQHgkK+B4BGUUzxGwnft7NUnxEfc4O7sHN/UQtQFVKiK/sce
         WTkjqQ71Onr44Z2XmCsixrdGJR/+qKyC5/Um2iPQEZRMe1s0ZbrQMJrs+e0CRtm9rs3u
         h1KLEXBmp6MogOxlL0bzaM+tSqR1D4J3XuAdBA+dWJl1KVlnGZgYeAOZ2iGqmb4MZazD
         uQrlFClQE4T7veBVwrWHBqCSBLpKktDVmxw3+gXfm700fb4obbs8TAu9t/3yKQjSWkoW
         Mk7Q==
X-Gm-Message-State: AOJu0YyrGFxmmSOwUIbH6Z4wwAALMpiKUS7Omrg0Gj1VfuLsRQGrXkc0
	zfuLAQc/iOwkeVOwn6mBENRiclvSseE/HwkfXgfdt3/Pjw42RQd1sgKwr5CuWhM5yPsZ6lPLXzC
	tRuzw+1//BIfh+gU5GfF0buj1Naf0wbjTRuG+4RvpKSwNTUkp/l6omRfJxAyz1CzTtnPA
X-Gm-Gg: AZuq6aJ0g9eZXdtck4c8iq/8A0nG/9Z6IfliCtjQdNkA2KODVswJ8xqQDgoZxxGgJQP
	t0ttanZVtutHqmsv3BMQVyUSy3C9HHfbAKXQ3+/b70WZhst1mwkBMw0Qejte0pjs05vt/Dm/QsW
	95OCbQBmFQkmfVmJ/lMGfd6cyK9HOYLdi1yG2XmdrParePNzQ56mdmmKlIr+sTMaS1sitdVvE8i
	oL0h0yNTxBSrEr/ka3cCsQqdHoMzx5TzdLQ3QBQX4dIdBTb1eIBXkDSKhkU8qfkCmqQcjOOD7YS
	d2Q1Br8OXyHFYiSPcJJEDVuLEFo14z5mjrcQqiA8AGcVSCJbNfOY1bb64Y1CggovmtLRwbPuAKL
	1DYG9iHCi8veoxtYlKdXTjiou7GseiQ==
X-Received: by 2002:a05:620a:1712:b0:8b2:e666:70d with SMTP id af79cd13be357-8cb4242a53emr1309197785a.43.1771249449452;
        Mon, 16 Feb 2026 05:44:09 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8b2:e666:70d with SMTP id af79cd13be357-8cb4242a53emr1309194185a.43.1771249448874;
        Mon, 16 Feb 2026 05:44:08 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48387ab1974sm74300465e9.3.2026.02.16.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:44:08 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Date: Mon, 16 Feb 2026 15:44:02 +0200
Message-Id: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIfk2kC/3XNTQ6CMBAF4KuQri2hbfjRlfcwLtoylTFAsYVGJ
 dzdghtjdDPJS958byYeHIInh2QmDgJ6tH0MYpcQ3cj+AhTrmAnPeJExnlFo8SnpgL0eXUtLpfI
 9l3UhDCPxZ3Bg8L55p/M7+0ldQY8rsjYa9KN1j20wsLX3zw6MZlQJpoWpcpnX+dF6n94m2Wrbd
 Wk8ZJ0I/BMpvxEeEWakKSswtebwA1mW5QVBY5ZFCAEAAA==
X-Change-ID: 20260120-eliza-pinctrl-7bb592ad63f1
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LHXejiw9nM8/bAfVKLaW9upd6YxeimoD3dgUvRqrd8o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx8kL6Vbpow6meTyTDtY5iHNyFDw2G9bJkqod
 Q1k9MrCX5aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMfJAAKCRAbX0TJAJUV
 VsTSD/9cjMt+BPVRbCGuje12CH7MwCfpgcOZUNJPWSuQe3IEeQZXpwbWHEK77p1sLKVltFgXaz5
 iAuMNrj4LpowhLyJwS5kidZ5vF2w6Z4HVQ+IESrKAyDcc4c+REP2mJeI21+ys2uThof9p6GnvzE
 TNL2O9ezy0xMoXfGF4+ACWSfgfh2MOSFA2LC3mrZIUnBAU0TyAlZN+bEWKzkXMPcglZWjCGei74
 jsa0Dfn4SThZTd2qatyKCBjR0pCf4m/YaAHkWU0vhovSYhFKsAsssqrecu9l/zsInR9NWkotk/Z
 IEPf9Q2CgDLClLvWhF1a4Gx8ymTxXWVWWxvkxuECi7iDom6MOTW/vVB042IwV42h7mVAk0EORqv
 ZftRxBJqO/sLs+5qN5YN5yo0yf3+9B/zTAcDfh6DYtorlVnnZriX2NOJU15IVkPR133Fl4UcMXZ
 Me1yM6rVWgeJnhRV4b60oul+NrrPDV2UmtOghXOr53FOkkIL3TiDqKqrxtNxcqG5GL9AbU6E9F7
 ZJFl48wB+L7EHKG2yXcDEX/+uohENU3lATSj2Cs69aEQZq4x78ExXWib5ynNKszqc2qj/VCytPn
 Jt6J/IrcCtN5OVQ1DsowIlDkY0kuRT9kALGUY0Y33dparwuCp/9BWaTh4uADWOZq39u7DHa5iQ7
 HbBJOYW/CTq2pjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: tA2ATahwIeIydtjHGo8Q4xUmw9v7cQsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX4KwrlRDUCn6M
 e+7kQ1nnqTcRMstkHtwMFIiLbj287QoooO7/D7sdxu38vu2mZepZ8mjXYedX11DdW7++7wwSpwS
 uv8TmkbTC7bvC/Baob0vKVd3cE1V8cwOOoSdBq3EKM1VKXYbM0gZHPKV9rXjcUXtmEQ7BSCaBm3
 QFiOVZOIJEdWsgJEWGyEWlcsiZgpTWv+OBPFObP5AUqkdI1RxUJsPxB4q3B4VNVSY3ZdgOaFBGD
 Xkg1QPCJy3ZxsJ41+JhRLHuykh7CZyKyHawIb00HsQfqQiXWt46LGCCTJX76DRt4CJ6d/jd4haV
 e+Ucta2spI2OCIgAx6hvkLed03GhKqR90FfdNy9r37VcQC3NAURBOmwv53yMcFVHb+AZU4ojxWY
 e3IxwtQlSWZl9NcpqstZMVkGZag0L+Q8Rz3Mavwq3XUUqYnsPh4oU+4l5FXRY4EGo5owF6hNHZx
 Gvan4gLvVlTPByyuapQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69931f2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HbHxh8WMmCZXOywC3UYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: tA2ATahwIeIydtjHGo8Q4xUmw9v7cQsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92959-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1733144259
X-Rspamd-Action: no action

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as built-in.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260213
- Picked up Bjorn's and Krzysztof's R-b tags for bindigns patch.
- Picked up Bjorn's R-b tag for the driver patch.
- Fixed pattern for pins property.
- Fixed gpio-reserved-ranges, as Krzysztof suggested.
- Link to v2: https://patch.msgid.link/20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126.
- Fixed the gpio related properties in the schema, as reported by Bjorn.
- Fixed the SoC name in the module description in the driver.
- Dropped the defconfig change patch. Will send one later that includes
  all basic provides.
- Link to v1: https://patch.msgid.link/20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
 4 files changed, 1697 insertions(+)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260120-eliza-pinctrl-7bb592ad63f1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


