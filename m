Return-Path: <linux-arm-msm+bounces-115335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PYlcDNeKQ2p2awoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:22:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18D6E2167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBm8GQ9H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bhGmfs2y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16BE031422F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09493E168F;
	Tue, 30 Jun 2026 09:13:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140B3E6389
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810837; cv=none; b=eI5FfPTb2j/dgz1lAl0oKxE9VpkVTj7yVWydm8Sv7UWj62EyCfy2sbmarxMd8fM8gbzsmzYj8h2FDn5S1ttbAjt0+zmtN24RO+dn4GWzIUvRvBUrwFjdYAS9+phwQi15hPP+QinnXwvc7Hv93net2QGIkWwsKsHoW07ZnOfYHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810837; c=relaxed/simple;
	bh=d+mLD1x2hxZDlUEdb98SKIREx2londngUqrUjv7sJ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft8MvQxp5OmXZZ1TLWhBhgdeSw7k9Y0uxiuRI6LNCl4alGYvXTgN6bEHIQdRKE6xnjGdoUOnA6U1OIDqRtJvDvSaFWIZBjIzwt/ANGp6HQkcwMfM7qY3rqUno8IpoHwCijkHd5QHs9erBMAbP/9zE3+4GRygMYjUTnjEKVXV5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBm8GQ9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhGmfs2y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CPRL1097887
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=; b=kBm8GQ9HH3km03Ef
	HsaOF6dZw3mgIp6zp0NSEyXrNfz1S87nnA32TqLfDZqW+5ZKMRORKhZY6bAPdMHN
	yU5FVOcNo7tqZqgb8Ag5h+tyAnNuZD0WOveSrNGHuyfyE49fJch6R3Qan2W/aqlm
	eOABFZ+m+X6X6jOZSaHdrrQMTcN7f7oNdJh8tmKokkzSk0Xmov0GhN49LSQXZ6GX
	BDEyJLF4ZmVyyZC5U0833HcI4JT7Zfpjj/jXdyt05hJ0FBQWpuceOl9BZ8rGQWIN
	S2rvFmAwPplMkbyKYyzszkN8cMRbD8CzkLtnnUBrNf3l7FaYIvKs7VpDzdtZR8A9
	jmO+pQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ctyqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66fe6152so9807085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810834; x=1783415634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=bhGmfs2yhjBJnuKH0gG5VowlxhLcvKrpNR6sVsbeFHbJZokrzXXFEZ8HdzHoEhdYoj
         ZxcgPR53ro6iqIMI6+BLjD2njN0gGgfBwnHeOku2N+bpKgMrqRb8r8snUiBVYls0Fon4
         /ZKxN2j50YzkTL4UH+KCHVfpZx9YzzcyBzDRvz0P5y+n6K4QkJyMcsKgaqjxACWHWlU7
         k91cbH4IPNDEKnWR6P87YJMCQA6BOJOowdtZLV6MtkngGBayULkLDeU5qgwcqY/P0eO8
         DC5Ca4gfVnlVT0yqo/JlfiQgowrzbb/jZ0oBkMxCuVzqV6i1Xpp7k1Y8Ip9VHNCJrcz3
         rPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810834; x=1783415634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=qIhtD3qIl6sJZuBGKoXKr7bd/LN6/srb+d/qNRgDstcVhRh/+KXueE7lZ/MO8eHWSS
         +D1PxgYwAunT9tC5doKHXAo0oTsxv2ci6sShnY1wA3jyK/g52oc6nK3gXxNdf6iX22ZZ
         hnv/qjoDcE7LQt31i/N4wZsPgNdkg/Z2V3rJ8AB9MlbBMkTgYSGzNq7MMVfFh+gM1aaL
         eOphrkXX33TRB++A9kJrYekKSfMEh3PkKtNprT0KKk+kAzfya+r2/PnfjCewRyZa0fIs
         Rc2qDcAH05eeGVmZi5FHdJkEwoP4Ya7NCBZtxTXzYwVzJ42jQ3Q4h+bvknGJp0UWsZkK
         N2gg==
