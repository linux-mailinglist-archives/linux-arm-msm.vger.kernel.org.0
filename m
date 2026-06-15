Return-Path: <linux-arm-msm+bounces-113163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id emfpKF7qL2rnIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:04:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E6685F43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:04:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FvwuNxDQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZH/N/Msz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B88E302F6A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82053E5591;
	Mon, 15 Jun 2026 11:59:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAD3E51CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:59:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524769; cv=none; b=VaIg/jzShXN+ktPGTw6rQZAV+MHgTpXQihxfSzBs41eKrvc5SiQlkok+SUdGSYS/ub0bp+Rg3CWVavrAADxaSD0ZqePk2w8yZP6iCdFFhY7WBKWNKYj/cQOpVdWepTIgGD218cZKcR/SN6mTIffZ3WSf9CYVn51SFM5jUfrAGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524769; c=relaxed/simple;
	bh=Jaur1anUyFC5YEwTebIn9db5FPsqtG5c7xQKymJS9nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4RxQKlcC8Zjq9m81HSPwWMJr0kcO38Ztck/47HDm4Iz+IKnX6p18Jj0sIotFDJy1RLD88Bz5qcfvGkG71fj1SY85zR+pn4uv6c/FrKoTjbHOY/Jlr9h2/9eek6orlo7p2HLnHt4MoxNntJgO0Vf3Y9/wOd8byPShfbSRzlhy1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvwuNxDQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZH/N/Msz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoPHQ3885683
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7iB1jJLBtxWEKXB1aVBNfAnM0MC9jpTeGVfAmSV1lb4=; b=FvwuNxDQubuP/Np1
	Jie2vjffHQMNuo0sa6wtYHc2ov54FEWZW9YuxLViwzUNJGTQpZH6qPDi2iWH+Qmn
	wJ4vUICByuz1iv5UwlJFFqsWqEs8PC4tRbine7+RqeJUp2m35wFR7rtF8c4eRXid
	aD1M+uN+LWjCPbcJb5iAHgtMA7hTAKTEMMqyd8Cbafzxylj4UXbilsFMyk8XEMDp
	e9y0ayPaMwcM1JCfRhICakLCo7XUgeC/I2hWsxowf+nYxBcXp7+oUahavLq9jdxU
	ELahcxPTVm/MQDcMBsGCm7wx8sxIeswVhRjIcnILtJfSpfCzwlA3+95f3N+7Ixoq
	AkH7rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrhae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:59:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176ff55dc2so6523141cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524766; x=1782129566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iB1jJLBtxWEKXB1aVBNfAnM0MC9jpTeGVfAmSV1lb4=;
        b=ZH/N/MszIQaNaBSg4400Pb/zlP2ce0IgVUEnKNBOLTeMlhFFlmKFMJbtPYqdyCmMv7
         pHA5iUdJ5slvoy4JyvBUSTZ0YrQjAvCxP4gmQ1UQcxd35uMm2BZz14SuCBSEX8rAyyK1
         Zt+sJINy4RRiDcLcD0b5hLWIu7odNtkNxweNqHvo5BCNba21jKi9D9VbPx2ULl8N0M1I
         LLf+kdH54g1htMCnyjwHBCS2hZl9M1DgazwOU+o/u+9jR8/CEOlIcJjzvHTFAGHFlkj2
         06Z6NGx2BEWrCtuA0MfbXkoFS5r1ez4/Txf9Zw21kTbjacZPscEqqwTQ3oyPkXCDuCxg
         egLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524766; x=1782129566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iB1jJLBtxWEKXB1aVBNfAnM0MC9jpTeGVfAmSV1lb4=;
        b=qWWBi5vmK8GBl0ob6ks8AfFezkl05ibjLvZhuvvvD9OiY2HNt0H6lFhzrPigiUGJ0P
         zzvXHF5IUrgfllyNFxQXeyGULIWL9S220bIqMc0aBE9nYSFNpG1SthP1AS2s+UyYQcUm
         83fh/pq6fT10RIdnYQWha7hcdLNolKhjgJwwmeIC4QSa9vHHhmu7uzrj4HGLWZHQubx1
         zyLRidXjsfjgrGiHd6sxUQyimCDDP9txU+kX3mVeXJEuEXCJVrdnq/pYHcwry2j5uEsi
         YW/wQFlESWhQ8fCuuYaMFtp4p9uw7ChFBkUedaBEBykHKyWENrivEFGggZM2lUO0+RQ6
         b0GA==
