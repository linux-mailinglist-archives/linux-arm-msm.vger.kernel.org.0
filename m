Return-Path: <linux-arm-msm+bounces-100779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLR1OI1fymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:33:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7DD35A515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F13F3041BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096A7277C9D;
	Mon, 30 Mar 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDgkPzVO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG1I5ZJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91983BB9F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869994; cv=none; b=O8aaI4FZ8y6yzbFz6pXySttXQE/+HBa1NcOPivn2WDb9epEAgZRxcxi0BOArjbkZfWNi9HH2QOv3CSo4dC62vcGueMRoEbme6BBxgBbedPXNeq9JNTp8VML8QIhB2scCCPs6aYfklgFAVr6eV/jIhCvUi3rhgSYowZ3KSzNDC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869994; c=relaxed/simple;
	bh=nuwbVwX+dT7mTTqkTk6T2EzDvrPpUIcfoiRmSWimMtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+IegqVuCEfu/xBDyGS0qvJvZFPSiCPVtV2T9V08uxm2EGPNLW7dj9Fnt/egt3ccKXJ554GojvvCdjKaA6hCfXs9PEh5YaUN09xomkE50lNGfpqt86J56q5btIPqOUVELyCnrL+WPuRqbYn+91vQgXXf4xmHOcj4iN6DCRWs97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDgkPzVO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG1I5ZJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGcru3173906
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9OacODv0jxOnFnHvap4XRUfvTFpgpYUyq/ZZHZUXA0=; b=UDgkPzVOlZfZxCFn
	QvJQ/9AkVsMn6h2/b13qH3kQAvpFmZ0fpBB8sDbGbBU9yMzQ50NENTemuqe15xH+
	bDyslHAkeEoYWzKJsomdij6doHzcymE+dQASaT68GO+lfi/YgQDZzxrvZItgIdyU
	6KjwF0X1D47rF+hdYg4jFCYXtasUZOdh0x7aTHlIx3S1zvFYAsyQu0y6kC7gBRwN
	03qcxTOKNdc4tu++LPZ3aN5XJUOh0wFxfMbuY39unlNgcngZlA8Fpl795Vm7Z/DH
	lhKv0DYtISVEdRBXaDNobWk7/8xgsNWQnKy+VsmH15/XA/057MARmAg1TLPU1Ti+
	iWj/tw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h076b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:26:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127337c8e52so1342797c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869992; x=1775474792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9OacODv0jxOnFnHvap4XRUfvTFpgpYUyq/ZZHZUXA0=;
        b=OG1I5ZJgujn6Wb6jUZFM630BReIRNLiBEfF4DnXQcOx6V1Acxim4D792HvRmtrTQjh
         MhOOF40zMrszNQ1z7Z3ezY9frgo/BKMxT6e2i37WZQ/dEVGAlJwHrvwacCPPBANLjYAB
         +hWXFWmjnr+GpLZg+oCVGXpzRTO4RLn0GJkDtC9VptCw03XmiRYek6m6yKZL2oQBPSko
         tTrLJ7zXQGDD8llhH7fAcdnAWjEkB7SdEwdCW2ejqF/YSgvlJGjFYykIlp79ylbun3Oq
         9rbOfR/DldG64gHJRy91XADj5h2H9UryM1y/Dx6kubo6IE7DIJIKi35jzTOZoJsjfCdK
         K9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869992; x=1775474792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9OacODv0jxOnFnHvap4XRUfvTFpgpYUyq/ZZHZUXA0=;
        b=EJjIgxXqmG+TBzCzJh+jzuKmonWodcOUbVeFWvlL2pyfuJURdI8eaPdgND8C6B9/34
         05JnHjwUlqdNdRBNSqpeso3dsQ0o3KE+0qn9RrrU62uL0W92b56xxfm1hLq/4w1EIfMA
         RCAa0N5pXIzAxmQLs9C+2xLynE75nIaC+m0EjjTtlv8CpeIDrtX9O3vszykV+Drxwhue
         gzPyl0HTVEjTGhwowqdDNEJVPd7kD3kcb/3b1elXxI0gDsWpJQc65KM5RdaSKMo0PW8z
         h2CG4mKM10XHgY66tjUC5uimI1JDmZTMo60kRveDErb26i4YdjxPBufU0Bly3itICwDe
         Tb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWbqwtLzRAvtUfR9zoxmk7O1fkTq7SVb0LiyrMXPq2Mg2KIQETYqcC1TCbPWPU/ha3G4rH4mhPE7qGgur5i@vger.kernel.org
X-Gm-Message-State: AOJu0YzSL5xmLz6lUVQvmQVfddpZAlnM+MspRc+1rwyrMRx9vX5jaSUp
	3RcBLFA+jtuilH0wqJc763XaADoghxdYnc5dmenv28GIitjdYSZkL9bXkYCwFxgHM21GVMl0kbx
	oPTsPzWLi/lgCOwDXTnVYq7T1i+Vu7P9DHF/hZwodelE2a+oq2BtWyndTmuIXznZmQGWX
