Return-Path: <linux-arm-msm+bounces-102047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAiUFfuF1Gk+uwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:20:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDA3A9B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 901563009F11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CE1279329;
	Tue,  7 Apr 2026 04:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rs6D764q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fnpoz10p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A5B3126AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775535603; cv=none; b=Nr7OTObdU0StrG17/FXpfC2kUmtVMkHMqy/fvkSyKraFr8tLmPQVHzRLs2/R2ITyBHZQEutSM4YfDxwpg9UbW2DmLT90o6rNCa+KeWl6YtBkDbR6YKXNaRyjxqdqip8AIyVTs6WcZlYtAi/7MoVqswy6Qt/nPjJ/FRPPsZadHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775535603; c=relaxed/simple;
	bh=lgaLo9yN757FY6Mrmxy4IEqVHkJd9X92U0L8L0PjWuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzwVOQOVtfg2Xo0qxLFgBWtxChIUJUMEB9gpjr3/iOCNx0jRxrAcb8CsvmWoYWONJNPbPeZxFX1FRjXDDYjQVls9xJL+FWK+jXaNN6/YhzBz+OpHD8Y55fJs1So32uSlJ+/GZjTZJDBsnBXbSBPGmTZXQ8ZCKzVClO8uNpAoRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rs6D764q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fnpoz10p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ0FJ1403543
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMjcYHeMWpehtP2XPeaMvXYC926mGw75Z/H7Po5iCfU=; b=Rs6D764q3zFbWC7O
	EeHPySPt+xmUInC60QL6vjdjyrF5Haccw7HX6A3NH85Sc9LHh4ARTlrpFRJPnBbV
	XoMXYdsCVkSBp/tzMU6gunt5d8xN4RcVQob7LXoGJ0UcdJ+aW4qi+DaXZOLgv6b9
	u7YOcE/DEmw+KnQtfCTDUA8qtc1Wm3JcuTmb5nIQoB77zY5CPOUeml9awuDurNZM
	7IaAeOP00ui9AoLqnYTn4TWg8ZmycZ+oA5jDGQzT1YLOSZDIfTCEzRNqLXsprk82
	CeVbkEGvt1iSOIAi7zj33h4e3tJEMbtXoRkqtopg546lvNCi9J7IaGqrWECH9gNY
	ii0qJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr88yf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:20:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23af7d7e8so130491965ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775535599; x=1776140399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMjcYHeMWpehtP2XPeaMvXYC926mGw75Z/H7Po5iCfU=;
        b=Fnpoz10pDeC1Q0+GU9mtXHcbyowogVU8TyMJ4GH9OIXWZSFYrwxViqyFo+y/KOBacQ
         tzquczdheWCRs6i1qBX6Lk8KMxKy9BNvSRuXXELNDZwZ2Co/aRtzQzboJBsulaYFa4AL
         jJlpcY+MGO0lu3GE3YLESOw0x2MSfbjuynUPZ/pnwXv/98vbCOTd5eiSIcLsiAZ43TOa
         7dmzDSnFQ22KmE5sHwGHNTMG4gPF7MT90urFT0alFymCAruCaAcaDyw1cVwLMvx4oAPb
         SlscrqKZt3VdPSLMaalV/LMbj4e3BxHzFIbhj537b8xI/fJqacDtrl6BZvresH1WGfMD
         blkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775535599; x=1776140399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMjcYHeMWpehtP2XPeaMvXYC926mGw75Z/H7Po5iCfU=;
        b=fhFThHsZ2chkJSHOFlQhrgiiKofASC929YqLzqFbm1CKZRat61RoKvERkgUHeQrQef
         HwLc2M7pK0PqeH2fKldXUB3dfzQrFb8WD1CRWRHT+lby660+4KSoQho8AOg5RtJ3tA9S
         vrTvNanxRqo7hozUBJbXUOXb3+TfeIGQfUvtVolrtwfUVjL6eFQnNiLUObGbvsfuEzXa
         D1djtKIQ4EA8NLD5ttz4+sK/R1B2V5PqyRDnbaigIRqDCHjTkOug218muBIhWwAiaYmH
         gDUwBrcVStJloiovJnU3hnMJq/ndJzOfV9e16KtP0jLVyfjI+VgMAN1AUeYsjODY6JRb
         pbVA==
