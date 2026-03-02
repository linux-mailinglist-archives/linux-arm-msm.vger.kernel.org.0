Return-Path: <linux-arm-msm+bounces-94966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PfZNCajpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:48:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C51DB203
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6D24300C02F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBC63FD14D;
	Mon,  2 Mar 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUl+8L2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIw7jB1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEC3FB073
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462591; cv=none; b=szPTsKfXEFIPT7ei88w5GcEDi+MJs/fZPRr06rKbdnQhoISV9KQVbQ+vIjgQ275mMOAVS0X0K2ulQtKLmKy95tf+n+372+L2hJyIus7/6M845u4KRS7Ks2bFSf7TYHQc4MMQO4QVCQ3Zo84QsQpUTDH6yYyfWn/qJChYzLneRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462591; c=relaxed/simple;
	bh=AtbJOVc4K7KZsqfGieB7cmSKnZcEPp22dOb9+UXyb8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdbOgAAHGf1j/fQx2zNcxASZAekzXLT1XHvDiLxTb6lQxOfXMflMTKr/YJmojH35DTbfhVQAGU0kKMxVLXB2DQhzAFD2GJFaaj9IgnGcZMIaXirVqNSm7RmsANiN+ZEErkCt5pJWxxD5gvTiozT+GDX6eMfDJtavSjg8k/DpOVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUl+8L2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIw7jB1z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kJu1291359
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C71hJ2AmsLQvRaRUminhP+iF
	E75sW82abgD/Ujt3N2E=; b=BUl+8L2K3ctcGbZXlNt5BsxC+QO5lTIqK9QM+kyG
	d0CMsoMbbeCvGC/0aeEsJ91UxGBoY4l5J8hthhPKYkGMqvAVWog7dBtT6gs0AJYv
	qPm30yrOhqJCghLdDvUiZQyh4XovDYqLW8QYN5LjORUBvXC4+ZdiGue2YUMUy2N6
	eyOQqsGmCKR0FCEzxsjziSpSBX0D7Qs0ZCgjautF80eR8UGA56eUnofOSA6oZyYU
	CImCCgFkWv0Pm/PcKVr8ZZurC9EsKrgjJcAZVu5bSDNPhjO0xxQ2VTLenjBiJyeE
	0IlPSd9ErqrTDHkhsj8r/UElpJdxyZkRKDESqwezP0efMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku12fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:43:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae59e057f1so6184075ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462588; x=1773067388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C71hJ2AmsLQvRaRUminhP+iFE75sW82abgD/Ujt3N2E=;
        b=KIw7jB1znoza3kq3HPcrvaAUQWkpAbiIaPb96bv13PUzZdDovy0kWtQcuBw1U198bp
         SAgr2aZcXuwyeWqpWi7+nuSw9CQWne19RwLzjNzxnknnK3jDd4rYZai5+w4SzT8E9hTK
         gnHgr+iLpVxFYOp8dSM9sE6S4c2dOh+gAtsUSASLo7U2i7V187Czifh3ECyaU5NPASnU
         qPsymLEC8yv8iC62TGTwB314NTR/kgRKnJu2H++s6bglqO/ULJ0YGEKtd8ohKeCE3ksZ
         IlwdU45anhx61GUPILRXBJ1QGPAPlXWYT9ltFUnfBVDIF8xhJ1yat69uZtDVZee6Fg+2
         bZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462588; x=1773067388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C71hJ2AmsLQvRaRUminhP+iFE75sW82abgD/Ujt3N2E=;
        b=nJ0iCIPLvF9q8+w7gnvt8sSZ26fhtv8yhQ1VWOekCki/ECxMXjtcZ48xlwmnwLj4Fn
         81Tt7qS1DSwrokmZzEmm4czxG6RAHYbprqxnlBn5ZyoTc+jqe8Bqs5XNj69ggQHUKsTJ
         dwv9S85I5wDW5RMvnKhShyLrqX8UQi6cBspw5mCwjF6+dyto0GidQZXH1FBG6tjZMNyI
         rlDxMboHb6KvvtQPHJ4ABEWjHUcFvfDhyO3REeUYtqZmczlCFQws5zoiOCYmZbl+Ub99
         p08alqZ2m37q1a9Uw4M6y46xh2HDZ+rJMKfQEDfIoRbMNV0cR+3IwKHxyGI/WxARDDdp
         nfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgW/k0TjDOLTzl3kH6iV4pNpDibMP5hrX+NBfvYBI6OaLuRI6DVE+KwQalcYf+1EErQbpCAhJuUB6VyPrP@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGJB5wasVLx5t//5/1SWCdn+67iTEhn69bAhVdVrew/Le3z9N
	dWkOj9tWWtqUyz6GpyZWdVSbY+BuZu5njoyRiwPNIowEpFvMYpYTZx35k/WZ7YxqFGm1jEm1V80
	PXO8dLkL4vb3smoYVfsfsIP69bLDhof17UEXTQ/1SkcKdRiU8UCX/cGzt1aPjJl9xfnpC
