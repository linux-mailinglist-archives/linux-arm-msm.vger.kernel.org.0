Return-Path: <linux-arm-msm+bounces-117031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RshbHT0aTGqZgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:12:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C453F715A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:12:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lkb4D/1X";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mk61ycZh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F384303183B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA627355F2A;
	Mon,  6 Jul 2026 21:05:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A52C027C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371912; cv=none; b=kT3vK0ZptosanCZVgODBKX3QKasrAy2UBbS+wqWaGHeYuWWDFuMth6mctPVHJphoby/o2An9DiRO2WKjAwLXGBahHBCZTrkYhwuXkVkCJGx4TcKufgE3ovEs/4dxs7OnP8vnXQJ3wiKA1Ex7M5Fv9Qjdi7N7FPF2bdNvyr0l1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371912; c=relaxed/simple;
	bh=49NOvaGVwlvi581GKoxSpuUe/4IKdws2QDL7UFNjgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcE0c1U/goAMA/Qs6RIUwFQlIKNsxnH+sV+bp91wcezofI2T7DoIYlNh0++T8LwEFRmiWp6ic4y1+B2bjIWD6KUvDNrp1soqQikRgxreGFSCE51wVf5S8kxVcBC8idVaYuXLxauhPtu1Zl7bRNIH9gz42OXoExYlwnHovNNFhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkb4D/1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk61ycZh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KF2a11506341
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=lkb4D/1XuVf9UMpQ
	BgU+KGNhS6iWu2lcOfX5GQ36WYrsSl18R5ZG74JTkUIbt8g7M64XiGMIgDLGMCmF
	8PjEYu/uy0TyMoB7bcj0rENYAY1HMLQhHKwXsHGY73TTMqtlPFSTsZA86gLqU3JN
	14VgrVo2Eg+mXxFka9uofvowzG2FT/gddAJfxxj7+nDP1hXyQ8LleIY8W6MIblMz
	dzXbGoALDZnzvHPZr7XeA5ArlwYHJoMFcywOfZvxj60WrfIlXAURgFKxYP0HCx4t
	WX7BSPXHvMvlIwwVnd59NQDSxl2geVbVvbSemyyk8NEoPHtVb3At1KO6y5Qjp0v/
	aD97iw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jsqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2547310a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371910; x=1783976710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=Mk61ycZhSIRTzeg2pXCddojEx+6mkCcG+8qieHjZwuCR/gpEr0eJXQy69sCubrMnAS
         NbqI8zPVabWNKLoYyX+plW2n71O0DiHXFnCT5+ZSmHoQxt4CGXW7vFwwPq7Ogyos8JgX
         S+2uzEbaNWV4uBatBMpDL2yxRwwN7IRtXMJ8urmAADI3Fzpdqr29ASKvh3qyc/wfc5LM
         ng4K1tozWULWjIZ6OPNFBFt6eEXzl33InfZKXZn3mRT8XTVyacdRWnd4LhEpXwbsBCoh
         Yr/l5hFCIUXNA6Zy5H+6xfBQSKZOOtldL2kV6A6rtGZfg1572H2RFOY2dPr5YxwkIoZr
         Owzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371910; x=1783976710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=ApGsRIFa31xnsC711VVnOstQUHLxoSkmGGhV18qE6fKkpUeBjVxpbL3EZBI89rI0c3
         5p/nQq9HB9PSkO28ShnRAfwkstgodKZj1f5TfJksLZQYnvEuCpnNc0rW5i6Eq+TTTBQT
         l3tv+YQF9EXQ8Gn+7+T9sIs3cKdm9FNRJvRypCnBMZG3uwr9toUdSwbHQbcphdfG+Hbo
         SJP2w5Hx5EtgmL/PaNeNbX3v5G+WVvZRrdVHm8i/nM4w1K8l/sND10ORyJoQST+O2e76
         dNXr9MKsmzvAawno1TfBUWL+l2yc1uEURaH2yx1r2EXmrk1ar7hRhTqxd8bzE12/X1TW
         6eKg==
