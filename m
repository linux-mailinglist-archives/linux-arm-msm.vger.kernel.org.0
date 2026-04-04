Return-Path: <linux-arm-msm+bounces-101806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOvmI0R90WmHKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:06:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00439C87F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84AF13032CD3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2782BD5B4;
	Sat,  4 Apr 2026 21:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKJkB52c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWKl3oun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A613346AE8
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336654; cv=none; b=Dym1rhxtrxfzxR/THoHpw0Ej2351B2R182pL+UfRPUC3TPgRD6hFqh81AgcigNv6RspyGhpxeb2h5YPrMhf7lelR6Lg6M3u2p+WHN0aj12oYyXr2YVDhyYfNCLAsHQmPjYnP7rp8JB3BuYYF6eIj0lUJQHVJUHcT95xgvHnCRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336654; c=relaxed/simple;
	bh=ccn0jChaL5zN/iyxjxDcPtJ373eleo71GyAme/3kkcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6eOoMpBulUwpwtZJ4BbonhPqRgQxKa1vQALpc06NLTFfWpef7xhEmPTLRgfVTKrmHGSpDmH0cf2Q9a1ZfQGy5WIkmDqR2LNPdoIvwllXPO/wDUOlPGi1t/2w23+f/2mQCGRGoM9ueyxY7tQNshQQLRsqDr6UKN9DNqdwTSNK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKJkB52c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWKl3oun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634KDF4b1309160
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=; b=PKJkB52c9Ekl/ZH3
	NFBOCFN8T+AnVLbCDTRW8P0Mt+5GGtnj9oRjB3SF0IGmBT4JHHITlwZp2yNzpk4w
	wWe/8lJC1crs3WxgudB3JP0ghtKv0B0xRCZzpxzluZryd3+qFDTsyg7dEelUsy7N
	qxqKKfU2PlDashhyB0Fkt1GDadgD3oGu0QQIlCxJ6v0cTvW4m49IRwKDuUheYxMt
	MXA+3kyB0NFT5Z+jHT985MeLxJlWmRrwrSlCgccMVFH7pke2k9uWstrNiJGHTWcn
	dfboBl21HLHh33mXvsftA/MbF36C/9XPYCX5VLCF+4t+f3Oh3BYdkv3bT92F3EDV
	P00inw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhq7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:04:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9010602bso2798468a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336651; x=1775941451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=;
        b=IWKl3ounOQEbLyRUtkj3gtWuX7407F5PJStNcNiHf+DDkcS3OgyEf/V0htU/WHg8fn
         MCO/Aw7DRSLyx5QPw3/JmvkihXmZd/ZQwyPu+IctCa5KV8CB/Su2NfgMF36VRBgfVu5B
         J1z8/7fWZBgwd7oPn5/mif5Z/CavT9YKrua9t6++djqnDAac0p0piCF0OrbR1FPuehj3
         FWgHe2ugfuNujGilEZu8VxKmfTlA+tXKrCAaHxzEO/u4LbRq4yBxen64YRQVlq1D4XMT
         7su5DMfUpV0gCYfw+o5Dz6x9p8rIqZLzIYXcZ9/RJbRRnsZJ/VtfduNlkNozGgAbVS0l
         F8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336651; x=1775941451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=;
        b=JXH8EFxxhd7MEpkBdGxK/4Hh//lqq1d1pPynNWq+i0kwUf6X4bFFAlXe8sgI1aJmvp
         URW30dr2DBJ5peumzkLpC/JKg0/5ZuIKAILoFXYaBgbFZ/xmifG7fgv9s3xTRAeTBn72
         sQH0qLVkOZGZGoXmqTY+eyKw6QEZt7UNb6z2DpgOzWDQ9KHMf94k9J7OlqtdKw+UwPqw
         vM8g8AH7or+3eqonDkFNELEU0HCsWcvJ6oJgVv+TZGL+qfg8ts91peW89RBGPgcDS+pe
         fIJynDwynwiObjNt+8H+hVQHZqOZ/AxUlioHRnNZeEt+zYF4h3IxS/gszS3xemU4JweH
         hPVg==
