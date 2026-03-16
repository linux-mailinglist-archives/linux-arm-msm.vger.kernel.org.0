Return-Path: <linux-arm-msm+bounces-98029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEymFUlhuGlbdAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:00:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B060329FFB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6389303265F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CB13ED5BD;
	Mon, 16 Mar 2026 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp8Kup+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWNL3Mh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CD3DB64B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691187; cv=none; b=OaxHQkR1/IHTk+gx7qh12RizkyGx1sYQjO8teJEuRq8iVRni8YCjogwL3HOIEfiYBWA6XkxljH45mg1UVaX9pJ5R6xhvVhc/sqVB8A4MpEj6/+tldeALs0vZxKZNmnYQamQkzcRuB0/86162ClolnBpQKsKa2y+rLBweSd1mo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691187; c=relaxed/simple;
	bh=gxLWxlGf9bOrVIgne7LiUAE+z2WLXtmKK7Xao/9Ux0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e69NcrK/tKCo/zMsWjmftO+leJ0/NqtsejhyArDsbcNzsRzmxEIl/1mRU7XNUoscYJUsyjO6vhVCKUI6BZhBXxQ+b0WOgrW8No8Sqd9+hUlZ6/HXK6L7U2YxxsegtMjB4/whTM75IWbsxvxc/CV8nbrJ6y09jIFCO9K181hE5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp8Kup+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWNL3Mh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCXBK11622171
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=; b=hp8Kup+3gkOaECT3
	H8X8upJLxPw+UjgzzQG9lcpFg4pHmNoSpbqmu62cVHh4dN8Ors0zOXhAeoiFws+E
	373X2QZD5TRAPNkWhsYAwm/y38NVkNZi//wlnpS3s++/bsfJ9yJovbsWTijigio6
	Ntn9ePi2COCJQUbAEpeNAZAqE8NgBtsLSjgHg5y+8l9VnDRXHZr+7v1eHn+2gL5/
	Y8eRogXMehjNo56V1bPJThv18rIdSNiG49vUyr1eKgFsOdSRV4C9zL+XPoyGgghs
	4Zwk+7Pf3etFlLbAPbsEKecqDhua+iOHAjd6UPPZo41z0DDIj35uK+HukqdQNKLn
	LDoNTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyehkew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:59:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7d66afceso3484245585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773691183; x=1774295983; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=;
        b=DWNL3Mh7v6iT63vJdhu4HB1vO9AXkfhrSB7oMQWOMRQ3r2bKHmUSJFdQJtSEPWx0HM
         u/S2lpBURyHVSP3E9kQMqpZa7/q8h4Yf5Ns6ZqX6nglFwOjJL28PkHy/5L+6ArvovZrG
         LHZU7KWbt+Q5Sn0xqgMIK7UQxiafMZM1unY66JeAHHsJBCgO9fI7xSejWK1VRglV5iJH
         je+TP8FWxrUUAevz0vDz0ZETg3mJN9clKEqzCRIsPUpp5u5MojRkCzlDykzcl4oeWc2o
         Dy7z5dcK/Wp1HY/Cj6arYsa6STnx7pkVvBp8h872EwAhVIUYkYjFvxsWil2f/EVXNFM/
         sIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773691183; x=1774295983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=;
        b=QnxTOBdHoWhO7ZzBC0O7UZ76kX3rFoR4nCQJ4HQPQ78jnUHGgvL37eXoINuq/wUchv
         iCDGy8t+ZEVNIGxSyt/A5Am8Tq1j2x1SYt5mLIANbU1nA0y7yQ0Q3oau0OhAnD/lbo2c
         7xcvzjFhryfQA9EzldzERvsVzcqvgmLnhSmFod1mFG9P/Q/Hr/dLESNYzahHKKs095pu
         XxoZRBtIOiaiJ2lmIecXiZdU4d4Rs6LPuUTXPA0kw4r61FLwzxNdOZkNBZ7wzrhWmQ18
         yATY8ZlZ3ck+d+6WslOpoSjBOwL1Y4uMBv5GOfvEBMopJXt22SHPRGl9g/GD+bb5brB3
         7gWA==
X-Forwarded-Encrypted: i=1; AJvYcCVEUu/dU0d01cwOdWsHVyDPA5KzXPsyt3aZEQnwWTIkMBDqJTAZg/BHFWcRsAQXMSA4541CNpK77ex1Nd4X@vger.kernel.org
X-Gm-Message-State: AOJu0YwFV87jjZd3h3lCF6CaGCM95LBcPlDYvP4mJbTzjq3DiNPv1nTo
	g/QYnpdjDb4fTBsrklzYyV1Y3GWC5xcra1wBencl4GKz43X9TtwtlA3jdqqA+UPlgWKX4kV7tvJ
	xLwhWV4lcptFJe8Mc2Atb+vfqYwZMynMxED/cDP4jVIbpPtbMtHed4DC8YSR9Fz6K/AEq
