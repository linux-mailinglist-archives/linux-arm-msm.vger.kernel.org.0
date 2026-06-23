Return-Path: <linux-arm-msm+bounces-114135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bJpCAgZTOmqF6AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:33:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957706B5D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U4eyK4qr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NCxI25Rm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 264683016C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D0351C28;
	Tue, 23 Jun 2026 09:33:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D041C71
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:33:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207233; cv=none; b=EjCO9GDz5NYc41AJx5uA8+NlIDcNtPNPSqOkknlIOtsTSV+dWaOEicQHm0zXb1fUkpeMvnEO2Ro7abWlBO/moSVvHsTLrXekaYIEfoz7vratYiTLrB/PTxzQgr0ZReyDNpEBpmrgGmv2HGJnmCLwnpAe3CPm2ZNmo7LuiA2H+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207233; c=relaxed/simple;
	bh=vh979CfbMMeEW8g0pA8K6/HiWHi0HKSWGmIzWUpa+vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhAHMrkXcehdbRhbIqr4N7Af12n8RginyphYB6XH6ADe9bc60FqruuQutN7uoLqFWj8td7+YrBMDGSmxjF4R2irvvugr1BQS7CGYjDzJUBi0OI3jmvNIfouo5DBldrMeODJcyENyDuFnY2v5BtOp9FV6nGTbzj3UlYT+b6vZsV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4eyK4qr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCxI25Rm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jOWD1778429
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vh979CfbMMeEW8g0pA8K6/HiWHi0HKSWGmIzWUpa+vw=; b=U4eyK4qrPLsqIMKW
	EOU3WCnOsqn1VgMNPpr/wmMdwTYqzhbfXeE3E65iW5xeU4ARcJ3zSNGPHFvjUtkJ
	hyKoht64AD/agvnNEOLC5R+IIPhhVW8J5tp0zEQZzT1R5OlkGekFUnzqQj70TmZ1
	l6NZJ0tN1wBThM+d1rOrCHuR0SVXAviak8QwYRKfA/xGIebNkZmDJ8CTleOoiN8u
	lqVFQkqTWsUp42HDX/cohNgI6WPSDqoAepRKkBJxC1WatuYsTuvvQKHy8IHUNnPg
	44oG1xWYa8Dj0KdeBDFTyZnx5izAVJKQgH1XwolhEWDj15/Ndt8kC8FaFsjBCMh8
	HK1n5Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gretw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:33:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c888c687c21so123337a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207230; x=1782812030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vh979CfbMMeEW8g0pA8K6/HiWHi0HKSWGmIzWUpa+vw=;
        b=NCxI25RmiWVkf55WkhFi27CxbJMxNqad/PJiWyTuCyUCrsVc271vmvZwuuAsxaKo3Q
         443xHyeaXJdk8w9Kl6lzfYkGwok7OHReYkUk4SbG/fe5v27pV0A7ZI0n6appiTZG+gvj
         fwnDPcTBnJfCOOC336IkaKF41UM4huQagFMgyNxeXiOxVgG8OAWUnyA12KJ2Eyr6Sl1Y
         nur2ndouKJiJfLmNxcP9ujO5X39zmP5RNuquLOf8HJdy+M0mmbOh/R5+1Jfhtu51mLY3
         0rOrUwQhgWj35EkXA1MRjS/6i6nNQwsLMEM5+8nxSy17szFPai3VRXqxPJvmX3bsSaxM
         lIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207230; x=1782812030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vh979CfbMMeEW8g0pA8K6/HiWHi0HKSWGmIzWUpa+vw=;
        b=WiI8/eTh3BPd4VCvj/JcJFfsetzDRhLFygMq07OcmNrsNl5YoRL9SmrRnWpFEmMUfi
         O4BI0G7oGYT1j2410ER/bwAFQ+8FebHeVUveJKGQhvV1YWT6lQKKSd4J/mLuRGXDfn5R
         OlMVgYrw+oV/UhOtsPZU+RhO4U1ZjstXMPgi2Mo/9tV8QHUywCoNNUqeZzmyD2Df9Amn
         3Y+3cXuz8jf7htXmpPLMQBS4lUUBPxUUZAD2bCuBxQrD8d0oC9ocuuRy1w7kau02msZQ
         nhNDqWA9jyFrt6DgdzuITC7utLq06uPXHvz+4NEoeTdIWFxpdg9WvjjRs0q14DKIy15L
         e/aA==
