Return-Path: <linux-arm-msm+bounces-102038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLvoNsls1GmatwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:32:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA383A91B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1A243008D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712BA37267B;
	Tue,  7 Apr 2026 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPVFLrL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9vtX90G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D8E371D05
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529152; cv=none; b=AXZZMMyi9gcCuDa7sXYO8BalzkayZPGH6U/DCFDEgj4ZrH2Bc5oHZmnLt55luzZE66Kq0bTHycYGsY9A4RdrkkRmZJ/6Hh+3g613LFX51XwgR7/0/nghYHCuQOgt1q8Z22OPuxhqJhdU1kT/9KpD94bvunZbsHQjathq7GWct/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529152; c=relaxed/simple;
	bh=E3PyKcVNuF6MbMAzZrdELaC9OfAq1D2qq4Y7RKbSu4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1iQOxr3BFUC1XJqHeJUde+yFmOfy9jW6qfNwyTqJ6H3JjTE1QAXhhxHNxdB9TIzTYWztCYyW3Gyx9KGTTa1Z8n8ravinslVgr06xo8K2pvr/SY7mc0cpmBsZD0qz9UUT2R68uyuKsifWBQSV3nOjpgoIG/KYyPhudlo06v2AHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPVFLrL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9vtX90G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQM7P493331
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDIJ06XkWqipUKqinNpKfVikyAkuaR1akNIDkorxtNI=; b=FPVFLrL2YSRQga4u
	ItYbNup8NUnlLLEwxwYR06GC58vTp3fKFj7siOeeyns80euFnFYUvLJHYexv69Ol
	Aj3g5c4uh6i2ugOQjtFWIe7ZA9t/v+s4i1CEOfMhBI3CwgFjA5z/qBQ1R/XCDam1
	s4AGCotnnX64q9NmNj8wfzc4vqEQBBImZGdpK8kUC0K9Eqx7Uk/7xPeovkaUuaKG
	/LwfyQtEzYen1LV3IsCoFnrl2PJyTalDNhgrkocj7y0qBhZbMbq5OwSu5bvusRuV
	LIWNavMFMfVfyppMvfsWuND9K9EkLZLGEOCw2ENkDXse+s2MIkDaExdfvjm22Cgk
	PQt9cQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8rnnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:32:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c30b51bfso100665965ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529150; x=1776133950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDIJ06XkWqipUKqinNpKfVikyAkuaR1akNIDkorxtNI=;
        b=X9vtX90GiZSNyIE0PYaS+Dny9gyLcCPd5MmTUvU2DcOPoIyOMaVoZ1XxETKZCU9Uh7
         8vEluVNgQ/YJCtzWe2OLe8Veh0qA8x3/Cto5jmx439F4v2Ha/DubBDdfwasZ3I7U4IkP
         PWipOTPY8YbqisuTUGIxdMO2H9/BbrqHCWy9PGU3y6JJbQXkwErngku5c0IpDtYoLjEk
         3cfhWnkEtYhxPrwSM0/fwUYUTcf2J8hg/exq3jUxUJ0BnjbALcR5r1c2mfaJbLnJD5lj
         y5CpfV7+NAnPyHyww/1D1NtbHsr2YdBS2bvpoKfXFWm9QFl902wm57sA/moS/5o/z6Eb
         EgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529150; x=1776133950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDIJ06XkWqipUKqinNpKfVikyAkuaR1akNIDkorxtNI=;
        b=FjRrl4BQMc+NKM7LU6D5gYHLvvqOYimjd92sUi9gdr20GxPH+Tqyw6hug8w3gXl8YY
         jRByv3iCJt6KGAPRn0HuekktaGBLS1yNC7oKQrR6fVgZhBHDPJW5ZFjebP+WIaqfJV2n
         3ujTgdThWW/wg2m7RazpYuOWBo3Axx86Unz6A+mXoORTQbmRYt7OfPbvXDUW9g6J4/UK
         +Nl2eiGJ5eCZxKt3lvIuXY0pv4od0lmspG92BUyxB3jQpRZwuSFeuUGiwlmB4NVWlbTv
         lVIHk+OvkYdWy+NXAxwB67HwWxcDBTb6KNF5SlpPXs1N2akTlApJPjrES0D4CV7CVCC5
         Bqew==
