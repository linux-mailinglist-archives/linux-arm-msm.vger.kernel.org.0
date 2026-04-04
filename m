Return-Path: <linux-arm-msm+bounces-101766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJdZKL/f0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:54:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F439AA1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1236630439C4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFEE3A9627;
	Sat,  4 Apr 2026 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSq85/Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7zaFGW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46163A9DAD
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296292; cv=none; b=cE23sIqtq4C+AYKG2SfSNqHJwDAPUiLl/AmhoaFQl1vQVEykZ6fO4brb+mVVdpS8d0sk0dGtI1G5JqdlpNRMV5MLBmcUbTmt8le8TnFQ209gzNYfLiabUQYM9zDdSmQ0tip9i+HaSyYmpQuIm4wpVsWVLuZnO9d8XsPiIUHAKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296292; c=relaxed/simple;
	bh=vKKM/Y9bnXZHRerJXsUC4qkt/oK1g2pG7yKxtKeCWN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCqeNsZ0Gfolcx2te9So0CuuNJHsViVL+mpad3/BfsUVHlHn4Fgf/hYKuvjzJ3m68T3rSG+QDja6mU/aln/sv3KX87nC/hLlBiEmNXx/+s8tbKpZq4yHIX7Vd/7TgGhDqbBF/uXMXGe1UP4Te8uI8J7h6P9lu+7CeOjdgIsj2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSq85/Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7zaFGW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jdjt2867130
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=; b=hSq85/Hy4bnl0Ees
	l4Quxz31vXTABCvSWRxwmID53/+jU2aRediL4Gxz4/0YT8qm+u3D3Fg27WZjbcUv
	oW+emoUrb66KGZJN9Y4DrSFYsbsPwHuPsOjZNhiw7Dma6X0bJyuHO9+p/gpPl7nY
	FED710Jz5gKqlUhFQiHxLZiNglHzkaVlj9FelrnYAXxJEXDQ5u/QZ3prJq7cvnhY
	XF7A2e4MUbCY3fGg0mF5Wzrxz2/aHZty01L1ubrayeS8LCzjTN+syFWYrgciWHda
	/p+waFGXYP3QHZLyhnEEVANzLuMaS/G1/utSYktVsmRuLs6fmM1lwhKdpddPoAPY
	IUkndQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14rjwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso2127191cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296283; x=1775901083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=;
        b=h7zaFGW/7nZ6qjXIQwYlD0o9Aq2qq386Z8+ELyBM+Ome6mPxUV1Mh/Col09aaMVcZt
         UtyAU31U27zq2p15DCYUBOud0Y8C3DpXUwW2/Udr0Hvwq42TdyIsxW8Wcqo5DJLw1X9s
         JbVXS65ZpRt+qwFOFIcXLKbBiIvwQmj0hTtTQVlVNWsW4hT5Gjs/dPpvs/8g6TSAFnWZ
         xr31pJ2w/EXpzrjIA3t0M7fMUDTMTyLVexab4c3pfTZUGay3nPrmFaTs2soawQ1OVKTq
         3HvW6M1vUTgfJ0WsB80LxoHWhRR/Mgo+c3LAOJTDrng82u0Pfzfmp+Owudsw0iC4Ztya
         eTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296283; x=1775901083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=;
        b=Fx+G79rl0B7HU+Kl/ZUH1Lsv5hh3FrjdGv6JPK/8jLzCeAUJ0dqMTtrguJaMAP9tFB
         GhqA32S5vKSksSqVD9l5zxQ5LdHMkYhzeIULihEHDBVuLw6IYkYIhtfuG8+ZjyQWy+C8
         I8eqDJ+x+vGclhJsqkorHBZGcGSxf7WoLmY+lSmWXC7jsTd1AzYtRvUKA1nvjBwXyDiI
         WFsYOL6g7jU6TmyhU3gjPzmzUas9bor5qvaPI0MuV+y8NSpdmTQ6Wd1jKQZUwsatvH3e
         6MPxFt+7dpFtJLj/ef+OQ43WoJHFvRvO/6G8ni9aN5L5OJATLeNTSpBOQ/ldfv9i6coY
         O+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVma8ss2uJtI+L7u3fq5WRAm5ulvKxrCvNIg29sHplOw2llumhPzJ/5O+AUGiXy19YpO22XVQ33EAQsaQJU@vger.kernel.org
X-Gm-Message-State: AOJu0YzxB9zue9HUPncdkqNTGq46+/lb87YgF4Hb0e2y4G+gA2VsJySt
	p0QWAIcjh4IIBWT/Sk4QV0F0n1rDx0vJeI/qP9Ms9okTiVUZ4FoF4feeJY0Hu05UiEev18d/NBe
	0sAdsBQU9KzNKiCbaFj4ylGOPrkm4074MsrqQIWpGRFxYsu/ZaKCJ5xNs9mYg5qzE6776
