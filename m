Return-Path: <linux-arm-msm+bounces-103867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPzXD+Th5mmr1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:33:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49743581D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A9D33010D80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 02:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E626B2DA;
	Tue, 21 Apr 2026 02:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hp4o7VP3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Akw9m9pG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5929195811
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738778; cv=none; b=Aa+13xpmXjr5PDoL1z70WpCf3pEF8DyedVcKtVa2EYeGdUsuApt0ZvnPEisp6pmrBOz1/L6R5ZtPij14k57KJrPEvGak/kER9ku9I5ynpmUHLinT9eAv8ZosG/lrsRusXhmkSIi39lJKL7k+tcSSSsC2WbqTnWGYwnvNOL5XmIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738778; c=relaxed/simple;
	bh=uom/B1n1D/RcDiebfxqB3zYM8U1Pb4fLm/1EWxRnRAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4meMLyb5P2CdfqdUjKtSdleOw7DaAyLJnT874VVYqcpxRfdbR0s5LFWxLFNvwvavjCVH66JLMFNIiDwIRmVeoe5AHezMHNTCPS86vdhQJXQECDt/XueYpOTAFOtF56r390A2Wxa0T1FFL69S5OSs4l7J61dABFQ6nlzi7t33qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hp4o7VP3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Akw9m9pG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJArwL1532092
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKh8R1Dg3Npq11SavjJUrVg6TTb0obZ2ojFct6wX6QY=; b=Hp4o7VP32GlrV1Uy
	wwXYsV4dwoiQepF2QGXbb7CUVNLwwY15E19qeh1muUzcwkGzfUpnHLkNGKBb57FL
	/cCBO5E6gYLK+kN3ASl5+HfsWZcBNRvjbkF8WsQWGa5yxEM6dnsDsbWO5SCakG+1
	iADWnSNxlU2piJLhCt4QaCcn4BnINtVyIJRYyj8c0okSkKAuNwQLBTOSXDaa6ln4
	CR9PKKE6Buw2CGUl0UK7S9gzwxqgWIBnd6ko3bbW7GKJO0klS4A5PhXquPqQUwZ5
	Clftxm5Vojfhn3xDBsSgaT11kiGNWvjaSJ/lCPgho2kfZ6zfI/pqUPfwi5ZLcSbe
	Npl89A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus40ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:32:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so64691545ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776738774; x=1777343574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKh8R1Dg3Npq11SavjJUrVg6TTb0obZ2ojFct6wX6QY=;
        b=Akw9m9pGBz6hFbR3O2n50uXtF2ali/5Cg4kEbHxuQwuZdFLOESjHGePgFMaDZy8sH9
         IwL0pDAiWOmlGOO08H9AC3iTF+nE5cgPBzoJaH5IYVLu+B/i30jbcfyuDcC/yKZHrE9Q
         /glw96a6GzBnIXODAOb9BPuqLsdDNa0bB6aE8aLSBnWRaRE0AmUz/v/FfQi05n3Wi9Li
         X9m9SZAKgfzcDQ5TKFNXT3/aMX2ejL2nbfPBEUuup2LOeNR2qxdPtYLXHMMEzndyn+0t
         QfHonaCHqMoS5ZpZNo+ZwMslCtXW5uEgY94obKFKhmMvHoo2lvMRa0ihTlFhDCSsZww0
         Qo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738774; x=1777343574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKh8R1Dg3Npq11SavjJUrVg6TTb0obZ2ojFct6wX6QY=;
        b=ow59RpdvCqpJYXp5taMPp8bPKQy7i6UwEjbCmikowYkKSzdmYhBu8O/0dQRDKU6b1/
         wVZyedgoy4k0760idfCc6sI+GQXfL/L/3WL6VcR9GMcr2WxRURVQR0e2IM0f0rWrriJ4
         AAlsPt0uVGSbMSjIGmFrJfTd2DJj4hKYA/nearmBjg9ooUyjYObF6kvoso/D2uFmylnX
         jMwQy0cs3QGwTQKDilg0rsjWHmcathyAU28x3r0VGTVTF50/L1UpUETOr8vnxEDeaHJV
         p7nfpG2Wm8hBe/P/BYHJLH9rtqI6mxLiOSPHzxqLAlUifejxgqQHJe77VuNXeL2xWBtp
         e8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9xe0CR0Bx+cWfa1c+SQeEO7wJpdvKaau2L9DQW8r4Du3mdlY6ofblIFiFpfqaoihgkF+yxcvwOCny9Jwwu@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7saUM7EkhiQbFTt/2uYTTESRhDG8Az3kN5BmzqlWX/pTDsPh
	VnSBr2FRezbh9eo6rqBXhKTDDJ6LzKvKahWjc9e0JpQz87iXlmJ5AgDMPsZLGOc1TsRRFBZ1/sl
	CL9Am4DilKvUPE/O6Ft4+xm+uzjqFylLIh5MCwvPHGKcROG0sepbDatB3xs2WOWJIeNh0
X-Gm-Gg: AeBDieuXcqrsKfgq7KuoeM9RCuVY9tzubZe+AwEswFi9BiA18ztqjwNEqJI2qSneMRc
	L2K71NKdPfio0Yv3CdbzdNo1KnBIbt1J9ExrCfm0NUvu8WUqgn9ljS4Inwzqc3uWXWH0Mxri4Gt
	zmiPozLR76A8C8InEtOlhrxf7q0yUUMRbjbkGO84s8Xs7xBM1q79MpFUDQmrAY+JwU01j5D8LFf
	A0igISyPQtpsj2mEOjiUVL2iYqPqRq08Bke6uyml0C7u8T3kvzDMdnFydL8Js02RBC5ShQhXga7
	aL9iSnWZhbnfaXcTMzgJCTiPBDGy7Y4ceruKHaPqlLSOKcdwH4T367ssoxvJd/9m+z0oETkIRgg
	oJ3Ru2VuUHIkVI8LDN45F+pUvdcygEIIDg/cmaqbP8IGM9qrqJKZVK0J5k8TIpanFTwUdDqLLnM
	zvYY3lAa4Yea0P8vlufZupxZMZK4eD
