Return-Path: <linux-arm-msm+bounces-110223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKAdEJhCGWqauAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:39:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B68DE5FEA89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23A01312D37E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD103B0ADF;
	Fri, 29 May 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElR5DlSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyX7IFBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FAF3AF677
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040122; cv=none; b=t5Pa/lA8Vfbd01kFH1Kc0KN9jLmGtnsq/+Wfko0GN0CmmIqlUdemZQlxCLXVCyCAZEivlL1z9utIEEzbvueKFsfF7kz3p+Muc7JQQVr9gwfxf44zPtwYnosTLTB/vGjs9a9fyWHP6DMWlYitdLz49vTmCSB729w1XaRf2f4+WXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040122; c=relaxed/simple;
	bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLh/w2Fo4Hq2QEaM3EbA+3i5dj+7IEhDdWPBkw8VG3bNvClHzFtno++oaQW18uAYEvdCIpmHfGtKhE2lebxpOd5n1hB5+mmG33q4G9f0gUgpTwHDpntp7CG+DCcw8ym2vby+qwinVXAiE6RYjkm5SxEaIupxhSQ50AigrrGVX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElR5DlSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyX7IFBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4ThCE4194208
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=; b=ElR5DlSetqpYNsEs
	/vgTuafi+h+pGUlX4p9Ta3nxUPhhiVqOwSRwOfmZrtJQVF0a9KhQOnntzApHlDbq
	LfaS07A/eOL9Oqy9DnBQ9wT0vKGven299IShWrzePRCt/8Manj8iaxgPI6SziSKw
	a+IqooysEiLS5iwDktYD6jvKVCHUKddragedu6yomNAJWLobIWCqvc14YbvGVurm
	tUTdJ7dvOsX14ChwDXuY3CUB0yDX/QuSF6rbYQR8okM0qnNSDxatR8qq4MtvAqiz
	J4Xr3ZR1sx7AdcxnLkYbfBWx42L6l/erpIcsOOe8pO0aXySJ77vjvALrndYnA/VJ
	tlVV7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te0qaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso155190655ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040119; x=1780644919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=MyX7IFBU9ziNQOWSOQFNh7tl1OKk/DZhwL9I84vGFoMy9QGgDD+4cxqjdlUwMbSVGb
         eN3qi5LeXWDRXxMIIccUB0gJtpNpURkm5hfgfo1aDBtI8p1BqEG4bhF+mN731L5RlI5x
         VdSrlW3rhjXsXDjjp9PXp4jyfjss13OVbEI7lm2IT53V9gW5CCqqypYW6gPK9IAdBGIl
         idKC0DAm8fxnIWQ72B9Tm9OvnhGiI0eg5ejMMOTlHL/OvacB1oULIy0PDAlwJ2V9rHYh
         59Hf3dw8OyWw3wi6b/mn0eV8MVqmezyya1+5zDj8S+J7Dcrga5vtmGbjAgTrAV6m79j2
         b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040119; x=1780644919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=asYDIJVbFHfcXPu/62rKb+uw5PO3rOOKez57Np2Oj7IaA8o1vTC1Xe9vbNvwtDsvSE
         IideOJvJZ9bDEOrCyU8YkZweByqeuCRKNqywKaZQD/OBmrsJek6AoxEHC7e67tDtgxhZ
         WHycYqIHo8+meoLS9t3H25kawnFhWgHPyI8Zlp8gMu7t/E+8SIYAVhM9UQojC8hge6zd
         muJPIgP7uh7geHySEa7yD83jsZOqwTIU+OS/H8FzXIyp97u/0BTu4CCgFsOOweAS8+O3
         Hwo9SroGqIN0j0t/zr4o+DuyEO6W9m/FOplKVwHlmX73bzwbZKT6Jt3QNfYBgBT4goTo
         xSmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pi9CzXTnWbqGD0L2nFlOx2RnWMqYonOEzOOwqZjOE3KBhU/hS2EfWNhhBhNetl/fBBsYgfPeeuad7al7K@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuxdFnmvS09V9GDec8oguQpbu9wLKyeUZ+94BrznhnneEIOrb
	N12AAzFumJytXwGarYOl21DmJrLRkYBedZomLYHsnzslLcvGQAt5z8RereKbTG/PmLfnKlMLUyA
	qnOCoMQMN5QjpXY/J3YTjnhOzJhyX/215cVkTZLMCaPHD++hW47q9OpIuPEhNUY2vvteQ
