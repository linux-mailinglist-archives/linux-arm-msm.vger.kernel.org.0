Return-Path: <linux-arm-msm+bounces-104602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJF/GtQB72lz3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69F46D8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769D03002B6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB4636EAA4;
	Mon, 27 Apr 2026 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4om9Dx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1e4TqF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556D2773E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271247; cv=none; b=aBLPS6CQ9vx2HBKkJf9kJQPjAGutXyxGyVvkV6qroPzvodPo2wNs0Qz0IGrgDS3qSC/Sjuxz+X3T1j7OCd4gDPbllgyCOKjea1ZS3iOsFnf3ny0d9aQ9RKE5uc7uoNSVEKCoDortA+/AAb5//Io0ejvbr2LpOhScccdPcxTQ6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271247; c=relaxed/simple;
	bh=azVGLE/YVPhejsEl8yzPRIOQ7hHTxIM/SJ8H4NJkf+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpeX9rCsSrhCnv42cvZVWlOJ2fTTN4/dSRd9Ari1M64kXaz4esn3/rUjLBCor+s0bub+/uZWQQtAf6rNB6++G8K4u7Hgdz73V2AOONmE8od2esAd702xsijAZz210HymRWYbkZsogppTJNlcuTQ7CTX8zVym8PNgW/ZP8F8rKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4om9Dx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1e4TqF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKqCSW1407503
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8v6ZNk8jz+q96s8NrhZi+YHt6CrMseIpQ0gUUPZzY3I=; b=Y4om9Dx6NEsPKB33
	uIIaMhqjw92FegVff8oRSoEPFB59ZfFcHRPPCnXc4I4nRCHZXJac9zfj+Kuk4VWn
	bP0rJUfD30eEv0IuZM2HRHgTwzZuTS9NeC3ZuDt+uzr0zqmZPOB7tC9whPXrVG9A
	DJh1RNEXhWFRI416PylnP7CmueL6g19vwInGi36dHRYidYN6uvK0sqbMoayj+IMN
	xRezKfAWEqoCTR+0M9CtzWRjo/kayE2KDyYjpqHdeqlrHxFMhKkGMRV7b8+QgtF3
	ZRjfA7ZzyH2ux20NBi3KdcfCc31bityAYmIhIKg64YTG1U7e+TB8rH5y0pqXuND2
	sHPAkA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2vp33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:27:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c79907d4c57so3102914a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271245; x=1777876045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8v6ZNk8jz+q96s8NrhZi+YHt6CrMseIpQ0gUUPZzY3I=;
        b=L1e4TqF7kmOgkVR2EFjZuZoWXxCca9zy+nn4TfpGpeLt0g9Go/2jIsyIT/JkPS6NH0
         B5yHSucWimKZwKH8Sn1JqDKOlDDPCboZf6qCP5jnyHQW8nxT3dd5+40CeHr1n2iPAVHQ
         pRP0MqEG0zgSebo2uGd2Rg8u+Fk+fw0THkZxaDeWvy0FUAclyFbWkkzrEqZymbCgsGrb
         qNMQaUfWqgdsGgiAiod8nHFuNctg4Q19xt46oLww0XaFW1DdYO3WTowshyvHlgVlOLE6
         i2wLaH5S5iI0z3pdIO9y8xuolhEg7l4ClWUlj4R6JmAk0H8p+TLyvs8SReNjlhn4Hs+f
         QsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271245; x=1777876045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v6ZNk8jz+q96s8NrhZi+YHt6CrMseIpQ0gUUPZzY3I=;
        b=gPRP37goYo0sL57QL6W+mTvKzAHh4+9rcHcFEkl5eK66S6/XCMZo13LEXevcIbjKxz
         fmHw1qMhqLmIoYHAZx8irn/zjpEYvAtww56EBY0UU2mAFc12WZxinV3l2V6EStn1p83+
         ctvQv7IhTt54DYabeFT/J8V7m+gQn+5UZBlkO8200IfTXifS0TcraiKVa8MqLS5JaHr6
         5bPVYitKbY0Q5s8eTpthQ9A+JjsS0p/dUHm1jzr4egSGr5x4O9wsrBjHpxM//yhTdgFm
         GAd4RxfkASsIIF1BpPbO0/L3xUXIPhLgyNKu3c9mbNjQBC83RaoICsnLMwT69rsAArVm
         F/EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oD/soCFnYVXa+M3jpthPIY6bREfMK4fMypEoujaptb46hlkcELfpZoLAbqOz445hFcRJR522/G/SJmv2V@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/j8MsV0dUnW1MfAsTm2VK5hp3fWjEAKVEwmREUUyGc9bbeLhU
	XpvJAoIfKrQIbFClcRoyhLt0HGe/F/N4nk9Mo+wru66KkvpS0BMXfvXbSxsfDO0WaEy0ICO6WOR
	54pj+9VYUkOoVIlvVuaAuAae+S5YEx+L3wy8M+pn/EzSEYf16Iz9nhJaPHyom9OpdOTd2
