Return-Path: <linux-arm-msm+bounces-100969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCB7JN2Fy2l4IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:29:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D23661F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAC52300F151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC4B3DDDBF;
	Tue, 31 Mar 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAYcu7qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOduB52Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BAD3876CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945404; cv=none; b=uL1y4PEwP8JN7k99AVWpWF/OCa+M/AyUx9Y01C8eD7VaJweK3rxyq8rXr1y5UUzPPiua6uDQg1RhQThyVhtJBDpDUKyeTpDv996JYPoki4NN9nUvwI/XHpDN9BPh9frctk7QTmv9pv8KG2MtNcwg/Qqle1+WWajnEWMBxG9dJgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945404; c=relaxed/simple;
	bh=cmnfhE+d/G2ozQx8LZdZGkTWJaD4Xxu806cyyE+WTjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTkRochgDDPg6ZNHzL7sT0Ww3IrmgeerBi7OuM/2EOhT+z8saVWournq+/x7Ba6kYvG43eMY/1EppkOS3TtpR5cUxCEIPTuqkjk8yImw2c5j2+DUU4J0jsdKbTZNP9G6K84BSr8dzqR1c6mstWbCk0BzzV3QXw1g7LoAtuxOoX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAYcu7qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOduB52Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7ol3p430858
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQq1wkGEX+ClBiMhfWlR5FzeIGm8ijkGs4W5JaGUg6U=; b=lAYcu7qakxGiVyjL
	8XBGCUUob2SLtzam9C8y87L6fbi0YUk/d65e9+s9Hof6kl2P35yIucHWo1RbioJ6
	zECkpC+nkcVn95joURvyTW3qpdfZfYOUEwNdeV5RxoMqVVvyHTE8DAMGx2zz2w6u
	HDJMDg7BQwIAaUZW6s5QWDTrNXYFljHszAlmbb7P/DT6o1oTFJm+9AegtAHKPzyb
	C8QoYZ+fnXJe2fG9dxD1W0GC3/HISWr9/XSX3cVKXiIs6bwlwKDmgGX2f0JpSrQ3
	Lk7A9cJORrn9hlAKVD3TD3ponHuqmgHgYRDs6YC4qVB1PcOhOF4LvQwUbwOHr1vm
	fEfGow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfheaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:23:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so20212471cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945401; x=1775550201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQq1wkGEX+ClBiMhfWlR5FzeIGm8ijkGs4W5JaGUg6U=;
        b=iOduB52ZC0k/eDeDxmTWDvwBluG/nQZTjwLEuadnmuNCENtowDJu5gGI3KnyKxAXSe
         lXg6GYEcA0gPhZ/nci4iG30mT6rIC8QjyROucJWQBeU+HGer5QE9LwKxRu4ZgVDt7lds
         6FQsmMvLogGp0wdygRTwv6uXv19c0qwLf6MB9UffJ2dBO6ttGLpyR6KJdpA4Rk0yW1/t
         FIonS0rUKyi3uDK6YXXPV7UiVgzyIoFZrhHHGIJV5VNa14xcjY+Cmb8tMPOsAcLY+O1b
         EiIcAbJfRR7Xn250CLyptU8fr9AmgLhhMnNHdUB/nPxdU1zBI/xEze6l2j0xD/q7pa0D
         Dnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945401; x=1775550201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQq1wkGEX+ClBiMhfWlR5FzeIGm8ijkGs4W5JaGUg6U=;
        b=HdmeA7AabIrnqVYZUX3ba0gxYquqwE+M88gxWWsuEe1JrCJnKNQieFyhjg03bM3yK3
         GuLgmOzfK6v7RToXpIdC31Vaqd4zDubODjQtsTeFzRzirlPrnA1yxmxq7PX0uUNZOAzi
         w+YFjc6GPkdWIYzenEI/kyf67ihuxfRMCk1154bJDQrciACGKVqXnmzwvqy/xGm8aAeU
         uB+ZcemI0nUTM+EusxgSgQGhTHW58PQG1rYtDWGXLKUTnryOXTj0tlgr990K1Ihr69oH
         qxw8UENIRnuxTQNijX67JLt1uYzGOmWD0jOONd9VGyPXJdhOcIrrj0SXj4oHhUjiO++b
         gD1Q==
