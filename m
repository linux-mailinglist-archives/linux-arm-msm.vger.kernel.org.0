Return-Path: <linux-arm-msm+bounces-99852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ3UDgPMw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:50:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920F3243A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8530F3022F86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CE73CF042;
	Wed, 25 Mar 2026 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS24o5V8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TifepK5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8E396D2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438842; cv=none; b=DMilIXP5aU/LcoPa3JrmF6lmobCjcPEPJfiBgolum9UJPfZSbiQM1JrvOT7yyxvtBTQTiTObmgKw4VxiIqPj3jIzrFB6Bku/VMRuu4mcTFlusPJTwMZWQIU5Pqnns44GrlA0pY10WUyD9PpO8pt/LC8WwtERW6GJL2FwBYIzETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438842; c=relaxed/simple;
	bh=oed4OIGa6HMUcdBfNGzGd7pnV7AgkufT26LTltgOq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgQlU8wqx+Y46zNpR2nm73+hli772W6TToI+q2hkTduSC9DBHtZJHhthA/8ge1M9hxK+HiT9skBvZzUIkHryUcjiVRiQxUDpfxbzCnLhkKYb8OpEI6RlI5L/UrYkyRmXUzfUTW9RNIu+SojGQ+cGOsSqiPL0ozuKmbSYuH/SpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS24o5V8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TifepK5r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGT911895529
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htKG/55QdoEE20t24Ys1H0ng
	22DCDQEkf8u6TymZbRc=; b=TS24o5V8vz1bAKZKJMONcX0ucSb8AV/Kb9/OTpF5
	W+Rf+dW7kSxWZj6DKBizXNIxSMWdtFy69D2TMUYrcaEOznNcu+6MV1KZkZjz67Vv
	F1DrDijIUyniA5kbARa8NsA0OGGTaDWIUMOg7GFhUF4Iur2kgbh6Nhi05dzCBm6I
	SHjPx6DPx2LsDXjIRAsaWA3ZUA5gFslBipdJ56ydbDKiyMmHNJ9rfv5FPL+67eGM
	I3/MikLr868V5OnZ5S1J9w1SghqntazqwzCQc9lz3ewlaWL5Qv0HVcxbkab+Z1M+
	DJlCPdibgEzAm719Ub6LmntQg1g5Ya/6aHmn89rkr8LOLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhktd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:40:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso14345251cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438839; x=1775043639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htKG/55QdoEE20t24Ys1H0ng22DCDQEkf8u6TymZbRc=;
        b=TifepK5rDwThNWJNeE5Nnu9oB/ws3STyVdE2rvnfnYQOefLpCaf2UtzuoaFWJ2LfJ+
         YLomD4cGHWnlInk5g6MLcX2cKxFzFfqJzrGz1T4yl5x6QVzty31KeYBDAmLMlI1XC+LQ
         InZpvdGCc+AlyQ0JHzGO2fV8/nRTmAG1tCi8Dyx/lgTRB7r/1I63tx8rkOc4pjLyu23c
         OKaRsNtM/S1Gn/ckiizZu1nTDRdPzcY/TaPGE8ouP/RW/0BFRjN/ngayyc8HFpSnzffH
         2o0TADwiNi/a8nt01s8+bE5lU5HaW/lHL3ewEYD1eh7OOsqW0cRIIhTFcMaZCwDPIj7T
         0Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438839; x=1775043639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htKG/55QdoEE20t24Ys1H0ng22DCDQEkf8u6TymZbRc=;
        b=IAgEFv2BNJWZMe8ZtrcasbZJdRBVbfzD7EaIKYvdX/GvOp4kL5LiR1J+to3aLhbGmG
         jltv1IT9XPWcMcGkbiqh7cVFu8oHXoKORhq8o1sP4rY6Ouv4hypGnUrVy+pyl0bINFfc
         9UaDjVmw+hk33j8PavZ4wX1S7jnzyVdJfBAjacQ+NCTn0QaxXAYV/5N15kROsjyPH9qL
         6qflyNKQOSv9uC+q2sH03RCOc9FH9lEtFCNYEtP4gvpkueFpcwrc5vmji/i3/NFMo1mx
         mSb7VUA/XRdWCpYCRnw+Kvfr8eWVgW6fDi5VsZKDnU2jQzelyHWppNM08FJHlWlzITFb
         Y3rA==