X-Gm-Message-State: AOJu0YwmTehySVHv7PflKPccMwMa6/HpXzwaFBG/zhI+n+xvEUbAXHtn
	jHNFkvCEVmIIt2tr1nqUimPxWJzOMnm60Grxzy6mnGNcrm9JqV9kOt6DneBrJXfbtMVYViqkWmo
	G5h3/Vbmo0mvpfaosqM326X/aMrtNEaRj75x+6En26OIHcW6zlfmsix7TjVL4EmFIlKidXMQr0l
	vX
X-Gm-Gg: AeBDiesxgZac/eFJJTxHVwsnoql7n46Vmuavzo/9MlPo/H1x30FNZ28AYhe3AVMhf+k
	5cf1Hp9HKqlS6HPhE7nhdBQUxDXx/fSDaTfQ97PfvgUdjHmv0PMVDeTwapFe9JCcQs/F8ZC+qe9
	hdOKIWGgRCX1K3rI7okX0+/+Zx/F6WpZcnTUlHTsVAuRyqw3zi2ak0XRx0zzgnqUOM36Ze1KjOK
	lSGG6nKyibkM+Qz8aLoI2tnMdq6uf+6KQjSN2hnl4es816mxachbWjao/J0yZyUknlhUC/YjW4o
	R5Sl5vpiZksh2o0+s+QgAVcZmlAtVZjnOZC7cmeb6kzlcFZsRnLHSjhEido6UL0qhSyMg7pZV74
	03cdRsLl2N53ZuKD0MlTJosxAsk5GKZrtLbbC9wv5P/JU1A==
X-Received: by 2002:a17:90a:d406:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35de68f82damr6916287a91.17.1775336651043;
        Sat, 04 Apr 2026 14:04:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35de68f82damr6916267a91.17.1775336650573;
        Sat, 04 Apr 2026 14:04:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:17 +0530
Subject: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336618; l=767;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ccn0jChaL5zN/iyxjxDcPtJ373eleo71GyAme/3kkcM=;
 b=JRFgBXK2KbPsL05frSwn5I7UhOJlDvht+GmFwpZ3gnbdAA0ZppSJwRmWewXWhpoI4MqTiVhEr
 9DATLVPnMy7C90DgmwdBoebxDyPBn/B2JKWyKW+ibt6nE6RA2tYEYbe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: t5ilQ0zd_58WBiz1DjZNK7jOhrHx0vNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX6QpkqcKhcnkJ
 +opr7JaklkQeFdVZ6AqbqD6Jjhvb98XVdJo+OdyG/V4aspJsJ9UwWn42IP6m6HfaEWnEQAzxCqE
 X0A0jQX1roydDDCurUkIE4dSpUJXQQgqhv26eqdwo5cNrWda+Zo+TOTtQJsxI+YaNaXf5ElF5OJ
 pOL1wedNhB0dO1/rqtGbT6vbg03aZu2D7v0jUVpZZq2fKpXPOUKpNvJLgnLRQQ45Gq29WUllwEp
 YSu96XxhMjwydEh9dkLRYp92JgLDRs2ge2LCK26pPMuiIZZEY8vYP6AF3Cb6qDFRlJvu1crIRTz
 Bur11/luijrkKSosJ1FJWokWcTkIXa4w2YWiXQcmYp8nCseWjJCIcS0C4p9aGKuEUpR5ygOO9QO
 xiA/g9sxZrA4vxqBzjMqw671gOf43AjaoMvuUMChdqEs5q7OXTXrw5GXSj0hdv3gIp3srrNNffd
 +0Vgolb56L0c5lOGHrQ==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d17ccc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VLalC5YaDb2G5u0TXLgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: t5ilQ0zd_58WBiz1DjZNK7jOhrHx0vNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101806-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A00439C87F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
The Glymur CRD boots Linux at EL2, which means it doesn't require the
secure GPU firmware (zap fw).

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..a579df902323 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.51.0


