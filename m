Return-Path: <linux-arm-msm+bounces-108699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JikF8WODWoIzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F558BD8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF833017BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB123D3481;
	Wed, 20 May 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjQ/qj4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOuPBDlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D43B0AE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273099; cv=none; b=FMz2M9UHAQz78pyoIJ/PjD8q+1ngbXqMlGBlvy/PiuJIdCjJdfejx/zp/vxr6jZups6K0GQa+eR3DW1Oy3oFVuTMEnzPWTx2EyBYdpINEiAvPXdnEuUdP3D7imp/GmQ5DPALTE5pK53HlaVlRlIHuRd8CcNAivTIwpf9e02KBSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273099; c=relaxed/simple;
	bh=qakm++Qxfsw3BftXjDriuyLuPdXol7P4QCWanM3YoHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYUyppH4ZMZY079FxuXoIuuGf3smc+uwKvWxQkX88AuAGb2hxdXMlAIb0daF9qUEIEJLYYJGSIhWypzpY3knTHnWijTQBJBSjVQMYhKUNoLRPKMxgeN4Hyy1Kn/eSFAY05AGIH2gA3rqJvMf/tyC+dN00EAzsRJkqXBg3Y4p3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjQ/qj4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOuPBDlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lfAX266975
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4Dq226a3Dt2Z7umro/qS9Vqjk6BVNhNKCyQse8jmis=; b=pjQ/qj4gKU2E8o6X
	2qibpa84lOGA1z/Z+dFFT7B7z/zrylF3U7AmDFiFF3t46uxm9TbkprrRUC+SbCbF
	SLakd236sXraqXSj7DMABofbAK3hj3ey91a6s+SO486Zs5EXMgjd9nVmGSknqASY
	/GZgP92KyQzxZZviCoRsSzPyJo4hJDh5CJfymcrjAzuc1zZ9YrBjXxHuqeoxlYKN
	b9qg3n54qaATP9GQGtl+gnwknKW95d1lofsdJtdwoSMv8+FDgQ0NCJYXTd4hBrWZ
	AyTSLiApFrbpUdtp+v7lNKEx6jw/0lRLAedd4rV0E1KoCx/5ZXspveCpB2Tq/4JJ
	wyOa6g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxr5bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:31:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso5758399b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779273091; x=1779877891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4Dq226a3Dt2Z7umro/qS9Vqjk6BVNhNKCyQse8jmis=;
        b=cOuPBDlz8QrAmvS4NyXjocGXzLpaftY/SN/+/ROatNrnI8tuyiSszwycycEVbmnH66
         BKwp67rc6e/1e469sDx0v92GZiq2sihNlQRf38aD9VQn+R4h1yBOyeZVx+Qwh8+pCvsY
         XrYElxsAGv5oKWKtmKh5HYcXiRCfHxGnI74DYysT0FTPCgy+FAMwiODj8yiA8x5hYQ8V
         BDnrvRPc0YN1dy5y9YMgcTRaFamtGJX2U2vVgiY/B3FWHvES8127WSfKC2jHJ7p+ZFMF
         NJNH2HlI3bqac4V0kimwxEEtZyjNfwdrB53dyV7XajFvDMyxTdT7Zxv1fU3NEFO7SoVC
         spOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779273091; x=1779877891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4Dq226a3Dt2Z7umro/qS9Vqjk6BVNhNKCyQse8jmis=;
        b=DWRi6twyS1CTpnb6M8UV0thuHq0M0r6Olb/wChhMyKzje+t6F+JmyifdyBP06SZ/GV
         zC/86Hr6PDL6TVcTNi3Y++f4v2BgiIVf34CmeXU0W/u9f0dVZHr4CMTuURc+Fs8YIlgY
         L+Z0AN1EvD4ZGFHIvCXi1um9VNUescmjtIYlL0vVyf9saZ79iIVP1/BmB26amBzyr0D/
         bmjxC3S1cDP9vTmDIZuX+sFUHgD0rjZgReUbjR8WGhagRBCiT6WNvuFUBHYO8vy1X8+s
         ts/6cIBc51HXoPHoYcstxqcU4w5xlB3Alf3ZTUANZoqMKK3iM86kGSPLQKSgg1TieMNH
         NiDA==
X-Forwarded-Encrypted: i=1; AFNElJ9bGOQs1NVe3lOPejodX7TLNbr+VbDnxem4g/WjreV8UPIbqWxnJKJMHICisJdGLo6AXWtmphVL6BY/FvU6@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuMlS895qDgbQ8UmWVtTqmU0ULZUA0Ukw1GbPFgH+dedvgFmC
	ai6xqn2u2uOWxcLg/hRzNy1BsiHESOmaHfpJjCvXiR3rW8OR14/M55NLJLGmUSe2m7uglILWm5e
	9OSaPQidDxuKucj/PO6/ec7yWmX3EV94jBk/INUd2G3PwA28yGW6nVo/+KTX3pdUavXzB
