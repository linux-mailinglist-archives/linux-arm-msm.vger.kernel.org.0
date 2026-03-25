Return-Path: <linux-arm-msm+bounces-99848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGx3MMDLw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:49:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AF324355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78B1831B6A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E15A3CF05B;
	Wed, 25 Mar 2026 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDLQjUn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRCLY1nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE023CF692
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438432; cv=none; b=buOTRCrW/1Aq2VYNkyU2XWcZrSwrhXZ7cC17WoKgopYH8miCUAKTqVLrecHBZbadiI03MjGmSnXlyo4YK3B8r9WD6fg8DlZnoTcEsOLpTvnLfuX6yGfWJVcC4rUt26AzL//6POavq5pyI0lDGnj8WT2THmPaN9zteyisZqlEOZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438432; c=relaxed/simple;
	bh=zrTu/Fk6R5LsUpKkvhxFJueXyQGTKcxc82WecP7Bj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqeRedYxve01eKY9dVUGoonf66D66i9V8HDfKjw75fyJ2HQYhNdJUJuTXAp6rjV/1MmWSu5FhC6GDQLaO76KeDn2KFsPn0WFo2xthJgDPTxk74dZxK7P/ZVVd9JVeP+gSp2fvKezEyr+dUlTJ1z50O7HaC9RZZeWrRDeWzg5YEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDLQjUn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRCLY1nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGc92197425
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=; b=oDLQjUn7PQCQaBbM
	l2/1sUxAIvkFNa0FmE7FkXoSDecF85GqndHd+u2p4AxReIWS1eKqI3hnDmspBVl1
	cIS/sEPMfzwnFlI5xm6J1vAmMk2ooI7V6KmNlXZIrJmJ83UN+RNVAkJP13zEDqbV
	pRVqOFXsPQ6+zyrm35yLA4rVLRlJFIfu69VQjdFrrhgwlEf1nASMXC8mrtDNWLkw
	sOgK0XKIMm6l5EnpuNUss1dOLbC4SEWYO2K88zzUchOuQdiiGOe/t4zOTYp7HXPf
	zHhoPPFl0p4POv/6/GE6LsxaSBLGsxYRwM3SuAX3Tirrcle8ted4BlTL3eRUcaJv
	dMiXNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599kdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:33:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso319873271cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438428; x=1775043228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=TRCLY1ndyQnGK5LPGl7Krlj62jn36qoWUAr0HFOUMqWlyz0dmfP4L4xtwVEmGCKEPh
         8hkRURC2yGK/HS0r9KTgiUP4h0kOZsAzkPjwTJTIkx7wRmB0FYxgErpSuexhV4h+1Srr
         oa5SlLIjtU4MrBEr1OFDhtaUz5lguvIbkeR10mwitiqR+cBzcXel/O9QUsuv3Smv+nco
         sYIClWM71WVMAFAt08QxQnP7M+76jYNeqYqQd1ZaHKUT3JSPN9LO76w/hq818CpxSU6K
         sGVA5JCHPCaRlrMuv317mq6nqO1zbX+zbgIJZNMa7eJ1CuaY0K0vc2UNWcNZD4ZJSrkR
         PJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438428; x=1775043228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj5/AzTuJ4vyMcaPjO0Gng38EceXd49d1VK/6ipC9lo=;
        b=J+N0d6ljIQG4SpSWVjwNRHJJCPBHRnEV+TKYc4ABybUu5zqvHWSv4lRriU19Hndkgi
         Ru5MxJvR2RHq6+jixyEax1Q05/pkQ2cXiRtQI+CkjZ/6ixIq929caGhVpy/Lwut3KnkA
         D54RkbRmBrfJ0e86MxtDtnFO71qQWAkozWQIALfkWe7j2zmr0E2Ox+QZ5Ec6rke9VW+H
         CWNJuHUYPxuzcs0siwdXkVgK8+tzoiustjEyXOV4g8qcEhaZlLgJ//UN5TorsLM0FE+R
         y2aeIqqdLERSEv1XToUKpFtKGggNidoRqM315dFHpfykkQsU+PbOK7NN84VeH+ttetQ/
         zzpg==
