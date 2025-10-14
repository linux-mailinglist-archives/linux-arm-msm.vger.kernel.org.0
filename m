Return-Path: <linux-arm-msm+bounces-77130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD3BD8769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 931E1189DAC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE39E2EA723;
	Tue, 14 Oct 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErIKlQPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E941EEA5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434597; cv=none; b=EfwF9DqxefmEkv29q84rNXZB0U+edQe2keTIzkYcVvARNotRe/7C2jHj20wRxxBCX5KG3s9XkXcPHbPr7SO+mkI4KKz9ldyTd8ps2bRa/gqKDgNLJslZEixLiwnQijwTy4HfuDwZO8rxou4rz82lHJEhWq+clX9tGrY6gBA5+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434597; c=relaxed/simple;
	bh=j0urYs90kPTFfhj6XsGDs3vJJ8OV9y18S3hd/gfBDIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcJEJCvHpcIdVKK3F9/1kvFyiqvbEwY34V4aUJ3wxnaUJzKP2LyBnk9+/i/HNqCaXoM9cy1p5Lxye3Txp/t4d3OBRLeZJMGsuuWM7E+ewPM0rgVoXKiaj+AFfb0ZKABJ5Oc79dYRmK40EM2y9HOhNIbZRtBxzf+z9e1Z/ttkxmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErIKlQPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87GLh018073
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RBVC+5/5ABafrPQ+4V6HCdRE
	5Qnnq6FFZbvfYQ5jpT4=; b=ErIKlQPZQMOrg/qnmzemszHado82YkEIlTM5k+Ng
	SHK2L/l+BM4TdVruAnnOwh8LzH0kStRIjZ5qkSTSaiSf045I47edY9lctn284X+Q
	03oOOW1yFDf9mWP6ofnHDlBXtZb0dHMCWPqIQkyTv2QoOCe+HJTG/hTbmg2pdCGA
	hGhlxuzTlViBKodnkYMk7zdDvgUvD2bN8xtZQMN+pt0Xi47tAkukQ70Igwukc822
	m929KjMPQdhFHrA3qZL/UBaA0n1Mi4/pso3yqeQddVyXj6927t41f0jeGLMiwpgm
	r4GkKnnqbzrhepUJUqgzK+meRFin0yLc5Wr8CxcP2NC1WQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferyxsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:36:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8787a94467cso298025356d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434593; x=1761039393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBVC+5/5ABafrPQ+4V6HCdRE5Qnnq6FFZbvfYQ5jpT4=;
        b=gZrOrjpDuaKn4mT4scKr/YUft/UUZLu+/jRQ4yB5Yei2jBchQKkjGmm4ApwnvgLHYo
         V7auF+e0eQOkx8HdwNY5VzJUCM/Afo/gb5Oa2q6dPZ72cHxnJyx4i7YTCpzbvXAi8zmQ
         dJLvyQTuYb55HEjqmNTlIptIr5qETS0LfyvAeHr5K3C+3IBTfLDlwuufBbbFlcDZpK3X
         323avSCvtwHf3nuN/lQD0VSnRn/W65mYrphlZSV4ZskwgKfoQ79ihltufeg1XnsrOFJB
         ZKuQxP0O9kO0QuOf6c6/Gl0iGe80BqR8eS0a8sQiH+b4nnImGbeFLH3hlipar/zR8RRm
         dMaw==
X-Gm-Message-State: AOJu0YwfwbMa1atD+vOiTVIlPTDj1lbXnjb7UBQQjenOsg6P15WCYNDo
	BnIdVxsL+MNJ8fp++aBAkfHHTEpGEcavDJfaT+46j/l1e5ksSInRH2ByzVI2KoKKQSGW+y2MnJf
	8Zug3O6jjsHdV3OBysikiciiuJRNmi+7s9yDU5XITMoy5lzkdAuPLecwZrBuL7A9Z2sNI
