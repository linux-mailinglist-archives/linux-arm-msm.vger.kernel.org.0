Return-Path: <linux-arm-msm+bounces-113475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJ9YCEm2MWqQpQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:47:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05019695480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:47:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GRs+nOeI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eUKCGkmY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F98A300E301
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF0737DE8D;
	Tue, 16 Jun 2026 20:46:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331035F197
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:46:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642819; cv=none; b=o95Lj4htQC3fVegAh5DQnE1f9LnhH1LAKV4t0UKuMFtZqNDOTrioAr0YUo4zZ8M1w/MVcbm9WOO51RZHOO1KiOzTOWT6NOHAuiHvBfsLxoxPmMyxv+PImXSURMh3WavTIacBHJ8I2BJN+r05U8wvRSdDUy2aoSUkEDScgso4v4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642819; c=relaxed/simple;
	bh=BkabaxZRxJgxf1snaLA8gpHc5/y0hsVZLbOOE9WHF50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tx+n5cXqI+p3AG1yquzyQlqTXCvkWF5WwYYpZCken+iKfgVjU+iZiSioREbes8dFgNu1UB3vRN84DiV8DXMHLgZKfmxdRlN29/k0ctK38J/n9KHoYxENchG70IQ2CYbSCMip3waqVdLI50o3PaGCOX+XFDUw380BEkCs2sFQWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRs+nOeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUKCGkmY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOp8w172527
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=; b=GRs+nOeITzRjG1VI
	DlBeHD40bhg5+f4hUp4Y/Z5mMrQRRdEp9x6HIzS25LKpaUlBEmO5/4IWJsjgvDL6
	UXzF+SGjJU2TXRvuwfj7y51E8oldEelRn/3kE4Jln9lsdY+zInH397g7f9hPr8hV
	ay/iu6Q3bFoQEGTddchRbiOP94oMySDs+63+MBOl4c7JYU5Im+3Sd2vvC/Blo+FD
	/kmUlKlPeFOZvYaz5M3XisOyL1TBlBZQSi7hoF950LezuOwSUPBLl0zecbU78s69
	Ox9mnBx09Cc4sSJwOiLVez+YztXb8IDEEldXCU2TOePovHnriqnPu/rddcEkCQpp
	bbu/Eg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09kc6dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:46:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso934568185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781642816; x=1782247616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=;
        b=eUKCGkmYSMP9R+/tV3P/WZmHpo4NkuGm943VfIYGquJd39+fkKtZQSj6k8+snJ+hZ9
         p45rFWjB5zdY3RkTGpaQIK98ojrQzRFcAyar1Lu2wNROfKlDhNEjj6I6BTjOLQ8M5+Ny
         swWeq6AT2+D08bONtwQvvjRUBLofA11fj8XdjHcyqgg7b7RESfqxcIp9MHAzCKFpQrei
         Tw8zADpCeHiZ+VEldIwR84YCA+5NBm47hYxu3hgymDFJxqce+FZ8Ygywe29u6BNIRiDN
         fNOY9R2HwuzXP7f6b7LIFnbl3KelVKPClA5tZXWN5dVk7jrD0KgqlWhXIU4kDxi7A2xc
         Rhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781642816; x=1782247616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=;
        b=pRD3bJrjxlVymwGdXRld25eNPfDgexzDozxvgMSEXft+numCfEQJR9e+QTn1SjvLqM
         GHVyR1WTFPKzu/rSRiWcPYLnP5wKCUKwk1UP9QLxm/XIW5OX5tNwhilG8NyxDxSDqXyi
         MIktNeptstN81HIdjcRUDVvrwp1fm40+G4kANk2eVPbHZn1dKsQeLPipks2sywOxuypw
         eBlEov90FmoR4wHzldmkN/dT9oPX9wY1qoWaggukvLXJO0TC7yTWFx0TpuRPyLO9KUg7
         fgC6BXObYLIrHRVBrNKIzXKw74ORliHhNVBU8al40drrzR3TdkdBa2NLbsJQ3u8Hg4gT
         lSHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kq88BPJZ5StXRQT2oHy7Kolkbrpg5MQjtXjYk2SHjzaVOv3ZAonOvPBYeY3iNS84LHIRcthbbslD+NwhG@vger.kernel.org
X-Gm-Message-State: AOJu0YySkxAd4u34C8ltyoVTzYKpZTL6nwL559EdB2d1LxTCltcwi9i4
	y8yPTn8NJ5drLog2rN+R8l0Ix/cIGtDJH+/d5eN1uSZ6hGKTD3Fok11lf2DGiDbBXPPEuCyI3zH
	uMUIouVXQQ2YQg/IJAiJxJ2/VF1vIW6wKfMRNHurgXgn1DmTiw9NuLUIHQKRvso8bk2Ff
X-Gm-Gg: Acq92OENbHI0+RHmpyD26IBKu6OQnJlqiqYeDoODaEM133ox4+vE6Ma3BrpV26OFfhZ
	hT0RFRYlGDhaM1LErnB9Zge9YIdnUaaIEtHMWo/oevizvig+MaQiQtH2mn43od4UM06qEFX8nuC
	n9WU1QTFUDNgjHj7gHmMgEvHFZPh8OUFc3jPLa1Ny5JXeb6Z1Aiow8naw8NEerW0qBL7dmJuAtX
	j4pfeTG7fZjeRfrtT48JmqWCJQyfiyQ2N8Wr8hf7aHbjpMe7WJx/7MNsoFNveBaq+dY/uJiXlQO
	2JDxqQ6eMPz4DvpWlLfPmkkriy1hqEJKmKn+v9GYvT8qeeJfq8x/j8AgKvtZyRaN73zBbEUQxFe
	rn89fM1ePxh8La6Jql66QR4xyo/V4vCOKw4gADZzpl0ZrTZnF
