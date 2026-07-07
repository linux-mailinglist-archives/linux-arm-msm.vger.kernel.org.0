Return-Path: <linux-arm-msm+bounces-117418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xrrKObqATWoW1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0B720315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oXsRJxzY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cEaL0UNq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117418-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117418-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 605B33129C16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7C3492529;
	Tue,  7 Jul 2026 22:29:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E1048BD44
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463387; cv=none; b=K8JewaGZst0DOWAJ+Ykl9fknW/6LKrsm9H/tlUn5x68eJHAfkh56wQYwBh+Dwf8cR65dyJmWMXOE3LzRD/UrpXGVwMl5TovuGGnnIPX0WHRKG8jbmxcX/vTTltIuNoq54TgjqMElK7OfSPO8UdIQQps7IA588TXMvRgrtX9cBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463387; c=relaxed/simple;
	bh=D12Kqe684KHhLTzzN0zwuJ804Vm06UzaITtnqf7NpI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D10IGJIn9OYOJuWtPPV0MphnBmj0QX/UCP55Y6rF5Tx+iI6RNedyl7KMXA89phnv+cLh+kIP9WXzoPkzjm9kNywudExFI8XRuR7Tm0Ot3bVi1iNmMR6xd4H9geDd9F1zHrTFkhcvgepVbrXAzfPhY4GhIqzbRlBst7gJGsLol6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXsRJxzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEaL0UNq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5SrJ370249
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=; b=oXsRJxzYj1RzQzG+
	phyXbmcmkaDzw1ilGkRwI9o3SHS2evQzkpU7guJwMUecNW+BskZK93wPCHvKzq2w
	6n+dwZ+KGu0AgC/3kg9ISm/ZmDzEVRGTXeQJJFtU9Umpfw1x6yXo3oHQGh2Cp8A0
	3aqOFmgiCFs4lCxGKwPOLOVyfBPEyqq0v9E6h9sdqJwBF+thTX5+f/r7Kr6dVFjm
	I5FTMEEg9sGXIWuL9F/bCa2TfB5xRH9dKJlc/+P/sojEBa2sTOuNa9PGgb4Fjp6v
	T6UAIfIw/1VlWCCkDu8XM2SqJYJLrtooflxByxh8SJ5Gtuy9k3l5Fw2eo4ViK2gy
	7Ep8sA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737d352d3b0so26501137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463384; x=1784068184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=cEaL0UNqsZt8Ln6O1BjrP2fFCsEUgwsDmuCTFntUxivXo17v/MUr5e6L9prPpWgQHF
         dPIuS1O6VzjtiDvjLyqnkjGo6+YL585SHNsJcLO8fuGTqfcsIxI56RMSZ0npkjse2CnB
         WOJFalktTofGOmIKE6VDTKR44ARIV9+1fcKTxnBzCoTBFugqx0bpaD0VEalEJaSjS6+6
         xKbWiT5FMz12Byu4S6GEvrdewWnsr+/Md5auKnbcQV1UP1TI8zaJxe0XRdrEz43RJ2Dp
         m08dR9Eu7+PiYLc6iZR0E+ySfoRs0trblHlnxe+FVGgtyuZJxSFhPfpA64lq6gjZtQqs
         P54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463384; x=1784068184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=ntlUkQBkwi5hUy7NDexCKkNhAqHdmD4M6v1j/bx3idkEU51FOB9A0V3Vco5vXVezxE
         +I8ssq9LQVzRgIeGv7NXwKWC6qIqcY4wOILbI9/r6bLYlDrn+szQeEvZepmQROZnQcF3
         ZKnaisaB5+rVCXbGpDcpOLN8UaWuFC81mUn7iU+B121Cw/PxIGzYacxILn1rV16d85EL
         sjosmue5uZVIJ3XyOvU6zG62wfiN1J0WIfdIVcSRdOG7LnEx3oF1MbR/25A4tbJZkH2X
         xgpMcaZWcgopkSKoTmhabDONYVUvxwXre0OYAHHf7g62SGn9xvYV8QkfR9d+pXc3AFfg
         0p3w==
X-Forwarded-Encrypted: i=1; AHgh+RqHnaWtmo3oTInLzdPvTiDqrK7KCS5mDEvO252CJDweu9p/QUswo0UfQVQyiepqECsOJ8jH6s0kFh8KRZat@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5g53kiWhJZ+25mNU7h7BzBKp1rKisGJiHH5qsCR/h2Y8dVK7T
	e78qa657rdbLA+ZV/wLTu+QFa6zcbHUbtxYN4wAmVRbqLL8OnV19/pH4CVt/ktVyagAtfH/rYMQ
	F6wq3xsgxulRWA7QsRIKQH8wHS6esBlGb4/6+mJYMCuLWa33xXNQZ7UUhr6xB0azgLDAU
