Return-Path: <linux-arm-msm+bounces-112486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l6BTKxxrKWouWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:48:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9C669EC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=neXsZo1K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vz6RWsPJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B333C307BA15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B2B40B39D;
	Wed, 10 Jun 2026 13:42:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE23E4503
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098972; cv=none; b=H5Z0Ngfv7HfzH727xr2zY71PnOH/z35UBmYJVQ802ricXKY9ZGxudoI/bw3grnXjeVFWu+KWhQbSAnBlU178VlsoeoyzPlfByEhyEnfotiqqBW0EiaLQmwJ8bqvMm2GQlbI8dhJNZ1y5GPBtJyBze/zCEO088jNfeWgBIoiPURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098972; c=relaxed/simple;
	bh=c8ISxDyfYFd1w5V9y3jPjVnvxApMDRuA644CwzX2/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csjOWQTN8sOnlIi5P3QSeHQMgG0FAOqF1hwABQTwTJ1/QIAlxPCGJsBG+ZGSjvStuK63wuigI3ZZv4W8etHu6ET1j8YsSFYJMUx7TFiYuOPUirqnYDsBGjcWBDlL0DGArfq5leUhBPQfyHWROcUipSmZF+VNTxzdwih2afSaHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neXsZo1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz6RWsPJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCBqx1472544
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cw9iU6/+9ipC9Le/D44AKlV
	MjTt/IKZwjG7uxs0FvI=; b=neXsZo1KP+a3Nf60THwlHRvRrbZn9IdlC3Paea4a
	rNUmOqZfbIvw2LpxG1ZtxowvldG8W7CT604ERYio5xihbms2JQdhPnlXsf4TO3t2
	BcMsSkpw8I+XWSsantCnM6faVrni/hN+Qc/kMLQtssJNlYKt8I3IpfwhYa9j2Xb3
	D+ONTdJVoP3UASbQDwv7NkUX+UMVWGhyFdjxMyf5BzGoyU1h3GGIkoApd85ytgCy
	DF5AlY0XqP9Sy33d/IgoA6hfwMpIf1w5sYhcbNiIN4rrs3jH1jN8GatOcXnKbWe4
	oqryT/RQ+HtH6+wFuHbtA401Q5HzT8R3VsXUqkPdG7Isog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda38q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:42:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so7475704137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098969; x=1781703769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=Vz6RWsPJ3jCuDHOA44NGyfyEinXqaBD4CGv2qx7XU2ioImvCgAib2V0ZlswPHBX7t0
         kFPHLEZ4LlZoFhhYk3eCzgVfB9zebVGQLs43n9+dzYzGlZS4pwIv7ccvcENIhvK06Wve
         Wtox3HymcVr/iN1ad7Nxvi0e4FqVO+kZnoMXU3RyEEw98bqhEnBlzhRHOlO8B7cNmzHc
         TBCfqEVhsygMeF/4+f4CiMtcdHz9zQiGysqFWOLhMDYVk5x4kRLbPZlVSIwMBazMk+dz
         ou3rUODc1q6SRgjRkjhs9PkzxTX8DtWFkTMZZ+tzwBkepISUEnM/451DrpzFHO0YkwYf
         iBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098969; x=1781703769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=oR4Ok7xzEYwypIouA12aSnhjNiDsxvGU0lr/enWjrNDdzCK+UiJHHkxb20QjGomVQT
         C9xkbtuNBLlGZ4EYzmV5/QKkqx2MQ6HIlBpXFaP1tAWAgOIAI+i8NR72IwnF6i528ch8
         ToxyCX7z1rU+TjDr4gk/dlUpiQ/mIxqBPouPCvwReWlTSuF9ZvClb5YVXWHBnWOWcWFM
         wimUyxyKQbS3iko6xgWTXmNr1kQZ5tDKOyjEoGYAGVLlTwtym6xDEqLhJiDPngr5LCBv
         v0R4SspLwKrSB7fGUzIpFNWQFDE9GOAKkcuEnyaktWSnQVojs69LkfwtFgN/W2BiGe20
         5Q+A==
