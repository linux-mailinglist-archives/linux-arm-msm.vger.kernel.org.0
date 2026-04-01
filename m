Return-Path: <linux-arm-msm+bounces-101240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGPtGi6/zGmYWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967B3755E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4852A309968F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EA933B6DF;
	Wed,  1 Apr 2026 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBkCHVyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzamuGKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B962F60CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025857; cv=none; b=lCcpHGjtyphgMvQSswR5FLyoR9bdMKN3jIfTp5QoL6Nv75k7bfzE+h2i68zJJGXE7OAP7N++SYD5Y2WO1oF0zD2ChhTaxjmFls0G+gHIvoajevOciVfF0H8DPKFKOQCk/IPhLbsGFNsFgpnwO36EiHiBgWevGQXNejS2NLo015w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025857; c=relaxed/simple;
	bh=3+Jv6bXwvwJUl4g270Jm6J1dKjWjX7XkZ3sUKW0/Eo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKiggg8b/9zkYKFY4TBD1zLcLetspKe3/MMqj4nk9BZ5adqWdw88F2MZBwyTBP6R7fiHBmAiIM8gGUqvSxx5Dc4qzSG1CmZZaXni2Tr0+8Sj5qVtRtkmF7Ng2WtWhrfl/nUwfbBdI5Dsh0kV8uDwBd4UWmbyeQ4ymbtR/EOTd5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBkCHVyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzamuGKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6311sCbo3081376
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P1UOfcVLyvox+YXpvYwZ0Xngo6w6eE5QVv1oIyIdFE=; b=GBkCHVygRqHblJTM
	b1qGLRcGbg2fOyeRZrpIrWDnOidkpVwVHZcEVOCPjsse4L2Z/BJxKrZXXuY3TIb2
	PeDpXRVLKyzUFQk/T5Zq6s6lGhL9uMiNZ1Rvfb22LCEc4Lkc5F/j1LX+mEAmeafs
	gWdUnF0UufXGQOYU/ADl+NWH1eDtj4LuPVEeWVOXRDlxxCJT8PJYsEPP7PTNWlUO
	JLK4zqTFTpm5d9H12lvd/vKXa46NMe7shAPXR+Q3xtkfRV21pUlmAuenFI5/y1l2
	/Gd84FkWd9mJnqeHLTzQ/CyfPLJ6rL11/qHwKV6hkXQdX+go8HW/4DEnqMjlAtKv
	84HvIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdktn4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:44:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so8384569a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025853; x=1775630653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1P1UOfcVLyvox+YXpvYwZ0Xngo6w6eE5QVv1oIyIdFE=;
        b=VzamuGKGNAqjCOfxjTZmS+2mf6ggJ8VtJR93qjdgTHcsVb/pc5+II1fYfank4ncFAr
         zVa3RBq/Jb0DP5qp+e99yhRN5GO0pGyzmyML8lbrwwgW89Gzjz/r00vByih9sRYOmW19
         n/BDqJL9W1MiDU6eDmejlIQ8HHl3jLApVasQ/BIkZSCpRm6l2KZRfTuUi3a0hEh1tKqO
         RQ63ae4oRgw8QlVN0ZoHbCXZqU7EcgbdJ6VMvq3XkjGMVRjrmziOuugV5IYarw0yNun7
         h8aDLNXXkarSsyMcldFgpdvrp6WzT5JKWl+D5NV7zlRc20EJInPCc+BSeQPHO/XMsN7v
         IB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025853; x=1775630653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P1UOfcVLyvox+YXpvYwZ0Xngo6w6eE5QVv1oIyIdFE=;
        b=MEQkV+YJiuxcG6H8/Y7hMJ1cGPaXRzPOJ3CA5YVe+h1qfd+j/ea+LjJaq3VNM8kphK
         7T5zgIs0tT670Rd6QDTb0UbQOeMh4f2hpmIbL+EzdKYPkXFKuOndCN+NY1NsDQEk8XNq
         quzar+vPLUmXhAmZW2lusvkRCOTdsPXJ7MmpGa5VhF4I5k0J2XriCmz5W5NKu9oegFYG
         FsR4f7gPbqgswcRLk3ijxhql7cLly84EUh/G3DNPXJ6XYLaXJHOmXYXU93/4erFXlpvc
         ru65u5/0WFq/DbjVB9hQFN6ZE17uAV+L8EtMelzK4sndiO+YcsupouiNEW6nuJKSbJbp
         eqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4vsEOkRl6ARqN4ERZwOPjum8wQ6VzME5yzrxu+g3LeZOgR0rOpxMi03Dk8Pi73PQr2nLpJ0RwfIC2e/nY@vger.kernel.org
