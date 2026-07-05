Return-Path: <linux-arm-msm+bounces-116514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u2AZNnESSmo5+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4A7095D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KsFB6ywt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aljOA60z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116514-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116514-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB73930056C1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA4E369D5C;
	Sun,  5 Jul 2026 08:14:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA13655E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:14:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239278; cv=none; b=oFB4lgmOnBg8epovSG/o1aC/H84152jZVxtBERX+Iw47MWn6bysLB5l7Ky4kNZAef+lYQfmS1BElgjzjgi2DSXQ7WaVPFfBJsxLPgxHGkv6tLi7h0UkxW4H3/UV0xNcM2w8jzsOjq97cxy+AxtRTYKPv4yo4NKxk9V0TMS8cFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239278; c=relaxed/simple;
	bh=ze1VllbOqZnKEAM3Tp176IzqqLnZ/N83LBmJnq4dOkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRbG5+2f0A/NZPskBBxAcx29OSb0rQuFt95+Vg+P9+QNAwa5JcJakNFm6GeTVsFI/3mWFKNpXoJP8zD9mvtIZsGWaFqLWCgdXOeBJxj5PzpgDp+HdIBjoRbfyUPojYQtEzbAZIPFlk4XhWJfk7Y9N17Wf7l8grSF5oFBYpEjahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsFB6ywt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aljOA60z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KYvje3773468
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mmu9NS1f13WBdz/LPDqPCJ
	b63FFDMcYOR5yWaGxSv4I=; b=KsFB6ywt4epudRYYTWTMSQw8+mpUkjXrF+Lfvw
	QpVQMQhh7zKPQ+GD7fcYQF4MdsQGJwDBrZx0zZ96jaj/PvF2/hQov+NVHrybgudb
	th7LHRztP7xVnZ56IiCLaDuXkYDjDAUK9Afij97RvN+E2MF49DV2ENABIUHX7JBl
	tgK3JBHvr7RAc36R+Cs20MQH1ZV8MdvoRabm0JPmnBP+6Wc4xjnlaTf/oXJ5TD8f
	0wxIw6Jbgr7in4Mm7QWFdry8lwhmC9bI2iUlUEwFhFFStbtPP57hSrAUwa2pavhm
	UG+yFV0hVUEJCk4wMr/Xa0H7Pp/oC3xRtR5C6+PWlxM6rDsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgj6cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:14:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9a700dc0eso14544565ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239275; x=1783844075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=aljOA60zNUCOuYNdMqhbiUyNgk5p4l5Gu0eCEi+729Owq9esBTEjRmr5Sh34hWpMqB
         rojtisfPKQMbiEOLlN7r3NRgWpyuF7rsQ0iCaFHVWHQzky/ok4vGvx0pfmNnuLCXzkjP
         ayLbr4qobx+JlIQheC1r7aEM3BI60YK0m0gX55VCU02xWM14W84Pu/R1YxoYskCkkxTH
         XD9/X0oVg8ReyFS10SHPbdLapV87PlW+vGld0wwMvNRRBCBH5x8fPoN0jPL+etCwdyRH
         z774drCn11CDP0BvjlZaEn3efxOSzi6SqJBaym2frK+7EcRqwWc1nC+vQfutZbwRsLbC
         Exqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239275; x=1783844075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=PLoaFHG1HMku6Bppr30xaoSKLCnfp3F62r5QLXNKGVChg3z6GH5kLGKwcNj3GzhVju
         JIHoCiEYXTwydM54XuAZ3grFnspA2edcSY6DMze1gKFqJLU3U0JekLefBiX2zJNuZyih
         iSkLcIJECBxHW3U33b7mQcOh3feS0vzSh3IFBxY6BMYnNGgEzLkOEsJ8bwsohjSuPYC8
         1TFZ0XLyEHOn7tv0FbYwN+Z+kW4Xks4QorrWvuFyKMA1CMs6Qqvx42RmCVhLFO4UbqWC
         VBRW6S3keNyMJ6ggaGB2GKYoGqxUE+yNHKkBvLvMADjt7Ksm1dG0xGEkwCAYjy4xQysz
         yQtA==
X-Forwarded-Encrypted: i=1; AHgh+RpRf7NDtfIfScMLn1lkuO3w8J+3lksU92vIKcQ/5uTx/V4DObFLfuLgb2JjDJJaHmfjitkpHJqUS5iVpoNF@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6EmVRla6CcHNgTX5JGJh8qBLaWxi5f1oXC/PCoh53TNX/Riq
	uklvW+uK+u1FYnSpJfT8THOaZA+oyXcAN+j9lOj15xHpVEOJD4nOOy493HQ6ZqOJti6IF5Kok/d
	D+6OJxBrgjvm601eQBOHVZ+e4gKRHDUAFoWZ7EikSVGsj6JAAXXEdjV7Y+p8+55+6EwZv
