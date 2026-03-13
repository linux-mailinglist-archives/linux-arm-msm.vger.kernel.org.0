Return-Path: <linux-arm-msm+bounces-97393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGxOAv3es2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:55:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A120D280ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE10C3038FDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5382538B7CB;
	Fri, 13 Mar 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl9yq48A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8q57S0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1E38AC82
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395696; cv=none; b=Hpvepc6wSErQh748rXriGhpJ0Qg/pmBahwdfI2NXw3EgCVBwm0I1aoxMCpS+Bw97vrG6CHG/iPB0EDieXPpGRfX7pQr8bsZ5iXzcHrgwhR+8xjQzei97rf4WMVxxQ40C0hmA0YKkyDuTAjVInXYuY/YrrPEeyiKzrS3zsvRSCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395696; c=relaxed/simple;
	bh=mGmG9qdEc9o3klhZUDFbuxd/q9OVbkGaCoHFJaPrwj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkD5//2177VCLB1xQuY/jyiNd7h2RC3QrcbdFKW7j0MUWXDGfJsabXwomNmj17cSCqbtXa6G2rvvW1rWvX9V7RCuUzzIEn7XXxt42ZvNOPkTx71oGqxgRkxBAvI2mlQ825dCzyHnRsxwMetLW/A1AYbiY47ci7mVoNnBvvLBsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fl9yq48A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8q57S0G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oMH0792874
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=; b=fl9yq48AWYq4Koxp
	NdmjP0DkAHll/iqQ4ohCJdEmA4aaCEapkQJomwpW843BVQkUcilSwXBNLnsJBWtS
	jeLXR+vwBwfKm226XUmuXqPJB4Qgv+buGJ8U9wLWdp6XQ1s1Cgek/cauwb2WVpWd
	VWeu/RlHsJm9+RxWgek0HLhZir/pIhi+SJ2Ps27kniJ5F04zA3FlFuQsc/Z83cG4
	2ZIPZ2qsFi2ArTkYsBrHA6doReUw536JlU3rkJ/z8JwCqRz1bvNKlt41kW1oj+Ci
	jFVAOjoe1NaEQ37HuQGvuDZiov/uuin7jaQxZw29+OL2ozIVIqxwDEXBeNdxmOaG
	li5aLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0p8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so107799485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773395692; x=1774000492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=;
        b=C8q57S0GSE3EVYRiZC8RUPifhnzZCwcVqYlD+jqElpvsGAucUIPSltZvjdAbEh3U+9
         shiiGCoVrVTdRNmYibwwt5HjLxzJWsvbZfZNZ4vm3/ypvxCG8BKOfR4P64DYQrmffkpR
         PxOFDMM+Nzyq/xB6eFJdy7o/7uGQL9P2BekdzeJMhNBlYogFyOiHDAkgscgeKBaDBqA+
         6Xu3L4DoZFrRCFtALVuf0K9LlVhzl4JlFsYPKPeo2SWfFJn31EP/EFLZ9agF4X21Pvx8
         nwKcQU4ScYzBkzRvy2r8y984/7Re8k0vw1aWxirxjLz6Vy2+tbKtt97IlMCxX0tYm5QX
         CNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395692; x=1774000492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=;
        b=n7vaxsWaPzz4WrWqbQsUjox0wTLYgt6ypYjCaeqH3YPox4mm0vhQlmrX/mDJtJyokD
         wQZ+uwO0mItP/sWssIHXvZbEhbpFUeriodU+b91b/fzRRRt8lELdsnFnhZZiZES4RY/C
         d0r86vlcVIdSmvyur1eiWmkdgndo9yqjlRkHqx9GLQ3V2zCK77n4VTnOcbg3u6gSSHQX
         abIpVZvuDBhWKqZQKXpQMKJMwzUgKJIR7Sn+nOI6lPmw2Tp3sUtDeF79Y8674AjI44sx
         vv5T3V6IUYpw26myB8eiXTxnf3h0YIQxA4TnDx2Xw15C9FNXIutTsUqItpoxcn8qlRpr
         Akkw==
