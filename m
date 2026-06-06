Return-Path: <linux-arm-msm+bounces-111538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cfH3FUGKJGpV8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:59:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BD64E5D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nRmcpg67;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QrNpQvdl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111538-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111538-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1C68301A914
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 20:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258A83C13E5;
	Sat,  6 Jun 2026 20:59:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC823BB661
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 20:59:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779577; cv=none; b=r8qJMr2hAXBxuxxaq430GMFEmJ/eYEEbARaSGknDZQzTGCesvfujNljiZ8ro2vDrMHGYW+1bsYbEsV6S65XifwE/ZbbnlxtVq1/lNTAmVgFqK0FGJ2N6TP8WJkis8edfu4ah5BY0RPd9rkolO/QR4wLpEyH8GHn9FH7DH8+6tVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779577; c=relaxed/simple;
	bh=arhEzyLmfNvArxErmFJXcle+VH0Ew1YYMMZrQmaMspg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWP8wxHeyPcb34KwtgxiESFea2ZpJW2Wu34HXYcL5RizxxUKU93ha2F5CoPgGcDcx9BpuqOA5YCl1qfTfbFqNHDdiVrfs9L6Grgf4Haej/H+86Eeg5GnMo4L4ISOlycqwAum7DPsap+squyfcsfjhxxyNONTJCAIKwF/qtVNy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRmcpg67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrNpQvdl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656IicO92680116
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 20:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=; b=nRmcpg67b5vBJrol
	vOsUdeY7t7RFsETTXM7Wmy6Y0vCE2gWZbK/+xXFlzil/dSB5bH0Om7zbcuwlFJHA
	3LNT5386CzxTb4wqTvd13UrRIwxMwFiPCKM9yc1TIjSGNz+daiv93v0srcigvPLi
	ZwxeFZYdBw720Xa1oNFdqv5SHvtW4IjINTGSDqnzPVxwDM3pGq3PloTarmcaKB7/
	7EgxEgLfkFzGM0iTMl70ZVvVXWl5E0xO3mzBA97JSDaPwHqa0hYj65TIqVywhg88
	F/Tjkq6lXeJYmRcqBL/38rnrIkp2RBmb0IfWhgdUPL312r3yTOrrWmUKA9TotCW9
	jXdKLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4tfch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 20:59:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf160f7191so17749415ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780779574; x=1781384374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=;
        b=QrNpQvdlIVE3vlKzam55+X1wO0KwanVKu6r1Dk6MrUUwM61yrDUDA7hglE+hu5KxcL
         2RychWRXBgqZCgIMUNlPon+LE+eciPGWbe6xavAsfXq0jaNHgk8EUEAZaQDC2NtfX5hL
         HBG0dqrFMdtJeiV+3UcGuMTYQWROkiEpN+SMmusj8qZEmwkxE38nwekObGxrSVa1xYL6
         zP2ybUUyzirMPDCBcvbnyH65D8YOWLZaYxnAhLKIgFhSVV1nwjmVfz28uqxj4J9zRA/E
         TRvp8tdvIQnQpJqgfytHKGUN4aolD3zb3G76tBJTUIyZHFTYHqLDm/hM8whIJHYCJGS7
         NJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779574; x=1781384374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=;
        b=EqYTAjvoEdvtXlXD2biSayoxsNsB7kfy39YaTHNBZaJq6aF4PmSEHD9lWafwXBJNpl
         9k0Ns7BTq3Yt1Q5gmgIqgUb3tZCniVTQWrlPaY+muCkeJkULTG49OXzPbRXfdQbCD51Z
         a58AtpRZY0fq1BWq21/gEBU4doJHSe3tseCUWmRJXAX+AwGZF6JGsWd8Z0WiDJcU1nFk
         lg2/841N6sKb5NAJzqH8rJZhwTYDqXw2XhGP4yHdODdvNEEm/7e6jLXHMBPbimbEci1w
         tojey5orhhdxwGFqHRBIdE72ENvAxmot5w1HHL/O5qSpNl6g8+JNGRlu9CxHJ+20fJZ5
         jdUg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ue4TebjLOEisiW7FXhJllXxqAJ85QuZLd6A0EJPUkfHdUJ57a35agnbK9xzbFFa27MfRt9wQz50yBBy7U@vger.kernel.org
