Return-Path: <linux-arm-msm+bounces-100766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHGqMqJWymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:55:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C98359C33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9050300E735
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E4E3BD622;
	Mon, 30 Mar 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxOWUOxe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yao2dEOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD33A1A28
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868068; cv=none; b=DiNjAVN1IBeyqFbPTcQf+ydQAqMDBpM1OcirCqETi92LAIoAXjKV4EtjRsatuP0RF9Ai0zccQ+RE6JF11hMYiD0KTOnAeD2WNg36MAyCwJxBSsoQN7WBpsbVg9f9kOQY5Jy+xwxDrTjzqFj6dC44EeXDqAxJbmiZTWUXAWjiP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868068; c=relaxed/simple;
	bh=WUi9IVh1uvp6effJJAPZ0/Y2/6N7smtfbdxTBxkOs1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncD6Xs1qPU3z7KRU/F5mE3U42GYUPxNjX4dmN3BG5pFVbX89swFZKBBg8QkLj7fPRkuI/erwAhkP8K8yOGdxAT9Usa9thI2gX96YzG0iDHUHlouWuAC6gVvUVQeQDHo93iJ2/iL5F3DU/oOMrWjw0VNrPBRJIpL1++TsCTZxiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxOWUOxe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yao2dEOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7bMA3539560
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YJ2JyPcsq9U7DBDPSkaRIIZN
	3F7dFSJli01wQIXyHhA=; b=kxOWUOxezfoWxwQMCYUlCUdCPZ3DGBLjMBmxGhT1
	7ywWYoZhPO7oIq8IhXJ+SnXf8Xb+cybDimZKpGnyzdtrfIYBNOCf5i3BQ6fhGQkR
	EOZ4mwPFvF4E9Y9UMdQJCPZmzHvGwTkj0NObdS3IHCp6TpVVMOSGNWDfFQ017XXX
	+jWzB1dIsaIgAccs3kqZt8fvsWfo+rztzLcZWPyg00aqWeOV/zzFZucCZEP4zljE
	8+S05h3Z1dDBDLDk1Fht/ktH902skXigHkhwvMuKvKj7BEx3xgS7LkcpJ1WF41AB
	CCpeTSwoqUZ72l4H3rJ8rTZK07XOLY7+qIxfqe6cDDdHsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59r5bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:54:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso178454741cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868065; x=1775472865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ2JyPcsq9U7DBDPSkaRIIZN3F7dFSJli01wQIXyHhA=;
        b=Yao2dEOuyrjLmPDefz85hjUgcbHkoByWtJiQDVr5gVRFo/XG8zAachsq1Y2Wu3/6fX
         CZrUuFYTxWSeQrm8zn7fng6c+KIvFxo/+721NPISsxwOiieaf2OgVUOYQRJ6IPGDyVt8
         bzWw6WjYppWNyY0z/t9EZHtMC07eW/rf62BTqnFfu2qceo43l8gmrzNIVtK5yWEkXf7f
         G8xlFEwzkt9LySbRZiRbUvnPVCRdVMzpRvH2KjgcBCiT7G2f3dn2Zgsq216vhG1CiZ2W
         a4m7//3jA4MWGYpGeqS92OkbiguMeMuWzgxFaqgFCOGnTe2yUsUiV9hVkYMkCA32R3eW
         gPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868065; x=1775472865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ2JyPcsq9U7DBDPSkaRIIZN3F7dFSJli01wQIXyHhA=;
        b=L8xRSBKue33XFXQbLAee3p8QukkAZDXbSBQ7b1L3u+bL/x2ASDtE4VSYEMrvAt50m1
         c19XqEeevkhs7Dy8R+zfGg/JUn9CZ22w8v1islbeWIg+jBNJnqB8Q++CUAPzgmgA2JHs
         W5tGEQl/UZ8a59psw7LGVoBrRkR1cV7b4YgYWqMIa0um8dLCMpmE5R7c9wF2s6n7aElx
         mDOYEZMBo0tDL5mrcina32KwhERkqzpQGwOubbSmdQkQ1Km0ftibYsx/s/wpyAW7nysi
         YMTHVS3cL+DWobpSB92Bbjmx2nYrsxErxM/Z62I/Xvd4SmvqqeWFSx5GbPgwa8BjusXb
         VMmw==