X-Gm-Message-State: AOJu0YwNwRa4hKg2ognwwoETdtCkfZ9xbRNZUqaasP+OGXHiX3iSkKEq
	eHBIcfH3OKxC8+/a8EoO3cENeMnDB/Wfbxe+Ad+kkMkHmgkj3+331BXZ1VDr0xPV6DV1ArfNA1I
	AejrsdFQ370wPEgFknhA1V0kZwfv7LdcFvDechSlwTQuRjBn/yo3Nu315tUyyO0OV08V4
X-Gm-Gg: ATEYQzwTMuplvtC49nq7BvuceeeqqP0q6Gh8R/MwSfXv5gx3kAudGVURdcglFxpRJF5
	2ZL4n34k7sCT/ynGjaUFtT1mKUyGUq779Pw9qH750ggPH/HNSION2/bFZ/6Z+zFNLqQPQQh/Aaa
	T/wKjcdQwpIAej0rYAzuMEtpWNGnrdD5q589cH57LGK46naboPH+sema4AHmnsUS4a1SoDejD6V
	hRRRPGrJGycYeUzezvSl1j6x9cTj2VEZTZ2Tet/rNi78jyns0fUkvw5u170gD5g59aHIp7trj1L
	x4gijz6QEOTdn2oWgtS/QBszvfMfioy609Q6qxNO61g05B1bZahRJ3SwOvZBM3kNVOg9F2jK4qh
	RaCkcezxse62APOwi0v662CPR5tdGGs+gU84G9w1FLnBlhK3ssQGMP8j06HCjEeL671H7jKDEMA
	M9pV8=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr295750785a.8.1773395692189;
        Fri, 13 Mar 2026 02:54:52 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr295749785a.8.1773395691805;
        Fri, 13 Mar 2026 02:54:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb1eaesm34377966b.32.2026.03.13.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:54:50 -0700 (PDT)
Message-ID: <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 10:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_slim_ngd_ctrl_probe: blocked on a mutex
To: Tj <tj.iam.tj@proton.me>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3deed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZJUiX155COc2pYIC8DAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: frKgQALm3zNtB4oGmiLmngBlqNfUQmjt
X-Proofpoint-ORIG-GUID: frKgQALm3zNtB4oGmiLmngBlqNfUQmjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX86V4q5zADHvW
 Xl0ZsiH319LYSqhYV59tl1xf10VbhBsKnyB3up8EBlwFvhPTqe4FeOY0qRpz85sukDdOEtULe4q
 C0pqKNYFnv4nHu3+WSN0BShnt5w7dEguTErbaykT9TP8MBsdOdtsRFSWIOJcUCikz99zE8/+/Nw
 MWDzl8GQnRsheSafIJkZHKJmhgZ2iTgKbUt8ncSZjQelA4YBsh6Q1JuQSHKrRlb0zTJU90ZnoaG
 Sm8Q7JjFP696bn6FEqKDUn3xeBz+j0dJ8H5+K4eSycAwEZLjhUl/w2xQZfhkeoFv/yBpNjBSrjg
 0gcAkqk9TyE923G2vCX6OVGNn8elxV4P2DtUnfWeHBzB+Hopth3BaNJjfDscUhJ+G1BQglV0miF
 bnG5CIrbiDiAx+CK6ei0l4g/0E6zvY95dLoYchJcXEI4vfTAYGqMrfSq9xu6uXNZcrY8Ki9oa+m
 VBxJp9kbUjSvqWzAexA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97393-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A120D280ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 1:14 AM, Tj wrote:
> Currently working on sdm850 device (Samsung Galaxy Book2 W737) and 
> seeing kernel hang early and never recover when probing qcom-ngd-ctrl 
> platform driver.  Only able to capture a photo of the stack traces as a 
> result; I'll try to transcribe the important parts here. My diagnosis 
> suggests that the module is calling __platform_driver_register() twice 
> and may be the cause of the hang.

https://lore.kernel.org/all/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com/

should be able to help with some of that

Konrad

