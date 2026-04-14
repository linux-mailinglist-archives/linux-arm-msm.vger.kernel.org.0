Return-Path: <linux-arm-msm+bounces-103041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ho/xJhbL3WlqjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:05:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C523F5A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28661304A9FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52B7292B4B;
	Tue, 14 Apr 2026 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkCkilxR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfZvoVvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715802820A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142918; cv=none; b=uAZTrxii5QvzQCBM1nk+ZgkDwxmCQ6Hlbg6ekbZ5XTCXvsWtqaznlv5HX8B9q5h6LW0cV3lBad/blci9ePclLeh+VldQuhJflDlCdoHnfFbmORR6KaQAYDEWvmHAKe5lVRCndQlFc/DYdcBUD/7G+Xo+Omn0ll4LUVwx5Vq8Ws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142918; c=relaxed/simple;
	bh=QJ9fyikOIQofRFgBwc+azDKoVS5bLizCWfPAZ19kgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM8iOLzog7x0iho1pDrlBtfTsLrEBVTGOcsX5S2zNbkh4XjRyVaZcVTMzdkeNxcTso/RriZ3WmZUQIJDuGhky/2takamAvc2ZsNpKiCBdfCB6Ut9baglZ47F4OxW/ZfAhDK4M5FvrJR2cPwkjkelW3BUg5w6qDSbTLIpV+wnMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkCkilxR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfZvoVvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBBF43157277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=; b=TkCkilxR6QHwyEM6
	K3Uh8HLjjMrRwi5SDzLobn0l0ks7SUkP9b/Y0pm/FqISlhJQMlNylKJ+i+fx7OZB
	jRdYzX3LwzTY6mhbfS1kypRjDdHF0+p34B8QL/rsAIb5JGqeKoZYnDxDcMGKk7fK
	y5DI9XmBgHLJHhEnI2DEngo+ZZb2Piw1DVN+TJ2X+X/H8bgZUVpFn6EXf6CA8Mza
	awxZnam2jtRlVWnvodimOlJ/KI1EWQkAF3HMKwtUlbFIkkFqIObhW15QaMLl9Vap
	4hWYnI6WhD31SUWyc8/++BUygc83V2SZZwNAITJoqHsFOenv2pW77SxTnIlaWFRL
	1fvCcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b924f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso11258981a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142915; x=1776747715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=dfZvoVvQ08wR5hmR07NbuAUtYHGbwR0jZaO7rMcMLpomd1kPiFmD49kXYw/CMHVLmI
         Um5mAJ8pdLkybzzUKrHdc5WZgSIetW39HRX6BvMoOWr2NbC3ZOM/Em5Kc78PKhsdhtBB
         Dux3beayfOWgDfz7F+YMSa8uWPnDzXSKRJ1yopSX1PaIkzYtZHE+kMO4YOgi1lkONEby
         Uv442kA1fqfw0URRbPV7cZBvbr7jozuMJb97jiKk3DPRLOAr8rkHDHCuLXlC7BXH2+gY
         QD2OEayJb28IVsb2QHLW2KI7BDqZcMAVNx6v9bHNvVri5eS9inQ3/TC4R2dAB/LVHcbw
         Rg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142915; x=1776747715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=JEf6hV45sK9wD3ed+lW89cjZE4kg2V53yFwBgmdrilt33khZd5cFWDrGlNYClQOg/k
         rqzN37lxVg3flp5+p+nfLzyk9doHP7QndEkxriMRo2zdtTSFJlgYRwN3NfigHf2PJaX9
         T3OEeR/zIkfIdOAVuTeUVfjdTPXB1flebMuQajpA2UIIjfgWfMtf5HPcvAig2q+oDdFY
         maCwucfsONmwPccQenCwuDlOi6olRV+etF1XuA56zE5MzeOKmgi/hAjgOeDI/4+GQPjt
         3JS5nmzChvwQXWkWElAW4d2L/0vdnZ//L30H7A0+bpKZls9Zte60ZbHogz71vVmms2y1
         PqZg==
