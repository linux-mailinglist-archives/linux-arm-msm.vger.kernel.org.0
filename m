Return-Path: <linux-arm-msm+bounces-107336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKJOH+uHBGoJLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:17:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D53534D96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4324931613FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15272C15B0;
	Wed, 13 May 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmfV9zrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6kkxr8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DC29D266
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680537; cv=none; b=nn5w0QMG23DY+A0Yxqs3M0cuouWNiptCc+/ql+8WNZ+Zv75ofQQ6UQb0glvHftuVZwUg+5eblAivhqfCd3WuMp61O0XjfBubbW5xx/52ZmnZOQ95xCKePbckf2YXryMVWFx1GZPg/dAxfUZCaN4ctJopRm7GDW/1nSOOU8LVhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680537; c=relaxed/simple;
	bh=yx1U4YvOhOZ+FS/hZyKy/QcTnx7swfkuhM3LShOjigQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogLvUqBZf1KCgLem0nvZWsURPvRAvqr7Pj8+rFJpMSamEK0/F5OsLZqgHn6BH/Strx38z0/S/D+XxIVEC3rvvhxPXSXbvHTK7PvNQ/BMl7mFKnR+rdn6VInDXQiC0hd+95aCj6KK0ReRt4UMZLkYgV48TVn/qgK2n9z+NuV0n1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmfV9zrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6kkxr8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWCCG2321270
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BGFkJyRTBwwbmxtZmEDcBFXU
	seeave9XXC9XQZGzM2Y=; b=fmfV9zrD3MT+Dq9RBDkoluY4yas3yMA87jyoA8xi
	ihnAahvrZhBx6GEgJ9GQlpp+3/ZWl39gbYaPrqfViLOIzS9ECSAD2rcwmNgd8TYC
	R2TO8/f8v3C+gnZ6bVxZCVxEVD/FSmstYK/5UZ9VZYXZVRgSt8ogNvhzutPXIxpD
	8tjnRTl01pymDiKZdCYwOS93+egqK0AsmyRLvcaB+1mXykL0lfnGg0DkHODOjf89
	SyWL2sHfQAM87MKFIXQBH4CGc7j3zi6pQLRIyjwWVMoQOQ7y3BorZ5wcRJ4gOEgS
	Qec4WQdeGsWfDNFo4XuZhgvweqClPE3UpYq/mFX5/yjWlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua8mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5156c85538cso35777811cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680533; x=1779285333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGFkJyRTBwwbmxtZmEDcBFXUseeave9XXC9XQZGzM2Y=;
        b=I6kkxr8zm3gJo4Hf2k5qgAbd/yWwIGGoFsfjHweKtQ2QD5dWH5ox8KPj6dVEW9fIYA
         zU5kLaJKtF1PaiQKQex3pkUx5a+DCWpKNh1GE4f6OeKp7fOy/2MYU9+HDckhRoRCHSeu
         G7zEev3z6QoiIHcuu0+hpyuYMowrfXYL+UwMCnoth2sa2sacpuWKTA5WjZ/mqXdpavi+
         RGocGTJnbjT8uvtUXsJ9j2nt9NbHFcefZKNU9JcGCMY94vVaDqFMUnO6VKXogYy/i6Vy
         1lQz3lmjSUaFPdnYIHKeLbwMCDmI5Y6rIpNFR5dT+MvXCRRJZ5vUFrzkcg/JIFcLuFRm
         lscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680533; x=1779285333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGFkJyRTBwwbmxtZmEDcBFXUseeave9XXC9XQZGzM2Y=;
        b=aFbrnwdslHUFXJqjr+h/OiuGg4dC4YCBCM0uDlYov8v4BbGOeyQGDp99Wmv8LkeRnR
         QhjW9gxS8IeH4U15Gmhg8/kzq59zFQUI5D5gmF1etlTAvsQMPK4WO/JhwPfHMGKVihek
         pypdOfhTDg/XQHa36rt9Uivq7mT5ek7H+dbkibJrZaJvacvtdAz/4inn0/Fovf/Nhm3r
         /DOlYHGLfOnhTWQgO41EBk3zTpv8CV8xwwxqPB1ZCMBaeOdw9341k6ltxz7VQogAAyrk
         vkMU7agaXnaM+oczasAT4ES09i3PJ6MPyID/fR6FDjG/WFMfmTEzlXlkv2/DDd5CM8Cd
         FtDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qhmE2SN2M/BVp6VG472S8R3sxK/ZbyRao6bPXDbLsWssI8enhiMLCdrP9HFTuhjCDymCK0lePt2BxET1o@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjoq300XUEnS+f2jmX+KS+T7BNexesHSEXPJiZCeOPuY+UXv+
	rKAKcT2yZSBGfQk2Jl6ORTvYU3jkWD5jRrjtsEt9MCQeTRTzFPY0NoxtL23V6NcHLdpI36elNro
	libLgb/sx8sFSar9WqJZtYeh/toqOHNLDi3ohdQdm4qcIDj7G8N2ozMP3XSFGe1yOYo8H