X-Gm-Gg: ASbGnctjKyjsch1Wixp2d+oMtcXQgrPA5QPheL8buCji5O9Ln10zA0KxEbk3gng4VSq
	oCe9zwSa/OKvbRsOe2yZ+yHMRMuaJ6hXtQ+kYuC5VCXzw1fY0zf6kRYVJ42rhdgQIuKZI9gQFzN
	njXOwSnGHYr9RQRdl8G25miyz5zvg7cWvaSrSMOazbxA1bXqb5kOjIbxqagmrwZwxBUqxYr09Bo
	Es6qAk7IWJP0LBhSsBJouiWBIUid1TiunHmBPaieOclGzGy9D+W5DluShbEl7Ldsom3dOvQpMR9
	MMWaTxVTtoYXIGCHYvYIe7fuYOACOe9eT6bBrPJUr0b3pv0n0zKgXlzKO96kgjquU0dc4cQ+Z3+
	88OQBqe5aINzKODUCQfX8l9RxnkQCuvtqiaPJ/IWsNVrE74D0d/AE
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id d75a77b69052e-4e6ead675e6mr362283181cf.74.1760434593389;
        Tue, 14 Oct 2025 02:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERrjyZhC8WYF5QIYCGn45rVK5JIGxvjZP4pOiPgTYBQZVXJXtDIxnFvrzcK8U0iF1Mgp1g4g==
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id d75a77b69052e-4e6ead675e6mr362282921cf.74.1760434592949;
        Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088584806sm5055024e87.123.2025.10.14.02.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <acfvx2smpoco3hakkhas3w3fybu36it65lpelbuigcyg2f4thh@qjbtzgxcsrxj>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
 <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
 <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee19a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mWwphNQy6DiE2YH7zW4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ODlhXm5l7ggtzsk0hORHTfNIF4piWC3w
X-Proofpoint-ORIG-GUID: ODlhXm5l7ggtzsk0hORHTfNIF4piWC3w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4F+HFIZo6Lct
 FCweUhYbc6GhlwowsrvF4t2PWrlAQ5zhs+OdaBMalUipYudgo0M9mI+f4Gxfk0ueij6fmCJE2Rv
 vkBlUikQMSQ4DZ8v6Hs3WHOilJbN0IZeJDlv8HARl59KGGuAlj5dGKZlTkxC8RssKHLiXAqp2pC
 bTtODMBhNbdj6jH8u7j/KDBdWkq+oeePuvk/9Z/WlfURX4065TSF91WojxuJy23xon1k03CswaM
 aQeiBY5KActfhwrnAvZ7RbXcu3KT2LH2zjygrI/OSlHWTDSRE7nM5Q2nW4+r9pBjkMYXDNzcq0W
 mKrt2Tu3JKyoqGSKXecph9QvToVk+pen4Bx1ZYFmdxheAYt/GOSXpVtkcsQT8+6z/5uto6mEgGc
 hp7OAxXJGpfjLece0/QNiAaiuy28sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On Tue, Oct 14, 2025 at 12:06:13PM +0530, Ayushi Makhija wrote:
> On 10/6/2025 3:46 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device node.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
> >>  1 file changed, 170 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> index 891e49602c97..5d4040376857 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> @@ -24,6 +24,64 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vreg_12p0: vreg-12p0-regulator {
> > 
> > Why are these nodes not in a correct place? Also, why are they named
> > differently from all other regulators in this board file?
> 
> Hi Dmitry,
> 
> Will keep the nodes at their correct place based on alphabetical order in next patchset.
> Similar names I have used in LeMans for these regulators. We have kept these name based on the information of these regulator we got from SW doc for monaco.

There is a slight difference between two DTSIs. LeMans RIDE uses
vreg-foo-regulator, while qcs8300-ride.dtsi got regulator-usb2-vbus
(which is close to what other platforms use). I think we should also be
using regulator-vreg-12p0.

-- 
With best wishes
Dmitry

