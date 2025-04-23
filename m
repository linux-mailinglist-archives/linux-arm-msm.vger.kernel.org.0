Return-Path: <linux-arm-msm+bounces-55149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D90A98C1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE1E18819AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B462376FF;
	Wed, 23 Apr 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTgqP1+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A723026D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416713; cv=none; b=NyvDetyzWzNrzU//KUmXnXbaQ7+fcxLRF74iceY4d19ondAlhxtEkTuOb/GIqGdmx+vBtvjel5a069xNgrt7eb/+dNsRMxdmrU98in1yHBhDjaoLkqhtNVlQAi57f09eGkjGjlK3Qgs+UB6s8ghFRutsREup+Daz2Io4hZEtZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416713; c=relaxed/simple;
	bh=QQHtOrdweEikUQHTCxA3LcUXxjA1M6UDeACDwl7O8n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrggUGgqaaZFXkQLhF6rnLr91ElDXKT8zldAoXsIpME6ckA9SserR7sP8SSAftU1naxciS8Dla3QqeyQ2vgKx5CX997nA2CvJcYa0TVuyPrTIs0lfVtpN4ywkmHoTlLDBTWv4kdvB6T1MT1kXiU7NOmwnxeRwoCKWJvUPgFywGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTgqP1+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAPUNR003025
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C1pEN0V7ta1blhUvOSjeh8t4
	4YefebhUlQwfthVEXOM=; b=UTgqP1+etb3ty0z6u7O7hwoOAlcDHh5vsbXu8c0z
	rwfN6RHS+54OuaLDkQPttzlnSpLzH/+b/o4UPUfSno6Ii6P0XKAvyFXhBYXRqGKD
	oSVtEJdBFsvlTxZj08ZjWxSvofBfOQGBlTPcY169WdwxucX2FL/eff9cDybipwQg
	L1Qq5AgQRK2M9anMqZeVzx3hPa0NYXdoKRkVQzQDPdtB4qk/1SHO7YQeGZPh2cbH
	IL+pXOWUaZv1EU8Gwk2Q2eQFVCrwM7UQpGzZ7fgl6vaXirhM0sHUheRN9QdZkczN
	MOXHY3NwAEfwsmDAC3N0/Dbj+KHHsbbZ1YErmYLVmef7zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy2ag1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:58:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so608489385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416710; x=1746021510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1pEN0V7ta1blhUvOSjeh8t44YefebhUlQwfthVEXOM=;
        b=EIffZONv26uTZvaU15zc8eSYN+GdKWDMGKIJ8b6eED5DDX6fgcJNidvbY3yNenhTOp
         OhJTLb1rb7CXqoeuF5n2YPTFQxDtJucmBKjRD9ggqMbSZzsSjOgpFcn32jsdlC1uBhrf
         r7ojnSPOgV9U5hxWlBQB5cMgdeaThBsUVYCvpG8QJMez0Km+Z7dsv5qD7vHC/Q3LOskz
         DWiCJ7713wRkKp6EqXlFTsbd9VDPxGYBfBHI7WIDlf6uhgZ1wnvYn75KebeOsh7nUwuw
         KEH96ySiqjw7H0Q53tIN/xlB47uWj7+GAJJYkwgabOxSfNDbSUX0tg2G2T9Ha/Behe9Y
         8LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/du3JGO49reqkPaVOgiC4GamRJiG5TGJl/nx/eC/kiAwyaBOs1T3NMBE0t60u1IbjuQrh7R1rH0faaqyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cpfGqk0PH0a11QvmpyZRaHbwiMk/fmZ2QVRTmgPefVH0Dk5Q
	PkkzlD9LXlMASrKxrfvDeaQMxnohhLSWGasU/bi62MOSqmYG4+La3MpISr33C30yvOjx1SwUBjb
	lVM0RG8d0i1NOxK2j1Vrt+1VENbwZCdnTMtHTsEvCFqlhVmzIMyuNhT61XfA7JU3v