X-Forwarded-Encrypted: i=1; AJvYcCUlxGKJX0qwd0wHF2Yf/76bFN2bcfceju9xlu6xWJmajulsj1wMvAr5N0b33WbozXKf9KKVkd9WB1vNtB5i@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1nuCR2v/GfjQFpCYRaq69UQCKFvrl7fv+/G4vSEfp8y54C9F
	JiF9u349kWT/vq/JngiJDGf/WSHepQ3EA3kWHD2iWRfROnVpe3NBVrNAM4FMkywzvQzdzHRhjZp
	x13J9+mog5475P1sgzqw+uU2JCHA2FcCPGo0ls/teSyVd/xCiwbl5nMRGtKK/EEak53Tq
X-Gm-Gg: ATEYQzxrWbmTGQI+ZtvMVP4oCyCtyxa7cxwMDFXRn4t0lJTy+lJkQ8qGIDW962NoQly
	ybXfHRn20bq/bxOXh0Wl57RyxRDCS4Qzz+6AK4X/wDW1Ej5fwfJ1heRHxi+e5vyEFg20jMJ4CX8
	4gD1M9NPhzoHIjHXa9hQOGGKcx3fc74wIZeurVcKAE2XefnSJB3WMPDePyLoDYFHTMV0k2Dp6lB
	hsCJBgkg1M2WBnsXOjDWubTMy3+0Dj5L9tuqprdacdqjBVFpy9vh0Fq5UxuVr/q/ldgs0aSBFM9
	76Gc4mFKDUWDLs2VlaGvY5TJ3CPcoWrmt6pgXI5Ft9GXKT27OKdqvdIkdTAy+lSCwQQ304bqStm
	MbQz1g2PNn7xot88ZhtX6+DtjqbeokXcrB/RykQdfxYOky/fu+aeFmEK6ah7f4mHQVyB6ko5IzY
	MuO5T8t63N11vgfrieY/m6yDj6MHd6F1zzLtA=
X-Received: by 2002:a05:622a:55:b0:50b:7013:2a32 with SMTP id d75a77b69052e-50b994a4610mr189051601cf.21.1774868065137;
        Mon, 30 Mar 2026 03:54:25 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:50b:7013:2a32 with SMTP id d75a77b69052e-50b994a4610mr189051331cf.21.1774868064663;
        Mon, 30 Mar 2026 03:54:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145dcddsm1604208e87.73.2026.03.30.03.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:54:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, marcus@nazgul.ch,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abel.vesa@linaro.org, abel.vesa@oss.qualcomm.com, johan@kernel.org,
        konradybcio@kernel.org, kirill@korins.ky
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
Message-ID: <gjdp5kg2xffiequpfo2bjuafx3qjulltopid5z2u7jft7t7jwu@gvugwogdeenb>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
 <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
 <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
 <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ujXn5_NmTbveHCNMXqgHygkg-Zj1sf78