X-Gm-Gg: AfdE7cmTljPoBVyZeO8rl/nm+Wh58E9+yZGs19/hb143DN6Sdnff79PPQ7fIFfHxV6M
	1iW9Y+zzBctEGgTg3/i1rWBdYI/NG4MDqSsfmOM6Rn1EhOwubRDnCcLy2korE+qKZdhfROCGVF9
	UnfQvJfpAAMg6DMsqi4oitCPubn9XJvqS2+e/BzUkO/TwbNmRZRKnZ2EmEptgRujaOZIiBcjGbu
	uGVmJ79gq24lGslMaTF5K5Q2DSsACCHrDCAzHDj/itjNfTSpU/4/0pRzOr+Mea5MoeJRC1cKzF2
	9hyh4PShxeE4bHPlai8ceb4a1M2ZF9TL/H61vI8KohyNN7rb0zNwbtF6CRctxN9baApTSYxkDfZ
	Xt7bdYMTo4y4ONLWJCQ7UktLI+biLXOidDbM=
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795835ad.42.1783239275127;
        Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795445ad.42.1783239274618;
        Sun, 05 Jul 2026 01:14:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Support for Eliza GPU
Date: Sun, 05 Jul 2026 13:44:15 +0530
Message-Id: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgSSmoC/y2NaQqDMBBGryL53ZFobUQppfcoInEcbcC4JCpS8
 e6NCwwDb5b3rcySUWRZ6q3M0Kys6loHwc1j+JVtTaBKxyzkoeAxj4Aa9ZNQ9xMQYhUkkcDijsz
 d94YqtRyuT3ayoWFyyvEcskJaAuy0VmPqtbSMcGnD/V+TtfIITL3nsRA8geKKzLXOEfNZgCsOQ
 VxWPKFHEnF8d9b6wySbXe279mLZtv0BUyuNi9sAAAA=
X-Change-ID: 20260704-eliza-gpu-eccf1946cb3c
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=2808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ze1VllbOqZnKEAM3Tp176IzqqLnZ/N83LBmJnq4dOkM=;
 b=9a9GOk9tVX4B1OGU6WAqIUkEf1RpZhendeSNrLU98rnIfNAxFU45RsIYy6SGBU1u/wg9t8oic
 STHhe5reKfWAdXRtit78WKmncVmmgtFAsoHhpnTcMDyGfm8Scoe32zi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX3e08EtyXoSDE
 jFVMUgBDEd54H4X54tm3zt2LSN/JCap5fTgSFYZ76OSR8rt9yd+SpJ3+n9LmZgMZxANVfGvopXz
 pVaHwRq2vBAeaBrPIugX1+d3tdE8XHY=
X-Proofpoint-ORIG-GUID: A2g9an9uRnfk4OAn0rwKj2fPlAv4AnLd
X-Proofpoint-GUID: A2g9an9uRnfk4OAn0rwKj2fPlAv4AnLd
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a126b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bIsOEyWjDz43KqZfDzYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX4BNf6AKuT/wy
 h922cuj3iNpO7Ad6DGkwmGdTMCDit008Y1EUt+2FKGe4mRU9WZmiix9DUGN1kr6jBrrn+Ww+B6u
 TyyPpcfpUlG7mhPhzaZAkUa6s+n8xowlgRAY0LDoSs7vDvUzd0IRrhigOAkOsadb9b+HNvmpQsw
 IrmFzNlXK/UMmlWPBqm1SnsphB0ie0gXFwAuG3LXn6av5jd4IILa4XKg32QAN16Ij14EWXoAvq6
 mUu9NMjo7YZJ+qrrnnw1stXAchjjBWx9XcGUGuIdHVh0C7kYSzf7wGmAjLjg/o0sm+lmjFSGilG
 D/cQnXgjSfER/rtQc4COfeuyTj5Nvp6bgqee5cLCMWIpFGrht/ToEnaYS33dgoB4ZMZH4CEnBol
 1ygTpHSz/eWGwMikP+IXd+3pDmR4lMRgHQXWhg2mLh79sdNwckIPregEK84awCFWtGxUFDdi3e0
 vZBWvRQlPkOzhSEnhhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 28D4A7095D5

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include smaller cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

The first few patches that updates driver and dt binding docs are for
Rob Clark and the remaining devicetree bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Abel Vesa (1):
      arm64: dts: qcom: eliza: Add GPU SMMU node

Akhil P Oommen (2):
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Puranam V G Tejaswi (5):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   8 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 190 +++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  81 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   5 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 14 files changed, 756 insertions(+), 28 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260704-eliza-gpu-eccf1946cb3c
prerequisite-message-id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
prerequisite-patch-id: ecae5e45a33a79ec3f500e3f318e3a0129fddfb7
prerequisite-patch-id: 19fe32e5af810250eef42dab488c982ef70c055c
prerequisite-patch-id: 60dde5421adbc86f355b4899bedd0d7a1a0c4e5e
prerequisite-patch-id: 58c9dbb18795c662ea22c3a82b07d6465f604e08
prerequisite-patch-id: 0c6e220ecf2b42776f990ea5b98ba4ee97d229ee
prerequisite-patch-id: 0e0bed1091d12c102e2542b1c2931f61a543f2b0
prerequisite-patch-id: c0f22b4ff0bb79935848dde50c524f6063011ebb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


