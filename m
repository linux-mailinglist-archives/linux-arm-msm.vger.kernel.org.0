Return-Path: <linux-arm-msm+bounces-108069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGpGL8IICmrqwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B25631B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD9D53028B45
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFB82E4257;
	Sun, 17 May 2026 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSmJ8zbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvaI5IBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098A34F275
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042427; cv=none; b=SCq1OKDeqIuhWTV0PY93ouqkvVqXX/rhMfEAWMGmRL/SdtyX5vbGZw22w1jNJjOg+KWZbFE9oWaa7cex5QffnF/BL4bWbOgnwAT63BMUoeghB2AbOFTijHglfTsQZikSbkdUDqbdphr6HhI/vB3lcrrBWngtw2OEC4O7iqvhXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042427; c=relaxed/simple;
	bh=KH2q6ukcbp5AaSXp8cEFyogjLF1WV/NKI+JfbIs9Zxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzxaYGQKKHfPpheQQQv+VGj08oSxXulCaRNtgbsB++PxOet4LAQTgPJh71RmcRAPsmlJf/XRMWEWb6kaA/h9DERqsSf2ywQL7+1f+oexEhtDcoIwEFqGWcJhh7FkJDAnYfzvKMyr6Ty2XpdM4OYLTSJDBKQM0CnE4UiWJeVcIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSmJ8zbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvaI5IBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H0idHq2413723
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=; b=SSmJ8zbujuLqmSrJ
	hP4SOwcuU2/B8tj4fWaGfPBNfswDzwWRaUaQMHW70GI3sgVxCVQ7v3ipcL/Pk7Xf
	9ijtK7lEPicROvKX95rXsAi5bd4oB6Mzz3zVyjLv/xXx4axbdrJAB9Su0yCxVfuT
	aqgwaDyVCDhhP73wUZQ2uA+JydvmdKJcyIGFsonoNeh+T1D0K49nhik/l3ThtVb1
	oGRMZNV8mQmfnsT7hUk7OUdc4Km1xVeBqpKPHT6D1xgY0ZSBJfRuEOaPZhmsHa0A
	9O/OhHgFGf7fxFK01WyVOmONmMX+R+of8+EmEeN8mEs/ctRFKjgB4WV8tTd1CDvn
	ejDWNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj8a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so27905791cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042422; x=1779647222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=AvaI5IBIahVjXFq/Y/kbe+uwvUk9WKPcCMFU3WhdXyc2qNXvz7Dr8HMp35KHDGTzh+
         OL4KEebureNKWH5DHbmuXDQfTT8JqJnFAVHc7GuGFLCWga5orTEyCHdqv8u3NyysBqPK
         8+MPBnMO+6xTLJXK338sDSZRjUtmtE/L3tV8lmhrmDoKKfk+jnYXd8yd8HhR3sNe7bDs
         SOjlRel9nBNdMi7putTMgSdZrzBQq03YpldnptRYf8U/jEbrNkGujXQifRldP0qqXtZG
         9jKCNcJchNJ9/sh93GgA4Dhw/n/UB4XJtpEQWVYGdvhsdndYAHM1XHOSGR2Vm+gazkwv
         ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042422; x=1779647222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=ApZtc0Sdie9PMwD257wJRc8yni0+aun2OurKIck1/UOsjecj2d3+4oQ0NYgUVRBbLO
         arkW3zu8f01CO5rDrEJ9oBL2gyv9UDfAskaPJuEvuunVQs5jBWom5UzBV8jzJxFB72p+
         Rh8Cl7HyfB3KaXjCU3xf3YZ0QDov62mCXq8oDwyIFc8ezEesHKDRaB6MYGU3DN9rMaBE
         esQiNLGDW7Lw2+FCi8lQvgDaDtb0EWicmFQtP7e/BJpd7qdRUYr7Ps/PJ31t6z9IdvNr
         C4ViuFyj/T23HzKxioA63x3yU3nx+54x3aUiul7OHRTGgEqrTVWrjWSw0gWYziQ6jd2s
         BCtA==
