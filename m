Return-Path: <linux-arm-msm+bounces-116687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3ykLQtnS2pVQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:27:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464470E165
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ncLmB1eW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bh2Awuru;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB1F302C365
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A0030E858;
	Mon,  6 Jul 2026 08:26:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25B3D45EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:26:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326400; cv=none; b=hd2caZNcN9c422AHZW+xhh3JkIWhRZlraF0d5zV+DDpTum00tKUYaZ2a4V7rreFtQQ2Nd0NELfx0DDwBF9+qoYVXt7R7w6C9+J5SUDzl1kd/aMPHfTt5ORSABm+VsvY/nKV40CpxXY8+PN8m+sJrdBdDVep+kipEzb9+avLTFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326400; c=relaxed/simple;
	bh=wtxOs2/90WBlsb3nPPFqZvt6qpQNNMJifVvIpUU180Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ByQHbEi+kisj0A2Kuk/+iEfgarRF8kTIrViOoAQ0cElOsXwFSEFle+6/itRRdDWgvN5eyMssG8pynl4GqdMxzFx+auWNfJIETBxJ+koo10qbVKq/ePYUWBZbhwiEBCyZh/Swq/0NZmW3bUBUJbtbeokgq76rKtx90TgFhifIHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncLmB1eW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh2Awuru; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641kbS3624654
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=; b=ncLmB1eWjxzrbOW4
	EY3qmkcx8P9E44U9NAzp8bAHsi7IFYT/q82bfGo8DH41zSi9B0c3pYYMuGEQwnBM
	iNqxwEz3huNNWqvWmrhHlXDTCjK6LXPlTowhtNJRPv9gOtLAvrAz3ZDWM/cFG3Mh
	uaDNXfux4asLFjUdIg4wy/i1c8xSgEd5lmcOKjRslqiSNsKNWGhXc/M9CI7PPbyO
	DZOKut7XqVeTiqxLQVnyxw/Eh2tlQKhMbGk4HKQtCtpuONP4Vezgka0zVoEqmAvQ
	ItccTuzklTmZU6JqHtqPIkUsOJzYGaroq1knJkeV+nwbxnHO7AF2dldpo1dPycN0
	oSQZBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swdh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:26:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c267931ebso19090491cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326386; x=1783931186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=;
        b=Bh2Awuru4nrieCA3yNniiXSWYDrbn/hx+2Eude72Us+tR0JhaRbb94kLmO/DWvAoAt
         lr9j7ovgjs8VfF2ztMIIprp2VLgY1ucOk+l53ry678BNIBwAUM2XX5XbHXSnyVYlcQrG
         LtmQLzqUV/56cP0Wx5DJPzWBfa5751t/mtPC36sJJuHWnRuVxf+H+bFpl0iCYmLhVT+e
         oby/c/CnUAvb3A7wrYcY8dbawN1A0p7lSrvun65izqt3T1IblnTVMIyF+eeoQkRnNxKt
         8p4FExSHcTap0rSoW8tBgPdeNndAqXU6o8hJsSTsWa5cudnLVYkbcMN3r1CHjgRw/3A0
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326386; x=1783931186;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=;
        b=Y/+XuuAeqEwLpqB4svbjCkxiqtCevMSHEIkXj5VQGgQgYf9G65odwpXU/F/2e8+3Ms
         wbrdEtx+IZO2SWL5jhOnmnzR1cTsRtJTgW3Tu4CmjSUXw/R4jrhU5nqSztJadklF2eGb
         AtCkZJOq+4iCQ/izvWQg1ZwM/k86OV10AfneZ4AdGiwIPf53hg4iBkLN6Y/xVOfNBXYx
         nn9RLLnimn8yGqO4XPX8YiKYkiXc0mFWpRtXk4xTyiUYw16JbE/yCUXcCqDrnuU8hIxp
         J0BR7glNnZCM4l6V/wyokAoGOID2YMsWlKs57ziSuqezixggitVh1CJBqLaHkPtkAGLE
         Vqow==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Y86yoXLIiq2xIy1GjdlVYo2rzUIP4Vh/pLmPJP09k8dYaMRtaZZTMUnqRPOVL0lOmDgc9cBsYhNCKXJU@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhTpDbKCZHdz/eieJtTbSOQGXTZFEHM54RSOEqHNjqRHoFrWL
	QZlJ8udBblk3Zf1HFW4VevObBBjkCqikFArbOr0gYRaDydkzZAj6+9pu9fBNzbEmKu9zf/Rn7Z3
	rxIcUCWafkYci1iE++8O2xCefRqSkLXCQp7z6mt8gfeMZwmy3Jr1Xw9ctJuaoiqBEtmQ4