X-Proofpoint-GUID: ujXn5_NmTbveHCNMXqgHygkg-Zj1sf78
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca5662 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=S8eb6fA3AJYBljmed88A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NSBTYWx0ZWRfX7GGmjP23gTNb
 6dFqKej1s/5L4EdpfdjDHa8aL8fLIiEdbVwN8/WXuOSzKR2KamhlaPtp9NwjusVjAZsBQnxNaDW
 7VbAZ3V4+ZfSBQvW/ehDyDKUbWWXMYv2jZMi7ys251FtBURRLfVrFDmL5HCtCDcBNJQZI1bbRov
 ZwstvuaqFcf5sL8tqA2CM89FdUOJJAJinhgvWkkzTstJH+btpFjUadkdgxXSS3N7CZe2PYcfNvm
 m1P+T6MQmScu2whI93fn9PbDyqyo9WhowwbrSx8WsFz9KxQ5Ogx/4AW0NvGuGv2jXfRs0hS5GPS
 wf1xBMqT5kU1gL6Y8wfgc0ch3d2/5sKEejMoCrirC8mMG/3fFqntpIvBbVyldvHaDjJrlP+1VbZ
 p/Y/4jWqUmbv0baLvX21d4FH8HYzyxkO8TwbfXQrqumbwidEu5cY/EQasiQYj3ikXZaBbgvsgW9
 kPK/3bMLGnzwmJJ9pZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300085
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28C98359C33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:41:57PM +0200, Konrad Dybcio wrote:
> On 3/26/26 7:30 PM, Maxim Storetvedt wrote:
> > 
> > 
> > On 3/26/26 12:33, Konrad Dybcio wrote:
> >> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
> >>>
> >>>
> >>> On 3/23/26 13:17, Konrad Dybcio wrote:
> >>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
> >>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
> >>>>>
> >>>>> These use a common dtsi derived from nodes that were able to work on Linux
> >>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
> >>>>>
> >>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> >>>>>
> >>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
> >>>>> Valentin Manea, which shares device similarities:
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&i2c8 {
> >>>>> +	clock-frequency = <400000>;
> >>>>> +
> >>>>> +	status = "okay";
> >>>>> +
> >>>>> +	touchscreen@5d {
> >>>>> +		compatible = "hid-over-i2c";
> >>>>> +		reg = <0x5d>;
> >>>>> +
> >>>>> +		hid-descr-addr = <0x1>;
> >>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> >>>>> +
> >>>>> +		vdd-supply = <&vreg_misc_3p3>;
> >>>>> +		/* Lower power supply is not enoug to work. */
> >>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
> >>>>
> >>>> How should we interpret that?
> >>>>
> >>>
> >>> This was in the original patch, but using that same regulator appears to
> >>> be enough to also get touchscreen working on the 16" book4e. That said,
> >>> it still does not work on the 14". Something to revisit later...
> >>>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&panel {
> >>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
> >>>>
> >>>> I think it'd make sense to move the compatible from 'common' to the
> >>>> 16in DTS then too
> >>>>
> >>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> >>>>
> >>>> this matches the common definition
> >>>>
> >>>>> +	power-supply = <&vreg_edp_3p3>;
> >>>>
> >>>> ditto
> >>>>
> >>>>> +	no-hpd;
> >>>>
> >>>> really??
> >>>>
> >>> One less thing to debug while previously attempting to work around the
> >>> "illegal link rate" error, which turned out to be related to eDP 1.4
> >>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
> >>> booting from this dts, such as the x1e80100 16" (as it might be getting
> >>> a black screen using the current x1e84100 16" dts, though this is not
> >>> fully tested).
> >>
> >> So do the 80100 and 84100-equipped SKUs of the laptop come with different
> >> displays?
> >>
> >> Konrad
> > 
> > So far assumed both 16" variants to be fairly similar, though one
> > valiant 16" 80100 user over in the debug thread did try to boot via the
> > 84100 dts, with no success. Instead having the screen go dark after the
> > first post-tux kernel prints.
> 
> Does switching to the generic edp-panel compatible (which will parse the
> EDID and try not to be overly smart about it) help here?

I think it was not possible because those panels need special treatment.

> 
> > This was strapped together via WSL though, so could be there was
> > something else at fault, but strange it didn't at least fall back to a
> > visible initramfs shell.
> 
> You mean the kernel had been compiled via WSL? That shouldn't be a problem..
> 
> Konrad

-- 
With best wishes
Dmitry

