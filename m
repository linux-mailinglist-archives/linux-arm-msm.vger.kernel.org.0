Return-Path: <linux-arm-msm+bounces-94603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKK+FZzuomny8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:33:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C692F1C3435
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 860C03080C10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11642D1913;
	Sat, 28 Feb 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKPCazFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlwYLtkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE22DAFC2
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772285525; cv=none; b=X5Q5r2X1Hj8bM3hzP50AMoTXjx1NjnxhcZRI1LuLRiMhDEnjgK5fWe32VLid5q2eP6CNjNRSL9f0lMoDTo5Ss8SMYPXl7KYP+4RXeu2dhcUNl3NYi2Mdt1St61X2/NRnk3lsHsVhPn2fS/SpiOa3KXMIR8TvP9/aKoY6sOoMwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772285525; c=relaxed/simple;
	bh=rIhBLIA1RjHb80PdfinaHcUxvbbAeZS66b1CPtp867Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqn+JmsoPZMcXQdrXeL+tiwuTXX6lnWC1sneMvDcybVzxjg7khxjXhrrjshQuKZc36TBsCwqHeg6w3Wg3BbivQ9SK4HDtTgQWLAKxKL3sI6pKxXS/oOJwpvbM5BUmQrMorgcnh/0Ze6PExDN5a7PuXXce1UW5ZsGy70ILdiG508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKPCazFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlwYLtkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90BOh2683913
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tPKkssMOw7u1G3FtJ+5DZxGV
	8FHzK+dCLc4VoiSMY/o=; b=DKPCazFO47XyaJheoev84VdU5DZ468U0I1N0z3K1
	5qiHDGt1jt2hOhFISX00wmCR0zPXX8Hbid+bkBTNP074wCRL8hPTz4tq4UldQgE3
	dAm3bgP7bFcWmHDz381g2cTUwUyNZg7NV2Lh53ZtUI7+wYjf7dFd1SJKqvVX6IJI
	umqjaYbxGb4qqSZ7jBPGJTf8mo2VS+c/bw6RKc4as4BAExGnfgncovU4zVM0ViHC
	gs8yk5jiH80fcepBeIKiTVOO+OtXf4Stsk/dMrAcP/6/Wa/gyMf7lvPyX+If5oOG
	9TUD6HuFG1fsFndZa+n4CapRkwIfe8xjwze30zFId7qGEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd104b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:32:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso3774746885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772285522; x=1772890322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
        b=UlwYLtkBtCNbeAU/9oC1a1WHKbAIt9UvfcTqolQqemQaX8LX/J4Xdb/nZA1XxF/6li
         jFZl0H6ZApg8HTvxLq/FJlWeKb5sjTyTce5kfMbswLxAHj3MkuhUr41YBgQ7u/R4lp1m
         TKr+tfQUcRZLmfKxEvqNlsrvVee9aIgTVu+dR25acauiU9fkyW/vjLfql7OOzFknTaJb
         BBvtjunWx+uLwk/A9NgJ0d0bTlR776uuNNnl9JHwnR6SSTz+bFG0vpNbKAevZE2bZ/gd
         6OI9mp6n2Vh7LEEiZ4HIfQkm2a7wLgOT9vu38DEkPqDQqKHsfsjsW7Swh9JV69cpCQVI
         /I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772285522; x=1772890322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
        b=Z/PwkO/mbVmNdpRhlA4KBjEdq0xoDCngVsFdhocyRumyDt1So3DSMLO7HevZnyQ0F6
         BugTm6GmG/G+kgBaWseOYPIyEohh6s1pKUZodvQX7wIG0vPbP1EH8Sv0jPCPp8xPj1vb
         BRfX0Zq0YOg8G3NaeofVJ24e9X/dDCxs5MBZJrvrkveJY3TnD7z5RnnOhIgP4I5Iz8MC
         /XFRoMe4+YeIYlgk9uqq9mFmgVn8SbqpHFyTiPShBGH3xsD5+R3GeLIcLP3KJUhoFrfo
         2amrdGQPkYSZqjORYy7ZWtNN8Tc7eWJv+cHU4GPAcN4B0AMsINt5qElxTOhSRSwQdOeg
         uOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDWmynDOK10CjYd3J2Mti3C8vlTI2iOAeW9ZX8z/IzPczlAyRVxP/B5crA135Ppww88ov+RzJIjQxUT5x6@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTfTBOZM1fIipFcjuM/D2tKNg7yDqiWUcdsWb9qiaxBST/syS
	sJIidUSwU/MaVOJpR6HSvkq8S7tHvfbS+ez3Z92exUUWMMaW22MZ7+twCm31nvlo+0MvDqW4MAO
	NjvMaGWrj/IOWlzcXA3g/J4msG7Nf1Fi+/Hg0L5DBZ9p8Ds1q1HJm+S03DwxW1BWoThKP