X-Gm-Message-State: AOJu0YxvK8Pcx8zDqUWADavJTERTcznBabB1cqvoiD2jLqU4GKDikkNT
	KD+HoKmI7k/Wvy9HEe6YsghBPFEAL7VVYpDZ07LxN2vbz/o+xSHUFa+ThK5u+8K06cSdQAG0J+1
	DsSGOsCgBNk30cblMF9J9nUUo8viwHSTUWOfOjj2VTlQ4JtD8I5WkKwH7CpHgCM1/eUUT
X-Gm-Gg: Acq92OGJa8auY1UZVfDCVFvAF3SIKi8u0hxqF0OLrMp7XGdTDoLsl2zTnEJto+mXTKw
	kdJXaxI8HjIyM/iop7PBkS4VackEAHtjAli/zISBMuVq/Cq5SG8bz7Y0iA8zcErcvov05o1oejE
	vjHO1ipVQ1KrKTUM3G+fAxNmY7KB2QfioiTjiSaZm7RgZnejy+gTUtOA2t1sztu0O3zugTz1+TW
	mr5A40cZy5wRzzPrVCsEa9lWDthW7VvLTBLqhkJE48oDBBqjYOGG/J9+5b3nnvfvzZBU3+QKpx0
	Li9CKHzgo2bHRCudnPO4KWWr6RpkoNaOlL0KWYqfUX0Miy0iIGgYE0l4UrjRqCflgGZ5E1iO1sp
	ExKY/105XjsydNwGqPBqiiSJ4tTkhlAfaVFQcUh85ZOim1+Xh5R6HNVR79yh3p94=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr97382035ad.6.1780779573752;
        Sat, 06 Jun 2026 13:59:33 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr97381835ad.6.1780779573318;
        Sat, 06 Jun 2026 13:59:33 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.87.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm134635495ad.52.2026.06.06.13.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:59:32 -0700 (PDT)
Message-ID: <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:29:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260530-spiffy-glittering-quail-dff199@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uszuQncVy559xBNKJYnwXxm8VsG14I6q
X-Proofpoint-GUID: uszuQncVy559xBNKJYnwXxm8VsG14I6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxNiBTYWx0ZWRfX+TJP/iyOrV+d
 sMlQW3N5yiHo1EdXgs2gUqvLpzguyFsSTo9JKAn3b4x9fgEzeWDKlnrHsg4N/jYEFlI08LnIFh6
 TMFXhivG8LOeyo7BwKPldPLnibJ3LHine2pLMT3lGU8Ucz4Y4qovslor2IqOsx4tmdKJJP5bYcb
 OBUI7z6bGmQDWt8m51mFpJQq9+GGbMR4N8IcN5Pbz2Fa33SsdLWHR0tlbVeJ0JILDEH71zGclgy
 wd/prGetjPTsh6T82aHvIcu4t55h24hBIX6YMGJ2MgyaH0T9G17dZepxNkxplK57U4JjmKkeyYp
 vD7HEYAE8wL4hqrio/ny6xihTjLAoo5FOfI3Or2Gkv3cfwuGA5s0SAZowpnKduIlImyfjhRsMcR
 tjkOMzoahV0Sdr9wJzxEBem39oWquPjyRg1DW1R9MvyWssNZ+gJQrRMsKj16xVHZteZ89iP09D0
 p7J0UV1GM0pqs1JupfQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a248a36 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hwwt4TTrG29xD97kRhuzDQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UrYlmxekfit7Iro2dVEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111538-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A39BD64E5D1

On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>> Shikra bam dma engine support 7 iommu entries and not 6.
>> Increase maxItems property for iommus to pass dtbs_check errors.
> 
> What errors? There is no Shikra in upstream so how could we have errors?
dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
and hence updated bindings in patch [1-4]/5.
Also, the commit message mention about shikra and DT change is also in
same series.

I hope this clarifies.

-- 
Regards
Kuldeep


