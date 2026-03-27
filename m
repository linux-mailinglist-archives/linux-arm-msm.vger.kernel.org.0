Return-Path: <linux-arm-msm+bounces-100271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJdxA4lgxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:48:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A26342D75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD4CA305C906
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430AF3CF688;
	Fri, 27 Mar 2026 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvDGaJyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQOYR2tZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFAF3DDDB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607836; cv=none; b=fjdpn7p8UTzzCKEAGZXEVzhzFA12KejRGygAEBfibQLQlHDaa7ZiTE/UdhU6Llf+E2dTFtKxYOylXveNiiGw1Z4vS5i0d2uxJf4ZqhtnXXTJJZixj2MQ2mk1xljqOSPylOx4bvQ1zEXahrE9SQEDopb5DeGNd5l5w9GZ7H3RCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607836; c=relaxed/simple;
	bh=2WWz6PCT+kY+/BNdNJEg2/Qme6Ui7DX/fyXIjEpSeh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkwGhazqDyE63XGxYDXCgr5Q+WSg3zDi4LH5TpPnhEmXVDAsscfoqfxLSUeODr7pI7VdiAyCAWh0qsKBXgS4WypeLp71bOWgp936/0HKXxBFEg7VXX5Ia3V/jjm8kXU/zYZHOGP6fVuOm84zSkD8VzIVIGTicnLihNoYfxTrBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvDGaJyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQOYR2tZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsST1226340
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXK+Mf/ZrsGiJRXbh5eHrmVzB3+0zk0auj0U1dEWne0=; b=gvDGaJyqN1zcEZab
	FgSvh2zYseGKWm+h7p84fHOeOhCc2jNBKEbRnOu3dD52bB4B+PeNfdOffGdwKNaf
	ip5zm2EfKzPKlNRbJhTLDpNtZKnxT1JCcuUnbEDS+IzYIyuMvLg2rjCsOI2zunrQ
	ujrNwEXkKp9gqwROuM4Kr5gPHLItgUhN9sOWZsDygdOSQfdnd3gsq+GweNoVT8IS
	UpZSeev8TP3HXtok2lcdJmY5kopMlJgQgLRSGBNTGkH6wrBMBOI2cFPChyA2C8PI
	lBhiYFng2ami4F4l45Ng4rqmBi+s798nN2dOAE0xZ6rx3JcUa7x1AUPu2B/mFAqq
	eN4Jsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b5vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:37:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so6325131cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607832; x=1775212632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXK+Mf/ZrsGiJRXbh5eHrmVzB3+0zk0auj0U1dEWne0=;
        b=UQOYR2tZn47ArJV8TySjAmGY2G7xeyN6AKe+CLdsxG32o7edu/BDOq/eo3oDUqyuLL
         29zcRbb2IFeamB2TMVJgtQ3Uq9J749Fzq8++Y7hk2UttInoNF8hxBZ6PVz2+aFuUbF0R
         2dR77U+R+tMB8C9wlFZRheULPw6FDr1D+ctrgr7NTb4xAsUswYQV5g/T8HQMUH7VsgLQ
         O1G/xspSNCL34k6w2SfmSJ9kLJTf8eNajbTgbEW4ubRr3a66yoqBWa4ntgi/tnTpQec1
         UdiM43C1jKXo3RWXxKcR4FCUspUAgDekDMFOi1UniGNrGcg044m7sqyHy6PHpR+/M+9j
         wRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607832; x=1775212632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXK+Mf/ZrsGiJRXbh5eHrmVzB3+0zk0auj0U1dEWne0=;
        b=YJKSVNWJXHLz4gAYE+Y1ds99mJ3U+zBvwOPhaPBKXaNFAWkvniIKb+mN7t581U0HYL
         PBsh4Oc6FfGD56XeSfPsLHyl4WA6V3V2/Ah7rAzqNiF2TcThPmGpOhF2OodiPpsVoImB
         hL6eyNWdm/N/6G2WCUuu3x6O4XMARRbYCmsN/bf04qibY7LkMCxXPlAbtOnIKZZdhN88
         59rgB6l3jMiyRDx6NsARMX2M+rUgUrWxCE6PyDxrmEFQ4wfyz5sUMcj7ZsOms8gQ7kQ2
         DhEUNtZU2DuPChkqY0cJFfwNoZotx88vGrvWp0bMq0Jt/rcTB+y/oBUMZIkyCBLMrxcK
         ahHw==
X-Gm-Message-State: AOJu0YxaMUrYyblpIEG50QgSbwJ1lmzWvswwSweXsVodLgR6Tt5leqdP
	UBEz7in004FL5w8+6eLJz1FcpdR4ng3lXhuRMeb2YupZUcPQ7lwgN0CLWddz/rAM1z/fWVDjpur
	p5L2JEd5PPWqaab05MQSKBkNPgQFZmUNy2ZOyTz7d3uabaUlI4a2GnFh0ZWkoibYWUT3O
