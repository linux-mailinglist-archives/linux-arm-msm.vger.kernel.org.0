Return-Path: <linux-arm-msm+bounces-113277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +qEZBqqTMGqIUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56268AC9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BirFjMnX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iIEa7QZe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A7B312C521
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE0D13E41A;
	Tue, 16 Jun 2026 00:04:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F71DFFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568291; cv=none; b=aQgptbLo/fCSRUW51Ip5VTCB3ML0FOlkyEOv6fglg4qH2NwEuKNqaA7FByUuOP9wzaPkQNUcmHxcAwNFlow64dc6wY0npgxp9XQf6ycxDpVc6tWOe+RnGysY2RdOOfYmaNF9X3MHBRzAjAV5cY4jyTeGgh++BntS0ZGzwW89kME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568291; c=relaxed/simple;
	bh=w6VvzeXtMFbm92J+o6+RQFxhKFl1bm3gP4NcPPLrgdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpXWeO1PSNajfthTxqXxvdEZ+ixFIWoHmQoykPB2zqbzlrLReLyJkc17VXIdVK/ZLRvoiEM1CTBnklvOnEY3/9Vr6RDsq/jJnULpMA+Rg3Gfw+HLHCb9KU6oBbF86yKHeIutJ32p95A9BKlvAMOPIEgu1Phk+vg4V0XAgZBpx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BirFjMnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIEa7QZe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxDIE844415
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=; b=BirFjMnXx/w78PQR
	ioq4PTSxqLkLlMGJi7pey+pcuVZ6wzpMh1w7h9UwF3rOX/3+hN+rmyqmrIkmkA0l
	PvjDPgUZuiIiBZrVreWo3T35iJlsaQq+FQymC/TcXOxIFAXg/NXY+IMvsJSJaT/Z
	yhGZg3FZnbj4L7bqBW6RIEgzX9858tlVXzz4Usbu4pBxl+YsWp+PJ75tNYpVflCH
	B6ys7g8nIFwPtx5BjeuaADHDdt6ULgQjgb4JEXLPE2Kjn0qoauzyKOFVmG8o5Lil
	KfJd9xc95kUjcFfXpSgkVxHCIznEOxG42KAigY9GOyH4xzW2AILGOb3ZlxjZwalg
	Qzie2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter03mmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91574ad6871so601475785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568285; x=1782173085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=iIEa7QZe5745rbtdkbvmLrdofIUiMR+yqCtO8Wj53PW6SDJr9mvdZblqp1iDNVPmkn
         8G4HTYT9LFU2pgJ5IF5St4peni7R7x4jfGb6Egm9ks21luEy1/XvwzW1lKQzDDkoIwij
         G6CB/WZHjB9sDzHys6Z9KigNYUv2LHcoVDDrHUT5HzFFM8kUBefpXnaoCm4D7miJuDDJ
         rvTKF2LbMmEbOuE59RIZmRkMMlRoUdFgSTR7AgVHBRaFtRPx1dUKe6mK4fDWQzjVHrec
         EbEXU56tN0cD9eK8Gvq2ANnK6cef6Vlp/9qMO9y0dN8tJusnag7pzMwfERwOfRjii/R5
         EEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568285; x=1782173085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=Mc9SYY4+oIiskuGTRVd9kLENURMl5iw587YQGrU8f8fLlH6k6yDMQSsQTywb9fDmoT
         YD2NfgehZ1d/zPonYNd4KlzOazzhVRg9r/nj5Ds3x/DO3DfAf2rMpxdD/p2RvBTCQxsM
         KDhjHfFb6qjxuoMjf8w93amGoxhlfig6wXcfQvyfWDwvmqNDPxpxwrS8HJVQ022vUWXC
         t53QjA/MCqWVlXA7eLX7dZr0h4/MzueDGUjW11yAfCAuhX17BreYLY9mr1NW5TmSEDsF
         nMHVnLfl7DsmbynN+5BTFaM6mW8VpfWKgUyrOfalc1sAonbNAmCd5A17FuxtbQ7MDrpE
         063A==
X-Forwarded-Encrypted: i=1; AFNElJ9wgXWEb2/64YFeBtGSNGNnFN1unrG+9i+PrIOfmekPpv1VqTgk3MdQciNa1eMzI8U7aNmJRE2CKfguzpAi@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCmhsCarcCgZAySAuIir0Pu+Rcug8ZiHgkBaSLhTV2fpSoCmS
	V2frFTBtpbI2JbWMJ5j14fo/tXNp7uif9vKITcpJNM58B1r704ees5jQuHFhUrG2XqLxIDOLPw2
	WLZt+psdVBz+3UF1jrzFovWgesy1sG8EL/ktfzblxMLmeHX5HaHaWsBs1R/XACHsbi4A8yezftV
	SX
