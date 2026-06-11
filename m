Return-Path: <linux-arm-msm+bounces-112817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MmQwLOUbK2oz2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:34:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B079867530F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sgz85z5L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Aypbt/av";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C290D300E306
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556203A963D;
	Thu, 11 Jun 2026 20:34:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAB36A02F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210080; cv=none; b=RHwKH/I4BYfASaQY9Wbb068IggvobroRUjr9qTYNsNZL9iAVSrpb6q5JMHFuvw2fH40eekUoDOOVU34XDxaeRwRrCxydTMUl3LQ2LbKe8eIFPdLBqBTUjM5QGxsoemogQhOuzeYNd4N39mEXX/QQjsGRDB8QRVZbdj3CVgV5D1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210080; c=relaxed/simple;
	bh=TIdPufXGdElKKnuHJAx+uoz8CFWSUSnL3a9cM2RTenE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMFX7wdC9NsrQ2Wo15UHQ7UnkKQp4KttrVL15YaE+G62CdTP4+wvaG8ppME0vDAVV6j5X20V8GI+FsnAriTH2xlCelIid08t2p3xZksc/gH+NmOhSlH1OqsP2Hv4G1uk4ZaND7KW591SpTjF/BHDXoZ6oAMrNgO1bGZj5feJPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sgz85z5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aypbt/av; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3clj1427229
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRM+mxmakpC7NoTjq1FhUVVt
	icKlB4ODWObaEuOgJvY=; b=Sgz85z5LwU/4hN9dsMBpi2gliJxiIpqUn4joeGpe
	7kV72iMrCYhjXl8iyv73iDinhN6vKuatjnNGka+5wN+lPXIHmiO3ssYcTYBZAVPm
	AJlNsqjxgl9/kU6kx4IAeMBcNtRn7t3X0Zvp/Fw/hPSbfZiewTogqFHklB+BFJMk
	atwfmeY4Ze9KMS/Y3Fcgv7tmJY0PrJk30pkVvxR9nQMZhmtK8ufPxk0WIK6kQo0U
	zdQRNLvcd4vbG+PKDSUwyqaUHwmMMwk1maYIEhh3sv5no8DZYsbxh3/uZr0UYc4e
	gzB3cHu29AxzMT+b5clTaJ4jwTrZUhpIryaVYZN+Va6OyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcgkm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:34:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751c50552dso103526137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781210077; x=1781814877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRM+mxmakpC7NoTjq1FhUVVticKlB4ODWObaEuOgJvY=;
        b=Aypbt/aveLSJzXoz39pq/qs0dYwJfu8XC8pe0M8i8tWVG6QyuaLIDr2fQYQp3Y6MxE
         G2R6FYUgAeQak9wfiffIk5bivynocPqEJmxsNY6muEnEruZQWRjKfmD5ElTbZDuiiPnY
         h6Jk2C9cdmEhUVkheXqSqg+rGsEBIlrHzJUB4I1fxOw+qSeERwB3l55veliYEL9slwpX
         HXaYFOHlwD1SrE7ZZb8j8b2dHFQefRvTaNWUHdPYPPiyNLnBqQkeEaiuQ54F82gGx3n5
         7T8lEVgbO4fQFNlEZqKPfGDcR1bK1y1Rgyu20r5ptHwspS7QgXJvXTvGaJlIqB+Sr5vr
         apag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210077; x=1781814877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRM+mxmakpC7NoTjq1FhUVVticKlB4ODWObaEuOgJvY=;
        b=bftsUlShK19XLNw5tkUsDwr1SvLPrsiWPEdeMAdLrEmWTjlBV9F08GjLP1mCIuthnq
         6was9iozXleNMFTuNm9D1R43piJr21IKzbAdq6anRbGYitZg2XvI1nfbZ3KRa4p9u5my
         lgAvNAx1YqviIExN9oiblARxXLaPhLwrxMYQbgUvjS0Jogt2gqkY1+BtVqnzk+vA+8oW
         7OLfPqL1I2hHKE8su2i02cp+s/FtTAnqq8tnj/Qc1EzCFJwXQ7bcwTVuir73JQmQ/dU2
         LGjFpYGZuwBXrFyP/VIDv821IP8AmfDqYWZrjyIANTRXp6gxFY/K/dRrJdNfC4vh8B1j
         GDcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QFUZ4+UriJ61G7+mYuDECfxKsJOYKLtxtDhLZRbx2H4jZuyH6gT1i1cpShQKYa/G1bNpg7sllV2fsYZUj@vger.kernel.org
X-Gm-Message-State: AOJu0YxbBQBHDwmKRMaRKQQNVL5YFZZ7QBVAtGTpM+JSNqKwHkAV1kI8
	7XsrqxL9fzZglKZznHfwTzF4jZE0MqRbonzQ5iAqhOiZZdHbPDKb4NgP28rzy4NjGETAgZx49ji
	gNwDEh3q7QU/wznf/EkavPhtriNdcVwcllvpzAuQmFFrd72qnLRErlIcdgaGTBbHyE8b2
