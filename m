Return-Path: <linux-arm-msm+bounces-116522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EVuXLZwTSmqA+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:19:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E007096A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="mx/nqlH+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RnnRbbPy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F4F7300A10E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A692936C0AC;
	Sun,  5 Jul 2026 08:15:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B4367B8E
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:15:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239346; cv=none; b=cGQZ2+vdhlh2TNfOAkLkvJNOgx4P66GJfuaWwzqSokTJahnpQzGiJZYOE2fEqncPbyoPLYRnVY86VYwE3UMORsxTGrwHaosTuzf3AZh6qgSmHjkCEzsjY15VL8mDgT/sZqXt/HU8nA15h7kHi8dtbcKeVwFPYuEGXY2d4SO+HrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239346; c=relaxed/simple;
	bh=zz8kQOzV0PuuiEtF3vaop3G8EsC5NffbLveQUA/TTGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZbKOU96YYPSZ5WfFQ/XvU3x6E/swwN/+0mqEq6Ygxvkg+hUzdNuawBUtV69jjga6vlOJYXxRVQF36enJDJCnrW6PzmcIqMRXV1+Y6EA7mOyoeqFjUYa2AMPMKDnIZJFxWd+VsCkMkdwN4ctgc8b1dSgHFYW6ib71TilVMDw6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mx/nqlH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnnRbbPy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KYQCv3831707
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=; b=mx/nqlH+vQt38iZQ
	d28JFJ/cemI1rlkM9IGsruBz3FStlE2ismhLruTZkYLsHK/TAIDeWZvHAH67sOCn
	gNEXWi3bJuodCCA9h6F3LSX3oBr2HztIVG1Pnn9lDb6nMrr1mrSQ1BMF3BfMYay3
	So9w13jlRxMWddtwLFWb702CUBzfPj7+Gvc0lN8WNcpFm1sRd4+fbt29w4WiLza9
	keonQARIz/xuOcnA1icyyGgBSPfIstPNoYWlWaP7Co6w1pRXz7smtrNeYEHU9Irg
	ebAD27rNojNDVWOPktWa+NXGIHNhS6beGoxvZlp06mCqEowft93vcljxV/LWmzC8
	tN0/Aw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej8cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:15:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae455cf6dso23668605ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239344; x=1783844144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=RnnRbbPyZ75PCOVKRiZ5M+NwVqZZ3PoEo4AfgW+ugBB8A3F6XbeFiVMxngn4gQdZgV
         OjCpoqJZO4H8SYT1b+Tlfe0cNSc1f+TOjQCQVXaWpcauLIRK+NueqlXrWb1qRIFPgh50
         s9ug7N2ZUD94A5tGftr5cgg15BuRWpR5WbE6wKIEE5PyipRXlGsjMYAlSPsZbmitLbDZ
         xlVFvH2daEguSMXyHPlH/jK/hqL74BpHt5wv3+15YZd0W97zsYIi7q2u7m7Df5XFe+pT
         Or2R7G7vwbG9yIEd18Pi4myy3Jndv3tZG1o9Ckv6pPux3agC/mvthtcS6Kq1L63mHr5P
         Ig6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239344; x=1783844144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=TCPAXENZAvQofQHPomjturkOsZ73C6AORTg88zfL0IR0vd7rHSSkS2qLt8iYHN9Pwg
         LfPotFxRTLuoCFaGKmAAttuYsWO3wi8KHmh5YcdzH3Cx0RDSiLUEFHq0JRjXmUUmB3LK
         wH5+aVXYzH+zt51Qt1+Jc3d4ig0XLPl/vst1fzhyoWIse9Ezw/uteg0mJcnLIDoHnk0f
         FqLT2vCc0Q2KrypVSAPiZbyBKn36In3q57fE3jHzTfxwijvrD60L3s+cd2appTRdwC7G
         mOxIjuYZYl/b8MWOigwiZB2lNdgOr0GgE9zJ/miucsW+ocdmra/T4VZpgm+n0TnbHLGf
         8rKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg/t7Fc4HInbM2jr3Fo9v3u0Ka/oKoxX+vIJS0yp3kwigRpK83PGrh0ufW1C3YQ00rSXK3XtnSlPPgoqzX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NV/d44ovVd108ZWESs5pCUrgK8Ft6u+mVjLacNF3yH+vE4Q4
	E/vZvk2yHI5JuMzxb1yxYCvRhsniX3yvllh7IHzcgKzZlM+rrO+bGqU6j1ko+HkeIL6I2EbgQzm
	z+RvONr59EHzQDtRRRqPequCFsNW/u6br8w+7WbUx1YMOqm8ksytn4IhXDwor2Cu6/fAm