X-Gm-Gg: Acq92OGWp7qDEWFZPh00h5CTs/fyTsdrfihJl1FhMjmA7a1WFY7OXhim0+yjxAkqwkS
	K6wDQ/Gmmr4sxYaAXLmfXvOPvAoPRkvCsxS7hsURrkyViUPzP6f9fcROq3p/3BLdkTLRNRNtGlC
	w35WIlJDeaHYW5lmwcYWZpqoOBmOlNOOfEakvpS2mpECDGScrmbouLl2qfkfIvVF8fyCq00nkvP
	Rvdm51Z1hhouYNbY6pkCLUUlX+SqaR9vzqeItskTiYJW0Dx6V8YOL95OPsjBkmOp6bZC0o2bzZb
	nKubyK5P0jz10O5l6G6FDS9Ks7wPpy9C+SmnQ4eS2wrOhGL0qO3q6cbBy10axtVN9zY71Z7hQKI
	sVK5AUEdc+n3hGH8wsjV4mn7NZW1xyNST6bdgbFNVN4Q5GjCRjOx0rAqCRAqirYlaTZXOeC8geD
	oo6zfpOLAIUAkTlO0BXQmARJjn57w+keu7OL4=
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213378885a.44.1781568285326;
        Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213374585a.44.1781568284882;
        Mon, 15 Jun 2026 17:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:29 +0300
Subject: [PATCH v5 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-2-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5156;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eAXYetUjHA2IWQTpRRRPO4xYcQIYvJysU+KoTDDI4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOCVxIJE4Ld/rO9Q7yn/i8ttZAKx5qQWi63
 m8rDhp917GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1QQaB/9Cs+A3xnIsEPIFwBSOVrrECopmLXgHrH/IIKZRfSKjijMQkVawulOo96ZaphpGTVfQ9/3
 AF+0G3tmGSgsnwFK2l3aaGOC8oDMiD0taI8RPXIezmElaw8vzJQRSMo0q0g1BAp4GkUNS3jRGHk
 KTW2j5pvjIdy6L8cbKi5iEwhMlJMFZma4NWoafEY4HOvuDA8PNfoDur0VWJM4lzTh20386ZyPxi
 r7Pq50hXX76eVSR+a/Su1Spy9xb0ocMQkkRQbSC7To2U+SVcLvENRTOcF0fdth5j4Jny1UrcPUq
 pZhUHRHcjA1FlMHHFpgqXhpvTkHw2bumvMRsp1ib0kkzcKX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Y5sbzzBc7uk7dtz4Bv1of-svTSU_7CFu
X-Proofpoint-GUID: Y5sbzzBc7uk7dtz4Bv1of-svTSU_7CFu
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a30931e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX+pw2hf4coNXZ
 K4zVxMvE10aP3nxZBWX1uJ2T3/tvBSJ2vUnd/617N+Y/ODgqRxH8qiouDXCRfakqq0l+S5ODFIK
 4gpD7SPR1OGK2zVDO6lzoUEYt/Qq0+FhQebno+9BTn7UgIzXJ9ubWhm6DmCR0ynyx3fIu5p+9oy
 JUKxxMKdshT4kTCvN0y65BGVXWbBjiKBsEq5pEL1VplG4WlnQTU6IA3KssfvwIrgWRBqRYhtIjZ
 hJ3MhqY2xycfbWBNSJapgoAnHoqZ1yiTAZaTovcpAbUB1gUXAzMSbv3S7+b7/GNX35BzX6f7HBb
 h3yLXSARYZspwQAY9+BdOEZVKpaPpYmooiCQxE6ImaHG6TwqIo98sjwiPVnUMw2auklFZanOoEf
 2n+zLl76LRhaYJ5q1kyDIBPvUiMImijnVtfsEScQkGQnyB0igH9gzZqmKLpX7L+K093UvnZm5lr
 q2RxFVqjd/3RhS1+fgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX4Zqp0NkLFL5g
 oKqHB7sQn2sA674aLNrcFFlbSMjGZFvMIAwtD7kcw9hT5qjgRBq4I5q5sDbzC5lcd7UWxwbuT7o
 42LFBGf66oRRPb+XBFduVs1NlWhW6pY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113277-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B56268AC9A

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c |  9 +++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..63b7c9dec60a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..2cafbe9f8abb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -91,6 +92,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -98,6 +100,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -124,6 +130,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


