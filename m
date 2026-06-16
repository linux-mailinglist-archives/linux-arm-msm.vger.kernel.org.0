Return-Path: <linux-arm-msm+bounces-113352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yipXGVQZMWprbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:37:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E0F68D9CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:37:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B8WvfqAM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EDnCp5V2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113352-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113352-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DD9F3011057
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DB940E8C1;
	Tue, 16 Jun 2026 09:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D88366055
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602614; cv=none; b=ByCYqZWtRSgyEkNO5eZoCTU+qT+76oI74vVQ8724Hl7EPYNSrQNNr0Eks11wkcgnoWJK1mrYlVocTYuzo9k80Rh1noUDPzB666x6rNaeYQh7D4l3nIXSd2mOHOJPe7y8etkwryAAuDTLgOGsIpBPTyKfBm16Sj8mDGBEjK8/MQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602614; c=relaxed/simple;
	bh=1n1zN/s1Gd7i/Dmw/+sCETB062jobmIIKkVNKj/fPPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZTIMdOm86YuokYztn4xBulD8mlwr0Ong9wvVTq61TSNjXJcZk9oky3ZZueiTeTtUE1m7kEt7tRX9Qcb70ed7bXWb8bOr1s5tn+txMvnfdgKvL7vxzyS8FFqqXQMTQMPhnDF4PoI4ZagZOuT+EElrpgx0//xLvwoKSRIEbyf6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8WvfqAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDnCp5V2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6PUO32402220
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0Sug0Tsqh/M5PwkF4UUdSLiPropy35fugIaYP0nYAs=; b=B8WvfqAMu/BZWyfs
	n9DKFIcgLbWEBgFb+7HuglD79j0x6B5Hzv9+cpsQ1M1kbpPP0CZRDySIN7Cgsaa+
	SaXGrvXRxGXxNydw4sR1hQPr+aFuUDABzAeNinak7zTn3xjZy6gesVO+u3t9dvMg
	m/C2Glc12GzijzVsCcUEvVYcgnJwo3fmCVhtZKWAZqYmKnmerg0Ybcqu8sm1qlDG
	GVm1Gx/0JK77JLq5K2jJqX+ZiOhpfzIGx3hzaQeBFIqEX1FF/81JquFTE4sAxDLo
	3yFmj4mwIfc3FoQAZoLCmlz/LleZHByDQZBwr+DOa4WplvxjbmhbVQjyAexB6IWs
	/9sLeA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1760svc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:36:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efbfb61so3206031b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781602612; x=1782207412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0Sug0Tsqh/M5PwkF4UUdSLiPropy35fugIaYP0nYAs=;
        b=EDnCp5V2OYxhzsrfRw9Cm1onIYHp5tv6LZsgLPd4xw15WTpq6bnTmSxo1WE3Gn/TsO
         CKxi8QS6ZEDUNqTlCdbFojDrQqOXdPSUWWfOFOnx20kZ8PUUIBpcActhFVpCXpAP0ApP
         cCM9OoDOL35QblT4jdQ+cXAnej4seDwKGhGONZPBRotmAw0Q7MA0irWcm48519E5QP58
         hOqSzFooyR/G/dOED16NOT2kcylAwHw2FQUrqYFrfeCIYlIuDXba4OmTOClJ8VBqwXdY
         RDBREApB29KaGQZmCKW1RagtCH/oCXDszXaFQhNejyzpmnNylPidSQPAK9zj4XjkcoHi
         sWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602612; x=1782207412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0Sug0Tsqh/M5PwkF4UUdSLiPropy35fugIaYP0nYAs=;
        b=co2P/MIbIJhQE4Cmj05JDp4R4zxJbqiSnAaPjE/64ueVQ5S3R2BaEYSJbFUvgxaP8/
         zz/Fy0T1+HJpa68BuNuxIpOR1lAzO4znrkWdoU4JIr34FpIZ1vHyIuZgHphQBrthqFap
         X/9Nodc27NMBSlw/d0du8Kzi2RnLKF46UF7KTS6fMweMjm8oCz5Q6P5WBBVoxX8fvqfh
         FBQuIbrKZet3M1z718+CXf2SahxeOUdDU5MDWA66K2je2ySZbr0QnKCsSdkAjMf8FgnF
         SKuhuYcXNMKr2nk8u2E8DYUxKe+x/cikS6FRMP5Js/Vo1/I8HuWwIuRZbEVLVvartT4E
         DSZA==
X-Forwarded-Encrypted: i=1; AFNElJ+tL9qfeQmrSety/hyRTe7UQXaigtk3fkFpRM3DMxl03OkrotCGcrMfRhtBgmxq96ZXAjm4q1Hg332h3Iom@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31ruT7iVJ1nNUO1m062Rigx2WWabwyTcIwgXK71auGZ6MzzwT
	PQaYCHEKKvAZYI2fcMF2jIqVRWPQ/XIqwfq6OxVI1rUthW6Juix814hF/lvBXY4HVkIlso3lOKh
	pYN4nH9OPVBz98uE4uhkpR/yPtLmT0eRc2jOH3c/7GS9nNqmTbJh6mnkGad+wI4yzO/ZT
