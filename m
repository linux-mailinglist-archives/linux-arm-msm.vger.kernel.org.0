Return-Path: <linux-arm-msm+bounces-113055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jMlDOiweL2r77wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7ED6824DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:33:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DvRqqshj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TCP7IXVs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113055-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113055-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 056693001FD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766BC2F9998;
	Sun, 14 Jun 2026 21:33:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2423C4E9
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472809; cv=none; b=N30llJx42YhKhe0sxRjruFhablgJn2lPM6cpDGXRuvoFwtAf+kDvLKpLk4zTDq3cJK9lOnH0nNhA8JTilsuFcjnY8hNR4ZkdAh6af+Rjme5/5qWBuRu5ZP2bGrPoBRwmDR1wet6ZqjkUAgs3jC/7Ngz5DWLbMU9U2XK7E6haRf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472809; c=relaxed/simple;
	bh=aKYaFQuR3mRNY5GJqhrqmXPugj5CU5q+HIdo/n3yIgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfgR0NLWJO6N54NslomgHb6wFW2S7Q6tGqO+u6yLw5scbjNOdYINcgtA13nC0yKxFvjj5TZ3QRDdAEix1m//zWBdHwFrE+y+M+beG5cxzi1rRGSX9Yyo6K3+DbITlPdAxfFX58qzhTu/5BHpMEUV/vHSHbCQ7TxETaL4NB9nhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvRqqshj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCP7IXVs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEhCX2731117
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=; b=DvRqqshjKbCq8JJR
	uAHv4S0lD8FL1S9l1b7TWhWXv17tLh/8B+qHSh8JZWbu0pyAzRp23j7et3hhdVKL
	DA1UNHk7x4U+HjMNW2a7Gc4KsyD/CzGGstSnFCN2nSeCikLD7SWuZTzGgXP8Lszu
	6vTbc5BAXVITLbnJQ8zmEUSiYiqG/4nrW80H7HmghacLSyY/zJ5ZMViHNE+RpJKR
	TNfnHFFNAlqMbRzJtcI+Rqmo4q9y9qj9i+svytzIfXFqfULH83eRhZlT53Xfxfv9
	nMAF8TbDHAjRKkHik2ywQLMGBMhr/2TX5thbyG0XtQJytOeo8aMZVzUgUneq0Kt8
	p5eFVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wvjuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:33:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso27638445ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472806; x=1782077606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=;
        b=TCP7IXVsjA2YyEv2PXYdx03tgRH6QQkwiusZKcQSB6V5SYf48GDA/Zgp2laiE6494H
         EahPTt0v8I446R8bqs4ncXKkHIoVhKrc9cValwzhsPKv+I+4YKTJ9bMdP4lZVx+6hbbL
         D5U8+EgjzcZoawrMICRQ5NH4mcXtKZZKO1lQJU0/9F44q2h2kRIQNJVMfhO70RsGV60l
         t727FARJd4+tlrwWifSqmCJ9rieDvziCY5Dd8qJ7kao7EmGoo8MzCQB7RYJFf+ucbo1A
         gDaXxw0j87m7KYV/nfsPu/K9ncvueYjvQFnVpD7Jg6+VVoBmk31vcj7gCMmJIwxBmEm/
         6dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472806; x=1782077606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=;
        b=qdkQ0mZoBfi55gIx+xpt+0LUCwd7hc03RAyGOlkR3zfOMvpUI/lv9vX0icwOPdLo/R
         B/4y+fA+J0dKP5Ok1JHe+y4vxiyI1AuVyJlAPToL4oRwYjKuV9LHXlwngUhT12aUstu2
         IQw2G6fUlKDaKL5TDAOBdPZT1Q7W2xTj5kvnHVQOTgJNGAw6ivGKhI9wolXq/fVBm6n+
         NYjUzpoKFFe+tufbaP9orfVlNxbKt7xFWsiJizWOz1gXlTgaUWG2P9mV6TfYrpWFAJVX
         pkc8DobVuG+UuVkpvAQS9Gh3VUrIwKY+a2XTecUhqelymN5CoZ+XdDJ5MRBAnDxRqHoH
         Xocw==
