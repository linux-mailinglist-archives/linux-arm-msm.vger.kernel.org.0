Return-Path: <linux-arm-msm+bounces-114173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RyUhHmJoOmpZ8QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 745756B6857
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IRmCrkPf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bah3I6R3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06401303F8FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014E03D1CB5;
	Tue, 23 Jun 2026 10:58:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1C3D1CC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212307; cv=none; b=eqpTauJBx0TCleshqFtyjwnNAwyYKNWdTpKmTI5fewbdqwlST7XcXCWWByLQ/rb1rOFgmbs5qI5WBtH6POProAGtPA42Imk6sOUGL4iC0RF7WldDRSuQp4Wbl5qEQZxSVXbCkbcEFhu84G2o2rWfvVvyLhWFGAM8anJQOtwc/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212307; c=relaxed/simple;
	bh=amLcjP4+5IXCk9DVEQgPfnONzUo0qX1XpHsPM5V40BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfFdoLiavfjx/MykuuFp/YVn+pUPg9geRWrBkRKoYJmrUem+DjfVRpRvSGxbmgwONtc7f8wyW65huUso6943JU4yeHuNap1QyqxO8UpTN++Xz7PmEDaZumLySyXdiENMrO7MQsjHy7UwAiMoU6u0PEsTFmFdoDMKjm7f8tvPJnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRmCrkPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bah3I6R3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsO59023187
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1X4/DuzK+AlCeZbzzEPJMU78DME3gKpvtR8mpqHOY4=; b=IRmCrkPfZ4ErfH2g
	dAwDPE0rmH6oHcKFFPGRsKwWQYAx4HG8Eo9U3UHewR+ccF2T1mdzDShMB/GyXSjB
	yKVWX3YeQw/LyElMinJz4nNEG69neltS2vbiMxbnfNwd8LQPOiUwXSkibsKVtRFu
	n69jkqHch6XoeWg92HPGVZpQwvh1bptBRJLDSR/NyxFwGGORJdGf2Ftu982rSPXB
	G124LuRFqC6vQSFxCF/4+o904+WwQwhjux0+c14Ds3iSaGc0lJoZ4j4BXb1/PIlD
	FkdqzfuiHQrlCc3/pdjwRKHWe0/3ukp5JheXRPh03AH83MUJZxlT3RwUKJhQy8wg
	+BNDbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs52h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so2131941cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212305; x=1782817105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1X4/DuzK+AlCeZbzzEPJMU78DME3gKpvtR8mpqHOY4=;
        b=Bah3I6R3mhcimEzc0TDUHausJMN0hMZJ3ud2HE+oAgigEZeTAMeOuehVesHs9pqug2
         xA6cbG4zBdVdPCp269WilLNcOKmF49hn4qmdCbz7OqTigjX6AdTpzGYd/+k2AOhkrx2z
         aGD9H5jTZcL02wV3A7aKVkYVhinXLTBpezXPh2SbievZD1N8nMILQoW6+/+qp0nGz519
         HOFOftyI3BohhQcG9OMq3YDqZRaGRXTWs/VztYlNOwm2IdJqazGeAawpnk99dT5SDgsM
         f/Cm4fu+q7skI1dFofpmprD6me3yMwZ4APC6wqPdP1zNPwVF4fVFCOxhX9yY+aKo6s1h
         McBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212305; x=1782817105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1X4/DuzK+AlCeZbzzEPJMU78DME3gKpvtR8mpqHOY4=;
        b=mOCaHCpa+UYsJL08g2ZS7K2gHzQUB9jk+dIh2+9w8rX6HGsSAihjQyWFxm3SCypGJh
         pGoIe/OF+BdqBwRw2K3mov2ryr8DJOWud6n/BQ9n1D0TR8s4CRw/cVqUrhvPyRLyEKB1
         U6ca9QP78ehC4t1QYC5oNGRgPS2wlYlTlsYaYv4I4mEVM7MNndqNaH9tFSZd6Jw//V65
         Nf7qrZ8qwtDSjpNvroyvW4wnFNoyoY+w5bP9XI8prwQCwXhHdTD+azBGuXUsLbdJul3q
         lz5uRXLG+9zYP4nGYbnd2HCkktpWIQBmdXdx/gXiwAXD94ihtJy8IrV3zGJPcUJJNyhB
         RNqg==
