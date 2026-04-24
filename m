Return-Path: <linux-arm-msm+bounces-104390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOxdEc8g62lYIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:50:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93A45AEDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9361301B72B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D44A34EEED;
	Fri, 24 Apr 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ondEj51r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3KoMduX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B96633121D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017021; cv=none; b=unWDxLYMsyoJ4wN68rBhT2bypu54dkCIMgUnV61n/6XpbNIkJhdYNQCPg6hrW5gPqEOkpwJpdL5tiTN7s0/kb9FAmnSvkiCquh4Y1t4r3diOyx9MyEzSBeHdkMxWuTG0kXqI2ktXweWxg574JSMxwehwD496nNGU36v3oQI4eys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017021; c=relaxed/simple;
	bh=f+msBKQ/wpCfm8LM7KLBCLdErpAw2i4ZpFmFsXMNlyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ow4lPmGmoWO4DGNyJARzeWYrz1goKpRtSEfI6mIkDlYS2cVpGBaCSev8BHQ299IueofYqd37oLTNdlnO8bZ+cLUb9wIxD3F6Z9ozgrEPIo1vSCwCxxAKLRyv/+8kVmiU40SJMDhW7Ac0uNsUAuq3m0Nj90Zy9eNhVg39WnEPz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ondEj51r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3KoMduX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7YuRx4167365
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 07:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=; b=ondEj51rEOUvX7bM
	ydm48kX1iUap+qxEe9gWE62j5ttuq1w3gu/SJ3FoaFKely1PjUUz7GnFHnPJA9ty
	AxjgCZDBBquNLZDN1Ml4D40GZe1F4N89NkILCGqP7PgsqbyxENRq4pWk/FoBg12Y
	mlIJv+ckzVx5RACBxXAY5qHUxwCh7tXwnv9FxlUtwr4Gw4SO3XwoDNeVbSQ/YgrA
	rtm2Mrcr4ap3z4flGbL4DVil1UPI8vjSO1NtySJ+IEDcMi7qV/yMcumHYikkKiB+
	6GulWslwBAXXrVWgpuHCinaX/d+UbqJxMqBIMnAZjvNeCzIvY1enmBRk5R1gb+YM
	q/u4jg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n01tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 07:50:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso104488331cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777017016; x=1777621816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=;
        b=R3KoMduX5NPmeQSbAovofYrEJR93KqZM22Ti+ZhZbcdqXcFFJWHFGTbR9og0VoT/wF
         CiqCFbl1l4Z5mLbnXG6seM+C8+eFQGY1iSb1CBlF7EpWwdaNTFu5El4Erb10zTVdsZyI
         1ZZOnWqOnFAqjVUWWxh4CL9gW6ebGrCD0+puOIOdidLxL/Qz6j8bas8Fi1Sy8Xio4YJc
         ePJ3phAzIJdlwaNDYVWR/hWeYAi4BeNd+ZFlpKZifsABJi6/q4hp8Syyc6Es1Ymvqn8A
         USls+xWUaNIBgddjrJq6wq6C1O/KpZYUmZWIlqAhJOTEZi8SuyUSBzv4uOVGMeHrwO+P
         KThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017016; x=1777621816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Irma5VZ3r17WvGDWJhFF9HSsI7jbHdVbY1YJy0bVFo=;
        b=m/amYUgtei0TdlsxCNkVDxikt3bkMMoGhyJKSErsu5rBOLY7phud9EcFvRQTqw9chZ
         DZ3nHrvYn0+95cPnWvAUahQ+e5XpgXDvMKEEW20IlIgQ698SUx900wDDYkzknkl0Q21E
         Vv5YzZ2ZpO6FEDiJMaKuDKkLCSNQ/RDYDEICLgQlwYQCv731viVLNo4dwWZKon68iMmr
         XXffHQGHYoEijEOoHM6ZkfLUatnpt+dkOFWqfmTv6ONgFeRxhBYqAH5E9rUT2sd3yNWv
         sd/tU1bGiY4LtyuQRsTX++UQsAJrWEBxiWM/AiRUidWuvB+4KNs5k2R1FeRkdHPgGmeI
         V68Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ewdYcMMHCI8xyBkDA8zMNMPjeXRrvWnotI6fPZvDIKoYEc21YWukDIpHuavS3lcBakpzF74NMGYPWLiE+@vger.kernel.org
