Return-Path: <linux-arm-msm+bounces-114194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMSLAPFzOmp+9QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:54:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 619F76B6E49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pwd1RnkT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RkK1su0S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D211C3064105
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5E73D525F;
	Tue, 23 Jun 2026 11:54:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE63D1CB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215654; cv=none; b=pNCFq5gxYXBNxA4cMLDbt4errsb1iqQ/wKe8hNxFg2iLyg35f4rpqQV8w7AcmZvP/z3H2y/0JM5FIw8T6WuZdBso2s4e9W5fxpGMkBkzBpi6FVS6zxcWDXn4FgEhEnhtFXhISeWQP+0lXyOtu/0amOFMajOgy345CCsxaZjDm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215654; c=relaxed/simple;
	bh=HzmAA1VaVol1lrjRsSoR0TB9cLAtuBSKhTYVKS2X9Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7OV9bKvm7yrZdIfann9TlqVb1yNNbsJz87VfSUL5gTL9L3O1ihfrQAlLmQ4kwxSL1mlOY2GuhyU5wUcxUFHpA+g1+vHTGKNZJ3Y2l0QDYN2WdanxwrJjiSpiMPQAJ8hHKb76aMVKXW4l8ZGrtbOrXl7gNexppAlfcswBiQVbZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pwd1RnkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkK1su0S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXrOU3668895
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=; b=Pwd1RnkTr8WkoG8h
	OfiPD32mXDKIiEXT42Y0bNKf8VmZNzhj3q019bnY5hM0so+LAlKsg7YVYxmHZC0X
	g55mkvNphjKa6kLJNK4I9na9fn+C3cqJLz+2FUfTzIfXSfljEFXYrwgK4D+tNSzq
	L/HGJnmJjftIy6psPDogFElA82hruqcBYeRgp06Gf9zxv59QNWoJ5gYWS0m7Y/9G
	Us1ce3PV7qb1lk3QcOnFFYgUMZ8vx5IMb7TTUtqhrv8OsN6Sa/vC05A6gPNIraxk
	zecssBVMnMpr/YFfYDfvp7/5VIawGQKz7SJi6SqU2COJlMeLFLUbdlAodAcM+Zas
	R3++cQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygu7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8620ee0971so5707620a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215652; x=1782820452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=;
        b=RkK1su0SVwMOb/Iz+zpo3jlaa0ydlKEcKIYhfjUeTTdeNempoIrLZ3ulToMljXV8BW
         +T58iD6wrG/Aa8R4LMj9wHZzZYlrDM7ym7gEjRPDQ/wSb2lFjqNhAY5IyYqpDxHnS5yr
         FhVeBq/5CS/fJOvsE5fzcj0FBEdfmNC4rHoeFLKwFvRBlr/kl94FRX9woBwT2tamz6si
         DkNddVwP1hQbvOjgAHGLJtGwh5lnG034UeB4x22EZs04D+xp0/YtMFbQlqAJhcKomjTR
         6TNTl31hAKxqcrFAQ6/9PToS+ePv7/aAPeJD5mD8FTj3A3vZ0nrbLtobA/XPrKTwUSLm
         LPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215652; x=1782820452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUks2ZpMUqdR0BmwujEhPYyFchbuW825u429nVy3X5Y=;
        b=Rz6ibg+2fuY7NENsbKGe+oUdoOnOokkxTzzEqfiZfnzlCBepks5st/+4ODeft4+GHh
         q3KbvmT1Yh01cH6cqXc8HeRx7rbIvAqWzzIzgcvMO4VlmvhVRdjeEi6XB2l3n5yNoHst
         tr0E7vVCMBr8+viqgMZqYboDypOTxSjG1zXIpv0pHa7jE5852ddQFwR+SUoZCL46Qk3f
         cOlszYXJORQroYyu1rscuY/5zdU28IsFmwTss7dNBYSA3D4Jd1g1xmUn/vXDA3nBJxA9
         KERjYAOEjrWQZAfNMAxwn3gnHZtxb7DVEWkoy13WgJQJwx5POC30JxxuoRJaBLJ4nn8T
         xEXw==
