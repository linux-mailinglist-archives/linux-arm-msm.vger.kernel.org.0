Return-Path: <linux-arm-msm+bounces-111595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A2j/If3SJWqMMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:22:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCA6517B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GLf/u0Tr";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C7AMM0eF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B998C30078BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C377158DCF;
	Sun,  7 Jun 2026 20:22:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC81DF72C
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863736; cv=none; b=YLq0kIrOjKndcac9bdW461g+KYjo7lSECEeSnRIIbxG7664p25w5zJMjYZ85SsPpU4B6t3vG8sqhkWpnsoxutkpdchg9mZLE9lz5wz0yRMhh82rht95ip2b+y3Ncy8ZltNAz7ZUlL6FIenlV0XurRFDL7wHfvb+W/pWKMxa04Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863736; c=relaxed/simple;
	bh=giT1I9zfdDcaXk6MM0HM0EHPao1z4tagevajV+cQ0OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrM5oTc7ZY6r6Qx+SC8ncm8gSOhXOrTyHHewObSQJqkJhTuMZRsHGaLudCH8nnYbgWatW/4NP78P9oXNgpXcXjY+WsJKmalwWPqHxuNv4ax+UZ/V/LmEF0OvTRPlkKhbChJPCyu3r9fHFnR/+jrN7xBmfviGpBMUMY3qzEQYvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLf/u0Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7AMM0eF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkNXK336535
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zj9yNlRTpmlfU+qA45qjBd0d
	bow/2pUcDycgzZNi5nU=; b=GLf/u0Tr0C+f1xnyaX3FCezRA8NcjVLZqh7KAa70
	TmJUah3LF0ePNoH7TI/Hpo7tlwyGadxSfSqKaK3gyMMIufnYFlpR0WrFgNYymufJ
	fhY08BAfxs6c3F3iFeDt8wLyhb0BpHZPmWZLyOCdrjKz3/EnRYGTJ4dkYLfI10ue
	cxYU5p6zQCVuqJiXkA8Gvg5dexrLj7R3PdG4R0xfQ1FhdGztjNLdbp84LNsSsv4e
	xEer5oUBdUOPro2JEXY7xRaYBWRw+hZzYF+zxsUU/llrfkARxiGajYomEWrNyAP2
	KoTl9909CXLo146VYZ6COr/Azx6D0TSJHwc+izyFkYQ4Rg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvd9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:22:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ce9df49c6bso56540796d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863733; x=1781468533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zj9yNlRTpmlfU+qA45qjBd0dbow/2pUcDycgzZNi5nU=;
        b=C7AMM0eFE/3ApYwGOqpUbwC0zOldPtWaKFIvEptZkregitJhlCufT8R956NHxylG7i
         U0JReCeNcBWYrU86MZT5Q0iGzSi9mZddHx25SX69HPlcucMj5kfOVJEfEx2nxrIaudqU
         QI+UqjTQQozxyR4h57AOu99b1nWMzJWgCKqu6HbC3inJ1aB3oa7dw3hhweLOw2wwsyiQ
         4UIusVU4Tj0OOQqUoNt2FQr6T1jChoQSL81HKpiznClvqKFZIAWJzxzQQb9nzGjGKrAn
         3oyP5rpgRIWgGaXqgP4Zz2hCKlUNvR8SUmUu5oBoXXkiLhzPtdoLDf22kdcEGqGIYDNh
         /Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863733; x=1781468533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj9yNlRTpmlfU+qA45qjBd0dbow/2pUcDycgzZNi5nU=;
        b=EmuSbydehwCBDV2utwz93Zg3f7ozUr/ZB5m0zrJVz7z8xcWJr0ZNfRRmPxs9A5pSCH
         3YHMOO1iJ40RxS/UYlR3X0pn5VYoroyFyH0gDkCazZEwpGlTPUr/5R9HgrGsWbGobaa9
         DOgaww37lxsHjZGHQFxlfyI5d0RHde2RAC/mOI263ah7uBVBdl6UaVQ/0esZKSCfXBmi
         L9JprgnRAucMFqjtK4o6BphfzRzpgcyZD0XQ/fOtHSGMAQPzbcjuLLuX4cLDd9+yH9Sw
         fTTMCE0EES5KIRs/Hq7ZFInZ0OeD1alDvnxZwDVa15ABsCDPEAtqx1RK74CqWeXcHj1p
         /f4w==
