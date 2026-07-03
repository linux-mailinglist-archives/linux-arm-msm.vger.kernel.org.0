Return-Path: <linux-arm-msm+bounces-116419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZkwGMmkdSGr0mQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B64E70587B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:36:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NJ8mtjsQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="i0h/rb/x";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116419-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116419-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79F36301AAAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4E3596E1;
	Fri,  3 Jul 2026 20:36:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB54266EE9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:36:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110985; cv=none; b=AzH+3/z68iY1xnghyLDszYYSQEUdbZWj71xnqisgTttTeXKeVFDlJOOebBnKBab8IqOOYHdBPpa7FugSdOd7zBAwUJwJ+eyyjQ5ai/cwG8qajE9JHCZrbJn2LrPKx8CipYPn5LimSsD695emSE0CP4xE7rKtpOIlrw1BwHi4YFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110985; c=relaxed/simple;
	bh=t3B1LGfw1dSrLsUJhY30F7R7B49EhUVLYMXvZJRb//w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKXNWHzLCXbGg0HqHzAzDfTya16LiOJamX5sY9+Eh6ZNSpLw3kb3HFyiy0ZT+Iy+q0maamFiLzh+LQtnd8WQfqwWM/vabGgOSzVt0XW1r2diUSCIXDi5WLQCmLbgKMfMLJw9PRXsKzrAZ5Whd5NbL3JaeNc1euanOttMFt8qgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ8mtjsQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0h/rb/x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZLc871850
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=; b=NJ8mtjsQ5uk3031c
	1sHML28nZjDSTULG5cmU9dYBC52+Up47/RZ8EGa74eXGgGXlHkX1mRPa8fKIcB9J
	kR8IoDLwnkQisdxw+Ong7g0TWTtOxA8GLTXhi2VEMpEr12KUPnC3fG43yrkiCaoo
	on7VFUEktt8FnhCPil5kln5tE8FFOKp9GOSLkjWwhz+ZDjrKGlk4VVw8W8o8b7yP
	bkxo/wD8LklfrJ04RgY1ktF8i5vEj7f4+BELFuXzWhc4cgJPdAdNiqeGhx1NgcYs
	1eusB7Up1EI1OmFDAnGb1h4rdFaiwZGIaVD4lrqak95amlcOwWoprQX+T4IKzTpb
	C8Gefw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3wdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:36:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso678097a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110980; x=1783715780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=i0h/rb/xXcCYSXy5s5uQmPVwnbv/t2gVY9PmVnBEsquFxGDKqFZ0r2HIZ4WfbX9XgN
         QUAJXYTZUDToaCwEpmtwof2OtIhaNvuPfGBpIWyCOp1Mwges5z/2OoYKxV9v4ScrWlP0
         1zl6z70vUqZIlm0d7PNIMJv0ldW0gi67xvZP3ld4fQZYVSMXVfRj2i7rVyJN+V5xV6AK
         8jG0DVf5JH4OAqeSJIA5KUfiuzoNo+F6wAtfayb3wTBzVMzCNHA+S+H1cel6dJu9p6i9
         Jn3WkxbwwGjQc3AhTWm6k+k3uKHRX5kEWoQDCgvGFwkAwYyUAT6Ed/+yXpypAyrUXI0W
         fMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110980; x=1783715780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=Gnf73lscbcPe2CxzG04Ndj+zP/MFAjl0kH/goq7fw48bfg4VQ/sekPAdQugtohqcl5
         /ryB2Kbycx5QMtID2ZbYT2hi2eWEKXVVYy5eOCir/0rFUE6FX010R3tNE9FVhUdzDwcr
         6xtIfxABhpbsDH+GRSxfGyfq+7YYdgTPTPrSeGawUuA6ZU2CzOl9gp1SjveZmQwSriQ0
         lijkfWhIYdkyYO35Q/IMGirfotpF3q0RpxMYwKJd5kE1u1HVa5NHTN7EcYOx/eWiYI6b
         jJNlPOKBocazj32HZ/XbB92b44aXeg+pXkrdPyNWjojGSmiI7nMH/Vu0iuv+Wt7s/HdQ
         L1Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8iWGg0RFa8UsOSlr+CNFnV9iav9IGEv9UXMASdoPRe8UEvVQgryUIdGclohhwceI17HCZO6/q/ZuLAMOh6@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMF/E1TGGpADBQPK12s5cDo1pPlaKaaSZkQOOxQ0oN5GfjO0x
	+WRI3fcYu1+6RAN1k6HxeTQWw9gIY1Medcd63wNm2POJY9VsNOdD0NeUExBjTY51gnnmnQGk06S
	c7rPuJ7KLiIuxhpZEx6fyjUdYXHYeNJNVkA0bNMHDrX6/s6Cy/yCNhgIsDnwSIj1cq8Uv
