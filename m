Return-Path: <linux-arm-msm+bounces-91848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA0zHWehg2kLqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 20:43:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAAEC2E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 20:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC38C3006143
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 19:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BCF42849C;
	Wed,  4 Feb 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+qSnVUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuxonDx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A6423A6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234041; cv=none; b=KEpGl6211oSXFcfj9ttf6RqhDYElmz6oQntpcOh6JtlwvxCiKUJH66YnG9UJ8l8f97V5gKrQme4gmDCB6aAjDbLchpEwa6RVespukorsnJdtRvb3RIh9/5PBVBwN5Ua37R3NpEHXP/+ygzZGUnrKfCIjxYj7gu0FyCQv1dw37oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234041; c=relaxed/simple;
	bh=YfhL/X/H7agtbfhv+YnxKvtPlZgTIVQTdqtYsNfC0Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSN0vjSVigGJ+6fphURI3va1YlDbvccREnV6itNLBjJmbP/n2onXnoyzuJy324D+AdM976vE2PgjjlUL7/56b/Is9jNA9jEg8d38tmoQAU8WRYB31Z2HgZrKO9zeV7IC6Eljo381pYa4YFarmnUOk1c8t6AOoRkOEmxjLad6LtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+qSnVUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuxonDx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614Gl5pE2747522
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXzPozNIWqzy32VtwzLRCRATUBDZTHMGM/otNigb3WI=; b=R+qSnVUYkXm72oAn
	vrY8TZjoJmvOE9G2MYyq1ZKQ4vTIXVBjb77KJsX4H91n02xPxedltYw60dDwHmRH
	BvdJnK7YJ653tr3BreWMsBG122reqmHklAzylsBaiA5zKM4XRKRXlqpq6UzcbkM0
	ERYM//lM+G+zMgm939DTI/DYnlFjrE0wO+sEMw+fAa2s+UER3K0lYzWUrSOMCsWT
	POlG4j9xrXuF4lZxpvi5wdzJE0r6iwaB1hFiLZ32JpyuqZCV4P0RjNSj8a6TcQWf
	vFvrHezhXEeGGMUM9810p3w5wqfQZFih1njnuwPcmhaq/KM+TSowLq4FoyPWUlu9
	tvGGUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvhjcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 19:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ae763d03so10620485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770234039; x=1770838839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXzPozNIWqzy32VtwzLRCRATUBDZTHMGM/otNigb3WI=;
        b=PuxonDx3QdnNMNlg5gfvlor6ZtZ8OuRHNOdJIO2rRjYXpOp5NvzL1pqSWJcclncg/+
         vFYLBG8Gtrc9KoiGA44HS9ALtnIdnPPiorYMMCUmC9Se4v2/vAsoZ4uqcL2GZ6Qejpmn
         ue6VkZGYYknfd4yF4Q95L5xhqm1fv/DlKZgtm48q8PQAuqIWir7RwYYJ+c4m8AaHb8C5
         tvzViQXO9Hj4c6xHBQOi6/nN/O/UhZXkWIVO2zrQnDKIp+ewUgh8nysPp4SaeHplGA66
         QPmPZeRgbvhI1rmNn+5mXEnFuH9kYEeNNUykQzK/OOch7ZYyGOpFPe3rLiObQPP+WKRm
         fz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234039; x=1770838839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXzPozNIWqzy32VtwzLRCRATUBDZTHMGM/otNigb3WI=;
        b=xHGbQ8Ne/mKwvKcKxCPODFnYHJxELnWduTzbzvuketIqQxd1JjdGxJxo75i8NuRLS7
         XLGRpdAlTGbRv3x9zVK0BaO3ZuPfDGmFwW3eyjZxkDjBWgTaG6GAH178QSL47qu+dUOE
         oCSgtMZZtHXTYnzCg7fL2XaDWxl2VzOS99bD+LQI0/0iY57+RBIK9VUuo1rHZYmfBKL6
         i5tMgozP8nzSyp6Ix51StfNVxY3sQDkjHXds/6Zmj1HMEqrvtjDNdXYgZ+1PLbwNxkZp
         mIZaCi2bQNzdiJvEM4C94edrPvXWi8tv0EhZCQb2Ec3ho3Zw5fZSvumDQyZmBBa2+dyh
         YYHA==
