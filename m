Return-Path: <linux-arm-msm+bounces-92808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NHIBUJVj2lqQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:45:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0913859B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75272309B4DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9093624BE;
	Fri, 13 Feb 2026 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJPBi3KU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3NE5fTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917CE1BC46
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000981; cv=none; b=Om8Owr/i2tCeNgSrBo9Y/x+lqNubm6KXMhbnP2EBXlQR1MmbQ9VPkaMWa//NqJDQmPg/dMbazRf8+LPsbk9REUC7IEjBS6CVl4/nSVRB4tcpfCCY3uBiu0vnWRZLrKkjxCMrU63Nwg97SNpxHZZie83qOO9OKAAyBFzIc8QNIVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000981; c=relaxed/simple;
	bh=RzlTtwDWjrDJzZilWWFNg7OXghugjWlOh3M9/Ztxbvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYGuRZfgKmwlo4LRF0WRw22cpA4+tsrgblmKqQk52H8pYXP84xdXEYirS+G5AIO9X6+OySHMZhudeQOv3OiNVyhoieuK4gyFJWUB/Bu1AkBJyXsa+6xcUsNH9zGg36uwfRxSpZpeEdxyBAGdOViWe8jGsRWhft8ZcuVD00U9BxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJPBi3KU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3NE5fTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEHicr3046919
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lewca8eB4Pjse1/UPMFuP0dK
	n9xZNN2Qlj2RLnTN4sY=; b=YJPBi3KUdNNsDWljJriezMxxq5TZIMx4buD8/6Cb
	bl3ZUfde6HIAscRjsgEQz4GmSBrypTKVIcTgONW1L2wQLPX0yuGyVIGDBd2brR2K
	IBaNnyOxFZ2GvOCKU84IxYXMekk1ILMj8abFhQSYDpt7PflzxdM6AkozFtsfF+Cd
	V/knKSbNfx5jhu5MAWtxhZA3ISLxWhXS2mOfjuPfbtDXjQcUug7EzWX95BMDPTAh
	Y/PtnYl3qLIQu1+PPDW/I/qih+6r0PoRlVK5UzA53osRLlnCx6NXyW21+/jG2alQ
	4u7vkjDHa0XMbJjimz5rhJcsjg0vptXxmP8nOJHSFwoT9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2usdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:42:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb42f56c4aso295576985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771000978; x=1771605778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lewca8eB4Pjse1/UPMFuP0dKn9xZNN2Qlj2RLnTN4sY=;
        b=R3NE5fTo0ZFDh9CGeIumsSt1rX8qIaH+tsUe+rsgaIy+l9rDfXcn+SrYnaWv4nhBn1
         6Ys7zEzzcuwBWj43aiFGdFzYxxpaK/qDq3k8y8GWR1BTu8PlrVt/X+d/di3dvYAZBw2Y
         1ZX5I5LPIV30MJkwyK6R3GScmcXEnoold95M0PzrGzuNPMcxxnHus3PnwzIGeSn+gFIB
         NnHJEIoSn2DTcsXoH0mJDEsZewcULvRzx5RBNbVw2+iODaHE+DXXTezrrfX5+3ybh6g6
         XTIPzxTULqO30QVKV+OdvwzYoZ6wKouTw+LvA0iv2Bq7kcOG0a1s74mhTw+2RD0zLZY0
         Wd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000978; x=1771605778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lewca8eB4Pjse1/UPMFuP0dKn9xZNN2Qlj2RLnTN4sY=;
        b=vhrxDMSH2e4S1qiNUgbTWN7GXnq9POdGR9ls5f1c2CW/X7pqWbx8ewYRVKOkw8vJr4
         Aj+NwfbLIonD5L+vhnLh4xWGngMZvGH78/fYfB6wUqcVr/uCdkRV/oBHfZn9+nv4vwN5
         92jS9U7/1ZTF/cBmTp1GdCeRDx2xt6k4jLB1duFYUfo+cVAdRHzQXE0+fqMbZxU0cKVL
         L92UZ/FtE+QR//0hA8VXET7LWwDrmCxYnPKVoshnsJ5vjFmzitdvlYM4e0ltWLQFZrHM
         G1MrsuZc6JLDc4h+AbJ7srzT5aUMkG56LxRaa2QEBRPIdqsr9aiApa3qOVhMhi2hi1ar
         2PAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0lx9NekomeRhXNEr9Cenri1GtqVJ0vrG8GfNMb/S9EXearfA9ecyV5Fp7Jp74u0mYXs2QByvIRRWO8nl9@vger.kernel.org
