Return-Path: <linux-arm-msm+bounces-99800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIeMNAmLw2nJrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:13:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5032088B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB6A130B140A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175AA364042;
	Wed, 25 Mar 2026 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfgInqX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWNz/WiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D412F363C52
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422533; cv=none; b=aWTUM0OpTOjdQ4A1ubDn/JrM4lp9oiBVOwFdwNr+Eo/s3riE+Wpfzn0H0jif2BHJbmkaHD9p5lfrPovb4vj6pENRvOtGvR1IqB1jHThrZLpsDYkAD5N8aqjflXIEQIg57Z6fOQ+nopmmVrtZqGUrlUoubsXia0xIqr3nvcq12C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422533; c=relaxed/simple;
	bh=wQ/zoNaxLJBlwZ4gVyMJ/8dOvqCm5aHwPantsdEceQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXuC1Xb4X2rWJvSBv7fNvXS1QIRo8iJExV7sAeHBFtHBGGW9rJe6B6E0932XR90cnVQILuSU54gKr5EAHvc5pXMghEHpjGw8TyLCFWHN0VTT/0RRcI9QCEAfM+to/UlWIw6TEb8w2Pim/0gL7BMFREeOERHSKTh06kqi5gV8Ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfgInqX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWNz/WiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5Crsn2184543
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iKQ+FSSiQfqLwu71QB1udve1
	emxIWdi86i3CWGPBOB8=; b=HfgInqX0ajgGeJaPCJ7oiYxCbzl8l+urRyWdE+8g
	b122NFw21pGpoDNT/faJRqEoDcEpSDOOGpa5ivDR/wIbjKEehS6J9FuWu9oZB2lq
	4oAzIoCI6XwWFutGQDJZ9oqY7vapJAUEuc1HQRIs+RHj5S/b2Xq9sAzCt5V9yb1+
	+ij19rv10NjC5hcuxwQdZHteLbcI6OLFByOEPyKnGYfggWzpa/6ZYeEyrERnEHs9
	9CH/Bfa+/a20RvOFlrstVQ/XLOC3tWyb3bniiV8R4cs4LvnjSTww1piwe++8TZbI
	b9U2EarcJFT4pFXqNwNk/uZQBMWXzYLsSqhfQ5nD86SUcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukmb8bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:08:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso22904991cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774422530; x=1775027330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKQ+FSSiQfqLwu71QB1udve1emxIWdi86i3CWGPBOB8=;
        b=QWNz/WiTfWIdypOhPE7yrbOvbiYfdlmeJxqiHCEkvVmfi215cMOESaNyPZaQFuh0v+
         sqNt4Ct4HLisa3EHS1kUEqa1fWpbZX04r+l7cXJ5cmuJ4oiB9F92ETIl2lb5CbxVmIn7
         P6ivy0XoHOWSzs6LlTrtxGERyP9FbreIbpBtnq6L9eDOubN+bgA1fEeRlDxFBDeUkosk
         raS6ZPoAisw0dGBDAPcWFnu0wbQSaZUZaRnkE2rKSXHaVIuaCLIY19xnzGBKwpmKVkkB
         VXzWm82e3AUfUMDSfdbIshBPTOCkxwC/q1lUvg9B4+4B6O5ixcdJaxmTYzUuffOSGjXD
         m4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422530; x=1775027330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQ+FSSiQfqLwu71QB1udve1emxIWdi86i3CWGPBOB8=;
        b=JUdEzNxeQxG4u9BokHJ6hruvtQ53rcyBhfBy7xUu4CxIWPbhBBvtBRiNUwFIe2aqHL
         CwzuHmn2ThCYi+RSh4jAEwOsb6UsHISkWivaYtVjRgglc8Fp8L7I2Tqcbx7xdli6+emO
         W/T814CFclLRVIp0IutXZwUQr0w5o1MW0q0C+Dsbd6qLFw4n0lzWiehGH9Z4zoEzI0Ne
         wcwTCg4/Sup+WIrp612RQqcsRXlVMetr1l23YFqHOpAUFk0K2PZfrLyyWi49L2FKIvQ4
         5yDlz4PEcWcVp8L3yT2oMQasiSpoMr6dzeYirWNy89YT/Ugpr0IguPjyifNaMSDbe3F5
         LcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCTRmz3Oab2LO0kMVnd8mD1Q95f4uTrAtpp3UTfZ+voEJVTZbhuz/nopI82Iw+ZTZyVRuj3ufEYtTYbJbc@vger.kernel.org