X-Gm-Message-State: AOJu0YyG87aYazGfAQrHidvAZXoZa/9E9hgvdxP+ZPO/fNSduCVoZgH9
	h6h6yJqmUIy/GD9tgT0okqjUlYsut2euEg5EV5HFGjA0XD5E5VowRiRpRxrVqwmZjnp/h99Yv1M
	BLPLRv3LdVlpRVx45pjNIMfcKCBQpuQKsICJ+FMI2xoEBQtzk9kMMs9AAIv1PlLjyoJs/
X-Gm-Gg: ATEYQzw/3I4wTRyQv05pIohyXbmwhyFwYq93uysAYMCU6KdYKyEQ3eIry8q7NyYDUZA
	+nMpUygG9RZfQIhhdP74ewp4LMoJjNLXUJ7yrleQrbQcn8ZmTAAeCae9cQRR2Swz0zodhzuxhvQ
	2+eQogcomKmrUksHsBOS+vibCV2QfgjtVLTz61pjbSrTEJfku0bgReHAO1yzKYDSKJWllL66Dnb
	SUDiRAHKtsYmqcwE2Fm5hmvbsUQJ9a0EOIyM/9HLrKjF8zklh+ijSsSCaYwh78nYqPp9VqEAfTk
	9xWomtt09Xt/beW7PSLTwozDCTxYQDC7w3l2opDZgRUWGNeMtgDIj0noqDi2rvMtd1g7Hgt6Vzp
	wfcDbjIYojMVc7CsRLmTKg47V7UYarUdOHwxqKWkqIZpYt7Rt39fzp1pjVNEfk8WKJq2Y7dGQ2R
	miI/CIpCHFGRXX78onVQ==
X-Received: by 2002:a05:6a21:3397:b0:39b:e115:f690 with SMTP id adf61e73a8af0-39ef7712ed9mr2506996637.42.1775025853002;
        Tue, 31 Mar 2026 23:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:3397:b0:39b:e115:f690 with SMTP id adf61e73a8af0-39ef7712ed9mr2506951637.42.1775025852464;
        Tue, 31 Mar 2026 23:44:12 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e3d3sm10917954a12.15.2026.03.31.23.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:44:12 -0700 (PDT)
Message-ID: <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 14:44:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
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
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
 <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NyBTYWx0ZWRfX+6qQzzTta4R8
 hl27/1//PaOLiYvBLh+4XLwYN/Q/Ah7CLr3PuR3ou3nn7e92oZdmdIpU8DzM9zOmEr/I829EBtT
 KCNJ/sgW/RABkOgsSlV+dYjxZx4rO9mjt3wq/YmzLZsnVSp6fBzB6Rmejv3XAm5fxsnvAKq5tJ1
 SaTProP6HIfUk9YMUX/1cM77k74FpyvE5wC9m7Y++Ffc9BTjXhXJRxTrC+nMMPfKNgS+6QAj4jc
 zNVTMxGQkiaFwgP5AONGihf7YWF9QIcgfA6Q3N8wxkiuvbFH7bwSaedXGrR0+dK0CakfKbfvGnG
 ZRTHto0mdyDlGAy6gFLIVPL6EtSTtcwYONF6NGFcBEHFyX/Pe/RcZupasFqJVW47YcQTVIBuYn4
 yfc7CxcWNx8uXuFL+e9n01hnUc7IzG8NoG/xx5kbUHABG5xrlof8SjtmlaQmXZG3m7zl/VhUAbU
 Rwn0GbXBD+usVkmHjhg==