X-Forwarded-Encrypted: i=1; AFNElJ80IzKGAflJVvbnol5lzVVF66yBnNcyVNds65GGXUDzwLLUa5greLgrWmYszxoVSysDLQGo8rmnYRNhA+dc@vger.kernel.org
X-Gm-Message-State: AOJu0YwL4Xc7rGvSsiBsjYJRwB1ZQA2lxVtffN7s4KAssS2offDr6JJq
	+JyrPL4+1BX2eigRxNu6bPF+sycjzHJdEwy0Eq9ceZn6ynDbozYod0ZkwdwXXXrxK1ApSmmTOeT
	QAF1wUyvSgk9/lnhBYrDM2tlM3r7JRdJkwmmka+bBDEOxfFZ8Tv4dNaDJ8Z7c6TklCB5g
X-Gm-Gg: Acq92OFiczdCCWvx9pp/zuo8faykbEyl7io/khrvxdhrA/GtfUd2UGXXjKekVV0BDx3
	fv/5A7CHmDCcscxj6GVbKRVliIEohL8VJ3cqxkytZhsX1D3vcFkbYa12QaWEGvy0+I4XpcmvSQa
	OMVnKV7ihYh1EDzrRs6pIj5HI8yCyxbNQXxpscz4QI+Ss1UzQQKZ7j3C80c2/eC82miUtcDgBha
	XBE2fSmAT6I7c/utmNhihAzvTjadTgZqy0VPIyyRhxgpsClaaMjw6XdaSsPJFgRT+OdD//XkrpR
	jna5hQphOoDhVbfFlfMtc+YlopgJHyAclfnWQAq5EZBQDkIke/kEd2W28M/UwUufXXnSKup+TwF
	jE27xDwBhl9tntK+UHApeBF2Mni5rk3uNz0lzgc1EWILAYQ==
X-Received: by 2002:a17:903:944:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c41216d384mr127693975ad.28.1781472806146;
        Sun, 14 Jun 2026 14:33:26 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c41216d384mr127693605ad.28.1781472805748;
        Sun, 14 Jun 2026 14:33:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:58 +0530
Subject: [PATCH v2 2/3] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1143;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=R79xKmL+sZwSyzKrrAiP2VZ/Wn0sPCCgxYAlwy7UjP4=;
 b=yglw6Mgw5GWhrR/ZbfN4m9aEdZT4bjZDfQ92ZeoxePei8sXC4tz6Dq7Wn02eKzL+XQBxkhzli
 l0y5fuC/0UiCE8iWe7/3pfwwu104Dj9hZAY684jfSys8jDndsDHCPsx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 8M-MM9w_-MQTIQW5PE5Sa7OxGz96JuiO
X-Proofpoint-GUID: 8M-MM9w_-MQTIQW5PE5Sa7OxGz96JuiO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX8V/qxFmWLfCl
 y892pf1vrMrqvLN83HUzLm5RadvSoxIQgKLgOyYTpLdjSwCNWMfaUSS2x2FJdxYLh92SZaYUjhd
 E22gxc5R8FuvULuskdHQ7F0CAVvHtmg=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f1e27 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX0xs/HgyBNYa8
 KU731kkZsTWZHmxE9UA3A1VItCziBsj4kNL5D858ydc64oNHXYPuedCXAF+hYdc+Xv4jWKZJh1m
 MEDx0n5GyJOTjh1uZiyfgomEW2HxoBilaHObOwB8Q8+Vsi0NuxqOOplDJC9RM1cwetd1A//bxHh
 z8yW7mFMWM+rg9H42yPbV7jsdNemIakjyQClaf8oxtrNyKtnB9DnlhLxBqXdy6EnaceDmj1n1Fz
 qQMGIvO7Qo9DUGkQQZ0riZ/1lhpDT/Z1o0wJ9OonwIQ18M6OSR7ra4KdLydcpuD3m/6JCwjn1PD
 RGyhbfWh2dl22xo9L03ArElDWwBHVGPZ8fS1fcdMkiNAXPVfvX6aCAmmR4nOBVPDsOlH+Q4Xd2H
 awKLXnc9al6aVG5yMKlB+kAh9FnF/vXFgUKaEMzDsH3BqJfxTp8iQaH2u+yI/IJo1e+4ggQtZPv
 EiOHG17IKrjLXq311vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113055-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 8B7ED6824DE

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.51.0


