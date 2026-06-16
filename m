Return-Path: <linux-arm-msm+bounces-113280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2IoeLQSUMGqlUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:08:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806F68ACE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:08:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hqMt8xjQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vj9Dthlt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113280-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113280-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7893F315D7AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7732313AD1C;
	Tue, 16 Jun 2026 00:05:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008978F26
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568300; cv=none; b=DNwa0BDXtYHRgrmYXrFtlhc8sxnMvK9WqeZQAO3F42elPiYYCa4ivXNabSg6Gl6duWnhpzuLBamRpWebjc0X79cstN5ppWTRDYBQblyAkm0QNoKT3HfvzD4Bw/X3xj8kGGUxx9QGn979O24IAsbVTQwydtU8Bur1tChZKic2SlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568300; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHXrMsji+ypyQX8CWONJN43WVVRDZOJkGVUHHorwfK6EZAXEnEIDAxtwMK9zkouIIv+XFvYORIYZ3DDLPgAbj8y8zci7ANHlOkvABMylQeObtX1Fr/NqiebKKI9bwj0HupkLCsHK/Da38reRn6q2wALaT6ip4dhmkxfhbdDVy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqMt8xjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj9Dthlt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxDIJ844415
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=hqMt8xjQWmgHItyW
	hY3ukjeudWwLqasB2qaKs5dIOXaxuAotqLI9NWAIXDnPhBDB3vtKSu/lTIeMFqLZ
	EX1a8dRz4+xrEx9+tReBi71DMxIv/YZvIai/c2kYqEVIZmnqBBOFSjuohGdkr88Q
	9jjRIZkSrM2Txj2ohPh8NNsn3rdy5NcSap2s7knszs+/TZ6Kv+ZsfBMftgY9jVYf
	BbaWGI/7o2XmN0Oztcdt9++ek9BVYjcWKXVfHeZzfKNu4PewyR2JEPXOt9cYBj7a
	edj4Vn3laEcj/m7TkCqvNeA6J+I1xUfr/43/7ANWNBh2SaRQLxsIZJR3jrygD9Dh
	IbRThA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter03mp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9181f3cc5ecso480368185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568297; x=1782173097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=Vj9DthltNP2NxgPMS/rhFDdRt9TLbvoTxgJ70swXgWUqnUhMGKAdHcnhl3+of5/24F
         ZDajpIymUk/7fcCC81c/1BSeY1uKFFP2mli2cQA1e82TbYMu0XwyOiAykTQkNik5uQ0D
         P8I8qTELWM46O7HUGZM/lOpn20KIC215X28StvnGKSTvx/9OonCkpU9Mvg8wfrJM616V
         YvAzuAwmPVVzCpFZ/a76sKOs1+Reea+W57J8WbOdZlPnomz+WrA9P2rd32c9OOWB8Mef
         MAZwbev7WbIRLZFCDiUvJnteOhSEKOHd7SPemzKu2qHB/5UfoGRReEeVLMXbaqO4MsT2
         78WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568297; x=1782173097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=FUTjl3Lmrmn4DGrtzNLunKZT6Y7c4FQUbpFGTezxHDQgnEuTzRX88oX42R8bb8nOXk
         FP+U8ZtfWuMKQTFZ598fCJb8XCC7FQCr6VWfQLnmjqLQDM0pC9pRn4qmahl2L5E/1Wsu
         OgtdyRfsbv0xKPvED+AbHrXsWQIMwBT8z3CWBrZa1+jMXC3YrCN8PCKtZfj1U3I21d5B
         aXf3a0UQ9URJsDQJx/UlhXEpC7OWBz7zvhfiwcd4zPJvApKPuAwK5zrKyhVNQXvqPFKo
         8qJZhYlpEXwZgI13wpWc60TwC9nynhP2NJfAhp9HZdJtdGVtZHeUoyCtXPSN4H0TkrgR
         cexQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CtFWTxZFP1dhFZRAOuE7zWZm6NfL4FZ4ZZeA8kRCQF6nH4OhKUyVKx3tDWc23TK4rNEDTTSO1Rau+GgKG@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWLoY7KMUBWr8xqXerqLWB6EoP3KryzOIqcFTQgWh67SvAL+7
	XZAMlbkbjwdyiaSWWWWN3W1AuLAIk9MDUSc4Ynjp2Uxp8w1X6pYd/6lnxRrVo8cuD9clb256y6/
	AwappIdQJ210eXnxuT3ye0scUazxCxHpesQJY8/NYuCjM1B2s0jo+4LGquSNkfLfRLS0R
