Return-Path: <linux-arm-msm+bounces-90646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TfmxMPhLeGkipQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:24:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC4901A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D64F4300B9CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 05:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D1C329C5F;
	Tue, 27 Jan 2026 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEIyc1q5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CULRNVHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620915B971
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769491442; cv=pass; b=c4LsElpQlSa9okoXIrsNOuujxEZaDZ2UETbtmLYCnM5qHUY9e6H9JHqheUjQ7Z08xoUWzwvLrcCO539MjIB2fYqWE46KB5zMpfEXKRAPCHMEDBBrKkysdlsvjQrPRYlJBwZDpGdAqT9KRqw0mgQuJloZCp/S5z9fq09VtX7ChBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769491442; c=relaxed/simple;
	bh=5ZlTeowz3mTvEpFuyPP/h5cAPT1w+3Lo6jgfjO0QgW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FavW90u+RoCacaFw+AYF337/YKnmTRbkxkgPds5jZTeh/KMjIzDEhiGhCOu5K8kuEHsL5+GcEIjemZWo+11n/f1GBEPVN908EPFBkGfU4HvLLbo923B7Io1QDGaBuUrjrXlTGRMg4eMGwEU2AP+H2OJhkXRDT12u/1MNOD7Cg5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEIyc1q5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CULRNVHt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UBYa495963
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=; b=LEIyc1q53oZymJgs
	GxHSC8vEmspOAgK7Vr5GXoWWoU7wlbRT4055J+H+sJOE0rCwsl0VCgbdU8rCUW59
	1FAtufAXt9EDY91YmUM4FqUbpknj13QlFK39TFVoDTxv06VNua65P0C6e7P+YZjj
	CgjtFOqhpr/Gu63/0Nfg5jKzYdqvIuorcPNJAnTU75GnZ00wGT+Rh/jb7ECLOMTE
	Fw3O2k2PPB9UpUZNp2njv+BqbJzRZ/H4ktSy6PkvQePDkQanuTNRJGUFPJMt4lmx
	eLVlOigLGYrXy9l2lnV6/rEeZ+4/1cn0y3sKUmE9Gljl6JUO5/rRlhKuxu4RjdKW
	fjofwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bhaa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:23:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89470bda22aso143576936d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 21:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769491439; cv=none;
        d=google.com; s=arc-20240605;
        b=ThSPU+mziwrDAzQk4xwq6owteEFWWCA8fuZmozFPI6uqTuXJzjTBkHBbb9lPkZVl1R
         We3dirqMV2dGr1vvhLQ1Qs1FpGgMUbz9GTag+shBlIiBkPqyh+mfs6j47YHem9TYjzfi
         jsV6vrBZRT/Wjwz3XCbQbaTxhheHaS21oebW4j5clDo6rtSEUewHYqnBfl9aCNtr7Wyf
         xWH4Zes+dEgpNF9nEgaQcySHciiK4a/RPn1GXRKxPowi29Cd+DyBJwqDDePcRgavbLjn
         5wMEkjvGFpnP4v8/1FSfz+UOguK6N3q5dZ0biTRAOo5VC988//Uc89sL1LQyPyrN+zfY
         xt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        fh=WA3zVlA/maS/2cZhIZqNstVYtLU967copLPtqm4SNU4=;
        b=JVtNFiDgGqfu46JWM7GnJku3vHH+8LNUTpAJZkD5aDdlRUlYZIYdYm1B4+ZCGpFkTd
         K+RhzoSq3CI9fEWjS6t5sWWTVxeBhbf7cTUeb3/oMmsdGWUfQEZfbD1+5JWsbmgxxrU/
         CSMwWhMa0S4WR0wKvmP8kU3eW5aXTxJv3ws+0R7zAa2bk8Hshk7gFFyYJYk74T8t9rXR
         ejXYbsiPFgrBnZgLHyQBEt/2jwTBvjCaPJYsmYTL5tGieEXcAVx3Isa/qN5eh5ib9HSN
         CqibBBAA2fDFinpOAiR6KSkYt1uxMEyO3l5m2nD7Rh2Y9I9j+QTfl+0cB89LH43s2Thf
         uooA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769491439; x=1770096239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        b=CULRNVHtCT2fmbgKO0/iYf3gmLynffdZdtHc8o7BruwFAriYt5YIJAyQq1Nz6s+IxZ
         8tYx3J241tbSwcY8E4lUTN2nBhERk4n/IH8Ict07pd0VLUqm9xe8L+k7h+ahkEU9bVbS
         zFQJ0+biYWob8mBfGtFhh49zC7j8ZyXCLqO55/k2WT0lOYIxlnYksymV1ln6HkMbRCQ6
         rjQyCColJBNP3X6DYGWpdWtjwAsWRJOIFOwntNNGA9n5Mv7WfZBxOglC3dOHucu7wRv9
         LXCe7x+34mRYMujXfIlFePq932wrpxGCwq4FRq27gemr4M+v3Lp7Gng9bUGIK7FGWGTZ
         KJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769491439; x=1770096239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        b=jpciBHrR9Ig0iXNy2/XjgwRzgjFnuvB6E8/9EPufHHVwNhYPlcl6yNCuKCdMaZkcdt
         E24O4hLOPq4kZfx0viukkfoSaEkcfycKD4smjH6EyAXwlXw3o5R2F3Bry4KbweEDgjq4
         CLGXrceGo/0kGLADsVCegROtbaMwkdL126JbZBtOhxP4j2lZJw8JNIWCoEv8fcH9ZPJU
         TUtURkZR26xiMaVdkde5fjCF4HzySPM/xcd+IWaTWGpBQPxLCujj6oHD3fTikX0ojT6C
         Ff2LZxqmMWt0622jYMaN9F1QF/NU1JGLTDeGx3400fKgnfD3kLITruKOLsMSjXV1ZNmH
         zVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7+avDXG7rTpEd4ne3F2v5m+U6VHXvTvll18sS+vyTNeH98qi11DGRpC8UAAOPDw7nJscwdvYyKtCfZpcG@vger.kernel.org
