Return-Path: <linux-arm-msm+bounces-114801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8T9TKlhnQWpkpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:26:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4A6D4A62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hWe7bG0B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HYURjHC7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACE4A300BCAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C2230D3F5;
	Sun, 28 Jun 2026 18:25:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F830C360
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671134; cv=none; b=FFchRUGfcFcBPlV23Fu28/oDs7bsifVvUIdlga3RD4lrIUvYA8nW2+Q8aYFh6w2kX3XH1hPBVA76nPr6fla1zk88qP5zRVKGLdcVKBH/HQgdFuopWmeKtpqppK779ljZvrSuURxqkAxVZkoKDbh8Oi7lUzMSgZjYdK4nr0oMjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671134; c=relaxed/simple;
	bh=Kmpg2cRtDUynAO7yy0o/iSHvpnRUu362Fx7oOFfm7RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1yAgTj6c+RhXQYXs7RCRgqqI5I14//PWg9WN2WdLrNS1YB6NbhPEKrrFWmSLIsGbRrIOzXgEn6xvTH2viuKJFTk1SXSpSmHqBu8KwGnrkRIJ4BGSyCwOJtqnjwiKDgblPS+D7robANuEn4Kf5sH3VtE/DiXKjgfnBTZiHuuNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWe7bG0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYURjHC7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHinMo448786
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=; b=hWe7bG0Blx3TxZKG
	/3NGF7L60JZiZv7jEdJ4S58RdujNMuqzXO1DdXy/pWSeSzUweKBPn4ZUio5YnVS4
	c+gukrkN97b1o29twJ/aoJtuGuNqJpaItu3bW8H/ne72D2Fn8AGFFbTRwwVQOBEI
	flY2RxtqnY0iBxGkENK9F2qPN/9E+NZ48uVSV0FYR2Kt/TfriENoviYYZsmZUMaC
	R0LgTzqy4vuFf5DjQl6zodJXTj4+CcBMMZQRgQvYEDEZaYIMihVAhcT0rboBvBv/
	M/qIf3FxptGh4XX6A6otiuFuXjxclgugTP/FZtrxKJyHkazbtJ+5F6UBWVQ0jK/5
	tS0olg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tukchk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0a27ad86so5675563eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671131; x=1783275931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=HYURjHC7tkSI7thSFHx7tm2JjbDBSuOORDGX+893Di2q02mUuW+GEuFBWf70gWru/W
         Vz1XZBnoGZ02w+ZA+shJw3Qs9iUrDDegkRkwdIkJWEbn7Z2l0VpgvMBwsBZEDf6rDth0
         x6UQv/xBWoKHQHlUUnMSrxdoMPPKDWBYm496m6bHHCsTm/NqCxEjSRQLCWHxprX97uBP
         Twvc2jyQ2v1FzoBz68hKGlv7WO+2agb++rFcsGjUcqYTlcocEvRa455XKtxnwgoRMvw/
         tfAo9s+KaWmmmxnnR5FCLlDWXs8dfItMAp/LNXSG2pSrYzGZpTA9m8h51rvPR13s5Yxs
         aV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671131; x=1783275931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=EQf69Qe//UTB5wm2d1ZHc950Lyj/i6ojb5i8A8PMhwJlgnRQrgkozOEiCflyF31umF
         4iN+sW1tUTImiwIftx3QoDKQrZhwbJ4R+6Em2Erg4EjtfQZWvccSazESZIZ4Lbn9/JPj
         HPMIohXEDYDIVcYmMtjvYB8pgJJ3wRi4rkddBwUhrrZkWVz5mw+u2t3e609aAHTpbtOL
         QUKchFJHzStOWeaSYAjO7TfCw2+/ybmQ2ETBh7vos6SLySCqdQiSkpTGdhOcJS5uJgbM
         v2kootXPgVbFgCjRsocnh6g/AqpmrjaV6BSxQp2u0X16Dsc3cUtmOrNXvADqBB0G0jFs
         t6Uw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4YZMakbZYMNqdX/cfdnojuZDXaslY85Jzmb7c/CDW9pj8vdjHz+5cxRD1IhzaBX63KuNep2y6Si5jfRiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwOI5OP8Fof/PTUV0on87dxs80Clhm9o5Q6+BLLcA2OtvALObyS
	ApFJIcw8x6EntDIa3/e8rfnWvwR/TEMw2z8DTT6DkQDjgPQRCev6PtP745QGvJmQFeXDFZwivnV
	yoXMikuJ9eRYrLywYlG13jFUXuYXVth0nQ2U6m29DCFN1AQkTtA/3xs4Q8zy5304jrepX
