Return-Path: <linux-arm-msm+bounces-107344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHGaNYKWBGqrLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BF535F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80995317A256
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DC3391849;
	Wed, 13 May 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUsDcuy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJggn4GP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3078391E64
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681842; cv=none; b=rwePVgmT/erWnpgfvGTI9z07nW5cQYFjtFELIVOqkJIAUfJTmpWfED63L6eFUa2y17mBf+wwZ9vXovEsYYAppV+KA/VZ7c9kJQQ4XLbBxk8XutImvE3xa6GspTtQBJbqzjHnWIbzZvS185SSwhheyPt42kiqGvn8Mtn9RByBHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681842; c=relaxed/simple;
	bh=YeEmJtfOi3ruRtgyvbxnJAIRcn/yh4Hvqz3vDI5g6vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENNeo5P4IqBmvRraMwFLouqZvW1RZu0myEffZ3yQIQiuLguMRpEwiqM1xR3ySvYXPc0qFS76kUCbOowSOwsdoKl+mJKGZHzRWtbjOadOq9AS20O39xpB0oNMZEjNXmcwkEyUfkPivk0hGb2trs3WrgKj9NH4PvNxeVbaBO8+oMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUsDcuy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJggn4GP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mEsj3474770
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QtxV0KKT8L1h7QSyHNrHfjcD
	HL1rGc5XA2EQyHwr5js=; b=ZUsDcuy5NaFXCR6sq23leJdpmh73sJaL5l3my4li
	s9unSjEugOP9imXwVNVOxmDVwShddeMVfK44GMfL54LqBMjGzbk7K2a02VRnl3iH
	DYnZc6vpnHO8ZNSzXfKyLqHOHZaXu0ZoRsz9hSQZ+O69PajnKhYO1Jr3i28Tugvh
	Q9IabM5a0xLqacLJuMEm/Md5+dXBU8hyv5EbDlyDGeXBXuk0DI7j4PnzyRjVGpbz
	IUGl1HoCLM6tyeLRfTlW6tqjhEDTE+7AVnFNUkQX42oB/x55gSedmd7psxBFoea/
	GYwEqjCIhbqck0+TJGJXi9uqsAfvAGgb1BoKuq0AVQVmSA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4197r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:17:13 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6961bdde2a1so13965259eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681833; x=1779286633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtxV0KKT8L1h7QSyHNrHfjcDHL1rGc5XA2EQyHwr5js=;
        b=PJggn4GPirfmQV1SjUmrUJQZATX7O9732j/angM6+BKPvkOZb+SexC3omI5yjfOi6y
         l8tW0TLqFEEWhDbXQJGOLw8KzYnt08ziA7PxEVD9yTh11a8j5oWYUkBwafOE1hc1DblE
         KlXS2s+O/h6ZtZwkKHzLBHNyHYBvcZFzAgD1j6sdfmshaca0blnhIcbKUJnaxM4OtoBG
         4lvx1hrW/uIfzG6TioWjJkoQxEk8tpH1r8DmZXS4rAXX5PLBI1t/TcSyzqIpZPSU275O
         zmsbtmp9YedErWD8frP0yFFviObel3fu002WNvNs7IZMbdtrRzDg4rGGzWOgYENkv8tC
         F1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681833; x=1779286633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtxV0KKT8L1h7QSyHNrHfjcDHL1rGc5XA2EQyHwr5js=;
        b=amy84mNzPgoN7PpbNp3IPY+D8raggyjkgu/NcEXN+9ztFap6bsCgnKtbIT1KMjQvIA
         FMA63XPmMWlJXupH2dBroopvPhP3SkfGpPSv/aWOvygiHymgUsw3+h+lUop28PLbLMu3
         LCrApK+pcR1rhHZ9YLRQereSVfICHH9hVrTLQVsk8nHyBmj7LLQLRhrycNcwJIuL6NCX
         WqpWandoKQJYe/DL/NwbmQPikJ+Rcg1t1NQsS57yrwrjRohlj0kd6mLjw9tPHvMWHu3w
         NS3RM/9QidpHYZOACcKn3wp4psu+5ya9Cmc6kwm/nCMrMiJ4R9i2CNWXdVyJcfbu7GC2
         CTtw==
X-Forwarded-Encrypted: i=1; AFNElJ+7uD5Yzx0wkjcbnmyjwnaXkuEGd8AaUP5LmPs0uYxb02zg7nMisFPLpeZEh3N7aOPOzZRTlhCVgkyGgba2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQpgF5QmFvRbwfKEgxtzNuGDxhc3oOcIUaJwFihZ1dGkjcKPJo
	HIdB2nRRrMLGi0U4qyHIX9xPVyL09vsqwRvVgRLvbTnz/BHOfhlzl4i+LYGSVCvZmAQTy8uW0SX
	0Iwd5klUuyNiwbL+MnVrSqIWKsGukY7I2AaPGgR4Y/8a+5kHly1N3vrA2opSWBY7vh9FY
