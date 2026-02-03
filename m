Return-Path: <linux-arm-msm+bounces-91589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNoXH3ONgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:53:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3BD4D7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E939304A563
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34030368273;
	Tue,  3 Feb 2026 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0kqsd8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB3Wxgey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0E367F53
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097960; cv=none; b=hWbCasjPyhBF7qKXKua2LS90PlyRdvrL6d3pwd/+WG3D8Ja/Rfow2DFNEDDno0rzE+SIAVX11Gq1OrkK5RW8PR1E7Iu3Lr3grVw8bSL5YLEwqz+Xju2KBWMl75LUoOC2bD83AAwO6v2tiEpmRluGEWLXdIZN2fHBjZ+Dz/SFQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097960; c=relaxed/simple;
	bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHIl+hnF8gUypAGDhgoQGPNUEWQBjyeOJO0Ih4yzpNfrz7j31OoZjLBJ86+r0e9KFEaWCBj71nLC4cubHntRzbtVl4/xLAuitZOuNF7LVdDNSUzDGc3K560nVAJrZgJCIaDpsxRZUq/Lx5eyRnf4/PEyWNWunrzjYdVO4s28Xnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0kqsd8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB3Wxgey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JKYsK3915984
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=K0kqsd8hcHXqDv+m
	men3VgvgZm9iXoRodTQL9wLGndo3xuDNk6I3Bz1MWn0LLI046yfRvt1fvqRC4iPv
	xmohmWjV6OpySZYccV/Fw306/+pe1nfhZ7L++CLfJXYXfo2ib92ZHCdbsmjETvVg
	xH8M/pFaU9FCTBAxHTSnDidcS55hkwrGzAdTcDYstLilhocidCReyG21RH9/Sv4B
	ggd/Z+1ExIZIo5k6H2VxE7htrRQWOdUYNS9tpIiulrcmKfEqGQ1qZL9YSgr/ENPT
	k30gv1rE6RuiLpXXhFbL/U6a+iyMoUWrI7VHQPn6DN1MJMx5DnV3Q7e3pm14UPQO
	wlIJng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmk3cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:52:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso38276555ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097957; x=1770702757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=aB3WxgeyGJOD5vYIHMYXDnBxJPcf8MaLXC/rNLZPc2zfB20sptqfgt3kYRM4GOvg9X
         qejGnDNrO3hh5k4lBB+BUvD/nqXeRCzsHNzMw4oiVqGiXiJM2w6hzChm+rq8VGQuHqWg
         EiKIp9Wbto6mGlMr0Kv9mV1yAXr85HHickWdyMN2ikSTXHXHn8Gtd+UQ6wBRXWxYf8Oh
         IJlb3oKFcKrmVPHx0ZjRMxY4mZlKYx8xKrBwRpGcxFAqgRrbChnGDJjkaa3u4W7Z5HCs
         1oKWbo59i1AL71lKGqYstNwQ8hWp89woOlVTwscloFrBOu9z0h5B+Kg59EWq7h5ItnAQ
         FPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097957; x=1770702757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=b+DQWZcg7hykU+N8RoAfQFT50olhL85BXtctdKdP4mUROpPjN3Sc6D08I/abbHHMQX
         WK6VIjXjY1tlGlZa38j9YUrO2M0n33YbMa5KpoDXIALGTd2gyxvWOe6YJ6rpvvckbl0y
         xykN7anFsFm2imqB/o7p8LjoY9q5L/KNy7XjtPJdEhkk2zIGTZTIY8VFRkZi4h2k5whw
         L80qIEmtqF1lCoB/51E3Nmzf63XqF6bOcmGJRnTwly+BlviuwKXApi+v4Pu0IGMNuEd+
         Enhyg6rrk9r5yAt+C9vN5Aj4JcxvUKRAW5VFojJdkIRYDhtLv1p9/SAb39w8xve1/dh5
         LNBA==
