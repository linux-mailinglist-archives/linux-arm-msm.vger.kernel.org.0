Return-Path: <linux-arm-msm+bounces-95111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHM4MNa8pmlVTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:49:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B21ECF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F1030480C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A648B39B975;
	Tue,  3 Mar 2026 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEeYwlk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fugf0zqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A57831F9AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534819; cv=none; b=lyOyLioYJGblddHv4dc6AQVWk4DNZVz/ca+pAuSgAsm0tSwTsISvv0s+ZLQvKTIDSBPabL8ZRyXlk6t39edqugvNpiX1WoqEwTEGsA85IEHIyPzBGDrFZEM5PeD3YUR/vkdV8PbmattqaCbKQPBINrMfgF1hKMv3fL8OgC5E8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534819; c=relaxed/simple;
	bh=GBQKgN6kGGPo8iDrDErfLf5dCq2wspOVI0iefN3XQ34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbepsZYedK3BOmtFAzJS7KI9nhzn9hsZZdLKzm7so15yiwJvo3qCi/HzN3rtyFDowZVjeRomgqh7qYKjc9mx2MOM1C8wDG7ol2JfVKuyoFJ3T+MKBhgBROdzRrYxXbFzLi23Y2xwRKL7osrvB0vkPXdKQzU4CpMRMEMbHnZNJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEeYwlk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fugf0zqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mnFq3995372
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=; b=AEeYwlk5qFUBS7rQ
	xJ/9qEJcTVhNDbxYZsNhDsg8T8Mhemx9Y2rb5nujNZIAf9oikiDcMuqxw7NEeJXb
	2GQgGYnl/+NRdcFvkNyQGToskXr9OHxER5uO8Ln7i956jdPq6TpTY78bAVb0UpLd
	7ZydUCHlQMvnS5xmn/l4D3GGmnE6TySa9W2HXAlX94TDu1adgCsAvktinodgy8ND
	YUu4uLyFHx9URrIWjMJkudYhLrUlFiW3ShZXJ3pzSjn+RMJ6CR9Ztkw5lDOc7unb
	MzBtM9UzO3HdABqOm4MMSaB0WDKT4PlW34+iua1J/r9h53OZ1F1ipjHIXUbggrKp
	KReCRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fs53q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:46:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50fb0abdso496747085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534817; x=1773139617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=fugf0zqK9ar0p/dZscz5d5SwrmFyfIbZGt2NGz+ICaAfb5lFLV4Rdf6LYWdabE/DkD
         1ww0qZye8hyxHRB14S4aA7cR0lL4aHWwPWmjmo4QEKejiV0fDcyKE/URU08tVsXNNbig
         7Lm8HtMlGQBY7aAzceXrbQNNCkoP+/5CfVtIdW//bA1iUGsk1esA8lOG+InbGeP1q5Yk
         BnmEa+M1UqMF9OqQmDmDKtLUQpX47J740/2sYy5B605OlTgVo0YG20GW/c8ol2RMKoAE
         joT1M+inUcLjNBSD2PA47VlXyDYulNyaZcCiXSaUM3AqDBtLQUIIbfsA6wEteX+Ukik/
         KHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534817; x=1773139617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=vLuRIIt6GE2V5XjZXgCaG/NiFr5mGPEx+n8kzR3664K7gB1gYZLo7cWNVh29qnwWVS
         qyRpBctHWhBWaajdZkRkHaSFnIzngcj98LIKtNuC+t8tdIlPoN5zPZZS0MZ6B7MtQOIl
         34GpokSQ5scHRfIlAXxsAYYWizHYAOoE13R7szvOnMZEtD+YZAJ2xYN4PELGIAUMZdqv
         v5Hmhas5JXWuKOgJsxngzQBebAryO7iYEPzvZv5MAdSyCnWbZtBG5d0zPsTejyeL0QoD
         8ObEaqc4GFOZi2lfan9SgKYu5bTN3K46qUCLqWuIhEFp9cb4U4BYF6+UfuM2sFT7yN/v
         HukQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5XzDTR1E7G/N4tTckDHqs7ggrVr2wj9XQ32m/5XgC2fD0GtcmEcbP0E9/r18p9c3RqwAMVhKCdmKWdSGv@vger.kernel.org
