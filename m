Return-Path: <linux-arm-msm+bounces-112058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zohuH7HNJ2of2gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:24:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDD65DBBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:24:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fJmc94Iy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eeh5VbQt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 594A63043EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4633EC2F6;
	Tue,  9 Jun 2026 08:17:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982C3E5598
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:17:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993038; cv=none; b=fnWYp1TJoA4/uMOpTXp5Lp4C4l3c6Np/mRN/ZyzTtGrrS6BaT1X23A8BIM+t+2qldSFa4BApA78m3q90aJyOua6Ifee6JPgDRfA5an7XLEz3YpgOCZ7lXXONuqdd6jxOrIw0cZ4BzbNVXSGWPlg2gUgUvWt6zzq0qVsopfZa36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993038; c=relaxed/simple;
	bh=TV40QddrINlpCUTTEiKswMyWUvfxvxSh3PSqLXs8umc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMi/Xz6rWlwO2dEc4wqWkU+YJuQ7TG8wMRElNUrDCBbmRXYQMwp13JG+Lncb+WZ+UHUp11SAirYUDEWWHN6pOpytHn+ksFaZqMKHPoytVKfYf8MEwOUoEhYeSRAeqGnFwIOoDkO/cCTY/Iq8tnTzr23lVTFZqxI9ILbGkO63D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJmc94Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eeh5VbQt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rd0B1958612
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=; b=fJmc94Iy3At4AoV/
	Z47ZM/mtQUlkKGRXsoFB6dhYp6T1Z1vPiPJwKq8+grs6Opk9Z6jNPuCmWEx8F5wY
	Gfip3d/qRnJMiUoPYtZT9RNzI6wMLxGSc3Pn1+/jH1g54+FOaZiyUKslW+HGvD0Z
	zF+4aruZzs5114jrAb22smC58B9/XW7Zy6jGsW+3IMv3+BXpCadbf3EMXcWoU4Gs
	69DWwXC+CjYjmLFu36Qn4ztGVoh7Qshfm3gvYbSXDRH1vwVq6ns8ezIFqT6ockT5
	ZJR1VdEQFwt8bI/D5lhpSqS0mhq4g9u6nkw+Qxno+ZNizgu6N3L4t/+UvfzUrMT6
	lJ59gQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8gfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:17:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so13378981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993035; x=1781597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=Eeh5VbQtCOTwSDO8YDMcCqitzVAu3uscZHY+CitwyNsGkR+TeSYwHiAJfvh2Y7IojI
         y7xdFgrU3Y/Si4L+O5/zMArS8Tq/XqAtV7ydrFPHIl5xIFVD/SlFp1R/8FKAW3ifvXqg
         +NVcwrS+iaVnHJLzQ+BU2XAV7wljbNg9cJVwia+Wu6ihgu7vHx35QWaR9sVkUXFYoZb4
         bInqgo0tT8a5bZpuObrJ2vaqBpeJdKGEBvvEUnDlz1ckxseWjflDDuKBZ9Qm9OQE9fAP
         sNYoKGvIZmHu6ER/1AH7wSeLo7vugWpUnavXsR0/zrwU0JFh07LPG4n1QzwhZlrBFUmu
         lUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993035; x=1781597835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=WYkrjiTk77kSCAcqPo0Bof9uYREhopp2FWskQeN3IoGMr2tTHfVSimrDUJMfjZasK8
         atnJsuzqEgvSI0brZq178gzBAFdNMXkZUYm3C6jG37X7BYwK3GrVQe70YltzwUrE4rFd
         YuVTP8tADVGPOHQxOkmIM5kuv1F5n86c8RpokurzMiGYsMNdEXzpOfIGpm268ZeZCBH3
         Gte1ONGLWQXNbYo66qJVoZSTDhJmetVNcquRpfMQEk5EtlqLEEzgUsYksm78eYlJPL4A
         SZnFyf4hM5Snzms5xITbrAbx8+CiMfPZ72KUX9OJNK36FbWwpdEv7Rpk5YDuFwJmDVeX
         vYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FW1ND1wKW7LvHHCl5rnKua6QZVSov9P+CRFXGBlEypERhTRyCdDKocrH7GovfK9zSKRy8lVznxC/tcsM/@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVxnmtxEKJdi4xONbOBtRxQ6VlkdRAxgVl3VCm8vSbkOfDRBa
	DU1xkDhhDWliX3rBX9dh55C9TCU0Rl/81wKKu4JRTisKaA6acSowbJb3pLu839fxSwTj8c/kShm
	O1eOwd38Wy2f8R1TGqP16esXwb91o8K9ZHvoHaFXS4iMJLUUqz9PiREBN27GqN+UkCYmX