X-Forwarded-Encrypted: i=1; AJvYcCUI2tuBFUe1/Qds8QMiViO9HQiSUAirqwrRTm2FH+yBnkyfyKh9cfcwVmjIsTSqQNr7RQ6VhwDMIeLFqRUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwXpRaZxWeu7g7A4nZUiMVhzzEA+5fBduVKdWQ47OYowgmTE+TQ
	VUCZi9IRXJenb4EipcGPqpMYdu15vJbzxAuRajV83MnODcjCigWpNcVqEoI0BzPEfm3zObRUkeU
	BkWs7GyuEc3ZOnZVl1CBOip3E/22mCiGzY2/HDgv05Moo2UsYDH2FXYT1ORuxCjnsVL+w
X-Gm-Gg: AeBDiesLDa72OTC2A/zvugrn/fV+3jj97orsqJixjAX4zULtaE6wnLvnwV5GyIp/7y5
	oIU7V75gc4OJqRDgg+LsDP5tnG0RlQu4wlJYLBIOXcrAPcpd1Hlo9Vg8YUmwrHw6TtN1odzeI4Q
	VWHo0vAxhtCpIz6ld3RYuJQ7gWBC/PQDvHh3Mp+qtUHvuALuT4PymP9oxPbJCqTqFL4lZpA20Dt
	7AEyZFiXxnTEOZXMXftm1yKYU5ik7sdSIwP6+1sR0ZBL5iBegDl/+eHO7A0Ddv3ElCtZZyonh+S
	UAR8dbQ/4j2+S6Bf9Bi4oPVYSYZYnarBt1U/vYeZ59O2ZrMaVAADWSr5gdI6HLzSJMzvPkXAZek
	IBRNsx1qrMwonF6zMzUf4pHlGBgiP/0ZQITIqXdqdIhyO9Y0w0C+wI7BSOkVT3QEkCg7AGaHqGw
	zTrqvelLCH1NwiaYAA8Q==
X-Received: by 2002:a17:902:ebc4:b0:2b2:4697:78fa with SMTP id d9443c01a7336-2b28188a80cmr152058835ad.44.1775529149577;
        Mon, 06 Apr 2026 19:32:29 -0700 (PDT)
X-Received: by 2002:a17:902:ebc4:b0:2b2:4697:78fa with SMTP id d9443c01a7336-2b28188a80cmr152058465ad.44.1775529149029;
        Mon, 06 Apr 2026 19:32:29 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3a1asm152554985ad.62.2026.04.06.19.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:32:28 -0700 (PDT)
Message-ID: <10464c59-31cf-44e5-9d7d-68b04ec2529c@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:32:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
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
 <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
 <exfflgjky4zgqa7tnudfteeosncr6nsuwqadxnfftxtjay6hke@fxru2weupuwt>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <exfflgjky4zgqa7tnudfteeosncr6nsuwqadxnfftxtjay6hke@fxru2weupuwt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nizZ6lZ2qfY2g4LuWa-vbHeev04Z5Zzz
X-Proofpoint-ORIG-GUID: nizZ6lZ2qfY2g4LuWa-vbHeev04Z5Zzz
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d46cbe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vb8O4NVuiNdqttNDiRcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMiBTYWx0ZWRfX70OjBMBJFrcg
 ABkxYLE+m2buLVd1s0edAW2ekN3NMr9lhnmUHo4wp3A3+Y7ZMEaEbmbS5XYJ2xfIvk23RbvXvx6
 vqwa8wY0Gt0E/VPjujbllTI4n4x9t6LBQnMNM645d9yv6bdN3aukLjF7JMOOpQ7y+orW+X6wors
 Wx4qSLqfYF8/ISSHNaOj+Wapdb1C0c4X/21AMDIqIXcJgMXXKohVexm/d28sXHiYyQ+v8XqH4gm
 QprP+kaJPG0RszdPhxtisvGOZg4rJLRDmoW5neNLVQiYIMCdtgaBu38ksWAvcWndWYbDhoMmYz8
 EI1VXZhiYnCBGQOgSdlZpsCyUrAjTjkKM4FirXkPubbtwPhJaw8Rz37yzYGGbs+fWOd686Md6dP
 Fh8+Erv29l0JM3xz51wCYZYkdTJM4hAkrc6UU7CVd4oaYA/H8hc5TFTxkrSj/FFEEYvE63mTZ8z
 uHBSjRHJlLDceM0s89A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DA383A91B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 7:42 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:22PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
