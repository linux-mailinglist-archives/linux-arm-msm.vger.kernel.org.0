Return-Path: <linux-arm-msm+bounces-117621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H4X4G9NDTmqNJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:34:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B205C72656F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CqN+C/W8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fsSWXz3j;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF233024CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C70E3E92A0;
	Wed,  8 Jul 2026 12:29:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A043E4AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513775; cv=none; b=cpF3AISKoK4+vz4oQRsxA9OuM7ZjuEwTYMCv4HC1hIn3KeVdL31Rs0jHBmwPrpEAVD5HPhWzu0GI03wG4lYHFXc4bs3a5YYyI7gJYim69WesndNwPhSOCiOys1cGC+IIYKlDVryERDKOvpVjmVBd3x2Ew8Ue09parcWH+E5pawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513775; c=relaxed/simple;
	bh=pp/L8Sf3IhLbqrj0rhfeWuCiCjveSBpiepJjuAghGjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DYirBdBZUJSMfUO8FCWTd7vT1/ntv+LZCUTrYG5bdsIqZVICthaBXcqrDdn0k26OX1MUUe1JLPo6cp0GAehfDeiODBGq3xCgkq/v/JmPALIjBXGMlxPX/LmwHPWKsSzGGmpYm9zKFEp3bzGUjNpSuC+iHt/Kuku7DJIUNuS56Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqN+C/W8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsSWXz3j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3RZ02617307
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GJAkBWE5eBPw3nBfgXDI9r
	LQQiuebE+pFX7Y+sTNVkw=; b=CqN+C/W8DFUBnn3ceA+FxOQmJnFwfq4Z9RK9vE
	xrg7cbKnAB4wTyPUlzb0WHre1K2/eQmpz8yoPOKrRI4Rh/IqEWmsrcHzEHmZRNb8
	1Bq39mFfqHxYq415B/vasDgmrenKl1c2C9LpdPK0GRyYCTvReQNqNXhJvB/jYuMz
	C4im/l+jvhAh5UVvny6q7LeSA/UvyOFUEyg7qx6aC7ggYoOwhD8+2KYPB0znAeYi
	55P44BmP94KRFw/oOKG08/SFAQTPqp2nQ0bKLG6t1jaKlapG3tzlrCfULD/9jeto
	2mveuK4IPE6cRmY8Ba06kyyAuQH4WtIGxl0HuGfbAOaakyDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9g0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:29:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso7496191cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513772; x=1784118572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJAkBWE5eBPw3nBfgXDI9rLQQiuebE+pFX7Y+sTNVkw=;
        b=fsSWXz3jIyfhqDcH4f6Del9Ab41/ROQBxzFePvmmv+8ZLwZ1yMpWKm2DmeTX+91reY
         I1jDnU5M3e3CFAOp/fy8LMMx/tj435bi2irKlxMJ13egKkf5CXp6V9pBm+QcRXjd4W9K
         Y8XcP6enC6k9Nplxmb2Uz94u990NDGbPSjZ/z6BBsgiRX4caO7P2uMbUpj4zWFZqUmd3
         36JuT7bFZVzMJJni1KVS0QCBB1vH/rMBu07dVMWf/0JK0Tguw6RG7p2SxEccfd8n/Rvt
         SGEohLDkoVs5zfh9cpKXpW/CdBJKkyzddQa4RM1QH1xOxm1xswEsjUDwJQ9J8dcLXOmh
         +PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513772; x=1784118572;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJAkBWE5eBPw3nBfgXDI9rLQQiuebE+pFX7Y+sTNVkw=;
        b=hhCJoRTNWL2yUQJHurff0s8vcrdarvvo5NRZXOLNVr9NaHje2tJSiFBnQBJjLEF10Z
         9xAs88fslvadDYp/+ZRyA2u6kQQnmAgpFlA24K2LcyjwsOS+B2Lq2Y2peAwacKnF/Bd8
         sUKROUv/wLlEy9FU8myKi6wPxUrS51RyDI+lq5lQzScBUvH/QWryLDeDCk/5ueEWXVuZ
         eNZuDdQb3XUqIyk4buskOp83xwGl3oD9LiwwLRAfb5z5bjgoKoCy4cHQ/KkVkvGGkH7r
         8G3Af7IOjVnk7/op38ROi/nPO/MDFLiIOYuPgxV++BFccwj/tDZrcxuZ09skv5AWzVja
         sJnw==