X-Gm-Gg: Acq92OEhTimpnjhD+8XjZhcRbP3Jx0NpcBV2C8AWPY/H0YG/WuXu26R39JjppLk2/y9
	KMqlzcgedFQUZriXJTvQhPapj2ZB3x5nWvmzqpWC6A/yki8dalcVrBwo97WHgfGhBTaUP8CDeZT
	iee7KUGRAo2CRtB0/XyOnJu6hQRAHU3oETrr0KOMlLqKPaPakBvBNbtUkVdBuAUW8+OnIn49WY1
	e2KEnoQZakGlPU3C3bbv00z17odlKgOceiCA5c3qEaOANJ5Xt64l1DRmaVIOqwG7/QFPp/PYpQ8
	Ak8qN2fifCGw/s5C6y/rsT5j8la2C4ODRAMUVwuHH/wr438nZam0E1UVVutYGK4O9URR4vDwzjL
	Ajfhwoi0mlXNKN6u9H34T/NTt3suNlWJBZ4ydCQs1q+taCZtJ+MyB58bS
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851615385a.8.1780993035551;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851614185a.8.1780993035106;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8262784a12.27.2026.06.09.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:17:13 -0700 (PDT)
Message-ID: <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register
 layout
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7XcMheA0kNhFFMbAgsndHzf6OIozKlPb
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27cc0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=tO9HO6G7pjVgjP-kga8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7XcMheA0kNhFFMbAgsndHzf6OIozKlPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NyBTYWx0ZWRfX0mozH3yGkHoK
 ckG7ipfO49Sfa8xPZB01mwtnDK3z3v/hU6DZT2XqsLFeBlcDGMMHJPNeVcqaWFdfal0+V+lVIot
 wDZt5ssYnbS8Utv2/H9AlDrpmMZ6PcVCtUC/MP2JEEvSyeG2habQpDJ21IagxKd6W7DwdQoyozu
 dZYNj9ncuEJ0O3TCsX5GUsEJKVW5DTx5L8+WrK5pJNva6nta4qEVkAzgZvXD0S+KlNzNxVAeMEr
 FrflbvnTcJtxT08TbxM2UI8Fl8WXE5nB0lsJfnF/fJLsjjc/ISkt+PIygM7cX0+XYB+b7IpWs6K
 tbcqaAKBWMSsZvX1h5SJ0eGTjamuq9s6t9houHKhrh5yYlomMJ82s0OPf8Qs9cBaMKCgSX4Re7L
 aixV0obsdeAHkwc/P000zFiutdPAEAqcoui1rbGC1vCi2L2agER4a50x6skc3jK4pBODDrcge+W
 g+Va2mfYae5DkHNFxbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112058-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14DDD65DBBB

On 6/8/26 7:53 PM, Mohammad Rafi Shaik wrote:
> This series adds support for execution environment (EE) aware register
> layouts in the Qualcomm SoundWire master controller driver.
> 
> On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
> status registers in EE-specific windows separated by a stride of 0x1000.
> Typically, the driver assumes EE1, but platforms like Shikra have the
> controller routed on EE0.

Do these EEs have any names associated with them, that would help
explain why the change is needed?

Konrad