X-Gm-Gg: ATEYQzyZVMtZ9O+JXBNcsnF+OO9j9xG3FmGxc92mBCHVGvXzC7A5NZ746Yf1jW/UfwF
	iftev4w9oLdIlViVFI5kRMlInxqwsJXVXUQReHANzwnJ6ilIttwvxbGK/akWSM6ammONwK/1FZP
	vrpnwQI7oR/8o8zR28TRLuMwiVQHzb8OGoqXMJ91gTGNOnCvHMIz0qzvkt4eVlDMXyMucFdu8Am
	lOnpy9NO7o1lVfrj25fn3UK58B58Up6TCmKCCsgaW/bW7zSev8qspJB8w0JOI9gssyyn5wPILiw
	pfZqhWqL6v7atJ43HZk257GdAiTTZiZph13othqbajVnxc1x4nG3VJ24nGDu+lXnHzxiWPA/cMG
	bqPrUQ1zIEJ9iPTobC6FJMeD4N72JP2JpoXBa3Zl1YD8o4LSHW/N4+i7z159h52JUst6YfbyOpr
	ckXtI=
X-Received: by 2002:a05:622a:17c7:b0:50b:3489:5495 with SMTP id d75a77b69052e-50ba3ab19bcmr16602681cf.8.1774607832099;
        Fri, 27 Mar 2026 03:37:12 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50b:3489:5495 with SMTP id d75a77b69052e-50ba3ab19bcmr16602371cf.8.1774607831654;
        Fri, 27 Mar 2026 03:37:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2044274dsm226449466b.59.2026.03.27.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:37:10 -0700 (PDT)
Message-ID: <4a55d9c0-4138-4905-a736-01b966670a9b@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:37:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] drm/msm/a6xx: Update HFI definitions
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
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-8-fc95b8d9c017@oss.qualcomm.com>
 <30a4cdad-47c0-43f0-9327-04c28eac52ae@oss.qualcomm.com>
 <acea56a0-f854-4415-b4b2-2e320934b6c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acea56a0-f854-4415-b4b2-2e320934b6c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX+ucsH4xybw0I
 77w2kT7khpF0e0GXJwtgnlARhTa8CduxnKZp/VG1FyTxXO9cottql3iHFj/OKZRM1HEYxWue6Ew
 LQUIojqUKFebOIjAFd1Czo8dd8ckXhBCYpY+W97gJ358D6eKO/CsjiVfybvNY3cnPJD/nnaSaro
 bXxHPcrgLEsQBSTmX1A0sFj7BeTguDJfE7zEbscp92RsJb2IqTRh7OZstpTvOqVOYF1pv0dEZY0
 wfkwbrJdjGhL41udUoml/3rX0LQrVmY168udK2LXZodnCb6Pcdztb14yLGgwYTIZ3zBKOfAZ/xW
 jiP34Vlu9hq7zR017hTW4t1rqIPkbSX7uwe9VvaZOYfeO1mb3RV0TpMFbhJQqD7HfzGscBGEJRj
 W2K3e4k0bnXCiQa8hc3s9M7yMRPt1tZ7WAynFEehc3k7Xb4CfsDV+U2+xz80LDyO+vV/U8EWHja
 FhQmXXz3BKy6LyTX03Q==
X-Proofpoint-GUID: z0aGcEUtzz-emfoY8FMiDUtq1HXQ0Poz
X-Proofpoint-ORIG-GUID: z0aGcEUtzz-emfoY8FMiDUtq1HXQ0Poz
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c65dd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oNxwg4Oaq7jLDjx2sdcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
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
	TAGGED_FROM(0.00)[bounces-100271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 91A26342D75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 6:47 PM, Akhil P Oommen wrote:
> On 3/24/2026 3:30 PM, Konrad Dybcio wrote:
>> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>>> Update the HFI definitions to support additional GMU based power
>>> features.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +#define CLX_DATA(irated, num_phases, clx_path, extd_intf) \
>>> +	((extd_intf << 29) |				  \
>>> +	 (clx_path << 28) |				  \
>>> +	 (num_phases << 22) |				  \
>>> +	 (irated << 16))
>>> +
>>> +struct a6xx_hfi_clx_domain_v2 {
>>> +	/**
>>> +	 * @data: BITS[0:15]  Migration time
>>> +	 *        BITS[16:21] Current rating
>>> +	 *        BITS[22:27] Phases for domain
>>> +	 *        BITS[28:28] Path notification
>>> +	 *        BITS[29:31] Extra features
>>> +	 */
>>
>> My first thought would be to define these as bitfields, i.e.
>> u16 mitigation_time
>> u8 current_rating : 6;
>> u8 num_phases : 6;
>> u8 path_notification : 1;
>> u8 extra_features : 3;
>>
> 
> I am unsure if the compiler would mess with the ordering. Aside from the
> fact that this is an ABI with the firmware, what make this piece of data
> very risk is that, these are power related configurations where the
> issues due to misconfiguration won't be immediately obvious.

These are two fully equivalent ways of representing the same data.
The compiler won't reorder them, since data in structs is.. stuctured..

In any case, either of them is fine. The struct definition would be more
convenient to work with if the data was provided in C code, whereas I can
see the simple-u32 being more convenient if it's going to be pulled from
the DTS

Konrad