X-Forwarded-Encrypted: i=1; AFNElJ9g5dVTnk+wZYOIf0O3zSW9H6NwpOI+4gRLeVZlq5gBwuHbv7CUF0wyrZLfohe8arhJBlrbKfx2gYuaohmF@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3nxF9PuVA2OjIiOu8J8DSHNn/rDNcAKN6IiEDQ+jx/o+iv+e
	raXX0UNvN7WRtKdJp0bP9EmgtYEy7Y/GzDQxMfw4gN9M3PYjcVwbQ8OHWb+PFF0DZEE9cRZ1JTT
	Q016VTXz/44O4YDUZt+Y2iI6mwZL0vJD/mZstksEDZHC/oP9+ubrwq8oFrxhIN3UmLJyA
X-Gm-Gg: Acq92OEnJgvbjhH5434uIGyMekQC7CNluDE/EnJ2tAjm1BaftVYVeFeDSNAk30+TfpO
	x/cToEoQP5m94SBD4I8XHtHAOoUYDd1Y0jkwyXvnp/kOvKle1VkhjHs3sx543rOF8N5bVVFVyLx
	G8GnkYjPIIq2L3F5maTxZhwJ15M494RM5ZEEgPVEfMZY6QIj4tvXLonVbgj/IeOtiXvgxy0skmw
	HUtr4+NNAJ/01zm/ttPRbtSl1WzT5InqrcL0AlWI8dqhLWyYYCQ40guahZwAkzuTtRuOOOpIkD7
	BwAq3KV/3kVsM/KxLaNeTAhMSGeklFz4pjTnnmj19OwMyqxF0hAlKMkh95vEK/zat3oQyvwGxq0
	f+6ogRj53VBiaBlazPCyNg8NoI0H4eBHEVXzu4Toh2TuQJTM227KHkM4dcgzrkkZI/MetBojErz
	wYq/1ao+13OHFmbNjncjoyBYyxiAO/w6nrdJg=
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817561cf.36.1779042422354;
        Sun, 17 May 2026 11:27:02 -0700 (PDT)
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817231cf.36.1779042421835;
        Sun, 17 May 2026 11:27:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c885sm2814535e87.11.2026.05.17.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:26:59 -0700 (PDT)
Date: Sun, 17 May 2026 21:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N6Fj1y4vZ9jEJgyufugdRVN9CYefbVLG
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a0877 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yUhn81BH2gEySD1AKRsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: N6Fj1y4vZ9jEJgyufugdRVN9CYefbVLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfXx6IVJMnSXM3G
 YlJLtTVzCGu8Gn51b8wiTXJiA2Z9eM4dju8YxUAunml5jyinFY7cSHkAWTAg8rFYKdEm/BpUyOq
 3XfCvCF3chQ4QW1aOS2qKdRFwXQTI+jg7CLPIOXHuTsmzm0/hmwbfHSB5ralR7iuPNBDma/GH2d
 9fWh2p8c3BOww0OPyg5R50yRKYIWONRBXhfmH3KYoLt0G9sL8kcIi5x+3eszEdtPQOFSaa5Ci9I
 wgXlDIlhDCHtj2n02JZqYaNzFOMzMymT5GcVYXiN3EDSYBSA9UJG+vZw/R7p4V9/1oGtobvgViq
 TkRiu4l++C5z03I+AV0HVw5qXEnqCBDem8JW/8yw4kX7vgTXBmMe/hALCyTJ35f1MItc1+2A62p
 OPsnecbja9IPKiHsdWCIbmlpv4xpMbvZ8fsdL4cz1KjJTZAp/GcCCZXZpdX0udl9w6cs7KHTLft
 WDrfRYrRGP31ZABaKyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170198
X-Rspamd-Queue-Id: 1A8B25631B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108069-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
> 
> 
> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> > > From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 105°C.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
> > >   1 file changed, 135 insertions(+), 30 deletions(-)
> > > 
> > > +
> > >   			thermal-sensors = <&tsens5 0>;
> > >   			trips {
> > > -				gpuss-0-hot {
> > > -					temperature = <120000>;
> > > +				gpuss_0_alert0: gpuss-0-alert0 {
> > > +					temperature = <105000>;
> > >   					hysteresis = <5000>;
> > > -					type = "hot";
> > > +					type = "passive";
> > >   				};
> > 
> > Why don't we keep both passive and hot trip points?
> > 
> 
> Need guidance here, we are keeping passive at low temp so still hot trip is
> needed for such cases.

I think we are saying the same. Keep both passive and hot trip points.

> 
> > >   				gpuss-0-critical {
> > > 
> > 
> 

-- 
With best wishes
Dmitry

