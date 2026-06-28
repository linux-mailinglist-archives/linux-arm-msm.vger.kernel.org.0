Return-Path: <linux-arm-msm+bounces-114793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XAApG9xmQWoPpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:24:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D56D49C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:24:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iHB71d6a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gsCLhl0P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114793-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114793-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BE113001AC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992742FC037;
	Sun, 28 Jun 2026 18:24:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7302580CF
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671065; cv=none; b=fvEilYvNgsTs4ZTr7lldyIxjvYUnnj/XeDV30lllvipR0BjnEgdXXIybAbMswQaWnsasmrajR6iWXvFGIK+9j8spUW04N0V4xExmC7AdR/CjHVGK/cKpKpzpG709LzCV/cXBWw1pGjFfVJidDthcJMK7eCrlPn6jnQLG3LLSCvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671065; c=relaxed/simple;
	bh=75L9Gwo4Nbyb7dmgSjP5dJBoAyyIjloISpF52plkp3I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGpSteV4NSdYzOeI6xqD8osHIVQaOR06eipJyY8EMUYdY3Nu+GEp+lYercDC/cs25P6+OYccXnJzEmqWEKvQFFVbAAgiJkCI2CWoaln+r7PmaWtjgpwsGl5KNEBSjJ/wgeFc9eHCHCqS3N2XOWHxpceIq44ZHAqhZ/QzIGHlX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHB71d6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsCLhl0P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjAu8444927
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uNyxdOLXPvrnl8aepSQH6t
	OHrLPu9lyqtOJV4hZUZBM=; b=iHB71d6a12wWorhyr4tE4zsiS50LJiPXqDQgrz
	L7hOht1Dhr3qJWpbQ3/GAvP7yX3fIp6i8ZSi3RavSnXRfI2kOQsN5H7pv8n0hZOb
	T8RFEht9dYmUwbghDklagUAcYufaB7lSJLnyuspWTu6CJFICoidN9x1tcwBmv/DZ
	5Z0/Z6Ui3/QJkhUCJftuMdl6bvWm36Hq7iJtMiyE2MTtkH+BdUSO1AZe7XfBxBxW
	DazyYyEcI7AmLRaVuAiz9peRm3diJ68qn3R9aZJfS2dTUL4P5VFI2/iMDFLt6Pid
	Uj02lbujDbPi++rh6pMAKarqtaEH73lglxm5Nbz+RJGWV1iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083cqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c17f62afdso2354351eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671063; x=1783275863; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNyxdOLXPvrnl8aepSQH6tOHrLPu9lyqtOJV4hZUZBM=;
        b=gsCLhl0PbCr/G6UszK9xHB5kSoH0NwyE5Rl63oZpaqS/Iqn2HL4tk7YnB+0XBU3XZA
         7RVzLOHT7zKWhZsW2o151ki4WNZdy3RfgDjVuW7hn4CUyZ2MKr7fRYN6hl93zf0z/uWm
         6zjBrd7MCyyCP3IroPDjCAzA7CHxTlcURq7AAyq01xIMdwEVkhDWalmARizjCOVVfaz0
         dEGd914gpi6xBbEbH6NsyzvtT7SdP3+7Jwru+q0EhYrVTgqzazXx/5XzJbm/XXGjEX4R
         T5EiCm10bZCaI/6lOXjSv8PM5a3Ft7rSy1xHDut0WFQtNjarj0vMQNBgSX2FId+h61rU
         gcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671063; x=1783275863;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNyxdOLXPvrnl8aepSQH6tOHrLPu9lyqtOJV4hZUZBM=;
        b=Y9iIF+m+KWd2g5ZGauOm3AGoVCusGn1EKoJREeBKofq+e9OrLum2e7onP3mg1E8uGX
         JgVdfdVLhBuMw1wTLmdh5LyLQmKHXq7oEvThjMkotxjvZMeG/mqnEK1wMfbYFXvqYmZ6
         Jazh4y57HUn9zXly2rdrYsxYCW8LtzelUVoODz/lawPRr5bBebMc975MFzMeQRUBBuXx
         WoStqAVr5XPK+ct9jl4gKhbF49lVnbIX+nSqP6QKLhZkOoV9GdHXOL9ItaMCFm6pul3q
         Yw4eTgcjNAhFiNg1BvG82YY0R65bLDsr/VsNgWeuxJOd2XRUU4aivsqkkzLoPfLQUkMA
         NvXg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4yYsMk+ekuqlMcdrm8YbzbFtKlCGXkqT6RSagfApMBhNRr5kHXuUSnMSX1VAFXhNAJJSNEd9mx9LYtRmu@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3zheeK3/1tBofyQRr5qTy2tiUt1WK72ARJhNkoXjf394g0gY
	HcRmzXvTgeRxpkq64Z8/1gKiM8HcnLYtthxsFHONxrpCKcGvGwzdenJtxtYBdmkeumQQQn/7cs+
	ui6sA3NCFpj1/pDkl/+Qgz3h4q426l8zwKz/vsnI2prgWb16ccgovq118+DZDJ17LdkB6