X-Gm-Gg: AeBDievX31TuorT6Uvn35NnhC6yGSFvVxk3qPMRPihFk+WRjePJvSgG2bVF+xzXmPvb
	kbH1ZvldZe+MKJSCojhIaqafWpAPx38jMjVUM1P9oCkrXUYAaIayxkU555fqFmOaaICxgLlZ3OO
	/V+Sq2DiFswxdpwUjGzJSHltUpWAy8xZU1BoehGatCLLzorvkFEDpqdcNLke1gMSzT0IEFFZ2Xd
	BLplHsrKKhFXuhcGSQmr9f9Z94uv86v7zvIO5zNNqwMAvDzxdhI8mKA+l0mcL30hOWSh3RxbAmz
	daIDKM4/Inny4nhxAIlxH4AZPJi5Gb+dO93fjXTMewcmsk/SZ8gYKFqezzPDRzt4ESwPWm8294W
	iO43FQ8Z/AcrihnnIJOQLDMhrkPnC2UGDOxDc2EtS7upB
X-Received: by 2002:a05:622a:1f05:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50d62b87911mr94939301cf.30.1775296282775;
        Sat, 04 Apr 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f05:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50d62b87911mr94939071cf.30.1775296282372;
        Sat, 04 Apr 2026 02:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:04 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports
 unit_address_vs_reg warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vKKM/Y9bnXZHRerJXsUC4qkt/oK1g2pG7yKxtKeCWN8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8M9XPTySk8rtKJdPSQCvcTzUs3opPXXyAJD
 dSs8lJJX4+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfDAAKCRDBN2bmhouD
 1719D/0QHiJRPD3LwR+cIfj+ZqNGgbXkeoEpscgEeBpXS994L6XtM9QwPhzYgaYyEHNUDDdpYmd
 XnqbhftSZjK3AR58VeGe8irPYopj4qzX6y6IOHgzxWzNy3OD8FnWhZwKVe6KDqcefOJph4uKKAe
 qQVnJVJlKWGlJ2619rrkd+lDjtvTqItz5FTB5lT+F8iLPPf0glj4XRtiRcrsFWzMs6UmXDlI5m7
 zD48RGlOq1cU2d/8FJcrdvKJiLv8KlO693IjpO61yMJEyvB1rVBLVjUMnKIYqUR8XBVjRilK1QR
 2X4uZzgjvLWYAwcLYtL2UVIxrasURIxwJWJaL2emt5hhwWEewVVdpP1JCCxjFfTMaqm6YiEUXOG
 eH2iyHhTrYqemfRW0AV3i3xZ5MVF15QyWV9i5q38c2WR0qiBcZo8XPDgOlejrqxeuP4CNTM0GuB
 k1OROssUQcRulM6bGCBpEYBizX4ofA6E8tftQvMTQ4mytChNR+iZM50AuLfOfRxlu5EchTp5VlJ
 NF7RijJ79SoKj65w6tj4Qosu3e5C7uQaLptBfHytKz61QE+f6X9R7Bx4nEJh+HnflJP/x12A9Mz
 n8mEhXeYKPq4XE6PVLL2IUYedmL6N51Z9NklPUevadwIVwu1ZOmOEZjZc43iorhk0dUbzwpyM94
 YEjS9GG7addcfxA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX95omfl+Mq1pI
 CCJRZ3XcCBLNbrxsqp+a2fwG/mhqYbavXBnv6bLfVDWg4KfhrbcVDvGPks7LeZT/7PC1HwNDlMP
 Xx6zvJtxpt0RvWR8ii07/surDkjAvnwkrKF5Z6kuVdtW49lhkwtDVIhKNHMRSmIe0EH7lsDwqHj
 MxdyPELAFIv1FKUb5l9eLL7DVHAO9VaQMx/DcebUnOJa440tZ8Zc8PQ5rVMH4KhFZ0BpHV4Ptmr
 CqOO2BCoMdV6XeZ2inr++G7O8a1pxxKd2G7Xy9yWz7vg7/TsCEF4qEbe9g7RbBwkUrT5f8Vt9ci
 d42gfsL20gJcp09DVAkLvohPmwvHIoMYr/mfOg84GndNAZbKyYhdxLLAUOvdQk0vVerc5+ozBBa
 C8QC1C+XwRMjBUraE3eB5KKf1Yqaqu5bxNjCPAuhltF1ePg6VnO2JF8FbVf8cMGTYwyei3fxnvf
 bN1MnbfvSgCVDRjPJpg==
X-Proofpoint-ORIG-GUID: NN-pgxGjyOKxidofXJTyxHlH1RFQzsWZ
X-Proofpoint-GUID: NN-pgxGjyOKxidofXJTyxHlH1RFQzsWZ
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d0df1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6Yl2zW-OJvWZmFEgjvsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101766-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 171F439AA1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add necessary properties for ports node in SDM845 DB845c Navigation
mezzanine overlay to fix W=1 DTC warning:

sdm845-db845c-navigation-mezzanine.dtso:19.10-24.5: Warning (unit_address_vs_reg): /fragment@0/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property

Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index dbe1911d8e47..678a17c805f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -16,7 +16,12 @@ &camss {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			csiphy0_ep: endpoint {
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;

-- 
2.51.0