X-Gm-Gg: Acq92OFoKOkBS+BM9oEmkkqgCEubRKOd0bNvkgnUgHhFGMMVkdh/v8dUnWJUtxR6BXW
	jcif8su1nczYC/5l+Ck0L6SpLr7ugW27ypGZOG0PeiVrAObf8YzpSHnsIwDKGbMdTzCADLd40zT
	RTaeE2UfTebTR96Kw+Vj1/TyzOWGxCCsCjZkG2602Op2vMDIM2NRJ1tYzI1mqk0llG13SzDrtV2
	DjKuvBu31vymEhBFN1bkMt9RsR6VoBS+ry9E38UT9OT8QLPHilK2iLDJBxPWDjvoZNra9VWY4Os
	iFFPJwwQP5lCb4xZq4hn4XIBy7F2TQhkGS2+7jM9DC/G/vdEQUJ7wdANaVI5b8denW3WfVOthGc
	qAmZu1J6Kv7Km/xOeNn1O3KYSyS27fRYqVPsBWBa6ixWGrRjEKt9WubuzSEyVqe+M8C4YWY3Da5
	VgNaRknypyq7buR+FehyW9oWpLQw1TGoVXCtI=
X-Received: by 2002:a05:622a:5cd:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5162f440ab0mr45723381cf.8.1778680533090;
        Wed, 13 May 2026 06:55:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5cd:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5162f440ab0mr45722661cf.8.1778680532504;
        Wed, 13 May 2026 06:55:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18f13sm38423431fa.1.2026.05.13.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:55:31 -0700 (PDT)
Date: Wed, 13 May 2026 16:55:29 +0300
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
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <gc7adzf63sa4g7hsnwwoylv7ddmp2bpfa556gj7r3brzsry2x3@dmmdwsfwbcat>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
 <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0482d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iaB0vuWom9_9t0O4BOkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: q8gJQvaGHqN241PsmYGEAFHuI0kN_3Ce
X-Proofpoint-ORIG-GUID: q8gJQvaGHqN241PsmYGEAFHuI0kN_3Ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX0qXL6DewV2p+
 bUkwh5c+y0rT6ZuXE0s7wev0+jB8RRctuwopkmKFXD7zV6fT0SLQJBCP39f95npuo5E7X+HmuWk
 +BSeT71qXwW3nMrVcnzobMY6nNcx/QFKuiyUHrRFmLmQZT3ZI8IFeADBU6SjupsdzPv2BDdGIUy
 IU+qIYM/bD0VrmdeaSluv3gNZh9OIOGE+lS4HMxl+7Fl9nP4N1MhLLVjXtkKnUHHrlcioHU7puV
 /jQGkEbWgtXqQ5jNmMRspacrCZEHjLTYsGRN/dgSUOUooK/PSIy7NgLqzfwxe2aGn8q7hdV+MHX
 uqSbpkY/V1wm3xT5ELIYypM1IGDfARnZGOXlGfTp6v0w0m6i8sagDZJBV5+JZ4hBE6wRWloBNg1
 lyBdg76nnfTnFHcwphkrel2OMyr6ykLA4gFF0N0ATl1hvjsqz3DP5F5fas74k3j/311i2mw0dja
 SWRgOdAHsIsdyqE5hPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130142