X-Forwarded-Encrypted: i=1; AJvYcCWN7tuMgURU1nNF0CUCtBE+SspMPopMc0GMbopi6/+1/s+JV/qXZYIJKiEnJQITHDQTcfANkvD+81jqE8xo@vger.kernel.org
X-Gm-Message-State: AOJu0YyYV9kgrY/JfhfKyzMoK6E5ghECOsaQOIUgkV2LmdCYZkTy+DjP
	/mDZ1/0QeEq6+GAKumm25b3s/lkyTSGMiSfPDZFP54L4TiX4BZs7GPXHK3CpZ8GnvQTxWH/L66E
	S8/tD7KQkJqbgxwCq303RiZ3DqKkGw2N3PFqwW7nZcdZiFKpkx45pQwgU3cTdmRHJ2Cqv
X-Gm-Gg: AZuq6aIM+pm+F/ToluJFOjBu5hI4Anhr/uIaI5nXZKtG0ajqcJWu5R4rN6E9STP8Sdz
	iOTW8MkUKfCD8gDqSkPAAyIcu9Vog3AK1lViDnYWwoEtBTwJnbvBuZj4v83TNyQfkJBVPxC4S9P
	Cgi7MvmWbkZipbOJ94jpDsyAIR/AdU9okVDEjkBAOiVqEB2f6XKei6NDd3x9NbDHKAtDa+UTojB
	IW30ki9fmHvdlUpdQ65zsB9Be4pM9vjJsPJNTxc0YYw3D4OOXcV5IPAO/YA7RGR+uLNhaNbGUnM
	pNmPG6EzTzNtmmIAXqe/9EJ1mi/GiltyTkJijMmJzlpkg9uprGK6uEUez7NiB39rJZ2C5sX2K90
	EwZDPHCxKNywNeVv/X28aycFECRECo8kjQER5ow/aok3VQVKYoju0gDiSjfocZKzTkG+h0HhcZw
	3Ryzlg0Hevpt9oh78w4UOf/JU=
X-Received: by 2002:a05:620a:2a16:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8ca2f846447mr491529585a.21.1770234038946;
        Wed, 04 Feb 2026 11:40:38 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8ca2f846447mr491526585a.21.1770234038375;
        Wed, 04 Feb 2026 11:40:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e387f887csm866164e87.33.2026.02.04.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:40:37 -0800 (PST)
Date: Wed, 4 Feb 2026 21:40:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <x3zr4itzvlmx7uwcnfpsiqpf7rvvdcmr3gsp22p3aqf2g7eeky@qrxvrm2lr33r>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
 <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
 <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
 <6a982b56-2f4c-441f-acf7-a8e77ea55600@oss.qualcomm.com>
 <xfl4fir3l7ckh66zok46uot3xd63jptnyb5f3wsw7cok4rtqsh@23vlnfukpoi5>
 <335690cd-d28f-445c-b3a5-33903aa3234b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <335690cd-d28f-445c-b3a5-33903aa3234b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE1MCBTYWx0ZWRfX99O3aaNRmlJ9
 St7D11ksP6cDLD3UQTnHGioipPeYDsbk5L3HZof8G5oo8NAl6fIYPkXayosKJWOlTd0a0tb8hMf
 zQn9qWq5A6+lZcCuCKJ4auCHRByuCdHWYoOqg5KoVD6ZfNg8dm0ipTIuatIA0Xl9K9KftBO1JfB
 d205uBU65RkmyZlgKCRn4FyVQK+3e5J4XDQZbS0f4megakm/IZIEdSlKFNsdjDl8isiGfTA1owo
 fBjUahg+xhyBxnPU50l4K4zF8F3a5GuTeKVKJruDMyY/F0xKJlmY36ZHLBKrz0a1vVAwWDRNAtr
 2UXhn2umI4dVo0xNuHlUS2EM8bzfYs4ExJohnmVivFroD1DpUbv61qsh23+RBDCtjACLOabUwUl
 MeToANNi3HW7oHHqQA+sgJJL+3nV/uMkFJTtVj98PZd5QgycnzHDDWpUNsyrRsnN2zI6O6Pvp0D
 I2vD/e6cqVAD5iBZK8g==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=6983a0b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vqp1FUc-uHDKMehduQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 30QXRZLuC_fir8wIaHQaSG_omBvLxUwH