X-Forwarded-Encrypted: i=1; AJvYcCWnIoBVMpr5FEIeDAymmkq5eVDNr9mtfhgYUU0VtTh2EneRhggmJ/X5JCS7QG1HErkMZ36JRdB40fEx0s4l@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfjnMtqQUNKYbAIEfamRKQvnTd8TdPF5TDqJWOOhCs9dTli5m
	mnc0X3AVmiNFCmpqgd20Lo4D8cEdQsQLTIH+T5jOwEnqT/EZ3VcbWOZRkFv2EE0l4SKFKJ4cdbV
	k5zg8bsIU6O7p4ovvtgohX6iTD0r1ekQSYjN6FeadGdqMop20QvBI38QqlSZO8Sl6l1du
X-Gm-Gg: AeBDieudoHpvcdoFwCGhblZb/hb1hxSsRGUG3zO+DT2EjIAKHotQOWYjQXJFhNkRLn8
	JT4cHZka4yg9Wtq3WjRlv50b7KJyYeqDbaCV/ougMQZ2U0LWfZjwsfRl0W32u6196jUzea8MxjI
	idVJlboAfo6J8j5L1WbO1hsernf7znV6MuI36JMqB5Kb72UuEbY2GTqZPWoAAc+j7icMunHco6w
	1Wwjw1vd54KIlUxBMoUJs6bwTYKyinV4KObtaPU5GLBvmjBYpHNxiZUjt9FZkSOTu9pSXDg6Mza
	YAqmxH9Seo+Rk3nZM5WhrZbEXOsJLHrZKO5QR72IfmB5B9YgR9ELXCRtg1VhGR+MBM23g1vyqF6
	u4hNJYcAvSlFQwUp4gJ5MBKFqNXW6b+Q/oBryRm72Fbkqh+dQsBuxbM3wkjnIshGOKcmh01kJwB
	Zj6OG7UoB8tc9d9b9Dfw==
X-Received: by 2002:a17:903:b0e:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b28184a5cfmr157747955ad.11.1775535595926;
        Mon, 06 Apr 2026 21:19:55 -0700 (PDT)
X-Received: by 2002:a17:903:b0e:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b28184a5cfmr157747725ad.11.1775535595386;
        Mon, 06 Apr 2026 21:19:55 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbcafsm155569525ad.77.2026.04.06.21.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:19:55 -0700 (PDT)
Message-ID: <f08a3a89-4a02-44a8-a221-0d2d451d8536@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:19:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on sink
 side
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
 <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
 <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EJYdLDNHYQuPBVtBP9vChc5xGadEBrGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzNyBTYWx0ZWRfX29YFONmydGjA
 gVQi/YqB+HmwEED5WelpU67migckLr9gWrhgSdrUYxGWcG+33Q2INW60VDYU9ZSKiZgKMYh9Una
 UvwiadyxGeizqxqDmYq+YPxnYpOXxCeAdTEQWGRWhkcz1ZD2MSgHTm/AU2t/rcVPLBQTxKWKeOg
 UaD6KyEIi1eb6rhIUBLkMUY5SlSunQlHKosyW+5famvzMarQ3M+BdIAaH21cJbpT0B8P11pwruC
 my0ST4Vr44qR8PbGAtjE12iaSHA3RN6L8bX+Qc3PDBg24AyhSFwdFfP/lO0nehqX0rGUXNVvdbq
 L5L/rBkfTSGHFCbRQ8/4Z89NcIckcONgwGE4CxT1T/TxAEjWyW/s8GTfu9HcvnSr54tAEzPGWB+
 BfsWMzDJF0UvMtV583IW38UqBt2aXLY0XCcUj4DSP5FHH/xVHuL2MPBG2MvB12O9gmbgOd32F2d
 Y/JatnDH/TZ9wwzg10Q==