X-Gm-Gg: Acq92OGxYzRMVRbnskR1ranrV3IyArcidgYJfZ219jYu0qqtvZM8VHsuDOc4grJjTlI
	sxLMwQ506xvWo0/NyePvOtyLGCcM5MQqiTeumXaemZI/QmSsYrtirYI29VU5DrIoJBMqmHZZ+03
	eekiXbkmb8z3R4kNndE8Ch+CORjqRlF31iXMKJNucfn8DD2SEMHUDEfUM+98JnfhPMOrW2i/ceu
	531Ckcfa8MdJwb5j45VZPO9opX2N+qMYOlkQhq58MwGSATrSuJeQut5hm487EGXh8ATSHrU6Ezz
	d4GxROt149NMj0zMTWzjRRpPq0BdRSj1AgkvvUUF5LZ76wgWczGnS/gAIGfgNqNLQf92poYXJnA
	07rHRb4E+PChJYUArRS/c2JY0KivK1UCjlfBKuNn+SJU2KbomOv6MTbz8bu+4xdWrRiQFOb1qDe
	lCt2czJThTKM9lj5YLFv73AF3BMPY8838xoW4=
X-Received: by 2002:a05:620a:7014:b0:90f:47f6:832f with SMTP id af79cd13be357-91c2f4b575fmr236453385a.33.1781568297217;
        Mon, 15 Jun 2026 17:04:57 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:90f:47f6:832f with SMTP id af79cd13be357-91c2f4b575fmr236448285a.33.1781568296646;
        Mon, 15 Jun 2026 17:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:32 +0300
Subject: [PATCH v5 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-5-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOFCSBUjYKpeV5O62WLur1Lf+FhvaEbbPEC
 dCYVRVFkYSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1f8kB/wP/NZcnkyFWquaYiZTWR/p4Bya2N1Xawcrr3joY5LORcCGVyOmcLwrn/TGb4paCCd+tbk
 VUtV7EegN2dNGpr9mYPH25+J4PEXLuPBp7x91SnWvxf91uvi4FuyLv+hfJnhcWBEBiFCNr8BXjQ
 O1uyOkWxZ7UdNZp3twRtJn0/Ar4uf3MwJJGwbxe5Gn/K3v2dfYinJLfaN6y5vH+n0/MR8pLEUKY
 O0irOhbexGQM/KySErNUqppkyo0EEHGrzGy9+sju+ffEtgEbGLsNlGId3Td1xWnJ9B/Q/xWBVJQ
 l3ja4KtTl5pYRts+L9AgCpzPr2/CTCBc6aa4BnzjfdP84CXs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3_yNrqKX6RqYYt34TfDSFhCQ70bxaDBu
X-Proofpoint-GUID: 3_yNrqKX6RqYYt34TfDSFhCQ70bxaDBu
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a30932a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX8MRrHvCZ7tH4
 XDn8UiUFmALqEBaYYcG0PlaBTKhyJvtwAVwJWeVrHAo+ubNN9ppcDYjnc1JivwZWc9a6RGIBBtf
 9lPZObq+Xf56T3TKX4lFTXUBKngEeA0K1Skhxs75bpBvP876E2JqCBgsprzkDynak+qbeyQC2Nw
 5ePClky4wdiuQGNFxZCClBLU92AsUX6z9oWiOr83Z0pmsC7qZK9ycHblhvCvurrP0NvaTn0ZqyU
 R5SxKT1QsbmBxOcHHdDfTysKVPyeyA+p9VKRgTyQi1xbTf7rtUlxJbYWmPds9EHDxrbsd56Hy+j
 kOjiYkuWPD5kVoJ7b7TuTcgxvzlpx1O9F/X4smxRMyDaaBguMoROzGy5kU+IRN9w9uN2sR2Iihb
 GaRdqqKc93nxsF/qE7Wn4bv00P/EYU+6itYJPHT2pLC1mRXWHN8QPTpX2eR35nfLfYXFNI7OTK5
 SXJaVHlfXxDlwFQn1jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX7aX+tlUtdxPo
 kNc3nQkT+fQO26ccHpVvBwfI60ARsWv5Ik+H/KPlnDvei8nP3+Pf19/vPXLpWZ1J8hvlg07uYRy
 AvFCFzRRvGCCx3pgze9rWaHG/2PojyQ=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113280-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 1806F68ACE5

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