X-Forwarded-Encrypted: i=1; AFNElJ9nVqVNM5uPFer19+GcZW0HEDU5xtvgiObpORDNOyJPJzwPo0/aNOcUgXIbFzprNR2cKLLiCvVrQ0auTg1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTT7HPEHiZr1SiiEOT6IO/Xjx9uyhkBzGYRSp0aaO3kIwY5ko
	S4H1hBNbAbLrH7WhPeoSDtgFcYcsYmNXlXrGl11FFSR41c2uklnVnryD5du3pQqwJmqLu6AP2vp
	kqyUYe6fYsrY76hNtCIWT5Fon4ekaMQGfcqR/bx8amVAS1/INdBJe7UPvJjlIUiqMtIAt
X-Gm-Gg: Acq92OEWfnb4ncjD9aPuq0jQ29vc3yKq+EOlhU/N55iLdrbAel3E+2dYxcx6LkgHU7o
	gy4YIAhd0uhvaXjTWSurw+dx5oMRTL1rrGNNxfxIGW794e8g/5L5giT6nCBOPOunNZuSYnbblJG
	LdQ8BH92YTIARZYwAuNJRiraOHX7p4feo8OZ59MQuEMHwGE4C9zO9I9s6zniyyFli4TuFM9LL6k
	IU6Z63YpamFdrfji4pGW/WArPRgbShgEG+4PUhlc3Nh8S05Y+utxuGqpnAmIXMAzl7WLbzaGScw
	d9mWStEL4j2MBpjLVy1zOVkfd5TdmxPyr4nQxQq2DAeS0pNSPzGePVMNKCOB3+jJiVhlRWQQ3hM
	jQpw/Ca1QAoiGfd0WA4O03B/o3BriT9lP7CLTLITna6YASJpgr0SlNSX7cwENTD9tW6zib+Aflk
	qM4x15IvCxg6+oL4kdt7G39CRUYurULAGIrwKvLmJZ5OJV0A==
X-Received: by 2002:a05:622a:5214:b0:516:e74e:cc51 with SMTP id d75a77b69052e-51795c29083mr115039911cf.51.1780863733398;
        Sun, 07 Jun 2026 13:22:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5214:b0:516:e74e:cc51 with SMTP id d75a77b69052e-51795c29083mr115039651cf.51.1780863732626;
        Sun, 07 Jun 2026 13:22:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66b1csm40812001fa.9.2026.06.07.13.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:22:10 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Message-ID: <p3l4o2qa6yt44zwxxqhafnr2ty5fbdwxewuldelfkdjnr3vsrf@cnzrnfv2fq5r>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25d2f6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=b_Pr7HiucSRPs_5II3MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uh9B3w-5DmfSZez46r8NMQzDOUiRAQSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMyBTYWx0ZWRfXypaxWT499j+u
 mWZyZHeiEH+qc7oQjk/3yAJdZ3kkm8iCxf/YGmKCoG6IMYZsVjfsv4JL3f7ovLyLZ1ZUCX1lph1
 TOfNqi6gBspUstyrv3i35oa/JQNhw0pAp3V3vJIfNw4rgMytcSHjRLfDQd7i4V30gT9mxExRBvy
 iXHKeifN1UhGgqtLzFsEBxStu5uL2W4ArZ7ddDrUZW1ghafCUTQoLDpCEZfFHrXvzmfLcCOTgHD
 nFjz6hFy1k/ooW5uUpqkzgMKgp5UK+N0YaF7EOp+8i7c9ihhssE1MQb3zCEaUZm/8q1KGcRZD/X
 4uxQ/qJzn/ATXMzE1D6iG2pm/W9qPc8/gfgXWoc6krAMJ8iJYssGP+CrYK8acK0PtTl/XUaxMr3
 +NMRTmWScYfR+eURygv6jSk9CIyXRnRgOBwSext0yBIZPuxQ6OwN7mkSN3dUjGP5KpkZMZ5W3Jb
 1jTTMHZKhu3biTbVLbg==
X-Proofpoint-ORIG-GUID: uh9B3w-5DmfSZez46r8NMQzDOUiRAQSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111595-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,cnzrnfv2fq5r:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEFCA6517B6

On Tue, Jun 02, 2026 at 10:04:05PM +0530, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