X-Proofpoint-GUID: EJYdLDNHYQuPBVtBP9vChc5xGadEBrGU
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d485f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZS1p3fY0zf-kPy3xB1AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102047-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DCDA3A9B0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 5:26 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:12PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> If the DP controller is capable of supporting multiple streams
>> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
>> DPCD register to enable MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/string_choices.h>
>>   #include <drm/display/drm_dp_aux_bus.h>
>>   #include <drm/display/drm_hdmi_audio_helper.h>
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_edid.h>
>>   
>>   #include "msm_drv.h"
>> @@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>>   	return lttpr_count;
>>   }
>>   
>> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>> +{
>> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
>> +	u8 old_mstm_ctrl;
>> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
>> +	int ret;
>> +
>> +	/* clear sink mst state */
>> +	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
>> +	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
>> +
>> +	/* add extra delay if MST old state is on*/
>> +	if (old_mstm_ctrl) {
>> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
>> +			   clear_mstm_ctrl_timeout_us);
>> +		usleep_range(clear_mstm_ctrl_timeout_us,
>> +			     clear_mstm_ctrl_timeout_us + 1000);
>> +	}
>> +
>> +	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
>> +				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
>> +	if (ret < 0) {
> 
> I didn't catch this up in the previous patches. We have two sets of DPCD
> accessors: the older ones which can return error or the size of the data
> that was actually read / written (which might be less than the size of
> the buffer passed to the function) and newer ones, which return error or
> 0. drm_dp_dpcd_writeb() is from the first group, so if it was
> successful, it should be returning 1. It's all a pain to handle, so
> please start using newer accessors in your patches (the full conversion
> of the MSM driver is on my todo list, but it's intrusive, so was
> delaying it...).
> 
> TL;DR: inside your code please use drm_dp_dpcd_read_byte() /
> drm_dp_dpcd_write_byte() / drm_dp_dpcd_read_data() /
> drm_dp_dpcd_write_data().
> 
Thanks for point it. Will move to new APIs.
>> +		DRM_ERROR("sink mst enablement failed\n");
>> +		return;
>> +	}
>> +
>> +	msm_dp->mst_active = true;
>> +}
>> +
>>   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   {
>>   	struct drm_connector *connector = dp->msm_dp_display.connector;
>> @@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (rc)
>>   		goto end;
>>   
>> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> -	drm_edid_connector_update(connector, drm_edid);
>> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> 
> In several previous patches, the functions initializing MST can
> return an error, leaving the user with half-initialized MST. Are those
> errors a safety coding or do they have some real-use usecase? In the
> latter case, it would be nice to keep SST wokring if enabling MST fails.
> 
After plug in, MST will active when mst_active == true (DP_MST_EN 
programming succeeded). Before that point, any return will continue to 
keep the system in SST mode.
>> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> +		drm_edid_connector_update(connector, drm_edid);
>>   
>> -	if (!drm_edid) {
>> -		DRM_ERROR("panel edid read failed\n");
>> -		/* check edid read fail is due to unplug */
>> -		if (!msm_dp_aux_is_link_connected(dp->aux))
>> -			return -ETIMEDOUT;
>> -	}
>> +		if (!drm_edid) {
>> +			DRM_ERROR("panel edid read failed\n");
>> +			/* check edid read fail is due to unplug */
>> +			if (!msm_dp_aux_is_link_connected(dp->aux))
>> +				return -ETIMEDOUT;
>> +		}
>>   
>> -	if (rc)
>> -		goto end;
>> +		if (rc)
>> +			goto end;
>> +	}
>>   
>>   	msm_dp_link_process_request(dp->link);
>>   
>> @@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	 */
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>> +	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>> +		msm_dp_display_mst_init(dp);
>> +
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>   	if (!dp->msm_dp_display.internal_hpd)
>>
>> -- 
>> 2.34.1
>>
> 