X-Gm-Gg: AfdE7cnBRaQvaMVm36LMEbxCz0q8EjoNx4KeWBUtQ0WDT0vhutM5f70pSjiiZofQwoc
	o1KU6LUVAvriWOdHmvrAEOeS9iGI5QAheOWPnR/ENzRbs0FScX3zO1uM2xzleJQOUE+Hqu1LJMe
	b6e1eb8uHPEWNXzGZ5Vkcob4+FWZeLKaxSONMIqt5wHM8J2xVTHhUrkdgN5eIupkcmWdy9l/fUS
	pgdJ+KzFHvcQdwFjZ4sELevnpYZGQgTTRedZWdANs0GCIHWAb4x1bwvP49nh6dwQjzM76sLXMo3
	TQz55QNjIOAh9OjyNRPshRC8K6MvT5zlMBNtcOe3eMMJIVOnqnKut2mEofrCMhEvC/C9wndPGk6
	OT3TASAXFDDbVJMs9O6oOlsh1VonmFc8j9kg=
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891375ad.7.1783239344083;
        Sun, 05 Jul 2026 01:15:44 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891115ad.7.1783239343645;
        Sun, 05 Jul 2026 01:15:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:23 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7fFNa6LfUvVHEiiBGevq3c8n0UAvOooWHrhEPYn74wE=;
 b=6S8MpiE/YFAUGREvxnleOYfr3um2lofUcKuw1nfRX7A8mx3JwkxdgebU3v0OjfjzNtQWaFiAS
 /og6Rpi9tCdBjBax04qDhYpZnfbJh24WgKhT+Nh+02OcLdPzXBHjNLS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfXwqRvL9IyxNK4
 ZVbslpf/R3ps0pKvMZIGycEUpE0EuzQDy6KaIQRAtx+eRuqiD44co/tT05iadTjJxdRyEwr63pF
 0bRBRYlAyQZ6PKHWmXqBxXxPDRt60JM=
X-Proofpoint-GUID: BV471fS88HBFpF8gh1SCwyWGvuJOsshq
X-Proofpoint-ORIG-GUID: BV471fS88HBFpF8gh1SCwyWGvuJOsshq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfXwvLLbgy9fuVN
 8E7SD6AUNBbsElwq6/xH2AIH/FxI0qzALxqBNjD/pVjwcLuZ8lJIiq5pjn9mPyc0YVDPI6d6IpQ
 0qng05YvsvvyiAKuX+vPXV4DBaRgnWnQCxicbS7x2l9O+woTFbt4UJu9/6pO5ApbHNXFhs2n28E
 aYfGbw79P4pJismuxNMGCzkAQ1Bq9A8vcFT3RIhIf/M9O073leyYDvGTK9GLqkaTY+hTGEoHysm
 hTljK7y6fShG4/pEc2GDsxHJVACkZExzHZ/UlDHMowpm3mVT9GpX7w3ylXCEIz8W01G8sJQLeym
 +vX+mdgB+TWfLFeGlKN2XskiaMUCaRwZuejVZsYY8tOj2yRKnMtlXejwpWsXf+vxVjrWfPPX2yn
 71xnOg49JXVyXdndTQOU+JSaaSWfg5ob+n+7GIb32rYJw7TJn7/dUv8qEFZe+r6IE8vjvc6AlB8
 VvSzdurE+h2m1hDxWcA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a12b0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 53E007096A3

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..b280d8e845b1 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0


