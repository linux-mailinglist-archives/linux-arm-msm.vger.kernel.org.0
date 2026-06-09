Return-Path: <linux-arm-msm+bounces-112010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ICaLJ6yJ2r60gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E7565CC30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H8fvimJg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kI2RjeZ0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BCEC30A63DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CDC31E82A;
	Tue,  9 Jun 2026 06:27:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8233D6F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:27:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986467; cv=none; b=HY/RHMkRk295Hca6cgVokA/7RRUuF8Hn2Luf6rJ98hn4cVB+owg6cFu9c7ongsZs7ROQY/GBzMahsyw9i4IrlTeqFQA7Z8vEe6pHpioUkMpPndBVCHayfLYiOI+zH1e0kLUriuXRvoSSRTcxDPs2u3EfsZGpceAzGtJ20pidFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986467; c=relaxed/simple;
	bh=6n1D8IRwo6lDg1Dkda8ujcigTa1qASuu3Hnqsq5b94k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcQ6+LWlKQ6qepPm+psHd0sycMXdFmdPKhqCd7y2mksZguRsgcUChyCuHgqYvBxrCx7Q/Eaf1WjZYgrO/5+QC823lTc3yEszlVpsVeTSsSjlFzZghTYd3QHrh5aCm0XnJX5mwfsfOmm9u1X4NGG6F43izdcj94G/dNskxSW1fOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8fvimJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kI2RjeZ0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wvsD1400182
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ha0OMzIFz4oGavhsmpfWitFRwWVvRwRyXxaIfNOHbno=; b=H8fvimJgMTpQT8ea
	rbbJFLJLyFBqeUW4EEjuuZ3+6yezDPLNfeP9U+yXgsbX+PhYPG7w6Yse9FMEhnFx
	xh8wAe5aHtXCabf+s3Rckud9y8cRVn6xuhpbPq68DTegXRsp00HGN/SE3eiQUaKB
	SQk1JXDBhfJ7TwoD2ib/TS2vn3J5S5WUA+5ISJHwRmcCv7knLwxLy1pAYPXWXy7y
	bpSA0YBRKw0xFM1/47V5uEWTdv92L9hGdEGaoDgVYhf59q7vzSfi0+cDapaMwfHH
	CmxCwWHK4ygWKtVbJmB1CB/7HCWhpamGrPjPRp+jeag3Wco8NiQdbBqkIcxLqp9P
	r2M1Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rv3s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:27:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so3915315a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986464; x=1781591264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha0OMzIFz4oGavhsmpfWitFRwWVvRwRyXxaIfNOHbno=;
        b=kI2RjeZ0P5RHu1X4mDMQImpx9pK9oEcxAY53Ee36qn2820utzWci+6FKecgQwwNZS5
         nv8XbxywUG3GcUcPF658IT80wj0if+C0qctyCc6xHaxvdfBVc32JJYafAFUXcI3r5U4j
         QpwwcyTKizzYK9GQOhhlhgsHp6ePa/P4K6h7wzsgkgZ4kLDhBvfXIPfbgszecJS7XQv5
         vGifKfZn0Fo7i8INkVP3EZ6iKAX9GDdJ7ByOUfxMVvpFjGf5HBvnyfAOwv9V/3W62jQ8
         GFa2TNjn2qz8yEMJTQwL40Wq5tcqn0kRQ/cFzo9JYGq2hsrnVg+RHnmHuJYs08Sq+Tph
         9z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986464; x=1781591264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ha0OMzIFz4oGavhsmpfWitFRwWVvRwRyXxaIfNOHbno=;
        b=i9l69XWqKsepIbVROdIR1nguK3TJAKGENhy+k2JVAtAW+FEvXdzKaPuziBolGPONUn
         vbjUUQaqNeVr83vnhPRx8v59fOCxZos2WVDO14PFVwBNjQcSHggBWQbYI9jfOqiIXFCd
         RlQVVzq3bAN2oyVung8AZXibARMA7KQdEDwO5usUN6Vm4p4hPP11VVc5sg50QQVrbTRh
         COUJX+ApjPQmX0hGTtbf8zZWchFRWKHpa0i+0EteFcUq0U1Q5Ikd/a5aW83O4usp7rRl
         t9ViX5lPU4x0nSEw24uvkIeYU20UZ6IJKqg5p9fZEa4tDvknHew+LB5LxIuCAGzpncJw
         PYjA==