X-Gm-Gg: ATEYQzxs1VwI6aelaJFENf+eTzE1R8BcK+tl2Hda5DUp3hb6RdvWXcDFsdSAodhP+Ph
	F3zLr2R91iJTw5vkNn/mhSf1WORWNIvc7GLvvz0qVZ1nIZJZpHflyC85vX7imtlZGSStavc4rJE
	BowGNkmpwDI800jOR1j1ivtAUmrj4VFX4naBm5CYjy7ImXgX7ZaPX3H5fHN/rinoRjEIUg0KzRG
	Bfqyaauv2PkAzPT5yw9ScQKnAU6J9gQM4BHiiimWRpJOTm9WjYv2oTxToaA7ODqieblQp4pq+S9
	rPlBDbA7KHgAJWNNI9THduBpMFpwc4tv86weZgt9okqxKaLTpdx5dYAYctnxU1A1s1xaeNuFajc
	YeCc4zE/43LeUyz4QbxACDOrdMtH83+G+3fUmaeCggVrdyh5Ae0SEw98DQMwEv4l3BQtwt0Vhis
	JA7F96z+ujM1iQRQtVULsm9Pw9RUF2kEXBpYU=
X-Received: by 2002:a05:620a:1983:b0:8cd:972d:324 with SMTP id af79cd13be357-8cdb5b60325mr1864293885a.54.1773691182726;
        Mon, 16 Mar 2026 12:59:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cd:972d:324 with SMTP id af79cd13be357-8cdb5b60325mr1864289285a.54.1773691182160;
        Mon, 16 Mar 2026 12:59:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b15sm3568711e87.49.2026.03.16.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:59:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:59:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <t5mdnrtxpeylnohpb7twl2kc2ewb5hxyscemz6iuxemkvye3h6@26t56xm5ca2j>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
 <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
 <24oq4plyvburuufxs6vt2kt7e3mlwlis7dekszjnxson245amy@muyu5fpohhfu>
 <5a6a6979-ff3e-0885-ce88-5c9316b9bcad@oss.qualcomm.com>
 <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
X-Proofpoint-GUID: r69Pc1zaaY3J3oKnVKBubKKMrQCN91DV
X-Proofpoint-ORIG-GUID: r69Pc1zaaY3J3oKnVKBubKKMrQCN91DV
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b86130 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=POyDUydt1yzL6V-isL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE2MCBTYWx0ZWRfX1Y8WTQrQGK4N
 zi5sh+V22v8LZYcrDuPW4sXBLoaCfNFS00FkBUP+QCGCtmRD8r1ybx3+dAGCLePv6ocs5Cd6k5Z
 Hjnsu0WgD+lBn96Yeg3DoAnh/lfaQM9wgpMQdC1HdophmLjqh6cSm2FGMetcCrrOaFRSSGlJ3/3
 eVqdRAkKqeQM/yrCGtFHBiiKQVUanf0c8XQf+WnytwcUqowlE8wqImCAhSg2lwgDeeKHNlDVT3R
 Fee2kcCAOOPGPpKXXGbara5kRc84gHk/jEeswGrHxg/a9oojhRDeecZhWK3saUoS9e5d32HfIkm
 1raNsdnH8y+Ocd/NmFKgm98PeDmMlmZd/F+W0SFpf4TIjHhTcIaYJtMcxduqh4nk8a28cP1MxZw
 NQXr8uo3wislOo/zZe23grmWeBGDNvX/vlpDGpS1zHh+QC9DmC0vL7aAP3rzVjoUqu6EvY+0E5Y
 DGARxE5yLTbHRiMDdSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98029-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B060329FFB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 12:01:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/13/2026 2:55 PM, Dikshita Agarwal wrote:
