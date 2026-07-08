Return-Path: <linux-arm-msm+bounces-117504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 42F+EFbqTWoqAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D433372215E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y2yj37QQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fSv7Q1Kk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117504-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117504-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA231302EAB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748AC3AE19B;
	Wed,  8 Jul 2026 06:11:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5B385D8E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:11:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491115; cv=none; b=LCDH0S3xC56dLW1gWN5C9aAlAcINP+xm63tiQ6c/dYnDHzaWkFRT/6jzoA3frIZplJyajcE1hx/qwiNdHMBmrQVploLocEIrlrcCtposlpgm8vAMqygBcmEDnC0VEKq5rNjGcAR3ZItAQeu6Fz1kP3OOkEPstKjuZm6x2R/eQEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491115; c=relaxed/simple;
	bh=FsHukMIHzY0r07EgEbsJqxFtuDQHYMeW+AhiTLdTYzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dobkvLw6HOlBC7fyS9pgJjWaHfZ8wNm8dfp9r4W+SM1khXvvIuSTTKNOJYhAK55EeCHFDIFigDq6L+Hhoe2ZGWhgTctIPvgueQWcmOWaO3wDgoJ8o96rUm+Ivuf7+dNKBL3i7piwX+4isaStOvicYeqQm1dMY6ihYPIOhc4BO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2yj37QQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSv7Q1Kk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842l4i1645124
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YbwKyhVXL6M2THrTeKIDkFqZ
	YrCtq+4cO/T9fIPwkoo=; b=Y2yj37QQkjM55p4WSB24ihPMkax0LB9KjpY7oQNY
	6LTxCyIp7iiSe4VO2z9XjzVpLKSxUWHUrpRPlqu3dfJoNzZiHrLiq1+Im0e6reci
	a+HkJaFAfwDlHLiP8BJciUDfkdbPvcmjxcAU2lrkm/Is87xmmZJkV1W7Hp7/K3XW
	yfCiTy0M1TarxkxBFKzxZLExDYeRYlRNhNnao5FtAsQ5MH5PHXQwz0RURPDFth6+
	DLob+KIaldeJIAaA6bCZLZj0WXNXSh58ai3jWGitcKFnwZiTXfTbVNIHArDf2U6/
	dgG6CUO8How1qnvHaq/0A2eAmsiRp64L8aHGPfsW4NxQlw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0meyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:11:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737bcdb48d2so109382137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491112; x=1784095912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbwKyhVXL6M2THrTeKIDkFqZYrCtq+4cO/T9fIPwkoo=;
        b=fSv7Q1KkiW6KNm00jO97ucKq4+ZygqwkWZ+bhiAJFDSHxtONdJMJSg06/oC5l2IiTo
         o4hB7IovBa+3rl/rCpKSpcsan4UmvL2BklvzFNW6NRg/RARO1mwSGw+NqKZalHSng3P0
         YpR7D3anmK6BqNMFS3bQ72wROX+9lVxlPPR6IgTVEIuPSg+X41gQsb5NSsrnHXNKy7WR
         6L14k2pVr4JfpyWdtYTd2sQmWjPBu3K53Z3slvfDvgWpr6wavsLg+xA1HAKpY28Puxsi
         sYIhz7lcsYH4nJ9/tKrTPcRevPrPM12LYCPqHo2JeKToUmNcA2h4Pb5h2j6lUw0zGcrk
         6TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491112; x=1784095912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbwKyhVXL6M2THrTeKIDkFqZYrCtq+4cO/T9fIPwkoo=;
        b=FzrL0atce5k8ovA/MxVdRaC6sosHOA6btq1OszLMY7vmbDMgeV37jbB0HHSh517S3W
         6Bds7TmMEcmaHW4Ahbi8dY/Uhb0qx/7K3dnu3eLgfVrFrxuB3swekt5PJmoLID82O/7j
         Q17uRGeO0x8LEBeRU43IwFG0iEIxWni95EM8q68dEzkIUJbPL13VHF7H+QDzAHsiI5hR
         Q65qJKgpRzJjQTFz5NgyBpz6YyfgwG7wxsD+gdRtGtcuJqeMKsCKlnmUqcxZhAFsvri9
         6kafpMc8TnnZ3+6uW/IKm/x+A1KepzCmyZhr19WcZdvZ8yP9gCIgbzJjqMVZjlioH+Ta
         Chmw==
X-Forwarded-Encrypted: i=1; AHgh+RrnXlwDwwfjEMpsERBba3IDQm8SL1ag7lFTmuUbDdEDA2kzo6G73xSiBogDBZBFufvy6wqP9ImM4X+7Vfik@vger.kernel.org
X-Gm-Message-State: AOJu0YyNv9cZO0mVutrgT/3CVyz+x59bCpiTLnhk6fqeAGOoe6lWC7jm
	XpAolXWOY9fEf1/OT24U4IVC1A3Vhmi/Czgpg7z9EpiyG9YwrH67oKqfHlDRz6R+0W1Qy+mW9PB
	PRSX1YeJtFWFN8nHshVkOoA3iQfd9NOXiV5Sswt6rlC0RDHsnZu0ay5dcW4+Uk+DBDNUZ