X-Gm-Message-State: AOJu0YynIir7hx16mmOnMO+KECrNh874SsSJII2aGVPYeDMDrf/MRwsR
	JP5HfqV4RbsiugRXNNMKeyZ7u5zBhPBuED407S6tpmMvU3FCiL1TmEzaOdj/tC61BfGmGTxABoJ
	4Y+crBIkW20B91gCJAqqE2Bkd6dQDtU+fkLE/UfjYWFCCam8o31S64mE/iMQDp8500QIjqu4rOJ
	n6wzgf2XndGd40d4SC4stTFIRX/I4SpmxNgL6xz/a2nA8=
X-Gm-Gg: AZuq6aI6iIWEM7EA/HxUMQB9bytwraEmv05s72UQLmCg7ytCNuOgwVTN0MJt+DQ4Sqg
	KD/BuEMzS6zLtAiFXUvWXddXe4vcTQ74MjpJYa6aEVRwY+zVf3LYde8kdRLvZVwMEefjlRtZ49M
	RBsY5g7RUp261G4c2c44gdgDoD1Y/KUoz4EEQuPqWAXpgssNRBelV4YoAHxwh2HAB8PloR
X-Received: by 2002:a05:620a:1a25:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c70b8f27dcmr65743485a.57.1769491438749;
        Mon, 26 Jan 2026 21:23:58 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8b2:e346:de72 with SMTP id
 af79cd13be357-8c70b8f27dcmr65740285a.57.1769491438241; Mon, 26 Jan 2026
 21:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com> <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
In-Reply-To: <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:53:46 +0530
X-Gm-Features: AZwV_Qg9D9OqySXSR2jfxBJ3tC1_VxJSXb3-ILFt4f7DklcV5aYmk8s-xW6NZ78
Message-ID: <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dIyvuiPQoHBTlMHnig8ORPJB0pQzS2wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0MiBTYWx0ZWRfXyBUBEEz0nPAy
 FXpiZE34UHx7r9TiaUiLqd0FDdtMcM20VDgvP/T32snBeQXtY57wjhDIcqp2kT5FT0BSm48ZyYa
 rc9k36dhSCBYMSL6aTpxfh3jZEUC97ypZvunXQ/lbMXC+8FlsuA/rRrcpSqqawwaQAvlwq4BBoq
 QGW5k5xPdOJoYLrc62Dz5FJUl4OCpQ2hP7eK+v+6sGEoMrZtaDLxNE+yxOB6ta1vn5Iv3YlYxFw
 jRfYsaEdZKq1FYKb218HqN0VT4VfFftyzoX7hEM6kxTXDGQtnfFj1joWGz3eqfK8LD+bW/Yfs9b
 ggqauQb7TVy5W/DtQsBamcpwXxpGuqieW8A1oK1BPTfNMhzlQKxWQUHeDQocsIa4PZDcZ0x8Hxb
 8sSn72ZZSzb1eglohKjh4CNwa6ARPPy/asUVFPfszxZV8ZsNfd3FjmpfVlssuCF0Ku6KUmu4kzJ
 Z4ohhuE/YinjR61rylw==
X-Proofpoint-GUID: dIyvuiPQoHBTlMHnig8ORPJB0pQzS2wv
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=69784bef cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=fSljc-vNTktiGYv43x4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90646-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.4:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,0.0.0.47:email,0.0.0.3:email,0.0.0.2:email]
X-Rspamd-Queue-Id: 57EC4901A8
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 4:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode on lemans EVK Platform.
> >
> > Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> > having 4 ports. The ports of hub that are present on lemans EVK standal=
one
> > board are used as follows:-
> > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses =
UART
> > for Bluetooth. This port is to be used only if user optionally replaces=
 the
> > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> >
> > Remaining 2 ports will become functional when the interface plus mezzan=
ine
> > board is stacked on top of corekit:
> >
> > 3) port-2 is connected to another hub which is present on the mezz thro=
ugh
> > which 4 type-A ports are connected.
> > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > connected.
> >
> > Mark the second USB controller as host only capable and add the HD3SS32=
20
> > Type-C port controller along with Type-c connector for controlling vbus
> > supply.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
> >  1 file changed, 208 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/=
dts/qcom/lemans-evk.dts
> > index 074a1edd0334..a549f7fe53a1 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
> >               };
> >       };
> >
> > +     connector-1 {
> > +             compatible =3D "usb-c-connector";
> > +             label =3D "USB1-Type-C";
> > +             data-role =3D "host";
> > +             power-role =3D "source";
> > +
> > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             usb1_con_ss_ep: endpoint {
>
> This contradicts USB-C connector bindings. Why?
>
> > +                                     remote-endpoint =3D <&hd3ss3220_1=
_in_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb1_hs_in: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_2_1=
>;
> > +                             };
> > +
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb1_ss_in: endpoint {
>
> port@2 is for the SBU signals. It can't be connected to the hub.
>
> > +                                     remote-endpoint =3D <&usb_hub_3_1=
>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> >       edp0-connector {
> >               compatible =3D "dp-connector";
> >               label =3D "EDP0";
> > @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> >               enable-active-high;
> >       };
> >
> > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vbus_supply_1";
> > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-boot-on;
> > +             enable-active-high;
> > +     };
> > +
> >       vmmc_sdc: regulator-vmmc-sdc {
> >               compatible =3D "regulator-fixed";
> >
> > @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     usb-typec@47 {
> > +             compatible =3D "ti,hd3ss3220";
> > +             reg =3D <0x47>;
> > +
> > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYPE_ED=
GE_FALLING>;
> > +
> > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > +             pinctrl-names =3D "default";
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             hd3ss3220_1_in_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb1_con_ss=
_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             hd3ss3220_1_out_ep: endpoint {
> > +                             };
>
> Why is this port disconnected? It it really N/C?

Hi Dmitry,

Sorry for the confusion, Can we do it as follows:

hub:                    Hd3ss3220   typec-connector

usb_hub_2_1 <-> port@1       port@1 <-> empty
usb_hub_3_1 <-> port@2       port@2 <-> <empty>
                             port@0 <-> port@0

Regards,
Swati
>
> > +                     };
> > +             };
> > +     };
> > +
> >  };
> >
> >  &i2c18 {
> > @@ -699,6 +781,14 @@ usb0_intr_state: usb0-intr-state {
> >               bias-pull-up;
> >               power-source =3D <0>;
> >       };
> > +
> > +     usb1_intr: usb1-intr-state {
> > +             pins =3D "gpio6";
> > +             function =3D "normal";
> > +             input-enable;
> > +             bias-pull-up;
> > +             power-source =3D <0>;
> > +     };
> >  };
> >
> >  &qup_i2c19_default {
> > @@ -868,6 +958,12 @@ usb_id: usb-id-state {
> >               function =3D "gpio";
> >               bias-pull-up;
> >       };
> > +
> > +     usb1_id: usb1-id-state {
> > +             pins =3D "gpio51";
> > +             function =3D "gpio";
> > +             bias-pull-up;
> > +     };
> >  };
> >
> >  &uart10 {
> > @@ -922,6 +1018,118 @@ &usb_0_qmpphy {
> >       status =3D "okay";
> >  };
> >
> > +&usb_1 {
> > +     dr_mode =3D "host";
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     status =3D "okay";
> > +
> > +     usb_hub_2_x: hub@1 {
> > +             compatible =3D "usb5e3,610";
> > +             reg =3D <1>;
> > +
> > +             peer-hub =3D <&usb_hub_3_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_2_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_hs_in>=
;
> > +                             };
> > +                     };
> > +
> > +                     /*
> > +                      * Port-2 and port-3 are not connected to anythin=
g on corekit.
>
> I thought that they are routed to the HS connectors. Are they not?
>
> > +                      */
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_hub_2_2: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@3 {
> > +                             reg =3D <3>;
> > +
> > +                             usb_hub_2_3: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     /*
> > +                      * Port-4 is connected to M.2 E key connector on =
corekit.
> > +                      */
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_2_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     usb_hub_3_x: hub@2 {
> > +             compatible =3D "usb5e3,625";
> > +             reg =3D <2>;
> > +
> > +             peer-hub =3D <&usb_hub_2_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_3_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_ss_in>=
;
> > +                             };
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_hub_3_2: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@3 {
> > +                             reg =3D <3>;
> > +
> > +                             usb_hub_3_3: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_3_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&usb_1_hsphy {
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +     vdda18-supply =3D <&vreg_l6c>;
> > +     vdda33-supply =3D <&vreg_l9a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_1_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l1c>;
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> >  &xo_board_clk {
> >       clock-frequency =3D <38400000>;
> >  };
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

