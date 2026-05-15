Return-Path: <linux-arm-msm+bounces-107789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCkkBdz9BmoeqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:05:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152454E03E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA95308DBAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B7A44CAD3;
	Fri, 15 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zg8KsDCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/BtEWgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819FB44CF29
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841508; cv=none; b=VccFsx5Yk0HDrR2i8qNqOkixIbpSHNQ1vnF1l6HdYE6EetbrjVg/67Aw6repTZiynihoIbd1Pm1bWL+PeqsTWg0U2M/vYyOEXM1ogsXxS+n0R0ZuTiww0UybdaPM5Mla1SazRYcoLSfCHKfmutPz5SkkybIVxBS4P66HR6U7isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841508; c=relaxed/simple;
	bh=ub7Agyk2MN9SFWlFYDcRkZ/1Q0WeVvZGg/cobW/RJVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUjMZjoTP7lkm7voJ3gNZI1T0UQBCxkaGL7WeUCRyj96OmOktPZ3FuZzfckVGsCQfg80sLZzcYMVg4LkTbxZy2OJ4/n4AC9xDSOmNb4bUdb8axEeIKgNb06aH1s3mByLvPKJx+csPBDNL7Lgl4TKmGDPjdjZllQD1WB91QU4eXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zg8KsDCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/BtEWgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5E4bl1848041
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=; b=Zg8KsDCHsgc2Ll3p
	u6dhYMciCWG7U55oZdtxE9On9pJ8XS+1sBV2jdXm8C3KX6hMgAjrzIkRnsX2qZ1K
	W9vMVFOv/c66yfnIlpQ1884ZCNp3zSb5+egy724crIhzDalVujg0Bj5ddfI3G5Ql
	W7+MRuVxfDWMy5QmwXS7psVys3ApRSxH0dsc4aNN54ajqVNBAZqEvAlVYvtkP4fz
	uUkZlcKLrGfC/GjhX3ZjXElz0wwoibEDDnbfbaunGZi5iexE0gxoYZhdHdDzmxjn
	tlIsCmhQa5/eRnsv3TMQ0+GsoAePCueB34H6iZp+Vu1Y+lcYebdNE2975ohxT0bd
	P010Ug==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2u4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:38:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313443ffa2so647115137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841504; x=1779446304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=S/BtEWgIbJ0lYAgf6f8x/9rWLeLy9d18rEfHdfzONfpcEQ7F0a1X02ELfBTHrODLZ1
         UF5MVnfXZ1v8bHQqRs4lgss1cyN/7BBQcJRkPVeVmKLY59LL033Q2DhUOhahjOqI1Qz3
         hDuQcjuokvvsx6AanXgLXufEvW7WACu1e8gMjDGowR0Sa8HJ8w2ApUjF7r4WQEliRFc0
         4vVq/yeMc0v0adeC2xrczo9/ECiWJJITTcWDUqOK7wOoOdF4XT/RxzNqdn+BQVz+hlOx
         YQ2N5kxBJ1/8sX8Nk2mw66ChCE4fT8wooEpdjnqT3WwE3609qRMO1WfTjmLpDTL7HSMH
         g7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841504; x=1779446304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=M4tW5GlZQ2vqjEVtQ6mKRs188rIF0WYxEGxtYM0aD5L2HlbhbVmJlael+IJ5pnpeXv
         JJKGORup8FRnSHCYnYpYjMf4zhROqAxFqjbhWbOmF++1UJhWYalfO1qLo/DtyyXy8owc
         4WJnMWyZ1X+qQopiBlVlRJ4JfjPZtqj8VcJYSOEOmH29a+26fsLCObkquDBsUpVvwtlf
         K9WYgZoauoyjNMsZvbcSWSEDvhUeTIO/73Xr5Om37AAgDf+NvJzfJXpnyytxJsuU0PpI
         IMC5VCo9W4ccmmVoBzybiXF3IMT/2Mc9sPV7mazaM4AWhIb8isvmAH2sU795hhRM0usX
         JW/g==