X-Gm-Gg: ATEYQzwAUU/On4ubzF17QQSjRnf0Ew1V+uZLs6W3gBWl6LtqZ9EL8UDPWMqGF+Tz+0k
	4cSLtzL7LzeasxAd5pmldN08Jz6tf5dTSSUKEV7qrbqiMgHpppgPbCeq7NQh8nZ0z1/I7bT0E1m
	1Hc4WnAMoQljaNdh+AWsic5vRocj/aiSVZ3Ca1TLMNlDEo7vrMXyc5Wig2gSeRZ0kcrNpKmRP7/
	7Yur7+8qohL6gc27/gtpgFs3MqN04Hsqd7/x7n2eBzC5fio2SCipp5vxLR2Fnpd00IYxaFavz+w
	rUaUeWAxx8E92qyE47V1rqpIwdqrwUKaHpQO3MlySQGFE1nCoE08VRq7YRkvmWrQN5+zCdZwlQt
	Uj3b1NDnKZpQ/3ueVzjCk4Ieln9SPSeQG1YCwgvQGMn+M4zdB8C2qqczr
X-Received: by 2002:a17:902:f542:b0:2ae:5a28:cb95 with SMTP id d9443c01a7336-2ae5a28d42emr12492125ad.7.1772462588406;
        Mon, 02 Mar 2026 06:43:08 -0800 (PST)
X-Received: by 2002:a17:902:f542:b0:2ae:5a28:cb95 with SMTP id d9443c01a7336-2ae5a28d42emr12491965ad.7.1772462587927;
        Mon, 02 Mar 2026 06:43:07 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4d83c1a0sm41438925ad.1.2026.03.02.06.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:43:07 -0800 (PST)
Date: Mon, 2 Mar 2026 20:13:01 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <aaWh9ThZJK49Ex4o@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a5a1fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=jUIVJCPa4oveVBRgoBkA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RS-cRe-64NeDyu6yNlcsrF3XTLvz7Bmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMyBTYWx0ZWRfX2O6zgnPtpCAh
 I5HfBlPEi37uHshrObrDQZX1N6dP10pf71judqZ5kzK4YZHRtqyohlH65aYatDsUNRUwbO7AE9E
 NRljQCv7jk4ZXftrPAu1KiwFGKTItJI7eK76vcNfsCMcsF+LXyG6pO4Ad1bxnET/6TS5G/otALp
 DG8SNgtVRswYd+Rtk1i/+pEhgzcaTB9J+mBUt2f56C+miMWtC+/ADh2je2Amm8CWnrx+eZWEF/w
 0rx5rXgF8Ok3BtCY6yWyQUlVJ8NUhMEzBz63vcK1lEL5AwNxgevvCgVmAvevfGgvQYouZhMOIe9
 eaWNV2dzIDGjOh1o/UXGClXALlTjqFEbOetxkHq0cOiUznRwYuvGgFUv5KnqFsJxnpAf9RUykZ9
 MgseDt7lRBk9of1iA81mwI5O+XGdg8g33nwJSPElBbKVBe9SxG7p3ZZEI1OLksn3lKdrqUjs6cO
 uXZHiC59BSG3xOWRJTA==
X-Proofpoint-ORIG-GUID: RS-cRe-64NeDyu6yNlcsrF3XTLvz7Bmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020123
X-Rspamd-Queue-Id: 594C51DB203
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94966-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mchunara-hyd.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:07:33PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> > This series updates the device tree configuration for the LeMans EVK
> > board to support dynamic selection between SD card and eMMC storage.
> > 
> > The LeMans EVK hardware supports either an SD card or eMMC, but the
> > interfaces are mutually exclusive as they share the same controller and
> > resources. Previously, SD card support was hardcoded in the main device
> > tree, preventing easy switching to eMMC.
> > 
> > This series refactors the SDHC configuration by:
> > 
> > 1. Moving the existing SD card configuration into a dedicated overlay.
> > 2. Adding a new overlay to support eMMC.
> > 3. Updating the common SDHC node in the SoC dtsi to include necessary
> > resources (clocks, register ranges) required by the eMMC configuration.
> > 
> > This allows the bootloader to apply the appropriate overlay based on the
> > desired storage medium.
> 
> Is there a default mode of operation / extension? If there is one,
> please define it in the base DT and override it in a single overlay
> rather than having two mutually exclusive overlays.
> 

The LeMans EVK has SD card slot onboard and eMMC support via a mezzanine card.

However, if SD card is configured to be a default case in plaform DT, some of
the properties like 'no-mmc' would conflict for eMMC use case which cannot be
deleted in an overlay file, and vice versa. To avoid such issues, definied
separate overlays for both which gets selected based on the actual connection on
the board.

Regards,
Monish

