Return-Path: <linux-arm-msm+bounces-116762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gv0VJmSUS2qTVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541570FFD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:41:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pX48h7Ta;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fl7VacTT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116762-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116762-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B45C53031D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7DD3F1AD9;
	Mon,  6 Jul 2026 11:09:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3644212D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:09:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336188; cv=none; b=pQnuYWvfIuRi1cM96HoJlZFVq2OApRTDM1WeFH1ukLeSHptrrknZSjijOF+m81hAW1llAvFkUdS/uWimarw5YPaIjM1sMXW0rMouCEqXgQrC77zN6TRZ+uPmreQqDlFoqAxxeq1t1V3zgje3txKaQnIAOpRkOjEOocZjw1jC4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336188; c=relaxed/simple;
	bh=hUL4WYPSAJ761APDkAIw4UQvLSCj4JJeRyBGiBBra/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5nH7L3dYYMmZ1uYu9Ar8CrYaubB0tm2cjQcuu+V26HfJgHP5CRmo/SU0EaCVThu/2wnlXy5R7zIiS8SqCkQh8Gonzo76rV9d9nMT8eytN6Zt8uwVlwR4aB9m8moVobSO5lP/FeHOBAaeDkm1CH+CM3azWC+XCLRN78d1tPY8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX48h7Ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fl7VacTT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLLT218452
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=; b=pX48h7Tawms+LHRc
	QZc63peXyBM/dHemiteAjFnn/Dm2atMcCHHtHjAIGSpEwCzEX76VoWqNvieJ7rMj
	jhuLKOBhmpaOeHAlo947z/JyekqWGxbqJGELhYB7aQA33Ur3W4V81uTtJuQt6aUe
	/MxPQB6y04jxto9wPJ01Rgrks3cr9GydohIvzflZsmnyRbMnQw7jtzRkiFDuO2i0
	o4XEylXqicGHOBXUX7bspiKuK0uPsI9/0CDU3rDpVvoFSZJx8iBq2eX0+T5ex/dL
	cDQSYLJvAwrDYvPQOzv+bINABbftfw0HftfrJn7TStgNXU9IsFNkO1wHHqQxsbyO
	gqyJ+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8rf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:09:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so7956081cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336185; x=1783940985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=fl7VacTTgegxSKGd+ey3esFCoakpCsR9HylmaGOJN1TTiLePhS+iATU8lL8osA2N9u
         7/NfWVW812flgUn8dL0qnEksm+S92DDVkdr3KvE4A6xcEg8RPEhIJRB5Bpi3LYy9EeQ1
         uQP9zuB/JK3AW4/t1ig0xgDUtC9SxgDJMpmr79sJ7zBA3vI9YtRu9tuHw4ncbK7dmOYw
         iZBpYWZnU7/HCenG/HMXZaVKlW+H3ObXr65PDtqKxtD3IeeVSEgSxPvrfM09AeHZEDSE
         1G0DsuA+Mg/Ox/OG9Irv53kYL2Ff+M3OFjFKC+7aYUOD7G26Xi8DmdelpzpdlGK0fZ3g
         vNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336185; x=1783940985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=CKngWSHgaUtw2FYIFWuO3FDXzNCYSocJs+LMK5C+SuNRhKkwMJPDhlKtEYWlrdnoGo
         H4PRiiEkeTqYWILt0yd6w53+CirPX7GPWGKFZNQpUd7J828aBEgiI4oqtlbwKtOrtAhO
         JVnaHh+Xd0xkgIHxXES8pA/RX5G3p40Mkow3uYrPjlYktkJe7jKjrVcS7G4bS2E/ZARi
         tZ5bEgniwhASuRFTElfj1a0CA+yTLHdXZIGERYfUTxnthBdw1nvacyoDp8g62/HKZvZH
         rbsyjtgaQYotI2JdTDE2w0n04cCs8T0Jh/4p7PKqA7mBTel9NbaCrkKw2Dl1ykhvENui
         S0/w==