X-Forwarded-Encrypted: i=1; AJvYcCUdbvhbCIP3fdc7WtKEDUMSnsXMd7rUXpm2eqepVOgAe/0l7LRlZ+VzBEPlmSxUMCebUYcCOkSmXjsZ7gXD@vger.kernel.org
X-Gm-Message-State: AOJu0YylBUvPpc58YyDMFXAe2oONe5UnDrIoR3ZC+3PvTvzTNnAtrKV1
	WJqnTxG76b8uxpkaZfipxlgrnQP0qt5prlVFQx8n/eqFw8lbBTi/PQPIdnIQ1RHV7WHOr8Pwpvx
	R9V2bV4Ze51Kuaq/4itLG2Oj8f7tl0LzY8wfCEhL2rAmcmluDBi7WfNIGyI2ninIsyWNq2U6tmH
	vM
X-Gm-Gg: AZuq6aIU69lqaZ3zTgMYCFfccNuwN9J3do67QxLBehfumF2gQUL7zalWa0tYSSPsrvP
	HlnkKdKBNOBLYhqbYI5odxt7INvfcNk60O1MGDzJLbn0/xys+zaID+OC99Ea8cuUmo5+sXj0WY3
	EQCHA1A1l5RINfLlRbUkMaSmKYyuOzrQ05rt9jAjimIut9C843lW1512XUG8674j/YF2XwTIsxz
	pdG4TWc0s8wf7ZMAHVCszYoiwtZdbVwJ1fUODdasiI7lmxpBmTsKBmnhAFIXHu07C0sVelcPcIs
	hGAsaDakwCIcEx9qaS/vLpCV5LjlOqOnYdvzPoNVhd/0z0ubPozWbpPg9/JjcbdQDVdZuNK6dlH
	nE/T8MzqAe+ngTMzYfGIVmhorykWwfjPRVhyhuPVbgz273yCyElHWdlKGiWSui5zrlN6UYls7
X-Received: by 2002:a17:903:4ca:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a8d993fc9emr98505595ad.42.1770097956571;
        Mon, 02 Feb 2026 21:52:36 -0800 (PST)
X-Received: by 2002:a17:903:4ca:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a8d993fc9emr98505295ad.42.1770097956098;
        Mon, 02 Feb 2026 21:52:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:24 +0800
Subject: [PATCH v12 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-8-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097897; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=1uZvAUAeceK/WP/F0pOERpVVCDW2i192FDsv27hjFMUWbZ1zfioae9HdwPsbFgIfuTlV1q/S6
 RT6QhC8e2ZsByser15YbRD35K3uiM61LNYKv8pO5XpoAq2rbPQE+ImU
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69818d25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: PISPPAiZoUpIYJ5EWSYjsU1Ilh9F1j_p
X-Proofpoint-ORIG-GUID: PISPPAiZoUpIYJ5EWSYjsU1Ilh9F1j_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX8OPp092BYdmk
 KAIDV8f8wodveLT5IM5/fCMuV/vRLC5LvGPXyvLxzwgzcvVuuJKvRtpFCdJr+U/EHGX+C6bh+8t
 w4ASA8Fksiv38TT2j8XF4CNbXH3mEsYGJ6LZQWf1UIP0cYRcQ6RVJ148/lgicNq6xqkoZof/qoV
 w5D8eKvliHUReJ9Wx/nqQ+/rZjDtqs1qr3fp8Bv3p2jknUTXT7QKQ4AYzPw/RHrJkbJqmKdfSx7
 f+tZHqGTM/NdBtviB7nXG+pjfY1tUa4IHSohjW5rbYxUjlqL8Nn+DFsXbc80x8/UskZmS5sO7Mw
 qbmNs7pz6Wqd9aaSHLKxnaXwhtHXB+J6MlqBgikaUqrbR6m/oUEnf9fuPkzA3HSuJ8ioToau0ZE
 YY6ab8bEYHmBYRjZ2yJgafysWeWxxVtrf7Tnpmvt5/kmbvjJWzrd0q+HDFm4pcDo8ldsyFDzWaz
 y9J8nQ6M0Wjodp3bxNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91589-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.61.12.232:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8D3BD4D7E
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