X-Gm-Gg: Acq92OH69duIh3gVr3en7QeFD2xWFojVWeWkCL3SNbyzyXu0U0i2ap3siBk6qJNTpat
	rniwSuCUJkcL8dsT0pZa+MHIGz3vqwp9e19SBN1FKbBWr2u2KiImHRtAFizBCgOlaP+o8GAfd/a
	Yae12rSfUB1pq8Az8VmwxDjsCh5+i+tzQVKgvCNwhPWpC+PjvhQoV+cpD83gOEwt+hbErGkunT2
	+FBOsCo66oHNSDT2/EI8w7fk09p1RZgrM0uzgeoh9qpHnQ73z8rqKqOP6/isjJsZcbgEFoFdRtA
	DOhjyXUo2Jt/UsfJMN3rA68PDqXbUqps7keqA0J8nf2GT/5E84RahXyhZ1aY+xcUwJ1bHNNw422
	6BZp1j32IJZ5EKnQm2eAvQ6HHYAFIOBxv/vkzjGEwWBTzvw/bEQ+hR2VgB38XYTWsZv6PnUdWfL
	ZhvTxZ9wGwyMeOxXaQ95khxC4rhs7nq0mykgA=
X-Received: by 2002:a05:6820:3082:b0:696:2430:3277 with SMTP id 006d021491bc7-69b7ab28ceamr1456189eaf.29.1778681832696;
        Wed, 13 May 2026 07:17:12 -0700 (PDT)
X-Received: by 2002:a05:6820:3082:b0:696:2430:3277 with SMTP id 006d021491bc7-69b7ab28ceamr1456137eaf.29.1778681832217;
        Wed, 13 May 2026 07:17:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18e63sm40854351fa.5.2026.05.13.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:17:10 -0700 (PDT)
Date: Wed, 13 May 2026 17:17:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
Message-ID: <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a0487e9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4BxVqlV7uxTxpwANZs4A:9 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX7EoOao/ENnQr
 g3kNi7rIEfRyjCU6LOTgQeNjA4cJcs0jG/MSKVtL8G9I7UxPDheaccg8wMzx5lfyaOdYeROyBAx
 Js/n+/0/A3yZ66eLLWZ34sjtgl7J7s5rC62dwndvxi4tDYDoo4I6O6MxUFvn2WqaS5SBbNifS+f
 IQSThbtfWIL+aB50SS8rXU+3zLH7fHWD4dp904blhq6HnZaQzQZywL6EHvy6G/UvcDR/z2xdOXi
 iXDa6Vg5ldZymUKxsR3XCPazrCNyNxLKELmB9i0vU2YrCDNxNGyjjCnYBAQ1WINnRFGdijscS/O
 n9gGfQ1SyYb4L6XwwnDDLmyiEDCJnRXtz8+lwXuNArGTeyO7n/uZMiHaOL/k4z8ZYGRtdqiMaZw
 uWMIlZGMb99xphFAOiKdW1G6mkW7MovpQ8h+wnmYsVrzn7YfapEOfdMwkdQyKZigVLGGixSC688
 v5EtkVqcVp4xlFqOKFA==
X-Proofpoint-GUID: qA5Dl8nW5664K1WOmX_3fyczFpeW9YmS
X-Proofpoint-ORIG-GUID: qA5Dl8nW5664K1WOmX_3fyczFpeW9YmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: 7A1BF535F30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107344-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
> >> On glymur platform, the iris core shares most properties with the
> >> iris core on the SM8550 platform. The major difference is that glymur
> >> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> >> one. Add glymur specific platform data, reusing SM8550 definitions
> >> wherever applicable.
> > This leave me in confusion. Having two cores, each with its own set of
> > clocks and pm domains, I'd have expected that each core scales
> > independently. I.e. if the load is pushed to the core0, it requires
> > core0 clocks to go higher (while core1 clocks can stay at the low freq).
> > Or, at least, the clocks would be set to the frequency corresponding to
> > the max of the workloads (if for some reason the cores should stay in
> > sync).
> >
> > However, I don't see it in the code. All clocks and all power domains
> > seem do be scaled using the common workload. If my assumptions were not
> > correct, please explain it in the commit message.
> 
> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
> defined in the DT node, where the clock frequency and power rail level are
> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
> independently scaling one clock high while keeping the other low is not
> straightforward within this OPP framework.
> 
> Do you have any suggestion on how best to handle per core independent clock
> scaling within these constraints?

This would require more plumbing and driver changes, but:

	iris: video-codec@foo {
		compatible = "qcom,glymur-iris",
		clocks = <only-core-clocks>;
		resets = <only-core-resets>;

		/* or core@0 */
		codec@0 {
			clocks, resets, power-domains;
			operating-points-v2 = <&iris_opp_table>
		};

		/* or core@1 */
		codec@1 {
			clocks, resets, power-domains;
			operating-points-v2 = <&iris_opp_table>
		};

		iris_opp_table: opp-table {
			compatible = "operating-points-v2"
		};
	};

> 
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/Makefile          |  1 +
> >>  .../platform/qcom/iris/iris_platform_common.h      |  5 ++
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
> >>  6 files changed, 223 insertions(+)
> >>

-- 
With best wishes
Dmitry