X-Gm-Gg: AfdE7cnVkDabHlXLR0E5OUjr5+7GD8MYHduEhLazejCAUo0nzgaF+wTpv1hpGRzkkb/
	rAUAnRGhMucPIuYGW5NSV/6W+58W1eiA7uGyy9/uc1ZKpFNhOfUxqa12ZMktVO5BnHb1dWxuKQ7
	KgJdA/iHLseBs9KS/1NGqaaw9ukgSQJNOkPjyGtDPFcVHFp5cIRKLkAmzSBgKPhsL7+Ursf7hxt
	2aIIILRoPeuJv3aBQzt08xRJ8ha9f8kaQp0sFIFkB/v5h77ATdTn3FijDtvuM3CDYysEBefzJlt
	TAXOrffbAcMvMi9RVcQ1DMwnSStEo7l+l4qdWDZ+GjDs0hmQ4UPRWfMi8Eto6TrOgIpaBS9SxBw
	RqeXg2uA4ed4Pu6sFXH7AMYorleae5C3mlb+0Zwp02LyRqF4hbApNwLkgdhYKIe2aN1SVcDRyEU
	V7JytrW7yKmtLS074RqGLOr8+e
X-Received: by 2002:a05:6102:5e96:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-744e0311b62mr418974137.29.1783491112088;
        Tue, 07 Jul 2026 23:11:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5e96:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-744e0311b62mr418945137.29.1783491111461;
        Tue, 07 Jul 2026 23:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c0117sm4285796e87.62.2026.07.07.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:11:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] misc: fastrpc: create duplicate sessions after
 all CB probing
Message-ID: <rj6a3dko5h3p66yxn22g4wymfkqqpdrs5leuxyeihehdzxzsga@rpc7n6tjhklq>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
 <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gNohlDiHlCMoax6G7SyNJhJVHhwVkbrF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX8V/5JhyRjM0M
 FzIIFhI7NIsfS9xshODrVJ1PWy48w2ktfIhgerpErCyxm0rZzIdEhlo4JLhkemYlopuacWplSAC
 btK7cqidcruVcHZUpvUYA5dc5f9uQt0=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4dea29 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zWMBRB9ZqIQM0yNuxxsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: gNohlDiHlCMoax6G7SyNJhJVHhwVkbrF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX3/GkFVa3gdAM
 0TpQChsLcHXL6rpMmLyoET/6BvslYvmM38CCq2i0JfDp2R3v6OO9QCdEeu7pk678zamxQ85aN0y
 NqzTZZ/aY7cuSjknKgsgU/JN0i0XfBJPPNub2EOHaM90oMSR/ZrutmdUuNmJoyRn9hyTBtySXKq
 p6PAaslx/s++IEvdGFqk1Ayr2IJ4tyXjFungVf6MVlWJ+Q36JAXnaT7W2vOVjkgIJ9hFFnQzIQn
 t5m06Z1e+baPmlbbxLZpDF778YNiV68x1COaU38+FiSckGXO5kmk+fJjBst6jvKrYz0QmhseBAr
 Y+Fwb56KeLr2eRSuCTgoXreA7gMv4ySrZ1HQ2kGmF16m6x8gMFkp5aic+N/sn8PCDk5IWpXg7P7
 ve7HMqxkcOL2vEAbsSKnXz8S/UP/gKUh+R6Sh+uIiQnnYGO7nP3lqe5v+ytQPg9ggLcP9hiLN8R
 H+30xFrrn3Oi90jFcZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117504-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vinayak.katoch@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,rpc7n6tjhklq:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D433372215E

On Wed, Jul 08, 2026 at 09:28:33AM +0530, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To address this limitation, a Device Tree change was used till now:
>   qcom,nsessions = <5>;
> 
> However, feedback from the upstream community indicated that this change
> should not be made in the Device Tree. Instead, it was recommended to
> handle this as a driver-level change.
> 
> Instead of duplicating sessions inline during fastrpc_cb_probe() using
> the qcom,nsessions DT property, defer duplication until after
> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
> all compute-CB child nodes have been probed and the session array is
> fully populated.
> 
> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
> last probed session once of_platform_populate() succeeds. This keeps
> the per-CB probe path simple and ensures duplicates are always derived
> from a stable, fully-initialised session state.
> 
> The qcom,nsessions DT property is no longer consumed by the driver; the
> binding and DT sources are left unchanged.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..8a3944f6c036 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -30,6 +30,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
>  	u32 dma_bits;
> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> -
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		dev_err(&pdev->dev, "too many sessions\n");
> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2445,6 +2433,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {

There is no guarantee that child probes have finished at this point. If
you want to make it work this way, you need to replace
of_platform_populate() with the manual iteration over the child nodes,
creating CB device for each node (also getting rid of
fastrpc_cb_driver).

> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];
> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

