Return-Path: <linux-arm-msm+bounces-93830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /eZILDLSnGkJLAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:18:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4417E289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91D6530440C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405063783BB;
	Mon, 23 Feb 2026 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgEv0kpr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQ2K/4CG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5013783C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884563; cv=none; b=KsX9gBPp855ZiGM2O1ya/A+F80i9d8Dghn1GfLIupsALl5n8mi70DFuqf6rVxV9IBHXhcrHFerA70tmtEx8EtghiOOOkLtywH+VlQ51+4j2MUoNBlR+WBUX2dWGVx/udankK3KrfBaoU6cc7cqc//jx8hT6sZbTan9/NDG5r69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884563; c=relaxed/simple;
	bh=bVyfsZLOK04a4Dxh8V86gVsSIRT+i3QdwGBR4OH1t3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJltQKbQRZjO+Poe9ewLV/TKhHQRED4otcz4S9Al0U3Z6WPqLW34/5ElZeHDTnApCSrXILkqPlCN4fG4TJ2417bueEF+QWMeUp0m/JODibT6cvYQnnLHXZ1JXeQpn4uXyMVXNzCLdx/0ZjEQCuM37NFFuqv5qltNXokoDyeQkHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgEv0kpr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQ2K/4CG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIWYsE322188
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIm2pvGtjQta7a3p4i083GC2
	Y4rWKB7jIV4INnw6vHg=; b=UgEv0kpr6PHVX2B1mhOg5FzDqEpX3tmJTJjcuIpy
	uB5ikuzRCY+Y7QM7jhkNnPjdKaYqrbsixz8JOGs6kDrvVSVGTVgcBPGeVzk2p+bH
	wH+ydRGkZtrz2khxzvsr7GDCTNbTwu/CgO7Wo0Ylyqgmi/qRIRHKAJnuT8qGLoIr
	cR33sApEWfuCC8o5o5Dv95DGM3iIAXT+cBHNvORqcL91dMb4hI/dR8H1Yp3FbUIz
	NYl27RgYyyMlbmdL090uqdBOIc4Uhn3ZwQCvCHqQoLZMuJYjfg2aYVmCAmhkviSN
	hTzGECIl4yKH5IVNBWQxCBlZFpfPThtHtYXiwDyR1HNO4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y21t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:09:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so3916942585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771884560; x=1772489360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIm2pvGtjQta7a3p4i083GC2Y4rWKB7jIV4INnw6vHg=;
        b=eQ2K/4CGuFxNdO7bqL+kPphUTw4tviwt49/pDQH1RDi8BThGz0VNREfq7yL3Jo1E9f
         wSAe8JyagGsRob9KsxEVmlthBs+uSIK7KmOURkEw/WGjmCWiv2dE36+kLR8B7s7Rpg67
         CiYKzUCAPXhgPOcHmKkGFULXwIFAImjdep0QTwykGswrrP8QuX4w7fHe+h83pLVcvHCa
         nS3EoU2a94Zot1eNMzWZByA4mBPcYpiSW1PN6I+zG6Ec5lhAP2PsU0Ls5xaQb+M+8z/N
         OiB2fjokpwGyDU+iSsJG4wR5FZB75CYPg8mc44rX8rIddYJsHJjOrUp/4PxsBxjvqnH5
         cFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884560; x=1772489360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIm2pvGtjQta7a3p4i083GC2Y4rWKB7jIV4INnw6vHg=;
        b=eZYQ1dgMIe6gHJyJMDbPOfcav3/AD25cV2aRCei0l4R0FRDuZORwJNxwRpD1mu6ecw
         A9dFLeilUopZNMat9Wkru8s4uoJEFGejNkkKn6sS0zfbwf/ZA8cE6UbD2inumA3fL5CQ
         VwRPrQ1NPWPdMNAWTrl+rtwlTnaA2RpUJT3gfLQLONo607DHX07y9XmTRHDP3d/mE0iM
         eD7R8c9mVAmvV5VpwbrIwCQIAJAuxk+Ucqs8gf3kvGfkj6shKqYY2PzlCvzAghTsZyAG
         ODhA/Kyrqcnek5g4qc+z42Ya4UFdHhg1Nio0RLUXM4t6GZGJisDmH3w2o/Sqe2/+1Xj6
         EGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKrhz0cpVF6fF29jCZ02WH61fIUG9VjAYG4Y3pPH1qPVlRtE4m+Q7q6MczdZjYnaLhAtld2eSJ5/Ak/lJo@vger.kernel.org
X-Gm-Message-State: AOJu0YzvdXhp0/eHslDTvznOdLHGZo7DSyFO6eOwi2wzOORcAqaSMtuF
	c3iRm9F+U2DSkX5w3bnS/d7J39+gJuxtsqWFMO00kCdgNzrAJwfVSCm67b++ReWXeSvfFOIUTr/
	ddDayqanDIlVQqmbCZnfoa9FUzf5adeyaCQUb8+UfLwjgUsXJyWU1W7xGYYDb4oWUqi8s
