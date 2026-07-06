Return-Path: <linux-arm-msm+bounces-117046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2DRpOgIhTGqoggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118A715C81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=njTE8qK6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ftmOL7TC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58B683020648
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB69542F712;
	Mon,  6 Jul 2026 21:41:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471147DFB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:41:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374070; cv=none; b=A1jYJx17SzY4bPBmv4Ds+YYqRnxiWVv+Fk2LeXgXAxLFUFBq2jUhZYjn4kSdMwSflVlwdCnmyUqor7EDQTNDlBNjXL70Wk0/lePyQkkThF0WTEBm4t8udfYYCip551mSM1xgmLigdbHJG7fUSts/MJpiM9z0xeyop8p4Atutc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374070; c=relaxed/simple;
	bh=HJVDDzLQpfOXNE55MkX0GzvtfcyfyTEpLV03CHtMIG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTpXCFEF/+tAJWVWfTQ2vdrNAVfKQSOcjmAtPL9/bO3Wbn/gLbU927MFGjN8f4u/bWkxlDh/aWj0JGsPv6mjxJAvkb1XS4A0r/0MBbFjno4i0xnrni2TSou6s6k0gEoCHRzGGMxrvv6aw047PHl5gERRKpd3cxY0JyJmIpruth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njTE8qK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftmOL7TC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDwKc1495430
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=; b=njTE8qK6HOr/c07s
	nWJ62yK7y5zZB6HxnWuxRHGIbpX/GR6+AbzabIh7+TiSZ/sALesKBtbTUhXWOYaX
	UCSkt11/mJwBkA7ieDsiwlbciJLTKTLnimAuuNdf9RDmzLD5Fp4G93Ory2NbHBTL
	kJnB55MdwG2dWytvowbRjALalOlBbMX9diBjsjs2I3Mh0pu+byBkPe1A/NwC2pwh
	l+9/FfX1GWDqrJJSGektaCNA5OubT1JrU9e42JwkztuwpoLVhM6xo4fhM8jDaL3M
	Dwp0AxiHrwiIQJO6GlqVggp0tNF5uOEaMW9qKjRWiQIJpV42fSYUm7D0D+M7BQ9y
	sJLZqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8bb80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:41:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso7490885ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374068; x=1783978868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=ftmOL7TCj69YyKFSOVzrkzP7VBQW1WVl3cqXn2OdbxTsbLHPQV75igC9/gABXWWbg8
         IIDzs4+c1X90Jlyjli19j81QeTrU30y+Eb4Q4JX17hsqMDWl7g3jmRCcLUKlDr/DkOwm
         Oj30tHk+IDT/FzruAr7nL3bys+rIb17TcqQrhpKsosVuR4LmWqatNTsnwPNxB51Nim4Z
         WUzl27loaszojqK9byOBeRQQakX2fIxHW2mAVleAQ82mt4tKL9zgL0P+HOzlfaoV/6+K
         zIDy4Sovfn+xWR9CDwa1DcRrtZ6ogUlCBUg3g0SP2ehJoMHYUdeR2PPucolo2t+ycfIw
         GsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374068; x=1783978868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=slYfM7l8ADJhPismoCHKeWlNVkoVk4XglFz6xaovSMya3wPQImewgdgqVYJjvyQ9jM
         ecN3OR/21DcV56CXya3u0y0Z2i5XhGsX83EvVIAP8kbqBiain+IqYOedhOy7cA9CwtJQ
         RLq3u1HTDdVHNPbGgwjYQMrgGQ7kFhl8IhKKMoVdM5F8OUzKlH0bkL+qN+EEthHRGHB5
         1eIrLWtiRzoY9shjEZLk0O3UPfemdoMX7YSReQp+rZpwilGxBkU1QY9nxLfRKdXbCFzA
         X8gnQ4WNsk9oDhcg+Fh7K9El7lh26WofBw4w/zFbZ+jEluYJ8qnhfyFTKH5exHYGI3ug
         8a/g==