X-Forwarded-Encrypted: i=1; AHgh+Row0lxKPCMiXGhgXGQ9sS6wnSspumMyHma1FoDN/0ChbTHyGJ8aBl2Hu7rPg3qY1q8PkmoJ5Texuf0ULWYw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNhqwIy5VxH4iQ4hjTqbJORAlklQSzG8QQukY+QOBWZYxf049
	UjFYvRL31QtW7kAjnSYy1wCJYNyRIrlzikJv7Hwq3MC3Rj6VYplPtJz6cpitWnXGiKjT5woi7vB
	NFIqMqRkNgYKLWubrfyS64H0V9mvzc+04DrvkVhfRmK7XMyPP0k6uWD0h7lBtg7y3IHARCuU652
	F8yxM=
X-Gm-Gg: AfdE7clrzXSRvYTyIfA4hhzqwbEtLsOw9TUwcUqfo2XXf234Kwqg96XM0rAFS9oB8Kh
	D05NNkJaMK3pjVjSrzgfsPpcROzdFGnZzzgXOqrX+vIisEtWa2F/DEenYgoweO0sRJiT7fZALtg
	PtszEuSrJslxpE0PAiSQXi3dXY1XmNRuEIqA02U+OZlDrzOWV3JcwtQEPKlqc//RYjcyF3nGIKX
	9nzqR9yO6KhTm+qDv8zWGZn7+gn7jrFpGnvPRnAVqLoTixEaLFwvZlfIfXFxYPDrCX6l6/YKdB1
	lmEra5YPzmi76o+Bkp9XSKSGcT6751RWF82NWDN1QSTfWQEB3gxi30tGZrZT98LU0SfSdqDGCO6
	sfgyHS0cZCTMLToqvAmrk+iU/h9FBrivNmFl9A3fdRIYEzgF3Bk52lR3f1ynwulWanaEIM+PNSD
	vxfg==
X-Received: by 2002:a17:90a:77c4:b0:37d:82c6:2e4f with SMTP id 98e67ed59e1d1-37d82c63153mr3536175a91.0.1782207230427;
        Tue, 23 Jun 2026 02:33:50 -0700 (PDT)
X-Received: by 2002:a17:90a:77c4:b0:37d:82c6:2e4f with SMTP id 98e67ed59e1d1-37d82c63153mr3536166a91.0.1782207229975;
        Tue, 23 Jun 2026 02:33:49 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f008779sm9180164a91.6.2026.06.23.02.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:33:49 -0700 (PDT)
Message-ID: <40fb6f83-939a-4b3f-8b93-77d7e07b72f6@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:33:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] Bluetooth: btusb: Initialize @priv_size at
 declaration in btusb_probe()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-1-11f936d84e72@oss.qualcomm.com>
 <xzps6lqo2k2w2onzleg4baycsnzsejiwhhefilk5rt5e547u6y@orl7l3yklhuh>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <xzps6lqo2k2w2onzleg4baycsnzsejiwhhefilk5rt5e547u6y@orl7l3yklhuh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a52ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VaXnfVv-xPxUd7dZoh0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: GuzC9W_tdKbxQyCb76z1nEpCuPttCC88
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfX2g5H7xXPi9XR
 8LXg1QRvP5i38SyCc5qF4nZuqbrCidxFF0b22vmNa7mdiOVFOMuGGfcLVfyOvCMVudY7dlnN/fu
 dRCU4nziTx1VhcGB4eaaBmbWRXXa6sA=
X-Proofpoint-ORIG-GUID: GuzC9W_tdKbxQyCb76z1nEpCuPttCC88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfX0Spte+xqpd/y
 J2j1S2vrUNqBcH0daR0Zym6EM6el6q2WUWLTKJh5kLhjTFHSyfsytmlzV81vepkPck1U91N/diF
 gGohMssgEdjlhBpBPUx/wlW4MKsFBytGihTKVEHmn88mbKel1ktklCp6a+57fEfBq5zPZxZKayk
 h/bImZwd8hCnLhkM8lEEHApJwhTiKOJLGix3OAnv4tAsWjpYIkfcpZV9vAdR6lygpbKAcT8zbvl
 bkxJarTmkHUIHATkZTVeF7jo8mqu6TRJcIKr1yq7taUmv3UGlEYLANVwhgdZdZsPYzmES7wFd3T
 DFi1vv1WnzTBxyqqq3OphmrYGnoai3DF7ObpZi0lJv1rfiQ/MEDna8Y4yOOuccsiKzIaokCO9aD
 wFGWHlYH19YV0UWWoXm5biio1Jw6WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230077
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114135-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 957706B5D68

On 6/22/2026 11:30 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 22, 2026 at 07:52:14AM -0700, Zijun Hu wrote:
>> Initialize @priv_size at declaration to reduce a redundant assignment.
> This is obvious from the commit. Please tell us, why?

It is simpler: one statement completes both declaration and assignment.
More flexible: initializing at declaration makes the variable immediately
usable from that point, so any new priv_size += can be freely inserted
without caring about where the separate priv_size = 0 sits.

Will improve the commit message in v2.


