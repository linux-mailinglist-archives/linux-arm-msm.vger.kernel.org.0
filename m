Return-Path: <linux-arm-msm+bounces-100784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIbDDjFhymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:40:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3435A660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9359301CC79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084DD3BD65B;
	Mon, 30 Mar 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l589NskL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQPUIz+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1C3B19A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870598; cv=none; b=JL1Nln2K6sA2qoOWkHjrIeNH9QcXcGyMglDDGD/RM7ciXVOUaFdHcgsQPoAGZvjJyGtuBjAtAYYrjiwE9BrrPZNHpcL2N4tmaIl9I22Prdo2YRU5dKoIi8CQDQ5nDauBkGoYMaG9Pl+xoQo4z9sQ09zGOJGA56gDl0KWUZWZeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870598; c=relaxed/simple;
	bh=T1dn9wHB489riF7MurTmJhxp0PCqYbgxWXKPVjNy8Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U19tbotKufksV44MJ5gKshrVejUmsV2bNi0+izDpF5rIN2feWglqLKgD5h+Z2YOGTHUlFz5xgBFkJ+DSijN1shEYwwNOq16NZ5Cs8IVjv/CbfHnc+r8epUdZtQJGDwrNXhWaE/uGgLdwNcSmJWLZxoZFJV0CtJcUaWnwYGv3Phs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l589NskL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQPUIz+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAq0o82723839
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo0OT+HyA+6L1ky9fqEb2u6sfpQ65BpxR4Jv/TYfgSE=; b=l589NskLS03uixVI
	gFC8zcAqnYZn4y2qEsrABivhkH9p/5cZdWQfBfETVhCcper3Ayt7fUScuPvScYPG
	oEw+0vyLZdnsZ5wHFCCmXYYbQUO6kIUMFIvRq4rl4TR/+06+sRP3lXbMWp66WPuS
	irxDFHpkpxKjAtTNivHLyExg92oz1FlO2UltRHQzC8dRt6QeKAkYzPpJL9WjH15E
	HtWfSfwqyTHYF7HSdKt2vdv7pV9mf6HHSkoaXsS6Fk4j8GO+W003pfzQR29oPleC
	kXdXpNjTy6MgEM7SmaK+FkD5hNoYm+FoEbgcPnYZdX97JqGlT7ePny7Xq6Sl5qYq
	SJecdg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0g4f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:36:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12776bebeb3so10652376c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870595; x=1775475395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fo0OT+HyA+6L1ky9fqEb2u6sfpQ65BpxR4Jv/TYfgSE=;
        b=gQPUIz+Lsml8GdzBbQufNp/Hy2dBpo2FYxD6NsQKKeG+f8W1rUCHi/B5x7IF4Aw+85
         4RMdwPY1HpsbnGHC/irTPXRTVsvhAcNz4pGJidap5fetaL+l+7+otMPJhVxRVGUAQrAJ
         AOtHmohFMKeCT/cm0L7cdSBE8CH2sh1TcZnPXjKIp0BfM6WOT5n72WJu4CiQQOLf7usj
         op4+anxPsrosq2rDYcSWGNWJME00t/ArNb3eaRU2iDv7WqBmZfnn3JDRa9nRbbp1lJPp
         OZdLfg7JkV3Z/OvMca5ZrXyavgePYAwQ1/WsJwyUawZzDR49dQNhU0aU8LtHJOt2LZ76
         12BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870595; x=1775475395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo0OT+HyA+6L1ky9fqEb2u6sfpQ65BpxR4Jv/TYfgSE=;
        b=rXxYVqiLKCzi2TleqyncmSTwD9NnDvs5HO0BRkO/3yiXcu0YptK4Qr4Glehf54sFD2
         QDCA2YcEz8XBfmuj0lUV/C+VEkDrRtg9ryNXsBJ81Iw8eFZ2iqr0rWPbbnYHXXc4/0ho
         wBXwLPap6gz0Cjd2nt34/dO6x9dZZNCSEdGVqw/YPxppIY0rQXywAZ/jDW9pwoya+PQe
         XwcL5bMB66649YVTcGc/pMRvU4eFOMEFOmlu36yCI9Vjry0F7yLYlxx1xosn1NMpAHRA
         TdEGT3hDFvsEEn2zDTR2mV/zNg2sgMvNYmaAnMKgxOW1/24maHoCienX/6t1zyAXthTb
         JWIg==