X-Gm-Gg: AZuq6aLxBzS6UM6/WE4ReqfTExhBXbrZRbKdCOIqvXXAkzdTbwxzRfvi+Y7HOBzZlZK
	KVrA9gWXTxE2Cvs/71pUY3vcW8MvGTDw04MmRGsm2aQ/qaUmi1Z9XNwhCd0jh5IEQkeOy7eOJeW
	vi/6n74/VkFjme1H8VhsiW6FTiPCOXajGLsjH/MP+evVh+fl7l7CRbzeODJw2FQt2cV9Vblq5oM
	7j4xgOeibTBaYoKozaa3WDqkH00bX7EYnIRbG6L6AbMuZt/Qedrj8kEJwpZMVi4F/tM4Ojszrl8
	9T3kBWCO1KDOWQtFQMM749Rai5+8VrWnDtTR1pLw4dYCPVIWjiTto/M4bp+l2V1OfSb3YtVMb6p
	RghLDxiwClxlaeWx4fX7Q9OvqBFQ9SG2cOci3qEHGeypgHlqUK8XrxctAnW08OU1bfcqtKFxz3i
	kqnRgphb2aiuDGMoJLgvXDACTHI26obFkqr+Q=
X-Received: by 2002:a05:620a:4495:b0:8cb:49e8:d460 with SMTP id af79cd13be357-8cb8c9cde0amr1252365785a.5.1771884560184;
        Mon, 23 Feb 2026 14:09:20 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:49e8:d460 with SMTP id af79cd13be357-8cb8c9cde0amr1252361585a.5.1771884559628;
        Mon, 23 Feb 2026 14:09:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3e8f5sm1816684e87.54.2026.02.23.14.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:09:18 -0800 (PST)
Date: Tue, 24 Feb 2026 00:09:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <2pcw4qrgxu2fwhssyf3plu6h4anwiofvdx3ppnfbngibfm5lxz@7ixcrh5jk4t3>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
 <jncbztn4xohzns734i4o2hsherdshjgxqtiglh7zf2oz7nkujs@an24wf3txymy>
 <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
 <sf4jvwou4wtlxamwgkwb5c7adujz6dwoqwws2aq4z7jjvblbvm@fb5kqkt23ktm>
 <a3b01ad0-faf3-480e-9320-db7b7c426a3b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3b01ad0-faf3-480e-9320-db7b7c426a3b@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5MyBTYWx0ZWRfXypNRjE2wPhU3
 F2+S01b5onyfvs0WJKQs+WFdm+WvHmsujkIL4jXH/2m9YqUHfJuR/K30ENvwZjzK2N1vyyBblDA
 QJfvTRT2uBlbrgAC4G70YxrBA5czUr82IlvPjxHc4lRcxX2t07xyOYAljnXIaL1EkoCajckU1qr
 SIGZF/LGjjcpDzSY0ZGE3jFPls92Iq6yjLzHyJUsRPnptAy95IC+spTiZbhW0rPgq/AIVPBQX0z
 K5QtMF7aMF4ngP1ODze9ESc6g7382KvIPs1sL5wPchy8a99FAlso6DSKmmIoV545kxpf9i99P0K
 3xJpcDTF6kabCQL/LkDlgZp1HDkWhqNFz7i6ZrkvwvEdKKtM7OII5SM0Xbj5ulS1PG7++OMGXzx
 UyywO1Pgxdv2DoUawhmTQT7qW7nAE1qtSviiEZEzajDIxUhUrZ/GObh5HdRwEDzd+VwlU//wHYE
 rimToxiuxPuUsHhqozA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cd010 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rPpstBZ-2qTAgRT34u8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yZFO21BTVA9tcuppddoOQhiBelxCgCk2
X-Proofpoint-ORIG-GUID: yZFO21BTVA9tcuppddoOQhiBelxCgCk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93830-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24F4417E289
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:37:53PM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 20:02, Dmitry Baryshkov wrote:
> >>>
> >>> So I presume what you're saying is that we should at most declare one
> >>> level of non-controlled fixed regulators?
> >>
> >> In general, non-controller fixed regulators should not be there at all,
> >> except when they serve certain purpose, like fulfill the binding
> >> requirement. It's their only point.
> >>
> >> And a chain of:
> >>
> >> A -> B -> C -> device
> >>
> >> is completely redundant if all A+B+C are non-controlled.
> > 
> > I think that came from me. I don't consider that to be completely
> > redundant. It helps in reviews and in some understanding of the board
> > logic. I'm not asking to implement all the intermediate regulators, but
> > to implement the meaningful relationship between end-user regulators.
> 
> These are not end-user regulators. These are fixed things which no one
> touches and no one needs. There is no single purpose for user-space to
> see them.
> 
> Why do you not insist on defining all of such external oscilators, rest
> of regulators, all possible little ICs?

So, where is the boundary from you point of view? Do we define fixed
regulators powering DRM bridges / USB hubs and other similar devices?
Or do we do it only if the bindings require us to do it?


-- 
With best wishes
Dmitry

