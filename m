Return-Path: <linux-arm-msm+bounces-115868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mC5HCHstRmqdLAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:20:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8B6F52BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:20:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KNAAFroY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b6QYCq40;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88D9630E0998
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472D247CC86;
	Thu,  2 Jul 2026 08:46:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34747CC9A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:46:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981981; cv=none; b=k8O8wOOa3Kc1rLxQW5o0PDHWc+C5vnSk5s2SZxBfi2zcz1jWALfb6yP9xrEPqKF1iEQKM3ZOUPAk9HApvS5VM6sm7o2/HSfI6fKJw6UZJ8OsLQEmkCI1mQVmFDY2Xzf+iqas1NkL0poETvJo/+w0LRlMJBzXo5ZpZ5h+McMtZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981981; c=relaxed/simple;
	bh=UhI+nHK9ukCRGjrQ47f58ivl+NYqpxzrcaGnRag2NpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q99VstpsN81h8c6/Y9EUGMhCahjFedvfPKOq4Mg8Vgd493Mz9UOCbxgyrflYUznsjxBWV4sgmTiymFkaetNwJ4FZ5aLY+bBvcqXnsjohbT1eLb4TpQdtGXFSZ05YhnoBwoZXV/XU+OyjNpybIwd67FphQNXLtHAGwcWFeAhFk5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNAAFroY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6QYCq40; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Tnl23067779
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0q4da2fiulmBrGZxAKwXVeK79v7ZnEvPL/F4gqP+b8=; b=KNAAFroYr/v+a3nu
	8WbfB8wKzucNAzWl5T/b7X0TQrW8RNhvCJS/JHcg/h3VYVN967reBIXmP9ZhTWaJ
	1GXuV9k/+foVDH/5TH6rCHijU+zqzM3hnkz7lZK2/Qdsh86dKWlZoGOyTRQ5wC7i
	qvrrvMjnhHoiHzcxZ1U30hZCNZI3oxOQt4n4GtpGzyhK9sk6f2FupyQtKPT+le1o
	01UqWXm2/qytq+xcT7Wqy3XKalpypM5A24JNd+BAmZiD7ZESOQlkEepXrsAi8Pg4
	JkSm4DlFTRoqyEHvFSZdLq9J9XRpi46PgV7BS1IBCBVvuryWhe0EPxao/WEnOj8m
	micxlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amp84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:46:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e8e40a8216so4754026d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782981977; x=1783586777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0q4da2fiulmBrGZxAKwXVeK79v7ZnEvPL/F4gqP+b8=;
        b=b6QYCq40TcPZnI5f5KtrwzW6zzZUEGWx7UKIdeh4RkPGK0WNnhAmtjjQJ28vx8/96n
         lKg1y422SDmQg9Bia4AQn8wuTbD7pPqjq08pxnKErI/vBYGKRd+2lkN1LEdhnGnze6W0
         z9WFlUYmsiTO2SliCdwhJ6hf+houcx2G3cXzmjos6nKv+D8ntKV+6liRoJcI/9vvUv8k
         GHEmneL0O4/82TSQ15twJaJflragqaXzQleh+mylaGkMM7htjBSwt3PJ0fJFV+R2ro8Z
         +JgMmY1UM6r17/ZfgkltdhWT5UY+3YxKw1c6sTqPP+rppZQi9XARb+QKuHarIaoc/4sD
         VzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981977; x=1783586777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0q4da2fiulmBrGZxAKwXVeK79v7ZnEvPL/F4gqP+b8=;
        b=IcVLKHaId3pOoLvugmT/GdVJxuB6uv00v5qYQfXS1g0amTP+mWtVp3no7P/IEq1jUX
         CXkhEVI8iqRCjrg7UNeXmgibpLTA1/vaPi+VIIhML1HFWajnaxRDJm1Jx21T3+MRIiZ4
         C9gl7CuoMimo2heEXhXo3hJ3MzedMLxS9SZIYB6EXbaEjBQBpDeh7THbYbbJZ1/XVj7F
         rhKTrLlzjwgmi9xtO1rPwKWz63VC9aFiaXR9IADQN962+Pej2Gk3feqsRHQiYhWmLPsH
         3qWUQPxAtq9SeGSD48pEOb1srcfEbTuKVVE8Wy5n0R9XH2qHsyLSw94xWBV9YZIUrwxn
         tdjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjjFEHOaYGAVzp5DgFKtCJ8k5F7xRehv6YA9YMplEbpZJc7Ql97QSSRiqAOATsxNkML8fjRAHd1uqalJbI@vger.kernel.org