X-Forwarded-Encrypted: i=1; AJvYcCXCRcCRT0Z/thHYgzFrUhUtROVeE5Z9G7ZDMKC08dkBgNP1U8dzl+a6gVO54xldL3gHh7vZt09JOqvUJ4Yt@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGbsul2+Atr5uhJSPyOEx235ukukf5c2SxfOxHPl16x9gr1Rf
	CnLmYPmpW0BSy5d4JkyoQTfvxPPX5GBMCqy8eM4etb+5kKfVjo5HPcx3Vy3+8IyXxgWpQFHwt7M
	d1VFSsSOZ1ecpG1voOiQzAOuFnYpPMd93y9M/lP/zJG/GpPeKKO4hUn8HwHkFk89Re6JD
X-Gm-Gg: ATEYQzyDSU9wYW+4Qj9U4GCCKtF7VEN+HPT7n9uvEb9EcMWQ7XkWW/0nKK14UeZz3V8
	m3F83yHElyfbn8ba+tCii9c6cRiZtcVr0Vc4ASAvYf7n0bZE0sVgEhR+9hIlS0+LddQ0b8kx4dY
	wWAXPTubl8N0Z2C4hof/fbdSIHgGHZPthvBUUJHgCKspXRunZc5hbl1/VW0rS5l88G08AcQbNmn
	zJcSATcq302FX7a+UugyezP4+raXFfT6OX4rI1VR8QFyksPf4wiMp9aFZqGITwGfzpxNr9eGCEr
	Q9OsQeF9AWPhWEq8smQx987wy4ajO8CT6qYE51Nvu313niSShLixDmd4i2stuPJFlyujRiqRUuC
	JPwMNdKS8F5WXqBzO07VWr5xUnDba/qjNJyk+n53mQxywxsoBPRwN7aQ1/H0MMUKu/lzITlaWxo
	joLhk=
X-Received: by 2002:a05:7301:d0b:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c185e2fa35mr6011201eec.26.1774870595421;
        Mon, 30 Mar 2026 04:36:35 -0700 (PDT)
X-Received: by 2002:a05:7301:d0b:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c185e2fa35mr6011183eec.26.1774870594891;
        Mon, 30 Mar 2026 04:36:34 -0700 (PDT)
Received: from [10.110.38.145] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm7213453eec.30.2026.03.30.04.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:36:32 -0700 (PDT)
Message-ID: <c0e8500d-84f3-4d0f-a1d6-8eef20ef2bfc@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 19:36:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
 <7e6a7bdd-a94c-418e-92e6-524a58cdca46@oss.qualcomm.com>
 <iscoaaduakkhs4rpbut6alybigt23vxzezl6o5iemrelkrksad@6fmew7afqogi>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <iscoaaduakkhs4rpbut6alybigt23vxzezl6o5iemrelkrksad@6fmew7afqogi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69ca6044 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-cZVJRYi88NJjIhXCX0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XqLJ6jAA5Mi6FjaNAR6prayRFLbe3zzu