X-Gm-Message-State: AOJu0YxwVpMzyuXUJzvhBMM3gXEMPb9LcrSmp9fXTNKdxnhaWtzWsDW9
	NMEBWBZgEgjIoKFkONFe2W4LwJ+r9ITRUXYo9vPZ2ibLOcvOWKnaVskc9xcpKlFQvWtcfq4ijuA
	IXWZ2zQ7avBX9/2QMsujuCb16lO4xC4Rt23etQYWHR2ULWybGUbopJcSsX+qs/PAo1/px
X-Gm-Gg: ATEYQzyasvbLyJH4ZYoI5RPPjLLG+4fj38luf+LA8StXUAYZw50RMrbSSjMq+f8L40f
	L/LEgyWQdlIEjFqgJpgXzvympBuQL/MutUL49P9S6e1BIx9L45iQERabqRWy0n9h/od2Plld0YM
	+LgFm5W/5cW6sbp4g+y9BOdCV7X0vUlipbjMBjbRRAHhT4JfNaebavy0QNhSJsaaL4bJqqjDf5C
	54doQuthIk1GKwvJ7TiIkaFAJDeRV0ZWCvZDAVBnSwHEKQKEVFBxQQ4ZeTrU7R9w3e/+5cWnnu1
	RjrDyJGS7spNTeA/KHTv0RBcDSYQ+iunovaeaOjZCr+6dLLgu1bGE7gnsoiGwm5aCoMW33bH8KF
	tMWDyMOYR4SIlHuZFqTTABTGjPPT6BQigXOwERuQShB5p7pmvDts495u6E20hAfeONfc51x3DsB
	+ashE=
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494511185a.1.1772534816829;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494509485a.1.1772534816383;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm577333066b.44.2026.03.03.02.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:46:55 -0800 (PST)
Message-ID: <8644d2d8-04b2-46d5-a74d-6d90b5103825@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
 <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6bc21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=aUHzePZ-ChQT42NVv6YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pWr1WoiDCOPCe8gjjZF-EsGUOZxJbj5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX0XnRA6Y/pQ6+
 QjRybAUD4yoytQz6mZ+y5tgaNDvbxXP0YtQiIlMSGXHQSNCMgNcUz/ASsPZ+LyZzksDnkfG3f4e
 K0wIWmaBqDUxXWm1nU/6dE0L2lkCKbUEDt8rGXi5E4ZcziwGrA6kfiEG+6srCOys0c0ODOACG8v
 4EjEsULAR6BuAwI61hP8ydYHucEsIylNYvZL7u+5QLVACI7NevLj9r2QHJc67fjDXRp7fnxOH6u
 B5DbvG7/O2++x2rvnpYilpVu2o7Abmau1VzqFyi3TtcnuXH5Vx/a+voXvT9VisTb4oY048ekRa1
 ZPHQFSKIJe3m/vfxWdVhiAbw4Kl2T4tHuukQuzodYt9q8CFQAmHOdp9LDJ1Pl2E3kkkKUTeM/a/
 X/CovbyIlvJzMzmpTx4ew8tgBUA8c1oo4Agf02e/vOEY6lFtgiS1jUJBW6nm8vuV9uCvDpG0kwS
 yokvw+7JAZ6tRyPWm5Q==
X-Proofpoint-GUID: pWr1WoiDCOPCe8gjjZF-EsGUOZxJbj5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030082
X-Rspamd-Queue-Id: 244B21ECF1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95111-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,ixit.cz,kernel.org,gmail.com,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:39 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 10:22, Konrad Dybcio wrote:
>>>> Squash down and Co-developed-by
>> Suggested-by, perhaps
>>
>> Co-developed-by usually reflects pair programming and requires a s-o-b,
>> and that carries legal meaning.
> 
> Hmm yes but this is his change so he owns his own Co-developed-by and his on S-o-b ;)

Oh I see, I was under the impression that the original commit was authored
by him and that you're referencing my request to submit this update from
some older revision

Konrad