X-Gm-Gg: Acq92OHpKtUzLgkN7sp31ghEwGMUhbdZQVVqm9q78GpxlkAxWUm5heU2HD9tYZCNcqO
	WkXyH2Pk832X7Xw+qekEea/5kptaafEc4tmJcGyppKSY+Oil0V0NgLrxz2qTz+fpwx6/T9wEPKz
	L+2mfKMTKXLb6uo8VSqSVDHxE9B1aTVvFkn2IBlRWmtTNel73ZpKUZq0Ch4YXs6Eo0GGxGek9pc
	wfqhmDjd/5zSIhjDHWdCsQl0tf7VA92D1eoR/ZPaaqRAjw7S/atw3T9RDZtHe8zh0yj5a0iepVc
	qgjeHU4QZBiv0sr94HDIQyXxXwnwz6WofXEgHvg9aL2JMCwy9ibX9LD+2SUKVK53ZGsCR/ypq3o
	AaynCu1bZeB/sLrWyaTRuy22Vw3Dc6qyBbyptCJechUOE81EDAp66+c0c8EvquXI7gB8I4IhB4h
	rXKSgiEMbtvW0DDJcUgyY5yr65mc4nZMA=
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286805ad.41.1780040118569;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286415ad.41.1780040118068;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:17 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:59 +0800
Subject: [PATCH v8 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-2-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2070;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
 b=FivbE9ySB0pMWqRMINmWT2gQ0iQYeXqUZZzN6HFlewOJ2SHoOEzAjpS20neXRvTHs7328fNIN
 pBmimr3MGF/DYuMdIaVJZ2312XXGQJIymwjsiX7gQhdAFjR4NAPws6K
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: ttuhrBnvSRczR_z8g1GSjDv3TyM_aHsV
X-Proofpoint-GUID: ttuhrBnvSRczR_z8g1GSjDv3TyM_aHsV
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1941b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1Ijdk7qaabStWezMxE0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX3hI3zPbNY6l+
 lTtxomxeMlxFlk1FTpKLnsJvMj9fdzB+QHEKDPTWWZ/5BEap27wHMb8+BIyZyHzOqfpQ4IgTCAB
 32+mwTfRQEW/TeC8qYb/nMUZ1W2lwoTJjFl4OPo6otuWM6JWaWlygPxXmdauFGjmqQWAtuJ1nTF
 ypF6JnyrTuNteF+5mifUmeLIAEhkRXl3LRAUvhiYhh1IEsh7JG0jzzml9BbxLiC4+zwOhIqEVmI
 xYM/4wLJUUfMgx08YbSKE1U7/EB5/2o84BwKXqoFIhVqtpOIVJ7eD+re8RvHnum+V1dLroEuRzE
 izC07xtJsYkhsrJj2NGNsNTlTMbajp1Rp3Xbk7b10qjhjshYGItUxsAwwe1EoooZQw/+KrsqkhE
 ghRlrONl+N6a43JMWwNj9Fa/roVHvL8NvIvA4OZVNsHL1yjBpfM2LOhpqAiymqb+KnfkhKqq14T
 SfQi6UFLC2YhZlyc0kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110223-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B68DE5FEA89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 3872c4f37987ebbddbb040722adaa252faa40a73..5a85568c5ee1c5b656131607e7aef1b8a75e020d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_hw_ahb_clock;
+		goto err_disable_bse_hw_clock;
 
 	return 0;
 
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_hw_ahb_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:

-- 
2.43.0