X-Forwarded-Encrypted: i=1; AHgh+RpRk53xXo1g7U96uAia/ZcHGmoqwc+GTCKo4AfIbfOC8AUrEOWrcQkCPvPoRL0Ma7R2CQHKMYD4n09ZvqDz@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsJtx61ITVcbU/qyYwsNEIkwoVoySlwEdZ4ec8u+x/DP7IQdk
	CL1KnM1zvLbP6XMAoN2ulYM6Cfbtr00u4yEIDcbyV0uyvl8HjyByv74gdI9NZj816dhIWoaIQd1
	3yTQB8ubqVGaRZ+mkUXU8SemNLuNvXZsL7BqlegiQfH5JQqS6aOk+Jmyim64q6sV/ba1z
X-Gm-Gg: AfdE7clTf5dwB1PwTt9OF78pqVU0pjymnj6X6yHHbKDwMfnNDrGblZstONQGG17an69
	bwvQ1O8JJaTIjTLEegJIkVUcXGNVGzGoWhk0s9qA4XgL3X+YfYOYo5bjW/W21REVzswhm3K9dJH
	+58rEdxZVYvkK2CzD39tSa2m7Fz5jqcPhnZ/2AlFPwY3kqxbyMjdUngSyCzwlKwXUxQv/uQxsZz
	P2MdFcP2xqINfJvmTV5c6Mbo3JRsN+W9zYTGTFh8pwupej/51vMvFqXlQR0OwnJjQRoZhNpq4Jh
	Ulrm5TPJgdpz/GF7coAP+1p8WKhX/lpMJAFBax++sWCBQOL9m0CDZiNKQc0Q0J/qCYA5cuKdB07
	CDqMyAD2gLGo0wZSQyRpMWBRtLJu7FDr/5vY/3KU=
X-Received: by 2002:a17:902:db0a:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c7c9928d9bmr20687845ad.2.1782215651758;
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
X-Received: by 2002:a17:902:db0a:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c7c9928d9bmr20687565ad.2.1782215651285;
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436afdfesm100871525ad.7.2026.06.23.04.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
Message-ID: <7ac3fd70-e628-4fa2-a681-542aa18e692f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:24:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
 <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXxxNbvQTApvFv
 c0O0haqy+C5ecxJYPSyzUIgPTDXAr7yric8Si+ctp2WRWXG7b+mkDbMxAsPX1FF6NxjiWdlkcv5
 m3lan/3qqWEzWuX4zkHZJ9r1pOMdetdcimBIxZyJLJTh94bhwG3Q8BvfLbFb/cUAiFhnyl8R0cT
 flCTGm/1NEHdqNn6LidQhwFuXU0QaipLbC+hvGg5wFtwSgUNmWnQQpIoefyX6J4Fm2epwXutnkG
 4687RYBPtm+hH2Aeie6VLAFC7xJCw2GC71EqHxWJbGhvo9w2IgsvOFpTCtEoltlWzhC4yLo1q63
 t4Vow4yESv22xdlBYb2IXYbHI+ggcePMF0d8s5FvxFFZ8MbtbUv6PfXr6exsaJQ+O7mkmserYHN
 qYRW3vMjpC0IwBw3gi/JdN/8/EmV8ahW2g2gyODWpawvYGeoQw5AbhWp7tx38hk0DKaS/tsvOhP
 k6lglCMA3gHP9pL085A==
X-Proofpoint-GUID: ZVi8wqNjl5hWVS97SYryfJAt7qvxY8R4
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a73e4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=l_-fzs_PQmAqn0YR6QEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX0rIa+Rw5vUbu
 dKSaCqyrZ0GmblAWAlhlOvWaEF4Wm+cqbq+uCeMBCwAHVRG1Eg6X9V27PeMsHJ48Hh1IZj8OzWk
 VDrhrx1cxA91/Vagk4laEQIubkqQlug=
X-Proofpoint-ORIG-GUID: ZVi8wqNjl5hWVS97SYryfJAt7qvxY8R4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 619F76B6E49



On 6/23/2026 3:59 PM, Konrad Dybcio wrote:
> On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
>> Hi,
>>
>> This series converts LPASS WSA and VA macro codec drivers to the PM clock
>> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
>> registration resource-managed.
>>
>> Changes since v5:
>> - Rebased to current linux-next/master and regenerated as a standalone
>>    series that applies cleanly.
> 
> Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
> all messages as a separate thread.
> 
ACK, thanks for pointing this out. I will use the b4 tool for the next 
patch series to ensure proper threading.

I attempted to resend this series but ended up breaking the 
thread—apologies for the confusion.

Ajay Kumar Nandam

> Konrad