X-Gm-Gg: AfdE7clY4BpchA8Odn2LHTf84laIz1dSh+o2oSRq2YXr0fW9SSaG8iJXFAxshXsZ0op
	fdXe5oOkwuNksh8phRqqgsRR+JHiQFc+0E4mmsu57lqGM0cvOKz906xEnXmS820pbX1cOfFIj8P
	lgoEAn5v+PKUbQ8chWmpbky5Oi+FkeOpp9VB48syfG6r2OxbKF3X8dfJGYeflxLmoaegNcDtIms
	OwFQOG7ebBkQeiEnhX4CmACdu/4XB+wEP0UXAJRNpE+yOJvNLhWreLHMHHzviZBw1PxxT3+XsGj
	48gA5YOkWlV0bBGQH8hSkq4z7zpiP8BMyCYudUQiKiCCPP3Pi3Gnwaodn83mR20jSOJ86HGLnf3
	cCnjAIQ5ZHbXLsLYScgYj4a7jVqQRvGavQuQ=
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781921637.49.1783110979719;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781871637.49.1783110979257;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:33 +0530
Subject: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sXVW7HyYn+zboxV3uVHhdySY2TiXHDOOKyfpwcYtiUI=;
 b=wYeDLz1Q3es0EoxTF9BBwaEzt+JV7f7Dw9TzAL+RcikJnuzjboL+RivQ+2cjiKzDhlI1C6Fhp
 /ea/aVQfkA4BAyda+/hRZFvmLi52/KE7U9JGNJ4rGuOGiA+uglghbOd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXwF7zKXXmxFl1
 NG9YO3ws6JZM37RNQ95517XWJL/no+TpO37+DdrlZoxo5tqW2DkHCogji+gxXzAGZkj61J629fX
 POqSDsr7lg/qMgf4JNpeikFjjJfdNqo=
X-Proofpoint-ORIG-GUID: urqlSgTROzn-8Jek7CTvg4M0M5Rp7IFA
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a481d44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: urqlSgTROzn-8Jek7CTvg4M0M5Rp7IFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX2ZBI6hxZC9WT
 MDGCMluwhqLNaGxuU8AB/it1CINIM4GHp9l4paSDguBHYN6XMEjBdDRe+WL2VZPFhVWecjf2MN0
 cfqLWdO8yngHpCl/EeuYSYFLv4XAiQm2n6MOKPUlQJ6BoNvLyi4WM3ur8xg4AmdOw0YRuorlBIo
 Y26N8x/8BSAPdAfB1+swYcG1BmwmbnfGFiQbHFPwkfCBjVQsQ7RdyQPX29ruEzr9/byuB4OzBTB
 2jeVVh0S4SI8AI055Z2sRlZWNhwmKELOulXSJnEpZ2A+vF0T2HKrqM5lMvoHvJB/5ykPngOFhba
 xRgodmj1EXxG1tJFKYGhUyDJKhnBzPSRtYnRCoTjiRJMPX6T7GJ/Sixgkrn6g5OA7rw3Tl8/OXC
 vwZIfsvcqmn1p1B7oX4OIDyw5hu7b1Lp1GrCQB5j4HrW9lx/bcDiDJ1R9E1GHKUE12siMZGKvkR
 omrzi9CYSB3iRvA9bvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
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
	TAGGED_FROM(0.00)[bounces-116419-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 3B64E70587B

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQM EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 269e11bd44f6..8206dddcfc75 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
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
2.54.0