X-Gm-Gg: Acq92OH1bE9WpvV6TZrCCzIOHraPNaRpA8X8zwZLCGQRmPUqlwO6tDwYrchDh4pTABG
	3Ebo5htdHwISOzCrFAqvx1cLgZv+zTr+sngC9RiE972gQO2hxVUV2ihw12KbrS3Xghf1o+aFz4D
	p46/l9HoYOX84qR6bKY4VHkQePIHVGAN8ut0AEEMR6uLZYxnV+Qqj4b4YiYmcjG3cRc+twUchNy
	ZeEh1dpoxDbLf/X/yZn1sZHbLDxtMSRoOjswePvfEYDCAaDXuPmdkGG/ox71xEz3LO37PhoHoUP
	as7Ql0mprL9YDDXSPTgiDqJEINxLroDlph9gCRjwWAr+4kiApN1MNLAux8c6Mk/1Mgpz5N+NBac
	BW3MGQxFnVXExipJyeyRiKQg1AsiA0Fd0mG4P8N+419LTVwc8MSSV0bA4HGmniCmCIQfOflH3HA
	rFYy019sJ0uAe5ID4OInG1q9QL1HnSi6cuv20=
X-Received: by 2002:a05:6102:5e93:b0:607:4fde:1921 with SMTP id ada2fe7eead31-71d5f4c9e9cmr3251261137.24.1781210077294;
        Thu, 11 Jun 2026 13:34:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5e93:b0:607:4fde:1921 with SMTP id ada2fe7eead31-71d5f4c9e9cmr3251239137.24.1781210076870;
        Thu, 11 Jun 2026 13:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd8d6c3sm124092e87.59.2026.06.11.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:34:33 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Message-ID: <l2f6cuhsq6y2grrufyaki5iijk3lpbjlig4sdispo4yxsmckcv@iyb5jwdfph5w>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
 <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
 <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfX5ihdDhqACX8b
 vL+DVENS8mcTptiGt5ZvFRjwCJjqlH6NkgSDUYRrJpBpOS9shQbx86OYgLGepVEbP7hHZMQzrb5
 kbCmAA1rPrvNV7J3nwnbb0w/wix2kIhVB7F8L+3vb1MTiMdJeo/pO1cXZ3BamSLVmqJE9kMG0BZ
 ilP85ntQWAmf+w5oIB1b9rmrQTF7bfit7MZjvCGms/sN+w9pZoz7GAeRiB7Mpn0yFssnW1nDnhs
 VdSVWb3gYR8VZ0m1Acg7FnUBjES6cjrhuNdMODSUpcHUfIpQGp6iS4rZDGLWGyUhAIphwLrfRSw
 qN0IOjqY3hg0MJVxpnh7p+kNT44vxRstJqOHWsMU4xrSFabFB8hiE8RwgJ0IQ44+tw2XWF5TVFF
 mY27futWdaJYAU+ZWt1AKlXVdx6RGM5FxrD1yOSKAt6VHA6JbKKMHkLj2XQyct15CRMhkibOzXu
 UIAh0j5NNzDe0F+cHPg==
X-Proofpoint-GUID: HIMeLnqc2aE-gBrxhOmegx1DmU0-VXSF
X-Proofpoint-ORIG-GUID: HIMeLnqc2aE-gBrxhOmegx1DmU0-VXSF
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b1bdd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wIx81Qcb-Uf8PA-ulogA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfX6ck9YJaiJiqd
 i3PQvsG2fHUQDSeXCKjzXcSedsH7q3TJ+87PDJ4FEKqL+MMPCThmnQHjqcuBv/8KlD9+uJUpsz3
 l6d8c+ZoKaFbTLR5nkbNNm7HKpsRct0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112817-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B079867530F

On Thu, Jun 11, 2026 at 10:15:30AM +0530, Gaurav Kohli wrote:
> 
> 
> On 6/9/2026 5:33 PM, Konrad Dybcio wrote:
> > On 6/9/26 12:22 PM, Gaurav Kohli wrote:
> > > Add support for Thermal Mitigation Devices (TMDs) to enable
> > > thermal throttling of remote processors through QMI.
> > > 
> > > This enables the thermal framework to request mitigation when remote
> > > subsystems (modem, CDSP) contribute to thermal issues.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > There's no other signs of Daniel in this patch, please fix the
> > tags chain
> > 
> > [...]
> > 
> 
> > > +		return 0;
> > > +
> > > +	/* Get the TMD names array */
> > > +	num_tmds = of_property_count_strings(np, "tmd-names");
> > 
> > Is this something we can stuff into platform_data for a given rproc on a
> > given SoC (for which we already store *some* data in the PAS driver)?
> > 
> 
> Without tmd-names in DT, it is unclear which index corresponds to which
> binding. With #cooling-cells, tmd-names in DT provides an explicit
> name-to-index mapping. Please suggest.

Could you please explain, what are those thermal mitigations responsible
for? The series applies the same limitations to both mechanisms used on
kodiak for the modem. Is it always the case? If so, do we need to
handled them separately at all? Can't we apply the same limits to all
TMD resources provided by the DSP?

-- 
With best wishes
Dmitry

