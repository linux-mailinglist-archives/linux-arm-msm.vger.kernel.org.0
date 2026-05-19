Return-Path: <linux-arm-msm+bounces-108391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKM+IM8WDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:52:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9D579712
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B4F530182ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955383DD524;
	Tue, 19 May 2026 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYRkfMZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAaUp1Cw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706F3D091A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177165; cv=none; b=hrry0bXvI1VRQVT/WKqeWICXUC/QZEe47vwyv4+pI7E8L33Vuc8i1mQCfpyvBuWmiZw+lSvVp8pnh9gGF2CyUSTJree4JO0KLCO7p/PVe9MjcfSN38+TGYZVamE1LAzXdL6C1iWm3yvZIKM/LSAF700cTS5KGQ+hnOD6cKOttdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177165; c=relaxed/simple;
	bh=rb+HHwrLX0BFcafzTmoFKZ5TXazdeUx1fTJztWx/QZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZnGBR8Mb0uB5iADfeLJ9OysqrbxlDQV2bOhzLQeb79tO1KUX83IJDr10lvmijgz/Pm5VSiEAqpw6IDMQSsAopKyTTp424xOwAuxvpYDImH8EZ7X/9dkcBVSD8lh7+XAuSwtN/pLKyUmJEXWQNYohaRrrRQwhIIT4VFGmFbOU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYRkfMZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAaUp1Cw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1IOlo2975772
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTQX16W7swBYmu2gxJaUk7f96G0XRJAY6//6lEUd/fQ=; b=XYRkfMZWRIsACfhT
	7zqTRink+fcs/Tl1fUCenpF/DtM8aie54CVb5+XAvsE2KI94YNWamEeXnIxUSdrM
	vA975diV8dvAwFJTa3Xfy80C+k6tqeDtPSqADfG7UbnM22qpU0BkC8ocZZF6zRpa
	A4wVWYqURT2iC/6wMhXQf2b6jUZ0nDsn6h5T0loOHXzC7IAhRomzxoglqh7am8ci
	mxh/67+KB3c3+PPeWRd5fKz9fmtMkwkSw+kPjqP6hgJLoVnIW7fqek2TNKP7FQ3t
	VV1iazlxqZVyfM52+KZb3rVnz33ptz9mMhAHDGid5F6i0ialM+pdlBMAsCxLJjZv
	RG/I8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4b9vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:52:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so2707608a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779177162; x=1779781962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTQX16W7swBYmu2gxJaUk7f96G0XRJAY6//6lEUd/fQ=;
        b=eAaUp1Cw2+9t1dV20KcSk0uJmDjuXBAUJV2VdG5yRnt+V4mEe/6jRfMig/icwB5MVy
         HjDwj7fCdHL2maOO2YeEmGxejuWKDj9xTV1kIJyk78qRstXJ3HBtpAq9JIGzKAcq/9Gw
         9w2RSh4dZK5SHDGX45UvRww3rLu7CbVL0w39GAhYIS4MIZu5YCarH1mgUe7q+ZW/W+Uw
         tWB+3fv9uuoMogOLKEkALPKScQmMIVlk/6X8vHk6H7U2B8WI0OTewxyvbntViKoqdKOo
         mDT9bj5xaH5YcB3L+k1vdw1NZ407bw2c6aLXIxbkIDz1WvEpMbG7hEnILDZgltbq0dPC
         QAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177162; x=1779781962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTQX16W7swBYmu2gxJaUk7f96G0XRJAY6//6lEUd/fQ=;
        b=Z/k9c+JI7GrY+8Rt398drITIHg4d01fqVjsMbb0mV3TgJWVq/a5sXe21rVpYA51FJw
         aqQvke8KKk1DmJTha0B6oZjP9PcTsOLGfwL79xvMGAp/OU5Uw2MdtVQ3KJrZKYSrqgHB
         l6JI41Lsd1WKvhUQUVzagGMJGwPOGtXOf4RZJBxVqxeGIwJjKM8H7YOn6LBrcQk5O41U
         RVN3C3LTAxWmkrv+he4TXc4d6DgMYRMY5decK0alp/JCImZXocDziPedQMTxWGOcZoae
         fsiOZcRGHW84Xroj6TTEGfPJdxVpwgZ+M0ibInJ3+vZmgaW+/qq2MghGcLJGqiOXSTPl
         Yewg==
X-Forwarded-Encrypted: i=1; AFNElJ8pGF+uATHOOkLCIWzY1ksrqqhF+sYHMSq1YTLg307LI8kp/PPyKBBjvPjqJQp1yYAnvPBJOkA5usKSj88G@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSCUVqSKJ6VVMKwxJoKKqTGVBKc3ikNGU7yCEiveVJJMLVMWz
	CQysxWRlNp00ZN55nnsaTM6gCqXsaBGLuCzaMqbmp7o3B7I8oCnV07hKNWZ+6VwQQDqjY/IAqsu
	k3loggLZN+C90gV+hQrMdzraQpwWswRbKZb6h8bmpXx8PsBbJIa41Yf0y9tIB1WbJWuKv