X-Gm-Message-State: AOJu0YxAbnlbZdI6eab2Jq77JornWCvlbDwcWPjh0uMurrSfjaVG2lyg
	h4ogijEJwKslNc0OB3tXQMw0usNW/fJM6tss2c4+1lEwkXWD2/mw3l6lfSiHasX8puNmcWqyCku
	oRlVlLZqtGVcNrMmQ2YOtDmNmrFKZgxAfnJGJ0cT6oAzBYSCqIjm1AJslis+Wjslyg4+4lWFaoG
	VP
X-Gm-Gg: AfdE7cncrvdF3HlGqHaKeWhhuZx9LF2vGrG80+XSRVHCELQd2NpQVXSkZVHtaLkM3ak
	EJTr4bYNkc8DasvAJXruNQ6J3Bnc3CHXRFmcp3PBWHIQlohijO79xT3DT63novQU/PrUL7wp+wc
	SmiVkKybkvWLcNuXNdk9WMJ/aRKdH8ua/sAy5NKLfOHODh4Q5jdKYQ9Wn07Rtcn7B4Odkc1DDYO
	v88ywKm9erhCNlrA1lSIfsCNtiMsSecNuVrn5gH2/eWkVdxHBkwSfYEu5j9ookUitpi3VJCwxm1
	U1Oytb9OybPtxCq1KEMzK7q8IrkigITQfLsAxPKRHtvbLJfgTVJdrZX1t0Er1u9rHbmlo5N09tN
	jLCVwxGsxCpTuwbbumJI5Kq3j433s+W5pl+g=
X-Received: by 2002:a05:620a:2685:b0:8ee:e440:fae2 with SMTP id af79cd13be357-921863c7c7fmr1482520585a.5.1782212305014;
        Tue, 23 Jun 2026 03:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:8ee:e440:fae2 with SMTP id af79cd13be357-921863c7c7fmr1482517885a.5.1782212304514;
        Tue, 23 Jun 2026 03:58:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e526asm492548866b.51.2026.06.23.03.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:58:23 -0700 (PDT)
Message-ID: <2607f26c-b71a-410c-94d2-3e35b9410fab@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:58:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: qcom-ebi2: use managed resources for clocks and
 children
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a66d1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nGGw0UDyj4bU4VJ-sNEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX4zOcrQHEFis4
 hgEUZ3QjS7po1p5RBaLL5lKM0WkDpbQoVAlmZMmVIb+a+BKHq7qBQDOcfQqa/fA8rrpNTpbt9nI
 c+2iDY+qFANZoNmOR1e/nU0HWlZM5xY=
X-Proofpoint-ORIG-GUID: heVyYlbhNp0s-eXxVC0CdXKQ5157-hbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5YuX7bH0lqrQ
 NH92fBjKXHwu7DrB3OCrYkZeHGJOKKz9Akjega1ME9sd9j7s7hmM3IRK2vpws4k85+0vave4RE0
 PCnHf3wKYuPfe68AAafilS8v8Semyj1cdZtJ4n9ct6KerUbs8mW/EpUnZhCcAswB1YhOscFeCcK
 hoPLeQydzlERx6NVRFGr7vD9/O8FZBvI3LNWKKLz/XId9PZTNOgcL5r9v6A5fUw+ZIGFAcOctGU
 19JTboy6I/EW3bRTeUFHGwjvN2HSmRIOpjj027aQgjLTHDfxfuhCLtZs2P42NuohDIta6ANozt/
 wKMKXz/RWVMQafebluAd4Wh/L+yKSC1AL5Bv6iiC2+rKqU4Uh922fQT7j/btX67EY2x4EMNdsFE
 VnfTxv18LLZujxeB1/roolHUkmFSyymZPMssm1t26lgP5VKh7jAgKKOY2ryFctgfaUfvioh1Gah
 +M4NZqy58ptp9VCSvoQ==
X-Proofpoint-GUID: heVyYlbhNp0s-eXxVC0CdXKQ5157-hbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114173-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 745756B6857

On 6/23/26 3:54 AM, Pengpeng Hou wrote:
> qcom_ebi2_probe() enables the EBI2 clocks manually and populates child
> devices manually. Several later failure paths can then return without
> disabling the clocks or without relying on the driver core to undo child
> population.
> 
> Use devm_clk_get_enabled() for both clocks and
> devm_of_platform_populate() for children. This lets the driver core
> unwind the resources automatically and removes the hand-written error
> labels.
> 
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