X-Gm-Gg: ASbGnctYiEHcMj0TPXe5HwevxoYvDRhKlGZJTkytYStUUKjhTmGOXjcBV8vNhPSJLEV
	563BuUM+NkTZ9EAUlHpdhXiJltSRXqdQBhiq38roimSa1p86usqydfsjN2E9HlsG6Wv6NaN2m+i
	9b8j+aSO2VWmKDjzgoWOpDoxEYXgAA2wkTvCgNP4/0I8YazXrck/cdBnHAvmb5wWJjPtemy8NZf
	uWxD1x5e/71+CCQbSXuEm3nd/S0EeAl3buWYw8hRVK2DVIyUswWaOPSjh2fXWZ58MWR25Lp2rDk
	SMxjSK3yoD+JZnEpPSpDj+HAvbK/hghPJAMogXndKVP6G0a4otr7oYlFnhYsZNHmoOSOHbp5YUU
	=
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr2925735585a.18.1745416710312;
        Wed, 23 Apr 2025 06:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbMHBNHoF6fiuAveTacg+V4AVRjDSJG6H3O7cmW3Wv+n7Ux0OzCJ4jiXurojEiqthLPkdZuw==
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr2925730785a.18.1745416709828;
        Wed, 23 Apr 2025 06:58:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e721ab8c6sm461722e87.232.2025.04.23.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:58:28 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <5mbgo73lfr5yc7nmdgzgdogdtog6cfhqya7ekjjd2guhmogtml@ngoial7rsmrh>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
 <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
 <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfX3hf8YNtI7IHN vUqAgAL2CJe4OWpKDv9SS73sz8gWQSnR0hOrnaCml0YlueMRm0wONLfAboRzXrLK9EwqxoL9i2k AI6s3KYodzG3a7ZjaEaAA3xNZeZwijRv8zuhkDru3Q9VLOk6K9y9MWadqDlgXJENp7rpeBY8SGw
 b1IDV/aWy9tWu1vHCwKENP+K3wcfBeeHnUBgF5b+xjAY2RqTP1pEJsSg9/YGhcT+NwuO4Yej9Q0 56y4emoPCwDWIi77vZKonDc2N6Pfmt5DITgdijPQsmBXzaLf8fi8jTRIBYpQj48Bsj/mjeraBS+ HRsi6gFMm3LAkeMp7IPzi9KNQdUYucHZy7GVhHGsTan1bLAFFzGAAbUVGtiYakoZRPlrkjh/ohG
 d1/FWTkyiVfLIJUZo7NyQWg8e3qZkqNGtuVEtlEyvgkowGCAOIhaH/Du8DgUzKrunELUk7hT
X-Proofpoint-GUID: y4GJ9h5tGlq1FHoftOpSgQkkXlboDVO-
X-Proofpoint-ORIG-GUID: y4GJ9h5tGlq1FHoftOpSgQkkXlboDVO-
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808f207 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TmeSYMYVi8BcKzM9Xd0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098

On Wed, Apr 23, 2025 at 03:03:02PM +0530, Ayushi Makhija wrote:
> On 4/17/2025 4:14 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> In the anx7625_sink_detect(), the device is checked to see
> >> if it is a panel bridge, and it always sends a "connected"
> >> status to the connector. When adding the DP port on port 1 of the
> >> anx7625, it incorrectly treats it as a panel bridge and sends an
> >> always "connected" status. Instead of checking the status on the
> >> panel bridge, it's better to check the hpd_status for connectors
> >> that supports hot-plugging. This way, it verifies the hpd_status
> >> variable before sending the status to the connector.
> > 
> > Does this work if the Analogix bridge is connected to an eDP panel? In
> > such a case it should report 'connected' even before powering up the
> > panel (which might mean HPD pin being low).
> > 
> 
> Hi Dmitry,
> 
> Thanks for the review.
> 
> In case of eDP, anx7625_bridge_detect()  will not get called, because this below condition
> in anx7625_link_bridge() will not get satisfy. anx7625_sink_detect() is getting called from
> anx7625_bridge_detect().

Please mention this in the commit message. With that fixed, LGTM.

-- 
With best wishes
Dmitry

