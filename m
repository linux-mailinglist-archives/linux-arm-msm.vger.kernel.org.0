Return-Path: <linux-arm-msm+bounces-92460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNLKMnz/imnJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:50:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FF1191E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2248305CAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B35C342177;
	Tue, 10 Feb 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZqvIjDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LN06Qa/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4934034251A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716882; cv=none; b=S1TiOn4eWhdgHAcVhq3dn2XXsBDZ036fcKgmaePeYhqlGzJbwBTPFZNnRuyNHG/cO1mZXKDZN5EfcMGdn7KUHC8H6AlhLMH1R5Zz0ogjIp2pnkB0h50w7Kg4P0RqVBuCk5JpgoSG7yykKgN/leqYHX9aLZ+6so6qy80+/+LuSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716882; c=relaxed/simple;
	bh=KfTVOP+VDKEfd7TYraAVx1WA3urkg/oj12+F7hc8BWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdMvciI14IRuBAggmsWNtwvABPQXSopCfLi4gGvJftk2Ii3RyFsr5aygJSDJPc83SA7Q5mWJfq01JOiMbqNDQRYJ4qPnkbNgWNLX6TFGXQ8B1jMoxEH/AqNbP8YfC7p0O94gOI8dnscDbtAaKN40pwLZTdCbV9qfN0hQWUJrRyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZqvIjDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN06Qa/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6ujDt857023
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=; b=ZZqvIjDFVNHsW3Li
	OtiGMICH4C9QXXC+IZ1OdPiYxRYK6TH63MssIbB0OjxUlr3B1VYizG0MmIWLKFdP
	S7/gZmpJdkTNmpEgvNS7pMx4FSxHXNee4Vc+Tg6upXlI6rPCavgc5zobkoowPO4b
	fd7uQ5lv1CrRNgqfn4v9oShLfxLU1xGhOUy5HpnWwenUSYuLZEGe4ShoU5hbuU+E
	qfgddhDfSECbtjHrBFAM9EHaneQCXQb6a7pPeVYxvvjEbbhXpPpMsQFLOz1FpLr6
	8aMT5CsB2lpKMT9Dr2DqAzAgi5zYxJWASxHMZoafYRx3LDgQS8bmBMj+hQ90co6u
	CNGNtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63pv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:47:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6d6b0f193so119514985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716878; x=1771321678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=;
        b=LN06Qa/MrNWMFIfOePfC5hrvptRAPYPlbjYkmcZXOxuBiB7Qdb69S8IBCY4bDU1wHq
         rA2ari3lW5A/qtSyaA+0stzs3MfndH0zpBfpMLD+4rjgk2GYnF7a0ONZyI1v1V+aB7x+
         ni77z1dhBu6U/Ktd74wDF7AYh4QHHmv1G0DaHsETeAkCmO8yPj/odK4rXnQwlfBAj+WV
         9IWNluWM5dORzG2a2R+r9V51LMO28F0TK+B9p5RCsZ6CiWdr+XGn4x2HXZxcS+P6cVju
         +QzfkpOHU7XCZ0MQbn6cJ110IthOkJRvJ1ZULbjXQM71nXm1x8KvWE9bXxXcudgpPxBk
         LrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716878; x=1771321678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=;
        b=GPzAr1oqtq801RQsGIRYNPiMzEhNOV7GnnRmFWC66V1Q86SMXuQdIZsCHnd4mLA239
         TCoWK+2DN0SPznSCY69p8NStkr1VdLtLTSMya2AXI2JD5frAtyJBR4+F1nczmu9cXt2c
         92obWI9mx83r55fBxnhDYnPR/ctdXx2BeQq1MOUQMsM8pzuErT6A22ad9+WS0oMJyjbb
         0OQQ1qTE5J3oJCbalGXE+K1WWRWVEeTALx7Dj/Dofn7TmU3SkWCnzJaxGbn5xNNcxjTm
         0vwNV3+7fCXtnGQtmMFi5SlQKy98RM7cY3OBZLQPBea8XUvk7Ii78O2MXphAEhYxhyYk
         Sy0g==