X-Gm-Message-State: AOJu0Yx4ZAitapmz8ZnAiIU8zYrz9oDboqYBKQ/bAfHRVv/XyHuePBJY
	7NHHZFSziqF/StFLMpZ+v2G6z+k3nUR710iop9rBZxvBo3UlG2um0wPwmMNl2qn9eow//MkmlAr
	WiIE9B2Gc4+if9VdTA31RNgcKScOAtamgZhLLg6oH3jZLYj7Rvm9DkIB9ka2nqziRtTEb
X-Gm-Gg: Acq92OFRxAwSj+mw5BQVGtaWNxHi4XCeb7xBH/sAwubroMU51kzZW78zQSeWzeHKYAB
	m+ztE7V14ucWZOdWoJTqqMREH5DzCOnGAHYjzbl8s3Wp7jkIKwpOyPjjnlcYhp7Xv2WVNjpIo5q
	tufr0MRiGqK91ayVad5ZeshG4QvaCRzj7MEc1QIlgcBQr6yy1a0vCbjwpYjky4yzL4MvY1CM/c+
	dN+yrFRJbp3AZQNw4PexjDSgOar+xZacHUxNNBwZ9E/eQgcFvxeLYqzkCyI+Fc9xA7Q1GUIodKT
	FUFp3zuWRGUJMK7Ob8ubmLaS5sbUIGKLLfR9Vm1q1xK3UMa4FEqjml0ciyvKkyZnLTmCUQZY6s8
	tj0MxRTCSVnqZ5fwFAxCi0HK3Dcnau3VxIiyC+A6UXGDc8Q==
X-Received: by 2002:a05:622a:4c1a:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517fe4648b6mr135225211cf.7.1781524765720;
        Mon, 15 Jun 2026 04:59:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4c1a:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517fe4648b6mr135224991cf.7.1781524765234;
        Mon, 15 Jun 2026 04:59:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9013575sm462358666b.59.2026.06.15.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:59:24 -0700 (PDT)
Message-ID: <bd0a70b5-7634-42d4-b975-00cc8de41a9f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX1KN8Ql9EEZSH
 GdxSUKw/LF5NeBIAydTAULYgDtlOjKZOD3uPWzWtO04/AGNlOX7nD3GlYrLrDKIZPkQhwR9pYMF
 d56fIcygPrj3AvkkJcbKITBlgi2mZ2W716BYcTzJgMSDHQT9/1DKROc95skYh5bKkYzQDk68xmq
 g/iMx/wsih2z/7Zbmz3rP1xyZFWblhjGZ6BI1ym0iSmmHeyR8kQo3eTShM/+LL35muR1+Vm8NIh
 uvrmVvxWfBTlKdttGeptKZvksuQPWwWFHpmMIndkXUuIgl5L64QFG1x4gTd04sTW1jj+7vG5We3
 MVb1F9hqsXJI6f0D1NAcsy7NysGikxhGudFxACfYFFMft7KmgkROj84mTxCrtNnN/gdOPtepdoz
 ITuEdDuVnpiItvSrcHLQSbuhWzaloHs7T4A8kHmGadNFXFG2Zo/4Zg9EojYD2mEJJnVbIjA/Yng
 A0XfzgeX8X3Dcu0PbVg==
X-Proofpoint-ORIG-GUID: J78dT3-vj-flbI3xAiAh245Kvof3t43t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX5gziy1L8jy7y
 t6mk7Ul/IS1RH03LgDspq3U6yASB7lV6lhPDOB++Ic7HVUb5dD9Jb7QHfSYk7uqQ0djGtA3rzTV
 phkngmQQJTpAN0vmk8eNpW8rNAlIU+8=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fe91e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=x3p5lZk9KCstnKPZdtsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: J78dT3-vj-flbI3xAiAh245Kvof3t43t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113163-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 505E6685F43

On 6/15/26 10:54 AM, Sneh Mankad wrote:
> Add SMEM items for SoC Control Processor and Display Co-Processor
> subsystem stats which are present in Hawi SoC.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

