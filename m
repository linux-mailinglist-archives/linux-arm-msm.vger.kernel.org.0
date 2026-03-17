Return-Path: <linux-arm-msm+bounces-98155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHY6H4dAuWmB9QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:52:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4852A9433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF703045675
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B081C3B0AF5;
	Tue, 17 Mar 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBaf7bq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/4YcaGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36CC3AE1BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748350; cv=none; b=V0iy1ZDbwZ6Dvf+HzNSCoPe8oMkSzH167BnCGYRJ3glWN8IjhfBUV2HrAXUX2HhYzOEiUguyMJILG7hVRBS1IUaM99WRiUC2SFGDPobj9eGoIr0yLm0NizKJXQpuXsIfmCErAWgDiZ+I6Ob1qtk32xW4Z7FKuWDIyBHV75spSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748350; c=relaxed/simple;
	bh=eAHQloBTSSj1F6feGo0j5LkDWh18lo9fPIzeWrdxtnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U73aB7Wf6Z7zarihyM0ycEFlQWsI2baCe0IUeFNXHwXyv0mX3d8g6sgXhMG1BH14Adaq4S+RwLciTOVVsLiTSznEL9YCGRw0BHkaUPCS4ga9Y9xpe1cTv7LJd2M4O8jld+jjr6QJGp4DMLAY+yvdJFH9j7gtTaU+VC8FKEoGKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBaf7bq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/4YcaGt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA3MGF2072294
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eosohSFi3Dz1sqfuINtAzY5KQfNJfuUSLh38zg2d91w=; b=ZBaf7bq4g7UqvYM/
	eJqtwzJnKWJkUHCscoaX3NkVvhISC62QtK1229JvWzK2tmIurr7hXWJwJZs5nFwB
	v/E2h7dLstxcDCRznp5alGGbd8AWeELeZgq2QDkBkM849bqxlw7hJigL/aboWcp4
	z0Ql/LE3Zqq4aXH9SKHxRxTlR3da/uFBBBjkuF8TZNOr4ZsHubE/NgXJ73wqJ1iY
	vZ81MV4DvqEStQ1KIz9XrcoLRjM7df/OGZZCSkX0DScZeLcJBDA7YZTLdxL8Tro9
	Yt+ofkyjt0Y8ktEoEL63J+pint8mzQLnmB3Uh7LNJbKfxzNs1kQQegYseC7EtSM6
	EDyZDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rat6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:52:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd97debc51so426966885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773748347; x=1774353147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eosohSFi3Dz1sqfuINtAzY5KQfNJfuUSLh38zg2d91w=;
        b=j/4YcaGtWkDbIMWvFG32g0VaSwoZMl+SsztKPM6gopFltegRGUg1a/Dyve+/kxNFgm
         /LiYDZJcENE+itevcMNBO9Lgq6rwvdh9ppTEzLqlD2IreokL0UYPesVypYLVL/6Oy50b
         YumOB0yWf/xgSffaPK4rMe4ezFb2JjNC+URnnCkwVriFewXwoaRv8+I65QwCyQWP5uWq
         z3MjdpEz4bHkLAc+cKDKm1ykqwIV0NzQo0dOBhuOpCW/WGcPi7MdBv1eNQUIO0szepgb
         JBEp6Ey8mgbh8tNbvjVNAwEtohsqCdeIPzUBg/DDC5aGu7SW3zg7T37EnIYBDYbqMb9I
         pVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748347; x=1774353147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eosohSFi3Dz1sqfuINtAzY5KQfNJfuUSLh38zg2d91w=;
        b=fGSKwiHBKJD8N+98BmvU4+UAAXd+YXSJJswbnv0NzppzeWHPKhL5f4xBgdwsSYV3Mg
         gBupMkcv0odFb9bKctPX5gBmLsOzMAkwvOKlVp5vMt/ZtpiDx73clgg8pr6XNTnGuyGy
         1/dcIxsQS5WSq1MX+pVu8kzDzYHmI7rCG9OCdrC+xR5JaSRHZAXYCT0liW8cQCe59BOY
         AYoHtqHXAOG3jkGJLgVN9xYn8o6GjidiqIjDaeGfk13ta7LtUDuacRaG88EdwPJq5l3l
         yOqz3OSdF7pIZLZrUgTtcbTVUsVbL7khrUt0582l5CacTDxHDfEO061KhvKvg5iswudU
         l8yw==
