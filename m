Return-Path: <linux-arm-msm+bounces-93264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ah6Ob6elWk4SwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:13:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1F155D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4A423003713
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833313093AE;
	Wed, 18 Feb 2026 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsTn2jWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWwKyspc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE29308F26
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413176; cv=none; b=iy2HO0Y8Y+res27aXXXVyjgDTp32IPgOdEYUvTFYLeaOuECreJKmMGjJybTbEWVomDqpdjwkDNcPh8mxypX2TuRiSYWes7+CpDweDm2lyjelQooviKXFYN3HQfNZR5/ZDwWiHcxmhkUlzQhW6sj2/JWvfXM0Z+G8oDSLS+dNIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413176; c=relaxed/simple;
	bh=4YT5brYB0UAoqFBI858XsuI2Vt7FEqOK1Z3AeX/HKPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhI/193nNF4yMCljnNJbaIdT+aZ+3ZBFsBVdOP/A2Yv9q87OLDb9NlEvOZkgP7ipt2pCALkPYJrr1DCscBqkCHL2sO53EjQ+PHOPPO9EN7UyRP0Drf0dDiQQY0VdacZokZOAORmCJWf6vyxQGso2SaXEC0iDSf5XPa+4jKN1c64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsTn2jWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWwKyspc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9B2Ps3695372
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+3N+xY8cLZlUDcYTClcCN8YabWFK8vIUfB/T72lyAg=; b=QsTn2jWwMsn8ZyTF
	ljiDjuAMO9FNP0d50XQlr9r1OQSTyYBQeUs3e9CpAOiu6bFwHr6IfytbzZvpvHzy
	M1L0YRbZCSKZt7gk1HI0KPVbJaCpBjaeopJyVc8EZ8SoyUqeUSwTH40qahFbCkcj
	pnwX80Aq21qBxZNaanHIdrNC2AMJMdgqgsNfgZpnnVx1+MLzAacm35KlEfhY+Hqg
	BCZLChRJ9nYSC0sOvC24kcpO9vqwPNYob5IjWZsDmqU9qYwf8Mau1NLU4drARnCk
	5FsIaEofKANu1c2B1V7X9JFH66mq/Y7M/YpKQM4N/JnNVrTEG2LUMN0F/4IIM76y
	bHIVlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb227c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:12:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso36986396d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771413174; x=1772017974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+3N+xY8cLZlUDcYTClcCN8YabWFK8vIUfB/T72lyAg=;
        b=QWwKyspclRhUVaHQsPlpNrwKmVUxdmhAdwt8QnyOhYDwMgk+DlsSIR8ClgvOA+Iod6
         /5T80CqbPGJHhfbV3rb9fQ3IGddZbIPh+8BSJdwr7z1unTXXoK9pEgo5j64crX5ZEuAD
         JrzuIZi7bAz34XL+ZNppu1VegGvXa8jPzuifhfotSbYvSYQgKLu53UQXI2aSKYXRgEtL
         sn9Uhiu/C+KvhLmgSfjAOpfgtP6eZyCY3Q5SLAotEWoaNBlz30TIiYzRmGyzMNFj80yK
         M3BhKyzJIivbrCmk4OtKyxt7A6cUCwl+3Xmwh5zHK+3MIa4a//IHs8R8sFY7TBxaIxt1
         Q7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413174; x=1772017974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+3N+xY8cLZlUDcYTClcCN8YabWFK8vIUfB/T72lyAg=;
        b=izAx/nn8eq9DbwGI4PtlK+zy0xuTneymVymbPVTxQgFqZxBJGDnQuc/dap2ZlCDreK
         JCrpXBIQJMUdX3/QQV4NO+gOsZfvCSTmiaVEQn8Yw+5kS2J18EJv8yc4Tgc+kPPb7nOR
         ilHlP+fBZE1tdrv1yMevsUGfkLzp34MPUUqJggLAVYx9uRTeNzkwYXkK6uwEAFzu35uz
         KZLrhRD3FnpiFM2zY5PmuBdaps8zcWVuRRbuU31PpYH2cSS/VCmL5HW4wOYHxsneUPHX
         0vgkhKjYZEGx0QJrlqOCGiNEQFX0EHBTnY3eJXOgP4UDvYZS358BEVtWXSTyVOjP0OSn
         rGxw==
X-Forwarded-Encrypted: i=1; AJvYcCUX6frePU80z2KNTCHLHro7AAYuo/cVjcfevnFrhtBuXETN9XcKwB61LF1UHvDEogYRd+JMWNIKDUC6gHJC@vger.kernel.org
X-Gm-Message-State: AOJu0YytoiqSvCrHXeOva8XWIL/ZWttTHWJxKDNWEVNbZZUTSXsl4I1W
	jMM5kX4PeRLqde3CZTiA37iyxoghKQdP7YVJsRnxVc24dgm/QFcfuAY06Zbtk3WOR9Rd/ixz96R
	qB+FWiVs7/nvTgSNbb8dUy26lnpbad8uFmeXLfpOYS+RvKDp2JlWUTd15xgPVGMC1qCby
