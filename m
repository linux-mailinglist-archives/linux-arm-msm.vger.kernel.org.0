Return-Path: <linux-arm-msm+bounces-114800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BsRNBGJnQWpupgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:26:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D4A6D4A66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:26:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Orqf+F0p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cvGOnxg7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114800-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114800-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16E923013848
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D51B30DD10;
	Sun, 28 Jun 2026 18:25:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9556304BDF
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671126; cv=none; b=gxUb0fYD914XSWRgTWG2nOuQV0KRZrL3TgUO7BY/6lDdWEUPRH2LobeNpAV0xgaPrqI3nxDhUf2MWSzYKSeEp3TjZijyTfZOqprpvbXR0n9N+PR9oNsxP70f3Yl2A09lULNZi/nzRRtGVSHhgP2AbNhVg4OqXUM0XJhSoC5ZKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671126; c=relaxed/simple;
	bh=4CnhHAH08P2sZu1lx5Z5rOG9mt5xMU4OOE4XsN2DX24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhMn9c2tvNo8JI1HgGYKonY1zWdlnPaP4gQvyWEvwMzmH3Winj2kJth3jj4UgdGNj7Dt0HahDFx8PbPOw9XoRGIPe89TGeZqC+GvhEisAEW3TJ5peZRBWjUFXxrnmORkf30V1pKlmDxgnmNNeVq3inRH1mb7m3B3AWnrGZY7QzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Orqf+F0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvGOnxg7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjvo0451393
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=; b=Orqf+F0pLb/58jZI
	FhZ8Ls+LPFICJ+Jq1rTtdumHPi52Mvy70o2Yugkd0K6l1w8x+aW69fkBewkOuFVf
	tMgiGcjUqbj9ho/thCLppGa+4rStJetrNuoYz/Enkx8/VUv0yW3GRYti3Yn/UaF5
	i5Cm6xAvzQjoNl6Y177spR5jSt8J+D1wfTjYP8poRNGLyhfEY7/2DfNBfn9/EEXK
	56daBXJURjprC3Mv4Nehe/YB0ZzxGIGH9cecGNdMnix3An1TiL42O15OmyA7fVGW
	2QyNNahUgG2+CO8rjmJ0aFtS6yFv3xKzgJGNIQdLz1LOdvNm4oPMzZaAxFXcENXO
	ugjaJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8kf11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3084399eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671123; x=1783275923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=cvGOnxg7BHmIiNRQiCZ3zkrFS0Viz/xi8wBpwebU1E7F94nM74wt8X0VAdN58hAfXk
         NTzKFw+7WP2d9YByHR2nQlqjmR0BmfwIBxjGAXVH95I8BhNiMVdJVGcQrs3Tg1errRmV
         O8KkQtyPPPGNf/A/1ICAluSWC2fxyH2Fjxwjv5skeQ60pwrPGJyrzVW7SEvSqBuDV4t7
         yxxZljKYnNkWgb+FKmYym1hBdzOAsk3SVQv6YYoc5KrcBQeIZ3IwD5B2pq9YwG0x8zhm
         Rakd8WEjA0OPEaU686yHGMoLu4jC+GObn2DL+pUsvA+spVJhFh/Y4Yz3UZXcM7lKG8H/
         lvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671123; x=1783275923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=gA3lA0KT2lZf9idGiVkdiH5Od0WmRSGTOnbmBN6FOlRxHtwZTs/grKQNPXCuRxooku
         ok4dSBm2i5YCbwAaL19ObfP7XNwhE6rhPewaASi5diGTNeTchF8eH7MPxMPNVD75nneP
         APjnmbvhuCrozhaOnFWSrrFmVFJmuCI77CfBic1gA+3YKR39D5KEJ9qFd3KmSumJyCPj
         ZQR2RtqOpaSG5ar8K7SJhRZp9/Tzg8pzC8JzF4RvOJuonrCCL5Px6wl8LT+QVAc4eheA
         o6IuHLUZrXOFJA90X2GQ2QNS2ZSIXBrcZdmz05//5JhTs7GYEBXu92W31YyAPrFAp3bX
         ggjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBPZ0/XcryojMgYC9w1ZhJ3kjvbR/qN+3YnjXwv8yJ8MEkIvCYis3HNQCCmc1mhQr3sQC5P/OBjv/sXfy+@vger.kernel.org
