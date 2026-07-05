Return-Path: <linux-arm-msm+bounces-116512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGhZFYYQSmoJ+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:06:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F55D709594
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PWyX7gcW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ag62FTJR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116512-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116512-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 601773006B50
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F67367B94;
	Sun,  5 Jul 2026 08:01:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670A3624B2
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238509; cv=none; b=MVjCrjpT/PK6ERkg+VAkMNUTEujhGwYNJ+s2/Kq0oXcRfgNtexfZIZGiRzlMKDxGKcD5oa249dkeclBIQyKz/e+HrIuhU/5B2ciROwHiCm0HFOrTzdixgLzVMgzVE6VVYlulvAn+CA7dNlKtkiJOm9BpLTBhXDEiMYczXKTTwlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238509; c=relaxed/simple;
	bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8bklC3+NJNV/WDHhEXsOlSApYcFrgz5vw3yXxlHQusho8Wf+2EVsob9Zk0NBHVG22bbAldwlRUl38YdWchZ7Eh3ehHHl7ZJTw2sMyajrp+eoryboo98bpnRIWE8f10zQXrNU9nUfumay2DUIj5doFWpTKieymiPq09ZWfDrNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWyX7gcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ag62FTJR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Lwts53998872
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=PWyX7gcWfCQdAu58
	F3T9QpQ04Xkrxc6Fjh+aetKsgundaI7nqojknAu9CE0124sk4c/XVlw5eg5wdWqh
	6KpnlnCGpvUdx/MUxSRYJuLaTbV11Dm3ri5JiPVD1ErN1T7IH0OqwCcxOPQNWpoJ
	eVPpPMQb+laaQchbR2adnAbxn3/UnUE7Ygc4iAGRCr3IhicamyKvNs+sjDa0ZQVX
	cHSPBMpOuVhAwswE7841nd/k5pymYfmSrxi+T4JiQcv1PafcexV1LzZhqiksWzyE
	ZW4hZhhBA2sEXaQWBAmQUi1BUhDeK2wv2uBuYmb0YuJmQNaqrbxCFw3BRgdVUWh3
	hl5eCQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej7n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:01:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso2388182a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238506; x=1783843306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=ag62FTJRIMA4DAKSiE5vD6P6QMHFvpvr7uh1oy14wdqXMztHiLhdl5+u19r6ctvWdr
         U1pszZAr7DypScV883rXTFWd9ESrn5QGLylkq/C1sUTUn8IpRq8+oz9MXmKLLW1yze5Y
         gEgwuaDFZHQwjL2oPGEzHUCsWY/nn3ZREtvgdxN7C3sX8y6NpJxBTRPLbqNtVTkjtENX
         M9l0P8UQkxYhIn3T71vamcw5wWZKRlVwP8qmFsW6abRzly3/jNJ9qaHqxie/8TY34Oo2
         H54Wkz6BkxgUwH1BN89HzE5WT7pusjaEmkzIBazUkuNiPSuH5TeIHp2SKvOGFWOL5uOw
         0dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238506; x=1783843306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=sQPSsSZCrPv3MCNjjS2XPBjC2W4xAFOQNqdyKA1lR+Em8HrxvAPs+ZH9RyS++SElfK
         Ocst6NEkt4oxx9dQ1vzdyPE3FxeDwVFJoatgDNiCn4ikChHb2VIOm2zLact+Wsarhrxf
         DKLt5djWkw+oLAOPBAsv/F2yOjbeVB0rmb8/wHzfK6G+/aR17txkdbcrwqG/9ThQ9/8D
         BTNT1R3qHPiZ0JqGmBXx9qebiOqo2FU8npEVI61Bl2Gtz2hCDlHkCDjxksT+P/CHKGds
         6Bc4MkAKSMTxQVJOSO8nhsqs/A4IJkeUCP5NwpqVTqIisfkxpRxppVTgj16NMSixQDq8
         SsMw==