X-Gm-Message-State: AOJu0Yx/B/m4lT5AKlU4/UUwm19rN4GwBCDzOolkGO2l7Vb927wKmj6G
	obR7UebfdrTZtB4waWe4VyVLu35V5x2iBO4Fhim6JDqnAM0WpfYr6B7d2uMnqIy+qBu6EBlQhas
	4Nn35JwtDpw7ilwFpwFkbz6qTVKV2M9ALKkyhGZDXO442Hmxnihepc62Q5p37E4ZvMDSa
X-Gm-Gg: AfdE7cnWl51GLfnp79EmVAaC2aNtIrf1NL40hNY0k7Rp3xsOdo/Ua2RXkGPLROs8b1g
	bm80y55RHa5jtWJWsscsoWzAYjPNrp8te92MrPdD0iTvdP/oyli+vdLeSsC/CjJs/S1ZezIGlUz
	sIn1ZO+PvhyA27xno4RVTexVYfzkCVCws1esbkm+blXGd7Yij6DGaiX6kXV9561NEuqYhQpq+DX
	SLDi1va1oPbWWgXNuzyLKDeNUyetAaVgVfzBIz22fjBjonh4qGcZCZLiSLhFrPo0hFweY+XZkHX
	rYnxNpIadZ3jTk8ENZbhsv8I01ImlP+GXmz3828DzwmiY0jkOI4l2/2jwrJ/mmQ3hbrMB3HzlIP
	WoQ6J+/zpfCrdr8I=
X-Received: by 2002:ac8:7d09:0:b0:51c:167d:b346 with SMTP id d75a77b69052e-51c8b2db810mr22276051cf.23.1783513771781;
        Wed, 08 Jul 2026 05:29:31 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:51c:167d:b346 with SMTP id d75a77b69052e-51c8b2db810mr22275551cf.23.1783513770919;
        Wed, 08 Jul 2026 05:29:30 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm45795677f8f.7.2026.07.08.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:29:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 15:29:23 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKJCTmoC/yXMSw7CMAwA0atUXmMptfgUroJYuIkLRjSBuLSIq
 ncnwPItZmYwySoGh2qGLKOaplhQryrwF45nQQ3FQI62bucaDIPhw6ce5aZvRg4B26lPEbuaqNn
 TxjOvoeT3LJ2+fuvj6W97tlfxw/cHy/IBN0ms73wAAAA=
