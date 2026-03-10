Return-Path: <linux-arm-msm+bounces-96511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JcDLOjGr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17438246437
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6677530CD706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365743E8C58;
	Tue, 10 Mar 2026 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE00zKg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7VDCBsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C713E5EFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127348; cv=none; b=jc/U+yrLoxYwNg2n7Mj18J2RdQ5ElvdHPv9bWM8hAfgtc2+GZAwIMK4r+LmeFtnGc98xKLX9KsQEbvA9ZWZrmsYEMsVhDnH/8ierNNWtBz85KPlANYQ70UPhmmhA3yzVfuZLOwmCECkEfJKyX/2jZr6xw+IfWYbPvqUE+dfFR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127348; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksj+vtJWoEVuz6SVV6GL1LZANpG23Q6qBe9GLfbdGyLRUflOsokqWkVfomPUJmK/+8jkvQ50OlgeLrQBIv0GdqILzMgg7JeeenQ8NV7N/Ym82LllQN+f0bXZXzbeRM1c3zsIhUKBuczDAUnqy4uAp28LeDJ0kAg28KfFE53z68I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE00zKg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7VDCBsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EgPn3087351
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=bE00zKg82QpSEXAE
	sUs1tgKxj60OvCcicGr+h9SRIsymVM+bIeE+ZzpohQMX115+Teu1J3/TxLvSxX2R
	4teFSl2ZGqEpXBWNOL5B2hjg82A9yKGx00y99kvWsm2tjrUuaqrbuMhDwSCtVSUA
	sNZdcbMNJzutUticdx99e8ejvLsdwHrdPQT0okl+TyxnVQ2kM8PLSoJD1xVP50Lb
	QGAq3DOTY/nscC/ihSxVkhWcOIAAWxZ/tv6wkQtROLT12iEIggf9kA0y3MobxHH3
	NkhERxlQRyyXnnTcF9ku0QpHc/5P/LOE+BuvWj6s1AEkNx41NOscxDqSdctMJkMN
	OxCDHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy83978-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae62c87973so373463315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127345; x=1773732145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=f7VDCBsNDmcZpX98KMCuFYjEYzqB7ObYsVBmmfxIn52Mgug6UaJDliMY06Gt/nZ6lw
         F3Z+mZgEPI5XkgoF42k5zBLzFP+1RxKTd6VgUN6b5SVDAFmPoGh5RrO8WWC53jD5+bAx
         u2JshhD7eFoeFuqV1ScU0wVVGgKYKb4uluwWxidynUD2SPLrJh6tbyL9zwmCrPn+JBuT
         pONzwBNgR+qwtXZf0FEjz4OfQ9YBzBujjaYj/7oDhh71/es+v2tRO1DHt/V2i886EEpS
         Bncxq94+s1fxZcorn4iO0AudVl0CkBTLVUj3360bukJH2zhFDV9ZlGzNu2c8aiXQC/HH
         veZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127345; x=1773732145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=OV1mQgMfBZy8wN9vjp1dP5F0GfBKcP2Oq7RN7r2UXAh2rjlpzmoThmUtUa9wp94zdq
         SNt262FkcXdpWggwiWvjUiwtAxIiDiFZKBjaHtrzZSc0Q+sNKdOB6edsmJAYYFRXaWD8
         zh6Inz1IHsrdOjVyJOPO8UgkYH05k1nJzk4doysd6/sf5DUzBYsKtIqzsFGRhGRN/BcU
         y6KGBkFwFKl26c1xbR1OzSRXbb/Sn/9OrOerXwN5J7K/vookg3PODqB4pgzD2tbK1hEH
         1XgmnIbBIMUvis+TMYrG5WxlKm1FrFX7HgmbPlx6cJvR+80xyA3G2rRWpqJIosQLUc4T
         Uw6g==
X-Forwarded-Encrypted: i=1; AJvYcCUD3ACqz0QXEOKPsckjXBl3vrz4obT7FPCG2LmTLHcPSLCty08BPofhqL4m2dofbrFt0JX6J9cc1wV4ZM8r@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxsZZh9v/nptYRLn14wRLhlqyoTA5BjO2jMTuMlfTDb5XqxSj
	DHPY1b6pUtbFZYne6twlkJLcVmLBqFVjQqWcAyw48tpwE7iH/lyiKDsUS9jSBW858xyGmE8xhwt
	nU03clLpl69cwWG/9Z7OyQpeP2mVsj/LzAS/H3iJcbU/YwVaKjeLYnGrFR9a83kKwbxff
X-Gm-Gg: ATEYQzzwqb0YpPjvjeYcJW3KISUeIyEbGorzp+81b/vNuunmklbDiT0P0I4WZmxlyOt
	jFyIJ2fn//M1vYCfngM+LLSUK7MmdIupFpmGU9O4frCHx90y3PoqME8Isvk5N8I4NYPtPU1v30d
	UyQu84vv8N2aLoONAdLRiiEVM7V694W1N8n8bd1mwngHl/mXUU7PTK/HKgUs0I/rW21fzqf+VWK
	ZW64E1+PcEtqj/d+vw/pLdO2602buqTPpP2OXFfasKTzIBLgHC3PsDlPpbMTzg1osXJTmcFKG09
	dEcJ057xrakgzzEooCXZEdNZB+WYWwov3ZNBPsfwyC9J5LunWJZKQY9IEuzQV2YCvLLOAGDi1Ph
	Myih4YW/C7A3xc5YJKUqee5fJKEsSRB/n2/bFDPyivhdidkL1lKI=
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146751945ad.34.1773127345316;
        Tue, 10 Mar 2026 00:22:25 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146751725ad.34.1773127344908;
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:00 +0530
Subject: [PATCH v3 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-3-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=JpWPX2Hky7cq3Nl6hLOjQzB7LEodbqyGjGzdh/B0/3SOpGWRzPC5Y7PbSt0UPu3GoyPubIzcS
 ufCXAQU53epBVWp4MW4wO6vSR7tsCwarDtfd8M7z7dvhGKxtoJf6jlW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afc6b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fqsu2TyYhXeOzqFbGc-o6H1YZ82gl2OO
X-Proofpoint-ORIG-GUID: fqsu2TyYhXeOzqFbGc-o6H1YZ82gl2OO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX5PspvNwCaZUU
 vD70qgInyMrv+R10rqJogyFIke5BPeQ5aTucBuDEcIqfrsUNT8TDRM8vKWakV9r+P944GKbzl30
 8A817/0a+yzXP2QGj/8fcjcHKFt5npYEaRdQao0G90Tyc4C+yDLZpQkNKA8RkepztoI5tz0+zfO
 zHTE9qqBiJ2ObiZ9V9h1wrauiIPyZI7xwS44gPjI8tD7gUB6RzMcMkd1nQyan/MfkpTqZElVJCJ
 SW2J7LS2dc+KSaJ9y8UbXHu+TvlJkOms7L47d9oCW1UTHveRMEoam3QGpSU1OHRnh6YtBFCSy+s
 kNVKFZEyX2PsR+q6n5jdsPYNVkHPVui+svpOYNSetFSqun7B4iw399P2yYLFkU7krlXrElZmaSJ
 LdahDF6znW2Ej4nKqkkgyHbOpQStJ6A8Kb+mODd1VuiAa8X6SchBphxgl9i7xBoPxsOBQzHZzRQ
 tfL6zC1crkaQu3Ytxkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061
X-Rspamd-Queue-Id: 17438246437
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96511-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1