> > 
> > 
> > On 3/13/2026 1:37 PM, Dmitry Baryshkov wrote:
> >> On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:
> >>
> >> I'm sorry, I've refreshed the series before receiving this email. I will
> >> send new iteration after settling the discussion here.
> >>
> >>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> >>>> Having firmware-related fields in platform data results in the tying
> >>>> platform data to the HFI firmware data rather than the actual hardware.
> >>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
> >>>> should be placed next to the other gen2 platforms, although it has the
> >>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> >>>> hardware-specific platform data is also close to those devices.
> >>>>
> >>>> Split firmware data to a separate struct, separating hardware-related
> >>>> data from the firmware interfaces.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
> >>>>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
> >>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
> >>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
> >>>>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
> >>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
> >>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
> >>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >>>>  10 files changed, 246 insertions(+), 351 deletions(-)
> >>>>
> >>>
> >>> <snip>
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> index d1daef2d874b..1a870fec4f31 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
> >>>>  	IRIS_APV_HW_POWER_DOMAIN,
> >>>>  };
> >>>>  
> >>>> -struct iris_platform_data {
> >>>> +struct iris_firmware_data {
> >>>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>>> +
> >>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>>
> >>> I still don't think it's right to keep vpu_buffer_size in firmware data as
> >>> this would change mostly for every new VPU variant.
> >>>
> >>> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
> >>> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.
> >>
> >> Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
> >> the function pointer in struct iris_platform_data for now, letting you
> >> sort it out in your series.
> > 
> > Thanks! that is SC7280 problem, since code evolved due to additional
> > features and other things, we might need to increase the vpu2 buffer size
> > to accommodate both Ge1 and Gen2 requirement, I will check that and address
> > in my series.
> > 
> >>
> >>>
> >>> <snip>
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> index 10a972f96cbe..a83f6910f8b7 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
> >>>>  	BUF_SCRATCH_2,
> >>>>  };
> >>>>  
> >>>> -const struct iris_platform_data sm8550_data = {
> >>>> +const struct iris_firmware_data iris_hfi_gen2_data = {
> >>>>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
> >>>>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> >>>> -	.vpu_ops = &iris_vpu3_ops,
> >>>> -	.icc_tbl = sm8550_icc_table,
> >>>> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> >>>> -	.clk_rst_tbl = sm8550_clk_reset_table,
> >>>> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> >>>> -	.bw_tbl_dec = sm8550_bw_table_dec,
> >>>> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> >>>> -	.pmdomain_tbl = sm8550_pmdomain_table,
> >>>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> >>>> -	.opp_pd_tbl = sm8550_opp_pd_table,
> >>>> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> >>>> -	.clk_tbl = sm8550_clk_table,
> >>>> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> >>>> -	.opp_clk_tbl = sm8550_opp_clk_table,
> >>>> -	/* Upper bound of DMA address range */
> >>>> -	.dma_mask = 0xe0000000 - 1,
> >>>> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
> >>>
> >>> Should fw_name be in firmware_data? as this can be change based on HFI
> >>> versions?
> >>
> >> That would fail because then each device will have to gain its own
> >> struct iris_firmware_data.
> >>
> >> But... Maybe we can do something as simple as:
> >>
> >> struct iris_firmware_desc {
> >> 	const char *fwname;
> >> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >> 	bool (*checK_fw_match)(u8 *buf, size_t size);
> >> 	const struct iris_firmware_data *data;
> >> };
> >>
> >> and then
> >>
> >> struct iris_platform_data {
> >> 	struct iris_firmware_desc *gen1, *gen2;
> >> 	// .. the rest as usual;
> >> };
> >>
> >>
> >> struct iris_core {
> >> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >> 	const struct iris_firmware_data *data;
> >> 	// ... the rest as expected
> >> };
> >>
> >> During first open the driver will try loading firmware from DT and
> >> identifying it using the check_fw_match() callback. If DT doesn't have
> >> firmware-name the driver will try loading gen2 and, if not found, gen1.
> >> When firmware loading succeeds, it will set the pointer and the callback
> >> in iris_core, settling the interface between the driver and the
> >> firmware.
> >>
> >> WDYT?
> > 
> > This looks good to me. It handles the SC7280 Gen1 vs Gen2 buffer size
> > differences as well.
> 
> Do you plan to implement above design in the next version of your series?

I've sent the platform_data patchset keeping the get_vpu_buffer_size in
place (as you suggested) because that is fine for the current supported
usecases. I would prefer if iris_firmware_desc comes as a part of your
Kodiak Gen1-vs-Gen2 patchset. I can send you a corresponding patch, if
you wan, or you can implement that on your own. What would be your
preference?

> 
> Thanks,
> Dikshita
> > 
> > Thanks,
> > Dikshita
> > 
> >>
> >>>> -const struct iris_platform_data sm8650_data = {
> >>>> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
> >>>
> >>> This proves my above point.
> >>>
> >>> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
> >>> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
> >>> variants just to carry a hardware-specific difference.
> >>>
> >>> Also, it will scale poorly going forward. When we introduce vpu4 /
> >>> vpu5–based platforms, we would need to add more copies of essentially the
> >>> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.
> >>
> >> Yes. I'm not sure, if there is any difference between params / caps as
> >> implremented by the firmware for those generations.
> >>

-- 
With best wishes
Dmitry