X-Proofpoint-GUID: e-BbnBdpLeNn9h5Y2NjAxv8TDEXZL_dq
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccbebd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aNidHKw51tL1cJfPzJcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: e-BbnBdpLeNn9h5Y2NjAxv8TDEXZL_dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2967B3755E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>   5 files changed, 44 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>   	bool core_clks_on;
>>   	bool link_clks_on;
>>   	bool stream_clks_on[DP_STREAM_MAX];
>> +	bool mst_active;
>>   };
>>   
>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
>> @@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>>   	return 0;
>>   }
>>   
>> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +	bool act_complete;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	if (!ctrl->mst_active)
>> +		return;
>> +
>> +	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
>> +	/* make sure ACT signal is performed */
>> +	wmb();
>> +
>> +	msleep(20); /* needs 1 frame time */
>> +
>> +	act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
>> +
>> +	if (!act_complete)
>> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
>> +	else
>> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
> 
> Shouldn't it return an error if the register dind't latch? Also,
> shouldn't we set mst_active only if the write went through?
> 
In some cases, MST still works correctly even when the ACT trigger 
fails; here refer to the downstream implementation.
>> +
>> +	return;
>> +}
>> +
>>   /*
>>    * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>>    */
>> @@ -2079,6 +2106,8 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>> +	msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
>> +
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   end:
>>   	return ret;
>> @@ -2275,7 +2304,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
>>   	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>>   
>> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
>>   	if (ret) {
>>   		DRM_ERROR("failed to enable DP link controller\n");
>>   		return ret;
>> @@ -2355,7 +2384,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>>   	return drm_dp_channel_eq_ok(link_status, num_lanes);
>>   }
>>   
>> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>>   {
>>   	int rc = 0;
>>   	struct msm_dp_ctrl_private *ctrl;
>> @@ -2373,6 +2402,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	rate = ctrl->panel->link_info.rate;
>>   	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +	ctrl->mst_active = mst_active;
>>   
>>   	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>>   
>> @@ -2643,6 +2673,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>> +	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
>> +
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   	if (ret)
>>   		return ret;
>> @@ -2682,6 +2714,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
>>   
>> +	ctrl->mst_active = false;
>> +
>>   	dev_pm_opp_set_rate(ctrl->dev, 0);
>>   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>>   
>> @@ -2849,6 +2883,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>>   	ctrl->link_base = link_base;
>>   	ctrl->mst2link_base = mst2link_base;
>>   	ctrl->mst3link_base = mst3link_base;
>> +	ctrl->mst_active = false;
>>   
>>   	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>>   	if (ret) {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 2baf7a1ff44dd7139d2da86390121d5e7a063e9a..abf84ddf463638900684f2511549a593783d2247 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -16,7 +16,7 @@ struct msm_dp_ctrl {
>>   
>>   struct phy;
>>   
>> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>>   int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> @@ -50,5 +50,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>>   void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>> -
>> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 562a5eccf3f08c5669cc7c2ad1268897e975d0c4..eeba73f81c5ce7929dac88f4b47ac3741659864b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -709,7 +709,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>>   		force_link_train = true;
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> +	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>>   	if (rc) {
>>   		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>>   		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
>> @@ -1557,6 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>>   	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>> +	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>>   }
>>   
>>   static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index a839d0a3941eac3e277185e42fddea15ca05a17f..9442157bca9d63467b4c43fa644651ad2cbcbef5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -21,6 +21,7 @@ struct msm_dp {
>>   	bool audio_enabled;
>>   	bool power_on;
>>   	bool prepared;
>> +	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>   	bool internal_hpd;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index a806d397ff9d9ad3830b1f539614bffcc955a786..de3d0b8b52c269fd7575edf3f4096a4284ad0b8d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -158,6 +158,8 @@
>>   #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>>   #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>>   
>> +#define REG_DP_MST_ACT				(0x00000500)
>> +
>>   #define REG_DP_SOFTWARE_MVID			(0x00000010)
>>   #define REG_DP_SOFTWARE_NVID			(0x00000018)
>>   #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
>>
>> -- 
>> 2.34.1
>>
> 