X-Gm-Gg: Acq92OEDaO6WD6VFZtHJmau1xhv7zHXWqjPy6aSKKt/JaCk8/joZEPySFS6/A2idWsP
	gQTFJ1rg+ruLmaTH6QuJMNbzAAjeZLfmEHOGKMRFRFv8BKvc9GdL2V9y+MgUZ6pKC4cHqISXX+d
	xqGw1U0M/B4PyMcXOF1lSZqZSmXHXReFPqjWsRr/AAKeNF5847ikujwT0qibWF/NU2Jg+2f1tXQ
	67XhRGQ01TxX7Qz+7WolZoIsPW+QFH0wjnYH+sJxpd5Pf0cA+4NGzE6jRuBD8Zzkc2ApFIdqsAF
	S7FKjct8fvRfHcAU6sD43ON16yM6evQ0jnzsRHgNak0nRvdg6LfxJTc4/cOyqfDRA2Q4yJ6fNvr
	0hcExTR9Jw6Ta6C7ixqWcagLBeLL4Gi+jXbs7b2hn1EYpJmUF6Zt+GTZR53ZyE0IX/IJYEUfmbY
	5kqQXOamc+C2QHjB9H
X-Received: by 2002:a05:6a00:450c:b0:839:12a7:70f7 with SMTP id d2e1a72fcca58-844e1a59f93mr15471200b3a.31.1781602612043;
        Tue, 16 Jun 2026 02:36:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:450c:b0:839:12a7:70f7 with SMTP id d2e1a72fcca58-844e1a59f93mr15471168b3a.31.1781602611570;
        Tue, 16 Jun 2026 02:36:51 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm12300594b3a.24.2026.06.16.02.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:36:51 -0700 (PDT)
Message-ID: <8681a6e0-fa32-46c9-b28a-e5d569a87247@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:36:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/39] drm/msm/dp: add support to send ACT packets for
 MST
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
 <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
 <6jkqen322yklhb4zzoj2kcgwayhcqm3mhnbrkgimr7zubwewao@gmuopu6uxakq>
 <49131a73-f60e-4296-a6d4-5ff59331a9dd@oss.qualcomm.com>
 <hwomujvf4h6hmyk3bu2a26k4ck26aggxbkovf36hdilk72zfcs@c67fzpbpx56c>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <hwomujvf4h6hmyk3bu2a26k4ck26aggxbkovf36hdilk72zfcs@c67fzpbpx56c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t8YMjGE8eNDhoz0TZabsSGVZZKD5s8rp
X-Proofpoint-ORIG-GUID: t8YMjGE8eNDhoz0TZabsSGVZZKD5s8rp
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a311934 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hoFbmsMDQYFultheuLUA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfXxt8ymDTwF7R7
 HhfsJvgIMWOPn8i9cNJMNUcTqL/CV2mLtVExm2pVTXp7CDyVyE8rLhyN2zjabduN3MeUE3d+EE+
 1AFHyGG05DI68TOYZcRnOeF6mAgfyDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfXzaJoh5FpHgW6
 bjBoLGYUwrc6Jvc/zALAyLI/PY15QW8nNQ3x6BO01E2y1VKwYAbeeYJx3uFehK/ll/h5YHfWqN8
 /kindWGSpM2a1D3+gauYJ6zf8Ib3evLJCpRmaEQ9ODb7c4gPQpR571p2qPqcYmUqRLxrXCwyiTr
 PIkZ8h2icZiPNzvxNHz8KTm26zG9o/xCB6eI9PAppsy31Z2Wk2skFlxDdQniqyMf9MsHG6US8XG
 x4toG/DWkT1l5ZbqIiPVSQF1TyGYjtCuEHgi8Zr1fj/cRw8BDFQs0S5LAJkfx+1p6Jm9mxkUL8i
 hdL6yL+ApvNM/HCAkqaYnwtQ8dO7r9C4PosxjIljdngffvApfmC4Z5XR8IfgRUUICc37+rnea3l
 2ro4VEBZiTAQwKRxqA7s1E0xj7QIsFp17YJaG6IIa02sAz9VIkZDyweUJi2Nkgnt5fb5m3ML2or
 4Ah6pSvfo7E8I9/MKOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113352-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: C9E0F68D9CF



On 6/16/2026 8:41 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 04:21:14PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 2:57 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:53PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Whenever virtual channel slot allocation changes, the DP
>>>> source must send the action control trigger sequence to notify
>>>> the sink about the same. This would be applicable during the
>>>> start and stop of the pixel stream. Add the infrastructure
>>>> to be able to send ACT packets for the DP controller when
>>>> operating in MST mode.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 43 +++++++++++++++++++++++++++++++++++--
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>>    5 files changed, 48 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index 1109b2df21be..6f25145ef214 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -143,6 +143,7 @@ struct msm_dp_ctrl_private {
>>>>    	bool core_clks_on;
>>>>    	bool link_clks_on;
>>>>    	bool stream_clks_on[DP_STREAM_MAX];
>>>> +	bool mst_active;
>>>>    };
>>>>    static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
>>>> @@ -228,6 +229,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>>>>    	return err;
>>>>    }
>>>> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>>>> +{
>>>> +	struct msm_dp_ctrl_private *ctrl;
>>>> +	bool act_complete;
>>>> +
>>>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>>> +
>>>> +	if (!ctrl->mst_active)
>>>> +		return 0;
>>>> +
>>>> +	msm_dp_write_link(ctrl, 0, REG_DP_MST_ACT, 0x1);
>>>> +	/* make sure ACT signal is performed */
>>>> +	wmb();
>>>> +
>>>> +	msleep(20); /* needs 1 frame time */
>>>
>>> 20 ms is 50fps. What if we have 30 or 25 fps?
>>>
>> This hasn’t been considered yet. Do we need to change this to wait based on
>> the per-frame duration of the mode?
> 
> I don't know. You wrote that we wait for 1 frame here. Why?
> 
The one-frame delay here is inherited from the downstream code.
IPCAT describes it as: ‘When written to 1, a sequence of 4 ACT headers 
will be sent at the earliest possible time. The field will be cleared by 
HW after the 4 ACTs are sent, which then triggers the READY_FOR_VIDEO 
interrupt.’
So to cover the worst-case scenario, we chose one frame. Please correct 
me if i'm wrong.
> 