X-Forwarded-Encrypted: i=1; AHgh+RoTCr3FbFWuHyeHn8YzlHejgyCp/T6GY+FPLMzwWhXDIhL75Iw9bj1gTGOKwmZeujIKZf3h295zgcqgxpje@vger.kernel.org
X-Gm-Message-State: AOJu0YysX00NPYwHNqwwyvac7Qz0gtz6f4HmSrGmjPtUdF+HxO9fIcA5
	JCT0u0vfrnVF6zFRMwuMf2WyTv6LpmAMRGVhDdASG9ZUFt4Zh9LusFKnKCbBul09UsenuWphd1+
	MgUzeti+NWHC/N6qvv7I5abs5CvOZt68DdzCSkJ/FMPKSfMz7/DG3sxa8bRXvIychGjfk
X-Gm-Gg: AfdE7cmZaqpRYHpktWseldr8mKYK6WOK73WucGFO5VPQvLVgycp3H+Utcv2Kc9khNQR
	YbrJkArLQPz0mj7TePMcyyxPOkKRw9Tm63Ii0R8mhd8Y68Rjefk0h1XpsFe68mLrCUrW1KPVvW/
	WIVi8Wr7/+ObKXtlVbVZarr206sOs1aU5NtJV65tEvWTn2RyVgHjImbcbtQM8zB+1rKXkEieg8b
	91akjuI9chx6xodvjYZw7NhezvxyayRzgI/XEKr28oX9G8LRcgJhiPF+QSKeVfHdrcfOLYWDTrm
	Qbfb48gvVPnxvg1JW9z6piZIapfRQeAzr3/VcbK3iuxSXPqB+XlrewpaeundUvGf6XUyUyMv9m8
	JzLZ+trPTyNyV2tZZgSDezJxV6Ztb9PjluzU=
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931295a91.20.1783238506406;
        Sun, 05 Jul 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931260a91.20.1783238505896;
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:11 +0530
Subject: [PATCH v2 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-7-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=911;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
 b=xiVpoXS8RMGK31dPCSwHTMfXAXe0kdMwaj2WE5K5tRhNxI6YaIAXwzIjirprdtrPKj3B6P3vY
 S0POanPFfdHCTa9ugRKkr6B6iwFsPGUorM72lzVY2AIYrw8NLJxCOQE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX/O9560vJSeCk
 XOQGIFnYmlyJZ0U/kXuodjQ3TpRDP/KE7MGg9LzTbgPQl04N5CCnAx3xGZStQidSFgAZPYjEsaF
 sV2BxZ0DsB2g3J3BR5I0zwy+noiUOy4=
X-Proofpoint-GUID: wnt4HkVyBrZA-hjXsCTiYphype9DwS44
X-Proofpoint-ORIG-GUID: wnt4HkVyBrZA-hjXsCTiYphype9DwS44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXx4cPyU3Tq7mD
 dp+tG7NRrkPfQGehs140OgvDf6AX6egbEuaVgvCJUA4AcGg8AvFIpFNNRsxjR+Z4wR6JIvjyzxK
 4EspktRT3W60E89MdTp5MkITVCSdBDdpJewF+2EaCS2m1IkBQNEZgHeT4AQ+VY8idd9FAP1WEGc
 1FFiibHxtsou7sXuqTohpJyNto4VZzUtw2mETi4UIz2uNn1D4psBYIqxS1Ank9gHLw7mBxoShxw
 wqrdqJTGzCJo7SCfsPYs/G+eds+UZ/oYPoT7RR8jlOUPrrPjgT2qpuuDJ31TDqZ8cDzuB/DyTQW
 aJQO3jTqghUD0eRWkvKhbXDayqvyj84G+awXCe6C4E4mX12VuOWiaSXatwffycI/oDlS5bmcI6N
 h3pOMXOxbSyFnyeHGgJCJJpEFqunLlrNe1vTxbxAXtDdQBQF1HKEZQNr7xbu47YaYi4viPBYrSE
 D4znU72xCYoh04nbA5g==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a0f6b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
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
	TAGGED_FROM(0.00)[bounces-116512-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 9F55D709594

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.54.0