X-Gm-Gg: AfdE7clR6jZhpsZamxZL9bdZzrlZOaoMbaemHit/Gqq1SisjAqlU+QHmtznXemt8Ba0
	3Mim6uV9do6KFjefv7cJLgjKfwGT79e0wgL9bd4xcwy6Ttn3ItkVqWBUQJmn7vH7KTkAPfrtpNp
	2lMTr2b/ubr9Bxv6TNylOXRG+NZz+xM+6FF4QhpX0/7jUjYSN9z9loXBeuRTM8sS4bF9F/NzX5m
	+bPlqiun1aCgiV7cafgbSiPs2lb5m6bfHsNmp68Ydl1Ctalt9FU0LMkgGEH7HZv6FfY4eT1KSUC
	chNxuhxqGmV3hYQv3S5voWeHMiyh2myHopTt3kbk7TFKAZkOZYZ/8EOTPixEcrDgGL7w+hVNidf
	RkzSkETqpd5nvNa5GJFqAAvPurjS0rDXYUUM=
X-Received: by 2002:a05:7300:ec18:b0:30c:ab96:7306 with SMTP id 5a478bee46e88-30cab96771emr7743519eec.22.1782671062557;
        Sun, 28 Jun 2026 11:24:22 -0700 (PDT)
X-Received: by 2002:a05:7300:ec18:b0:30c:ab96:7306 with SMTP id 5a478bee46e88-30cab96771emr7743467eec.22.1782671061966;
        Sun, 28 Jun 2026 11:24:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: Add support for Shikra GPU (A704)
Date: Sun, 28 Jun 2026 23:53:53 +0530
Message-Id: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlmQWoC/43Q3WrDIBQH8FcJXs+ixnwyxt5j9ELNsZE2H9VEO
 krefSfpVjbWwW4OHNGf/3OuJIB3EEidXImH6IIbemzSp4SYVvUHoK7BnggmcpaziobWHb2ih3G
 mmUyFbkBZZguCD0YP1l027G2PfevCNPj3zY58PX3IRE4ZrRoGrDJKc569DiHszrM6maHrdljIq
 kXxTeDZD0GgIKxoeCoLk1r9QFhuAT2cZxxyuqUkWgWg6yU31UkPl4nefJGvA3UQgtpWUCfPn9H
 L+8fGUD92WM3pGGjM1imkAYtzCID0V4aXP0guvshmojFHJte50VnZaFkU/2aYvDMujBgLN4M1S
 gRLwaTlTFQp5w/A/bJ8AHPEn0AJAgAA
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=3664;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=75L9Gwo4Nbyb7dmgSjP5dJBoAyyIjloISpF52plkp3I=;
 b=PgRzW4o2SddLK47Q3Hm5eNNFLiSkki9yVLGnmz57FrcBQ8JSkSDQa680Sqq/oBzheZtbPJobX
 hxTLBJgd66XDIsUa5+sMHBz5AH7d4P8S6U7bNs3OOxACVuEo85A2Aam
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a4166d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyemgOkiUGGnp4gUInsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX8Cn7Gwa2Qzgo
 HqqzxGvdtfMTxYjnoXg9TFM9DEob16NH3DiE0C0HKRks4Q+Id7C9myjhCFoHNfKsylRiHROGd4G
 o6wdk7jjdX15leWFojnw4WoUdlTkcqOFaV80bc05nE3TLsD1zyXAcNXsIDkJZCZ+2ge1PvrF4DY
 sHn5skNV6es5ki0F/ybzMMahkMeUWr15lYyhQTIaaveyjyhXd26XxmjtqGStba01GoA8iIroGc7
 hL+J0RpagnoiL6exbjotxd9L+TCDxRfH21Yomsr3qlsZfZcfPtuh64hUXNEVxP1F54HvD/H1qlb
 Ps+10rT9E4AoZgX+HqbghiJXQtlk6h9l79qrsugXxiM9alTJn4p/IR1uKRmUZRwqyqcB8U36ydT
 GrZf4gTBCbrnu5u99UD7mc5907oVtPGWqfQM2IzAok4JQP4cmilgZYbPYcLC5tRHBqM1BWlIdM6
 sxp3l3HKkKuSFfwl/3w==
X-Proofpoint-ORIG-GUID: 01ixNB-ZQ0vA4EscAKQVwaqJKwY-v0on
X-Proofpoint-GUID: 01ixNB-ZQ0vA4EscAKQVwaqJKwY-v0on
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX5TXMz4Sor+XA
 WwgnFuU+KpPCeeBm55201YwyTbF0OoJCML3zt5aXeSIAhoLAuCmZxDbO64QIYB8LlubgmjNNQtX
 w2lOX3sMXee7D8i0sHdzWatqrfjIu4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165
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
	TAGGED_FROM(0.00)[bounces-114793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: C06D56D49C5

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

Included the DT bits in the v3 revision.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of next-20260626
- Included GPU related DT patches
- Link to v2: https://lore.kernel.org/r/20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com

Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aditya Sherawat (6):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU

Bibek Kumar Patro (2):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      arm64: dts: qcom: shikra: Add Adreno SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 127 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   2 +-
 7 files changed, 155 insertions(+), 1 deletion(-)
---
base-commit: 10a31245d8ba950c7fe87face7d0c190009cb572
change-id: 20260609-shikra-gpu-5432bdeaf0f7
prerequisite-message-id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-patch-id: 67fa5f31ee5109470da23db3b513721580f4c86f
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 8a8a9df61f7c7c51d7ea9cdacc52b7bdd917f12c
prerequisite-patch-id: 5b89b41d7c729c23b3b1fff9b5f572f4baa915ca
prerequisite-patch-id: acd08e91e5e2c6f4799879e48481b07167c0a400
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: dd62ebff6be6a2e2d32743812d35ec54daf91d00
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: a3026c858ffdfd3bfafc837e72c67fffe46021eb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