X-Gm-Message-State: AOJu0YzVHAY4vdsjALBC66H2AUIAs9ZxpfjgPzvSglqdhpNR7fh9S/du
	g7ZEI4eM+tR8fFPhSkQwhxyUSmxtxUjKMqtSpK2mgjjt8MB908f4TI/NliXmdadPrOFsG/DXRV2
	oIOuwIGKWxaYeuOki74mi8bujDADTxmxhNCWFeN3C9EASIsf0p/OUNvg/SDtPx5rsfeYi
X-Gm-Gg: AeBDieuC4wGKC7ik5atWU2MKAKD2l7EAa2yDwmDjiWLYbcJt8MH6udvrIfyGHWbi9vS
	NVmwYHowHzy3+6ZH7lu6a1Gu9tVQ9MA8TL4Yn1VRb8LZVnwilJIaLpS/f4w63A3KXIE8sV/cQGO
	8TZpdoZBxjmc6v9Hd1Cd6Ai1VfhbIZ5CtVBP+/RWLd5Ejps6jSa4aMKJ+MgQlf6Sp4m+ykFFNfz
	GWN5ZVZuqMsdCmyaxm1KjMNtIO6xme8D43TdO4myWtjmUEnk29JinnLDSLFa7XiK/MWPOokjOR1
	/LWcY+m57AaSEvD18dSBoZ3rtR2iTbPAFoiWk1aQwwDSXbhUB1hGafACDEOIJiMq/13NCWYrwH2
	+o+cXhNVynMgnYS6STT+AI9eCzmEC08myrC9bX/CYZP5QIylGSdJkegDDFKs6
X-Received: by 2002:a05:622a:15d5:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-50fba60364cmr169042201cf.40.1777017016503;
        Fri, 24 Apr 2026 00:50:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-50fba60364cmr169041991cf.40.1777017016090;
        Fri, 24 Apr 2026 00:50:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:35ca:88ed:3f2e:db28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm96029485e9.31.2026.04.24.00.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:50:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpio: qcom: Unify user-visible "Qualcomm" name
Date: Fri, 24 Apr 2026 09:50:12 +0200
Message-ID: <177701700896.5488.15804898915252044204.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H4bmF14MmEnZqFA-qUNqJRBxCqWx8O4F
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb20b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PkszcvWzcGkvcTmTrJMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: H4bmF14MmEnZqFA-qUNqJRBxCqWx8O4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3MCBTYWx0ZWRfX00hJQkS+XWFQ
 QJq1HNQnAwNVVSqM2Fgx8wOAEU8u6ZLqMALglEqeCnsvWGs30C21gY3NGA7bcPuW1AnZqait659
 vEnmyz1ogAZcN/7i12Tam0qVUCQGt7OJEB8xKp912uFD95plRypQedONouIX8nCALjGJrbCTPPd
 pWWkFGydRnzqibpVcmGR2adMOst42ZjF6V019cuCN+V7P7OrAQkiOguWcHbbxX0aaVWmWIYvcbT
 8S0OkpihYgmh2axxB1WpOTRh87JAMRbpuBYIZP9+15hRw7F96xaFD/ItyqbXmkKOwW5UqT8bMml
 1G4gjFeOE3yLx54gRklWZQa4WyW6zg2RJIu/8qVVqCbaEmEm06L6P2eIe19/vRvJdil6/AZSJkH
 9RIx3Z/UCaPEigEsbfBFvdWpA83i2kqWnft6My6hth8Qe5H/R/OoSm6OBpctJSifRVHyGgsHGAT
 6WUbjfbPF5qUsWC6Cow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240070
X-Rspamd-Queue-Id: 9E93A45AEDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104390-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On Thu, 23 Apr 2026 19:35:54 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] gpio: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/brgl/c/6d22fcf85e3f089e5096812e89b742dd726aa7e6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