X-Gm-Gg: AfdE7cku4whc5XcVSTHX5YAj63YPkNuOax5YXtgH67O96dhjn90TrhFJpPKnfrioww6
	7u4aiJXSpNjAuEFPGHmuZ3tFtENVy07t1ZE1p++NQZP3CcsUyhFZrxLu1aj5x1GOL+9imgN2Eyo
	/8S03qePkNrcgdK5/JBAVG/MJrXHZn2ESkFb8aEO05QcFpFDFdb4Nj2X57t3PNCdbmC9NJsVCHj
	A6lCy9ZX9/Hx9D/2hTBNuyZNpewsguPpApRJs92J+qb544tQnUiP/Xf7ceer/X6oK5sj+JtmReD
	5u+TxmxAjklyunC8ld5s7Sj0KSw58U2a9lWn5PacBPIEn4rgqLqPLfXqTbYiEYlBRqIh4Qw8sZb
	EoqYzdIka6syrIyapWCALZjNqiuO3vOJlpRA=
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr47485461cf.6.1783326385070;
        Mon, 06 Jul 2026 01:26:25 -0700 (PDT)
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr47485291cf.6.1783326384685;
        Mon, 06 Jul 2026 01:26:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm3532949a12.20.2026.07.06.01.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:23 -0700 (PDT)
Message-ID: <e8e132b2-61c2-4e2a-b422-48230e6dde67@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXzfNxyVdZnwI0
 tAUUL2CcV4HyZ/mFYRRk/jzxZej+LZPDkd80TyVSYfVaNeCKm60IsnTM2P7xke1ZinPaHbMoIDv
 KFUAd7L1FtCCYpU7s/m98+jI+Xw7S3E=
X-Proofpoint-ORIG-GUID: xc2ZspWnuJwAQI_0m09GE4eTYErD9IDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX/210g+dFc8de
 8b83gBHi4qT7MU8vEkzL801+FDT4ah9A82ctH+n+BqJi4BlHzWVzB0djF6ffbGZf3l+4kkEQrxz
 T/72qa3XoU0Efjb4I++N6K46W3U7SxyfgCj5QvZOFMO6yXKe9oCLwsT/d1jbcS5QCDz0ftnS8IO
 9ad2EjMzyonRCC7PAw9z8Sm3j5CzaLM/n72mTcT6Dh77mXvlGyHByp8ThsDxOS0H03TxbgBgMvS
 Pv+f/6gpOc59Ld/8p7oojhA47hqxcDpBumYXb/5aV3L9nZx9Z87YJK/eEHj5NhY0766G8UguHFM
 YYnlYLWzhzbDno3q27mu8dzL2E4+QNZiESWDDnsN408xlPHw+EOY/ipPLwGhvQm8l3SdKgS6S0V
 ReXO+jUa+QW7caBjUPlVPGJMC6b1EfSJV13KkL41E9+Mb4yGbZJP7t3KdN12J1BZjsFQ9gWxw74
 zKKV4QrRtDemGQjk9JA==
X-Proofpoint-GUID: xc2ZspWnuJwAQI_0m09GE4eTYErD9IDL
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b66b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7LSsG2loEpG2YXDPbGQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2464470E165

On 7/5/26 7:18 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_desc', 'struct qcom_cc_driver_data' and
> array 'xxx_critical_cbcrs' are already treated by common.c code as
> pointers to const, so constify few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