X-Forwarded-Encrypted: i=1; AFNElJ97+7mWtsM5FLo3O/jMuZOpUHb17LMjN4bP8UTzW+rbtznuQ9zKamZlL+SEnFc++BrvCijLopOWn5DzcDXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zI/s++9ZZR21tORvWMxtrROYPoP5zeObFWvi9O+DeSC6KZ/S
	qLLHVOlpI/3DIxQ8XtDpkGimhmdZauhX733l7OycpNjgMyBOAaOYWGqVRFWi1DhCtHrexSdyD51
	T+rf+1z2PFnS6P5FZYXKbW07iJKYuP2swo/msO6iXGyWPxzxFPoEctdKTfuDPLYSFZ+z0
X-Gm-Gg: Acq92OEtXwzajbsdXPUdKOa1/JYcROaPjjv0GE+6z155yTXrhEkuOTBBGFfwU3f02ZV
	LeNM8wRS6VsnMvtbJawLv4VKB5O5z3mb4QB6CIj/wt23XX/rZj5HsT29qRtnhaZx+45JvLJ0YTc
	pIhGwG5XchrFbcpbtDkUuA4iKpyK+2+hkQMAcf+Ka1jfQZhet64DpMjfBJzm2bhZ3m0S7IJK8pz
	vnmcmb5wHV0fIzb7swY14RzypIQWx0nGn0MkEgiM2KS/ikmwjyYl9xRYmu2c7O62o/urWCFiYMc
	q3XAc+zgkamQkFxM9A6xH4Rqe1O3ZvdNB8R95GEFoGykpGBlpWTaA0f++mNczclwWGeFpOQXen/
	HvVn9g2Je/kD375yXuCqUZ139BK8Fm92BdaaJEaoZPA0zQryxC5Xv7va/hn5JEhDINNwwdog8gl
	DGPq2Bd0H12Mc+SoG1YbR6I/GjM05CKYxZz4q0TlKqS4fOMQ==
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992236137.21.1781098969415;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992212137.21.1781098969034;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf4fsm5429249e87.16.2026.06.10.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:42:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:42:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Message-ID: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2969da cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OdyHppD39TW5BxundB8A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6Tg38e6db6uN_lcR2HVPd0Fw1LnnUqVW
X-Proofpoint-ORIG-GUID: 6Tg38e6db6uN_lcR2HVPd0Fw1LnnUqVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX9wUBJjW/cDQc
 0ZQ8pjMFpmcb4MvmNNDuQwNiArOJymTxO3sxkRqsG7TDFjpf9TWUxbzCsqySHrU6IuKdQHQ07NN
 xQkPsbIG+/qbdf+667ii2SPL3ORi+3nK7Hn2NssCUvu901Jmler+d09MTHJBMGpE64WAQE9WDub
 TzvVzTo6kJqgfNC/iz5MUKsr2pmGAme9FLhPc9nlbjpdg2sMKjWNdpXba/yEEGIKSrYXapqI8+J
 cUw9a1R9S4U1OrPz4q6NeoJTOdDYkivxeZZeJTtMtRL16zoYQEopgKWgCvXPnBdwOJWBr0bVKRf
 Hk4g7fEI+RMCkuPUViIkxCwNU+4Q+zU8pG+LREdMh6niJ3/eQ3ulZlu4+SoL8guUMaqQkipek00
 VE8Qk4dWYvHJef3nlAUapNeocaTm8neouH1k7n+2F2iZB+qClSaUojzvKensORfgv9SIntyT21T
 q+vPYJYzUCCiwXzMoUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112486-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05B9C669EC1

On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
> On 6/9/26 13:30, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
> > > From: Casey Connolly <casey.connolly@linaro.org>
> > > 
> > > Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
> > > cooling devices backed by remote subsystems.
> > > 
> > > On several Qualcomm platforms, remote processors (for example modem and
> > > CDSP) expose thermal mitigation controls through the TMD QMI service.
> > > Client drivers need a way to discover that service, map DT thermal
> > > mitigation endpoints to cooling devices, and forward cooling state
> > > updates to the remote subsystem.
> > > 
> > > Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > Wrong SoB chain.
> 
> I think Gaurav wanted to reflect the changes did a back and forth between
> us, so I ended up in the delivery path somehow. I guess adding
> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
> actually most of the work. So I'm fine if we remove my SoB to fix the chain

Anyway, Gaurav's SoB should be the last one (and it should be preceeded
by the CdB tag)

-- 
With best wishes
Dmitry

