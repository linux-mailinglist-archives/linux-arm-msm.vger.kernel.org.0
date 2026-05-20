Return-Path: <linux-arm-msm+bounces-108651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDzNDMV2DWokxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:54:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDB58A350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44AD430072A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A72A39C657;
	Wed, 20 May 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNeZXWX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQgAktIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC3221A92F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267263; cv=none; b=p5sKsBdXRABF49ILlc37ZCxQp/5QmsM1X79aCf/9CiR8eux6Q0aQJWdTaNtJMwyr3In6h0mUvHG7O9iE1rmXqZRI1RkSmsdPwFWcKCiqm/0TOkBKOdFt+YymFjn/rlW4hZlAi5C2Irxj2zXkOh79GiuQL1fM/5wUwKm+xGn7RPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267263; c=relaxed/simple;
	bh=7An8c9nez3n9dxLsRCedOchskMKrSIkuHi4iVa7MiDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7tyPq/xgSnxIl+pPtPOfnV5uClTsxoh4ab0iI2HiOWmB637l85PPwfl2lu5+7djNNszDZGVVKw9IvIkiIsjvTT8By9psM9q2VSUdhkXrglw9zJ5VoXkySIRvbDfUNIc2X3QnvKD4KILeQyy+RUKleS22qk9bh1xAKCQPm3qNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNeZXWX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQgAktIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7Nuvm1739353
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj56qRj45Q6wqrEcPX6AbsU+eMkJuuBDYfmrRyMaOao=; b=DNeZXWX7x0Rk52O2
	pRXcDPKBfRoUfRpF/VzEBbXLT1cf24oA6sGBtXUlZLnH7N6zgHUCiJ8lk7/xkdLt
	QMQrL3Vm635K+p0XCgxHOB1wBoRDnbxoq4Nl113tpi286CS49+FLKuEqljH3aPXH
	mlxrk+YrUOElqnrxj/44tIimmitx7p0gZ9fQrJXvjOH9trd4fpsBp+sqcQVEIabj
	xR2LIWIzlyu7QK62ennytxiDElUMmhAsrwUru3Sbgoc8w7IKq7AvT+nAQmKWTKV+
	JSl+c4ZyHCSE5imoe3pYI55HeH+2cGm0ou+oHl5dyrg3RmSiYs2NLjQ5J0RKrC1U
	viqFLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbu8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:54:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c81086bf930so3486705a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779267260; x=1779872060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tj56qRj45Q6wqrEcPX6AbsU+eMkJuuBDYfmrRyMaOao=;
        b=gQgAktIzWIB6mearjVPdN3vRCAx0rqR8YIaGxm1XFRJ8XhYP9huc4fUMqTEN2ffoOS
         p/V9X0PNSj1Xe+iMD7tAJMj8rO/WC9G1NRWyRXkHwbjsr25JubEIPmWGqVDEGI+XBQU8
         nQMQ1Osdj+noKDoQb08fLf/XAgIfM95n2uYXE7AMrCCq5oyZtcY4TCKOALkyWMc/c07Z
         B/3yO1RZZLxWqu4LVor7quG/yxeWp2p+PVkhFDBcaoGGASsoRCO48mz7MvNWtpTcBHHc
         XcGxHHj/6R/zQiFxV6ROLQytUGyaLteXOf7Ov3u2otGTsnjAZ4HMXS1eWrmSKLKH05u+
         Wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779267260; x=1779872060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj56qRj45Q6wqrEcPX6AbsU+eMkJuuBDYfmrRyMaOao=;
        b=eVjIGiCZsB1HVqjTvtR2e+hKmGLGtR786Z+3aJYbF/6fOB8Z7VAePiUpSl5nEg1MIH
         Xbvt5O88lZGAZikVn1U8sAyE4UP6wpZULxss6x8w7X32Iprin/q6xJqvtjVm8/yfihHy
         C93+AePlyRITArFT653idtygXXKxccYMko/AUGSsf+sNTdYd2xmwI7yzIcxA7tl5he8e
         azpNQhn+xbvIc+pJ1ii/Yd7OsUe4lK/fUaKHxVhtv9ruxfr2taBmKcKh/EPBqElV9trl
         bDJ85y3zOEKBMe1mowkxJ1Ap9P+dDtS22Vz56AJc8LGuubEJEX93ue5CjlGl9yk4G2Rh
         C5eA==
X-Forwarded-Encrypted: i=1; AFNElJ9TdnJeFbeyZ/Gr960j+8sjjzLvPAo1KImoaj0Kq9N526hM4/ilgXFElGca4SGNrZcPgi0VkZSQflZ9FEKY@vger.kernel.org
X-Gm-Message-State: AOJu0YxqpMgxDcNA74FdOeVMRvPZMfe5cxVw8eA9JWE7/zEhQzob1oCo
	pLjT3monQx0R1wcEpbscIF52YSNdhwZdPcxwoiF54qCyiKElOuXckjrIYPyOL1z8Tu+4A+SbPBs
	mmxvpSSzOqUYKYFzahOCPfPxVprHDz4rkUvS+u86m5/Od7lk9Nb5eDSaodrEifvkT41ed