X-Proofpoint-ORIG-GUID: XqLJ6jAA5Mi6FjaNAR6prayRFLbe3zzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfX35SOHMB8hhyT
 pVWujoHKncWDI2Kn44g9rBnLKwZYaaFj/iILiF2qUZ0mFtkyXx2MO7Hb0B2zzVc4Jurb+wnc8qG
 S+IpZhhvDjPd4QQYicI1RcxP4yMq5fmDstiP6CZOhyFtAS+tPPdnUtvBizx26VYz1gnSw+l+GNP
 WKq7sAGd1OlPjqccsALsha/hW0X2siJI12F5TKHX45HWj1stSy1V/9B0yEA8Gbj3nqixQhat5i6
 /s9K6a1jToTBi7S16p6m0Shd7b4EFmIX8aBMox7+hQ8/IlGTsFII3tMG3xuncaUjplpWrFykjBq
 m1pkbCOyELSiD92c7MzluRYGpDfmdtjoCWF21TN7QGqGBD8xabBvdvo6LoKeQFmMFdF6dLCRjZF
 2Pn0QKnwPt+Xm+xhscFFwvLqoTEdGenvjAhXNBoKyl2J5Yng6H8+m4KZbtd2DyG663zgkJkDJQj
 pdL3rSf5j3f86XpJGSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39C3435A660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 6:36 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 05:59:28PM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/2/2025 5:41 PM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Introduce the `mst_streams` field in each DP controller descriptor to
>>>> specify the number of supported MST streams. Most platforms support 2 or
>>>> 4 MST streams, while platforms without MST support default to a single
>>>> stream (`DEFAULT_STREAM_COUNT = 1`).
>>>>
>>>> This change also accounts for platforms with asymmetric stream support,
>>>> e.g., DP0 supporting 4 streams and DP1 supporting 2.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>    2 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>>>>    MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>>>>    #define HPD_STRING_SIZE 30
>>>> +#define DEFAULT_STREAM_COUNT 1
>>>>    enum {
>>>>    	ISR_DISCONNECTED,
>>>> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>>>>    	bool core_initialized;
>>>>    	bool phy_initialized;
>>>>    	bool audio_supported;
>>>> +	bool mst_supported;
>>>>    	struct drm_device *drm_dev;
>>>> @@ -84,12 +86,15 @@ struct msm_dp_display_private {
>>>>    	void __iomem *p0_base;
>>>>    	size_t p0_len;
>>>> +
>>>> +	int max_stream;
>>>>    };
>>>>    struct msm_dp_desc {
>>>>    	phys_addr_t io_start;
>>>>    	unsigned int id;
>>>>    	bool wide_bus_supported;
>>>> +	int mst_streams;
>>>>    };
>>>>    static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>>> @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>>>    	return 0;
>>>>    }
>>>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
>>>> +{
>>>> +	struct msm_dp_display_private *dp;
>>>> +
>>>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>>> +
>>>> +	return dp->max_stream;
>>>> +}
>>>> +
>>>>    static int msm_dp_display_probe(struct platform_device *pdev)
>>>>    {
>>>>    	int rc = 0;
>>>> @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>>>>    	dp->msm_dp_display.is_edp =
>>>>    		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>>>>    	dp->hpd_isr_status = 0;
>>>> +	dp->max_stream = DEFAULT_STREAM_COUNT;
>>>> +	dp->mst_supported = FALSE;
>>>> +
>>>> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
>>>> +		dp->max_stream = desc->mst_streams;
>>>
>>> We should keep compatibility with earlier DT files which didn't define
>>> enough stream clocks for DP MST case. Please check how many stream
>>> clocks are actually present in the DT and set max_stream accordingly.
>>>
>> Now these DTs should already have the MST clocks added.
> 
> I wrote a different phrase: we need to keep compatibility with _earlier_
> DTs. It's called an ABI.
> 
Ohh, i think now got it, will fix it.
>>>> +		dp->mst_supported = TRUE;
>>>> +	}
>>>>    	rc = msm_dp_display_get_io(dp);
>>>>    	if (rc)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> @@ -29,6 +29,7 @@ struct msm_dp {
>>>>    	bool psr_supported;
>>>>    };
>>>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>>>>    int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>>>>    bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>>>>    int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