X-Forwarded-Encrypted: i=1; AJvYcCXfrH+HfigqIMFOig6TE3brDs8YlFdIkF+Vx9C41YwNTgq1fa+VWJcSpgNZQn3i3qn+TRxIYTI8AlXbklzb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GB4dAWpWzWvJUSJvRj3g8aUsEIxRPG/MEnLNOwoR4GfK///6
	a2T5KUqSe4ueE5vkzw6H1eNPC/PxDVO/ND9btWi7tOt4siQ60co+DcCgjiDBMoCQDjPaSS7Mhk3
	AP02fJaOq89NICODJffnwB3LElriXT8HxKvCsLFp6UoTY1tH7OCE1shgX5Q8QXv2aT3J6
X-Gm-Gg: ATEYQzxS2zkVudkUQ+KFr6Tx9WUMO4+v6p1aC37VhKsCAoZWr+cfIRvilGtyXgNo1S6
	S2jZOxVl2mtgExRFtZRRMYgfsoi3tPckneWSnS9aRRXhvELEKyS+7a4QZNrKrcoQ0pLpYXlqdk3
	e12af1VhP+tanyFRddPXchLSTD68pMG00XRM0oSodLYwWZRivZa1riZ1XGskAc+f6MfMqlxkxvw
	NDHK7rqwcFBMyMamYxJAc9FFJOren+kXDZBVQBo5jpv5NZmig8ZzhlJUwGPaOLo7Q+aEMDfAl0Q
	C8vcdSHj/B4L7KQlNSE5AlZL0sd4M+qZnE1at8A8iMpA5JNtquOm2WjAlzlv7iJQjM2VkHg2Mdg
	KJwLQ4QOQIf0MTglElyalzobkhJFJXmUrZ1WAPL5oS4/HEcLgBifZy3HT614aX0csQ0wxSEIh2z
	KCI8s=
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr1692387985a.1.1773748347346;
        Tue, 17 Mar 2026 04:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr1692384885a.1.1773748346837;
        Tue, 17 Mar 2026 04:52:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97a387694fsm479916766b.49.2026.03.17.04.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 04:52:25 -0700 (PDT)
Message-ID: <ba005fee-7cba-4eb2-a2ed-93383d097ad9@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 12:52:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: qcom: cpr: simplify main allocation
To: Rosen Penev <rosenp@gmail.com>, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        "open list:QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER"
 <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260315214153.3682-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315214153.3682-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EKSffZ7V-xHSa3S8IOGk8ZyD6PgnpH6U
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9407c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1vmHEZbavBHxmJfcV7sA:9 a=QEXdDO2ut3YA:10
 a=ENiidslfg_8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EKSffZ7V-xHSa3S8IOGk8ZyD6PgnpH6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwNSBTYWx0ZWRfX1lJ05ElCVIL/
 s4n7sh+OET/58x8rSKmP5doURQI4LbqQ0/QSkBe6CJgWojodF9nOnYXUzpmB4XjnXw8zjyFJPyP
 7Yn4q6MN5F3Ger60IYEDJo7/6fnVSMp0vFKHNKCUup/rn/EAmsz10AHdl9etknF/HXAM4LVTOJ2
 lu9gF2E7xUZJ7PDNRlqylYj0ma+CPQfbi/ivNSEK9c3WUt4G9yWks1r0i66B/pnmNNSeFEIlS9L
 cUPO3DelOKeeuCZEAbMKP7rUg1M1VO8eSiP2W4y24pE57FJ5Si0LKjxnr4w6ai+ZI2H5AwcB8vZ
 8+5xtxEZmkbOqW20gSfWqwgdrWBwHwWL3OVfu6WxcDs2f4Kh6fRV+BxLBm2yBnVJ9sev0c+4xb+
 c/oJltcnhAOhmURYKgzzg5THEsHg35eiEc/uuIyzDCQN/IhLG0ddkYKd+c+Ix2K31nvcNFKhcA8
 04A1HO2NcHQaq93rrEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98155-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD4852A9433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 10:41 PM, Rosen Penev wrote:
> Remove kcalloc by using a flexible array member to combine allocations.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