X-Change-ID: 20260708-dts-qcom-eliza-add-bwmon-f1228925caa4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pp/L8Sf3IhLbqrj0rhfeWuCiCjveSBpiepJjuAghGjs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTkKosYjlS5aFzQ4vqj78tgMo4FcLC83S076O2
 sBo7SQB2PuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak5CqAAKCRAbX0TJAJUV
 VvpIEACEcMctMgFiUzt/PlEwww1Hn68R4f+YPyYAMYvbx0sDs/dweAM6vS49uFpYmNfR7gF4eSQ
 nNFCDZsT+V/KaIrfzdmFaZB57IA6Xp9QLot6l0ovu/4V73L6hXICLD+MsuRmXSh07dN7TxOWFC5
 LQ7UIEnzo8h/mLSUm7yuhJXXwKgoFpW5cEA5UWzYhLwdghvjEWvJvwjSk8hUFGjbrUM22sGLWb8
 8sQQ9+NrOJVskr2qLz/qfHjj2CtN/HeZaOye5FRm9/9Ucsm/wD5QuDZkaeGycx9qHfY98Xw8usA
 Rc83uZ/MRVfiI3mBW2BwGaNe03on7GGzXxso3IUMYnxW4d8AGGCEwaA9xm82BIZZaS/8P0sTfqi
 WyjmpMwR+bbtcK+U6G+S5lSWB77ZKLbNcH/EioPc3E7ffCMV++zoWr+HD0j9MV7HMZD6Tj90jci
 Fzep7HjkZuqhclSBt8MLjsgR//aTuhxjWGTSXDwGmREzKIaVeVF+tCdueGUYd49t+TZnYyqHpi9
 uVd7+3lNG+raVc1oR0OpZLsOjYKedrwWQfXiAx9/H38wWIU4v3NjNH+7ch9evaNR6W4U9FFgset
 kpK7CafFLFA4qMPu1D3VMLYsxHoJjQf5Z1CMoi5DnyJNZKae/tWN/230UalqycUSwQNiLiYMF2i
 oEnQ2so2TwnwNlA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfX+zycqilaYQzM
 fbDA0YuLtUYqgXQMP40MNq94GwAJt4V42/oFD0t/7pxh0SiM65WFS/cgfauGzQ9Ln9bVuGwGRdw
 pnonRSr9oZTo6yd709RAriTaRBtN3Ie4eaneMHeDZIRb0rNPgMf6Ahp7KC96mocgMJwagRUiyiE
 Uagb8idOx8/sw8zA4aFHBlINuaL53LZ2TTMOWw8y31MMSRySDx9gz7DaqhD0UsKBLP2vn3Bf5NA
 GljqIC4HEI7UUGyAah2UAAo8ZmhjIJL333oGNc8FLaFwzOtrDgtu4fR4p6Pkt2XxD3k0b1o5O5K
 zcI9cCUXuMiy5BYXumqa1JT3NNfyK8f96Bv+m9y1qEbziSKuN5PqrlvoksBJgrh1KXmmAubXNoz
 f/Q3xfVjdVWksWLXmqx3EWlrWxkF553V+7t+6eO/BbX7cRDGbyuYV5bbQ7iIrv1IO8mdOPxxU2D
 X6+YW8D6KmSdkVFEtGg==
X-Proofpoint-GUID: rNf_LX3FwtuHM4Cq9NfSRB0u-85b1x3a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfX9M2wPvVolGa1
 bO2A2EYxPRysuY9epTBm26seM0dRmjEKfUry90ZwbgV44/RsHKUYZ65L46FGTjMXC8uqq+1KBSI
 HR9s3wTeQxFuY+/dMLChNTmT3PU8w8A=
X-Proofpoint-ORIG-GUID: rNf_LX3FwtuHM4Cq9NfSRB0u-85b1x3a
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e42ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tDgQRB5FKVZLctfv5EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080121
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
	TAGGED_FROM(0.00)[bounces-117621-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B205C72656F

Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
with the corresponding OPP tables.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
The bindings are updated here:
https://lore.kernel.org/all/20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 96 +++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..ff9f2973a5ea 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3616,6 +3616,102 @@ cpufreq_hw: cpufreq@17d91000 {
 			#clock-cells = <1>;
 		};
 
+		pmu@24091000 {
+			compatible = "qcom,eliza-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x24091000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&llcc_bwmon_opp_table>;
+
+			llcc_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <14745600>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <16896000>;
+				};
+			};
+		};
+
+		pmu@240b7400 {
+			compatible = "qcom,eliza-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x240b7400 0x0 0x600>;
+
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <307200>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <5600000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <8528000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <11120000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <14000000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <14928000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <17056000>;
+				};
+			};
+		};
+
 		gem_noc: interconnect@24100000 {
 			compatible = "qcom,eliza-gem-noc";
 			reg = <0x0 0x24100000 0x0 0x163080>;

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-dts-qcom-eliza-add-bwmon-f1228925caa4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