X-Gm-Message-State: AOJu0YyungRH31T7c+zjHHpziI45lk85eCASgxaBeOfHNZkRqK1vKT16
	zkp8mDDL5j3YMkTkbuyUOZndqnimxjL2c534YUdu+RO4rNE6UkZnEgYGs/4hopsFZV9QM4pCogN
	PuK2XQgFZN2x1nY8OSmqgCxpGZMTF9AoqNv7YVeCF1hNH29/SLxKpxR84OcFQvCQJuRFF
X-Gm-Gg: ATEYQzwZYF6wXLCHV6SldbafgI7YDUWurJmCXlrkA3kMPuPQXRyZaKLwwPuDs3efbyN
	YzBePWgDd5C0HCKNtLHehuhliic3vc1zlW0JlMQN/2aNG/JDH9a9XOO5PR2vwuuDlHeFAvXlIlL
	Ivmd/RwQ3/RA04zxIwcwoViFCzsk2A/EuKmfOPFTvkEeGc6huDW/L4/Ylpd0+8OSOTxcAczWls8
	1813xKr3kD0lYwB2Tn3yoe3jEGrIUSqtv83A8ct2hjYR5ohYY4VatRh1g10S2fbZZoA9Wrxq0uF
	DzKY9U0h+V3LmYgq/qzYJNtxLccF9lEKgPvpwIb2rILmlxBiZ5yqrCSeQuuS2DGdCAn1kvDJKKc
	zENZTOvKgAQV3RIoTQVyjke0DPqgqvfXLP7mKJsqJ6PP4uyJmdTRth4g26mTJe4hePx8UwxV+lb
	qI4pBp6xDCXXZxNU7ULzXygBrgurrX1SISTig=
X-Received: by 2002:ac8:7fd0:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b80de0093mr36922231cf.46.1774422530094;
        Wed, 25 Mar 2026 00:08:50 -0700 (PDT)
X-Received: by 2002:ac8:7fd0:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b80de0093mr36921991cf.46.1774422529667;
        Wed, 25 Mar 2026 00:08:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2992e175dsm840340e87.68.2026.03.25.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:08:48 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:08:46 +0200
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
Message-ID: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c38a02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QD5C3A9ALSE2Vvq5J3oA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 63Vc6Qfr0AbVe8VG_B-JdTjrxnzil8mU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfX+1E8T+5o7jZS
 vLZ0hhRI0aFp4qwmsYMT6PIwujpKJyTIqEb+fO/uMO05GXYZig95bV0sxPbU+0WYiQq4trN63BZ
 TDxDiOFFBFV7CL0ro8yL3GxF+qFZT/4XIyRZ2j0eX4MkBMnPl69j3U18JGSS3WI1iAcjEKq89P2
 Mc7nKTZaKWlSZZApZnO4LgKVrcGe5i0cf3pOxK8WybI9qBZ1QnEBu9qySe1asB0puZare7bnppk
 G5rw2KrT9xHeZ8ui4fIXeMbkyuiHnI6GrcFmYcyKWTMgDEoH96XiTCoT9UcgIsK6tXXUsxaRXIv
 v5by8iZH5nxST7Zuh0ogYG8rrU4qlx9OXHUCbhYsIaA/3KZsz+v8wAYat+kzNw/psqc8hZxR5dl
 tj83BTMzZsmBs35BshXPmB/4PggibLCRE7AmHK/cJox9kl4ZtdOm59N8YVa8U9G3t4cLcvtoCrp
 jG4p69tQz1IQs/NsQGg==
X-Proofpoint-GUID: 63Vc6Qfr0AbVe8VG_B-JdTjrxnzil8mU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250049
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99800-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3AF5032088B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >> +
> >> +	wcn7850-pmu {
> >> +		compatible = "qcom,wcn7850-pmu";
> >> +
> >> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >> +		pinctrl-names = "default";
> >> +
> >> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> > swctrl-gpios?
> 
> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> the input pin is not used by power sequencing driver.
> just give it some default configurations here.

Please don't mix hardware description and the driver. If the pin is
wired, let's describe it in DT.

-- 
With best wishes
Dmitry