>> controller as the intf_id is unique for each MST stream of each
>> DP controller.
> 
> I think we have one sensible exception: SC8180X, where we have several
> DP controllers and one shared DP interface, but let's forget about it
> for now...
> 
Sure.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
>>   1 file changed, 44 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>   
>>   static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>>   		struct dpu_rm *dpu_rm,
>> -		enum dpu_intf_type type, u32 controller_id)
>> +		enum dpu_intf_type type, int enc_type, u32 id)
>>   {
>> -	int i = 0;
>> +	int i = 0, cnt = 0;
>> +	int controller_id = id >> 16;
>> +	int stream_id = id & 0x0F;
>>   
>>   	if (type == INTF_WB)
>>   		return NULL;
>>   
>> -	for (i = 0; i < catalog->intf_count; i++) {
>> -		if (catalog->intf[i].type == type
>> -		    && catalog->intf[i].controller_id == controller_id) {
>> -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>> +	if (enc_type == DRM_MODE_ENCODER_DPMST) {
>> +		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
>> +		 * example:
>> +		 * DPU_8_4_0 - DP Controller intf to stream Mapping
>> +		 *
>> +		 * +-------------+----------+----------+----------+----------+
>> +		 * | stream_id   |    0     |    1     |    2     |    3     |
>> +		 * +-------------+----------+----------+----------+----------+
>> +		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
>> +		 * | DP1         | INTF_4   | INTF_8   |          |          |
>> +		 * +-------------+----------+----------+----------+----------+
>> +		 *
>> +		 * DPU_9_2_0 - DP Controller intf to stream Mapping
>> +		 *
>> +		 * +-------------+----------+----------+
>> +		 * | Controller  |    0     |    1     |
>> +		 * +-------------+----------+----------+
>> +		 * | DP0         | INTF_0   | INTF_3   |
>> +		 * | DP1         | INTF_4   | INTF_8   |
>> +		 * | DP2         | INTF_6   | INTF_7   |
>> +		 * +-------------+----------+----------+
>> +		 */
>> +		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
>> +		for (i = 0; i < catalog->intf_count; i++) {
>> +			if (catalog->intf[i].type == INTF_DP
>> +			&& controller_id == catalog->intf[i].controller_id) {
> 
> && should be on the previous line
> 
>> +				if (cnt == stream_id)
> 
> if (cnt++ == stream_id) return;
> 
>> +					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>> +				cnt++;
>> +			}
>> +		}
> 
> return NULL, drop else{}
> 
Hi,Got it.. Does this code looks fine?
......
	for (i = 0; i < catalog->intf_count; i++) {
		if (catalog->intf[i].type == disp_info->intf_type &&
		    controller_id == catalog->intf[i].controller_id)
			if (cnt++ == stream_id)
				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
	}
...
>> +	} else {
>> +		for (i = 0; i < catalog->intf_count; i++) {
>> +			if (catalog->intf[i].type == type
>> +			&& catalog->intf[i].controller_id == controller_id) {
>> +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>> +			}
>>   		}
>>   	}
>>   
>> @@ -2670,7 +2705,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>>   
>>   		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
>>   							   disp_info->intf_type,
>> -							   controller_id);
>> +							   dpu_enc->base.encoder_type,
>> +							   controller_id << 16
>> +							   | disp_info->stream_id);
> 
> No need to, just pass whole disp_info pointer.
> 
Got it. Thanks.
>>   
>>   		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>>   			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
>>
>> -- 
>> 2.34.1
>>
> 