X-Gm-Gg: Acq92OGaf4gl+LL9Sw9vrJjEv2sBm6CgSXK4cH4OL38BGR7MexkjymBCYPra6S7/WG+
	dPbxtcu0HQ9YsJ5MAqXDhrXf9eVYJrVUz/w4h9MsjeD1wLB+2irvfTT5GKZYQvSfjFXDbE/HZNv
	mycZeDP1zOGJB4WUgEY3VoqgWKZ3+b1n7xa2pbDmKnG+kFXYHuOt9iuE6RlAruFjkbAz1XJezu4
	5vmxRVAWEJDjuPVqTMmTwy7+ZJvfWisX09QhM/gCpLxDqoXzJwO2fqBoGrgSGCKTIWRtDjFBtf1
	Yh0URK5I3qkPR7Hnn5gSMd/HyvgCGhOu5gv42F1pZh3v2AxKCXyZuzeYhqHYpQm1cYJcSdqxpQC
	T4Vu45zudcpvksKlktfTVqPmtUz4MH5hthqCIxuHBLvTikttppJu5bDaGqKthYehJs6kjZ5nemB
	hHxnhrTYQVzUD1jz9lP39MHJ6w3nuL
X-Received: by 2002:a05:6a00:2449:b0:82f:9de6:3b2a with SMTP id d2e1a72fcca58-83f33c4ea4dmr24974548b3a.8.1779273090677;
        Wed, 20 May 2026 03:31:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2449:b0:82f:9de6:3b2a with SMTP id d2e1a72fcca58-83f33c4ea4dmr24974511b3a.8.1779273090151;
        Wed, 20 May 2026 03:31:30 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660f9sm26137010b3a.10.2026.05.20.03.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:31:29 -0700 (PDT)
Message-ID: <272690cf-ca46-4b21-a979-3c89de15747c@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:31:24 +0800
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
 <09c14a80-d981-4584-b4bb-8fb2430d7a0a@oss.qualcomm.com>
 <6b6uc5lk4tsxccwyyqlp4u6sqsv3x3uyu32qmgl63rgb2m4wuz@wjcroowka3zq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <6b6uc5lk4tsxccwyyqlp4u6sqsv3x3uyu32qmgl63rgb2m4wuz@wjcroowka3zq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cM2Dm8PYuxfrBtdhlrpgg4TqbaUqp83G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwMSBTYWx0ZWRfX/29Slbj88gBp
 aZvOAGoQdUfBrm20n77fFo6tbGUYN9Xsr7/pOFX9eJDVO2Uu9gHN3LWZCJYLPe2mf+aZAYS+SMo
 RfwO26VtoRjBXF+Bu5+hMqifmCg6nriR39y5kofaVNg/auzQZFOgDvqgj8GyAVad0Z3BOoGc+hK
 gvm40iIn08paF24BtXzNZakrOVR/jqd0OpYzts39uVPfiOCRBRzlc3HsfdfoXuRoNA/fKhFVxHU
 jMIr2XvxaDSaFE3cPg0g54FpeszSnd/MtFxGohVOf/emToINaD5rn8zVQjyXuWnMpfeYo6aprgn
 omSvn4KUKEwmXPFNiANIFQxXzntQ3KLOL92dgv2QieI0b3FhTVNdP/MFLDo+hmQGLQkoHXZVmGu
 Yx+3vlYlfWi49WGDhFSCVmANzGZZcLxWOLjT5YNt1vvAl/5sdT1dBslBDZhD289sKDqNO6u6UTg
 sKmqarPEZRcRV7PjArQ==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0d8d83 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GPxS-sztI-lhh4Ud1vIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cM2Dm8PYuxfrBtdhlrpgg4TqbaUqp83G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200101
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
	TAGGED_FROM(0.00)[bounces-108699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: CD4F558BD8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 5:24 PM, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 03:52:35PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 1:38 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:43PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Currently, the dp_ctrl stream APIs operate on their own dp_panel
>>>> which is stored inside the dp_ctrl's private struct. However with MST,
>>>> the stored panel represents the fixed link and not the sinks which
>>>> are hotplugged. Allow the stream related APIs to work on the panel
>>>> which is passed to them rather than the stored one. For SST cases,
>>>> this shall continue to use the stored dp_panel.
>>>
>>> Hmm. Why? Can't we get rid of it (in the followup patch)?
>>>
>> In MST, the stream panel is bound to the connector, but in SST the panel is
>> still stored in msm_dp_display_private and msm_dp_ctrl_private, so
>>    dropping it does not seem necessary at this point. The purpose of these
>> changes is to allow the functions to operate on the MST panel data passed in
>> per stream.
> 
> I understand the panel being stored in msm_dp_display_private. Can we
> drop it from msm_dp_ctrl_private?
> 
Dropping panel from msm_dp_ctrl_private would require adding a panel 
parameter to approximately 15 functions in dp_ctrl.c.  Would you like us 
to do that in this patch?
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>>>    3 files changed, 13 insertions(+), 12 deletions(-)
>>>>
> 