X-Forwarded-Encrypted: i=1; AHgh+RoVYNVw4NZr1MJwAx44qrflHsY8CibTjRlxE25aYZQFwdf87ylSN8DsZqT89sbDNvQxhh/ZQcZCvbFijvAP@vger.kernel.org
X-Gm-Message-State: AOJu0YzkU4tzLFujoLeZNEBbExQoPahBeYqn9TD95WJKH02J4QWlmsya
	b7uiRJdygv1SBg5RUI0vbq36cJ9zHQv+ushJTtvcoUqguksSx4+smVLI+1vNJtMncNAlcZqJQZe
	pXwPXYUJgu7mIHugsvUW7pZNzRWuWHAvaQydH9mWzD4u0HHTwPFXS30W8IQuchFJU1RQ1PQOLh3
	CC
X-Gm-Gg: AfdE7cmgs8ykVWa528xMMMH/p2nNv4iDljBI2z+xbC7cPIh2riDQReEjKdrci6NkFgg
	QFKljNRWAaCqkRWSfC9iIuLTd1m/v1r8ZsQB+UlvJJQMbpL1J2QjGEaJOLP+fzHU9yiqS/0iY2G
	7mswaQBREp7U4q1GHz5vhnUNWDRREQhQu2J7StHv7pKG/qyfulR7jRUD2kr6YENIKG8olXqd1ZY
	KJ0Qjq+OO0JAGpwqvivBbZSpra85sLIuzIKh7hqDmRD1F0Zpfx18/LMYWsU0C7C7gOfJDCDfOt4
	2OGAQm4DF6/4jHBzuS0br9k+1rSIBtYyos0McBmNhbuHXbhgnieq80AaLR6w8oU/kcEYqYv/PLf
	JOcgwotxUofrGCuy3HO7m8AD4qZYcZTVeha4=
X-Received: by 2002:a05:6a21:2c11:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c08ed578b2mr2371348637.22.1783371909929;
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c08ed578b2mr2371304637.22.1783371909486;
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:33 +0530
Subject: [PATCH v5 1/7] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-1-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=kpXC7qkSjgoy11voEpWm/qgJfUAZ4c17t4cpkQg5YXZd8lqbz6loooMhL15RODOHIRwzyL6tK
 a0+2Ku8Tb9eCjyNtiMNg36/Gls2eQ6ZhlTTCxX7OXHZ2QxAnkps9BWj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c1886 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX0nOgu4AagkWt
 GqnalwRWvRsZ6Px90jL2f/lMipMettNmfieSYCdZxbcbzh+AIDTJRTeTuV6gDpxxKWvCFPqTJ3C
 d+oX2XK1ss2hsGPO/PY253/dFE1IligA/tGKaK4NBpQxZA1ID5hEpPUnZURm7VobK0pIFPK3DTP
 sGp9IMc8foq3tovw3G4cAbJbX6ifM6ykEbgU9A5d513R6tSmt4AtS+7udqWwVKksWzPg8fKOioH
 xqIWGRayzDmvShmVwRIbWytlCs/OBHlM3MNfJosVKZpu1qGUMELJhTy9WlKCBDG8mSm2V7CcTwD
 KWmKbInvc/UXjujvAdwFNw+Y3mJzVnd5KRywTpQmbElYMdhKVb6lLhhmfiz8p2/JEOnRDzgsMth
 PoC6AxpiYZmFQgWvZkKzRb5EupYi3Wn9nEdvP1czOjIUzSM/4U9pBzOj/AydlGTNri0Owj+C9TP
 tXqkHHiVz8DQpiF0XsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX0bBWXfLcDPyr
 xNux5nc97D9oJEObNdsfV+RYHiubZ7tC5bW6z6RtMLx0Nkl3AEvWJM7unS1/yWcyfEB0db9JEbb
 GnwvWXt+OeSAPqYFn9XLi1/YqLMSmf4=
X-Proofpoint-GUID: sCo7eOQdapNS_pf40xaB8DTdXndm3dz9
X-Proofpoint-ORIG-GUID: sCo7eOQdapNS_pf40xaB8DTdXndm3dz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C453F715A5F

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.54.0