X-Forwarded-Encrypted: i=1; AHgh+Rqk1vXKO2f2MeSGBUGfmFZXvmJws2b5m+Xctom8Z5Ip++8x1jVCHoYEBc64C7KWwBl4Qr0lYM1P93ZYIjWg@vger.kernel.org
X-Gm-Message-State: AOJu0YxryLEA5pL0gNjHZMhqykky3xnFX4l2PXW2NLsKR/ZrkDxRqcPf
	XRhfLNDW4uV4iR8Cv6lKIwxZMnZAFoAs7XFXpMnRg62Wptd2QoNRUR/gqBHxKfZLTAYoQZxHq2O
	8DkcVGMVrcugGMLbxalSX/dp9fRn5O+DSZ06CWxLXQoWofNHtkzvQ2hFFKBk1gNk1+x6Q
X-Gm-Gg: AfdE7ck9zgMR2qm52EizeA5Ysyy1ueoijy14WVnbo+9GlMuZCbzsrvinhwcf7rqvhPH
	mA+S9PzBVQM/rby5PtrkUAC4xOQdk4BIsmykriAbojMoyoGvI50GEnXeF+659qf/3LwMAZJxh1H
	tYZe1i4uOCXRCz3tygn+xqC95ZcDhU2eK7S300fpgk2DaBWkMlCnvhrdJ6kj+zK4/ex4c8HYPX1
	m9TiHR5zsA5TJoPb+MP6Zz0Wpnm/q8XlNCaZfz+0tb9XFpl6x7z2ywaWnGLZ4h8uglcbsVVoCew
	1aummLk/d+mzfroP5lKDWJ1uA8CosDQD2yxg019ZGvYsjzxHu5LfCDSQFTl+kceQvQoHV7zbUgH
	7KyoXfDuffg6+6eyUC3nMjWn5+rxzKzCoY2Q=
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92272951cf.5.1783336184810;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92272611cf.5.1783336184315;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm721233166b.47.2026.07.06.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:09:43 -0700 (PDT)
Message-ID: <13522517-8e40-436a-b6bd-5ed5f68f1da6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:09:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iaer9pkeicY2T_fSBy3FCttO4_Lot6aZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX/f7YkD2GbwrH
 Ft6SBC8XxfuIXfhQZl8znKLtsb86NyDiOtG8wPYtIhrPjodPsQMOjHD7HdGoFzF5x+v/otXiNrm
 PqOXU7jPmVckW0LBEoAVPNJQ6UtKiATQ27xW5fQMg9tKJk2O2yJj1hi8zVsdcc3aJJXu/nFBsHO
 na4n2ZxR0yVQhFflBhfN7n58unVnyTOg3x9hxOj8IxGB/PORoxBGnczswJ7uu95L4GBIwohyXpR
 gXAyNR2C/8C7p+Ad5h87yNR7x83aqvV+75CyQe/WO4Hhb+Z3szlaszwibl9ShuwIij6qYPQ/Mcf
 esjvCMGg1tgOaqtDzM1xGQkcpbul13mI44Hkb/Ph6UwFD4DxQmm8SyJeJqfilsqUJuwTAikiHmF
 akakwVYAZ2ZNuH+Zh8lLrPHy2ogK+18tiffLUFmtf9BX4JytJIDfm3+NYCOSdGh3IZcK9LuQnEA
 F08EFh7ydMFdF8RbPwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXzUki0HngDcvl
 Sua2w5EjyeicrMD9ovZk6PgrTd0UHrJt4Bo4z092lzUt0FCDAAlk0HtAb+ABCma374FvFz8jTKD
 9m0pN6mDD8Ljm1cVUwl3KqqWa68hYNk=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b8cf9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iaer9pkeicY2T_fSBy3FCttO4_Lot6aZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116762-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 0541570FFD5

On 7/6/26 1:07 PM, Anna Maniscalco wrote:
> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>> Program all the register needed to start up LPAC and send initialization
>>> sequence.
>>>
>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>> I believe some/all of these writes need to be guarded by if (has_lpac),
>> as many GPUs lack these registers and there may be side effects on
>> others
> 
> That's correct yeah. I'm not sure what has_lpac should be though.
> 
> Something we add to catalog? Or checking if it is a gen that has LPAC?

'Generation' is very much an umbrella term that we can't put too
much trust in in the feature department, kgsl defines it in the
catalog, per-GPU. I think that's the right thing to do.

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

I'm not in the right part of Qualcomm to know, I'll let others comment

Konrad