X-Received: by 2002:a05:620a:4503:b0:915:9c4b:fdb4 with SMTP id af79cd13be357-91db9e7c9d3mr107383585a.22.1781642816391;
        Tue, 16 Jun 2026 13:46:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:915:9c4b:fdb4 with SMTP id af79cd13be357-91db9e7c9d3mr107377385a.22.1781642815817;
        Tue, 16 Jun 2026 13:46:55 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm45057320f8f.12.2026.06.16.13.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:46:55 -0700 (PDT)
Message-ID: <5b2ccc0c-293a-47dd-8be0-bb2342568880@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:46:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sohil Mehta <sohil.mehta@intel.com>, Raag Jadav <raag.jadav@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfX56GKQKCGYUvx
 tFrqMUVHFFvcfUFbnyJjv+uAhGmZacRZifc9iuRGXRs6JVuXyyk/OeRiWOXaGWeEhT1exkGwMOx
 sVzn7rOr6OZFaC9sbe5RIrZvZN3QThk=
X-Proofpoint-GUID: Km74NAq2KG48t2eox_OD7Tio3a2IPtJZ
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31b641 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=LHjQ_0QYFXRRo-03oDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: Km74NAq2KG48t2eox_OD7Tio3a2IPtJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfXzg4x5ohM3Jxl
 7/rhibwq4Oj+fqV1C/otTc1IWY5BzQPGG/CwZiiknU0w/BZ2V0VOmXr/sNeaxWiDkoiOjbv7pwM
 1qj6xhuQrTlyLNdU7HZofUpgLp358sxp7+0sOYz0rLIAfL0J9yz2Z2jRFZcSXfREC558840+mbg
 En73uT3+f5xPJUT/E0DHnT48BggSTMHtW6Mo1C+QuJKFvgtQuvGTTWhz23vXZ33Pdsff5W/1lNz
 f8xi4z78SR3hQhHz6T09nLjL/weyhk0kA64w82+YqKhoPzSjlkBZr4TndXx4XFHAYEZYFwxsYCV
 7VMCyx1lnmZoeLQxrD78GIUpmfd9giI7UyCwHhPXqEJodpf7TzOoWtypZJX5tJ93/vS0Kh1zCKi
 8PbsMb0duJWsCUMew7uAlKZEztU5hCeAI0nJknulGVO8Nb/AV+lHO51JUqL6bPdLiHoA9+lEC0D
 HlcX3rj7YbFXr20F6Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113475-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[sakamocchi.jp,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:o-takashi@sakamocchi.jp,m:dave.hansen@linux.intel.com,m:sohil.mehta@intel.com,m:raag.jadav@intel.com,m:hkallweit1@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05019695480



On 6/15/26 11:04 AM, Uwe Kleine-König (The Capable Hub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
> 
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
> 
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Thanks for the cleanup.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d..2073edb416a4 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -338,29 +338,6 @@ static void apr_rxwq(struct work_struct *work)
>  	}
>  }
>  
> -static int apr_device_match(struct device *dev, const struct device_driver *drv)
> -{
> -	struct apr_device *adev = to_apr_device(dev);
> -	const struct apr_driver *adrv = to_apr_driver(drv);
> -	const struct apr_device_id *id = adrv->id_table;
> -
> -	/* Attempt an OF style match first */
> -	if (of_driver_match_device(dev, drv))
> -		return 1;
> -
> -	if (!id)
> -		return 0;
> -
> -	while (id->domain_id != 0 || id->svc_id != 0) {
> -		if (id->domain_id == adev->domain_id &&
> -		    id->svc_id == adev->svc.id)
> -			return 1;
> -		id++;
> -	}
> -
> -	return 0;
> -}
> -
>  static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev = to_apr_device(dev);
> @@ -401,7 +378,7 @@ static int apr_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  
>  const struct bus_type aprbus = {
>  	.name		= "aprbus",
> -	.match		= apr_device_match,
> +	.match		= of_driver_match_device,
>  	.probe		= apr_device_probe,
>  	.uevent		= apr_uevent,
>  	.remove		= apr_device_remove,
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 7f44057aa65e..d74ff3ee1424 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -547,17 +547,6 @@ struct slim_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> -#define APR_NAME_SIZE	32
> -#define APR_MODULE_PREFIX "apr:"
> -
> -struct apr_device_id {
> -	char name[APR_NAME_SIZE];
> -	__u32 domain_id;
> -	__u32 svc_id;
> -	__u32 svc_version;
> -	kernel_ulong_t driver_data;	/* Data private to the driver */
> -};
> -
>  #define SPMI_NAME_SIZE	32
>  #define SPMI_MODULE_PREFIX "spmi:"
>  
> diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
> index 58fa1df96347..2e4231092088 100644
> --- a/include/linux/soc/qcom/apr.h
> +++ b/include/linux/soc/qcom/apr.h
> @@ -5,7 +5,6 @@
>  
>  #include <linux/spinlock.h>
>  #include <linux/device.h>
> -#include <linux/mod_devicetable.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  
> @@ -135,6 +134,8 @@ struct pkt_router_svc {
>  
>  typedef struct pkt_router_svc gpr_port_t;
>  
> +#define APR_NAME_SIZE   32
> +
>  struct apr_device {
>  	struct device	dev;
>  	uint16_t	svc_id;
> @@ -158,7 +159,6 @@ struct apr_driver {
>  			    const struct apr_resp_pkt *d);
>  	gpr_port_cb gpr_callback;
>  	struct device_driver		driver;
> -	const struct apr_device_id	*id_table;
>  };
>  
>  typedef struct apr_driver gpr_driver_t;
> 
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b