X-Gm-Message-State: AOJu0YxprEzfRdWOZTNn2jDtocMVWKb4E35c9tFGZNOJ+huWXCdPXQ15
	A4k/EK4yAGnTMEMAZXWvtKtWiOkJZKIP+3QeLg9Mw/9hxuXR3J390FnaKKSq9U/nYRKA3VSvRtn
	gl6w66KekxwsUwnrxQe591EK1mBMSYlnopYEUy/8jTOXjuuvntwbK9ibZwKaIsslI9wyP
X-Gm-Gg: AfdE7clxWfEwq5Sok1/uq1g695gM8oRNH6aSk7mz42+3g0x9RM2O1Hs1L3y6nV/0fU0
	KqI9o7+kmINY27aC4In3P3hjVFoYmvuvmvVtY8gJPuvp2suSRfm3HgV3LQeUM96hQZ/TvqvobE/
	rEyxKy2xOnbXdsCc1yjx8g1AbYVSIrO3ceGBC4/jxUcGIuat67fSK1/8rSSHP0p62Yc706h/IPr
	I7/REN44JTEGitd9XwLoZF3HUdTo7fvuTW18QL0knChUaQxDmEfK1S5ubEkvy/RSSKaoBXGsuov
	qwcx2QHzFGEBx1/lE0tu7yR08W39/54TjpOsmLBFaoUp/FBChIVE7g4KzYRaZjSBmMvLY6ih2zc
	GVlPnonF93Zs6/31vDQfGmwn25lYUOHwoB08=
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680844eec.4.1782671122886;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680808eec.4.1782671122355;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:00 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=803;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tpJR8ANAaLpNkDfQVcPg2PDtoJzHDFbD5ZJyKcQDLI8=;
 b=UrwtznvEchsCPw2f5j1Z1h0DtgwgaYYoTKCdTBRg8y+Ki3D0VxImpc45UOndP3zz37q3BG6yE
 WXiLutKmQAqAzUYa1pzJN0Hib1HgeJhRpwgbC9jZgny/fpmO9bmcx20
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX2Q84HIIK8H7i
 b0je1sI+C07uJB+Ajul2jUAG/mkSfVcny9fDhzZp4FnPe4JDN0IRQ7dGs8t5dHiv4Jn4AwQ97kO
 DOlGB+iLd+rBDAoG30kSCgNgSsDHXms=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a416713 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: R04-i2HS6V3DnIOzDBVWOpGOVO3eskw5
X-Proofpoint-ORIG-GUID: R04-i2HS6V3DnIOzDBVWOpGOVO3eskw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX7dKK3MXZHLpO
 kOBIZRCqulwXzeyZdKxIQATkJTDHibO/RAirJG27sr3tTdIzpf/Pk7b/QadkTWW/APOPuXeXBsl
 hFZNuBtyHBWcEXCnWF0+Q+va81cXwPrK+yilJvT0wM4hMSaf762UgT1lK7zBK3FQK4CzhVL304f
 DKmLdWS0+OQkG1EjqwWrGan9TQIi0Nhc8VvSQ6SZQNzF2kzdqKFINkDD7qdOrNFP8Q5m+x9V0Ku
 FzuqX9nr7KzxrdjbWEH7TJ0YZzvZiRIlqmU0eBgeeCX3DZZQGXqBgRarFX1LFRgIy0JzyjSoHz2
 k2RMnkazgzLUjjCqI14N8K+UDq/Bl3XD863K30QKPecJLtx7aJurtw2CPv8C8e9fvD0vHJhi0jg
 yJBJfKZbj2WXpHe+kKAI9WKRWA/Ep6dYliDhUelhqyTbYVQu73fcmkuhB9pfgzTdEGlFoz2Lbhd
 9KPTIAsD7FAFSw3/w+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 75D4A6D4A66

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..94ef498a2467 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.51.0


