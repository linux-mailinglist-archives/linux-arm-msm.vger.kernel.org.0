Return-Path: <linux-arm-msm+bounces-107392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLLdF1epBGqRMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82B5373E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52E773191778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AC4BC035;
	Wed, 13 May 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNHK1qX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCw8MV8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC481326924
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688214; cv=none; b=fQbYXj/iw88Zn64YV3eb0+Q9t9zKpNc78zLpxKSF9Z+UIpzeKDfzVAL0+TEolpT2ZtkIIwFZ7EcOHojdvKPEy2gk5FCHds+roXRV8pkNV0budNwP/oGZA+QTh44vKC72L8Znn2JA7O/R4fj4uWCUrdSzQVEW8yRgaQzixhfRowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688214; c=relaxed/simple;
	bh=IPussI9+XR+OMGoWSyITYw/AG1L9oEhc8WjN5WRKb/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4Gb+rQEiQYz3zK42HgI3cmoh4zk8SPjooTKHi9A+5XWJbB1P4IsoTmc81tV+URPI4x79/HVnnQaXdLQG7PAp9Nsr0K37ShSTEZG7V8xMRvnQ8O6InGLJXB3MW9Uy6jCQmKMxZSxdjigSTSGez8gxzGgt57ShNb27hWckFzQP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNHK1qX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCw8MV8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdepT1242793
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JtsUbfOF0IzhkH+UeMM1imcj
	ZI06IeYaZqg2oXtq3YQ=; b=SNHK1qX52+A1cKbxDLIYcD3thn/E0c6hEG2/JZNX
	CaCdz4jNOMfBvY2z+0WwRX4bkR02rTNerNsb8VdoRhrn/duF7pzcnpT169ClgpbB
	lwD/VyzBbT6XxpwQQ7Terij4VXgTq9R6QNXJh/uwIk/HkH+0ISxEJQ0BIp+HVIcR
	yQF2YiXIB/A5irat9KM9qb5PjPduy3p/Ni5IoCeVM6QCVZ7O3smrN9gua4cdUWZE
	99vMcIWj5IxF9r3d4e9xK+w2QuFkYdvC/SR/e9eJ1oZG2re6AGwwhv4xRv9X5ray
	bfS05Z3OS6vHl7bF8QCVH5cUH7WumuKWil/FmD3o84P5ww==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tr3h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:03:32 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-696906ddd6eso2278046eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778688211; x=1779293011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JtsUbfOF0IzhkH+UeMM1imcjZI06IeYaZqg2oXtq3YQ=;
        b=kCw8MV8pGlCMkS67+jTVgVmePDy2Hmf6oYBw1/zowvP89oKjaiPG8Uxr2nBXxb07YZ
         d5JvR6oskv+QFU7zN6d2PzUSPgsiuO1rRJzUOEkvdXtcPUkCktIQh8VtNSje/Pl7D43q
         fzUxQb8WmYhvKlwJTH5u9m8OmD3V8CTOsbHDfql32hEnNk0fkpgidz10lyWrqIhdpy5B
         SXQ432XbL3Qp9dJs1h5k//VOTTK3BuwKMKFbNWQquUwPMzycBwkwpQWpUHeRYp36VudC
         Y/M9z/bC3KjECXutGq2qPpKpiJeDvpGX8fBYB4kceOjfr1tJNoDuFrTVpbjsWCywPMjg
         K1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688211; x=1779293011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtsUbfOF0IzhkH+UeMM1imcjZI06IeYaZqg2oXtq3YQ=;
        b=KjHZ46Uiimulgim0vmVkaf7JNCiZuRyHEp4J//1pUSXWSfZ035wXTVUA/IAqTVsVXf
         JQ9mBVtrYxozRTBGhbDZ9rH3Azm8bxyMawQO+lPnpwleOn6cEcN5knCClhCNQPrIAZbz
         6HOpJ0ficlepmN0R6O1Yb8XbCHsa0i+LriHaEeZxeG8KH+gYY7GB6ViqymWDI2jvnMqz
         fJC9umyOoLngCWTR1tU54ziKz/9lhO5I3h5kVj3me4aIXCKv4L5Gf3FupRWjIrddoHHB
         e0Az4fVa0D0WMajj8dB8JEqrbgSuwQHbJvblQD0sU6DlN+LbckDpcFi8ISQIrDqA41I1
         yyRw==