X-Gm-Gg: ATEYQzw1q5WtWR+ulRUuMsdEhdB0iXYRyyK5QLH5MOvCRC6t5vI++ceMUoN9nyjNJai
	qZ1T3Wha74k0nyAPNzFgWzQQ0i3xHtz3O96piV7aDOya63+DoeANMlmwKM9VMUhZTNmq/wX++Kl
	ccu0nk1eu6Uk46w6QAD8/ep9NommZXZAAsWQZDHc0wazOAMAfqMYhNVy0lV64esnYAlnWTWkUud
	7im6W4/cQc6p0nQ+z6mUZyMbINg4iReSBITFAtiHckY1ZGMZKvLucBJa8rGnjStxugBoaEQzHIH
	lZmvkePqF9Swu5rAG71jEEAl1+wvo7FRY5+VmFjbRwR0gkFxXURyadb0AKzIjLUG1nL/fBjLS9Z
	FW1wO21H0aFUoRXVCPbPtequW7Y/bpQwZenyUXK+q1CQleJ1deT3wG9fdFtG46IuYLBUgZS1GEB
	vR0rI=
X-Received: by 2002:a05:7022:128b:b0:128:c9fa:4c32 with SMTP id a92af1059eb24-12ab28f861emr7327508c88.28.1774869991656;
        Mon, 30 Mar 2026 04:26:31 -0700 (PDT)
X-Received: by 2002:a05:7022:128b:b0:128:c9fa:4c32 with SMTP id a92af1059eb24-12ab28f861emr7327494c88.28.1774869991104;
        Mon, 30 Mar 2026 04:26:31 -0700 (PDT)
Received: from [10.110.38.145] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97e7a57sm9133344c88.6.2026.03.30.04.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:26:30 -0700 (PDT)
Message-ID: <04303789-2473-4030-817e-9a1dce99e6ae@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 19:26:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
 <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
 <e9d15987-7c8a-4ec6-8c65-a882139ba0cb@oss.qualcomm.com>
 <r4dtuhse2v2i33x56fjymlouk4ue4ftj2ff7pt3scsgoknegc2@innzpujxngit>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <r4dtuhse2v2i33x56fjymlouk4ue4ftj2ff7pt3scsgoknegc2@innzpujxngit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfX8dPIccX0am01
 eRjN0vynSuWLC4Pdasa44/63TtGVV7YFr8Xv7V45uGut04OFn08IhUq6zy1f54Zw4718emkf8kE
 QXnY+vaZgHAXHvpWQaO/l5lqTruXOW8Uoo/EjhLFAeVzP+hNqJGbd0a+Yt8hN/GwNbzR4KVQEoi
 WVFcnJb6PHcI5sm0M5C7Nc9s8RhxT5y13B2s2RSH4XrBcz9Ml8I3Tn9mqcMveVKkJJeRp+x94ud
 SNUpqqTo49MZuTUS0mwQ2O+GWcjRHpvXB72YvHeX+U3VPfB1QBcoJqnosXNgRTEzrwuCvzKd3uH
 nP583AzOb+1Mt+0EfZE+O4CSPQa/YdoiXAz8GXXAz+npymSdP6wZlwZgutsPAHjiDGr2umoftfp
 r2kytwVLN8dysfQfZ0fBcz5VpNwOHU+px/gP0pJG/3oS3yVHItIpxwA0FQWlfz2lkPUYE/ay+Xv
 rWavc03PlVjZxWpLWNQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca5de8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_li15neZe1v-_mplcrYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: gs6XoFpMO0ySw1IAQOFgVEYyIxcnAzZg
X-Proofpoint-ORIG-GUID: gs6XoFpMO0ySw1IAQOFgVEYyIxcnAzZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 3A7DD35A515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 05:00:56PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 1:28 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:51PM +0800, Yongxing Mou wrote:
>>>> The DP_CONFIGURATION_CTRL register contains both link-level and
>>>> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
>>>> all of them together, which makes it harder to support MST.
>>>>
>>>> This patch separates the configuration into two functions:
>>>
>>> git grep "This patch" Documentation/process
>>> Got it. Will fix it next patch.
>>>> - msm_dp_ctrl_config_ctrl_link(): handles link-related fields
>>>> - msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields
>>>>
>>>> It also moves the link-related configuration out of
>>>> msm_dp_ctrl_configure_source_params().
>>>
>>> Why? And it looks like a separate patch...
>>>
>> Because the patches following msm_dp_ctrl_configure_source_params() will
>> take a panel parameter, and lane_mapping and peripheral_flush seem to be
>> more closely related to the link, they have been moved out.
> 
> This still looks like a separate patch.
> 
Sure. Will update it next patch.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
>>>>    1 file changed, 31 insertions(+), 18 deletions(-)
>>>>
> 


