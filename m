Return-Path: <linux-arm-msm+bounces-118021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TEyjJK2wT2pEmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:31:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CC73243E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:31:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=otmnpyCY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AmgC83Yb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53483308B3D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A081367B63;
	Thu,  9 Jul 2026 13:42:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB9366066
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604556; cv=none; b=qDoIWt0M38m3PQw+s6hntM2msoBPbc8+cuH5q6GcvxodtH7kqpbXC0WHKh5LKyZYHBHHTfeamIZmxSGnovfNevhHYpPIRbv40N/k3Fm5tHioTulFONZ+UUjrOmYn4JjRJSFXRLMs1wmszy+JnDWWWL4yXsvy7m+EuNRrZLzGljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604556; c=relaxed/simple;
	bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEJqJ2C5a7CuvOSZiQ7xpYb70Mz/cY/7B6w7lRaE6HHgwB6nXGlFTfzEMfunsg5cRVKNEJnbNeN0GEDojkunPK7lgzMn8/Z1lpAjGlg9dd5qQMjCqSggGLKo56yWzPj1ekwQ7pPlYIWKFshEnYbMsQDuksqZ2JF1mgKJt9cZIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otmnpyCY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmgC83Yb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNC7a1537265
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=; b=otmnpyCYOfBJKbl0
	z7n2usOVEwLwZ6958xMWU5D1jMAfSRPny4abQvHPvee5P3lmbI9zw1y5P67YBF+R
	UjxB/PdhZSrgfmDFSofTxEohiWZ44aUaJfsAuX3Y4k/HvMd9KROf+/xl7hLJWm7y
	wKshkTGKubl4K0xR2ZdIsjU8x01tCGB2YntI9ozyXoIGW5dZhm1dsOZ1VZqScXCz
	OCSpBpzLkCICA4AHicVgk5iH3E9lc9eSCCbOaICWy9MRa7nHOWGnoPHPiWMkJyv5
	LfAckI09cRUEP8nKL7teczcDtOtkMC8YuqaARQJMMZNgkr2hMBRAWDslkzQxEdcF
	m2/Ncw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtybd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7390c789e4cso785304137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604552; x=1784209352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=AmgC83YbzdHRz1TQCfTG2V03MFDzXFsXA6YYZN5P0YujpwOaUjHvo8Cj5BHC6LH+Oe
         Gp5LYvIUX4XH4CyDAWBxkWTqLF155vX+SA8D8NNix6hXoNPuC5SefLDv6sOTjq7JvsqZ
         9g1PG96bx0Rw64WtXv0gtGGIFYeXaG0/Vl81eo4J4EZVBVeKKFvb0PsjHStuNTUGyajh
         OIHCLknDTX90TtyQL4rSjEMFPoJm8uOcpeJLdVbJ+6i9sufzZgFZ/GIQ9i3TwVgD0P+R
         FZ7GMbzVb1v+sAHFCcVGYViqvVy2e6x3Cf31hkjxRcp9Ml+/7jYACCasj9eqz0Ez21i2
         SxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604552; x=1784209352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=aDqD4rloJKBizIwiaDZgp75boJP4+D6T0WtrrLED8jAHRiT2Gr9LEz1angr/l4jzK6
         EDVTpoQV2S5lfJlw0ZrWqLeBBvkCf9D1WGxXeU68LfcnvmX5l2mYrxlb/hW3t9NtOAmZ
         NzLsDeQMGSXufVI4NSJ4/sZ2q3XP3XsPKHS/Z4EQv3Du7MSQbit3xi0kIs2bqiypCxA+
         hXOA4KExjOWl/+wGm2PmuRE+YxEqyRquzrQJQ3q6vsVcdxBAJh4cPON6aNjkfSotkF+j
         TvKD0Rbg+1TY1T05ngypuUhqFWm4SdM+uvL2IsW5IECxHQIB+5cnshXh6bEM6UnB6ZlE
         QxmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rppe1WMtX6nE5iKVl+lUJBUsQRCZDQ1XhN0iqa0hsoEXDSPhRL7buOFNzJvTZ0Hq1YWSxna1w2W1Y39iLWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4b8aAU/EUeLRb/aXx3qg66hSDm0kANWaeg2Z7PFswlnQkESrQ
	59DiHtzXh4I80cIxQWoRNn2MAmk0eQhJznJ7CF9OZP84hSPT9l5+hi+tQ7gZDoU4HGxoNUEMCls
	FUE2LLe1fwFU+c0WXLWATPeyUAA2ZGyWlFPrLAmDc+vJ85Ho/AgQMvBb7xfyOkpNzPLpp