X-Gm-Gg: Acq92OFeapqRQ0O4ym0i0WgFji0ob4Zr70MXT5hZ12BjqB426stIi8rhJe9HJfpAsLY
	9if/6x9e36/3cCUPLQFmV/jF2oNmGYqSzPSLAEP3aeQRekzHv1lX5RfwCRKVaPx8syES+41ut7G
	R3B41sSLC20DihtW+8G1ojKtRGgvj3t5m7G01CHHVceba3GEwxfQADmjwIpT4CVTxmiAP0vZfGK
	QnHg5lnmLKYd6L/umhFajR0dN+PUsztvReczty2eL9J3i7Vw9v8QWNx6U4DMwyYncWkECczoQiH
	tEC+e4lZd5D5RgOnLVZgUV3JhDuKxzxJGKyovDV93kk4Asey9xbphiKlcvOiVpxjxaxF9nyPiC6
	kLmIBlG4Pt/wyW/IkoTwA0+Dl3nB/bAhdgTtYO6EmDL3TjMaRO7R79xNL9wIVcJI+8RkazedDgI
	3kWsDm7HBuUzPEIxlHiq5xSh78QKhI
X-Received: by 2002:a17:90b:4b4d:b0:369:d704:d944 with SMTP id 98e67ed59e1d1-369d704f684mr6129619a91.4.1779177162492;
        Tue, 19 May 2026 00:52:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4b4d:b0:369:d704:d944 with SMTP id 98e67ed59e1d1-369d704f684mr6129597a91.4.1779177162012;
        Tue, 19 May 2026 00:52:42 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956527f45sm8028741a91.0.2026.05.19.00.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:52:41 -0700 (PDT)
Message-ID: <09c14a80-d981-4584-b4bb-8fb2430d7a0a@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:52:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/39] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
 <oughavmmvruhnehdpa4e3ptigcb4wndugxazhoeg2yed7ubvgi@aa7wtrz5s6mx>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <oughavmmvruhnehdpa4e3ptigcb4wndugxazhoeg2yed7ubvgi@aa7wtrz5s6mx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c16cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WzSTVGcSt2Wm9MDnWl0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pN34vW94iCkfpazpGK6MuXtCd6d_TIUO
X-Proofpoint-GUID: pN34vW94iCkfpazpGK6MuXtCd6d_TIUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3NiBTYWx0ZWRfX1d1WcovS2dky
 KWy2KulR9iMOoQ5peAQ4BWVazy5jzNwsMKbmxkzuM9PNl4z1DJ8BLcnMg1Ae+JImT/s4ZyTDdME
 GFzmRNRzE8Fnh+4/VjuYNtc2oR9sKWUVNlHajIFR1dTc+K7jV567poqMEKdovUJZFuDSErAOvPL
 RuqIoNkzFgkJr/2xnWf+q9yp0vIHmCDve4+zL935WEv1K8IPUTyMlbmj1V19UvCDpbFKoUvVj92
 TXJ74JvMdlIvc8tjcQUYUb6OclXWXSPi1YSDGi0FnOBLcURffbqYpjdk2N5hhJvulTPCJ9tVw0u
 LTV7UWlLlmJPCgZbUwZ+LI9cPLMNUBTdB8c1eDAMIw1tGNUiO3/obO+dPVBJZVdU7gEbY4VL6BA
 bvX8WvVHda75xt12zYeROS1T/MgUuFG5GzT9+OyHtEU8ux5iBZPwc+qJIBvDnxHKXQHDS06isD8
 qVgCSvT/SM/R2oU5cRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108391-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16B9D579712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 1:38 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:43PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Currently, the dp_ctrl stream APIs operate on their own dp_panel
>> which is stored inside the dp_ctrl's private struct. However with MST,
>> the stored panel represents the fixed link and not the sinks which
>> are hotplugged. Allow the stream related APIs to work on the panel
>> which is passed to them rather than the stored one. For SST cases,
>> this shall continue to use the stored dp_panel.
> 
> Hmm. Why? Can't we get rid of it (in the followup patch)?
> 
In MST, the stream panel is bound to the connector, but in SST the panel 
is still stored in msm_dp_display_private and msm_dp_ctrl_private, so
   dropping it does not seem necessary at this point. The purpose of 
these changes is to allow the functions to operate on the MST panel data 
passed in per stream.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   3 files changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index cd58968d4e14..d0eed8c7df45 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -477,13 +477,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>>   	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
>>   }
>>   
>> -static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
>> +						struct msm_dp_panel *msm_dp_panel)
>>   {
>> -	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>> +	msm_dp_ctrl_config_ctrl_streams(ctrl, msm_dp_panel);
>>   
>> -	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
>> +	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
>>   
>> -	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
>> +	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
>>   }
>>   
>>   /*
>> @@ -2523,7 +2524,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>>   	return ret;
>>   }
>>   
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	int ret = 0;
>>   	bool mainlink_ready = false;
>> @@ -2536,10 +2537,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> -	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +	pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>>   	pixel_rate = pixel_rate_orig;
>>   
>> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		pixel_rate >>= 1;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>> @@ -2571,14 +2572,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	msm_dp_setup_peripheral_flush(ctrl);
>>   	msm_dp_ctrl_config_ctrl_link(ctrl);
>>   
>> -	msm_dp_ctrl_configure_source_params(ctrl);
>> +	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>>   
>>   	msm_dp_ctrl_config_msa(ctrl,
>>   		ctrl->link->link_params.rate,
>>   		pixel_rate_orig,
>> -		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
>> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>>   
>> -	msm_dp_panel_clear_dsc_dto(ctrl->panel);
>> +	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
>>   
>>   	msm_dp_ctrl_setup_tr_unit(ctrl);
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 5d615f50d13b..32196e97cbe9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -17,7 +17,7 @@ struct msm_dp_ctrl {
>>   struct phy;
>>   
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 58c46d5ab4d8..1bf1335712bc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -666,7 +666,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>>   		return 0;
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_stream(dp->ctrl);
>> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
>>   	if (!rc)
>>   		msm_dp_display->power_on = true;
>>   
>>
>> -- 
>> 2.43.0
>>
> 