X-Forwarded-Encrypted: i=1; AJvYcCX/225KoR8yf3N+7foYwO/EwxMucdzkHWx5O5ScrswQG/LFfF3YIis03YTzGe4z0ikJZnhJhwTuVp9S1jWI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/AFdJPDDe22tk0lLbDM+syBCbrfMKwNPeTFMUcA2f7qeGW0WE
	gVFkoRQsI6e/4lKHKk/hmrn0XVLdMgbVPSPow+8ark7AjEyZ52UcPn1/oLUgAliAgPUI1SwNqa0
	lDDVAKWctTBZTp/VI4QiIepfNbMoluy1X4YjxpPDuC72DHOWbTW5H7EsoagVrkKPX/Y7m
X-Gm-Gg: ATEYQzzmtZ59qkGdVh74EV8I4KqL0IRDIfR2cdKTpGc8gfFJxQ6hYrysJjbKMmT1CCm
	RIPquNPZwvo+FTMqzYr00yYbiTS3D96for5YoXOjNb3akymUtg/v9HkxK4IMRDrCr7s/xzk0CpG
	yhsjfPtiZLazsRFxxB62PRYc7Ei/X4gIgP8EavTC6jc2hmf/4/4YQ8Tz0HpKbS/iQiDqQfiowhn
	oXaBsJHeIRdcRKffBQ2Zapts0ZBFWtpPfAD4ooIARSyYGsLh3fpmQvJB7UUvxtq8b9JiraVtu6N
	oVLJdE/iTXZwSh1Rs8wYk14982Ufb1D/eRtMQRURsdHDgLb9xF5P4020ibyOBr4ZAEltSHahZiH
	G20ikJFj3eMwefmQ1TQYXhe4ve8EOasHIj3x4uV42XRPzpGuV
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947661cf.62.1774438427579;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr40947341cf.62.1774438427032;
        Wed, 25 Mar 2026 04:33:47 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871728a19dsm40109145e9.1.2026.03.25.04.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:33:46 -0700 (PDT)
Message-ID: <e03b2cf2-08a0-49c8-8ae6-1651de301a08@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:33:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com, Stable@vger.kernel.org
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
 <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MSBTYWx0ZWRfXwfDm2XQizwua
 JTw3gy7dciuI9m7V+xHfDOpVTAchM0OnFg6TUhWh/PsOTKXJUAjgEEXOxjfepGa+PQZdESNrgFL
 B45JOlCD5dUUu3RIitnQYb1iCaJNVODt2OOwKavZRvzXXBrf4MHtRDtMbVsWKgbP2Pcgo9MHevD
 TBomHLzkIZ0rrHdv5bEkGwDtV0EId635xZTeCWra5xdJJB8qtULI0em5tCe8jzLSJo+CNn+B518
 GyVjVsg+KfNKx/gYY0HPefxGe/S/arPCZc1C1jupn4pluxxkg9y0+590YaX+Xm+9tGbFrMLsjvv
 v9AGC6Janrjc6uqUYFplMFLE5TqaPnW3R5xRrZLaHWf3v8AKXpSYP1ufkzMfB0MLUO1l1KPLjHZ
 jFG2iFfIjOLf8U6V9o8r65MdhSjXEPE8p9GQDB4n3BVZfKAx03cLO1L/X86d37uVpmBlYlYwTmB
 RhLZGORDBUcnO7LHrAA==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c81d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kvLm1XpQD2xK1ocldNYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EyDm-E2Rwbn9XWO9MM1EOIdb7FOV84Az
X-Proofpoint-ORIG-GUID: EyDm-E2Rwbn9XWO9MM1EOIdb7FOV84Az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-99848-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B5AF324355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 6:25 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:
>> As prepare can be called mulitple times, this can result in multiple
>> graph opens for playback path.
> 
>>  	 */
>> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
> 
> This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
> bindings over that and now we're using the DAI ID to index into the

The driver has dai->id indexing the array in most places, and that is
how it has been for a while. This is one of the problem which last patch
is trying to address doing a check on the range. At somepoint we need to
move to dynamic allocation tbh.

--srini
> array (I didn't check for existing instances...).  This might be
> impossible due to system design though.