X-Gm-Message-State: AOJu0YyrFxDw8m+Z4+NJfj5ySeHlmEqyZqslUxMNW5f+AoK9Y3gO4fJ5
	IXgyzocJ4Kv+arak49TJYr/6X3Z0XPMcEqN3wUMbIRdxcOw6ItcTFedzz/dGlPNINgIDcszIeMb
	xfR1YFM8fwCKRZmujCwbKlZubutMGF029A/tfVkn9hto/1GPk+8WpQOKsetVCmQnfx5dx
X-Gm-Gg: ATEYQzwlVU/WaGN2+ISuC/DM4obUvvhXxmX0+YGMtd/xZLsOl+roDmx2Xui3CBTWUqP
	r+ptS8xnLMTkBC/xbVT/2ueYUyVWWdk6SeOp7rmGF9opz0XYgAU9ORU7UTlb3AxLNB3ateiB9Qg
	XANebx33Q9mvOG8KZNxr1TZ/HzW0kDTNLdajJFS30XJwBei53Hhg/VUt9/VWMqKGavgn7r/hHr6
	zHpZh+jqzp8uict/gkWmdcoTTAVXdiHT+y4++Ja78msjiyaZZ4OYxEIcpXR1+TacwPmchkgZo5/
	iJIgWdw6Yh8aapsXkOqQeReVItqY+edImfisTRrPcEAB7IkWh1bhHn28n6Ee2RU0YZGLVUjxSmu
	rUXOfixNbpgPX1dT0qZwD7WZeByaCjOpHWXNW0tXY8zIeECjL0uYAoEy2RBIBxWFaSAm4iAxRiJ
	ET4Ec=
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr159030481cf.4.1774945401007;
        Tue, 31 Mar 2026 01:23:21 -0700 (PDT)
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr159030271cf.4.1774945400588;
        Tue, 31 Mar 2026 01:23:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm1743697a12.25.2026.03.31.01.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:23:19 -0700 (PDT)
Message-ID: <a5608e05-ce8e-42bd-8178-d197e6105b58@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] drm/msm/a8xx: Fix the ticks used in submit
 traces
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-2-2b53c38d2101@oss.qualcomm.com>
 <438fd5f0-8a03-4d86-bc5a-6fd32c7a6480@oss.qualcomm.com>
 <d1122bb6-da47-4089-96d8-9a3e7673fa0e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d1122bb6-da47-4089-96d8-9a3e7673fa0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb8479 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=S_9RJizizuE5VhlQKy8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfXyLAgu+YBR+ne
 SN+EEYJYD1Yy9ZWQnsmNwFi62+4oSB1CNleMzsjZihfFFMNG7wtILUGVuFpFdiSLO7EJtpMuHMA
 BKjB9cF1wmxF352WuZVg4u9rGptI16qGHsYTICsTTh7nS+fSqVSmDOHA1kUDfFBdX3Py+95PWWX
 GmE0jIFO9xBlJhqG1/e4AVW7MsJqQVW6PMeLT8TTnT92/AWP4NgIPa17CufkiaxoSeyvyZW3+jw
 CEpl3aGDUgmVM2t9ZZxt1DuLMVt8EvQUdFInEmtSR8hyljcuIfVkUB0WBJfZgO+A4ji/t4IL5O8
 /eMh8qPOJiroK3vm79p0r9kKIbEeUTfUnrOBjTN2JJIzk3VM66wRipOGVMIHlRt5JX7/+KAorES
 rPSRlKSlsC9K+A9TYCxrZ5ZuTnadjpLLf8P5E7eu0qC21Oh8xpF/IL9nEZmAq+fc5HKlLXDeijF
 iHDIVSv8j0UkVq+Dq/w==
X-Proofpoint-GUID: fPSDTu9YBu8nx-RshexuBp5Mi5laqBSj
X-Proofpoint-ORIG-GUID: fPSDTu9YBu8nx-RshexuBp5Mi5laqBSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 122D23661F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 10:58 PM, Akhil P Oommen wrote:
> On 3/27/2026 5:07 PM, Konrad Dybcio wrote:
>> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>>> GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
>>> register offsets are used in the submit traces instead of A8x offsets.
>>> To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
>>> everywhere.
>>>
>>> While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
>>> counter.
>>
>> Which I assume does not need the GMU to be in any particular state, just
>> have its clocks enabled?
> 
> On A750+, there is a cx timer calibration during gmu resume to match the
> GPU AO counters with the CPU counter. That should be complete before we
> read this.

Worth a comment!

Konrad