X-Rspamd-Queue-Id: D8D53534D96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,a400000:email,ae00000:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 10:26:49PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
> >> Add iris video codec to glymur SoC, which comes with significantly
> >> different powering up sequence than previous platforms, thus different
> >> clocks and resets.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 118 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> index f23cf81ddb77..c47443174f97 100644
> >> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> @@ -13,6 +13,7 @@
> >>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >> +#include <dt-bindings/media/qcom,glymur-iris.h>
> >>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> >>  #include <dt-bindings/power/qcom,rpmhpd.h>
> >>  #include <dt-bindings/power/qcom-rpmpd.h>
> >> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
> >>  			status = "disabled";
> >>  		};
> >>  
> >> +		iris: video-codec@aa00000 {
> >> +			compatible = "qcom,glymur-iris";
> >> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> >> +
> >> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> >> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> >> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> >> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> >> +			clock-names = "iface",
> >> +				      "core",
> >> +				      "vcodec0_core",
> >> +				      "iface1",
> > I first wrote the comment regarding resets. But the clocks seem to have
> > the same pattern. It's not just "iface1" clock. It's the clock for one
> > of the cores. And there is another clock for another core. Please make
> > that nicely named.
> 
> In v1, I used iface_ctrl to reflect the clock purpose, but received the
> feedback [1] to align with the iface1 naming convention used on earlier
> platforms.
> 
> [1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

I'd also dislike the iface_ctrl, it doesn't say anything.

I'd suggest having vcodec0_iface / vcodec1_iface for vcodecs and just
iface for the core AXI clock.


> 
> >> +				      "core_freerun",
> >> +				      "vcodec0_core_freerun",
> >> +				      "iface2",
> >> +				      "vcodec1_core",
> >> +				      "vcodec1_core_freerun";
> >> +
> >> +			dma-coherent;
> >> +
> >> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >> +			interconnect-names = "cpu-cfg",
> >> +					     "video-mem";
> >> +
> >> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +			iommus = <&apps_smmu 0x1940 0x0>,
> >> +				 <&apps_smmu 0x1943 0x0>,
> >> +				 <&apps_smmu 0x1944 0x0>,
> >> +				 <&apps_smmu 0x19e0 0x0>;
> >> +
> >> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> >> +
> >> +			memory-region = <&video_mem>;
> >> +
> >> +			operating-points-v2 = <&iris_opp_table>;
> >> +
> >> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> >> +					<&rpmhpd RPMHPD_MXC>,
> >> +					<&rpmhpd RPMHPD_MMCX>,
> >> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> >> +			power-domain-names = "venus",
> >> +					     "vcodec0",
> >> +					     "mxc",
> >> +					     "mmcx",
> >> +					     "vcodec1";
> >> +
> >> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> >> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> >> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> >> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> >> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> >> +			reset-names = "bus0",
> >> +				      "bus1",
> > The names of the resets suggest that there is single "common" reset and
> > then one reset per each core.
> 
> Two resets for controller and two resets for each per vcodec core.

The same, vcodec0_bus, vcodec1_bus, please.

> 
> >> +				      "core",
> >> +				      "vcodec0_core",
> >> +				      "bus2",
> >> +				      "vcodec1_core";
> > Are there two codecs? Or are there two cores? Your naming suggests the
> > former case.
> 
> Two vcodec cores.
> 
> >> +
> >> +			/*
> >> +			 * IRIS firmware is signed by vendors, only
> >> +			 * enable on boards where the proper signed firmware
> >> +			 * is available.
> >> +			 */
> >> +			status = "disabled";
> >> +
> >> +			iris_opp_table: opp-table {
> >> +				compatible = "operating-points-v2";
> >> +
> >> +				opp-240000000 {
> >> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> >> +					required-opps = <&rpmhpd_opp_svs>,
> >> +							<&rpmhpd_opp_low_svs>;
> >> +				};
> >> +
> >> +				opp-338000000 {
> >> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> >> +					required-opps = <&rpmhpd_opp_svs>,
> >> +							<&rpmhpd_opp_svs>;
> >> +				};
> >> +
> >> +				opp-366000000 {
> >> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> >> +					required-opps = <&rpmhpd_opp_svs_l1>,
> >> +							<&rpmhpd_opp_svs_l1>;
> >> +				};
> >> +
> >> +				opp-444000000 {
> >> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> >> +					required-opps = <&rpmhpd_opp_svs_l1>,
> >> +							<&rpmhpd_opp_nom>;
> >> +				};
> >> +
> >> +				opp-533333334 {
> >> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> >> +					required-opps = <&rpmhpd_opp_svs_l1>,
> >> +							<&rpmhpd_opp_turbo>;
> >> +				};
> >> +
> >> +				opp-655000000 {
> >> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> >> +					required-opps = <&rpmhpd_opp_nom>,
> >> +							<&rpmhpd_opp_turbo_l1>;
> >> +				};
> >> +			};
> >> +		};
> >> +
> >>  		mdss: display-subsystem@ae00000 {
> >>  			compatible = "qcom,glymur-mdss";
> >>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry

