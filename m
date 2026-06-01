Return-Path: <linux-arm-msm+bounces-110670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMzkMAXPHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:27:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F898623F18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4831430C432B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68CE3EF0BE;
	Mon,  1 Jun 2026 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC0VP++m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEypq4GO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D373EEADE
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338161; cv=none; b=eXbwLpRcF/6D1B9E7lP/VwI2phAtPNeDtR3IkRs890nIoZ1DGd2YKYpRkgAaYrKoVYWn0S5XanIb+x8wS7tyVWa62/grIOHxPN0xKKzlHcT/XOIvksy//mmGaVK9P/8N6GPeIi3H7vZFGRcAX9kfwA8qVaGVG8U+6SMFZDKVsjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338161; c=relaxed/simple;
	bh=qzmO9vTT9ZimsgS9gDOezDShy+F93qGz6TXjYzvqf8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sX24sMDWi6xShthWDzDXwwsqJme9ayaz24So8nYPMxnX/aB5R8D5eKNAVyKegAmolSzsdgQYTIOdGHb+z9r1J3nb3Y7Etef2DDUjFSRspRWpmiVF75v9MNGn4ol01k6gtuQvgAPOjVCpXRMLZjpFDqcqS2OszISOjrwb0+2wKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC0VP++m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEypq4GO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CbwlW599801
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=; b=HC0VP++mKHGpVFjZ
	E5+/FRQ7dYD5K51//I/3+/1WsNFvX21EJ5GXExiugSlblHXUkoZzkpUTLqEu5U/Z
	S9ULNxDAMuATodw6xTk1vxwYwcAiZqMZYAR9pfhZ2MyoQ1x+3Kj99NRtgdLmMwed
	zItnagWksUpM20PBZcxs/zNQAyz7foG03JSH/96IwVn4819KLUd+W6B2zBUQrhQz
	640Et44tajQnAHSHpamWcY06mqAMR5pCXtMXeBXPABfQRiXJ/g8FKdGrekvsYvRF
	e8fMrfs2iAKcmydM5IFuneI4Ta0IbG0EJNX3QiUwzbS7ddPMHfMzHpjOiyn7ObmD
	7egpcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r9jc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so4455402a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338158; x=1780942958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=WEypq4GOhmg7I3mQBPo8kVeig3rnoLF4r+tldoB59td2qkymvzmZLsP2HoISnTlLyn
         0JCCjyjOlPesxxF0M5AsegVmphZIzDuOds/ixzSXu+vQTris2oqc8KTyPgiyT6843q+Q
         ObwoWSfIgvxdaYvmMP8LoBQCDH9L1QQF1L1TabultRNk+HlEGAzNyFWkMMQCRF6fyAMl
         AO8+gYWTeI5O4yM+LUqoW3LC0H8Je6BASO6QjrG+pvUNui9TbmnQ9f1UCu9qt34mUC2q
         J6YPWf/yDkzX1A4cHzN/NScFVCKBTyJRkC2z5jYxHJAjQbmWWVkrSQmdJBQPKhk/mb48
         r1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338158; x=1780942958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=Y9j46v/yBC0qJD33B8auFUKQpQCb4D1CC0s+x0ufdZxF2IHsd8eyUhZ16BQS9qkVrJ
         dtNDaqKEqntv7ryumpFgEyXhiqLAKwg4gplA/rQB44nNOQjPWrzdjIy2/g0OQ/j6L75b
         YlV38G0TpPrs2TkdqieuWiTKnU4jkLrK0HGTQaTwnTdGiWFwFrtLf7S/HJ7c08u/SrnS
         eUuIfxU2gr5HgRn2o5SGfT6081E1DBh7WVtSf3gvwBCLqChYhTllO6tcwkpgcHoJJW5B
         nv8pD+wNZlMK5tLBS8fh9jz4Q0+L/nZqvhuJbTm4gTbwfcmh9SPYbFtepTTvg4yzRkMd
         IjCg==
X-Forwarded-Encrypted: i=1; AFNElJ8s5v59FhyMO3S3KinPNgyMGTEyMM7tT7KlJU3UA8y+5RX7tt1L4JWjrZNWqH9OjOIqSayzlTleCv837v3C@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZC9DZXV+/FDLc68lnA5odplAntN2AK1kJI82tVIJPAPtaR9H
	XydhETGFPNoB9A+WLV9k3K8Qox0Gyse8FxpFL4p9NAm5AFuduXdT3Vb+dUv5FOHnJpi3h3sJquj
	CM25GIs1tCAavTyIEegQk8EHj87+Fheb1dENv8XyrH3PlixdcEAoOZMjYlHTq6AWdiQ8j
X-Gm-Gg: Acq92OGzCxar6Ko3CIFdsq3al6K0iC/LzmS95MDNi8Lci9mc7nFLvljQAJ4QgUh9uJq
	xd7klVko0L6Ro+ulpXc9ADmfMxj+N4mo5KkGiOev5BE73FRkcEoP08BpO1L4wfyvdbhIgF/mHO1
	GjXHdgq9CEkeuESuE30GzZz5akm9mES+j6oavmPACv5ekBoAKeOPkASjgYKSaACMfbS26M22YhS
	qiHnkDkQxglzFMdrQswhlMDcF+XppVro5qtUTAQ/QzJvJWXkHOzwNtTDWQmOhfvwKl6S+YCdN+m
	nwvwidgXL4hbU3BC5E0e0ftJzsJy+K/65BgnS1N72OPpdTWLefUoBEkOB5Q78n2Fk6d+fAXSlAO
	6vvvgoXURyxHNow4psxCXRAEiguZ7sGosPn4z2H+7kG2/8EIsNHOV4zIT7KRYgtY=
X-Received: by 2002:a17:90b:3e89:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36c68481f2bmr12400974a91.26.1780338158227;
        Mon, 01 Jun 2026 11:22:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3e89:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36c68481f2bmr12400936a91.26.1780338157775;
        Mon, 01 Jun 2026 11:22:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:29 +0530
Subject: [PATCH v3 07/12] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-7-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dcdef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=USgIuZEjIA_ZHjWqnmUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: y-96xexv3TWINWVn1QRfetG0OmKgaouM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX6veqNelisL/z
 fqXg9a3CbBmLJGQaS9A48gYAVHeYBgZUSQ3sndRsRPgyAZ0YFGL+L9t8BSp0mPmI2NSrRva0XSj
 ZZTc4IApBPjROb6GZMxA0qNxzkuox9443Fgxjg820TbX5VSU3U5puycB/HGrNuV2+embmAUhvEl
 gTUpzBqEMco+Nciwbd0uQGIMxoTDtDUzHFb0KYghW7AfHljJ5AkfSyjUR6Lb0KJgoGV40weU5YG
 h0ishzDu7MthtewhqMyIXCqHak/fNYJFhLD98O3fSTlhgsZNjIVJWQfwmGcTiC7OXC13hYFKcnX
 4W0WE3TRtSMAAR5H1KUJ5chHVmYNQOKTTJjvQ9BdJjzg5wKbOKxmIA9Y1qbJSGe1ApAqzuT1IWr
 o4oOAF1f5rEfd/1lS+pV4FYN7lNctxGoe7NOhWCi4nvcQtL2/3498NwpXJKuTH61XiZqkCKPcZc
 D92Bd1Qi5FlhzWm7l4Q==
X-Proofpoint-ORIG-GUID: y-96xexv3TWINWVn1QRfetG0OmKgaouM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110670-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F898623F18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
default values. Incorrect settings can cause the GDSC FSM to stuck,
leading to power on/off failures. And update GDSC flags to retain the
registers, and poll for the CFG GDSCR, and switch between HW/SW mode
dynamically as per the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1