X-Forwarded-Encrypted: i=1; AFNElJ+wn9E1wWX1TrtflVU1VoozO/SCGcjFb6HhkoIXK2b064HZ2kt9oHP+DdFdwHXcxOOM7l+zwFPlaDL7Pokk@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnTlD3JevDGY6T36iVNJVXSR3wOoWQbUL/OWQZxXEIefmSNaX
	UdO9On0IXfbUzDRzbMUprhqWvjrnS+t00UL/Eq9mQZ6rciauQxmdZ28Z4pQn4QcGpj4qURca+em
	vm71esQZcZQXljDn6H7N1yU8UbXQaqLzHuql3GWJJy5Shs/M9EA0a9+s7/twf8Gcxyfzz
X-Gm-Gg: AeBDievGGJqVHNw1QxQ1gOQNZHxhdjrj59FGnc++xahbO5QquMcfTH8/qeCtz1eC33N
	oN1+YBda3PWlA3pI+RSSJnpDZmpQOHPp3FI+FnqIdK3Tdy7hGtJOiC36/Ik2eykc/75XZ7tQFfI
	GWWk5V4uRLd4lSI6d3voCtXKgSVx5JimOJOUHDxPrsVXt77+6H0C4dCSzmEa0ZutGqfV6CVUCbt
	3Fv/JC0FPcQVb3YI+jw1JPdLBqbqzuTU75yg6+OdX1LVkqzRUCee2x4lGleAeCI7SYbJucoURE+
	+PLiQ++Iw09z9dmYOi+LIXLTKThLwFWQRGqV70pVFQHbmluiKSj76iEULMcmjxU+iYwOve/Ha8j
	vC+hXS15WAB7Y5sPmJczjaeZ7YF4G7t1reHHjr/2bCASGIAYT5Bh7P0cxH7xdaqrrANnG2slpno
	oodJ1ahZ/UYkFnbm8=
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602781a91.8.1776142915510;
        Mon, 13 Apr 2026 22:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602754a91.8.1776142914976;
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e6070bsm691414a91.7.2026.04.13.22.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Message-ID: <cd47cde2-757f-4b6e-9846-0673798f3093@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:01:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm56u_cDoKnuPob@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adm56u_cDoKnuPob@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX8AQ5K5o9pheS
 bCS7XoH+idQ/uEKeStHQLL1wzEiwNcRXxIK4h8Bxz1E52wD+JURT4mrm9+pcZPX5D851XMdCiqz
 lN5WuhzMFxDnOVRiL1hhvcifFRG2mBCfhBErt13Up9KmN8ui+YgjiA1U2H3y2IwIQCWIipreFbZ
 hlkbSugj/EWSfAZ4FTxvoA9EkU03D4MMTvO9nv85/B0qkx/wwKdfhcogglC5IlGh8XEHtC5AEdg
 jkZkU3Pwr8tyUc0LZJ0J7R8wcQ13DNiuVFft95hQJIrXztjRIt9W27Xerns+q3KOgqL1MjJi4NX
 bOmbBx032BqhStfuxMnpyCNUkQI5iMbQ0TuWTayQisFHn+zqkr65UGJqPjjG6uUtNmKcBx9EI4T
 N/DiqFOBuBSSPHJbQgfAf8gxPInpWpYNT6eTXFwGN80TkTQcIHaDe6vyn8w2WQfXeDiI/mzWc30
 dnMRSK2KvM2r0LNmCTQ==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddca44 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=g4S4wLomyV-OnTC5uXsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: cRRFpQCKJHLV8Nw-1XJm_HvXbFt7zwtw
X-Proofpoint-GUID: cRRFpQCKJHLV8Nw-1XJm_HvXbFt7zwtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103041-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29C523F5A4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 11:04 AM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> [..]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..34b54cf832d0 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>>   
>>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>   
>> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> -	if (handover)
>> -		qcom_pas_handover(&pas->q6v5);
>> +	/*
>> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
>> +	 * avoid mismatch.
> 
> Can you confirm that no load_state should be sent to AOSS for SoCCP?
> (I.e. from the skipped qcom_q6v5_prepare())
> 
> Regards,
> Bjorn

load_state send qmp to the subsystem, we checked from code level that
current downstream SoCCP do nothing with this now, I will double confirm
it from subsystem side.

Thanks,
Jingyi


