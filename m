Return-Path: <linux-arm-msm+bounces-90844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHEUNJnteGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:53:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432798027
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79353303FBCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543136214C;
	Tue, 27 Jan 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NG0jul8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjECSYP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEBA3559E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532711; cv=none; b=BzioAWAsyK8xXOD8smuer4G0PYDy1ZmE7AO7IjjaSO99io3pMU8CP5SLj4IgOq+Tdv2e6z6pn7HFQ++QNWcWb6qZ8aWgW8CSd1Rw2v78LoFFAnVUqACppxd/mrugyYmCf5cPYwmz9bqaRdXTJXHWNbYadWmUrg/cHTYvy1EepCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532711; c=relaxed/simple;
	bh=0/gTW7bor57iy5w64fnPV26UmwycSkGkW6ruo+OWADU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+cuj/tjOhB9AP71G/6WgwZpVYX2m9o9igZvqaXXmPdlwvtbze1myMpl2ATE1vw7IwPLAAmrq9lMpn38nkuMEbxmOr6qhx21G5hB6k1cDBZWnEzPGoQqULIgZs+0qw6nAnDbxV4IgSzUTUtwHB2a3D3CywOZXRmAVUdhllIp+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NG0jul8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjECSYP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKZAp496005
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwxcj6mRk5Q30Cl+vWJ0/QTM
	svRdn1mFr6ryQOZbvis=; b=NG0jul8Ne8/K2FX+ue+cXvxm5PHIy+iKemXCs/nU
	zcY+cbxDPX0i5otqCcaequa6zUOCwT7ROZ/v6estoNGCoZyHROkBv1EFPIkVmz4+
	TuT5e9wiWBBhhTdNkSLg0TbbD8RINPoUtGW0nWZzrVURk+YiaP3z+1ad55pgaMsL
	6TOK+cB3zaEFcQSFYJyn6StkOT5eQFRcjObP5BzOyoZ20rmy6y/Ij1kYwm5Kq6R2
	w9WVrvM6pmai2tdVN8MjEBFi1PT51yU0bZXs/uWDJCQceOf/WuzPLHC0+z6OABSt
	5tvDVCcTijMJFtGZXcdIrBCG/WCsSnRHcdgLyr8f8M62jA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bkmj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f52be418b9so15185106137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769532709; x=1770137509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwxcj6mRk5Q30Cl+vWJ0/QTMsvRdn1mFr6ryQOZbvis=;
        b=ZjECSYP/U5CyQ5gsrZjxfiEWpwdxoBpWiWJLr3+QA0Bbo3NoCjnvVggvdZipIWyDgf
         89M+CQawumrUjymCXge/rne2LQnDnaMWJuGUSKkgohUpSSu+5atZze66UWJJfKEUy8qL
         10lTr2NtocK7gBVjYYs5rmBhQF0UVBxX4rxv2h+SrFE4D4HlwLhNFrovDEKCHS9C99cf
         RTaM1AwFcVwrz0ayZtZnYu8sm52ADx46NoFc78PoloSA32jketIKiD/1EkNfnqXr6Y4Q
         TDZ0wmWc7RE8P8vZciZrIZRbnukI0d/Er2TtLPxgRrl0DhA0L3av9T3mRUDOKw7wHMEN
         KKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532709; x=1770137509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwxcj6mRk5Q30Cl+vWJ0/QTMsvRdn1mFr6ryQOZbvis=;
        b=alwu3guxBxmKsvrmkdH36W0uNTrg+of/WMtn0NiOKYsazas+azATxSnVm+cu8GXWMm
         UPV46jUaJmwfUSTqgWmCoqsCz2b2LI3eDllUmumuhNiibN5PNICVYiNKVlpYAxDdxWYk
         p+GIMaAAgdBOGgldc24rv+rn0RBIZ2HKIRe9lmQCY4poeHLz8BsVj3McQVcLBWu6Coa0
         C8HWuilPQ1XgC2irOXLLoPBQ72rq+YdUWhNLHP00Guvg2PUWyy/AirMzXt3wDZrHtEHa
         Tf321jQZCcCFWeClZOzrbKZ7rCUWCi2uXWnj1oiwOSy/9+Pphr6HWAsTXhThXCIUw3o1
         H11Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRNBkIL2trWHr8L5Ej9OOwTuNASYYUMJop4HS688bu0qgLdSOZiMDnOkMf25SrACVufUPhhllfZsPuwwA/@vger.kernel.org