X-Gm-Gg: AZuq6aIuTmdgZhhqzuNuLTP5rxJtWtHM/wVEwX/Sxu1vL9ym96SYbazzLzVz3jA/D9T
	xEXy05TSnevXWNVDzjgNBAJ7KB+1sKFPMhuzUZQrrG3+58FiCstyhgF2LjzN8kEUA0xgiP027Z7
	ef1QZKXFS5EVZ9AmO/9MQdWnCF3qIhSNzRMIwbz4xz7Kz39iWfJzbI9O/Y7mXKvbQ5hrldbrAiS
	/bh+32GzY6Gv38LH9tQvCQwFf3TgPd0eveEycYkaj0VJBhc2px78ROl+mJ9nYrhLqM+uv6ZZh3a
	RUfDuP12nFoIYUzXsPQ+vZQvmGBYUQweEOZa7rjEvdde2jbzaAvsUPH8O4KdReIEt9n4jL0buaQ
	VlNFoP3YZA9OYshAEHl+j+ReCsJelOiIsN/iqoCta+cwqKv0A/vYn8FL/UzWt39kK7aw+dwyGCZ
	/pKhE=
X-Received: by 2002:a05:6214:4c42:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-89734706f3fmr182245206d6.2.1771413173680;
        Wed, 18 Feb 2026 03:12:53 -0800 (PST)
X-Received: by 2002:a05:6214:4c42:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-89734706f3fmr182244906d6.2.1771413173135;
        Wed, 18 Feb 2026 03:12:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm3120910a12.0.2026.02.18.03.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:12:52 -0800 (PST)
Message-ID: <d1adf3a9-3786-4fea-933f-e3df125a408b@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:12:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Udit Tiwari <quic_utiwari@quicinc.com>, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com,
        quic_kuldsing@quicinc.com
References: <20260210061437.2293654-1-quic_utiwari@quicinc.com>
 <e5fe09e4-758e-43ed-a134-55bcf3a198b7@oss.qualcomm.com>
 <f4e1b449-9fb8-400c-ace9-bfb6b967bb13@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f4e1b449-9fb8-400c-ace9-bfb6b967bb13@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e8fdgJ28c6OaC42XAzirUx6RIsDVbsdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5OSBTYWx0ZWRfX2F2DFshYRV5x
 /7ez/iDUo+Nj+h4AsDwpF1IEGAV6YbTMr3hfGLE+3Q0GmycoMxt/3VPoWtfHeu6EQjYEelcZ1jb
 2FnONO4W2WPXVbeI8uw7S8CTIOc4PAUEf0pDtf+LNuy3jPDgK7yy8hZ42gCyGRZe9SFHQJOTy5w
 N4ka7Jum4RseqtTSSXxTa/nd/JpMNY6vIA0AM8zREmtIgciHa7GMngyqgyUWyouh6NuJFXFWiAn
 btRqiOHVZKz0ZZApLH0IY8ux4/xISU+WhiEi3/Li8xukY36zTYs96HXFHgfpE3GqjyhWXQxJdoq
 Unl6/7x8GSRfGwOlD5vv3MS+3XkrmNRp7v1Vhv/AEjpk53tyXnNkJNGy53YByxetsV7W6zQNFja
 WumcVW8RPH/YiLbbLDyQU6RXy09BOi2ruDBWSXfFHTccvqCznK5fYiu/MEaOBaHmT5TZTpxlg30
 oVSOwX4u64nEOtI4nOw==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=69959eb6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=YzaIS8OsZxMseUwa3qEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: e8fdgJ28c6OaC42XAzirUx6RIsDVbsdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-93264-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CD1F155D0C
X-Rspamd-Action: no action

On 2/18/26 7:02 AM, Udit Tiwari wrote:
> Hi Konrad,
> 
> Thanks for pointing this out.
> 
> I agree with your points regarding the usage of the ACQUIRE guard in probe to simplify the error paths, as well as the redundancy of icc_enable in the resume path. I will address both in the next version.
> 
> While preparing the fix, I performed a self-review and noticed a potential issue. Since I am providing my own custom functions for runtime suspend/resume (to handle the ICC path), the standard clock helpers are no longer called automatically by the PM framework.
> 
> I believe I need to manually call pm_clk_resume(dev) and pm_clk_suspend(dev) inside my custom functions to ensure the clocks are actually gated and ungated.
> 
> Does this look correct to you? If you agree, I will include this fix in v7.

I tried to find an answer, but it seems like one of these situations where
it's easier to add some debug prints than to analyze the code ;)

Konrad