X-Gm-Gg: AfdE7cn3aAN9FGddeO9gbGDFgsZ5xAb8So1YqeXFyGsqoQ04Vkj61IzOe8DX90OzWwj
	LQVLrM7F3F093gc7qelr/9vIJJNAv73eUW17GORazf/rGuUTqy63Q2EQsl30VEgwyFYMrtDLCSM
	DpEFrI8ZarATaKz/9PSvuDpLjoTCYjBW3wd/+R+CGtGvOL9poaPxyM59uTMqhXgKWr+49OL78MS
	yvm2RHcV4nrLeapDmM8aAdQxXapdEhya8uST1H8bf+DKj3z2FbnKQ3jtQT+BumW8adYuwzYBCRQ
	RBi31SJxAHiqG6awbQNqGOJwaqzTgSb3hWWXNtZl7QgrdbpRjo7bKjgzx+76mUVvD14PhGMp3oy
	hhiEijvvOu7BELZu9pk+ga9CEmYQC1NEZUCZHHo3VHOSY409WSQENE5eikrvAUxczZr8mnGmyi0
	SN6N0U/t0uEWxASzN5vEynAlup
X-Received: by 2002:a05:6102:534f:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-744dfff50e4mr4386723137.27.1783604552506;
        Thu, 09 Jul 2026 06:42:32 -0700 (PDT)
X-Received: by 2002:a05:6102:534f:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-744dfff50e4mr4386707137.27.1783604552100;
        Thu, 09 Jul 2026 06:42:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:04 +0300
Subject: [PATCH v7 13/18] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-13-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Ul42N8FvrM17uOk+9VPC4UpAAhYdz9Ooezo
 0jOUO4z7wyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1dQOB/9zGjTXk2clJR8LiscFgcpZtP+4allG1X5iZDXKrvnjA92BGXdorLL/aFTQQAiNYl5DdPE
 scTBDB6czY2l/iJZolV5m8+sooVomFMyNqCEI1yKHHKdO6tU4Y9TG/vKJLNIgbKf8KZGWu69LBP
 2iHBaDE4h3B85AtsahADQQIyeti9Ggvdo66vtBQViKgVj2oz6kBXDxHLQmGRim504meMkBkbAbI
 jgvoj8Ei5N0+pVRg/emfNLhzO3byaaqltq6pyGkYUiGtY546qZvyOAdd5z2QLL11yTMRBgYGLOf
 K7XiKusMDx7dD5Xtc9mxNb/7+I7jL8ef2MCZ/HeVCOkz2GNo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8rcC3GbIWset
 j/yEtMNff/AzhYkrc6EXxzONK9jJZVvS12jfjJ8u/N9/5YI3DsAQsUJwfW4Cmhngm4oXcpM8BWm
 aU1jBMTR4hhQlSrhR8C1DDqruUZTrr0=
X-Proofpoint-ORIG-GUID: lOcqAmISTjEl-1O3kuoUS4_FIixG5ATa
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fa549 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: lOcqAmISTjEl-1O3kuoUS4_FIixG5ATa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX3voESOwBMOaQ
 xq8LTHpp7NZL4sR1udxTVIMHlBL5PnFzQlJegYAPyxG6xN+MhrBhcXoF+e+xF/+m2PhKshaG7X2
 by1oCGTHrXo0QD15QOMSxrzkJ4VuRu+9+B1Hd1q5W1Y5k3OjI1Kvnqje9vEsoJaSBA9tiVft0wU
 vbpq95BAzw5tBmXSPho+isnN+GvYSr02XnZjbq8IlnbaaAyFUAEmUvGNnZji7dyEAZDZNc/Wo6G
 uy0id0D59hhTNBRPp3VXjrNUH2+bQhUkXUDeRuCFUA7EPDd5YANHLpuPZtdQy4aBgH5nFsR5SoP
 UeGN46cIEkPiOcO2cUUe/sSSBjEqZvUj1oaYnzYY8VSpXszsQCbOtBcxDbHagaBVKcvsy0ITI0d
 zODPEN8MQkDlF3HdkMqpHP/i9Urvab2MDgO1Bv3dY17mMuXUh6RBXe14jny1tsMrX5zwdt1kykt
 SCPJF3mcDaXv9k5/b4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118021-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 615CC73243E

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 76 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..7ad6f0bb4677 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,80 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return BUF_TYPE_MAX;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == BUF_TYPE_MAX)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (pkt->num_properties != 1) {
+		dev_warn_ratelimited(inst->core->dev, "%s: expected 1 property, got %u\n",
+				     __func__, pkt->num_properties);
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