X-Gm-Gg: Acq92OG2We3wICOxVtoFlO3rxl+GSIIikQTVt4JRYAGe2qdXKDH9YztihfhmizX5+XV
	bkqMzFLsOSh+bfTyoFxgxjx/yZcN6c4dZs+632U7xk1Qactwzun04BCqV9+28+7yMcmUj1kYtqO
	nLjw6ln3ookc05JgSFfTbFhrJnw37KKaO1/+owXwm92qBENVKlVVbN2n52PgM6cH3oJW6wEl0To
	6oyYvglkP0yay4oco1qPJJE2esaIveugPM17vXqtfz7qo+Q7Wr1JY8iHzfxoM6TZd38hCC2uTnh
	sIPTCINTwspCKXYYomjknK5gRVEXFeHh4bF0F8FG0l+juT+bF9XpnIMZCJmC+NwvOMpMoXidA6R
	083B2c+d1Xq+ES5gZSj0VTv6EVoT67LUssmPm+k7tvchU9xKgcCiYHEBf6P/UoiY/OhxnpD9phm
	6J6oNKVJpr4xjY29KjPA==
X-Received: by 2002:a17:90b:4f81:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-3692344690amr23209192a91.5.1779267259571;
        Wed, 20 May 2026 01:54:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4f81:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-3692344690amr23209169a91.5.1779267259085;
        Wed, 20 May 2026 01:54:19 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm17276282a91.17.2026.05.20.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:54:18 -0700 (PDT)
Message-ID: <aae363fc-c3d4-4c00-9ede-1508bea6ebc6@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:54:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/39] drm/msm/dp: introduce stream_id for each DP
 panel
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
 <20260410-msm-dp-mst-v4-13-b20518dea8de@oss.qualcomm.com>
 <4z23aj2mzpgvaoqodncmi47uhydgtrzagh4j7uog565qm2t4in@mrkummd4vp6q>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4z23aj2mzpgvaoqodncmi47uhydgtrzagh4j7uog565qm2t4in@mrkummd4vp6q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oXmKcjtTqt0X0AtAi5BJPO3iKDb60KJi
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d76bc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8Wk7F6lNGgSB0avDr_YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oXmKcjtTqt0X0AtAi5BJPO3iKDb60KJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NCBTYWx0ZWRfX6O90biyaNQ3f
 +TKiJiZW+LVgRarQQTTFV1r9FbC6SHI/gi6dtR+X7o8pr4qSLklSVIlNzIrh1L1HqberGUy4KFs
 r56LzlUs6xSEPbPBHsbLEZ6bI4JFzlgxDEjZ2irpChVT4vD/NRC/RgNYw1od4Qxrayx+FGs4Mea
 4bfN9zWvbG1JASZEaih8ZnoopT0Jdn6hUDzJe9EkCYr+xHZCf+zcVw32Utb1MaKruZZ+yX/k/zC
 9wiIHTjOAVS4C0RvuTjTaom+ToGyFbXLwKu+KC8U9ximBrK13JI//nsRGc54F3XGkkermHUiVPp
 R3GN+YM3DJGIahtvWMQOsfTYPtmlArVD5pipNjx+4PqTAejjfeYJ/fg8tfoZbfWI5HUppwGteux
 xicKGw9V7qv9XdpkoRnMOSrtOoxQBi5bmXuiqHRXz/c5fi7u71xh95w/7o6uTt2O9eOVxLLru2M
 YRAOFw3jhYCJMMY4l6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200084
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
	TAGGED_FROM(0.00)[bounces-108651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 3BDDB58A350
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 2:04 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:48PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> With MST, each DP controller can handle multiple streams.
>> There shall be one dp_panel for each stream but the dp_display
>> object shall be shared among them. To represent this abstraction,
>> create a stream_id for each DP panel which shall be set by the
>> MST stream. For SST, default this to stream 0.
>>
>> Use the stream ID to control the pixel clock of that respective
>> stream by extending the clock handles and state tracking of the
>> DP pixel clock to an array of max supported streams. The maximum
>> streams currently is 4.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>>   5 files changed, 71 insertions(+), 25 deletions(-)
>> @@ -2735,9 +2740,17 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	if (rc)
>>   		return rc;
>>   
>> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
>> -	if (IS_ERR(ctrl->pixel_clk))
>> -		return PTR_ERR(ctrl->pixel_clk);
>> +	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
>> +		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>> +
>> +		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
>> +			return PTR_ERR(ctrl->pixel_clk[i]);
>> +
>> +		if (IS_ERR(ctrl->pixel_clk[i])) {
>> +			DRM_DEBUG_DP("stream %d pixel clock not exist", i);
>> +			break;
>> +		}
> 
> Almost missed it. If it is -EPROBE_DEFER, we must return an error. In
> fact, I'd rather check for -ENOENT (or is it -ENODEV?) and pass all
> other errors to the caller.
> 
Thanks, will fix next version. i add logs change check this, if no this 
stream clk in dts, will return  -ENOENT..
>> +	}
>>   
>>   	return 0;
>>   }
> 