X-Forwarded-Encrypted: i=1; AHgh+RrjyYLf4rJh+ksAMexxwZg9/DcTOYwXKI03uQBHiAkLDxt7VoAm1ZgUE0BpciFAzQM22PSnuFI9AFXWX/OY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+w3HMCkfST9oid9gDOYnukaoo88vZtDXmQdZmS1FvNT1qNMbx
	goShd4zdUw6JPGrggT/MlFZ73MJ96buzzh2vWNYvadEIv2/OaGdIn3Ut3lHorwvVQpkw0I7RwHD
	ByMz0GUn1XKEb7GQVEkyT5sH40KSLtRNOnzdbNDdY5R7iGP7GI697PuILLXs+7JYjTOZs
X-Gm-Gg: AfdE7clPx8f1lYq3BOca/g3SPP6k8mUX7U7h/F1e6zHCoon3DDQNWPP0sc0CQJIMWZ+
	r7fQs+u8ruGmTHDgIVWp1PcwARxFirccZR6FpP48l+kyTa0ZkX/Od1fQozjj2317W24g7E78qvC
	hpg/gZSarNiH60oC4XoFQ3j4zbV/7Xd8yEnli06eHrDwnSTcD3ZBylExAsOF50aHKHAthyo1DqM
	Y/qUmpOo3xfWSgq+/uPVIhXOuEuRQbgwh3oL0defony1XHuSioxlumRGNoyGrEmIvn6SasqdWAk
	nWk3ZiRskQq9qSIx+B5kIFvVlN5dy8ErNaZmo+ZLHjeN33JYSbnOERdS+WWclL8ayLPEhGVIeZn
	KbC8pECy+N/mgLDzQ3+1huhgHaLGzLrf9M3M=
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27229435ad.43.1783374068142;
        Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27228815ad.43.1783374067709;
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:21 +0530
Subject: [PATCH v3 3/7] arm64: dts: qcom: kaanapali: Add QFPROM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-3-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1140;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xlkJOQ68/B3gMybJ9Ns4FY50UaqHntYHUufy67tsBxg=;
 b=7edwsEeVv8RHFs9wiiykhb6VXFeyYOH/HK4hwAwFZ0IHw5gWNb6aDpzyhjQU9h/vPFqbm1TSa
 s9NCvSNutLKBK4+wkAdMeVSn/V2LA9Rq/OVHw7b/aeeMzaXAawE2luN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX5t5z6w96uStt
 JkTfAwf/o/7XiZJa7W9ynwzyh04URZ6TRwOTyaLeB3a8idpJlvWzgrE4RrCWB5AngUMDekbDtY6
 XcoPnuKRjfBGEAHaJmNb3z2t8uNgdKg=
X-Proofpoint-GUID: 6evgC57UyJX8-MdHisg14L5dypGJvUpk
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4c20f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6evgC57UyJX8-MdHisg14L5dypGJvUpk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXyf1ONWiH+brK
 1Xl0ojAd/HzzMaQuOvftoPU2b4gV/eyES2Kq8QFtS6pNVZh73r/hO9DqCZaBDOcWoSEMuVudqQY
 tqc8lqkNoDzDvrk6Z8YrtZrPMMMsk3MjkTcsYJfdFeMmMVKco2Y81SdB17SFrIjs01tZjKjEkyY
 LzffRFKSWcKC3DCp84czNUjTrxgSJRv1ofB+ZyVY2lKRcOmO0moT38Iy78dgm/8QVuzv1EhZPBU
 VxyW7Euw129fMYKpMKdrXftSk5oq2R9ssAAUGpxTjn9UJNoI7Qnm9Lts2UxLLOpjn5onh00TSQ7
 fU0wuSEiJOLPWk6S7NHCZYRqpOOm3rhRJYQ+znOyF8aw+3YWomJgl8fwtgY/clx7Q3yK681d1yl
 0iIU0BozHZs+3YavdZrrGLOoTG7m+0tW7Q9L9udqsSXShtb7AuVNuUTlfmDvEc7eM5fV0qO/Xtu
 KDs0VovfO+JpNjowWHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218
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
	TAGGED_FROM(0.00)[bounces-117046-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 9118A715C81

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the QFPROM node and GPU related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index a41962366941..2d0db71cabf1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5871,6 +5871,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.54.0


