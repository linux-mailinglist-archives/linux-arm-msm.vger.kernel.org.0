Return-Path: <linux-arm-msm+bounces-116421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1s5LigeSGoYmgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:40:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EC7058D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:40:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GzQAeyrU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KqHDCI78;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116421-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116421-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C39953052B43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9386F433E79;
	Fri,  3 Jul 2026 20:36:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD033065D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:36:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111000; cv=none; b=P8B3AnpZ/+oTxZPhhEomYcF+uzRerkPwxh8jqZq4pxoy8F1/Pf37L8YdGj61p3rpc8FDtG1d37OurDpwCUX2MZUc+aLgNNfevmdEoIn5O2rO1fMj8vQsvLkFulqDQp9HEcrJY6i0mTXVg4y8ktIWmL0M8DJMRV3VNI14vffFsbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111000; c=relaxed/simple;
	bh=wPn9MTeoeQW85931rm6TioLDv62uQ6M+ZoxoWxSWh3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFAIUBJohH3lEZ/L3T3jas4ClVP4tka3t0zCpjczo2wJgFxcx7FmRSWtJjBLWJqeYVY/xhS9NLiSOsfVZCaCOpj+ZZT+mLsAaCINfkWGFaWIWMgZokt0tmrpzFEZl3b+yN6UM2NbDu9tz8bNyRwFKt6e4MsCNz9G0eZpjunZaIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzQAeyrU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqHDCI78; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQkxR1023691
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=; b=GzQAeyrUtLWL/Att
	0BQGtN1jrzTo3PMxpYmNXjkP0hrCClkfQewZAXWIWWxjar8OD51Bd38B9gAe8W1z
	D9WqjaVyv3dEC1uk71Izsejfrma03HUbRJO8L3bUJwdJeJibdKzRV/Ra5BDO9IWs
	uXQKF8q1SKTXb/qI+Hz3JKMCpccz2ytTkp1c4SfdiLAJ+jaV5EMaBNg+Jxc4LtyA
	mbQiF85aF0mcSqVdK780tKeDjeK45dd8yvIN3QTb1wsm22g+OHDC73Kfy7ZCoRmF
	+dOU+6OBoHeh0ETKIAcxURhiNX2mqDqloLlkSr+myMny3zHBLPzPBegUcC3xzVAp
	/dImjA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32pr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:36:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1436958a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110997; x=1783715797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=KqHDCI78OUCnxO8roOmSfov5HPH1SdcwmCTMcQABr9pAZ8J01V8JP6yMH+F0dAdELl
         BgK012J0rJyle7wOifipSAWp0GDW0BdH0B4y+Q/+PtDKdJ/0bw2tOuNPbQ9sYi/Wy2X2
         xk47sYo+uDoP7axngSpakuV4FhYFeZqpnxSrcyCuyNoKnr8nXI4wQAgwVVz5+I8QSUgp
         x/UhBLQ8Notbbf4MKNS/KnpqfZpP38o4uPrbMtUloW7uq1pmb9LldVCnD3o1yRx/jJnu
         HH/cwcShp6jG3oUpnktLaUufs87I6c2MNSCG13q8a1sTFR/MENaeGxmHhM+fhbc5OJsM
         mQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110997; x=1783715797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=Z8ft74Gm30Z3eEYxspM4Niuzpoe8h8ohFo7qmfTg39TUx5BTf8zsdTCewWkC7ze6W+
         Nu3VpFln5Vmp8WMI6nVulmCg5CFgpbCuKHMor4Jh9rCopdWgjVvnsiaW5UntDQLNGrFV
         9AQQQ7sJ24eaN5+8677KqzDwAvfwde2U86khMctMksV/4ZxUKnc+ZDy5fSJBYXDrdXTN
         rM4PUXRYB+UzlY+1BEOOVyjnGRu1YN/IvvZ2gWrWFbYkrtTqoE5wwzor1F++Uzv3kn5c
         O6xKUqcNA7552x9vF0GQ3uDQdjOSPN3itYwZyqRAg/gm3IG5fHN7oiRlWpRmlmc+NAFJ
         k73g==