X-Gm-Gg: AeBDiev/1KE1UplC9zVYzIrBhGOaHvTpVoDfP5BzgBxqcyApa8s6PVlWyx5gSl214fs
	QCqdCjCnSP0/rj1fU+CvVRecnMQIHULjHpwWH11ujPnfvxQdRULWP78IlLTAMSDpNAQYgsMtQxb
	bw+L/aKJuqYjCxhavZfDC/9RqrviyHTuFQf3+fBWWeYS9w+b1wES4pGoJ2AczF763L2D4iHpeGM
	+OgsPaeSIohkKDLSdlD3Pyf+DIJIw2f1aZlRHy9fhntGQJSMNYCNPcywYMUe6qdcBBHZApo5F1u
	rembPrItfQdtZCfF3L2eLWVy+BFVqleNb1aIklv3nADBr0TVweyF4N0ujFzgMO93tRqLmCbtvlY
	H6aPuX8A6A+tbbJ5suyjXWJsG6i3rixDxBIs46Llx3S+yfpXJwx8/ETSmGEfNBG6OxwL3lUcKQz
	gZwEhn6SqszFD3uL8Lc9SlDFIc2ok=
X-Received: by 2002:a05:6a00:18aa:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82f8c95cdc2mr41270462b3a.30.1777271245369;
        Sun, 26 Apr 2026 23:27:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82f8c95cdc2mr41270440b3a.30.1777271244776;
        Sun, 26 Apr 2026 23:27:24 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d6adbsm38893029b3a.18.2026.04.26.23.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 23:27:23 -0700 (PDT)
Message-ID: <a8f9fe96-1a5c-4eac-8a47-9dc993ced185@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:27:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
 <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
 <ocydv6bbja7z46yjidtemwxtvwyxc4jpmnsc5uz7eorshgr36r@v4e7oo4sgeol>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ocydv6bbja7z46yjidtemwxtvwyxc4jpmnsc5uz7eorshgr36r@v4e7oo4sgeol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zaYYA9qOe3l3_tTGs98o77U2_tBxv3R7
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef01cd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-ojWompm966yaKU_kDQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: zaYYA9qOe3l3_tTGs98o77U2_tBxv3R7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2NyBTYWx0ZWRfX1Mpjk5/0zumr
 4BLXVTKeoot4wqFi6MxXZN+pZroMsnoMmADbSvul4HvePK7wQjwEZ0//kVMotOeCxPKcHyEl+nI
 AjtyFGX+LmMj+BJ/uzEVcmrZCpVB8SMIqWx+R0SfauQDpFYZbkRkywBfXi+t8Ux3edE18GT2Mlz
 3m9i8cDq1L2YvFWgeuuOxq96r4sgMhK/q+TW+Cul9vE1DD7LxOjWI4xLHwO6kPBWJfkmjpAaokV
 penzNZRRodXgq24TWWTY9TGwCQQCslle9TK8rOgzpOWDCDUI3Usj3//l3UnEuSmDThZqtVaPj0s
 M92ZWeH68oFISDrJ/5paLlV9f4HRsXzp3EjJpN9F+iqxXQxYY25VerjPF9aH/u0pnlT7PF5mJjm
 G/PHGhQGwZefGJTd3iq7KrTZ07ZfmfkYf3Qv75DT6/tZCJG06X+HGcrzgREJ8FWABtLcaqfHM6Z
 ITwtBkWVfC3yw39ihdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270067
X-Rspamd-Queue-Id: BD69F46D8B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104602-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 12:41 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 11:28:44AM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/22/2026 6:42 PM, Konrad Dybcio wrote:
>>> The swing and preem settings for HBR3 look OK
>>>
>>> For DP / low-Vdiff:
>>>
>>> .swing_hbr3_hbr2 OK
>>> .swing_hbr_rbr - I don't know. The docs are unclear whether the same
>>> settings should be used for RBR and HBR3, but maybe? There's a
>>> separate table for mini-DP but I doubt there's any poipu boards with
>>> such a connector (maybe some obscure ones)
>>>
>>> .pre_emphasis_hbr3_hbr2 OK
>>> .pre_emphasis_hbr_rbr same as above
>>>
>> Thanks for point this, so pre_emphasis_hbr_rbr same with
>> pre_emphasis_hbr3_hbr2?  I also don't get it's RBR or HBR3 from phy HPG. But
>> now i think only eDP will be used in upstreamed poipu boards. i check the
>> dts and not find any poipu boards will use DP mode(or mini DP)..
> 
> After checking the HPG, could you please actually talk to the colleagues
> who brough up the PHY on those platforms (with the downstreaam kernels)?
> They might know the details not captured in the HPG.
> 
The driver actually existed in the very first upstream version, but it 
didn’t use any tables back then.
On the downstream side, I couldn’t find any 7nm eDP PHY implementations 
either.
I tried reaching out to a few teams, but this platform is quite old and 
most people don’t really have context any more. My understanding is that 
it was primarily a compute-oriented chip, but I’m not very familiar with 
that code path myself. At this point, the only remaining option is to 
try contacting the hardware team to see if they have any additional 
insights.
Since this is unlikely to be resolved quickly, I’d like to proceed with 
posting the next revision first. For SC8180X, it should only ever be 
using eDP mode.