X-Gm-Message-State: AOJu0YzsuGAHaTSDkTD6zo7mSK4gypVtIJdUEBZuNi8d/Jfj5GLojeCj
	t7uS/3TC03pjUwFMwEzR4lZQ39VKmZXDizrM0OH41n3bfNG3EaOrxGxgMxDW6KhQUFseMNYHNTy
	+cEbvpzCiUFAS4FkllvrIHx7p1zw+PhWYTAgY3aauJXN1tLgeCLyUV7u3IPwIsRKLAYaU
X-Gm-Gg: AZuq6aIXnWKVN7R1Sn192GwY7uZCz12t+xEo1sEqjBcBOJlk1vAw2DePWSvt9QU0d06
	/GWgKMhc+hh/eepgE1m98dSuyPN7C4lWQJLOf7Y6IeD6djq95H0R18HMLuty3h1cabRys/2wy2n
	yysuGY5oG7JRu+0ZFcxtBLkXUpxM4/eYHU3fvLbOIcNOnWeOY36xVmGlba3BHyhnq6WxwaSQdSl
	Ts/+0BMxwmkiuu4XorX64CyFGrSpoz+6EdwOQRso7//dQMGDwpNcPjWGGGWxfPYJqTnugWhj0RH
	vsBiqegg39TeUxrJpZ0xc6R/e6dPyMBItOZkBBpz2Yv157ZHdCxEWrUoj3vmyjdQj6+pzdSCT/I
	4o2FMOQ8tb/XBheIbiARc87bY4+0m5fNwIsy57VFvtDLI2ZGEaWSnyljnNZ/wZr0j7o60b5/kyj
	V0R6pfPM44TYITwjbsJo3MOVcKkTL0SH/5S28=
X-Received: by 2002:a05:620a:1725:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cb4229e84bmr285191885a.35.1771000977968;
        Fri, 13 Feb 2026 08:42:57 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cb4229e84bmr285188285a.35.1771000977496;
        Fri, 13 Feb 2026 08:42:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706928d9esm15367641fa.42.2026.02.13.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:42:56 -0800 (PST)
Date: Fri, 13 Feb 2026 18:42:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] interconnect: qcom: qcs615: enable QoS
 configuration
Message-ID: <3uk4bsce7lnxmd3ryhutatzgprwze27d7zspaqybxc732asezz@uescff3ohule>
References: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
 <20260211091112.3285626-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211091112.3285626-3-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4xG5kLBjbQguUuO8BpJhyN8L-_ewKnuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyOCBTYWx0ZWRfX0ly5it9jiv+J
 0um7BURtiXsNM8WE52JJ6H/qepyp1iFFQ3C8HGpqMLQ2Aklr7YCnLoJva2FTu8CyQmjuGjFIVJR
 vncTKxJ0gHTm/E2jg5KcegaYYrj8xjxw0VFX+FgL7/zJSPRQ1CBSqkiiXhSGswbpTKBCnuHT1F+
 IfncaPXfynEmnFMRsvwoW/aUG/E8pQtl2oT/a2gs3jRoyCfy/1D0BLPmsIeutuzrBbqn2QvE151
 h6QOKhTGszb8aeqVvX3KRZJFUhfu7nQ3uVy9wwzM8LR3OoElolqj3Wjdgf8SwAunEXSzzQJNVYd
 kdtNG4N+qbqk4A8uzbqTwP9jKDrMVEOOUHqTubOFGkam8i4EznP8EjCWdvt4yBR1NJIdrA6iLYH
 OSybhJB7RSv42dQanuVYS+d0VT0fGXWEq0REEqypJ6z9DScHRRYrI4eu9NblS2fzP0FtStYiLup
 RLe+XjdYOaKyb3GR5Fg==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f5492 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Np_ZfMqjrSSXuD8GcM4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4xG5kLBjbQguUuO8BpJhyN8L-_ewKnuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92808-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AB0913859B
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 02:41:11PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs615.c | 247 +++++++++++++++++++++++++++++
>  1 file changed, 247 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