X-Forwarded-Encrypted: i=1; AFNElJ9rKCu0aBMlpp7Zt3br+dq+Xabdlh9Lr82fXxDz0lnQiXu9ikmAApSwub/YQAL4T52WpTF1ydufzHrQ9cJh@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtz/VUfpPWc1S7aPvWLcvEq9VPyJJo3ACma7Gku6Wui5q3mM6
	c9ggfhv6BTXp0trX9n2dOcDYqQl5VoO2GeKfucAH9+Rub3PKyCTDu4QPuR0ItNaCogZVlRP5gP9
	xwLD0D1H0NU9279MCFPFNmS9VEH0TWGqZ77gVxmfuXE9YnxEDlZFW1Urbv7gwngXeq+9m
X-Gm-Gg: AfdE7cmkABkrplSc4ouy13ue9HH20RpWxlUwaYlBc+JzIViI5QMKSRaDUEh7iy5dqna
	1dQianc7iLZQZlpF6g7r+8zyNuszB189vohOIQozFuzC6OSSltb7kg0cDre2ESGsB0u3MuqoZ+x
	PIiGpV7mggpbAZrDTHLgfIuqlY8RtOQ6zUDk9S1FrKTunjO6PsMIjkeEHokMrpsTl9Y+bYnhEc5
	0CNWQcY4SgPRv0VDGnJ4W7aU3ZCtn7goFi4cmRGkNJw///uXbuVkZZ3lKJAIoGiUW0cp1imqeJj
	5KXXxvqpEYku2SajUu/6yupvzJ0OBZHccKqNp6gUOJsuy60eDZWs3AIpkQnAPK84X/zyu6JsTI8
	kjGKy0O8AvY+oUxqM5gbThOhXLuAeCMZY/ws=
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284173385a.0.1782810834557;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284170685a.0.1782810834107;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d16b06sm91084266b.8.2026.06.30.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:13:53 -0700 (PDT)
Message-ID: <62ce45b8-5ffc-47e5-8424-f1472a2fddb3@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:13:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX6IxRwsQixsh6
 B/HGVFgku7ZQdfXRZBnUu78rjzXP9ccW0XC5A7f51sWbrUKiifaW7y5KnRMzejuYqPeFDuknyte
 uy+YrDRk3PDL/ShduuBCY6rvQk4cKV8mmAqbMYFegFf35wD0JVJG8DKZIO/yIsZ9tjX5gDsg/Sd
 vDsP0BJMxeGwf4W8irEHU0za+pDgtA34X8FmLQdb1AqYOLw68tDkGiyIuLTnKksZt54vKHTC8rY
 9H2X103FH/00Yt28LT+8rowy0ikRarzC97Zh8KL447yQFHcO2ckDqVscmvg7K6v3YwPQI/IXYRI
 VVrOQFEMC8wXlpnWoin6M3bVQnONZ6aPmyIX/d+85Jncg9AkRJanYKU0gpFNjuB2zsD9QFgBfDH
 MYdwBMfh5pvvH71JUjw5bmtwHO2p08hxTobLRbfXZifJuQLGGidh2smAqrxLpmDLCQZkdkDVGQm
 JuasH4t6P2F42V073hg==
X-Proofpoint-ORIG-GUID: ijJv8hOBcUEnrRgLQfICfReC6ykk8LTk
X-Proofpoint-GUID: ijJv8hOBcUEnrRgLQfICfReC6ykk8LTk
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a4388d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S8WVJQRO9DNrYap-pUMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX8X/pU/atc4TI
 Wc7tN8jpq6DciWzd4jSPE0njAt7BLJtgIWptSQU4rO7AC0OPhl4xeeX9XTxWPk5mSbQwLtlGFZ7
 CdJU7Q6oigDESnD/yUSJcRsPeBqNado=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115335-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C18D6E2167

On 6/29/26 2:17 PM, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> media: qcom: jpeg: restore JPEG_ENCODE_H1V1 for CAPTURE format lookup
> 
> V4L2_PIX_FMT_JPEG must remain in jpeg_encode_fmt[] with JPEG_ENCODE_H1V1
> so that jpeg_get_encode_fmt() and jpeg_get_memory_fmt() resolve correctly
> for the Write Engine (CAPTURE queue) path.
> 
> The corresponding jpeg_mcu_blocks[H1V1] entry is also restored.
> 
> V4L2_PIX_FMT_JPEG is not present in jpeg_src_formats[] so it cannot be
> set as a SOURCE format by userspace.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> fixup! media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

I recommend "git config --global rebase.autoSquash true"

Konrad