X-Received: by 2002:a17:903:1d2:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b5f9f4e110mr172976645ad.23.1776738774355;
        Mon, 20 Apr 2026 19:32:54 -0700 (PDT)
X-Received: by 2002:a17:903:1d2:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b5f9f4e110mr172976255ad.23.1776738773895;
        Mon, 20 Apr 2026 19:32:53 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2114bsm112678515ad.60.2026.04.20.19.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:32:53 -0700 (PDT)
Message-ID: <f27b39fc-a6c5-4450-93bc-babb7d6dd9a5@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:32:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
 <fffa03f6-82c5-4d87-9a41-19e6f82ec39b@oss.qualcomm.com>
 <vywmtt6p3itkrbnucahzvsh6hpwqbno7al5h5zrqdcf3cejyto@pr4of7o3zdeo>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vywmtt6p3itkrbnucahzvsh6hpwqbno7al5h5zrqdcf3cejyto@pr4of7o3zdeo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyMiBTYWx0ZWRfX5ClKPMLNJyju
 Rplb/c74gehf57NoxkEELbCwBeIspLFmbKTUmQtvdQVF1L8csZejV9XppnPNsXjdJDn2KT+oE1o
 lQl0BMkjYnNUBZ7SA4ghDyWjrOe1XXBCXc4v6ni4TMQSS1T56KPldyV4r/NYgMACcjDwUJiO47b
 jYBPlW7F/yWOJddNJHKk/heY0zdRCXYQz3QiYxtW6jm10Nu7NFl3X5IETHUddalSahaW41jdOzv
 ORF6118qcj9HS6iJknmhnIdeSSC93Y2TlhZZpJT8wp4stL96992FYR6z3eX97o3RVy4QL6B9PSS
 LzUQXMAj28nQI3ZX2UKAaL6M/SEXgfBHfzQ/sXtMc7fJ8QbvEGi8RLmiEoGsVt6G37Zusv/4Zqd
 D9skw1sawAhdkmxmZ0S0Dtm2zV31ca+gWdzdgH8MUsWTHPeA7FeeCLB0jyOY2lntwd0Br3wqShe
 RvMplIspk5JTg4POhdw==
X-Proofpoint-GUID: v9JFLNWkO2cXpbD2GqaFiamhgiXBozH_
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e6e1d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PxGw4gJgEL4GvZwk1AwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: v9JFLNWkO2cXpbD2GqaFiamhgiXBozH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103867-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: CE49743581D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/2026 2:32 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 08:47:09PM +0800, Yongxing Mou wrote:
>>
>>
>> On 3/20/2026 2:36 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 02, 2026 at 04:28:29PM +0800, Yongxing Mou wrote:
>>>> The eDP PHY supports both eDP&DP modes, each requires a different table.
>>>> The current driver doesn't fully support every combo PHY mode and use
>>>> either the eDP or DP table when enable the platform. In addition, some
>>>> platforms mismatch between the mode and the table where DP mode uses
>>>> the eDP table or eDP mode use the DP table.
>>>>
>>>> Clean up and correct the tables for currently supported platforms based on
>>>> the HPG specification.
>>>>
>>>> Here lists the tables can be reused across current platforms.
>>>> DP mode：
>>>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>>>> 	-glymur
>>>> eDP mode(low vdiff):
>>>
>>> Separate question: should we extend phy_configure_dp_opts with the
>>> low/high vdiff? Is there a point in providing the ability to toggle
>>> between low vdiff and high vdiff?
>>>
>> Emm ,i haven't found any platform using high vdiff so far, and I'm not clear
>> in which cases switching between low and high vdiff would be needed.
> 
>  From my (maybe incorrect) understanding of eDP B.3, the high vs low
> vdiff selection should be based on the cable length.
> 
Thanks for the explanation. Maybe we can add this when we really need it.
>>
>>>> 	-glymur/sa8775p/sc8280xp/x1e80100
>>>> 	-sc7280
>>>
>>> I understand your wish to perform all the changes in a single patch, but
>>> there is one problem with that. Consider this patch regresses one of the
>>> platforms (I'm looking at Kodiak and SC8180X as they get the biggest set
>>> of changes). It would be almost impossible to separate, which particular
>>> change caused the regression. I'd suggest splitting this patch into a
>>> set of more atomic changes. E.g. the AUX_CFG8 is definitely a separate
>>> change. Writing swing / pre_emph tables on Kodiak and SC8180X is a
>>> separate change (or two). Switching each of the platforms to the
>>> corrected set of tables ideally also should come as a separate change,
>>> so that in case of a regression the issue would be easier to identify.
>>>
>> Thank for point this, will separate the change.
>> I mostly overlooked SC8180X here, since I assumed it shares the same PHY as
>> SC7280. However, they are using different PHY sub‑versions. Will add proper
>> support for it in the next version.
> 
> Thanks!
> 
Emm, one more question.. Based on Konard's comments, should I split this 
patch, and send a new revision, or  post a new SC8180X patch on top of 
these two existing patches?
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
>>>>    1 file changed, 53 insertions(+), 37 deletions(-)
>>>>
> 