X-Gm-Message-State: AOJu0YyN40g0tE+QegpH3k+8dgaH8XQ+Cof6wQ9BPoysbKwDBAQvnDpk
	oe17+Cx+Zm26qJRyb78/7rv9t7VfirdJ7nw88Ax9CehdxfR2NfxX4Ihaew9OiXlPNrHg2ctBaoV
	P//ygWuuKuo/zWRM0fMsaGRr2O1mv3ODlItVxv2QYt1KiZyJ5L2koz6n1FRXMDsew2cAM
X-Gm-Gg: AfdE7ck2fXhfKQLJk/xEhI00eTlpvjAlUzb6iAY4OyW+rxcPEgNhhPiE2czHBrZINsN
	eJIUy/b2Ux0AfPH6d/vwO5mw2TKb3mWAOTsSKmIX/0DluYbXOmT0juccfLTLnmGmAPP+OHEQQa4
	M71b2E3ruhvLJuBtDzFg8p9p6rQqfy5ykc0NfLpzPs8nQPYHv0f4AErYvjCqkyJ3iBsvwKxW4O/
	mK7g8R+qQCAzL5dcdVYmZVqFVXrnmBVRwniURs2RXnR7GvneCR3NzinSlSDh2hiiRE8r7V5K5Aq
	9uIxV5RLFmDbIT8CIypTcBnrljT5TDPmDpIeVIdEmR4SJc07UkkLUR0J2s+JDWhbjSgRvqpo8nu
	WZWUhIqt5ZCWhj1w6sDKr/pQSpVMVrjcycT8=
X-Received: by 2002:a05:6214:4106:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-8f3c5b03793mr48602906d6.1.1782981976888;
        Thu, 02 Jul 2026 01:46:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4106:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-8f3c5b03793mr48602746d6.1.1782981976405;
        Thu, 02 Jul 2026 01:46:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad0fff43sm615115a12.17.2026.07.02.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:46:15 -0700 (PDT)
Message-ID: <19c10954-a7ee-4062-b418-15b66e60ec20@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 10:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/msm: Return -ENOMEM on memory allocation failure in
 probe
To: Vladimir Zapolskiy <vz@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260701222411.138514-1-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701222411.138514-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: igsTwRykjmbsUzoYMWeVT_kJm-uIShy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4OSBTYWx0ZWRfX0L3E/5pOSckr
 Qwm1dfuGGUcSCreOxdCQS8MnoAnnC69CWSM7NYr06O9+gQP0Ez1PuuK7SV7ljEh1DJhUCJzc4dX
 uiWamGAhPIhzIOMJ4PdEMRRfnyMEkbld8ojzMFOpRIH9paUwo4Hre5kkPzKn/dtma8EKVDgqFCf
 oIc5hz7f6mEhlyw8e+88I8B0vYUgT8t0ZXLi7Qr/6O+DGhoTO60go5f9Vb51yo6Qb18GMe2fqYA
 gKdP8iR/prSLOqOsAqm5cQ2CmX+j+sM3pMhlh1Na2rLl82a3yq08FLYg4hiV37YNF0Sq0qvGWav
 dRpxz5uCylNBc/n/COoTfk7ABpKrUgc6o/2S1T3R0pR0sawHrlU3whgsiHE/wHC/x2JtlRuNlZL
 h52sw9zdT7hq5E/jDm/hlmMCB+q3vTmGlKA3jEuRgk8aOVq6kp0N5rCtV5lWFtGsgRqeXjWLBDq
 v+m/2Ql4oa9sqWZ/vOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4OSBTYWx0ZWRfX0qJ+ARsKfC8f
 RnRgZM35CepgcWJs4+1RYHYVWoZXZgLAtnGxqfi1HHJ9A8YdyVaNgLK3/iMDjk7YBp2E9jFoQNz
 /JX0OJ8kxiW2xm1LkWGOwg/KI2gTP8E=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a462559 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2-WmOyngiLAqHHZ_-AwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: igsTwRykjmbsUzoYMWeVT_kJm-uIShy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vz@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:quic_srichara@quicinc.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20C8B6F52BD

On 7/2/26 12:24 AM, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails,
> it should be reported to the driver's framework with -ENOMEM error code.
> 
> Fixes: 109bd48ea2e1 ("iommu/msm: Add DT adaptation")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