X-Forwarded-Encrypted: i=1; AFNElJ/Zl3JrVu35sjQfLuR7q2x7eJFLZOR2dm434g2piDxp4weW6jspyufBh59CCYMGRQYqzrOz6aZA8XbQmriW@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQ6AwI55zBt0i+Tp+/dRkkoaHqpUwe5VUvoDiZygzroNE2rf5
	KX+5qbn99sERWFoRQGhc7VKunvK1oVyKX/WKmdWi+fy7lRXlMVrVOT7nqf4RIGV1x9fKAqO/2z6
	3NAnEHl5ddfmSsCrehK3Fw8sILbOxqujuPTZ/mdaKiVobBSzgTIMQ+r/yV3D4vv5F2Sso
X-Gm-Gg: Acq92OHddgyfkgD9ZqgDEuZq0P5hc0ldL7QL6jgYUz3a1QI6BdEinMv4e9Tq/XSe0wx
	OQaT9Pj70GR5KHkXDuw94mVRV5N1dj/4iiGd+Bwo/9FLktZwrHdifWG3R66sL1TdwwxqgT8eqMl
	ZxvLAeJD9q2oFJGIMz5XJmL5LXV0gd35tA5kPfGfjvNyl0alvoFghS5qYIqoPOsp1aKVVdPpj2I
	q64ryi2bO/iaolc+LnpOYyVAD+sHyII9L0VE4iYPZpMPnLPkLGUMfxc82SjlIhlvm+/GlD9stAP
	3TOHx6MWyLTFb2IdeCtp8nQRECwuYVxnGnlBt2ohdSHgU3n6JLxGNH6qfm2KwPYq4PX2Y5iNO3T
	sAnqeT6QpnFfdM2s4PRMAHKGDIIx4JpqzOKNn/zkN8D+RDHufQ/eZhC53NecWzQeue0W16B6whB
	47a1k=
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440983137.0.1778841504165;
        Fri, 15 May 2026 03:38:24 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440970137.0.1778841503703;
        Fri, 15 May 2026 03:38:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm210306866b.31.2026.05.15.03.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:38:22 -0700 (PDT)
Message-ID: <f95fb4f1-e763-4ac6-9cfc-e3af1e14df40@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:38:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
 <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06f7a0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNyBTYWx0ZWRfX3VnWR+4LfHbr
 g6GbH7blKgisut5q9gwZEvlHY25Ytz1ZaINdFUkNb9s8oI2AsIh0+RKnCUMBMwlAlG1VyXGFSUj
 2OI84JQ3C38mVJ0NCVTzF1SIlJsIJCrAJIdfIFPLFXg84ZPF+bUgZhYSNVxGqiLcbcDZOCQ9KBh
 KdtlS+3z5tW5tQgpCClfJwesWp0fKVSESXLFrh8CtEmXAAxKhnXaZ9kgPWk7n7Wcj9VdWJPjOmR
 qA4jzz12lKlbJhV9w74HRKugO5HAy/6z1SsQkNAMkQzSXHV0mhLNl9Hks4etX40v01X8MtWFgIz
 sabWYiWlncjK0iqCyiKW9nOAOqHiJKwhRn5AuS+HQQf/oPJ5O4309KDta9BDAky5+P+UJf+dIwK
 vbLjGnCZad1wjJ328utbsH2scbshtZM34Q9hYLTMb4WzZOpwCRMKAKZSYAUtMlywNXiNlLJ2Pns
 W6lAoOGOgn+0Ww6fOMg==
X-Proofpoint-ORIG-GUID: 0VLOw3OKdSWkg_op9mdNTBaJnhUeDBFs
X-Proofpoint-GUID: 0VLOw3OKdSWkg_op9mdNTBaJnhUeDBFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150107
X-Rspamd-Queue-Id: 9152454E03E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107789-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 6:51 AM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