X-Gm-Message-State: AOJu0YyZO47m1YRThM1vfUMPs0krmHjC8VE8k0G0dnFLqHWGgPucbp3A
	oma9ZGAwJpJ9cNyar61f9z7SiWbEVFQ5L3Q6mrsSU6rK+mkrCKbrjONWSRUaqsrebAjRdt5SCQn
	uc0vrbZbWWqeod5MSTC0pooXuToHGEzBpdrdRQ3JLH2ZQh0UgBBK36UGVbOJPBzXiyvU4
X-Gm-Gg: AZuq6aKoAuETyKmIEkj1EmJX8Z2g4sDm7tsdWTR3MTBLOwdwKwlw1qi5i/i95fcDvHs
	+Aej81NwifcVfJSnkGPbBIhR+vVt3Aj0cQgE7d/8RssVUTg4LWtki0ewWOeLXqf9flz6E/YbDqa
	+M/y237PmOzVg1mkSCFR5F1wNMz77MgSJJ++g/SpizVIxGZoap8b95x6oL8CSnPsH4g1R6Ic5B9
	ceQhmXr0O6R920X9/Ky2fzXcQ6aZHT+doDXWo/6WjFBykVi41TI/+V7EVTUcSDPd5bvdZqVFVzb
	EPYpBagdRT6DyE+wTpFqpOQ+kdwSVS5vHT8R+h+J0Ai/LGKlg4K8lBPhi/A/w2d0giG9seiIuyq
	Zph1v/3THwwtjBf/ltrESRwbSmyXGVC1bVH8eVGecOxvkCmf7U/SXKRIi6kASGR6/5Jd8+az9Ns
	UPqTo=
X-Received: by 2002:a05:620a:390a:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb1ff494bamr103204985a.6.1770716878602;
        Tue, 10 Feb 2026 01:47:58 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb1ff494bamr103203985a.6.1770716878222;
        Tue, 10 Feb 2026 01:47:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3c255sm499071466b.62.2026.02.10.01.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:47:57 -0800 (PST)
Message-ID: <857590d7-2cc7-41fe-ba40-62a8ef74bc11@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] soc: qcom: pmic_glink: Add charger PDR service
 information to client data
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x60ku-W_gTswlcO9cuhF7nwnMoW-6wRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX+1FHVLrj9HtC
 /4wooL3i9HesTvQUNBH9tp/+H9DvbzgnvlONYiJVDqhQ7otj2lc13s+rXtIYE87G52AOQ/ZO8Y3
 PKwjNhzO/W6J4g661ZL03Z61L7AZAAsbQZ92+GsATlIPbTimsg1ARpc0O4GT2YsLI5R+Se2g8jM
 2Ras1u0vrUIt6UKFzBsc4bI9ku+3WF87NIpO4jp7kBJmTix0NpshTprXZS3/OLjqDFI5c+EP7gP
 GYWADi0byRdtbzbcujlVsYcP5pNIHxDwZnjxs9g2LdIaXftWfWGatg2Ncjrc2219SborMYS+rZM
 O+V0OVdzEdQMR7bYMRyw2ScjwA/JWTBqeoQUvijAyiFA6GS/K4epG1PbwborWN8Gf7IspYqXkXt
 mLspiA0IGLJ5x51ZavboX+366o4ySz60rNSQJOgVNE/Lk4mDG+WmcNFOEFjCY25GI9qje9+SnsI
 vNJ2BSz4P94xFnDw0wQ==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698afecf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ES-LWyGZB6HvuNGBYh8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: x60ku-W_gTswlcO9cuhF7nwnMoW-6wRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92460-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 701FF1191E9
X-Rspamd-Action: no action

On 2/9/26 9:49 PM, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