X-Forwarded-Encrypted: i=1; AFNElJ94isorkB0eDEG/k/Q+Nn8gtq9EvpbifNcoMmD6WM+lsd9B1vjZfHj7YVV+iEcki38pxB+IFpv8rFB84oKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7poBSiMK2R76J8jAaFxEOHbNiFcG/NDZMYRQsTcyKa18hrI81
	epiqLcER7ijK6M9ds3tfG5CbWSSewwonnMjxT4TTgjM9le9qKrX6GV/L/aEas1Rsinp8l0PmK0T
	SB0WFBL/1kpFSDmH1v0MxUPoHkZWPdXFzSc/BWAjE3UoHjPmrK4JvCONAMVcy8GhNom48
X-Gm-Gg: AfdE7ckn3wGCpJxXzD4FQW3wshh9uMkKQa4qiBVjUXki5cEkl8MM38eXqV7OGNpEEJN
	TwCAbF40NlIN6gHfQxuXPn2HaTGGgIZyyLAxWOlUNa3O5WkfGRdhQo7292W6VYsZvaxpdK/qLra
	LbhW/L5Tjyn0lz9cxenp07LdteiRPev3/1dfCZ+6v4xTz3Esb0pay0k+gQDkDXY7ThP+QecrO8y
	3dQ4tx948iFijbCZSh9Y8hQjfLwHeLqdf1G052wy8SeCUCz4JG6vns+IU50e6pB8FL7FM6kNsVn
	0Wm20btjcY/yiQTs592tiePDstyGur+ngO3UkDEn6QH4uW78vpkDosu4LjgYuC169+JUVRbkFHq
	EtZ3uXG1XgP0ydpnhGc1C8m41lF3S3eu97xY=
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805380637.25.1783110997145;
        Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805345637.25.1783110996652;
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:35 +0530
Subject: [PATCH v4 9/9] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-9-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=893;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=MQlXtxhLQFtUqLHdZjGZifsTsVTh3ESNrqyekz7rOG0=;
 b=MzhVMhZap4fsAniWO3w2MNYPOUIaWxceqpeu98aHYIopN/QURKoMDWtY2N1HuWpigtKSVKySi
 wFaarKM7dXKBYN942TJzB1YH/LjyAJhqYOZLEi4us5GnzMYF3HTZD2L
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: gq0ABSJlnfCOhbQ1GwuC-lHUUi1KDxwF
X-Proofpoint-ORIG-GUID: gq0ABSJlnfCOhbQ1GwuC-lHUUi1KDxwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXzeQlyVkI6EDK
 P0Mdes4YdnBZRXz31/pxc61yjLguJy8HC1y9qbTh7mwngTBkboD9sFZFObX2zn336NG+7GzaRLg
 LNr0nomdwy3wdPTIufVhk3lng4mcmOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXxyqMLlKBLyIj
 A8dCWOfKmytt+OYH/ORc3Uyx3m9tOpnSskESnAYuCBDCSitQJ+HbzB4Z16kxe2yneMX775XXSX2
 VUewF959MAzSGtU6e4Bw/RKXeHF2AGhn7N1JxqLXK+3YIzYNgL0wHGWxP0avBsR6Ff2SLsRW/x9
 vYaovzOvWc+kamcRdLtfCXGT7pC091ohFUr00/CKWiEmhiGUddlxtI2stg1aYwemxKx5TLnskwV
 6mPk0t0cbDrBUtJCN96oc0fp98+vdqH1VUNsUvoZDldhtoqFtZGIW1z2dDNaFr6SPscaPvVxUtc
 SjvBI8SEwGhr9/fronWr8X5c64UuhoD8V9pvQtxZn8bHQzcDPEqny2rNFbdN4T9lSlcKP1KxkLm
 Z5Te/5bHWQ4WXw4o60mgkfLxVP+HYX+dgG1kw4P3VEFknCAtS24fCP+HyGXpWDYWwhA4LvjAUHo
 Fdx0RtyZi5UpcVJs3kQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a481d55 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C5heC5qkSJu3Z_QeR_8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208
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
	TAGGED_FROM(0.00)[bounces-116421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: BF5EC7058D1

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 743979b5ed5e..b51aee19ee20 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -58,6 +58,14 @@ &remoteproc_mpss {
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
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.54.0


