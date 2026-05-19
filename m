Return-Path: <linux-arm-msm+bounces-108444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIauMG4/DGqqawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939E57CB9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6BA23045EE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357E535200C;
	Tue, 19 May 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFtRawkX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo+SQTHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED234A76F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186862; cv=none; b=aDf5yFIH4hjhQI7y4AQwG0TdgggXVGkWgJxSjhr40oDAM7NdXczibnTrtzzKiMGaBb0KzeJs4bon972wfWU5alvInrOA+mppdPowDS+EHyQrFHpTCMg1P2z3oT9vv8uiDJ5HpRk/16zjMqQdGhkUo9zxH0jdxFhl0iMVZ6FAB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186862; c=relaxed/simple;
	bh=AxrschLwBHDlVdHJM3psav597BzvT8GiznTe2sTYbwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI8BwzteRhJcv8F2Sv/mxG9M/+d8BHhEOig8HRygLoSgKi/Y71gOn7n8f2GUGumLUGvcB5vPi5KLatCa7TvI5YNxXL5CqBo0ydaAnMa3cIxJdOywwCKBcFC/Gx+LqVuhaBzy7EdeDeocQdtlpg0zC3CUjQC0v5QYEJCGgNgihXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFtRawkX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo+SQTHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LsiY4063029
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LJrtjiJ90USbs9CvKrw/UyUm
	vdyx9+SH7BWj4/0e3LM=; b=oFtRawkX8BYtj3jps73zNucYH4l7WtxoWfUtiuVo
	5r4y4XIS2+zUAXywH1vbtDuqSjgvh0u0NztNdmyqR7HvV0t2PsgzIKJwDn67jhgB
	qhA+TJr134JiIX98SWbBCNQoaN9/8UykKYTguy7GXPONB3z9VJQtDU+YXAQ01Sp+
	Ufe+9xZM3XEZECFY1x8pVO+MXN5ioCyxZur+4fhwV7rk8BnM3HA/GT3Ny4U84T3l
	3tpS8bQmmWlT6cMhMQPg7o5Jt3PUe5VzGhVS1gZdFkOItZ8yL4wZ92I1UaX93trM
	gfoscJAlBnXAtMJCcZ4JnxUDWoDEF7nLVnK8HNZs4/0LFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u09fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:34:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so115420711cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186858; x=1779791658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=Fo+SQTHOrbGxUgso8sMZG4+Pl98j5TRHt05iahBnDeEretUvpZ9aaPmDrmJwOYNj48
         i0GlhlkTWvOkL2c+iAYjH3vFgCk+Y7CYds81+iSlmJ0tuocjzqnUD8pxFmmByVf2tuza
         jD7SWleL/aQ7h7vkE6qPrm1CXasM4ofYAtdY2uVu8uQwamlItd1GAczUXuSGiuSjMWcW
         L7oRiY2vL2i65LpVv413gQdHQ/nSXwZ+zwJv2YXFdI8ZseWyucJIh6tnlPyAsCdP/xG6
         moOGICwMOBN6Bgo46gPsTaL1EXjbZiupW0yMpregtXp2p4oW5lCr+/6u1oQL34ZNCjgn
         /Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186858; x=1779791658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=DGzHySDWaaQCCxX1EFPsYlOJ1ZaCyN0d6nE8AoeH8MC5pzDS3oxV7aRPSD9gMxlSqk
         KmJzPHbrPHn/q6vLjYgA0qeHTm7LEdre5w2C9JB1iOZNhy76kupcIOmffqQyr1+qIjGa
         VQnYRzVelValBVaTBvUf6zr5yMOxUM27S6Mg5TpgtUg89MNy0haLOBXB5YeAg2AfU2AL
         PLpE0fwSBLtQ6ELdHpstmty0t+v5/9lhRcx8fihLZXGXvDq94R0Phw6fVAQBp/XIShTM
         bA715fIG+E16I8eUGpxn9i+DA1AL1o4DYZrQbPqlp6vs176J/yNRIa9YMVBOqGk+cRiU
         w4MA==