X-Forwarded-Encrypted: i=1; AJvYcCXFBGQJO+dufNBeoYrzIbNtVt0+GCfwLOeMZMVqZbVP0hW9TiexmGDt17CfPeKR22GAcJQlDkaD8MK0VFmP@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVj1+HWGaQm9RdNnLCI9a8kIRlw867s++t//PIt5wZxQAiMQl
	y17EJY95BjSQXXNfc6Z3c7nPH+Ar0G1ZJJhkC6Xi4fXdJlDEDXjpJ7njZyEzmjW1ZQh+sxLj9nb
	nMCkAME/t/8f5YUxklMSXpjx8J7FPONlk/5LhlHnmhZ5Z5YgMIbcP0ndP+HEsBunrL1Wn
X-Gm-Gg: ATEYQzzTqQpPC+0Auw1OHsXAjafmNXiK942QLyb0lqgDDyrZptUfEuqVj1z0BgbA220
	Ri572CamPyOcB7+MhN68lKEppgrmNa9GiiEneqIa2VxoEfNzZmkzLqYMHs/NzxL6hU9XpykOwnK
	wAelzKNQWAXnxSsyfSwcRecaUDIe1zyC/TLl9KbpeNiRuO4dlUSqfrmki51IUcLFR0yo4gRx1mJ
	5s6IfgoeoY8sG/s0sjnbHxxaSahFbWcsf9OrsTWQQPCsa3+h0k1jQUmVj+v1P2nHhKAR5ZYburi
	bJihtOUR9K0B3vLWzicevwfy6x4baSu/NOa7GYJLdW9Lu6FGyoBdC7l6a/mqnHg8OwDP/zCnIhH
	MnsF38k+zJ59ZbbYOgrla+F3a/VqIlWFBZlR2cfRCxpqye14Em7FJ1HpVqWFPE5RpRK6E8ALI6o
	Rlxy8awFsNXC6+qrr6luR6CL+TM44tsUYdI9Y=
X-Received: by 2002:a05:622a:904:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50b80aded81mr44017471cf.0.1774438839335;
        Wed, 25 Mar 2026 04:40:39 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50b80aded81mr44017061cf.0.1774438838888;
        Wed, 25 Mar 2026 04:40:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a298cadec8sm1012713e87.32.2026.03.25.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:40:37 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:40:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX8feiRyHCBpoH
 IPg7HUzeG9nedJwsiYnilfuJvI/YGsLaoxbH6xGHwc69i2ftRlmzcUc+6FlfdGungC+tmAhAT6q
 QahYkWq6K+JUaeNobMgz8ELXz1eyxMQR6oPQg0lxoHTiZIwjFeKRJ5icoLz9LPwvqPle2Mfo2SW
 r8JAMoIZYRVP3z+WkZivBVaTmEyXiLCY7YECPzZd0v9RpmcxsctrpOMrUT12+V4zCpbrQoKGJHD
 aj2HDf2WUBQxF17SlNy2+Ae2MEaQpOXK/RmL3nqcOSeiHSnwcUeq705LNU0595XV1TjnO+aJWOC
 iyywLV3vbgafoYj9cUUySNPUMiI+5lzWDZO6tier3o16md6rJwmlGg++B2qd/vidmmscmEGkzpF
 YNE9Ifcr0E60IbYFdJZ98draiFhrgKdn8cWx4qhOSt+fi2YzWxt6HZxFzkrRi9bAMOBsxyARUFQ
 VpVxEILeVpZe1ToDj4w==
X-Proofpoint-GUID: G8pueyzUZ0dmZJI0zZES0LgfmOaCvfO4
X-Proofpoint-ORIG-GUID: G8pueyzUZ0dmZJI0zZES0LgfmOaCvfO4
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3c9b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zJKM_INERqMpKYJWsIsA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99852-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9920F3243A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:59:41PM +0800, Zijun Hu wrote:
> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> >> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >>>> +
> >>>> +	wcn7850-pmu {
> >>>> +		compatible = "qcom,wcn7850-pmu";
> >>>> +
> >>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >>>> +		pinctrl-names = "default";
> >>>> +
> >>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> >>> swctrl-gpios?
> >>
> >> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> >> the input pin is not used by power sequencing driver.
> >> just give it some default configurations here.
> > 
> > Please don't mix hardware description and the driver. If the pin is
> > wired, let's describe it in DT.
> > 
> 
> give comments about that pin in this dts file ?
> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?

It is there, as far as I remember.

$ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
  swctrl-gpios:

-- 
With best wishes
Dmitry