X-Gm-Gg: ATEYQzy6GUVuxeSp/n37yMOuYj1t8h1P2yWJ0084OzMffSSeKQjO9GqVJ2pgRBcAfz0
	0d2zBx4aW9ZK3SKlHZ5vpE+D30kfpOqaAHyReQVSu0iQhg4Nboij6z0yjdvHwP248fEO0yokAnz
	XY37lbQ9S89+J1Uj2+i1qLWn92eH1mPnJSP0l6pZDyx6ZTvNJn9rr8ztwar0x7zNICzU/cdRuaS
	EwcF4GthbGN3l5s5Ex0Mv0GXNousw3PU9yPzeZdH//+iJLWCtncsZCzxZEHzdXb/AmzveQfFNXV
	6IlHqnUQgsHU0J57288NQNXWYAMd2XnI/lnSsi4uXNnxLrKVMnU2+cfcUdkmiq1aPpW1R8QIfW7
	ywu+DKURYtZBbxRMvLmjbpJxT8dXDijDQCzOnBUSMnqJ4fEnfIwxg54Yoiecv/ycHO3VEWafdyF
	ePr7CQlV7TG26w59M4Qq+MnRpvufs0S9f30gc=
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id af79cd13be357-8cbc8e79948mr809014985a.59.1772285521754;
        Sat, 28 Feb 2026 05:32:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id af79cd13be357-8cbc8e79948mr809009885a.59.1772285521246;
        Sat, 28 Feb 2026 05:32:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11a12923dsm2815e87.64.2026.02.28.05.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:32:00 -0800 (PST)
Date: Sat, 28 Feb 2026 15:31:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228101907.18043-5-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNSBTYWx0ZWRfX6HCAeGZb7X7p
 yFZ7ZVethNXnldaaCJVgmcWuFuftWK6lCpnBXdzKyXoP9mMfDeEVPBq0xsiMdq/SrBN5xQFZpno
 S/lOy8uF23rdTH1bZdJ8CMrIIxirxJQqmK99JmhJV6LIvmqx6ER5FlvHmQlGnMkncdesx9eWruE
 8CFAl8CNie2+C0RxmFXm80O33TiRTk7HTRazY2tQ8pVWoUBnYUiUFapFrSqQgmASYrA/UR391xv
 tl5eLsw0svO0YjTkQDpS4wPCBsZH1P227fVIu0RmcytiOeAtBQ3WWEfhSaK/zudzM9SshhCEzxR
 nomfEUfH+l2nWoU9lgs188Uafd/SfaJbZLnlIfYDNJyzYGRA8Kh6H6l0w6R4F43I3RavO5GHXC4
 DJUyDkVuRIsskymfi9xi4FqOoxf1FAZRnYzbCCkhy/+Mncj7FiCF0iOptwmlApBcqklCMICb8ZR
 Yi2Q2x8+2k1O4GdLqAA==
X-Proofpoint-ORIG-GUID: Ih0cKOS7k8JxJvxU52uZXuDU7dxoroku
X-Proofpoint-GUID: Ih0cKOS7k8JxJvxU52uZXuDU7dxoroku
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a2ee52 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=oZPMeiHd2FbyKtjdOA4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C692F1C3435
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)

- Please squash refgen patch into this one.
- Please post at least the dispcc fixes.

> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 396 ++++++++++++++++++++++++-
>  1 file changed, 388 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