X-Forwarded-Encrypted: i=1; AFNElJ99Qp5MrFIgJ8jt8Y6GFbjtnTwey9vJuyHktmXsGw/ERokVM1q6SO/tHgbDXCq0jSFVPPWHIfKWxu2SZJQx@vger.kernel.org
X-Gm-Message-State: AOJu0YwreQdf/Lygmh/Pmveb0oSkKd+pZTp+9GAPlkvnSWbLvtI8KCZ4
	9Ygm/tYTb6Gf0gREH4jVGhEBA8kL4SKxySOhKRyQRI2EXESMSL+S8Vr48t9pvh0mGkdudVwDcTx
	Jt+tBuqtctvFSM1Rm7YRCpCYAa24G31AEb5JApwCb8MPiHIFm6e+XYyy/2jQSZVBjZ7rV
X-Gm-Gg: Acq92OGdmOvjkH2h6mAvh6LzcjPSWhmVp4KZJq2Xkj44U6vj/pyr93rpCzBvxZ5LlUZ
	wVFmV5w5jUwtTM/UPB95hjXjozBolDejllOPTFuLGD7hvXzfYZdvezWiW427uqGbsbY6Y2ZGcsa
	dv5T1V+E5DGjeSUQ/h+A1g2k5NlxuESU+/0/dN7/m/jPrwvtVHNfgsJMPURdTIAye0/jkZ2ijmy
	Pjqivraj0w+Xo7B0Kr0ZVQC79U6yyE2rgGHS5YgN/mLThsGiMQ7jucYUYn32Gp3HlYFBdp0LXA3
	pcXPFmlA76xZkyzx4rSzyTbbrRd+DrF51RctCje+yIta9C7kubXtg9NUZlf/DMfFBFRxsrJ2Z+A
	KsyjBQs8GsK2Rr7hy98Emp1xPOfIUY7H4YlGzFPkXTxgUsK+84Dbkg1vuQz4Z2YQTNlQhjvhUdf
	UzYtfMZvZWbw7MstAj1tQmiiiTYirbV+YJKYg=
X-Received: by 2002:a05:6820:2201:b0:695:818c:e552 with SMTP id 006d021491bc7-69b78e471f9mr2369957eaf.55.1778688211007;
        Wed, 13 May 2026 09:03:31 -0700 (PDT)
X-Received: by 2002:a05:6820:2201:b0:695:818c:e552 with SMTP id 006d021491bc7-69b78e471f9mr2369843eaf.55.1778688210209;
        Wed, 13 May 2026 09:03:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393fa029671sm40620281fa.36.2026.05.13.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:03:28 -0700 (PDT)
Date: Wed, 13 May 2026 19:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
Message-ID: <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
 <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04a0d4 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0TAo7pVkoxE7DlbSlgkA:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MyBTYWx0ZWRfX3EbwdLIqVvDb
 44ewqx+M0BQaNDUlcPKMFXpW/qR63XtpywVxo8Dx07/b8j7YEV35LN8oySBgGraDeldrOtHR6bl
 D6HVjKf/I9TrVSkW/SY0qmeIjed5NP4+dzbHBVRtVErAEnHstaByXlvXvuUPsoVx5hjwguBGnBg
 8BRoat+5hWWMQ3Q3mvceyCvY1aKiXSU8SNaX/xUdMrhLj0dMH7L26vZpAQxjKjtTKerHWlcvbqu
 QPBpfPGPuZ4DuaaQennEt6iOaiN79+BEXnQu28LH2FUtC0/L2KqpNGpWM2s68PNp0zKJSNLj+Zd
 fGoAe0nAQ4T9r6BeB2QSbPlXpQdDz0q6DCVr+dt66r83Z5GFCVpDn6afeLTJ3E0aOh4BrYvSe7R
 A6pLI7ahaHKdYPHjw6zF7zZMdftsWo2fl2hxwlXtvUg1ezk8Al7b4RYnHzsQJxlX6/RAemoByd7
 SbxxZxkMl3j7yF4FY0Q==