X-Gm-Message-State: AOJu0YzgWxrYfDk5LRmiE8pCYsWAOk0+dZnXeql70Z2yCJg4vupe2qCU
	XpScgKjBE7rZwtj0CkR3Bn1qwnVEmVZoWy8jpWc8zrFdvp5falurdTpCqBcnifMx61QgeWajz5x
	pCHKUuZa8wJWVK39jl/1C/PNl8iK1uZFrdEA+qH4aMFaZCF/Yy1W+P3iJPaQW9HZmeOR6
X-Gm-Gg: Acq92OFPgs1UObuGKS29Dk6Sk/67pcUnmQ1nBW36KSHImjkVjdK6oHsKPTAwbnX8bTM
	qjhlqHKjQFWas+QXqt4B3llV3zSgZocOc4fW4LRNeiMM40margwTTP4q96GX1XnBPxmPzqUAYJg
	1NgQcsqTrt94UKQr3Kg+k8qbH1infa1FrY9RhKxljDJxgozlN8UtTrDdo/S2ruKGU1vi2uTxj/J
	Xl/apn5o4k3lIwFDEbKiqIaqM7g/l+omCJq9UytZplzuX72ZeBqtcfibWevUOJKP16dZ/icmVBA
	laGgvG8601k8Ud5+jNEL/S20oJK2WABHse2XpfWlvWMfWItxWIgvax1NxUAvBY9TfJkwQGgM33/
	nbPCOOSBD4xgie9s1VCwXZkI245dCRdaBo+Aj5viK/ooc8CvW/VawvmvPKXivR143MN6g9cpOle
	xum5fDd0If+GLCUIobNbxb7feI5YE4
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr223714705ad.3.1780986464325;
        Mon, 08 Jun 2026 23:27:44 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr223714065ad.3.1780986463390;
        Mon, 08 Jun 2026 23:27:43 -0700 (PDT)
Received: from [10.133.33.232] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm205631375ad.52.2026.06.08.23.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:27:42 -0700 (PDT)
Message-ID: <21e5e1ee-c083-43a2-9f66-cdd07b529111@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:27:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] drm/msm/dp: move the pixel clock control to its
 own API
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
 <20260602-dp_mstclean-v6-7-2c17ff40a9b2@oss.qualcomm.com>
 <d494a62a-2d4b-4406-99f8-cf8775ea4706@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <d494a62a-2d4b-4406-99f8-cf8775ea4706@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YqzdxW05tIdFhDXMniFI2xSiSCjmFPJy
X-Proofpoint-ORIG-GUID: YqzdxW05tIdFhDXMniFI2xSiSCjmFPJy
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a27b261 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iRcVBvsBG4cgb8Ug3_IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OCBTYWx0ZWRfX+5sanlTZDKJY
 szNF4aj+aQ/9I+NyMvNCa5l87oMqNcPKtN7vXU8fYFSXhTB+2o6DIPWuz44YLlwVH7SShFL5wpY
 o8Ku4hUx1XO2dA5hb0nkbll26lhXDYe9lgTodpiotsB2dUg2f4zUG0QvOfDyukcCdkLZCW0KRRH
 RYoGwtgg7co6avOROA+NiR4dKFpn4Ln557mzsGLe157CE7gkNf7CjlJGLGWsrpcTijiP0btu+i0
 g+0U3zD0OtMdYSE7feDzI5pDkqhdPAfbK3Mxv5cB/T8Wc64qFWcMVYqQrM+BEjfkvhY8bSyJ60H
 6sBthdkqFy4s3NHnD38u9ZwQXKIGYcGUYUeUFr4B7y+SZErDcizCS+7XOj5nmM9Nm+aJ1fzBy6l
 YRwfvhLA93TwaXF5M4gNwRyY4u4wAo2UOqi4MzrJGlPN+IjcxG/DUYdaEasNCiGJTrx5N/IL274
 Kt1dlNTlA42fRsFPzBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112010-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27E7565CC30



On 6/8/2026 3:43 PM, Konrad Dybcio wrote:
> On 6/2/26 11:11 AM, Yongxing Mou wrote:
>> Enable/Disable of DP pixel clock happens in multiple code paths
>> leading to code duplication. Move it into individual helpers so that
>> the helpers can be called wherever necessary.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 81 +++++++++++++++++++++-------------------
>>   1 file changed, 42 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1c2eccec6ec6..ac0a2c387f03 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -2171,6 +2171,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
>> +{
>> +	int ret;
>> +
>> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ctrl->stream_clks_on) {
>> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> 
> if (WARN_ON_ONCE(ctrl->stream_clks_on))
> 	return 0;
> 
> ?
> 
> Konrad
Got it. Will update it next patch.