X-Proofpoint-ORIG-GUID: 30QXRZLuC_fir8wIaHQaSG_omBvLxUwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91848-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.47:email,0.0.0.1:email,0.0.0.0:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DEAAEC2E5
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:37:25AM +0530, Krishna Kurapati wrote:
> 
> 
> On 2/4/2026 4:02 PM, Dmitry Baryshkov wrote:
> > On Wed, Feb 04, 2026 at 11:26:37AM +0530, Krishna Kurapati wrote:
> > > 
> > > 
> > > On 2/4/2026 7:03 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jan 27, 2026 at 10:53:46AM +0530, Swati Agarwal wrote:
> > > > > On Thu, Jan 22, 2026 at 4:02 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > 
> > > > > > On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> > > > > > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > > > > > > 
> > > > > > > Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> > > > > > > having 4 ports. The ports of hub that are present on lemans EVK standalone
> > > > > > > board are used as follows:-
> > > > > > > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > > > > > > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> > > > > > > for Bluetooth. This port is to be used only if user optionally replaces the
> > > > > > > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> > > > > > > 
> > > > > > > Remaining 2 ports will become functional when the interface plus mezzanine
> > > > > > > board is stacked on top of corekit:
> > > > > > > 
> > > > > > > 3) port-2 is connected to another hub which is present on the mezz through
> > > > > > > which 4 type-A ports are connected.
> > > > > > > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > > > > > > connected.
> > > > > > > 
> > > > > > > Mark the second USB controller as host only capable and add the HD3SS3220
> > > > > > > Type-C port controller along with Type-c connector for controlling vbus
> > > > > > > supply.
> > > > > > > 
> > > > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >    arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
> > > > > > >    1 file changed, 208 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > > > index 074a1edd0334..a549f7fe53a1 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > > > @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
> > > > > > >                 };
> > > > > > >         };
> > > > > > > 
> > > > > > > +     connector-1 {
> > > > > > > +             compatible = "usb-c-connector";
> > > > > > > +             label = "USB1-Type-C";
> > > > > > > +             data-role = "host";
> > > > > > > +             power-role = "source";
> > > > > > > +
> > > > > > > +             vbus-supply = <&vbus_supply_regulator_1>;
> > > > > > > +
> > > > > > > +             ports {
> > > > > > > +                     #address-cells = <1>;
> > > > > > > +                     #size-cells = <0>;
> > > > > > > +
> > > > > > > +                     port@0 {
> > > > > > > +                             reg = <0>;
> > > > > > > +
> > > > > > > +                             usb1_con_ss_ep: endpoint {
> > > > > > 
> > > > > > This contradicts USB-C connector bindings. Why?
> > > > > > 
> > > > > > > +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
> > > > > > > +                             };
> > > > > > > +                     };
> > > > > > > +
> > > > > > > +                     port@1 {
> > > > > > > +                             reg = <1>;
> > > > > > > +
> > > > > > > +                             usb1_hs_in: endpoint {
> > > > > > > +                                     remote-endpoint = <&usb_hub_2_1>;
> > > > > > > +                             };
> > > > > > > +
> > > > > > > +                     };
> > > > > > > +
> > > > > > > +                     port@2 {
> > > > > > > +                             reg = <2>;
> > > > > > > +
> > > > > > > +                             usb1_ss_in: endpoint {
> > > > > > 
> > > > > > port@2 is for the SBU signals. It can't be connected to the hub.
> > > > > > 
> > > > > > > +                                     remote-endpoint = <&usb_hub_3_1>;
> > > > > > > +                             };
> > > > > > > +                     };
> > > > > > > +             };
> > > > > > > +     };
> > > > > > > +
> > > > > > >         edp0-connector {
> > > > > > >                 compatible = "dp-connector";
> > > > > > >                 label = "EDP0";
> > > > > > > @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> > > > > > >                 enable-active-high;
> > > > > > >         };
> > > > > > > 
> > > > > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > > > > +             compatible = "regulator-fixed";
> > > > > > > +             regulator-name = "vbus_supply_1";
> > > > > > > +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > > > > +             regulator-min-microvolt = <5000000>;
> > > > > > > +             regulator-max-microvolt = <5000000>;
> > > > > > > +             regulator-boot-on;
> > > > > > > +             enable-active-high;
> > > > > > > +     };
> > > > > > > +
> > > > > > >         vmmc_sdc: regulator-vmmc-sdc {
> > > > > > >                 compatible = "regulator-fixed";
> > > > > > > 
> > > > > > > @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> > > > > > >                         };
> > > > > > >                 };
> > > > > > >         };
> > > > > > > +
> > > > > > > +     usb-typec@47 {
> > > > > > > +             compatible = "ti,hd3ss3220";
> > > > > > > +             reg = <0x47>;
> > > > > > > +
> > > > > > > +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> > > > > > > +
> > > > > > > +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > > > > +
> > > > > > > +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> > > > > > > +             pinctrl-names = "default";
> > > > > > > +
> > > > > > > +             ports {
> > > > > > > +                     #address-cells = <1>;
> > > > > > > +                     #size-cells = <0>;
> > > > > > > +
> > > > > > > +                     port@0 {
> > > > > > > +                             reg = <0>;
> > > > > > > +
> > > > > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > > > > +                                     remote-endpoint = <&usb1_con_ss_ep>;
> > > > > > > +                             };
> > > > > > > +                     };
> > > > > > > +
> > > > > > > +                     port@1 {
> > > > > > > +                             reg = <1>;
> > > > > > > +
> > > > > > > +                             hd3ss3220_1_out_ep: endpoint {
> > > > > > > +                             };
> > > > > > 
> > > > > > Why is this port disconnected? It it really N/C?
> > > > > 
> > > > > Hi Dmitry,
> > > > > 
> > > > > Sorry for the confusion, Can we do it as follows:
> > > > > 
> > > > > hub:                    Hd3ss3220   typec-connector
> > > > > 
> > > > > usb_hub_2_1 <-> port@1       port@1 <-> empty
> > > > > usb_hub_3_1 <-> port@2       port@2 <-> <empty>
> > > > >                                port@0 <-> port@0
> > > > > 
> > > > 
> > > > You still missed the _why_. Why port@1 of HD3SS3220 is not connected?
> > > > 
> > > 
> > > There are no remote endpoints added in dwc3 node. Since we are making
> > > dr_mode host. Hence keeping this remore endpoint empty.
> > 
> > How is the link between HD3SS3220 and Type-C affected by the DWC3? What
> > does port@1 of it represent? Do we have SS lanes between HD3SS3220 and
> > the connector?
> > 
> 
> Yes.
> 
> The lines go from Soc -> Hub -> Port controller -> Connector
> 
> Hence I didn't add any special endpoint mapping between usb controller and
> port controller in above provided diagram.
> 
>  One port of port-controller goes to connector and the other goes to where
> the lanes are coming from. Usually its only one endpoint from dwc3 usb
> controller to hd3 port-controller. In this case, since its a hub, we added
> two ports (one for Hs and the other for ss lines) to hd3 port controller.

One needs to describe both HS and SS lanes being routed to the Type-C
connector. Please make sure that all signals are described.

-- 
With best wishes
Dmitry