X-Gm-Gg: AfdE7ck3g1zdUCKG6oOi5YC8hJ+Z6JMEMfiTjjAnFtObrfQn7R2VMbYxk3DsCjnqonC
	mg9RYQPptZNJWlxaAPhu1II//Wn8Emxvo1cbfWBfbHpCHCbY+QZoCAvwko7KjUdUSjMk4JWcBxT
	V+hGkimn92TOFOQKjym2qIYgug3Cz0jUBF9sBlKrxX2au9WNLC3dPYnwqil3uOgR/CwaOZ5B3mr
	Q9zTeN4WM/BNNuSJa3RYfi7mnJ9t9b0FgKktb+o6hg49Oiao8obw6v8NqbQPI99S2f5aZ00Z14J
	8Sde7K6i7oGRxvkZBgNImyL0+eX5Jvnd1pbMHo5kYL9XTZp/9j9uMt3xQzY+pJnZ+PjoK69m1ij
	4mtkTLN6iDtI9wjVY4kj6rGazmPIqrmPLxvioT8BlZ4ygIvm2RXmu0RQIh3fh9/jlTRsFQmPoAg
	fR/AvekqAtctCnjGSxarU7qPFd
X-Received: by 2002:a05:6102:5615:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-744b7c951d4mr4346745137.1.1783463384167;
        Tue, 07 Jul 2026 15:29:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5615:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-744b7c951d4mr4346721137.1.1783463383705;
        Tue, 07 Jul 2026 15:29:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:52 +0300
Subject: [PATCH v6 09/18] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-9-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D34MZH1YqLFpbixHKqEmKSwRwy+EVhESWZFGb+Rb8ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pmIJ+Ta2MfVrlSZNGx48C9tl/beW8v7ddU
 IsJw/c4dw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1ZcgB/4pcPaP09mT5qhJGmEp9afqYZ6BpWw3hSSmIGDTgjfJqTnm6MwI+wV2AEPSjqBYODQUzX4
 KU4nSTrSUBZ7Jo68cut+341DT1Ej7UI2/V/OLkK2Du06DURZkwIUcf1AoAmAHxkTkk+GBLw94SK
 DTyuTshDYTjGiwCOWpL6lCs2W8KS5PiQRc1ogGpA5hjk8np7ll6qwq7EjGvTOHQmU/jLV8ZpRQ8
 wLbwH2K9hSbKJoBnat4MXZSmpiIFa97hV+avxlqkt7yLBAz7Xrm5vXq09YGHKNe3iqhvVd1dADw
 sI4cZQImVOGocTGFt4M/jHNOYgbLQ9Ix2OsDTY4OlXsJSGjA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX/+4r+f+lz0ym
 dEGAGfj7ebg9PaqMd3kN26R8gEBUAxhqMcXBQQaPUk0OGzIPRqkWGhRH26APCy6JWkrAYpAUiX5
 L0M9kwb0+DWYGTUitzKQ10KPpxqf8vA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX6/nefaF06Xjy
 L24urEGqVqrJWkkn6QyM0IR++jyv+QI5p5mGNxbLxvFdZxRu9/XevqM7X+m3EDM5flvDxUy6qdU
 h5mjyvun9Uz9Mkh7D4ewX11O8o5zAc1KtRuTxwIIGGJsW9aPZtCrYgwNShTFfI9lC0wFYEK9rP2
 zsdA2ArWIkooeBvCsSUl/MvpZabRrmighNBYIMuYyBJfFTcaioVWHQDxC8rH6OxWe9Ki8drldLf
 HhrB7be8OxSkMnpAcfDdKINA41gFSk9ScIUmUSli6CXU993kzcaLSB9d3x6sheukNHOBjsMuCp8
 Ra95l93UZr+XOoxwPxyPbhp+UW3+FRxrTj/rsQh3gtSmJwxuJq0hs7sP8qh+K/pluiFdWs4J+Dr
 E4CyY09QqJz0NUngKChyqVObOt6yFU64tMiaYYAdguUI6zwu5xwhXnaWKwlxEogvXUFUEVzJpM3
 zcJ6OKWaiOIcJibNhJw==
X-Proofpoint-GUID: AeHOan2bG_YZ4jI_x3aHkZk5Yc1uHBZP
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7dd9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: AeHOan2bG_YZ4jI_x3aHkZk5Yc1uHBZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117418-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BF0B720315

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 940daddbafcf..e194f67a6f48 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index eeedde8fc9ce..b8099d7ce556 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