X-Gm-Message-State: AOJu0YyjqzaTPmzJhNoRBscck6HeWIRwy8VJr2GgH5RNfKaAzpmaG0/h
	clStUy/pUUVG/b4py97qyqI/FnczI69v21THUhavjjZP55wwv4pdjPz1achKuPmSlqDsmLP9gwK
	/o14yvyw3pvRLUU4OeLWKxcS/7mADr065SZpJRV4N1AR10v7mCwjFqIzqz8RYEc1cxaKL
X-Gm-Gg: AZuq6aLb6VyWxlSXO/dSS6vwA1Hkbkbfbj93qYpLxdnkz0D+uBeddoViny+d2S7NMeh
	OlkLjOTidHjWcp/biT7fQVQkwRRylI/ye/QaI0e3dTkpkc1AY5206HcLiLFMbaz/ad5FIykIwk8
	M6j7V/HDUoIM3z6bGqLBpjxBogNOk4RGLyAlfGnNFEks4/6NfudJRQ/+JEZvUuplGmnswVNXbJn
	w38xAOnF4jVstjUGrxKuoLJ8AK8lUEiVbVDGcasNKGqcKyISIJmGcmkIhagFmYKYDIMdEVv4quL
	vmp5jtUks0uC5N8MNnASbvr5N7bxmnGhBveYm/6sSud1flM4o65rbcHAfSitCwUk1H3RAZ+E9lF
	+zh6KWE/kImg+V3ZdvK5vsY7fgZMc6P+jve2erOrFHUErM0btyRHWM8B2y4Qno2HA2HfvgT2qHC
	XGur9a3ga06jr7CjDPj3plX+0=
X-Received: by 2002:a05:6102:50a5:b0:5f5:46f8:466f with SMTP id ada2fe7eead31-5f72363f336mr1057416137.17.1769532708757;
        Tue, 27 Jan 2026 08:51:48 -0800 (PST)
X-Received: by 2002:a05:6102:50a5:b0:5f5:46f8:466f with SMTP id ada2fe7eead31-5f72363f336mr1057401137.17.1769532708183;
        Tue, 27 Jan 2026 08:51:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074819d6sm48722e87.20.2026.01.27.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:51:47 -0800 (PST)
Date: Tue, 27 Jan 2026 18:51:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: talos: Flatten usb controller nodes
Message-ID: <w2qh2jjcltzwwxoyfs5b3ggwvn5xdme4spdk6d4g2xbwegfu36@qh5oxsaljqpv>
References: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
 <20260127155537.4088709-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127155537.4088709-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bAIPfILQSXxhqnX7hY9OsZEx97tH0iIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfXybbilwWrKYun
 LXCl1KFStz9xTYdGCSrFV0LF4qKXKM79Huxz9pgwVA06MAUN6usMff9s1UiG/5FU8Tgq+p1JUwv
 c4tTOVb6PcZASEPS2DrGGwk7FpxN0PoObxG8mEl99Jm3j+1UCSi0g/DgnxDN7EZoSm+9s3xxDz0
 5nkfyn91eVx7I3tBWa2+T5f4XniZWzqNawtQkdFsGHGQ0Rv+WYE8tl25YUbsvMqv2UAItUGNqGX
 9FX+yirpniAryift6JRu1fqA7cBGYhI79coqO5Mppa7a4I/dduuoLgXF6TZxRUymdDW9dzksAdE
 JNmtYLnpf3DZyRw00GzVdHHhfc2nG0dXUGWxVFHijXefFuxRy3P9PRA+4+eQxcAfEuvjIiHumFY
 qR+xeV8Z5qg3bk2Wu7jEzYqh3F0ld5q4W9nxbyR1I1X5vnmTrvqR/GtyT7YMDE0sPxPZkIZZK7V
 RMSUlNhCILtUxiLqX9A==
X-Proofpoint-GUID: bAIPfILQSXxhqnX7hY9OsZEx97tH0iIi
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978ed25 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EWyAuBf0Nt3ETjVQhn4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90844-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9432798027
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:25:37PM +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +--
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 93 ++++++++++--------------
>  2 files changed, 42 insertions(+), 63 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