X-Forwarded-Encrypted: i=1; AFNElJ+cRsMyPW7vSau3zefrpfkKRBkGr+QfPcISNVdQJh4HHgirfBVvexW1xDgxEMA4UxcdfhSwZckP9gq5DUqi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEW7xnLp2B/eyuR+1r/Wc+BPLs4bkcuR6kDWxZWOWonD6dZqc
	jJz7HksHU7yFfHJB66n6xKLvLp5ShG4zMDKN2Nq8YBLLSigYhoBWVCxVBxpTkpMiApMohD1hLSZ
	ATrJRtXj0FUtF8XRpkTZ+qgHnbkQuAdJIUrIC6gFWOGnduh5LlGzxlXw2/KkYu0Do2GDnfDkz5K
	HL
X-Gm-Gg: Acq92OFD5Nypcx55Z1pOCFU94+by2XqJM+LHCqxZmLppQrWTwHQcG9EQ3Nn9PT2Plen
	z/a0Z0EobOOGk4ej5mNJ0ghy/ffto6UqDUSiXh2y+HD7n9OmNwX5bZCpnHt+T/Gdhs9Y8LA+/Vh
	uaP11bQG0Y9C83OwhHthvr1C2Eyt1D1WLRkZw1WWY3webhPCHWSFDb+X3Wr6SLay5Pl19VAKfie
	8lXsL5gA0cDlpMg5pm5p+dujpMwRo4vVtKhfYkj4wVZOPc4tk6kmz3TzB6nmNDjJUXBBKAWYOEg
	JKfU0Y0utQnPqOwCQ10rVfVsV4ILsKzFS5c5VTHJujtFsQQGEMsk7gLlEkZFB/KZ0SuBxwcGSOP
	N3j6UzzaDkjmuRUOIcTXXScZ12R8RAtwygnay0NCr1iuV8xwoOvXDJjUn7PvmooIGRNI07bs72N
	kmaFK1cr+yIj6mFta9FW8AqqgmiB+sZjONRoc=
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259071211cf.56.1779186858315;
        Tue, 19 May 2026 03:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259070841cf.56.1779186857860;
        Tue, 19 May 2026 03:34:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ffbbsm19057761fa.27.2026.05.19.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:34:16 -0700 (PDT)
Date: Tue, 19 May 2026 13:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
Message-ID: <lzic5v7zdqly6z2tc7ddvwkhau4toaoq7vavbgqll5smmhius6@bpcsn2vyjmrx>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c3cab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nMIgit4TKir8xPiZD48A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ixbG453Gmxvdr-cdBgtMua2KPE4tEIHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfXwWEAY6DEiyeO
 mT1h/Ev12OQuCfXeiuKvxw5Cu/Te7AemE0tjTZxdU+iFyJXm+Wc0FoYyYv0CqUu03g0EDjjmLeb
 gWmRY50PfEUKBTzmqTw4wXUMWFyoQyqCIxZdWOuW1T9/i1ERUvOjcOUufn319pIcv6ZS4OKJ/G5
 vB20KCi8rWM7qF1U+KDK77uUbZbZEunU98YVwfbb1oaZiVY1NNJVuf+4IGGAxDwVDD4pKMp9aiO
 pwbporZtr9SmbZgTcuzCM1FGfDbQxBmX7Z6/bCVk+q/Q8mT0I9xXbbfXS+hh5Q71Ga3EjU7JyEN
 ghW2Irnqo3Ix0/H/q+a3A0lUY6VS/AlczIlKNw2NR/ytWGlI4Twj3PgwLOoHpjEu6Qx8yIxFwwF
 h8CdU95f7ClK22CwZmcvxBy+14P6JG9fcmhCtfsXyrKN6zQ3z0jbcIS0X4FhcTJZwfSHv+i6o0m
 KCpvl0psJX/qyC2dhdw==
X-Proofpoint-ORIG-GUID: ixbG453Gmxvdr-cdBgtMua2KPE4tEIHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108444-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2939E57CB9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:00:15PM +0200, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