X-Proofpoint-ORIG-GUID: OmvZikRhy8UztvgrcTHUIcs_cZgK4D97
X-Proofpoint-GUID: OmvZikRhy8UztvgrcTHUIcs_cZgK4D97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130163
X-Rspamd-Queue-Id: AD82B5373E4
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
	TAGGED_FROM(0.00)[bounces-107392-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,foo:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
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

On Wed, May 13, 2026 at 08:00:39PM +0530, Vikash Garodia wrote:
> 
> 
> On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
> > On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
> > > 
> > > On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
> > > > On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
> > > > > On glymur platform, the iris core shares most properties with the
> > > > > iris core on the SM8550 platform. The major difference is that glymur
> > > > > integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> > > > > one. Add glymur specific platform data, reusing SM8550 definitions
> > > > > wherever applicable.
> > > > This leave me in confusion. Having two cores, each with its own set of
> > > > clocks and pm domains, I'd have expected that each core scales
> > > > independently. I.e. if the load is pushed to the core0, it requires
> > > > core0 clocks to go higher (while core1 clocks can stay at the low freq).
> > > > Or, at least, the clocks would be set to the frequency corresponding to
> > > > the max of the workloads (if for some reason the cores should stay in
> > > > sync).
> > > > 
> > > > However, I don't see it in the code. All clocks and all power domains
> > > > seem do be scaled using the common workload. If my assumptions were not
> > > > correct, please explain it in the commit message.
> > > 
> > > The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
> > > defined in the DT node, where the clock frequency and power rail level are
> > > tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
> > > independently scaling one clock high while keeping the other low is not
> > > straightforward within this OPP framework.
> > > 
> > > Do you have any suggestion on how best to handle per core independent clock
> > > scaling within these constraints?
> > 
> > This would require more plumbing and driver changes, but:
> > 
> > 	iris: video-codec@foo {
> > 		compatible = "qcom,glymur-iris",
> > 		clocks = <only-core-clocks>;
> > 		resets = <only-core-resets>;
> > 
> > 		/* or core@0 */
> > 		codec@0 {
> > 			clocks, resets, power-domains;
> > 			operating-points-v2 = <&iris_opp_table>
> > 		};
> > 
> > 		/* or core@1 */
> > 		codec@1 {
> > 			clocks, resets, power-domains;
> > 			operating-points-v2 = <&iris_opp_table>
> > 		};
> > 
> > 		iris_opp_table: opp-table {
> > 			compatible = "operating-points-v2"
> > 		};
> > 	};
> > 
> 
> clock source "video_cc_mvs0_clk_src" is common for both the cores. It would
> not matter if core0 is scaled for a specific workload and core1 is scaled
> for different (let say lower), as the common PLL would always generate the
> higher of them.
> 
> Infact, going with the approach of exclusive scaling would be an issue here.
> The later core scaling command would bring down/up the corner for other
> core, and could lead to under/over-voting.

Are the dividers between mvs0_clk_src and the branch clocks really R/O
in the hardware? Can they be scaled to account for the different
workloads? The commit message should capture the details of the
interaction between cores:
- Can either of them be turned off, while retaining the other one
  running?
- Can either of them run at a different frequency than the other one?
- etc.

> > > 
> > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > ---
> > > > >   drivers/media/platform/qcom/iris/Makefile          |  1 +
> > > > >   .../platform/qcom/iris/iris_platform_common.h      |  5 ++
> > > > >   .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
> > > > >   .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
> > > > >   .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
> > > > >   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
> > > > >   6 files changed, 223 insertions(+)
> > > > > 
> > 
> 

-- 
With best wishes
Dmitry