X-Gm-Gg: AfdE7cmegQIo8sYUdL/FNkeQGmTrNYusNOvlaKue/Ox931zHp/7GesmD0Udzb7/U1Bo
	8VhwaRJuBt0Tuj8zx7NcO9kM/Zx+5DJKBAY0337Yau0CWu7d62DH9d01c23Fy5gMxCP2NmCc8Ck
	aDHi0xFB+1nO/HUlGSDVwwvJCyR6/FZvXhe6DLklrbZxpoB5CSrEyZMZPccnQbbP6C3+dh82ogM
	fE6RSJwIiRdPSPRQXTgSqinOq7BUozB8YqP7H3LWNYMwPhaMdXQIGUUQv8nTle0oDeaWbxeiqsd
	k8/M31/ZGZVSZBvK6XcFbzIupIzLn23aK69idnTPG1+CZyfl8tEpZTr1zne/sdyJLjOeCDZdqfp
	oxvjWephLCg4NYd5GTu5gz3atCbNXdVWA510=
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238232eec.11.1782671131363;
        Sun, 28 Jun 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238195eec.11.1782671130794;
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:01 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tzXgoMGOkByneCJ+ZG1Kzo6D2yqiTmTiTrurOKuJQ0A=;
 b=vOMsC+RkFWKODgCcMX87UqVP576wC8O1KhQFPbBpZ2NKXQ8EKjv/Q1fMsAlmqzi1jvMj/Q46a
 9dFJbo/MADYBvWrmlNIu1gp4R7A4AWiByduT+jS6FwKt2dNf5omb2ZF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: EvvkYf-gCCcJ5cwJF-XUGDK2nj08hbhY
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41671c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=e7-BAW4puXiLW4xK5oIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: EvvkYf-gCCcJ5cwJF-XUGDK2nj08hbhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwsruA4EDbhG8
 N55LjmlhvPMRjZVXlJULbukawm5ssE05uAiBocCWXFaL3SOJsfkoN9s0lI9TR9oJ1WmYLqwbbzP
 4vQY/tzIiyn4XbXQ1SNIEAAjgbGQ/9wMc+rFECLf5sbQp9KSZdRZmbXKM4w3WRx8T2uBlf8IonX
 ho6NkyiNw3WZjOs+YYsF68ihdCAyfmlAII57ec7YWyk2XEdb0ec4Yh+yf8T+khwYDmsoEMogcpz
 4DwmTw5vGzKXBIX8x/KV8paveSovIFCE9zTHNJUW+SlPctCJCHs85GpkknhBXzHIR6can8jCQkd
 PD0oSQLgk0ks6puaXiOTohcxJUe+jD2CqAci/xX8H7e06swEpseW35EXW9TqZaP+ziLQPhdwVzz
 Lm6K7Lv2G3iK1EC6Qd0vswSn68Nq2Ql7+sUsvBEO+v/kB1sxeozxEbqyuU4V2SVL9TMPCH6buyo
 pmNpKrvbPwg4dnGdV3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX7/xZ0rLd5IkB
 m+VWOotTjqz7voxeI0ywnGWWu9IhgT0YKaAA1lbkJTOH7cEzY1mgZlWMVhS93hO3cAEy+FGAyXJ
 Q1Khw1YGD3eoo0nuti1lledwOVmaorI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6A4A6D4A62

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..0918bcb4b1ea 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.51.0


